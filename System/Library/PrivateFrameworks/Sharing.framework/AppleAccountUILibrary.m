@implementation AppleAccountUILibrary

void *__AppleAccountUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AppleAccountUI.framework/AppleAccountUI", 2);
  AppleAccountUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
