@implementation PXPhotoKitSyndicationSaveToLibraryActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  if (a3)
    return objc_msgSend(a3, "px_isUnsavedSyndicatedAsset");
  else
    return 0;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a4;
  objc_msgSend(v4, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allItemsEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v4, "presentationSource");

  if (v8 == 1)
  {
    v10 = PXMediaTypeForAssets();
    if (v9)
    {
      v11 = CFSTR("PXContentSyndicationSaveToPhotosPhotoTitle");
      v12 = CFSTR("PXContentSyndicationSaveToPhotosVideoTitle");
      v13 = CFSTR("PXContentSyndicationSaveToPhotosItemTitle");
    }
    else
    {
      v11 = CFSTR("PXContentSyndicationSaveOnePhotoTitle");
      v12 = CFSTR("PXContentSyndicationSaveOneVideoTitle");
      v13 = CFSTR("PXContentSyndicationSaveOneItemTitle");
    }
    PXLocalizationKeyForMediaType(v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v14, CFSTR("PhotosUICore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXFilter();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = PXMediaTypeForAssets();
    v16 = v15;
    if (v9)
    {
      PXLocalizationKeyForMediaType(v15, CFSTR("PXContentSyndicationSaveToPhotosPhotoTitle"), CFSTR("PXContentSyndicationSaveToPhotosVideoTitle"), CFSTR("PXContentSyndicationSaveToPhotosItemTitle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(v17, CFSTR("PhotosUICore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v14, "count");
      PXLocalizationKeyForMediaType(v16, CFSTR("PXContentSyndicationSaveNumberOfPhotosTitle"), CFSTR("PXContentSyndicationSaveNumberOfVideosTitle"), CFSTR("PXContentSyndicationSaveNumberOfItemsTitle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(v17, CFSTR("PhotosUICore"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v18;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("square.and.arrow.down");
}

uint64_t __92__PXPhotoKitSyndicationSaveToLibraryActionPerformer_localizedTitleForUseCase_actionManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isUnsavedSyndicatedAsset");
}

- (void)performUserInteractionTask
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventActualSaveToLibraryBehavior");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Save to Library Prevented"), CFSTR("Saving to Library is currently disabled via our internal settings (for debugging)."), 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v5);

    -[PXActionPerformer presentViewController:](self, "presentViewController:", v10);
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

  }
  else
  {
    PLSyndicationUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PXPhotoKitAssetActionPerformer assets](self, "assets");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v13 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "SyndicationSaveActionPerformer: Ensuring all %lu unsaved assets are available locally...", buf, 0xCu);

    }
    PXCreateDefaultAssetSharingHelper(self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionPerformer assets](self, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke;
    v11[3] = &unk_1E5147360;
    v11[4] = self;
    objc_msgSend(v8, "ensureLocalAssetsForSyndicationSave:completion:", v9, v11);

  }
}

- (void)performBackgroundTask
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PXPhotoKitSyndicationSaveToLibraryActionPerformer *v11;
  _QWORD v12[4];
  id v13;

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventActualSaveToLibraryBehavior");

  if (v4)
  {
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    -[PXPhotoKitAssetActionPerformer assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke;
    v12[3] = &unk_1E5149198;
    v13 = v5;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_163;
    v9[3] = &unk_1E5147B40;
    v10 = v13;
    v11 = self;
    v8 = v13;
    objc_msgSend(v6, "performChanges:completionHandler:", v12, v9);

  }
}

- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4
{
  return -[PXActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, a5);
}

void __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        PLSyndicationUIGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "uuid");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v15 = v8;
          v16 = 2112;
          v17 = v6;
          _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "SyndicationSaveActionPerformer: Saving asset (%{public}@): %@", buf, 0x16u);

        }
        v9 = (id)objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetFromGuestAsset:", v6);
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
    }
    while (v3);
  }

}

void __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_163(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2;
  v7[3] = &unk_1E513CB38;
  v11 = a2;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 40);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 56);
  PLSyndicationUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v35 = v5;
    v6 = "SyndicationSaveActionPerformer: All %ld assets saved";
    v7 = v4;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v35 = v10;
    v36 = 2112;
    v37 = v11;
    v6 = "SyndicationSaveActionPerformer: All %ld assets did not save. Error: %@";
    v7 = v4;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 22;
  }
  _os_log_impl(&dword_1A6789000, v7, v8, v6, buf, v9);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 48), "completeBackgroundTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 56))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = *(id *)(a1 + 32);
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v12)
    {
      v13 = v12;
      v25 = 0;
      v14 = *(_QWORD *)v28;
      v15 = *MEMORY[0x1E0D09830];
      v16 = *MEMORY[0x1E0D09828];
LABEL_10:
      v17 = 0;
      v18 = 9;
      if (v25 > 9)
        v18 = v25;
      v19 = v25 - v18;
      while (1)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
        v21 = (void *)MEMORY[0x1E0D09910];
        v31[0] = v15;
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v16;
        v32[0] = v23;
        v32[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.syndicatedAssetsSaved"), v24);

        if (!(v19 + v17))
          break;
        if (v13 == ++v17)
        {
          v25 += v17;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
          if (v13)
            goto LABEL_10;
          break;
        }
      }
    }

  }
}

uint64_t __79__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLSyndicationUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if ((_DWORD)a2)
      v5 = CFSTR("YES");
    v6 = v5;
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "SyndicationSaveActionPerformer: Unsaved assets were all made locally available: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, 0);
}

@end
