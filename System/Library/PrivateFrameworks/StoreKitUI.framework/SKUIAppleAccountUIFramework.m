@implementation SKUIAppleAccountUIFramework

void *__SKUIAppleAccountUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleAccountUI.framework/AppleAccountUI", 1);
  SKUIAppleAccountUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
