@implementation QuickLookLibrary

void *__QuickLookLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  QuickLookLibrary_sLib = (uint64_t)result;
  return result;
}

void *__QuickLookLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  QuickLookLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__QuickLookLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  QuickLookLibrary_sLib_1 = (uint64_t)result;
  return result;
}

void *__QuickLookLibrary_block_invoke_2()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  QuickLookLibrary_sLib_2 = (uint64_t)result;
  return result;
}

@end
