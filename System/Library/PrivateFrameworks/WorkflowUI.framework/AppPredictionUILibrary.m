@implementation AppPredictionUILibrary

void *__AppPredictionUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppPredictionUI.framework/AppPredictionUI", 2);
  AppPredictionUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
