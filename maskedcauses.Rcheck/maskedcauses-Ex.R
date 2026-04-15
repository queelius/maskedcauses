pkgname <- "maskedcauses"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "maskedcauses-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('maskedcauses')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("assumptions.exp_series_md_c1_c2_c3")
### * assumptions.exp_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: assumptions.exp_series_md_c1_c2_c3
### Title: Assumptions for 'exp_series_md_c1_c2_c3' model.
### Aliases: assumptions.exp_series_md_c1_c2_c3

### ** Examples

assumptions(exp_series_md_c1_c2_c3())



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("assumptions.exp_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("assumptions.wei_series_homogeneous_md_c1_c2_c3")
### * assumptions.wei_series_homogeneous_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: assumptions.wei_series_homogeneous_md_c1_c2_c3
### Title: Assumptions for 'wei_series_homogeneous_md_c1_c2_c3' model.
### Aliases: assumptions.wei_series_homogeneous_md_c1_c2_c3

### ** Examples

assumptions(wei_series_homogeneous_md_c1_c2_c3())



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("assumptions.wei_series_homogeneous_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("assumptions.wei_series_md_c1_c2_c3")
### * assumptions.wei_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: assumptions.wei_series_md_c1_c2_c3
### Title: Assumptions for 'wei_series_md_c1_c2_c3' model.
### Aliases: assumptions.wei_series_md_c1_c2_c3

### ** Examples

assumptions(wei_series_md_c1_c2_c3())



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("assumptions.wei_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("cause_probability")
### * cause_probability

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: cause_probability
### Title: Marginal cause-of-failure probability
### Aliases: cause_probability cause_probability.series_md

### ** Examples

model <- exp_series_md_c1_c2_c3()
cp <- cause_probability(model)
cp(par = c(0.5, 0.3, 0.2))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("cause_probability", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("component_hazard")
### * component_hazard

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: component_hazard
### Title: Component hazard function
### Aliases: component_hazard

### ** Examples

model <- exp_series_md_c1_c2_c3()
h1 <- component_hazard(model, j = 1)
h1(t = 1.0, par = c(0.5, 0.3, 0.2))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("component_hazard", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("conditional_cause_probability")
### * conditional_cause_probability

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: conditional_cause_probability
### Title: Conditional cause-of-failure probability
### Aliases: conditional_cause_probability
###   conditional_cause_probability.series_md

### ** Examples

model <- exp_series_md_c1_c2_c3()
ccp <- conditional_cause_probability(model)
ccp(t = c(1, 2), par = c(0.5, 0.3, 0.2))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("conditional_cause_probability", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("cum_haz")
### * cum_haz

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: cum_haz
### Title: Cumulative hazard function for a component hazard function
### Aliases: cum_haz

### ** Examples

# Exponential hazard h(t) = lambda
haz <- function(t, ...) rep(0.5, length(t))
H <- cum_haz(haz)
H(2)  # Should be 1.0 (0.5 * 2)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("cum_haz", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("dexp_series")
### * dexp_series

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: dexp_series
### Title: pdf for exponential series.
### Aliases: dexp_series

### ** Examples

rates <- c(0.5, 0.3, 0.2)
dexp_series(1.0, rates)
dexp_series(c(0.5, 1.0, 2.0), rates, log = TRUE)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("dexp_series", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("exp_series_md_c1_c2_c3")
### * exp_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: exp_series_md_c1_c2_c3
### Title: Constructs a likelihood model for 'exp_series_md_c1_c2_c3'.
### Aliases: exp_series_md_c1_c2_c3

### ** Examples

model <- exp_series_md_c1_c2_c3()
# Generate data and evaluate log-likelihood
set.seed(123)
gen <- rdata(model)
df <- gen(theta = c(0.5, 0.3, 0.2), n = 50, tau = 10, p = 0.3)
ll <- loglik(model)
ll(df, par = c(0.5, 0.3, 0.2))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("exp_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("hazard_exp_series")
### * hazard_exp_series

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: hazard_exp_series
### Title: Hazard function for exponential series.
### Aliases: hazard_exp_series

### ** Examples

rates <- c(0.5, 0.3, 0.2)
hazard_exp_series(1.0, rates)
hazard_exp_series(c(0.5, 1.0), rates, log.p = TRUE)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("hazard_exp_series", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("hess_loglik.exp_series_md_c1_c2_c3")
### * hess_loglik.exp_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: hess_loglik.exp_series_md_c1_c2_c3
### Title: Hessian of log-likelihood method for 'exp_series_md_c1_c2_c3'
###   model.
### Aliases: hess_loglik.exp_series_md_c1_c2_c3

### ** Examples

model <- exp_series_md_c1_c2_c3()
set.seed(1)
df <- rdata(model)(theta = c(0.5, 0.3, 0.2), n = 30, tau = 10, p = 0.3)
H <- hess_loglik(model)
H(df, par = c(0.5, 0.3, 0.2))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("hess_loglik.exp_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("hess_loglik.wei_series_homogeneous_md_c1_c2_c3")
### * hess_loglik.wei_series_homogeneous_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: hess_loglik.wei_series_homogeneous_md_c1_c2_c3
### Title: Hessian of log-likelihood method for
###   'wei_series_homogeneous_md_c1_c2_c3'.
### Aliases: hess_loglik.wei_series_homogeneous_md_c1_c2_c3

### ** Examples

## No test: 
model <- wei_series_homogeneous_md_c1_c2_c3()
set.seed(1)
theta <- c(1.2, 1000, 900, 850)
df <- rdata(model)(theta = theta, n = 30, tau = 500, p = 0.3)
H <- hess_loglik(model)
H(df, par = theta)
## End(No test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("hess_loglik.wei_series_homogeneous_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("hess_loglik.wei_series_md_c1_c2_c3")
### * hess_loglik.wei_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: hess_loglik.wei_series_md_c1_c2_c3
### Title: Hessian of log-likelihood method for 'wei_series_md_c1_c2_c3'
###   model.
### Aliases: hess_loglik.wei_series_md_c1_c2_c3

### ** Examples

## No test: 
model <- wei_series_md_c1_c2_c3()
set.seed(1)
theta <- c(1.2, 1000, 0.8, 900)
df <- rdata(model)(theta = theta, n = 30, tau = 500, p = 0.3)
H <- hess_loglik(model)
H(df, par = theta)
## End(No test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("hess_loglik.wei_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("loglik.exp_series_md_c1_c2_c3")
### * loglik.exp_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: loglik.exp_series_md_c1_c2_c3
### Title: Log-likelihood method for 'exp_series_md_c1_c2_c3' model.
### Aliases: loglik.exp_series_md_c1_c2_c3

### ** Examples

model <- exp_series_md_c1_c2_c3()
set.seed(1)
df <- rdata(model)(theta = c(0.5, 0.3, 0.2), n = 30, tau = 10, p = 0.3)
ll <- loglik(model)
ll(df, par = c(0.5, 0.3, 0.2))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("loglik.exp_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("loglik.wei_series_homogeneous_md_c1_c2_c3")
### * loglik.wei_series_homogeneous_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: loglik.wei_series_homogeneous_md_c1_c2_c3
### Title: Log-likelihood method for 'wei_series_homogeneous_md_c1_c2_c3'
###   model.
### Aliases: loglik.wei_series_homogeneous_md_c1_c2_c3

### ** Examples

## No test: 
model <- wei_series_homogeneous_md_c1_c2_c3()
set.seed(1)
# theta: (shape, scale1, scale2, scale3)
theta <- c(1.2, 1000, 900, 850)
df <- rdata(model)(theta = theta, n = 30, tau = 500, p = 0.3)
ll <- loglik(model)
ll(df, par = theta)
## End(No test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("loglik.wei_series_homogeneous_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("loglik.wei_series_md_c1_c2_c3")
### * loglik.wei_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: loglik.wei_series_md_c1_c2_c3
### Title: Log-likelihood method for 'wei_series_md_c1_c2_c3' model.
### Aliases: loglik.wei_series_md_c1_c2_c3

### ** Examples

## No test: 
model <- wei_series_md_c1_c2_c3()
set.seed(1)
theta <- c(1.2, 1000, 0.8, 900)
df <- rdata(model)(theta = theta, n = 30, tau = 500, p = 0.3)
ll <- loglik(model)
ll(df, par = theta)
## End(No test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("loglik.wei_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md_bernoulli_cand_c1_c2_c3")
### * md_bernoulli_cand_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md_bernoulli_cand_c1_c2_c3
### Title: Bernoulli candidate set model for systems with unobserved
###   components.
### Aliases: md_bernoulli_cand_c1_c2_c3

### ** Examples

# Generate component lifetimes and system data
mat <- matrix(rexp(9, rate = rep(c(0.5, 0.3, 0.2), each = 3)),
              nrow = 3, ncol = 3)
df <- md_encode_matrix(mat, "t")
df$t <- apply(mat, 1, min)
df$delta <- TRUE
md_bernoulli_cand_c1_c2_c3(df, p = 0.5)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md_bernoulli_cand_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md_boolean_matrix_to_charsets")
### * md_boolean_matrix_to_charsets

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md_boolean_matrix_to_charsets
### Title: Convert Boolean candidate set columns to character set notation
### Aliases: md_boolean_matrix_to_charsets

### ** Examples

df <- data.frame(x1 = c(TRUE, FALSE, TRUE),
                 x2 = c(TRUE, TRUE, FALSE),
                 x3 = c(FALSE, TRUE, TRUE))
md_boolean_matrix_to_charsets(df)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md_boolean_matrix_to_charsets", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md_cand_sampler")
### * md_cand_sampler

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md_cand_sampler
### Title: Sample candidate sets for systems with unobserved components.
### Aliases: md_cand_sampler

### ** Examples

# Generate component lifetimes
set.seed(42)
mat <- matrix(rexp(9, rate = rep(c(0.5, 0.3, 0.2), each = 3)),
              nrow = 3, ncol = 3)
df <- md_encode_matrix(mat, "t")
df$t <- apply(mat, 1, min)
df$delta <- TRUE
df <- md_bernoulli_cand_c1_c2_c3(df, p = 0.5)
md_cand_sampler(df)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md_cand_sampler", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md_encode_matrix")
### * md_encode_matrix

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md_encode_matrix
### Title: Encode a matrix as a data frame with prefixed column names
### Aliases: md_encode_matrix

### ** Examples

mat <- matrix(1:6, nrow = 2, ncol = 3)
md_encode_matrix(mat, "x")



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md_encode_matrix", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md_series_lifetime_right_censoring")
### * md_series_lifetime_right_censoring

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md_series_lifetime_right_censoring
### Title: Masked data generation for series system lifetime data
### Aliases: md_series_lifetime_right_censoring

### ** Examples

mat <- matrix(rexp(9, rate = 0.5), nrow = 3, ncol = 3)
df <- md_encode_matrix(mat, "t")
md_series_lifetime_right_censoring(df, tau = 5)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md_series_lifetime_right_censoring", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("mean.exp_series")
### * mean.exp_series

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: mean.exp_series
### Title: Mean function for exponential series.
### Aliases: mean.exp_series

### ** Examples

rates <- structure(c(0.5, 0.3, 0.2), class = "exp_series")
mean(rates)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("mean.exp_series", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ncomponents")
### * ncomponents

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ncomponents
### Title: Number of components in a series system model
### Aliases: ncomponents

### ** Examples

model <- exp_series_md_c1_c2_c3(rates = c(0.5, 0.3, 0.2))
ncomponents(model)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ncomponents", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("observe_left_censor")
### * observe_left_censor

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: observe_left_censor
### Title: Left-censoring observation scheme (single inspection)
### Aliases: observe_left_censor

### ** Examples

obs <- observe_left_censor(tau = 100)
obs(50)   # left-censored: list(t = 100, omega = "left", t_upper = NA)
obs(150)  # right-censored: list(t = 100, omega = "right", t_upper = NA)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("observe_left_censor", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("observe_mixture")
### * observe_mixture

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: observe_mixture
### Title: Mixture of observation schemes
### Aliases: observe_mixture

### ** Examples

obs <- observe_mixture(
  observe_right_censor(tau = 100),
  observe_left_censor(tau = 50),
  weights = c(0.7, 0.3)
)
set.seed(42)
obs(30)  # randomly selects one of the two schemes



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("observe_mixture", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("observe_periodic")
### * observe_periodic

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: observe_periodic
### Title: Periodic inspection observation scheme
### Aliases: observe_periodic

### ** Examples

obs <- observe_periodic(delta = 10, tau = 100)
obs(25)   # interval: list(t = 20, omega = "interval", t_upper = 30)
obs(150)  # right-censored: list(t = 100, omega = "right", t_upper = NA)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("observe_periodic", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("observe_right_censor")
### * observe_right_censor

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: observe_right_censor
### Title: Right-censoring observation scheme
### Aliases: observe_right_censor

### ** Examples

obs <- observe_right_censor(tau = 100)
obs(50)   # exact: list(t = 50, omega = "exact", t_upper = NA)
obs(150)  # right-censored: list(t = 100, omega = "right", t_upper = NA)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("observe_right_censor", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pexp_series")
### * pexp_series

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pexp_series
### Title: Cumulative distribution function for exponential series.
### Aliases: pexp_series

### ** Examples

rates <- c(0.5, 0.3, 0.2)
pexp_series(1.0, rates)
pexp_series(c(0.5, 1.0, 2.0), rates)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pexp_series", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("qcomp")
### * qcomp

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: qcomp
### Title: Quantile function for a component with custom survival function
### Aliases: qcomp

### ** Examples

# Exponential survival function
surv_exp <- function(t, theta) exp(-theta * t)

# Median lifetime (50th percentile) for rate = 2
qcomp(0.5, surv = surv_exp, theta = 2.0)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("qcomp", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("qexp_series")
### * qexp_series

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: qexp_series
### Title: Quantile function for exponential series.
### Aliases: qexp_series

### ** Examples

rates <- c(0.5, 0.3, 0.2)
qexp_series(0.5, rates)
qexp_series(c(0.25, 0.5, 0.75), rates)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("qexp_series", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("rcomp")
### * rcomp

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: rcomp
### Title: Random generation for a component with custom survival function
### Aliases: rcomp

### ** Examples

# Exponential survival function
surv_exp <- function(t, theta) exp(-theta * t)

# Generate 10 random samples with rate = 2
set.seed(123)
rcomp(10, surv = surv_exp, theta = 2.0)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("rcomp", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("rdata.exp_series_md_c1_c2_c3")
### * rdata.exp_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: rdata.exp_series_md_c1_c2_c3
### Title: Random data generation for 'exp_series_md_c1_c2_c3' model.
### Aliases: rdata.exp_series_md_c1_c2_c3

### ** Examples

model <- exp_series_md_c1_c2_c3()
gen <- rdata(model)
set.seed(42)
df <- gen(theta = c(0.5, 0.3, 0.2), n = 10, tau = 5, p = 0.5)
head(df)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("rdata.exp_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("rdata.wei_series_homogeneous_md_c1_c2_c3")
### * rdata.wei_series_homogeneous_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: rdata.wei_series_homogeneous_md_c1_c2_c3
### Title: Random data generation for 'wei_series_homogeneous_md_c1_c2_c3'
###   model.
### Aliases: rdata.wei_series_homogeneous_md_c1_c2_c3

### ** Examples

model <- wei_series_homogeneous_md_c1_c2_c3()
gen <- rdata(model)
set.seed(42)
df <- gen(theta = c(1.2, 1000, 900, 850), n = 10, tau = 500, p = 0.5)
head(df)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("rdata.wei_series_homogeneous_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("rdata.wei_series_md_c1_c2_c3")
### * rdata.wei_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: rdata.wei_series_md_c1_c2_c3
### Title: Random data generation for 'wei_series_md_c1_c2_c3' model.
### Aliases: rdata.wei_series_md_c1_c2_c3

### ** Examples

model <- wei_series_md_c1_c2_c3()
gen <- rdata(model)
set.seed(42)
# theta: (shape1, scale1, shape2, scale2)
df <- gen(theta = c(1.2, 1000, 0.8, 900), n = 10, tau = 500, p = 0.5)
head(df)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("rdata.wei_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("rexp_series")
### * rexp_series

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: rexp_series
### Title: Random number generation for exponential series.
### Aliases: rexp_series

### ** Examples

set.seed(123)
rexp_series(5, rates = c(0.5, 0.3, 0.2))
rexp_series(3, rates = c(0.5, 0.3, 0.2), keep_latent = TRUE)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("rexp_series", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("score.exp_series_md_c1_c2_c3")
### * score.exp_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: score.exp_series_md_c1_c2_c3
### Title: Score method for 'exp_series_md_c1_c2_c3' model.
### Aliases: score.exp_series_md_c1_c2_c3

### ** Examples

model <- exp_series_md_c1_c2_c3()
set.seed(1)
df <- rdata(model)(theta = c(0.5, 0.3, 0.2), n = 30, tau = 10, p = 0.3)
s <- score(model)
s(df, par = c(0.5, 0.3, 0.2))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("score.exp_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("score.wei_series_homogeneous_md_c1_c2_c3")
### * score.wei_series_homogeneous_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: score.wei_series_homogeneous_md_c1_c2_c3
### Title: Score method for 'wei_series_homogeneous_md_c1_c2_c3' model.
### Aliases: score.wei_series_homogeneous_md_c1_c2_c3

### ** Examples

## No test: 
model <- wei_series_homogeneous_md_c1_c2_c3()
set.seed(1)
theta <- c(1.2, 1000, 900, 850)
df <- rdata(model)(theta = theta, n = 30, tau = 500, p = 0.3)
s <- score(model)
s(df, par = theta)
## End(No test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("score.wei_series_homogeneous_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("score.wei_series_md_c1_c2_c3")
### * score.wei_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: score.wei_series_md_c1_c2_c3
### Title: Score method for 'wei_series_md_c1_c2_c3' model.
### Aliases: score.wei_series_md_c1_c2_c3

### ** Examples

## No test: 
model <- wei_series_md_c1_c2_c3()
set.seed(1)
theta <- c(1.2, 1000, 0.8, 900)
df <- rdata(model)(theta = theta, n = 30, tau = 500, p = 0.3)
s <- score(model)
s(df, par = theta)
## End(No test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("score.wei_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("surv.exp_series")
### * surv.exp_series

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: surv.exp_series
### Title: Survival function for exponential series.
### Aliases: surv.exp_series

### ** Examples

rates <- c(0.5, 0.3, 0.2)
surv.exp_series(1.0, rates)
surv.exp_series(c(0.5, 1.0, 2.0), rates)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("surv.exp_series", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("wei_series_homogeneous_md_c1_c2_c3")
### * wei_series_homogeneous_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: wei_series_homogeneous_md_c1_c2_c3
### Title: Constructs a likelihood model for
###   'wei_series_homogeneous_md_c1_c2_c3'.
### Aliases: wei_series_homogeneous_md_c1_c2_c3

### ** Examples

# Create model and fit to data using generic dispatch
model <- wei_series_homogeneous_md_c1_c2_c3()
# solver <- fit(model)
# theta: (shape, scale1, scale2, ...)
# mle <- solver(data, par = c(1.2, 1000, 900, 850))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("wei_series_homogeneous_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("wei_series_md_c1_c2_c3")
### * wei_series_md_c1_c2_c3

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: wei_series_md_c1_c2_c3
### Title: Constructs a likelihood model for 'wei_series_md_c1_c2_c3'.
### Aliases: wei_series_md_c1_c2_c3

### ** Examples

# Create model and fit to data using generic dispatch
model <- wei_series_md_c1_c2_c3()
# solver <- fit(model)
# theta: (shape1, scale1, shape2, scale2, ...)
# mle <- solver(data, par = c(1, 1000, 1, 1000, 1, 1000))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("wei_series_md_c1_c2_c3", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("wei_series_system_scale")
### * wei_series_system_scale

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: wei_series_system_scale
### Title: System scale parameter for homogeneous Weibull series
### Aliases: wei_series_system_scale

### ** Examples

# 3-component system with common shape 1.2
wei_series_system_scale(k = 1.2, scales = c(1000, 900, 850))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("wei_series_system_scale", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
