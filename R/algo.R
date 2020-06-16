
#' Implement the Algolia Places address search-autocompletion menu on shiny text inputs
#'
#' @param element the shiny text element that will be used for the Algolia Places autocompletion menu
#' @param type Restrict the search results to a specific type. The user can choose from "city", "country", "address", "busStop", "trainStation", "townhall" and airport. Defaults to "address".
#' @param language Get the results in a specific language. The user can pass two letters language codes (ISO 639-1). Defaults to "en_US"
#' @param countries Change the countries to search in. The user can pass a vector of two letters country codes (ISO 639-1). Defaults to the whole world.
#'
#' @return An address search-autocompletion menu on shiny text inputs
#' @export
#'
#' @examples \dontrun{
#'
#'
#' # You must set the Algolia ID and KEY within your R environment:
#' # name them ALGOLIA_ID and ALGOLIA_KEY, respectively
#' # Don't forget to set use_algolia() at the beginning of your UI
#'
#' use_algolia(),
#'
#' # Creting the shiny text input
#'
#' textInput(inputId = "inp1", label = "Provide an address")
#'
#' # Implementing the Algolia Places library
#'
#' algo(element = "#inp1", countries = "us", language = "de"),
#'
#'
#'
#'
#'
#' }


algo <- function(element, type = 'address', language = "en_US", countries = NULL){

  ID <- Sys.getenv('ALGOLIA_ID')
  KEY <- Sys.getenv('ALGOLIA_KEY')

  if (identical(ID, "") || identical(KEY, "")) {
    stop("Please set the Algolia ID and KEY within your R environment: name them ALGOLIA_ID and ALGOLIA_KEY, respectively",
         call. = FALSE)
  }


  if(is.null(countries)) {


    htmltools::tags$script(htmltools::HTML(

      glue::glue(

        "

  var placesAutocomplete = places({{
      appId: '{ID}',
      apiKey: '{KEY}',
      container: document.querySelector('{element}')
    }}).configure({{


    type: '{type}',

    language: '{language}'

    }});


  "


      )

    ))




  } else {


    r_countries <- jsonlite::toJSON(countries)


    htmltools::tags$script(htmltools::HTML(

      glue::glue(

        "

  var placesAutocomplete = places({{
      appId: '{ID}',
      apiKey: '{KEY}',
      container: document.querySelector('{element}')
    }}).configure({{


    type: '{type}',

    language: '{language}',

    countries: {r_countries}


    }});


  "


      )

    ))



  }






}
