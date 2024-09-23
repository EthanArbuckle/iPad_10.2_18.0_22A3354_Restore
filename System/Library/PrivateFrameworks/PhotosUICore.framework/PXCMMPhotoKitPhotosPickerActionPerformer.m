@implementation PXCMMPhotoKitPhotosPickerActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXCMMActionPerformer session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2168]), "initWithPhotoLibraryAndOnlyReturnsIdentifiers:", v10);
  objc_msgSend(v5, "setSelectionLimit:", 0);
  -[PXCMMPhotoKitPhotosPickerActionPerformer currentAssetIdentifiers](self, "currentAssetIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreselectedAssetIdentifiers:", v6);

  objc_msgSend(v5, "_setDisabledPrivateCapabilities:", 5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v5);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "presentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  objc_storeStrong((id *)&self->_photosPickerViewController, v7);
  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", self->_photosPickerViewController))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1002, CFSTR("failed to present photos picker"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v9);

  }
}

- (void)_pickerDidCompleteWithPickedAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  UIViewController *photosPickerViewController;
  void *v33;
  void *v34;
  _QWORD v35[7];
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "assetIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        else
        {
          PLUIGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "CMM picker result is missing an asset identifier", buf, 2u);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v8);
  }

  -[PXCMMActionPerformer session](self, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataSourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchAssetsWithLocalIdentifiers:options:", v5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v18, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0CD1620]);
  v33 = (void *)v19;
  v41 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v15;
  v22 = (void *)objc_msgSend(v20, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v21, v15, *MEMORY[0x1E0CD1B98], 0, 0, 0);

  -[PXCMMActionPerformer session](self, "session");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dataSourceManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "photosDataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCollectionListFetchResult:", v22);

  v26 = objc_msgSend(v18, "countOfAssetsWithMediaType:", 1);
  v27 = objc_msgSend(v18, "countOfAssetsWithMediaType:", 2);
  v28 = objc_msgSend(v18, "count");
  -[PXCMMActionPerformer session](self, "session");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "viewModel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __79__PXCMMPhotoKitPhotosPickerActionPerformer__pickerDidCompleteWithPickedAssets___block_invoke;
  v35[3] = &__block_descriptor_56_e33_v16__0___PXCMMMutableViewModel__8l;
  v35[4] = v26;
  v35[5] = v27;
  v35[6] = v28;
  objc_msgSend(v30, "performChanges:", v35);

  if (!-[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", self->_photosPickerViewController, 0))
  {
    PLUIGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "CMM picker failed to dismiss PHPickerViewController", buf, 2u);
    }

  }
  photosPickerViewController = self->_photosPickerViewController;
  self->_photosPickerViewController = 0;

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (NSArray)currentAssetIdentifiers
{
  NSArray *currentAssetIdentifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  currentAssetIdentifiers = self->_currentAssetIdentifiers;
  if (!currentAssetIdentifiers)
  {
    -[PXCMMActionPerformer session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v6, "identifier");
    v23 = xmmword_1A7C0C1F0;
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "assetsInSectionIndexPath:", &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXDisplayAssetFetchResultFastEnumeration();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "localIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v11);
    }
    v15 = (NSArray *)objc_msgSend(v8, "copy");
    v16 = self->_currentAssetIdentifiers;
    self->_currentAssetIdentifiers = v15;

    currentAssetIdentifiers = self->_currentAssetIdentifiers;
  }
  return currentAssetIdentifiers;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  -[PXCMMPhotoKitPhotosPickerActionPerformer _pickerDidCompleteWithPickedAssets:](self, "_pickerDidCompleteWithPickedAssets:", a4);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_photosPickerViewController, 0);
}

void __79__PXCMMPhotoKitPhotosPickerActionPerformer__pickerDidCompleteWithPickedAssets___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setPhotosCount:", v3);
  objc_msgSend(v4, "setVideosCount:", a1[5]);
  objc_msgSend(v4, "setTotalCount:", a1[6]);
  objc_msgSend(v4, "setSelectedPhotosCount:", a1[4]);
  objc_msgSend(v4, "setSelectedVideosCount:", a1[5]);
  objc_msgSend(v4, "setSelectedCount:", a1[6]);

}

@end
