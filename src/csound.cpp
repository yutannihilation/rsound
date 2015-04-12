#include <Rcpp.h>
#include <csound/csound.hpp>
using namespace Rcpp;

//' @useDynLib rsound
//' @export
// [[Rcpp::export]]
int csound_impl(String orchestra, String score, String options) {
  Csound *csound = new Csound();

  csound->SetOption((char*) options.get_cstring());
  
  csound->CompileOrc((char*) orchestra.get_cstring());
  
  csound->ReadScore((char*) score.get_cstring());
  
  csound->Start();
  
  int result = csound->Perform();
  
  delete csound;
  
  return (result >= 0 ? 0 : result);
}
