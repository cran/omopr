require(dbplyr)

utils::globalVariables(c("concept_name"))

concept_names <- function(tibl, names = NULL, cin = omopr.global$cin,
                          verb = FALSE, fill=FALSE, copy = FALSE) {
    allnames = colnames(tibl)
    if (is.null(names)) {
        names = allnames[grep("_concept_id$", allnames)]
    }
    tiblc = tibl
    for (id in names) {
        if (verb)
            message(paste("Resolving:", id))
        name = paste0(substr(id, 1, nchar(id) - 2), "name")
        if (!(name %in% allnames)) {
            by = c("concept_id")
            names(by) = id
            rname = c("concept_name")
            names(rname) = name
            tiblc = tiblc %>% left_join(cin, by = by, copy = copy)
            if (fill)
                tiblc = tiblc %>% mutate (concept_name =
                                              if (is.na(concept_name))
                                                  as.character(!!sym(id))
                                              else concept_name)
            tiblc = tiblc %>% rename(all_of(rname))
        }
        else
            if (verb)
                message(paste("Skipping:", name))
    }
    tiblc
}

