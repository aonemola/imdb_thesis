include: "/views/movies.view.lkml"


view: ndt_top_rank {
  derived_table: {
    explore_source: movies {
      column: title {}
      column: total_awards_nominated_for {}
      column: genre {}
      derived_column: ranking {
        sql: rank() over (order by total_awards_nominated_for desc) ;;
      }
    }
  }
  dimension: title {}
  dimension: total_awards_nominated_for {
    type: number
  }
  dimension: ranking {}



  parameter: top_rank_limit {
    view_label: "Top N Ranking"
    type: unquoted
    default_value: "5"
    allowed_value: {
      label: "Top 5"
      value: "5"
    }
    allowed_value: {
      label: "Top 10"
      value: "10"
    }
    allowed_value: {
      label: "Top 20"
      value: "20"
    }
    allowed_value: {
      label: "Top 50"
      value: "50"
    }
  }


  dimension: top_movies {
    view_label: "Top N Ranking"
    label: "Movies (Top {% if top_rank_limit._is_filtered %}{% parameter top_rank_limit %}{% else %}N{% endif %})"
    order_by_field: ranking
    type: string
    sql:
      CASE
        WHEN ${ranking}<={% parameter top_rank_limit %} THEN ${title}
         ELSE 'Other'
      END
    ;;
  }


  dimension: ranking_top_movies {
    hidden: yes
    label_from_parameter: top_rank_limit
    type: string
    sql:
      CASE
        WHEN  ${ranking}<={% parameter top_rank_limit %}
          THEN
            CASE
              WHEN  ${ranking}<10 THEN  CONCAT('0', CAST(${ranking} AS STRING))
              ELSE CAST(${ranking} AS STRING)
            END
                ELSE 'Other'
      END
    ;;
  }
}
