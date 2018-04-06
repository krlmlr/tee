#' @rdname r_tee
#' @usage NULL
r_tee_impl <- function(..., tee, callback, show) {
  #' @details
  #' The `tee` argument can contain relative or absolute paths.
  dirnames <- unique(dirname(tee))
  is_missing <- !dir.exists(dirnames)
  #' Nonexistant parent directories will be created.
  dir.create(dirnames[is_missing], recursive = TRUE)

  files <- lapply(tee, file, "w")
  on.exit(lapply(files, close))

  if (requireNamespace("fansi"), quietly = TRUE) {
    strip_sgr <- fansi::strip_sgr
  } else {
    strip_sgr <- identity
  }

  my_callback <- function(line) {
    if (show) {
      cat(line, "\n", sep = "")
    }
    #' @details
    #' ANSI escapes will be stripped automatically from the output via
    #' [fansi::strip_sgr()] if this package is available.
    stripped_line <- strip_sgr(line)
    lapply(files, writeLines, text = stripped_line)
    if (!is.null(callback)) callback(line)
  }

  #' This function forwards to [callr::r()].
  callr::r(..., callback = my_callback, show = FALSE)
}
