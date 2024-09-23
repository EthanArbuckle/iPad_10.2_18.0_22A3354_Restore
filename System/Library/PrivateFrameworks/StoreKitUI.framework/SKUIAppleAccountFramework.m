@implementation SKUIAppleAccountFramework

void *__SKUIAppleAccountFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleAccount.framework/AppleAccount", 1);
  SKUIAppleAccountFramework_sHandle = (uint64_t)result;
  return result;
}

@end
