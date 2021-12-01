# The name of this view in Looker is "Rotten Tomatoes Critic Reviews"
view: rotten_tomatoes_critic_reviews {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `IMDB.rotten_tomatoes_critic_reviews`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Critic Name" in Explore.

  dimension: critic_name {
    type: string
    sql: ${TABLE}.critic_name ;;
  }

  dimension: publisher_name {
    type: string
    sql: ${TABLE}.publisher_name ;;
  }

  dimension: review_content {
    type: string
    sql: ${TABLE}.review_content ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: review {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.review_date ;;
  }

  dimension: review_score {
    type: string
    sql: ${TABLE}.review_score ;;
  }

  dimension: review_type {
    type: string
    sql: ${TABLE}.review_type ;;
  }

  dimension: rotten_tomatoes_link {
    type: string
    sql: ${TABLE}.rotten_tomatoes_link ;;
  }

  dimension: top_critic {
    type: yesno
    sql: ${TABLE}.top_critic ;;
  }

  measure: count {
    type: count
    drill_fields: [publisher_name, critic_name]
  }
}
