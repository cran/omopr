\name{omopr_init}
\alias{omopr_init}
\title{Initialise connection to an 'OMOP' 'CDM' database and get list of table references}
\description{
This function checks a connection to an 'OMOP' 'CDM' database and creates and
returns a list of lazy 'dbplyr' table references corresponding to the
available 'CDM' tables.
}
\usage{
omopr_init(con, schema = NULL)
}
\arguments{
  \item{con}{A database connection, such as returned by the function \code{\link[DBI]{dbConnect}}.}
  \item{schema}{Optional string name of a database schema in which the
    'OMOP' 'CDM' tables are stored. Potential examples
    include "public", "dbo", "omop", "cdm", "data", etc.}
}
\value{
A named list with elements corresponding to \code{dbplyr} lazy tibble references.
}
\seealso{\code{\link{concept_names}}, \code{\link{row_counts}}}
\examples{
# con = DBI::dbConnect(RPostgres::Postgres(), dbname = "omopdb")
con = omopr:::dummy_con() # dummy connection to allow example to run

tRefs = omopr_init(con)
tRefs[["person"]]
row_counts(tRefs)
}

\keyword{dbplyr}
