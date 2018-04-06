#' @rdname r_tee
#' @usage NULL
r_tee_impl <- function(..., tee, callback, show) {
  files <- lapply(tee, file, "w")
  on.exit(lapply(files, close))

  my_callback <- function(line) {
    if (show) {
      cat(line, "\n", sep = "")
    }
    #' @details
    #' ANSI escapes will be stripped automatically from the output via
    #' [fansi::strip_sgr()].
    stripped_line <- fansi::strip_sgr(line)
    lapply(files, writeLines, text = stripped_line)
    if (!is.null(callback)) callback(line)
  }

  #' This function forwards to [callr::r()].
  callr::r(..., callback = my_callback, show = FALSE)
}
