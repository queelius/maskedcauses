#!/usr/bin/env Rscript
# Generate precomputed data for the model_selection vignette.
# Run from the maskedcauses package root:
#   Rscript vignettes/generate_model_selection_data.R

library(maskedcauses)
library(parallel)

m <- 5
base_k <- 1.5
base_scales <- c(300, 400, 500, 600, 700)
cv_levels <- c(0, 0.05, 0.10, 0.20, 0.30, 0.50)
n_reps <- 200
n_obs <- 500
p_mask <- 0.2
alpha <- 0.05
ncores <- min(detectCores() - 1, 10)

# Fixed offsets: mean 0, sd 1
offsets <- c(-2, -1, 0, 1, 2)
offsets <- offsets / sd(offsets)

# Right-censoring time (based on homogeneous baseline at CV = 0)
beta_sys <- wei_series_system_scale(base_k, base_scales)
tau <- qweibull(0.8, shape = base_k, scale = beta_sys)

cat("System scale:", round(beta_sys, 1), "\n")
cat("Right-censoring time:", round(tau, 1), "\n")
cat("Using", ncores, "cores\n")

# Loglik closures (avoid creating fit objects in workers)
ll_exp <- loglik(exp_series_md_c1_c2_c3())
ll_hom <- loglik(wei_series_homogeneous_md_c1_c2_c3())
ll_het <- loglik(wei_series_md_c1_c2_c3())
gen_het <- rdata(wei_series_md_c1_c2_c3())

np_exp <- m
np_hom <- m + 1
np_het <- 2 * m

# Fast MLE: direct optim without Hessian/vcov
fast_mle <- function(ll_fn, df, par, method = "Nelder-Mead", maxit = 500) {
  res <- optim(par, function(p) ll_fn(df, p),
               method = method,
               control = list(fnscale = -1, maxit = maxit))
  list(par = res$par, loglik = res$value, converged = (res$convergence == 0))
}

# Worker function for a single (cv, rep) combination
run_one <- function(args) {
  cv <- args$cv
  r <- args$r
  seed <- args$seed

  shapes <- base_k * (1 + cv * offsets)
  theta <- as.numeric(rbind(shapes, base_scales))

  set.seed(seed)
  df_r <- gen_het(theta, n = n_obs, p = p_mask,
                  observe = observe_right_censor(tau = tau))

  row <- list(cv = cv, rep = r,
              reject_het_vs_hom = NA, reject_hom_vs_exp = NA,
              ll_exp = NA, ll_hom = NA, ll_het = NA,
              aic_exp = NA, aic_hom = NA, aic_het = NA,
              bic_exp = NA, bic_hom = NA, bic_het = NA,
              converged_all = FALSE)

  tryCatch({
    fe <- fast_mle(ll_exp, df_r, par = rep(0.002, m), maxit = 2000)
    fh <- fast_mle(ll_hom, df_r, par = c(1, rep(500, m)), maxit = 5000)

    # Warm-start het from hom estimate
    het_start <- as.numeric(rbind(rep(fh$par[1], m), fh$par[-1]))
    fw <- fast_mle(ll_het, df_r, par = het_start, maxit = 10000)

    if (fe$converged && fh$converged && fw$converged) {
      row$ll_exp <- fe$loglik
      row$ll_hom <- fh$loglik
      row$ll_het <- fw$loglik

      row$aic_exp <- -2 * fe$loglik + 2 * np_exp
      row$aic_hom <- -2 * fh$loglik + 2 * np_hom
      row$aic_het <- -2 * fw$loglik + 2 * np_het

      row$bic_exp <- -2 * fe$loglik + log(n_obs) * np_exp
      row$bic_hom <- -2 * fh$loglik + log(n_obs) * np_hom
      row$bic_het <- -2 * fw$loglik + log(n_obs) * np_het

      LRT_het <- -2 * (fh$loglik - fw$loglik)
      LRT_hom <- -2 * (fe$loglik - fh$loglik)

      row$reject_het_vs_hom <- pchisq(LRT_het, df = m - 1,
                                        lower.tail = FALSE) < alpha
      row$reject_hom_vs_exp <- pchisq(LRT_hom, df = 1,
                                        lower.tail = FALSE) < alpha
      row$converged_all <- TRUE
    }
  }, error = function(e) NULL)

  as.data.frame(row)
}

# Build task list with unique seeds
set.seed(42)
tasks <- list()
idx <- 1
for (cv in cv_levels) {
  for (r in seq_len(n_reps)) {
    tasks[[idx]] <- list(cv = cv, r = r, seed = sample.int(1e8, 1))
    idx <- idx + 1
  }
}

cat(sprintf("Running %d tasks across %d cores...\n", length(tasks), ncores))
t_start <- proc.time()

results <- mclapply(tasks, run_one, mc.cores = ncores)

power_study <- do.call(rbind, results)

mc_data <- list(
  power_study = power_study,
  config = list(m = m, n = n_obs, p = p_mask, tau = tau,
                n_reps = n_reps, alpha = alpha,
                base_k = base_k, base_scales = base_scales,
                offsets = offsets)
)

saveRDS(mc_data, "vignettes/precomputed_model_selection.rds")

elapsed <- (proc.time() - t_start)["elapsed"]
cat(sprintf("\nDone in %.1f minutes\n", elapsed / 60))
cat(sprintf("Convergence rate: %.1f%%\n",
            100 * mean(power_study$converged_all)))

# Quick summary
conv <- power_study[power_study$converged_all, ]
for (cv in cv_levels) {
  d <- conv[conv$cv == cv, ]
  cat(sprintf("CV=%2.0f%%: n=%d, reject_het=%.3f, reject_exp=%.3f\n",
              cv * 100, nrow(d), mean(d$reject_het_vs_hom),
              mean(d$reject_hom_vs_exp)))
}
