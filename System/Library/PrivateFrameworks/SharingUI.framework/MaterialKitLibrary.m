@implementation MaterialKitLibrary

void *__MaterialKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MaterialKit.framework/MaterialKit", 2);
  MaterialKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
