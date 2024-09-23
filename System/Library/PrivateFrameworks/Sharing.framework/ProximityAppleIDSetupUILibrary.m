@implementation ProximityAppleIDSetupUILibrary

void *__ProximityAppleIDSetupUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ProximityAppleIDSetupUI.framework/ProximityAppleIDSetupUI", 2);
  ProximityAppleIDSetupUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
