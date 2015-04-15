#' Score class
#'
#' @name score
#'
#' @export

create_score <- function(sections, func = NULL, tempo = NULL) {
  sco_params <- list()
  sco_params$sections <- sections
  sco_params$func     <- func
  sco_params$tempo    <- tempo

  structure(sco_params, class = "score")
}

#' @export
as.character.score <- function(score){
  sapply(score$sections, function(sec) { paste(sapply(sec, paste, collapse = " "), collapse = "\n")})
}

#' @rdname score
#' @export
score_i <- function(...) {
  c("i", ...)
}

#' @rdname score
#' @export
score_t <- function(...) {
  c("t", ...)
}

#' @rdname score
#' @export
score_f <- function(...) {
  c("f", ...)
}
