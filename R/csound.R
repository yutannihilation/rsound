#' Make Some Noise!
#' 
#' @export
csound <- function(orchestra, score, output = "dac"){
  csound_impl(as.character(orchestra), as.character(score), paste0("-o", output))
}