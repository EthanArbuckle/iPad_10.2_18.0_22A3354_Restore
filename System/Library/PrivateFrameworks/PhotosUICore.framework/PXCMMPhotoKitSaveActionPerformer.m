@implementation PXCMMPhotoKitSaveActionPerformer

- (id)createActionProgress
{
  return 0;
}

- (BOOL)isCancellable
{
  return 0;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  PXCMMPhotoKitSaveActionPerformer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXCMMActionPerformer session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allItemsEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "importSessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__PXCMMPhotoKitSaveActionPerformer_performUserInteractionTask__block_invoke;
    v11[3] = &unk_1E5148B78;
    v11[4] = self;
    PXMomentShareSaveAssetsToLibrary(v7, 1, v8, v9, v11);

  }
  else
  {
    PLSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = objc_opt_class();
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "<%@:%p> Failed to perform action: Selection contained no assets to save", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Selection contained no assets to save"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v8);
  }

}

uint64_t __62__PXCMMPhotoKitSaveActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

@end
