@implementation ActionKitLibrary

void *__ActionKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ActionKit.framework/ActionKit", 2);
  ActionKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
