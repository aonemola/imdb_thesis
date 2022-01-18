# Define the database connection to be used for this model.
connection: "tobi_project_thesis"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: tobi_imdb_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: tobi_imdb_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Tobi Imdb"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: imdb_people {}

explore: imdb_epsiodes {}

explore: imdb_roles{
  view_name: imdb_cast_crew
}

explore: imdb_ratings {}

explore: rotten_tomatoes_movies {}

explore: Joining_Tconst {
  view_name: imdb_titles

  join: imdb_ratings {
    sql_on: ${imdb_ratings.tconst} = ${imdb_titles.tconst} ;;
    relationship: one_to_one
    type: left_outer
  }

  join: imdb_epsiodes {
    sql_on: ${imdb_epsiodes.tconst}=${imdb_ratings.tconst} ;;
    relationship: many_to_one
    type: left_outer
  }

}

explore: People_In_Movies{
  view_name:imdb_people
 join: imdb_cast_crew {
   sql_on: ${imdb_cast_crew.crew}=${imdb_people.nconst} ;;
  relationship: one_to_many
  type: left_outer
 }

}

explore: movies {

  join: ndt_top_rank {
    view_label: "Ranking of Movies"
    type: inner
    relationship: one_to_one
    sql_on: ${movies.title} = ${ndt_top_rank.title} ;;

  }
  # join: imdb_ratings {
  #   sql_on: ${movies.imdbid} = ${imdb_ratings.tconst} ;;
  #   relationship: one_to_one
  #   type: left_outer
  # }



}


explore: imdb_titles {
 join:imdb_ratings  {
 sql_on: ${imdb_titles.tconst} = ${imdb_ratings.tconst} ;;
  relationship: one_to_one
  type: left_outer
  }

}

explore: rotten_tomatoes_critic_reviews {}
