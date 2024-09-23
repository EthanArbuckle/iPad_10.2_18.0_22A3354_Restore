@implementation ALSharedAssetsdClient

void __ALSharedAssetsdClient_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PLAssetsdClient sharedSystemLibraryAssetsdClient](PLAssetsdClient, "sharedSystemLibraryAssetsdClient");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ALSharedAssetsdClient_assetsdClient;
  ALSharedAssetsdClient_assetsdClient = v0;

}

@end
