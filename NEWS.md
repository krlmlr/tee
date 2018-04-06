# tee 0.0.0.9001 (2018-04-06)

- If parent directories for files in `tee` are missing, they are created.
- The `fansi` package is used only if it is available.


# tee 0.0.0.9000 (2018-04-06)

- New `r_tee()` forwards to `callr::r()` but writes output (minus ANSI escapes) to a log file.


