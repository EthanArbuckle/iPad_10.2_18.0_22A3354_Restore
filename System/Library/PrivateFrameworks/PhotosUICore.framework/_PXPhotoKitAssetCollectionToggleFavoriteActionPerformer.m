@implementation _PXPhotoKitAssetCollectionToggleFavoriteActionPerformer

+ (BOOL)_targetFavoriteStateForAssetCollectionReference:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "px_isMemory"))
    v4 = objc_msgSend(v3, "isFavorite") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

@end
