@implementation AppleIDSetupUILibrary

void *__AppleIDSetupUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleIDSetupUI.framework/AppleIDSetupUI", 2);
  AppleIDSetupUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
