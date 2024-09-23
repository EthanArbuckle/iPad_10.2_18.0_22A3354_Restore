@implementation PLSearchUIAssetCurationGetLog

void __PLSearchUIAssetCurationGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui.search", "SearchUIAssetCuration");
  v1 = (void *)PLSearchUIAssetCurationGetLog_log;
  PLSearchUIAssetCurationGetLog_log = (uint64_t)v0;

}

@end
