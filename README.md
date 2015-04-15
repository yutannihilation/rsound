rsound
=============

An R interface to [Csound](https://github.com/csound). Note that this package is in a verrrry early stage! Absolutely no warranty.

## Requirement

Currently, this works only on Linux. You have to install Csound and its C++ library first. If you are using some Ubuntu/Debian, the package names are probablly like these:

```sh
sudo apt-get install libcsound64-dev libcsnd-dev
```

## Installation

```r
devtools::install_github("yutannihilation/rsound")
```

## Usage

```r
library(rsound)

orc <- create_orchestra( sr    = 44100,
                         ksmps = 32,
                         nchnls = 2,
                         `0dbfs` = 1,
                         instrument = list(
                           create_instrument(aout = "vco2 0.5, 440", outs = "aout, aout"))
                         )

sco <- create_score(sections = list(
                      list(score_i(1, 0, 1))
                    ))

csound(orc, sco, "/tmp/test.wav")

sco2 <- create_score(sections = list(
                      list(
                        score_i(1, 0, 2, 110),
                        score_i(1, 3, 2, 220),
                        score_i(1, 6, 2, 440),
                        score_i(1, 9, 2, 880),
                        score_i(1,12, 2, 110),
                        score_i(1,15, 2, 220),
                        score_i(1,18, 2, 440),
                        score_i(1,21, 2, 880)
                      )
                    ),
                    tempo = score_t( 0,240, 12, 30, 15,240),
                    func  = score_f( 1, 0,16384,10, 1)
                    )

csound(orc, sco2, "/tmp/test2.wav")
```
And you will find that `/tmp/test1.wav` is created.
