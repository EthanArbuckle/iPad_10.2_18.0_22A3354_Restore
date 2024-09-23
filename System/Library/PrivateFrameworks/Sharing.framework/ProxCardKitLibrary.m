@implementation ProxCardKitLibrary

void *__ProxCardKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ProxCardKit.framework/ProxCardKit", 2);
  ProxCardKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
