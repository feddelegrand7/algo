algo <- function(element, type = 'address'){

  ID <- Sys.getenv('ALGOLIA_ID')
  KEY <- Sys.getenv('ALGOLIA_KEY')

  if (identical(ID, "") || identical(KEY, "")) {
    stop("Please set the Algolia ID and KEY within your R environment: name them ALGOLIA_ID and ALGOLIA_KEY, respectively",
         call. = FALSE)
  }




  htmltools::tags$script(HTML(

  glue::glue(

    "

  var placesAutocomplete = places({{
      appId: '{ID}',
      apiKey: '{KEY}',
      container: document.querySelector('{element}')
    }}).configure({{


    type: '{type}'


    }});


  "


  )

  ))




}
