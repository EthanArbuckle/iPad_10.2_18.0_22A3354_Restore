@implementation PXPhotoKitAssetCollectionPasteAssetsActionPerformer

+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v7;
  char v8;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  objc_msgSend(a4, "assetCollection", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionPasteAssetsActionPerformer.m"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v13);
LABEL_11:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionPasteAssetsActionPerformer.m"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v13, v15);

    goto LABEL_11;
  }
LABEL_3:
  if (!objc_msgSend(v7, "canPerformEditOperation:", 3)
    || (objc_msgSend(v7, "px_isRecentlyDeletedSmartAlbum") & 1) != 0
    || (objc_msgSend(v7, "px_isSharedAlbum") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "px_containsAssets");

  }
  return v8;
}

- (void)performBackgroundTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXAddAssetsToAssetCollectionAction *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  PXPhotoKitAssetCollectionPasteAssetsActionPerformer *v27;

  -[PXAssetCollectionActionPerformer dropTargetAssetReference](self, "dropTargetAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionPasteAssetsActionPerformer.m"), 41, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.dropTargetAssetReference.asset"), v17, v18);

    }
  }
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && ((unint64_t)objc_msgSend(v8, "count") > 1
     || objc_msgSend(v8, "count") == 1
     && (objc_msgSend(v8, "lastObject"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9 != v5)))
  {
    if ((objc_msgSend(v6, "canPerformEditOperation:", 3) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionPasteAssetsActionPerformer.m"), 47, CFSTR("Attempting to paste into a non-editable collection: %@"), v6);

    }
    v10 = -[PXAddAssetsToAssetCollectionAction initWithAssets:assetCollection:]([PXAddAssetsToAssetCollectionAction alloc], "initWithAssets:assetCollection:", v8, v6);
    -[PXAssetCollectionActionPerformer dropTargetAssetReference](self, "dropTargetAssetReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "px_descriptionForAssertionMessage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionPasteAssetsActionPerformer.m"), 49, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.dropTargetAssetReference.asset"), v22, v23);

      }
    }
    -[PXAddAssetsToAssetCollectionAction setDropTargetAsset:](v10, "setDropTargetAsset:", v12);

    -[PXActionPerformer undoManager](self, "undoManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76__PXPhotoKitAssetCollectionPasteAssetsActionPerformer_performBackgroundTask__block_invoke;
    v24[3] = &unk_1E5146AF0;
    v25 = v8;
    v26 = v6;
    v27 = self;
    -[PXAction executeWithUndoManager:completionHandler:](v10, "executeWithUndoManager:completionHandler:", v13, v24);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("PXPhotoKitAssetCollectionPasteAssetsActionPerformer did not complete successfully"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, v14);

  }
}

void __76__PXPhotoKitAssetCollectionPasteAssetsActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "failed adding assets to album: %@ %@ %@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "completeBackgroundTaskWithSuccess:error:", a2, v5);

}

@end
