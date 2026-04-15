# maskedcauses 0.10.0

## Soft deprecation: exp_series functional API

The exponential-series convenience functions (`dexp_series`,
`pexp_series`, `qexp_series`, `rexp_series`, `hazard_exp_series`,
`surv.exp_series`, `mean.exp_series`) are now thin wrappers that derive
the aggregate exponential rate from `dist.structure::exp_series()`, the
canonical constructor for series-of-exponential distributions. The base
R `dexp`/`pexp`/`qexp`/`rexp` functions are used for the actual
computation to avoid S3 dispatch ambiguity (both packages register
methods named like `surv.exp_series` and `mean.exp_series` but on
different underlying object shapes).

The functions remain in maskedcauses for backwards compatibility, but
new code should construct an explicit `dist.structure` object:

    sys <- dist.structure::exp_series(rates)
    algebraic.dist::surv(sys)(t)
    algebraic.dist::cdf(sys)(t)
    algebraic.dist::sampler(sys)(n)
    mean(sys)

The dist.structure form composes with the wider dist.structure
ecosystem (importance measures, system signature, structural importance,
dual, compositional operations) that the legacy functional API does
not expose.

## Internal changes

* Adds `dist.structure` and `algebraic.dist` to Imports
  (`algebraic.dist` was previously in Suggests).
* No public API removals. All existing test cases pass.

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
