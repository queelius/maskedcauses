#' Exponential series systems
#'
#' This file contains functions related to the Exponential series distribution.
#' Functions include simulation, pdf, cdf, quantile, and other related
#' functions for the Exponential series distribution.
#' 
#' Exponential series system distribution
#'
#' Density, distribution, quantile, random generation, hazard, survival,
#' and mean functions for the exponential series system distribution.
#' A series system of m independent exponential components with rates
#' \eqn{\lambda_1, \ldots, \lambda_m} has an exponential system lifetime
#' with rate \eqn{\lambda = \sum \lambda_j}.
#'
#' @name Exponential-series-system
#' @keywords internal
NULL

#' Quantile function for exponential series.
#'
#' @param p Vector of quantiles.
#' @param rates Vector of rate parameters for exponential component lifetimes.
#' @param lower.tail Logical, if TRUE (default), probabilities are P(X <= x),
#'                   otherwise, P(X > x).
#' @param log.p Logical, if TRUE, vector of probabilities `p` are given as `log(p)`.
#' @return Quantiles corresponding to the given probabilities `p`.
#' @importFrom stats qexp
#' @export
#' @examples
#' rates <- c(0.5, 0.3, 0.2)
#' qexp_series(0.5, rates)
#' qexp_series(c(0.25, 0.5, 0.75), rates)
qexp_series <- function(p, rates, lower.tail = TRUE, log.p = FALSE) {
    qexp(p, sum(rates), lower.tail, log.p)
}

#' Random number generation for exponential series.
#'
#' Generates random variates from an exponential series distribution.
#'
#' @param n Integer, number of observations to generate.
#' @param rates Vector of rate parameters for exponential component lifetimes.
#' @param keep_latent Logical; if TRUE, returns a matrix with system lifetimes
#'                    in the first column and individual component lifetimes in
#'                    subsequent columns. If FALSE (default), returns only
#'                    system lifetimes.
#' @return If `keep_latent = FALSE`, a vector of random variates from the
#'         exponential series distribution. If `keep_latent = TRUE`, a matrix
#'         with system lifetime in the first column and component lifetimes
#'         in columns 2 through m+1.
#' @importFrom stats rexp
#' @export
#' @examples
#' set.seed(123)
#' rexp_series(5, rates = c(0.5, 0.3, 0.2))
#' rexp_series(3, rates = c(0.5, 0.3, 0.2), keep_latent = TRUE)
rexp_series <- function(n, rates, keep_latent = FALSE) {

    m <- length(rates)

    data <- NULL
    if (keep_latent) {
        data <- matrix(NA, nrow = n, ncol = m)
        for (j in seq_len(m)) {
            data[, j] <- rexp(n, rates[j])
        }
        data <- cbind(apply(data, 1, min), data)
    } else {
        data <- rexp(n, sum(rates))
    }
    data
}

#' pdf for exponential series.
#'
#' @param t series system lifetime
#' @param rates rate parameters for exponential component lifetimes
#' @param log return the log of the pdf
#' @return Density values for the exponential series distribution.
#' @importFrom stats dexp
#' @export
#' @examples
#' rates <- c(0.5, 0.3, 0.2)
#' dexp_series(1.0, rates)
#' dexp_series(c(0.5, 1.0, 2.0), rates, log = TRUE)
dexp_series <- function(t, rates, log = FALSE) {
    dexp(t, sum(rates), log)
}

#' Cumulative distribution function for exponential series.
#'
#' @param t Vector of series system lifetimes.
#' @param rates Vector of rate parameters for exponential component lifetimes.
#' @param lower.tail Logical; if TRUE (default), probabilities are P(X <= x),
#'                   otherwise, P(X > x).
#' @param log.p Logical; if TRUE, return the log of the cdf.
#' @return The cumulative probabilities evaluated at the specified lifetimes.
#' @importFrom stats pexp
#' @export
#' @examples
#' rates <- c(0.5, 0.3, 0.2)
#' pexp_series(1.0, rates)
#' pexp_series(c(0.5, 1.0, 2.0), rates)
pexp_series <- function(t, rates, lower.tail = TRUE, log.p = FALSE) {
    pexp(t, sum(rates), lower.tail, log.p)
}

#' Hazard function for exponential series.
#'
#' @param t Vector of series system lifetimes.
#' @param rates Vector of rate parameters for exponential component lifetimes.
#' @param log.p Logical; if TRUE, return the log of the hazard function.
#' @return The hazard function evaluated at the specified lifetimes.
#' @export
#' @examples
#' rates <- c(0.5, 0.3, 0.2)
#' hazard_exp_series(1.0, rates)
#' hazard_exp_series(c(0.5, 1.0), rates, log.p = TRUE)
hazard_exp_series <- function(t, rates, log.p = FALSE) {
    ifelse(log.p,
        ifelse(t < 0, -Inf, log(sum(rates))),
        ifelse(t < 0, 0, sum(rates))
    )
}


#' Survival function for exponential series.
#'
#' @param t Vector of series system lifetimes.
#' @param rates Vector of rate parameters for exponential component lifetimes.
#' @param log.p Logical; if TRUE, return the log of the survival function.
#' @return The survival function evaluated at the specified lifetimes.
#' @importFrom stats pexp
#' @export
#' @examples
#' rates <- c(0.5, 0.3, 0.2)
#' surv.exp_series(1.0, rates)
#' surv.exp_series(c(0.5, 1.0, 2.0), rates)
surv.exp_series <- function(t, rates, log.p = FALSE) {
    pexp(t, sum(rates), lower.tail = FALSE, log.p = log.p)
}

#' Mean function for exponential series.
#'
#' Computes the expected value of a series system with exponentially distributed
#' component lifetimes. For a series system with component rates
#' \eqn{\lambda_1, \ldots, \lambda_m}, the system lifetime is exponential
#' with rate \eqn{\sum \lambda_j}, so \eqn{E[T] = 1 / \sum \lambda_j}.
#'
#' @param x An object of class `exp_series` (a vector of rate parameters).
#' @param ... Additional arguments (ignored, for S3 generic compatibility).
#' @return The mean of the exponential series distribution (1/sum of rates).
#' @method mean exp_series
#' @export
#' @examples
#' rates <- structure(c(0.5, 0.3, 0.2), class = "exp_series")
#' mean(rates)
mean.exp_series <- function(x, ...) {
    1 / sum(x)
}




