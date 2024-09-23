@implementation PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer

void __82___PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLMemoriesGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(unsigned __int8 *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      v19 = 67109378;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Did favorite: %d, memory: %@", (uint8_t *)&v19, 0x12u);
    }

    +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didFavoriteMemory");

    v11 = (void *)MEMORY[0x1E0D09910];
    if (*(_BYTE *)(a1 + 48))
      v12 = CFSTR("com.apple.photos.CPAnalytics.assetCollectionFavorited");
    else
      v12 = CFSTR("com.apple.photos.CPAnalytics.assetCollectionUnfavorited");
    v13 = *MEMORY[0x1E0D09818];
    v26[0] = *(_QWORD *)(a1 + 32);
    v14 = *MEMORY[0x1E0D09830];
    v25[0] = v13;
    v25[1] = v14;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v7 = objc_claimAutoreleasedReturnValue();
    v26[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:withPayload:", v12, v16);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v17 = *(unsigned __int8 *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 32);
    v19 = 67109634;
    v20 = v17;
    v21 = 2112;
    v22 = v18;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to favorite: %d, memory: %@, error: %@", (uint8_t *)&v19, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 40), "completeBackgroundTaskWithSuccess:error:", a2, v5);
}

void __87___PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Abstract Favorite: Error processing unsaved syndicated assets: %@", (uint8_t *)&v15, 0xCu);

    }
    v11 = *(void **)(a1 + 32);
    v12 = 0;
    v13 = v8;
    goto LABEL_12;
  }
  if (a2 < 3)
  {
    v11 = *(void **)(a1 + 32);
    v12 = 1;
LABEL_11:
    v13 = 0;
LABEL_12:
    objc_msgSend(v11, "completeUserInteractionTaskWithSuccess:error:", v12, v13);
    goto LABEL_13;
  }
  if (a2 == 4)
  {
    v11 = *(void **)(a1 + 32);
    v12 = 0;
    goto LABEL_11;
  }
  if (a2 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 987, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_13:

}

@end
