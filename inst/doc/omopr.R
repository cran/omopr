## ----eval=FALSE---------------------------------------------------------------
#  vignette("dbplyr")

## ----eval=FALSE---------------------------------------------------------------
#  con <- DBI::dbConnect(RPostgres::Postgres(),
#         host = "localhost", dbname = "synpuf")

## ----echo=FALSE---------------------------------------------------------------
con <- omopr:::dummy_con()

## ----message=FALSE------------------------------------------------------------
library(omopr)
library(dplyr)

tRefs = omopr_init(con)

## ----eval=FALSE---------------------------------------------------------------
#  tRefs = omopr_init(con, "cdm")

## ----results="hide"-----------------------------------------------------------
tRefs[["person"]]

## -----------------------------------------------------------------------------
vp = tRefs[["visit_occurrence"]] %>%
  inner_join(tRefs[["person"]], by = "person_id")

## ----results="hide"-----------------------------------------------------------
row_counts(tRefs)

## -----------------------------------------------------------------------------
vpc = vp %>% concept_names()

## ----results="hide"-----------------------------------------------------------
vp %>% concept_names(c("visit_concept_id", "gender_concept_id"))

## ----results="hide"-----------------------------------------------------------
vp %>% concept_names(c("visit_concept_id", "gender_concept_id"), fill = TRUE)

## ----results="hide"-----------------------------------------------------------
vp %>% collect() %>% concept_names(copy = TRUE)

## ----results="hide"-----------------------------------------------------------
tbl(con, sql("select * from person")) %>% concept_names()

