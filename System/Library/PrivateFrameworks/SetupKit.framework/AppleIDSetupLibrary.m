@implementation AppleIDSetupLibrary

void *__AppleIDSetupLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleIDSetup.framework/AppleIDSetup", 2);
  AppleIDSetupLibrary_sLib = (uint64_t)result;
  return result;
}

@end
