@implementation PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a3, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "px_isContentSyndicationAlbum");

  return v5;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a4, "assetCollection", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizationKeyByAddingMediaSpecificSuffix(CFSTR("PXPhotoKitAssetCollectionActionManagerActionTitle_ContentSyndicationRemoveSuggestion_"), objc_msgSend(v8, "count"), objc_msgSend(v5, "aggregateMediaType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v9, CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("trash");
}

+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "localizedTitleForUseCase:assetCollectionReference:withInputs:", 1, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v9, 0, v7, a5);
  return v10;
}

+ (id)_mediaSpecificMessageForKeyPrefix:(id)a3 forAssets:(id)a4
{
  void *v4;
  void *v5;

  PXLocalizationKeyByAddingMediaSpecificSuffixForAssets(a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)performUserInteractionTask
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
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
  _QWORD v20[5];
  id v21;
  id v22;

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventActualRemoveSuggestionBehavior");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Remove Suggestion Prevented"), CFSTR("Remove Suggestion is currently disabled via our internal settings (for debugging)."), 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v5);

    -[PXActionPerformer presentViewController:](self, "presentViewController:", v17);
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

  }
  else if (-[PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer shouldSkipUserConfirmation](self, "shouldSkipUserConfirmation"))
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    -[PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer _assetsFromAssetCollection](self, "_assetsFromAssetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v21 = 0;
    v7 = PXContentSyndicationRemoveConfirmationTitleAndMessageLocalizedStrings(v6, &v22, &v21);
    v8 = v22;
    v9 = v21;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __104__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performUserInteractionTask__block_invoke;
      v20[3] = &unk_1E5144530;
      v20[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v8, 2, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v12);

      v13 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __104__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performUserInteractionTask__block_invoke_2;
      v19[3] = &unk_1E5144530;
      v19[4] = self;
      objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v15);

      -[PXActionPerformer presentViewController:](self, "presentViewController:", v10);
    }
    else
    {
      PLUIGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Syndication Content Removal: Failed to retrieve alert confirmation information.", buf, 2u);
      }

      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
    }

  }
}

- (void)performBackgroundTask
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventActualRemoveSuggestionBehavior");

  if (v4)
  {
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    -[PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer _assetsFromAssetCollection](self, "_assetsFromAssetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke;
    v12[3] = &unk_1E5149198;
    v13 = v5;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke_2;
    v10[3] = &unk_1E5147B40;
    v10[4] = self;
    v11 = v13;
    v9 = v13;
    objc_msgSend(v7, "performChanges:completionHandler:", v12, v10);

  }
}

- (id)_assetsFromAssetCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CD1390];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetsInAssetCollection:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  return v9;
}

- (BOOL)shouldSkipUserConfirmation
{
  return self->_shouldSkipUserConfirmation;
}

- (void)setShouldSkipUserConfirmation:(BOOL)a3
{
  self->_shouldSkipUserConfirmation = a3;
}

uint64_t __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD13B0], "deleteAssets:", *(_QWORD *)(a1 + 32));
}

void __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, char a2, void *a3)
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
  v8[2] = __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke_3;
  v8[3] = &unk_1E513CB38;
  v11 = a2;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1)
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
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 56))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = *(id *)(a1 + 48);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v2)
    {
      v3 = v2;
      v14 = 0;
      v16 = *(_QWORD *)v18;
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
        if (*(_QWORD *)v18 != v16)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v10 = (void *)MEMORY[0x1E0D09910];
        v21[0] = v4;
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v5;
        v22[0] = v12;
        v22[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.syndicationSuggestionRemoved"), v13);

        if (!(v8 + v6))
          break;
        if (v3 == ++v6)
        {
          v14 += v6;
          v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
          if (v3)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

uint64_t __104__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __104__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

@end
