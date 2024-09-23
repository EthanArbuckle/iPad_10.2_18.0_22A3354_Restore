@implementation PUPXSharePresentation

- (id)createActivitySharingControllerWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB36B8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[PUPXSharePresentation createActivitySharingControllerWithContext:selectedAssetIndexSet:](self, "createActivitySharingControllerWithContext:selectedAssetIndexSet:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createActivitySharingControllerWithContext:(id)a3 selectedAssetIndexSet:(id)a4
{
  id v5;
  id v6;
  PUPhotoSelectionManager *v7;
  void *v8;
  void *v9;
  void *v10;
  PUActivitySharingConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PUActivitySharingController *v20;

  v5 = a3;
  v6 = a4;
  v7 = -[PUPhotoSelectionManager initWithOptions:]([PUPhotoSelectionManager alloc], "initWithOptions:", 0);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "assetCollectionsFetchResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoSelectionManager selectAssetsAtIndexes:inAssetCollection:](v7, "selectAssetsAtIndexes:inAssetCollection:", v6, v9);

  }
  objc_msgSend(v5, "assetCollectionsFetchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUActivitySharingConfiguration initWithCollectionsFetchResult:selectionManager:]([PUActivitySharingConfiguration alloc], "initWithCollectionsFetchResult:selectionManager:", v10, v7);
  objc_msgSend(v5, "activities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setActivities:](v11, "setActivities:", v12);

  objc_msgSend(v5, "excludedActivityTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setExcludedActivityTypes:](v11, "setExcludedActivityTypes:", v13);

  -[PUActivitySharingConfiguration setWantsActionSheet:](v11, "setWantsActionSheet:", objc_msgSend(v5, "wantsActionSheet"));
  if (objc_msgSend(v5, "excludeShareActivity"))
  {
    -[PUActivitySharingConfiguration setExcludeShareActivity:](v11, "setExcludeShareActivity:", 1);
  }
  else
  {
    objc_msgSend(v5, "photosDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivitySharingConfiguration setExcludeShareActivity:](v11, "setExcludeShareActivity:", objc_msgSend(v14, "isEmpty"));

  }
  objc_msgSend(v5, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setTitle:](v11, "setTitle:", v15);

  objc_msgSend(v5, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setSubtitle:](v11, "setSubtitle:", v16);

  objc_msgSend(v5, "keyAsset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setKeyAsset:](v11, "setKeyAsset:", v17);

  objc_msgSend(v5, "person");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setPerson:](v11, "setPerson:", v18);

  -[PUActivitySharingConfiguration setSourceOrigin:](v11, "setSourceOrigin:", objc_msgSend(v5, "sourceOrigin"));
  objc_msgSend(v5, "photosDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setPhotosDataSource:](v11, "setPhotosDataSource:", v19);

  v20 = -[PUActivitySharingController initWithActivitySharingConfiguration:]([PUActivitySharingController alloc], "initWithActivitySharingConfiguration:", v11);
  return v20;
}

- (id)defaultActivityTypeOrder
{
  return +[PUActivityViewController defaultActivityTypeOrder](PUActivityViewController, "defaultActivityTypeOrder");
}

@end
