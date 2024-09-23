@implementation PUPhotoKitRestoreActionPerformer

- (int64_t)destructivePhotosAction
{
  return 3;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a4, "isTrashBin", a3);
}

@end
