# maskedcauses 0.9.2

* Save and restore graphical parameters (`par()`) in all vignettes, as
  requested by CRAN reviewer.

# maskedcauses 0.9.1

* Fix Unicode characters in roxygen documentation that broke LaTeX PDF manual
  generation on Windows (replaced with `\eqn{}` markup).
* Fix unescaped braces in Rd math notation.

# maskedcauses 0.9.0

* Initial CRAN submission.
* Likelihood models for exponential, homogeneous Weibull, and heterogeneous
  Weibull series systems with masked component cause of failure.
* Composable observation functors for right, left, interval, and mixed
  censoring schemes.
* Analytical log-likelihood, score, and Hessian for exponential model.
* Closed-form left/interval censoring for homogeneous Weibull.
* Numerical integration for heterogeneous Weibull left/interval censoring.
