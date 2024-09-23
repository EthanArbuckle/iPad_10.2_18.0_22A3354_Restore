@implementation SSVBookAssetDaemonFramework

void *__SSVBookAssetDaemonFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/BookLibrary.framework/BookLibrary", 1);
  SSVBookAssetDaemonFramework_sHandle = (uint64_t)result;
  return result;
}

@end
