@implementation PUAssetExplorerReviewScreenDisableLivePhotoActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4;
  char v5;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EEC561A8))
    v5 = objc_msgSend(v4, "isLivePhoto");
  else
    v5 = objc_msgSend(v4, "playbackStyle") == 3;

  return v5;
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end
