@implementation LoadNanoRegistry

void *__LoadNanoRegistry_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
  _MergedGlobals_9_1 = (uint64_t)result;
  return result;
}

@end
