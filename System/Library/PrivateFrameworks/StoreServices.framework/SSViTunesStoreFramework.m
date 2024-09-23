@implementation SSViTunesStoreFramework

void *__SSViTunesStoreFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/iTunesStore.framework/iTunesStore", 1);
  SSViTunesStoreFramework_sHandle = (uint64_t)result;
  return result;
}

@end
