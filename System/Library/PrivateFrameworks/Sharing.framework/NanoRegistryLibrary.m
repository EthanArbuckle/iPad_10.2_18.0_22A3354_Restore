@implementation NanoRegistryLibrary

void *__NanoRegistryLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
  NanoRegistryLibrary_sLib = (uint64_t)result;
  return result;
}

@end
