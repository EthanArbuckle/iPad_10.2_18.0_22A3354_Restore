@implementation AppleMediaServicesLibrary

void *__AppleMediaServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleMediaServices.framework/AppleMediaServices", 2);
  AppleMediaServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
