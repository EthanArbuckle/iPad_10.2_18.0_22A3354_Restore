@implementation CardKitLibrary

void *__CardKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CardKit.framework/CardKit", 2);
  CardKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
