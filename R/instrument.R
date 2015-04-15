#' Instrument class
#'
#' @name instrument
#' @export
create_instrument <- function(...){
  structure(list(...), class = "instrument")
}

#' @export
as.character.instrument <- function(instrument){
  paste(names(instrument), unlist(instrument), sep = " ", collapse = "\n")
}
