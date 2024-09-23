@implementation AuthKitLibrary

void *__AuthKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit", 2);
  AuthKitLibrary_sLib = (uint64_t)result;
  return result;
}

void *__AuthKitLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit", 2);
  AuthKitLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__AuthKitLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit", 2);
  AuthKitLibrary_sLib_1 = (uint64_t)result;
  return result;
}

@end
