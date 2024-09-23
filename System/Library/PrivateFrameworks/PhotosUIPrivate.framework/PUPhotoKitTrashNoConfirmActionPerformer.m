@implementation PUPhotoKitTrashNoConfirmActionPerformer

- (int64_t)destructivePhotosAction
{
  return 1;
}

- (BOOL)shouldConfirmDestructiveAction
{
  return 0;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return _PUCanTrashAssetFromAssetCollection(a3, a4);
}

@end
