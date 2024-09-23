@implementation HealthUILibrary

void *__HealthUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/HealthUI.framework/HealthUI", 2);
  HealthUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
