
<!-- README.md is generated from README.Rmd. Please edit that file -->
tee
===

The goal of tee is to run R code in an isolated session, or arbitrary scripts, and log the output to a file. It is similar to the `tee` utility, but relies on [*callr*](https://github.com/r-lib/callr) and [*processx*](https://github.com/r-lib/processx). All systems where these packages work (including Windows) are supported.

Works for me.

Installation
------------

You can install *tee* from GitHub:

``` r
# install.packages("remotes")
remotes::install_local("krlmlr/tee")
```

Example
-------

The `r_tee()` function has (almost) the same signature as `callr::r()` but supports a `tee` argument of type `character`. If set, all output will be written to the file(s) specified in the `tee` argument.

``` r
library(tee)
ret <- r_tee(function() { print("Hi!"); 42 }, tee = "hi.log")
#> Loading required namespace: fansi
#> [1] "Hi!"
ret
#> [1] 42
readLines("hi.log")
#> [1] "[1] \"Hi!\""
```

ANSI escapes will be stripped automatically from the output via `fansi::strip_sgr()`.
