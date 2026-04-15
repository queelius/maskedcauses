# ==========================================================================
# Interop with dist.structure
#
# maskedcauses soft-deprecates its exponential-series convenience API in
# favour of dist.structure::exp_series(). These tests verify:
#
#   1. The legacy functional API (d/p/q/r/surv/hazard/mean _exp_series)
#      delegates correctly to dist.structure and produces the same
#      numerical output as the dist.structure canonical constructor.
#
#   2. The `mean.exp_series` method is polymorphic: it handles both
#      the legacy maskedcauses object shape (numeric vector with class
#      attribute) and the current dist.structure shape (list with
#      $total_rate).
#
#   3. dist.structure DGP objects can be constructed from maskedcauses
#      model coefficients (the "Stage 3" post-fit analysis pattern).
# ==========================================================================


test_that("dexp_series delegates to dist.structure total_rate", {
  rates <- c(0.5, 0.3, 0.2)
  # Canonical: algebraic.dist density on the dist.structure object.
  sys <- dist.structure::exp_series(rates)
  for (ti in c(0.1, 0.5, 1, 2)) {
    expect_equal(
      dexp_series(ti, rates),
      stats::dexp(ti, rate = sys$total_rate),
      tolerance = 1e-12
    )
  }
})


test_that("pexp_series delegates to dist.structure total_rate", {
  rates <- c(0.5, 0.3, 0.2)
  sys <- dist.structure::exp_series(rates)
  for (ti in c(0.1, 0.5, 1, 2)) {
    expect_equal(
      pexp_series(ti, rates),
      stats::pexp(ti, rate = sys$total_rate),
      tolerance = 1e-12
    )
  }
})


test_that("qexp_series delegates to dist.structure total_rate", {
  rates <- c(0.5, 0.3, 0.2)
  sys <- dist.structure::exp_series(rates)
  for (p in c(0.1, 0.25, 0.5, 0.9)) {
    expect_equal(
      qexp_series(p, rates),
      stats::qexp(p, rate = sys$total_rate),
      tolerance = 1e-12
    )
  }
})


test_that("rexp_series (default path) samples from the Exp(sum_rates)", {
  rates <- c(0.5, 0.3, 0.2)
  set.seed(1)
  x <- rexp_series(5000, rates)
  expect_equal(mean(x), 1 / sum(rates), tolerance = 0.05)
})


test_that("rexp_series (keep_latent) returns sys time as row min", {
  rates <- c(0.5, 0.3, 0.2)
  set.seed(1)
  x <- rexp_series(20, rates, keep_latent = TRUE)
  expect_equal(ncol(x), length(rates) + 1L)
  for (i in seq_len(nrow(x))) {
    expect_equal(x[i, 1], min(x[i, -1]), tolerance = 1e-12)
  }
})


test_that("surv.exp_series delegates to dist.structure total_rate", {
  rates <- c(0.5, 0.3, 0.2)
  sys <- dist.structure::exp_series(rates)
  for (ti in c(0.1, 0.5, 1, 2)) {
    expect_equal(
      surv.exp_series(ti, rates),
      stats::pexp(ti, rate = sys$total_rate, lower.tail = FALSE),
      tolerance = 1e-12
    )
  }
})


test_that("hazard_exp_series returns constant sum_rates", {
  rates <- c(0.5, 0.3, 0.2)
  expect_equal(hazard_exp_series(1, rates), sum(rates))
  expect_equal(hazard_exp_series(5, rates), sum(rates))
  # Negative time convention preserved: returns 0 (or -Inf on log scale).
  expect_equal(hazard_exp_series(-1, rates), 0)
})


test_that("mean.exp_series is polymorphic over legacy and modern shapes", {
  rates <- c(0.5, 0.3, 0.2)
  # Legacy: numeric vector with class attribute.
  legacy <- structure(rates, class = "exp_series")
  expect_equal(mean(legacy), 1 / sum(rates), tolerance = 1e-12)
  # Modern: dist.structure list.
  modern <- dist.structure::exp_series(rates)
  expect_equal(mean(modern), 1 / sum(rates), tolerance = 1e-12)
  # Both should agree numerically.
  expect_equal(mean(legacy), mean(modern), tolerance = 1e-12)
})


test_that("dist.structure DGP can be built from maskedcauses fitted rates", {
  # Stage 3 pattern: fit with maskedcauses, construct DGP with dist.structure.
  model <- exp_series_md_c1_c2_c3()
  set.seed(1)
  gen <- rdata(model)
  df <- gen(theta = c(0.5, 0.3, 0.2), n = 200, tau = Inf, p = 0)
  fit_result <- fit(model)(df, par = c(0.5, 0.3, 0.2))
  rates_hat <- stats::coef(fit_result)

  # Build a dist.structure DGP from the fitted rates and exercise the
  # full dist algebra + topology protocol on it.
  sys_fitted <- dist.structure::exp_series(rates_hat)
  expect_true(dist.structure::is_dist_structure(sys_fitted))
  expect_equal(dist.structure::ncomponents(sys_fitted), 3L)
  # Reliability at iid p = 0.5 for a 3-component series is p^3 = 0.125.
  expect_equal(dist.structure::reliability(sys_fitted, 0.5), 0.125,
               tolerance = 1e-12)
})
