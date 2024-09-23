@implementation SSVAuthKitUIFramework

void *__SSVAuthKitUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKitUI.framework/AuthKitUI", 1);
  SSVAuthKitUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
