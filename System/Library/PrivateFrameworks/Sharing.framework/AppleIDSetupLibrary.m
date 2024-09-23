@implementation AppleIDSetupLibrary

void *__AppleIDSetupLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleIDSetup.framework/AppleIDSetup", 2);
  AppleIDSetupLibrary_sLib = (uint64_t)result;
  return result;
}

void *__AppleIDSetupLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleIDSetup.framework/AppleIDSetup", 2);
  AppleIDSetupLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__AppleIDSetupLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleIDSetup.framework/AppleIDSetup", 2);
  AppleIDSetupLibrary_sLib_1 = (uint64_t)result;
  return result;
}

void *__AppleIDSetupLibrary_block_invoke_2()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleIDSetup.framework/AppleIDSetup", 2);
  AppleIDSetupLibrary_sLib_2 = (uint64_t)result;
  return result;
}

@end
