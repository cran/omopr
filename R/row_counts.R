row_counts <- function(listOfTblRefs) {
    counts = lapply(listOfTblRefs, function(x) {
        x %>% count() %>% collect()
    })
    bind_rows(counts) %>%
        rename( "count" = "n") %>%
        bind_cols(table = names(listOfTblRefs))
    }


