# The name of this view in Looker is "Imdb Cast Crew"
view: imdb_cast_crew {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `IMDB.imdb_cast_crew`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Characters" in Explore.

  dimension: characters {
    type: string
    sql: ${TABLE}.characters ;;
  }

  dimension: crew {
    type: string
    sql: ${TABLE}.crew ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: tconst {
    type: string
    sql: ${TABLE}.tconst ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
