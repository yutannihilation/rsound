#' Make Some Noise!
#'
#' Create sounds from orchestra and score. The output can be either audio interface
#' or a file(.wav, .ogg, etc).
#'
#' @param orchestra An \link{orchestra} object or string
#' @param score     An \link{score} object or string
#'
#' @seealso \url{http://en.flossmanuals.net/csound/ch014_e-rendering-to-file/}
#'
#' @export
csound <- function(orchestra, score, output = "dac"){
  csound_impl(as.character(orchestra), as.character(score), paste0("-o", output))
}
