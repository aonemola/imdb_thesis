# The name of this view in Looker is "Imdb Titles"
view: imdb_titles {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `IMDB.imdb_titles`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Attributes" in Explore.

  dimension: attributes {
    type: string
    sql: ${TABLE}.attributes ;;
  }

  dimension: end_year {
    type: number
    sql: ${TABLE}.endYear ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_end_year {
    type: sum
    sql: ${end_year} ;;
  }

  measure: average_end_year {
    type: average
    sql: ${end_year} ;;
  }

  dimension: genres {
    type: string
    sql: ${TABLE}.genres ;;
  }

  dimension: is_adult {
    type: string
    sql: ${TABLE}.isAdult ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: ordering {
    type: string
    sql: ${TABLE}.ordering ;;
  }

  dimension: original_title {
    type: string
    sql: ${TABLE}.originalTitle ;;
  }

  dimension: primary_title {
    type: string
    sql: ${TABLE}.primaryTitle ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: runtime_minutes {
    type: number
    sql: ${TABLE}.runtimeMinutes ;;
  }

  dimension: start_year {
    type: number
    sql: ${TABLE}.startYear ;;
  }

  dimension: tconst {
    type: string
    sql: ${TABLE}.tconst ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: title_type {
    type: string
    sql: ${TABLE}.titleType ;;
  }

  dimension: types {
    type: string
    sql: ${TABLE}.types ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
