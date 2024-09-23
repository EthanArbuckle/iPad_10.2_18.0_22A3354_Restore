@implementation PXPhotoKitAssetCollectionDeleteActionPerformer

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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionDeleteActionPerformer.m"), 28, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v11);
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionDeleteActionPerformer.m"), 28, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  v7 = objc_msgSend(v6, "canPerformEditOperation:", 6);

  return v7;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;

  v7 = a4;
  PXLocalizedStringFromTable(CFSTR("PXAssetCollectionDeleteAlbumActionMenuTitle"), CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v7, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionDeleteActionPerformer.m"), 74, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v16);
LABEL_10:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionDeleteActionPerformer.m"), 74, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v16, v18);

    goto LABEL_10;
  }
LABEL_4:
  if ((objc_msgSend(v11, "isOwned") & 1) == 0)
  {
    PXLocalizedStringFromTable(CFSTR("PXAssetCollectionUnsubscribeSharedAlbumActionMenuTitle"), CFSTR("PhotosUICore"));
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }

LABEL_7:
  return v8;
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  const __CFString *v9;
  void *v10;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v6 = a3;
  objc_msgSend(v6, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v9 = CFSTR("trash");
  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v6, "assetCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionDeleteActionPerformer.m"), 91, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v14);
LABEL_10:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionDeleteActionPerformer.m"), 91, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v14, v16);

    goto LABEL_10;
  }
LABEL_4:
  if (!objc_msgSend(v10, "isOwned"))
    v9 = CFSTR("minus.circle");

LABEL_7:
  return (id)v9;
}

- (void)performUserInteractionTask
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __76__PXPhotoKitAssetCollectionDeleteActionPerformer_performUserInteractionTask__block_invoke;
  v2[3] = &unk_1E5147360;
  v2[4] = self;
  -[PXPhotoKitAssetCollectionDeleteActionPerformer _promptDeleteConfirmationWithCompletionHandler:](self, "_promptDeleteConfirmationWithCompletionHandler:", v2);
}

- (void)_promptDeleteConfirmationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXCollectionDeletionAlertControllerForCollection(v5, 0, v6, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PXActionPerformer presentViewController:](self, "presentViewController:", v7);
}

void __76__PXPhotoKitAssetCollectionDeleteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  PXDeleteCollectionsAction *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "assetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXDeleteCollectionsAction initWithCollection:]([PXDeleteCollectionsAction alloc], "initWithCollection:", v4);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__PXPhotoKitAssetCollectionDeleteActionPerformer_performUserInteractionTask__block_invoke_2;
    v10[3] = &unk_1E5147B40;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v4;
    v7 = v4;
    -[PXAction executeWithUndoManager:completionHandler:](v6, "executeWithUndoManager:completionHandler:", v5, v10);
    PLSAggregateDictionaryAddValueForScalarKey();
    v8 = (void *)MEMORY[0x1E0D09910];
    v12 = *MEMORY[0x1E0D09818];
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.albumDeleted"), v9);

  }
  else
  {
    objc_msgSend(v3, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }
}

void __76__PXPhotoKitAssetCollectionDeleteActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, v5);
    PLUIActionsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to delete collection %{public}@ with error %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

@end
