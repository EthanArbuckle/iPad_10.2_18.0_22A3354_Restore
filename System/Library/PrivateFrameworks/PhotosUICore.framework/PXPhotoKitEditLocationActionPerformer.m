@implementation PXPhotoKitEditLocationActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6;
  int v7;

  v6 = a3;
  if (objc_msgSend(v6, "canPerformEditOperation:", 3) && !objc_msgSend(v6, "isTrashed"))
  {
    LOBYTE(v7) = 1;
  }
  else if (objc_msgSend(v6, "px_isUnsavedSyndicatedAsset"))
  {
    v7 = objc_msgSend(v6, "px_isSyndicationPhotoLibraryAsset") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(CFSTR("PXAdjustLocationActionName"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("mappin.circle");
}

- (void)_presentLocationEditViewControllerWithAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __86__PXPhotoKitEditLocationActionPerformer__presentLocationEditViewControllerWithAssets___block_invoke;
  v12 = &unk_1E5142510;
  objc_copyWeak(&v13, &location);
  +[PXPhotosDetailsLocationSearchUIFactory searchViewControllerWithAssets:delegate:completion:](PXPhotosDetailsLocationSearchUIFactory, "searchViewControllerWithAssets:delegate:completion:", v6, self, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v7, v9, v10, v11, v12))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present Edit Location view controller"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v8);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PXPhotoKitEditLocationActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5142AD8;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)locationSearchDataSource:(id)a3 didSelectLocationSearchResult:(id)a4
{
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (void)locationSearchDataSourceDidRemoveLocation:(id)a3
{
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

void __67__PXPhotoKitEditLocationActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "count");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7)
    objc_msgSend(WeakRetained, "_presentLocationEditViewControllerWithAssets:", v10);
  else
    objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

}

void __86__PXPhotoKitEditLocationActionPerformer__presentLocationEditViewControllerWithAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", a2, 0);

}

@end
