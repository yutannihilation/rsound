#' Instrument
#' 
#' @name instrument
#' @export
create_instrument <- function(...){
  structure(list(...), class = "instrument")
}

#' @export
as.character.instrument <- function(instrument){
  #TODO: handle multiple lenght of instruments
  i <- 1
  
  lines <- c(sprintf("instr %d", i),
             paste(names(instrument), unlist(instrument), sep = " "),
             "endin")
  
  paste(lines, collapse = "\n")
}