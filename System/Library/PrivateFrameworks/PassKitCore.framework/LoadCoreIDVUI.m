@implementation LoadCoreIDVUI

void *__LoadCoreIDVUI_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreIDVUI.framework/CoreIDVUI", 2);
  LoadCoreIDVUI_frameworkLibrary = (uint64_t)result;
  return result;
}

void *__LoadCoreIDVUI_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreIDVUI.framework/CoreIDVUI", 2);
  LoadCoreIDVUI_frameworkLibrary_0 = (uint64_t)result;
  return result;
}

@end
