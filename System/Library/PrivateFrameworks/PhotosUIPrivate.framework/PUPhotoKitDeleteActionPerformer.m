@implementation PUPhotoKitDeleteActionPerformer

- (int64_t)destructivePhotosAction
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 945, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v11, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 945, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v11);
  }

LABEL_3:
  if (objc_msgSend(v6, "isTrashBin"))
    v7 = 6;
  else
    v7 = 5;

  return v7;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isTrashBin"))
    v7 = PXCanExpungeAssetFromAssetCollection();
  else
    v7 = 0;

  return v7;
}

@end
