@implementation PXPhotoKitCollectionListDeleteActionPerformer

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return objc_msgSend(a3, "canPerformEditOperation:", 6);
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return PXLocalizedStringFromTable(CFSTR("PXDeleteFolderActionName"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return CFSTR("trash");
}

- (void)performUserInteractionTask
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __75__PXPhotoKitCollectionListDeleteActionPerformer_performUserInteractionTask__block_invoke;
  v2[3] = &unk_1E5147360;
  v2[4] = self;
  -[PXPhotoKitCollectionListDeleteActionPerformer _promptDeleteConfirmationWithCompletionHandler:](self, "_promptDeleteConfirmationWithCompletionHandler:", v2);
}

- (void)_promptDeleteConfirmationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXCollectionDeletionAlertControllerForCollection(v5, 0, v6, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PXActionPerformer presentViewController:](self, "presentViewController:", v7);
}

void __75__PXPhotoKitCollectionListDeleteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  PXDeleteCollectionsAction *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "collectionList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXDeleteCollectionsAction initWithCollection:]([PXDeleteCollectionsAction alloc], "initWithCollection:", v4);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__PXPhotoKitCollectionListDeleteActionPerformer_performUserInteractionTask__block_invoke_2;
    v8[3] = &unk_1E5147B40;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v4;
    v7 = v4;
    -[PXAction executeWithUndoManager:completionHandler:](v6, "executeWithUndoManager:completionHandler:", v5, v8);

  }
  else
  {
    objc_msgSend(v3, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }
}

void __75__PXPhotoKitCollectionListDeleteActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, char a2, void *a3)
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
