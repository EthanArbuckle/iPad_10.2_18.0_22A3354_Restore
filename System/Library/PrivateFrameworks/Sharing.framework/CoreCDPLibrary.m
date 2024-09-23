@implementation CoreCDPLibrary

void *__CoreCDPLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreCDP.framework/CoreCDP", 2);
  CoreCDPLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreCDPLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreCDP.framework/CoreCDP", 2);
  CoreCDPLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__CoreCDPLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreCDP.framework/CoreCDP", 2);
  CoreCDPLibrary_sLib_1 = (uint64_t)result;
  return result;
}

@end
