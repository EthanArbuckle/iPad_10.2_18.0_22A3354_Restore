@implementation PXPhotoKitRemoveSharingSuggestionAssetCollectionActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "assetCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "px_isSharedLibrarySharingSuggestionsSmartAlbum") & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v7, "px_isSharedLibrarySharingSuggestion");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v5;
  int v6;
  __CFString *v7;

  objc_msgSend(a4, "assetCollection", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "px_isSharedLibrarySharingSuggestionsSmartAlbum");

  if (v6)
    v7 = CFSTR("PXSharedLibrary_Action_RemoveAllSharingSuggestions");
  else
    v7 = CFSTR("PXSharedLibrary_Action_RemoveThisSharingSuggestion");
  return PXLocalizedSharedLibraryString(v7);
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("minus.circle");
}

+ (BOOL)isActionDestructive
{
  return 1;
}

- (void)performBackgroundTask
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  PXRemoveLibrarySharingSuggestionAction *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "Attempting remove sharing suggestions. Calling PXSharedLibraryRemoveSharingSuggestions()", buf, 2u);
  }

  -[PXAssetCollectionActionPerformer assetsDataSource](self, "assetsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "allItemsEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:
      v7 = -[PXAssetsAction initWithAssets:]([PXRemoveLibrarySharingSuggestionAction alloc], "initWithAssets:", v6);
      -[PXActionPerformer undoManager](self, "undoManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __88__PXPhotoKitRemoveSharingSuggestionAssetCollectionActionPerformer_performBackgroundTask__block_invoke;
      v12[3] = &unk_1E5148B78;
      v12[4] = self;
      -[PXAction executeWithUndoManager:completionHandler:](v7, "executeWithUndoManager:completionHandler:", v8, v12);

      goto LABEL_10;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CD1390];
    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchAssetsInAssetCollection:options:", v10, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
  }
  PXAssertGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1A6789000, v11, OS_LOG_TYPE_FAULT, "Unable to retrieve sharing suggestions to remove", buf, 2u);
  }

  -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, 0);
LABEL_10:

}

uint64_t __88__PXPhotoKitRemoveSharingSuggestionAssetCollectionActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

@end
