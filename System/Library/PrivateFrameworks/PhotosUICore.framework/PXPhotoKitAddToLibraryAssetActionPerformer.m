@implementation PXPhotoKitAddToLibraryAssetActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11 || objc_msgSend(v11, "sourceType") != 8 || objc_msgSend(v12, "assetCollectionType") != 7)
  {
    v16 = 0;
    goto LABEL_8;
  }
  v15 = v12;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAddToLibraryAssetActionPerformer.m"), 33, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v20);
LABEL_11:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_descriptionForAssertionMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAddToLibraryAssetActionPerformer.m"), 33, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v20, v22);

    goto LABEL_11;
  }
LABEL_6:
  v16 = objc_msgSend(v15, "status") == 3;

LABEL_8:
  return v16;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (a3 > 2)
    v5 = 0;
  else
    v5 = off_1E5124918[a3];
  v6 = v5;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PXPhotoKitAssetActionManager%@Title_AddToLibrary"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0DC3870];
  v7 = a3;
  objc_msgSend(v6, "systemImageNamed:", CFSTR("square.and.arrow.down"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v8, 0, v7, a4);

  return v9;
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  PXPhotoKitAddToLibraryAssetActionPerformer *v28;
  SEL v29;
  _QWORD v30[4];
  id v31;
  PXPhotoKitAddToLibraryAssetActionPerformer *v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v4 || !v6)
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
    goto LABEL_13;
  }
  objc_msgSend(v4, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAddToLibraryAssetActionPerformer.m"), 66, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectionSnapshot.dataSource"), v19, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAddToLibraryAssetActionPerformer.m"), 66, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectionSnapshot.dataSource"), v19);
  }

LABEL_5:
  -[PXPhotoKitAssetActionPerformer importStatusManager](self, "importStatusManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "supportsStateSimulation"))
  {
    objc_msgSend(v4, "selectedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __72__PXPhotoKitAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke;
    v30[3] = &unk_1E513B078;
    v31 = v7;
    v32 = self;
    v33 = v9;
    objc_msgSend(v10, "enumerateItemIndexPathsUsingBlock:", v30);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedIndexPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__PXPhotoKitAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_2;
    v25[3] = &unk_1E512EE30;
    v26 = v11;
    v13 = v7;
    v28 = self;
    v29 = a2;
    v27 = v13;
    v14 = v11;
    objc_msgSend(v12, "enumerateItemIndexPathsUsingBlock:", v25);

    v22 = objc_msgSend(v13, "identifier");
    v23 = xmmword_1A7C0C1F0;
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v13, "assetCollectionAtSectionIndexPath:", &v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v35 = v6;
      v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "[AddToLibrary] Starting to Add %lu assets from Moment Share: %@.", buf, 0x16u);
    }

    -[PXPhotoKitAddToLibraryAssetActionPerformer importAssets:](self, "importAssets:", v14);
  }

LABEL_13:
}

- (void)_simulateImportForAssetReference:(id)a3 assetImportStatusManager:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  PXPhotoKitAddToLibraryAssetActionPerformer *v20;
  id v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "[AddToLibrary] Simulating import for asset: %@", buf, 0xCu);

  }
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "simulateImportFailure");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Simulated failure"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v7, "beginSimulatedImportForAssetReference:", v6);
  v13 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PXPhotoKitAddToLibraryAssetActionPerformer__simulateImportForAssetReference_assetImportStatusManager___block_invoke;
  block[3] = &unk_1E5134020;
  v18 = v7;
  v19 = v6;
  v22 = v11;
  v20 = self;
  v21 = v12;
  v14 = v12;
  v15 = v6;
  v16 = v7;
  dispatch_after(v13, MEMORY[0x1E0C80D38], block);

}

- (void)importAssets:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PXPhotoKitAddToLibraryAssetActionPerformer *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PXPhotoKitAddToLibraryAssetActionPerformer *v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CD13F8]);
  objc_msgSend(v5, "setShouldDownloadOrCloudReReferenceMissingResources:", 1);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke;
  v13[3] = &unk_1E51457C8;
  v14 = v4;
  v15 = v5;
  v16 = self;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke_2;
  v10[3] = &unk_1E5147B40;
  v11 = v14;
  v12 = self;
  v8 = v14;
  v9 = v5;
  objc_msgSend(v6, "performChanges:completionHandler:", v13, v10);

}

void __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetCopyFromAsset:options:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "importSessionID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setImportSessionID:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v5 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke_3(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 56);
  PLSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134217984;
      v18 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "[AddToLibrary] Successfully started to Add %lu assets", buf, 0xCu);
    }

    v6 = (void *)MEMORY[0x1E0D09910];
    v15 = *MEMORY[0x1E0D09830];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.addAssetsToLibrary"), v9, v15);

    v10 = *(void **)(a1 + 40);
    v11 = 1;
    v12 = 0;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "[AddToLibrary] Failed to start to Add to Library, err: %@", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v11 = 0;
  }
  return objc_msgSend(v10, "completeUserInteractionTaskWithSuccess:error:", v11, v12);
}

uint64_t __104__PXPhotoKitAddToLibraryAssetActionPerformer__simulateImportForAssetReference_assetImportStatusManager___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeSimulatedImportForAssetReference:withSuccess:", *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 64) == 0);
  return objc_msgSend(*(id *)(a1 + 48), "completeUserInteractionTaskWithSuccess:error:", *(_BYTE *)(a1 + 64) == 0, *(_QWORD *)(a1 + 56));
}

void __72__PXPhotoKitAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "assetReferenceAtItemIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_simulateImportForAssetReference:assetImportStatusManager:", v5, *(_QWORD *)(a1 + 48));

}

void __72__PXPhotoKitAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_2(_QWORD *a1, _OWORD *a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  _OWORD v16[2];

  v4 = (void *)a1[4];
  v3 = (void *)a1[5];
  v5 = a2[1];
  v16[0] = *a2;
  v16[1] = v5;
  objc_msgSend(v3, "assetAtItemIndexPath:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[6];
    v8 = a1[7];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("PXPhotoKitAddToLibraryAssetActionPerformer.m"), 81, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[dataSource assetAtItemIndexPath:indexPath]"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[6];
    v12 = a1[7];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("PXPhotoKitAddToLibraryAssetActionPerformer.m"), 81, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[dataSource assetAtItemIndexPath:indexPath]"), v11, v15);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v4, "addObject:", v6);

}

@end
