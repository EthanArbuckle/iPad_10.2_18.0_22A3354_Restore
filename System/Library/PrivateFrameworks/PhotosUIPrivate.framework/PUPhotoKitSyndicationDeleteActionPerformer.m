@implementation PUPhotoKitSyndicationDeleteActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[16];
  _QWORD v19[5];
  _QWORD v20[7];

  objc_msgSend(MEMORY[0x1E0D7B2A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventActualRemoveSuggestionBehavior");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Remove Suggestion Prevented"), CFSTR("Remove Suggestion is currently disabled via our internal settings (for debugging)."), 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v5);

    -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v17);
    -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

  }
  else
  {
    -[PUAssetActionPerformer assets](self, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = 0;
    v20[6] = 0;
    v7 = PXContentSyndicationRemoveConfirmationTitleAndMessageLocalizedStrings();
    v8 = 0;
    v9 = 0;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __72__PUPhotoKitSyndicationDeleteActionPerformer_performUserInteractionTask__block_invoke;
      v20[3] = &unk_1E58A8DE8;
      v20[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v8, 2, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v12);

      v13 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __72__PUPhotoKitSyndicationDeleteActionPerformer_performUserInteractionTask__block_invoke_2;
      v19[3] = &unk_1E58A8DE8;
      v19[4] = self;
      objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v15);

      -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v10);
    }
    else
    {
      PLUIGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Syndication Content Removal: Failed to retrieve alert confirmation information.", buf, 2u);
      }

      -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
    }

  }
}

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  -[PUAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke;
  v10[3] = &unk_1E58ABD10;
  v11 = v3;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke_2;
  v8[3] = &unk_1E58AA020;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v5, "performChanges:completionHandler:", v10, v8);

}

- (int64_t)destructivePhotosAction
{
  return 0;
}

uint64_t __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD13B0], "deleteAssets:", *(_QWORD *)(a1 + 32));
}

void __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke_3;
  v8[3] = &unk_1E58A7B50;
  v11 = a2;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 56))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = *(id *)(a1 + 48);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v2)
    {
      v3 = v2;
      v14 = 0;
      v17 = *(_QWORD *)v19;
      v16 = *MEMORY[0x1E0D7BED8];
      v4 = *MEMORY[0x1E0D09830];
      v5 = *MEMORY[0x1E0D09828];
LABEL_4:
      v6 = 0;
      v7 = 9;
      if (v14 > 9)
        v7 = v14;
      v8 = v14 - v7;
      while (1)
      {
        if (*(_QWORD *)v19 != v17)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v10 = (void *)MEMORY[0x1E0D09910];
        v22[0] = v4;
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v5;
        v23[0] = v12;
        v23[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sendEvent:withPayload:", v16, v13);

        if (!(v8 + v6))
          break;
        if (v3 == ++v6)
        {
          v14 += v6;
          v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          if (v3)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

uint64_t __72__PUPhotoKitSyndicationDeleteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __72__PUPhotoKitSyndicationDeleteActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isSyndicatedAsset");
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isSyndicatedAsset");
}

@end
