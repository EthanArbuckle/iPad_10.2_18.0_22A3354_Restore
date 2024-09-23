@implementation PXPhotoKitShowActionsMenuAssetActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4;
  char v5;
  char v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "isPhotoIrisPlaceholder");
  v6 = objc_msgSend(v4, "canPerformSharingAction");

  return v6 | v5;
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  if (a3)
    return objc_msgSend(a3, "isPhotoIrisPlaceholder") ^ 1;
  else
    return 0;
}

@end
