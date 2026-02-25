
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fishr

<!-- badges: start -->

[![R-CMD-check](https://github.com/lukewarkentin/fishr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lukewarkentin/fishr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of fishr is to provide functions for calculating Catch Per Unit
Effort (CPUE), a fundamental metric in fisheries science.

## Installation

You can install the development version of fishr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("lukewarkentin/fishr")
```

## Example usage

``` r
#library(fishr)
devtools::load_all()
```

    ## ℹ Loading fishr

``` r
cpue(catch = 100, effort = 10)
```

    ## [1] 10

``` r
# With gear standardization
cpue(catch = 100, effort = 10, gear_factor = 0.5)
```

    ## [1] 5

## highlights / notes to remember

- What is the helper to install the virtual local version of the
  development package in the readme so it knits?
- Alt+down: move a line
- switch() - use instead of ifelse() or if() statements.
- match.arg() for a vector of character, match first or belonging to.
- Using air formatter
- R-CMD-check.yaml for auto checking - use_github_action()
- multiple && for if statements
- use @noRd tag in R function code instead of @export for utility
  functions that you don’t want the user to see
