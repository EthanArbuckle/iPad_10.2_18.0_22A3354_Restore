@implementation LoadNanoRegistry

void *__LoadNanoRegistry_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
  qword_1ECF22068 = (uint64_t)result;
  return result;
}

@end
