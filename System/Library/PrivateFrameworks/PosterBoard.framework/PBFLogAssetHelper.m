@implementation PBFLogAssetHelper

void __PBFLogAssetHelper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "AssetHelper");
  v1 = (void *)PBFLogAssetHelper___logObj;
  PBFLogAssetHelper___logObj = (uint64_t)v0;

}

@end
