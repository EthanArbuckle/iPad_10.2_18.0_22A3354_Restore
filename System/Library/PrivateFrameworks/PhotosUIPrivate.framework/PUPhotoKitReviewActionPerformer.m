@implementation PUPhotoKitReviewActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  void *v6;

  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 1854, CFSTR("There can be only one asset in a Review action"));

  }
  -[PUPhotoKitReviewActionPerformer _enterReviewMode](self, "_enterReviewMode");
}

- (void)_enterReviewMode
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  PUAvalancheReviewControllerSpec *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PUAvalancheReviewController *v15;
  void *v16;
  id v17;

  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "pl_managedAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "burstIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 1862, CFSTR("Current asset must have an avalanche UUID"));

  }
  v7 = objc_alloc(MEMORY[0x1E0D715B8]);
  objc_msgSend(v5, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUID:photoLibrary:", v6, v8);

  v10 = objc_alloc_init(PUAvalancheReviewControllerSpec);
  -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pl_assetContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PUAvalancheReviewController initWithSpec:startingAtAsset:inAvalanche:currentAssetContainer:]([PUAvalancheReviewController alloc], "initWithSpec:startingAtAsset:inAvalanche:currentAssetContainer:", v10, v5, v9, v14);
  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v15), 0);

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if (objc_msgSend(a3, "representsBurst"))
    v6 = objc_msgSend(v5, "canShowAvalancheStacks");
  else
    v6 = 0;

  return v6;
}

@end
