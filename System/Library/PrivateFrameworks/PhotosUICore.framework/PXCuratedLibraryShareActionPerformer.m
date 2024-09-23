@implementation PXCuratedLibraryShareActionPerformer

- (id)activityType
{
  return (id)*MEMORY[0x1E0D96E20];
}

- (id)activitySystemImageName
{
  return CFSTR("square.and.arrow.up");
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  objc_msgSend(a4, "activityType", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryShareActionPerformer activityType](self, "activityType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  v9 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXStringEqualToString(activity.activityType, self.activityType)"));
LABEL_5:

  }
  return 1;
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXActivitySharingContext *v11;
  void *v12;
  void *v13;
  PXActivitySharingContext *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  id v35;
  _QWORD v36[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsDataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSourceForZoomLevel:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!objc_msgSend(v9, "containsAnyItems"))
      goto LABEL_9;
    v38 = 0u;
    v39 = 0u;
    -[PXCuratedLibraryAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "indexPathForAssetCollectionReference:", v10);
    }
    else
    {
      v38 = 0u;
      v39 = 0u;
    }

    if ((_QWORD)v38 == *(_QWORD *)off_1E50B7E98
      || objc_msgSend(v9, "numberOfItemsInSection:", *((_QWORD *)&v38 + 1)) < 1)
    {
LABEL_9:
      v6 = 0;
    }
    else
    {
      v36[0] = objc_msgSend(v9, "identifier");
      v36[1] = *((_QWORD *)&v38 + 1);
      v37 = xmmword_1A7C0C1F0;
      objc_msgSend(v9, "assetAtItemIndexPath:", v36);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v11 = [PXActivitySharingContext alloc];
  -[PXCuratedLibraryAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXActivitySharingContext initWithAssetCollection:assetsDataSource:](v11, "initWithAssetCollection:assetsDataSource:", v13, v9);

  -[PXActivitySharingContext setKeyAsset:](v14, "setKeyAsset:", v6);
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "zoomLevel");
  if ((unint64_t)(v16 - 1) >= 3)
    v17 = 0;
  else
    v17 = 14 - v16;
  -[PXActivitySharingContext setSourceOrigin:](v14, "setSourceOrigin:", v17);

  v41[0] = CFSTR("com.apple.Photos.activity.SlideShow");
  v41[1] = CFSTR("PUActivityTypeEditDateTime");
  v41[2] = CFSTR("PUActivityTypeEditLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivitySharingContext setExcludedActivityTypes:](v14, "setExcludedActivityTypes:", v18);

  -[PXActivitySharingContext excludedActivityTypes](v14, "excludedActivityTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("PUActivityTypeHide");
  v40[1] = CFSTR("PUActivityTypeDuplicate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivitySharingContext setExcludedActivityTypes:](v14, "setExcludedActivityTypes:", v21);

  v22 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v22, "px_sharePresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 450, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharePresentation"));

  }
  objc_msgSend(v23, "createActivitySharingControllerWithContext:", v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectInitialAssets");
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activitySharingController"));

  }
  objc_msgSend(v24, "activityViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 454, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController.activityViewController"), v30);
LABEL_22:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "px_descriptionForAssertionMessage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 454, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController.activityViewController"), v30, v32);

    goto LABEL_22;
  }
LABEL_19:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PXCuratedLibraryShareActionPerformer_performUserInteractionTask__block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v35 = v25;
  v26 = v25;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __66__PXCuratedLibraryShareActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

@end
