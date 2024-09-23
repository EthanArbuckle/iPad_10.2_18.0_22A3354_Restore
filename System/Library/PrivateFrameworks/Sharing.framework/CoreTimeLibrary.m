@implementation CoreTimeLibrary

void *__CoreTimeLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreTime.framework/CoreTime", 2);
  CoreTimeLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreTimeLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreTime.framework/CoreTime", 2);
  CoreTimeLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
