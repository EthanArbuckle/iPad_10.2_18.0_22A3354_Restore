@implementation LoadAuthKitUI

void *__LoadAuthKitUI_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKitUI.framework/AuthKitUI", 2);
  LoadAuthKitUI_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
