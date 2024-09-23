@implementation PUPXPhotoKitRemoveStacksActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allItemsEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    PXMap();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 45998, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "Failed to remove stacks from assets: %{public}@ assetUUIDs: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

  }
  else
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }

}

uint64_t __69__PUPXPhotoKitRemoveStacksActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D7B8B0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canShowInternalUI");

  if (!v11)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0D7B7F8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "enableStacksReviewUI");

  if (!v13)
    goto LABEL_5;
  objc_msgSend(v7, "selectedIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 >= 1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __94__PUPXPhotoKitRemoveStacksActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v18[3] = &unk_1E58A3C50;
    v18[4] = &v19;
    objc_msgSend(v7, "enumerateSelectedObjectsUsingBlock:", v18);
    v16 = *((_BYTE *)v20 + 24) != 0;
    _Block_object_dispose(&v19, 8);
  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return CFSTR("(Internal) Remove Stacks");
}

void __94__PUPXPhotoKitRemoveStacksActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v8;
  else
    v5 = 0;

  objc_msgSend(v5, "burstIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "pl_managedAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "avalancheKind") == 2)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }

  }
}

@end
