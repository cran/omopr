require(dbplyr)

omopr.global <- new.env()
omopr.global$cin = NULL

omopr_init <- function(con, schema = NULL) {
    if (!is.null(schema))
        table_names = DBI::dbListTables(con, schema = schema)
    else
        table_names = DBI::dbListTables(con)        
    if (!("concept" %in% table_names))
        stop("No concept table detected. A (populated) concept table is needed for this package to be useful.")
    if (!is.null(schema))
        table_refs = lapply(table_names,
                            function(x) tbl(con, in_schema(schema, x)))
    else
        table_refs = lapply(table_names,
                            function(x) tbl(con, x))
    names(table_refs) = table_names
    omopr.global$cin = table_refs[["concept"]] %>%
        select(c("concept_id","concept_name")) 
    table_refs
}


