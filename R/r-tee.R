r_tee_impl <- function(..., tee, callback, show) {
  files <- lapply(tee, file, "w")
  on.exit(lapply(files, close))

  my_callback <- function(line) {
    if (show) {
      cat(line, "\n", sep = "")
    }
    stripped_line <- fansi::strip_sgr(line)
    lapply(files, writeLines, text = stripped_line)
    if (!is.null(callback)) callback(line)
  }

  callr::r(..., callback = my_callback, show = FALSE)
}
