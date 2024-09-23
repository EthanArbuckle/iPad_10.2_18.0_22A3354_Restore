@implementation SSVAppleAccountFramework

void *__SSVAppleAccountFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleAccount.framework/AppleAccount", 1);
  SSVAppleAccountFramework_sHandle = (uint64_t)result;
  return result;
}

@end
