@implementation HealthKitLibrary

void *__HealthKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/HealthKit.framework/HealthKit", 2);
  HealthKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
