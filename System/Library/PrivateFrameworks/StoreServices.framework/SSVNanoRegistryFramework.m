@implementation SSVNanoRegistryFramework

void *__SSVNanoRegistryFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 1);
  SSVNanoRegistryFramework_sHandle = (uint64_t)result;
  return result;
}

@end
