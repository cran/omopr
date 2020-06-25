## dummy.R

## create a dummy CDM database for examples and testing

dummy_con <- function() {
    
    con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

    concept <- data.frame(
        concept_id = c(1, 2, 3, 4, 5),
        concept_name = c("one", "two", "three", "M", "F")
    )
    DBI::dbWriteTable(con, "concept", concept)

    person <- data.frame(
        person_id = c(1, 2, 3),
        gender_concept_id = c(4, 4, 5)
    )
    DBI::dbWriteTable(con, "person", person)
    
    measurement <- data.frame(
        measurement_id = c(1, 2, 3),
        person_id = c(1, 1, 2),
        measurement_concept_id = c(2, 3, 2)
    )
    DBI::dbWriteTable(con, "measurement", measurement)

    visit_occurrence <- data.frame(
        visit_occurrence_id = c(1, 2, 3, 4),
        person_id = c(1, 1, 2, 3),
        visit_concept_id = c(1, 1, 2, 2)
        )
    DBI::dbWriteTable(con, "visit_occurrence", visit_occurrence)
    
    con
}

## eof
