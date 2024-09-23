@implementation PUPhotoKitRevealInMomentActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4;
  int v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isHidden") & 1) != 0
    || (objc_msgSend(v4, "isTrashed") & 1) != 0
    || (objc_msgSend(v4, "isCloudSharedAsset") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "px_isSyndicatedAsset") ^ 1;
  }

  return v5;
}

@end
