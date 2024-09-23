@implementation PXPhotosGridShareActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a4;
  if (objc_msgSend(v4, "allowsShareAllAction"))
  {
    objc_msgSend(v4, "currentDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsAnyItems");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D96E20];
}

- (id)activitySystemImageName
{
  return CFSTR("square.and.arrow.up");
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridsSharePhotos"), CFSTR("PhotosUICore"));
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  PXActivitySharingContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "containerCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canContainAssets");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridShareActionPerformer.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource.containerCollection.canContainAssets"));

  }
  objc_msgSend(v5, "containerCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer hostViewController](self, "hostViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXActivitySharingContext initWithAssetCollection:assetsDataSource:]([PXActivitySharingContext alloc], "initWithAssetCollection:assetsDataSource:", v8, v5);
  objc_msgSend(v5, "keyAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivitySharingContext setKeyAsset:](v10, "setKeyAsset:", v11);

  -[PXActivitySharingContext setSourceOrigin:](v10, "setSourceOrigin:", 3);
  v28[0] = CFSTR("com.apple.Photos.activity.SlideShow");
  v28[1] = CFSTR("PUActivityTypeEditDateTime");
  v28[2] = CFSTR("PUActivityTypeEditLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivitySharingContext setExcludedActivityTypes:](v10, "setExcludedActivityTypes:", v12);

  -[PXActivitySharingContext excludedActivityTypes](v10, "excludedActivityTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("PUActivityTypeHide");
  v27[1] = CFSTR("PUActivityTypeDuplicate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivitySharingContext setExcludedActivityTypes:](v10, "setExcludedActivityTypes:", v15);

  objc_msgSend(v9, "px_sharePresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridShareActionPerformer.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharePresentation"));

  }
  objc_msgSend(v16, "createActivitySharingControllerWithContext:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selectInitialAssets");
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridShareActionPerformer.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activitySharingController"));

  }
  objc_msgSend(v17, "activityViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridShareActionPerformer.m"), 75, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController.activityViewController"), v23);
LABEL_12:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "px_descriptionForAssertionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridShareActionPerformer.m"), 75, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController.activityViewController"), v23, v25);

    goto LABEL_12;
  }
LABEL_9:
  objc_msgSend(v9, "presentViewController:animated:completion:", v18, 1, 0);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

@end
