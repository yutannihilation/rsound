#include <Rcpp.h>
#include <csound/csound.hpp>
using namespace Rcpp;

// [[Rcpp::export]]
int csound(String orchestra, String score) {
  Csound *csound = new Csound();

  csound->SetOption("-o/tmp/test.wav");
  
  csound->CompileOrc((char*) orchestra.get_cstring());
  
  csound->ReadScore((char*) score.get_cstring());
  
  csound->Start();
  
  int result = csound->Perform();
  
  delete csound;
  
  return (result >= 0 ? 0 : result);
}
