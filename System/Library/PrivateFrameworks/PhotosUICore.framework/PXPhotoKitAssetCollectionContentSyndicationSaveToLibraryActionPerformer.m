@implementation PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "px_isContentSyndicationAlbum"))
  {
    v9 = 0;
    goto LABEL_6;
  }
  v7 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer.m"), 53, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v13);
LABEL_9:

    goto LABEL_4;
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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer.m"), 53, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v13, v15);

    goto LABEL_9;
  }
LABEL_4:
  PXContentSyndicationUnsavedSyndicatedAssetsInAssetCollection(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") != 0;

LABEL_6:
  return v9;
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
  PXLocalizationKeyByAddingMediaSpecificSuffix(CFSTR("PXPhotoKitAssetCollectionActionManagerPreviewActionTitle_ContentSyndicationSaveToLibrary_"), objc_msgSend(v8, "count"), objc_msgSend(v5, "aggregateMediaType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v9, CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("square.and.arrow.down");
}

+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  objc_msgSend(a1, "systemImageNameForAssetCollectionReference:withInputs:", a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithBaselineOffsetFromBottom:", 5.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v11, 0, v8, a5);
  return v12;
}

- (void)performUserInteractionTask
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventActualSaveToLibraryBehavior");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Save to Library Prevented"), CFSTR("Saving to Library is currently disabled via our internal settings (for debugging)."), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __101__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke;
    v14[3] = &unk_1E5144530;
    v14[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v6);

    -[PXActionPerformer presentViewController:](self, "presentViewController:", v5);
  }
  else
  {
    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PXContentSyndicationUnsavedSyndicatedAssetsInAssetCollection(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLSyndicationUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "AssetCollectionContentSyndicationSaveToLibraryAction: Ensuring all %lu unsaved assets are available locally...", buf, 0xCu);
    }

    PXCreateDefaultAssetSharingHelper(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchedObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __101__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke_156;
    v12[3] = &unk_1E5144558;
    v12[4] = self;
    v13 = v7;
    v11 = v7;
    objc_msgSend(v9, "ensureLocalAssetsForSyndicationSave:completion:", v10, v12);

  }
}

- (void)_handleCompletionForExpectedUUIDs:(id)a3 photoLibrary:(id)a4 success:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  PHFetchResult *v16;
  PHFetchResult *savedAssetsFetchResult;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  PHFetchResult *obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _BYTE v45[128];
  uint64_t v46;

  v7 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  PLSyndicationUIGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v7)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "AssetCollectionContentSyndicationSaveToLibraryAction: All unsaved assets were saved", buf, 2u);
    }

    v14 = (void *)MEMORY[0x1E0CD1390];
    v33 = v10;
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v9;
    objc_msgSend(v14, "fetchAssetsWithUUIDs:options:", v9, v15);
    v16 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    savedAssetsFetchResult = self->_savedAssetsFetchResult;
    self->_savedAssetsFetchResult = v16;

    v32 = v11;
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, v11);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = self->_savedAssetsFetchResult;
    v18 = -[PHFetchResult countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v38;
      v22 = *MEMORY[0x1E0D09830];
      v23 = *MEMORY[0x1E0D09828];
LABEL_6:
      v24 = 0;
      v25 = 9;
      if (v20 > 9)
        v25 = v20;
      v26 = v20 - v25;
      while (1)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v24);
        v28 = (void *)MEMORY[0x1E0D09910];
        v43[0] = v22;
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v23;
        v44[0] = v30;
        v44[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.syndicatedAssetsSaved"), v31);

        if (!(v26 + v24))
          break;
        if (v19 == ++v24)
        {
          v20 += v24;
          v19 = -[PHFetchResult countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v19)
            goto LABEL_6;
          break;
        }
      }
    }

    v10 = v33;
    v9 = v34;
    v11 = v32;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v11;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "AssetCollectionContentSyndicationSaveToLibraryAction: Failed to save all unsaved assets. Error: %@", buf, 0xCu);
    }

    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, v11);
  }

}

- (void)performBackgroundTask
{
  void *v3;
  int v4;
  PHFetchResult *v5;
  void *v6;
  uint64_t v7;
  PHFetchResult *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  PHFetchResult *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventActualSaveToLibraryBehavior");

  if (v4)
  {
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    v5 = self->_unsavedSyndicatedAssetsFetchResult;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__279411;
    v16[4] = __Block_byref_object_dispose__279412;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[PHFetchResult count](v5, "count"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke;
    v13[3] = &unk_1E5148AA8;
    v8 = v5;
    v14 = v8;
    v15 = v16;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_164;
    v10[3] = &unk_1E51445B0;
    v10[4] = self;
    v12 = v16;
    v9 = v6;
    v11 = v9;
    objc_msgSend(v9, "performChanges:completionHandler:", v13, v10);

    _Block_object_dispose(v16, 8);
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

- (PHFetchResult)savedAssetsFetchResult
{
  return self->_savedAssetsFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetArrivalObserver, 0);
  objc_storeStrong((id *)&self->_unsavedSyndicatedAssetsFetchResult, 0);
}

void __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        PLSyndicationUIGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "uuid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v9;
          v19 = 2112;
          v20 = v7;
          _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "AssetCollectionContentSyndicationSaveToLibraryAction: Saving asset (%{public}@): %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetFromGuestAsset:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "placeholderForCreatedAsset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v12);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v4);
  }

}

void __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_164(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  id location;

  v5 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2;
  v9[3] = &unk_1E5144588;
  objc_copyWeak(&v13, &location);
  v6 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v7 = v6;
  v14 = a2;
  v10 = v7;
  v11 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleCompletionForExpectedUUIDs:photoLibrary:success:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));

}

void __101__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Debug action prevented actual saving."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

uint64_t __101__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke_156(uint64_t a1, uint64_t a2)
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
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "AssetCollectionContentSyndicationSaveToLibraryAction: Unsaved assets were all made locally available: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  if ((_DWORD)a2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, 0);
}

@end
