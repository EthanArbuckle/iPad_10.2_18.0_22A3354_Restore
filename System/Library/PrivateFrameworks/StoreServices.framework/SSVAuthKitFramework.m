@implementation SSVAuthKitFramework

void *__SSVAuthKitFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit", 1);
  SSVAuthKitFramework_sHandle = (uint64_t)result;
  return result;
}

@end
