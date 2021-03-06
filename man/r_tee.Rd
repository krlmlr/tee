% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api-r-tee.R, R/r-tee.R
\name{r_tee}
\alias{r_tee}
\alias{r_tee_impl}
\title{Run and tee R code}
\usage{
r_tee(..., tee = character(), callback = NULL, show = TRUE)
}
\arguments{
\item{...}{Arguments passed on to \code{callr::r}
\describe{
  \item{func}{Function object to call in the new R process.
The function should be self-contained and only refer to
other functions and use variables explicitly from other packages
using the \code{::} notation. The environment of the function
is set to \code{.GlobalEnv} before passing it to the child process.
Because of this, it is good practice to create an anonymous
function and pass that to \code{callr}, instead of passing
a function object from a (base or other) package. In particular\preformatted{r(.libPaths)
}

does not work, because \code{.libPaths} is defined in a special
environment, but\preformatted{r(function() .libPaths())
}

works just fine.}
  \item{args}{Arguments to pass to the function. Must be a list.}
  \item{libpath}{The library path.}
  \item{repos}{The \emph{repos} option. If \code{NULL}, then no
\emph{repos} option is set. This options is only used if
\code{user_profile} or \code{system_profile} is set \code{FALSE},
as it is set using the system or the user profile.}
  \item{stdout}{The name of the file the standard output of
the child R process will be written to.
If the child process runs with the \code{--slave} option (the default),
then the commands are not echoed and will not be shown
in the standard output. Also note that you need to call \code{print()}
explicitly to show the output of the command(s).}
  \item{stderr}{The name of the file the standard error of
the child R process will be written to.
In particular \code{message()} sends output to the standard
error. If nothing was sent to the standard error, then this file
will be empty. This can be the same file as \code{stderr}, although there
is no guarantee that the lines will be in the correct chronological
order.}
  \item{error}{What to do if the remote process throws an error.
See details below.}
  \item{cmdargs}{Command line arguments to pass to the R process.
Note that \code{c("-f", rscript)} is appended to this, \code{rscript}
is the name of the script file to run. This contains a call to the
supplied function and some error handling code.}
  \item{show}{Logical, whether to show the standard output on the screen
while the child process is running. Note that this is independent
of the \code{stdout} and \code{stderr} arguments. The standard
error is not shown currently.}
  \item{callback}{A function to call for each line of the standard
output and standard error from the child process. It works together
with the \code{show} option; i.e. if \code{show = TRUE}, and a
callback is provided, then the output is shown of the screen, and the
callback is also called.}
  \item{block_callback}{A function to call for each block of the standard
output and standard error. This callback is not line oriented, i.e.
multiple lines or half a line can be passed to the callback.}
  \item{spinner}{Whether to snow a calming spinner on the screen while
the child R session is running. By default it is shown if
\code{show = TRUE} and the R session is interactive.}
  \item{system_profile}{Whether to use the system profile file.}
  \item{user_profile}{Whether to use the user's profile file.}
  \item{env}{Environment variables to set for the child process.}
  \item{timeout}{Timeout for the function call to finish. It can be a
\link[base:difftime]{base::difftime} object, or a real number, meaning seconds.
If the process does not finish before the timeout period expires,
then a \code{system_command_timeout_error} error is thrown. \code{Inf}
means no timeout.}
}}

\item{tee}{\code{[character]}\cr
Files to which output is written}

\item{callback}{A function to call for each line of the standard
output and standard error from the child process. It works together
with the \code{show} option; i.e. if \code{show = TRUE}, and a
callback is provided, then the output is shown of the screen, and the
callback is also called.}

\item{show}{\code{[logical(1)]}\cr
Controls if standard output and standard error are shown on the console.
Defaults to \code{TRUE}, if you need \code{FALSE} consider using \code{callr::r()} with
the \code{stdout} and \code{stderr} arguments.}
}
\description{
Runs R code in an isolated session, writes output to the console and to a
file.
}
\details{
The \code{tee} argument can contain relative or absolute paths.
Nonexistant parent directories will be created.

ANSI escapes will be stripped automatically from the output via
\code{\link[fansi:strip_sgr]{fansi::strip_sgr()}} if this package is available.
This function forwards to \code{\link[callr:r]{callr::r()}}.
}
