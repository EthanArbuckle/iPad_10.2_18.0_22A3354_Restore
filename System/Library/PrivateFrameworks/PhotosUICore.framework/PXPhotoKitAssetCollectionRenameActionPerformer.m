@implementation PXPhotoKitAssetCollectionRenameActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  char v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionRenameActionPerformer.m"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionRenameActionPerformer.m"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  v7 = objc_msgSend(v6, "canPerformEditOperation:", 7);

  return v7;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "assetCollection", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXCollectionRenameActionLocalizedTitle(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeRenameAlbum"), a5);
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("pencil");
}

- (void)performUserInteractionTask
{
  void *v4;
  _QWORD v5[6];

  +[PXContentSyndicationAssetSavingHelper assetSavingHelperFromAssetCollectionActionPerformer:](PXContentSyndicationAssetSavingHelper, "assetSavingHelperFromAssetCollectionActionPerformer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__PXPhotoKitAssetCollectionRenameActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E511CB38;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion:", v5);

}

- (void)_reallyPerformUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PXPhotoKitAssetCollectionRenameActionPerformer__reallyPerformUserInteractionTask__block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  PXCollectionRenameActionAlertController(v3, v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present asset collection rename alert"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

  }
}

uint64_t __83__PXPhotoKitAssetCollectionRenameActionPerformer__reallyPerformUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

void __76__PXPhotoKitAssetCollectionRenameActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    PLSyndicationUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Rename Album: Error processing unsaved syndicated assets: %@", (uint8_t *)&v14, 0xCu);

    }
    v11 = *(void **)(a1 + 32);
    v12 = v8;
    goto LABEL_5;
  }
  if (a2 < 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_reallyPerformUserInteractionTask");
    goto LABEL_10;
  }
  if (a2 == 4)
  {
    v11 = *(void **)(a1 + 32);
    v12 = 0;
LABEL_5:
    objc_msgSend(v11, "completeUserInteractionTaskWithSuccess:error:", 0, v12);
    goto LABEL_10;
  }
  if (a2 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXPhotoKitAssetCollectionRenameActionPerformer.m"), 55, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_10:

}

@end
