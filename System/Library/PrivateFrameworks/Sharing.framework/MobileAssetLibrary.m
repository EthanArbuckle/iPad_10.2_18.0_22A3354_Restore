@implementation MobileAssetLibrary

void *__MobileAssetLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset", 2);
  MobileAssetLibrary_sLib = (uint64_t)result;
  return result;
}

@end
