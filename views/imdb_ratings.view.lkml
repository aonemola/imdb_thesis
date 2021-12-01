# The name of this view in Looker is "Imdb Ratings"
view: imdb_ratings {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `IMDB.imdb_ratings`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Average Rating" in Explore.

  dimension: average_rating {
    type: number
    sql: ${TABLE}.averageRating ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_average_rating {
    type: sum
    sql: ${average_rating} ;;
  }

  measure: average_average_rating {
    type: average
    sql: ${average_rating} ;;
  }

  dimension: num_votes {
    type: number
    sql: ${TABLE}.numVotes ;;
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
