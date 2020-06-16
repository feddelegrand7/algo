
#' Enable the Algolia Places JavaScript library
#'
#' @description The function activates the capabilities of the Algolia Places JavaScript library
#'
#' @return called for the side effect of activating the Algolia Places JavaScript library
#' @export
#'
#' @examples \donttest{
#'
#' # Set the algolia function at the beginning of the shiny app UI
#'
#' use_algolia()
#'
#'
#'
#' }


use_algolia <- function(){

  htmltools::tags$script(src="https://cdn.jsdelivr.net/npm/places.js@1.19.0")


  }
