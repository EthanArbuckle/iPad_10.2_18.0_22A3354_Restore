@implementation PUPhotoKitSlideShowActionPerformer

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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 1889, CFSTR("There can be only one asset when starting a SlideShow action"));

  }
  -[PUPhotoKitSlideShowActionPerformer _startSlideshow](self, "_startSlideshow");
}

- (void)_startSlideshow
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PUSlideshowSession *v13;
  PUSlideshowViewController *v14;
  _BOOL8 v15;
  void *v16;
  id v17;

  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoKitActionPerformer photosDataSource](self, "photosDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 1899, CFSTR("Share performer should have a photosDataSource set."));

  }
  objc_msgSend(v8, "indexPathForAsset:inCollection:", v17, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(v9, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetsStartingAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PUSlideshowSession initWithFetchResult:assetCollection:startIndex:]([PUSlideshowSession alloc], "initWithFetchResult:assetCollection:startIndex:", v12, v7, objc_msgSend(v10, "item"));
    v14 = -[PUSlideshowViewController initWithSession:]([PUSlideshowViewController alloc], "initWithSession:", v13);
    v15 = -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v14);

  }
  else
  {
    v15 = 0;
  }
  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v15, 0);

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end
