@implementation AppPredictionClientLibrary

void *__AppPredictionClientLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppPredictionClient.framework/AppPredictionClient", 2);
  AppPredictionClientLibrary_sLib = (uint64_t)result;
  return result;
}

@end
