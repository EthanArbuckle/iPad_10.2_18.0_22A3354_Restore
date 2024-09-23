@implementation PassKitLibrary

void *__PassKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKit.framework/PassKit", 2);
  PassKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
