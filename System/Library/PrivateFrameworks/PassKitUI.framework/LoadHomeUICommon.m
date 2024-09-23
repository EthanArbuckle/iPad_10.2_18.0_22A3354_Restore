@implementation LoadHomeUICommon

void *__LoadHomeUICommon_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/HomeUICommon.framework/HomeUICommon", 2);
  LoadHomeUICommon_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
