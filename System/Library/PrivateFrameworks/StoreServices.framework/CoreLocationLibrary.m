@implementation CoreLocationLibrary

void *__CoreLocationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreLocation.framework/CoreLocation", 2);
  CoreLocationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
