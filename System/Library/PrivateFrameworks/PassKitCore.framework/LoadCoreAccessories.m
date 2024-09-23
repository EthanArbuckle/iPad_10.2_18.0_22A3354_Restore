@implementation LoadCoreAccessories

void *__LoadCoreAccessories_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreAccessories.framework/CoreAccessories", 2);
  LoadCoreAccessories_frameworkLibrary = (uint64_t)result;
  return result;
}

void *__LoadCoreAccessories_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreAccessories.framework/CoreAccessories", 2);
  qword_1EE1C5650 = (uint64_t)result;
  return result;
}

@end
