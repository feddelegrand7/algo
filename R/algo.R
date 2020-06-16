algo <- function(element, type = 'address', language = "en_US", countries = NULL){

  ID <- Sys.getenv('ALGOLIA_ID')
  KEY <- Sys.getenv('ALGOLIA_KEY')

  if (identical(ID, "") || identical(KEY, "")) {
    stop("Please set the Algolia ID and KEY within your R environment: name them ALGOLIA_ID and ALGOLIA_KEY, respectively",
         call. = FALSE)
  }


  if(is.null(countries)) {


    htmltools::tags$script(HTML(

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


    htmltools::tags$script(HTML(

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
