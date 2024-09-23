@implementation PXPhotoKitCMMSaveToLibraryActionPerformer

- (void)performBackgroundTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2345, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2345, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v9, v11);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PXPhotoKitCMMSaveToLibraryActionPerformer_performBackgroundTask__block_invoke;
  v12[3] = &unk_1E5148B78;
  v12[4] = self;
  PXMomentShareSaveAllAssetsToLibrary(v6, v5, v12);

}

uint64_t __66__PXPhotoKitCMMSaveToLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  char v7;
  BOOL v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
    goto LABEL_9;
  }
  v5 = v4;

  if (!v5)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v10 = 0;
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PXMomentSharesSupportsSavingAssetsToLibrary(v6, &v10, 0);
  if (v10)
    v8 = v7;
  else
    v8 = 0;

LABEL_10:
  return v8;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "assetCollection", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
    goto LABEL_8;
  }
  v6 = v5;

  if (!v6)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v11 = 0;
  v12 = 0;
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PXMomentSharesSupportsSavingAssetsToLibrary(v7, &v12, &v11);

  v9 = 0;
  if (v8)
  {
    if (v12)
      PXMenuItemTitleForSavingMomentShareAssetsToLibrary(v12, v11);
    else
      PXLocalizedStringFromTable(CFSTR("PXCMMSaveToLibraryActionMenuTitle"), CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v9;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("link.icloud");
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeCopyExistingLink"), CFSTR("link.icloud"));
}

@end
