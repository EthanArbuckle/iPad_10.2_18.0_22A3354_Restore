@implementation PUPXPhotoKitAddStacksActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }
  else
  {
    PXMap();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 45998, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_INFO, "Failed to create stack from assets: %{public}@ assetUUIDs: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v5);

  }
}

uint64_t __66__PUPXPhotoKitAddStacksActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D7B8B0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canShowInternalUI");

  if (v7
    && (objc_msgSend(MEMORY[0x1E0D7B7F8], "sharedInstance"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "enableStacksReviewUI"),
        v8,
        v9))
  {
    objc_msgSend(v5, "selectedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") > 1;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return CFSTR("(Internal) Add Stacks");
}

@end
