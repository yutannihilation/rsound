// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// csound
int csound(String orchestra, String score);
RcppExport SEXP rsound_csound(SEXP orchestraSEXP, SEXP scoreSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< String >::type orchestra(orchestraSEXP);
    Rcpp::traits::input_parameter< String >::type score(scoreSEXP);
    __result = Rcpp::wrap(csound(orchestra, score));
    return __result;
END_RCPP
}