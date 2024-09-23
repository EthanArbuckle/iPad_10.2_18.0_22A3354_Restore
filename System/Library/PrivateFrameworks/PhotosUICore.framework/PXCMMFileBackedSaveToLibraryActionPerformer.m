@implementation PXCMMFileBackedSaveToLibraryActionPerformer

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMActionPerformer session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    objc_msgSend(v7, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke;
    v18[3] = &unk_1E5142450;
    v19 = v3;
    v20 = v9;
    v11 = v9;
    objc_msgSend(v10, "enumerateItemIndexPathsUsingBlock:", v18);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2;
    v16[3] = &unk_1E5149198;
    v17 = v3;
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_133;
    v15[3] = &unk_1E5148B78;
    v15[4] = self;
    objc_msgSend(v12, "performChanges:completionHandler:", v16, v15);

  }
  else
  {
    PLSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "CMM File-backed save action triggered without any selected assets. This may indicate a UI logic bug", v14, 2u);
    }

    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  }

}

void __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v2, "assetAtItemIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

}

void __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAsset");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "mediaType") == 1)
        {
          objc_msgSend(v6, "url");
          v8 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addResourceWithType:fileURL:options:", 1, v8, 0);
        }
        else
        {
          PLSharingGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Non-photo resources aren't supported in this debug flow", v9, 2u);
          }
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

void __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_133(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to save assets with error: %@", buf, 0xCu);
    }

  }
  v6 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_134(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

@end
