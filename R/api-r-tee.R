#' Run and tee R code
#'
#' Runs R code in an isolated session, writes output to the console and to a file.
#'
#' @inheritDotParams callr::r
#' @inheritParams callr::r
#' @param tee `[character]`\cr
#'   Files to which output is written
#' @param show `[NULL]`\cr
#'   Do not set.
#' @export
r_tee <- function(..., tee = character(), callback = NULL, show = NULL) {
  stopifnot(is.character(tee))
  if (!is.null(callback)) {
    stopifnot(is.function(callback), length(formals(callback)) == 1)
  }
  stopifnot(is.null(show))
  r_tee_impl(..., tee = tee, callback = callback)
}
