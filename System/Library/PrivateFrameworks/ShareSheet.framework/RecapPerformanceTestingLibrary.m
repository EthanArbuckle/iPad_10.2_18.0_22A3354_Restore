@implementation RecapPerformanceTestingLibrary

void *__RecapPerformanceTestingLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/RecapPerformanceTesting.framework/RecapPerformanceTesting", 2);
  RecapPerformanceTestingLibrary_sLib = (uint64_t)result;
  return result;
}

@end
