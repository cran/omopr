\name{row_counts}
\alias{row_counts}
\title{Compute row counts for supplied list of tables}
\description{
This function accepts a list of tibbles (such as returned by
\code{\link{omopr_init}}) and computes the number of rows of data for
each, returning the result as a tibble.
}
\usage{
row_counts(listOfTblRefs)
}
\arguments{
  \item{listOfTblRefs}{A list of tibbles.}
}
\value{
A tibble containing the table names and their row counts.
}
\seealso{\code{\link{omopr_init}}, \code{\link{concept_names}}}
\examples{
con = omopr:::dummy_con() # dummy connection to allow example to run

tRefs = omopr_init(con)
row_counts(tRefs)
}

\keyword{dplyr}
