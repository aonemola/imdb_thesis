view: decade_bands {
  derived_table: {
    sql: SELECT
          movies.Title  AS movies_title,
              (movies.release_date_date ) AS movies_release_date_date,
          CASE
        WHEN (movies.release_date_date  < (DATE('1900-01-01'))) THEN 'Before 1900s'
        WHEN (((movies.release_date_date ) >= (DATE('1900-01-01')) AND (movies.release_date_date ) < (DATE('1909-12-31')))) THEN '1900s'
        WHEN (((movies.release_date_date ) >= (DATE('1910-01-01')) AND (movies.release_date_date ) < (DATE('1919-12-31')))) THEN '1910s'
        WHEN (((movies.release_date_date ) >= (DATE('1920-01-01')) AND (movies.release_date_date ) < (DATE('1929-12-31')))) THEN '1920s'
        WHEN (((movies.release_date_date ) >= (DATE('1930-01-01')) AND (movies.release_date_date ) < (DATE('1939-12-31')))) THEN '1930s'
        WHEN (((movies.release_date_date ) >= (DATE('1940-01-01')) AND (movies.release_date_date ) < (DATE('1949-12-31')))) THEN '1940s'
        WHEN (((movies.release_date_date ) >= (DATE('1950-01-01')) AND (movies.release_date_date ) < (DATE('1959-12-31')))) THEN '1950s'
        WHEN (((movies.release_date_date ) >= (DATE('1960-01-01')) AND (movies.release_date_date ) < (DATE('1969-12-31')))) THEN '1960s'
        WHEN (((movies.release_date_date ) >= (DATE('1970-01-01')) AND (movies.release_date_date ) < (DATE('1979-12-31')))) THEN '1970s'
        WHEN (((movies.release_date_date ) >= (DATE('1980-01-01')) AND (movies.release_date_date ) < (DATE('1989-12-31')))) THEN '1980s'
        WHEN (((movies.release_date_date ) >= (DATE('1990-01-01')) AND (movies.release_date_date ) < (DATE('1999-12-31')))) THEN '1990s'
        WHEN (((movies.release_date_date ) >= (DATE('2000-01-01')) AND (movies.release_date_date ) < (DATE('2009-12-31')))) THEN '2000s'
        WHEN (((movies.release_date_date ) >= (DATE('2010-01-01')) AND (movies.release_date_date ) < (DATE('2019-12-31')))) THEN '2010s'
        WHEN (movies.release_date_date  >= DATE('2020-01-01')) THEN '2020s & Beyond'
        ELSE 'Other'
      END
       AS decade_bands
      FROM `IMDB.movies`
           AS movies
      GROUP BY
          1,
          2,
          3
      ORDER BY
          2 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: movies_title {
    type: string
    sql: ${TABLE}.movies_title ;;
  }

  dimension: movies_release_date_date {
    type: date
    datatype: date
    sql: ${TABLE}.movies_release_date_date ;;
  }

  dimension: decade_bands {
    type: string
    sql: ${TABLE}.decade_bands ;;
  }

  set: detail {
    fields: [movies_title, movies_release_date_date, decade_bands]
  }
}
