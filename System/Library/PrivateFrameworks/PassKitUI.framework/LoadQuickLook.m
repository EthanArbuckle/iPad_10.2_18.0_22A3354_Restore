@implementation LoadQuickLook

void *__LoadQuickLook_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  LoadQuickLook_frameworkLibrary = (uint64_t)result;
  return result;
}

void *__LoadQuickLook_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  LoadQuickLook_frameworkLibrary_0 = (uint64_t)result;
  return result;
}

void *__LoadQuickLook_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  LoadQuickLook_frameworkLibrary_1 = (uint64_t)result;
  return result;
}

void *__LoadQuickLook_block_invoke_2()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  LoadQuickLook_frameworkLibrary_2 = (uint64_t)result;
  return result;
}

@end
