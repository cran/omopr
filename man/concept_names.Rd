\name{concept_names}
\alias{concept_names}
\title{Resolve concept names in the supplied lazy table reference}
\description{
This function accepts a (lazy) tibble and for each variable of the form
\code{XXX_concept_id} adds a corresponding variable
\code{XXX_concept_name} obtained by (left) joining against the
\code{concept} table of the 'CDM'.
}
\usage{
concept_names(tibl, names = NULL, cin = omopr.global$cin,
                          verb = FALSE, fill = FALSE, copy = FALSE)
}
\arguments{
  \item{tibl}{A (lazy) reference to a tibble.}
  \item{names}{An optional list of \code{concept_id}s to be
    resolved. Defaults to all.}
  \item{cin}{A (lazy) reference to a vocabulary tibble with variables
    \code{concept_id} and \code{concept_name}, used to resolve the
    concepts.}
  \item{verb}{If true, print progress to the console.}
  \item{fill}{If true, fill non-matching concept names with a string
    conversion of the concept ID.}
  \item{copy}{\code{copy} arg to be passed to
    \code{left_join}. Will need to be \code{true} if input tibble is not
    a lazy reference, but will be very slow in that case. Work with lazy
    references as long as possible.}
}
\value{
A named list with elements corresponding to \code{dbplyr} lazy tibble references.
}
\seealso{\code{\link{omopr_init}}, \code{\link{row_counts}}}
\examples{
con = omopr:::dummy_con() # dummy connection to allow example to run

tRefs = omopr_init(con)
tRefs[["measurement"]] \%>\% concept_names()
}

\keyword{dbplyr}
