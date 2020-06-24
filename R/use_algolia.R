
#' Enable the Algolia Places JavaScript library
#'
#' @description The function activates the capabilities of the Algolia Places JavaScript library.
#'  The user must put it at the beginning of her shiny ui. This function works only when the user has set an application ID
#'  and an API key, collected from the Algolia website, within her R environment (please refer to the vignette).
#'
#' @return called for the side effect of activating the Algolia Places JavaScript library
#' @export
#'



use_algolia <- function(){

  htmltools::tags$script(src="https://cdn.jsdelivr.net/npm/places.js@1.19.0")


  }
