# Extracted from test-exp_series_md_c1_c2_c3.R:698

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "maskedcauses", path = "..")
attach(test_env, warn.conflicts = FALSE)

# prequel ----------------------------------------------------------------------
create_exp_test_data <- function(n = 100, rates = c(0.5, 0.3, 0.2), seed = 42) {
  set.seed(seed)
  m <- length(rates)

  # Generate component lifetimes
  comp_lifetimes <- matrix(NA, nrow = n, ncol = m)
  for (j in seq_len(m)) {
    comp_lifetimes[, j] <- rexp(n, rates[j])
  }

  # System lifetime is minimum of component lifetimes
  t <- apply(comp_lifetimes, 1, min)

  # Failed component is the one with minimum lifetime
  failed_comp <- apply(comp_lifetimes, 1, which.min)

  # Create candidate sets - for simplicity, include the failed component
  # plus some random other components
  cand_matrix <- matrix(FALSE, nrow = n, ncol = m)
  for (i in seq_len(n)) {
    cand_matrix[i, failed_comp[i]] <- TRUE
    # Randomly include other components with probability 0.3
    for (j in seq_len(m)) {
      if (j != failed_comp[i] && runif(1) < 0.3) {
        cand_matrix[i, j] <- TRUE
      }
    }
  }

  # Build data frame
  df <- data.frame(t = t, omega = "exact", stringsAsFactors = FALSE)
  for (j in seq_len(m)) {
    df[[paste0("x", j)]] <- cand_matrix[, j]
  }

  df
}
create_exp_censored_data <- function(n = 100, rates = c(0.5, 0.3, 0.2),
                                      tau = 2, seed = 42) {
  df <- create_exp_test_data(n, rates, seed)

  # Apply right censoring
  censored <- df$t > tau
  df$t[censored] <- tau
  df$omega[censored] <- "right"

  # For censored observations, empty candidate set
  m <- length(rates)
  for (j in seq_len(m)) {
    df[[paste0("x", j)]][censored] <- FALSE
  }

  df
}

# test -------------------------------------------------------------------------
model <- exp_series_md_c1_c2_c3()
fim_fn <- fim(model)
set.seed(42)
I <- fim_fn(theta = c(0.5, 0.3, 0.2), n_obs = 50, n_samples = 50,
              tau = 5, p = 0.3)
