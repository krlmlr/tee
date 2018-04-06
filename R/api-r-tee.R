#' Run and tee R code
#'
#' Runs R code in an isolated session, writes output to the console and to a
#' file.
#'
#' @inheritDotParams callr::r
#' @inheritParams callr::r
#' @param tee `[character]`\cr
#'   Files to which output is written
#' @param show `[logical(1)]`\cr
#'   Controls if standard output and standard error are shown on the console.
#'   Defaults to `TRUE`, if you need `FALSE` consider using `callr::r()` with
#'   the `stdout` and `stderr` arguments.
#' @export
r_tee <- function(..., tee = character(), callback = NULL, show = TRUE) {
  stopifnot(is.character(tee))
  if (!is.null(callback)) {
    stopifnot(is.function(callback), length(formals(callback)) == 1)
  }
  stopifnot(is.logical(show), length(show) == 1)
  r_tee_impl(..., tee = tee, callback = callback, show = show)
}
