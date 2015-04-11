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
devtool::install_github("yutannihilation/rsound")
```

## Usage

```r
library(rsound)

orc <- 'sr=44100
ksmps=32
nchnls=2
0dbfs=1

instr 1
aout vco2 0.5, 440
outs aout, aout
endin'

sco <- 'i1 0 1'

csound(orc, sco)
```
And you will find that `/tmp/test1.wav` is created.