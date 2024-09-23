@implementation PLAssetExplorerGetLog

void __PLAssetExplorerGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.messages.asset-explorer", "AssetExplorer");
  v1 = (void *)PLAssetExplorerGetLog_log;
  PLAssetExplorerGetLog_log = (uint64_t)v0;

}

@end
