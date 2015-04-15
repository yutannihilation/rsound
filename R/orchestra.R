#' Orchestra class
#'
#' @name orchestra
#' @param 0dbfs     Sets the value of 0 decibels using full scale amplitude.
#' @param ctrlinit  Sets the initial values for a set of MIDI controllers.
#' @param ftgen     Generate a score function table from within the orchestra.
#' @param kr        Sets the control rate.
#' @param ksmps     Sets the number of samples in a control period.
#' @param massign   Assigns a MIDI channel number to a Csound instrument.
#' @param nchnls    Sets the number of channels of audio output.
#' @param pgmassign Assigns an instrument number to a specified (or all) MIDI program(s).
#' @param pset      Defines and initializes numeric arrays at orchestra load time.
#' @param seed      Sets the global seed value.
#' @param sr        Sets the audio sampling rate.
#' @param strset    Allows a string to be linked with a numeric value.
#' @param instruments Sets instruments.
#' @export
create_orchestra <- function(`0dbfs`   = NULL,
                             ctrlinit  = NULL,
                             ftgen     = NULL,
                             kr        = NULL,
                             ksmps     = NULL,
                             massign   = NULL,
                             nchnls    = NULL,
                             pgmassign = NULL,
                             pset      = NULL,
                             seed      = NULL,
                             sr        = NULL,
                             strset    = NULL,
                             instruments = NULL){
  orc_params <- list()
  orc_params$`0dbfs`   <- `0dbfs`
  orc_params$ctrlinit  <- ctrlinit
  orc_params$ftgen     <- ftgen
  orc_params$kr        <- kr
  orc_params$ksmps     <- ksmps
  orc_params$massign   <- massign
  orc_params$nchnls    <- nchnls
  orc_params$pgmassign <- pgmassign
  orc_params$pset      <- pset
  orc_params$seed      <- seed
  orc_params$sr        <- sr
  orc_params$strset    <- strset
  orc_params$instruments <- instruments

  structure(orc_params, class = "orchestra")
}

#' @export
as.character.orchestra <- function(orchestra){
  # Parameters whose syntax are as simple as "NAME = VALUE"
  names_simpleparams <- c("0dbfs", "kr", "ksmps", "nchnls", "sr")
  names_simpleparams <- intersect(names_simpleparams, names(orchestra))
  simpleparams       <- paste(names_simpleparams, unlist(orchestra[names_simpleparams]),
                              sep = " = ", collapse = "\n")

  instrparams <- sapply(seq_along(orchestra$instruments), function(i){
    sprintf("instr %d\n%s\nendin", i, as.character(orchestra$instruments[[i]]))
  })

  paste(simpleparams, instrparams, sep = "\n\n")
}
