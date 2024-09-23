@implementation PXContentSyndicationPhotoKitDataSourceManager

- (PXContentSyndicationPhotoKitDataSourceManager)init
{
  void *v3;
  id v4;
  PXContentSyndicationPhotoKitDataSourceManager *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    self = -[PXContentSyndicationPhotoKitDataSourceManager initWithPhotoLibrary:](self, "initWithPhotoLibrary:", v3);
    v5 = self;
  }
  else
  {
    PLSyndicationUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Error opening syndication library: %@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (PXContentSyndicationPhotoKitDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXContentSyndicationPhotoKitDataSourceManager *v7;
  PXContentSyndicationPhotoKitDataSourceManager *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXContentSyndicationPhotoKitDataSourceManager;
  v7 = -[PXSectionedDataSourceManager init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_photoLibrary, a3);

  return v8;
}

- (id)createInitialDataSource
{
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  PXContentSyndicationPhotoKitDataSource *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  NSObject *v22;
  PXContentSyndicationPhotoKitDataSourceManager *v23;
  id v24;
  id v25;
  os_signpost_id_t v26;
  uint8_t buf[16];

  -[PHPhotoLibrary px_registerChangeObserver:](self->_photoLibrary, "px_registerChangeObserver:", self);
  PLSyndicationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  if ((PFProcessIsLaunchedToExecuteTests() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "loadVerySmallInitialBatchOfRecentCollections");

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSyndicationUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Loading a very small batch of initial Shared with You items", buf, 2u);
    }

    PXContentSyndicationCollectionsFetchResultForPhotoLibraryWithFetchLimit(self->_photoLibrary, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Loading full batch of initial Shared with You items", buf, 2u);
    }

    v11 = v3;
    v12 = v11;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PXContentSyndicationPhotoKitDataSource.fullBatchFetch", ", buf, 2u);
    }

    PXContentSyndicationCollectionsFetchResultForPhotoLibraryWithFetchLimit(self->_photoLibrary, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v13;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_END, v4, "PXContentSyndicationPhotoKitDataSource.fullBatchFetch", ", buf, 2u);
    }

  }
  v15 = -[PXContentSyndicationPhotoKitDataSource initWithFetchResult:]([PXContentSyndicationPhotoKitDataSource alloc], "initWithFetchResult:", v10);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PLSyndicationUIGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Kicking off loading of the delayed full batch of Shared with You items", buf, 2u);
    }

    dispatch_get_global_queue(25, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PXContentSyndicationPhotoKitDataSourceManager_createInitialDataSource__block_invoke;
    block[3] = &unk_1E5141C90;
    v26 = v4;
    v22 = v3;
    v23 = self;
    v24 = v7;
    v25 = v16;
    v19 = v16;
    dispatch_async(v18, block);

  }
  return v15;
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[4];
  id v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t v45[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
    goto LABEL_21;
  PLSyndicationUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: setDataSource: has non-nil change details. Attempting to invalidate key asset fetch results for affected asset collections", buf, 2u);
  }

  objc_msgSend(v8, "itemChangesInSection:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "hasIncrementalChanges"))
  {
LABEL_20:

LABEL_21:
    -[PXContentSyndicationPhotoKitDataSourceManager assetFetchResultProvider](self, "assetFetchResultProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateAllAssetFetchResults");
    goto LABEL_22;
  }
  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__261166;
  v43 = __Block_byref_object_dispose__261167;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removedIndexes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        v34[0] = v13;
        v34[1] = 3221225472;
        v34[2] = __77__PXContentSyndicationPhotoKitDataSourceManager_setDataSource_changeDetails___block_invoke;
        v34[3] = &unk_1E5141158;
        v37 = objc_msgSend(v14, "numberOfItemsInSection:", 0);
        v15 = v14;
        v38 = 0;
        v35 = v15;
        v36 = buf;
        objc_msgSend(v11, "enumerateIndexesUsingBlock:", v34);
        PLSyndicationUIGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v45 = 138543362;
          v46 = (uint64_t)v11;
          _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_INFO, "ContentSyndicationPhotoKitDataSourceManager: Invalidating key asset fetchresults for removed indexes (relative to old data source): %{public}@", v45, 0xCu);
        }

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_descriptionForAssertionMessage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 247, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.dataSource"), v26, v25);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 247, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.dataSource"), v26);
    }

    goto LABEL_8;
  }
LABEL_11:
  objc_msgSend(v10, "changedIndexes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __77__PXContentSyndicationPhotoKitDataSourceManager_setDataSource_changeDetails___block_invoke_195;
    v29[3] = &unk_1E5141158;
    v32 = objc_msgSend(v7, "numberOfItemsInSection:", 0);
    v33 = 0;
    v30 = v7;
    v31 = buf;
    objc_msgSend(v17, "enumerateIndexesUsingBlock:", v29);
    PLSyndicationUIGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v45 = 138543362;
      v46 = (uint64_t)v17;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_INFO, "ContentSyndicationPhotoKitDataSourceManager: Invalidating key asset fetchresults for changed indexes (relative to new data source): %{public}@", v45, 0xCu);
    }

  }
  if (!objc_msgSend(*((id *)v40 + 5), "count"))
  {

    _Block_object_dispose(buf, 8);
    goto LABEL_20;
  }
  PLSyndicationUIGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_msgSend(*((id *)v40 + 5), "count");
    v21 = *((_QWORD *)v40 + 5);
    *(_DWORD *)v45 = 134218242;
    v46 = v20;
    v47 = 2112;
    v48 = v21;
    _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_INFO, "ContentSyndicationPhotoKitDataSourceManager: Invalidating %tu asset collection fetch results after change notification: %@", v45, 0x16u);
  }

  -[PXContentSyndicationPhotoKitDataSourceManager assetFetchResultProvider](self, "assetFetchResultProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "invalidateAssetFetchResultsInAssetCollections:", *((_QWORD *)v40 + 5));

  _Block_object_dispose(buf, 8);
LABEL_22:

  v28.receiver = self;
  v28.super_class = (Class)PXContentSyndicationPhotoKitDataSourceManager;
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](&v28, sel_setDataSource_changeDetails_, v7, v8);

}

- (id)allAssetsFetchResult
{
  return PXContentSyndicationAssetsFetchResultForPhotoLibrary(self->_photoLibrary, 1, 0);
}

- (id)assetFetchResultProvider
{
  PXContentSyndicationAssetFetchResultProvider *assetFetchResultProvider;
  PXContentSyndicationAssetFetchResultProvider *v4;
  PXContentSyndicationAssetFetchResultProvider *v5;

  assetFetchResultProvider = self->_assetFetchResultProvider;
  if (!assetFetchResultProvider)
  {
    PXContentSyndicationAssetFetchResultProviderForPhotoLibrary(self->_photoLibrary);
    v4 = (PXContentSyndicationAssetFetchResultProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_assetFetchResultProvider;
    self->_assetFetchResultProvider = v4;

    assetFetchResultProvider = self->_assetFetchResultProvider;
  }
  return assetFetchResultProvider;
}

- (id)imageProvider
{
  PXUIImageProvider *imageProvider;
  PXUIImageProvider *v4;
  PXUIImageProvider *v5;

  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    PXContentSyndicationImageProviderForPhotoLibrary(self->_photoLibrary);
    v4 = (PXUIImageProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_imageProvider;
    self->_imageProvider = v4;

    imageProvider = self->_imageProvider;
  }
  return imageProvider;
}

- (id)socialLayerHighlightProvider
{
  PXContentSyndicationSocialLayerHighlightProvider *highlightProvider;
  PXContentSyndicationSocialLayerHighlightProvider *v4;
  PXContentSyndicationSocialLayerHighlightProvider *v5;

  highlightProvider = self->_highlightProvider;
  if (!highlightProvider)
  {
    +[PXContentSyndicationPhotoKitSocialLayerHighlightProvider sharedInstance](PXContentSyndicationPhotoKitSocialLayerHighlightProvider, "sharedInstance");
    v4 = (PXContentSyndicationSocialLayerHighlightProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_highlightProvider;
    self->_highlightProvider = v4;

    highlightProvider = self->_highlightProvider;
  }
  return highlightProvider;
}

- (id)createAssetsDataSourceManager
{
  void *v2;
  void *v3;

  PXContentSyndicationCollectionsFetchResultForPhotoLibraryWithFetchLimit(self->_photoLibrary, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__261166;
  v18 = __Block_byref_object_dispose__261167;
  v19 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PXContentSyndicationPhotoKitDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[4] = self;
  block[5] = &v14;
  block[6] = a2;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v6 = (void *)v15[5];
  v12 = 0;
  objc_msgSend(v6, "dataSourceUpdatedWithChange:underlyingArrayChangeDetails:", v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = v15[5];
  v20[0] = CFSTR("currentDataSource");
  v20[1] = CFSTR("preparedDataSource");
  v21[0] = v9;
  v21[1] = v7;
  v20[2] = CFSTR("preparedUnderlyingChangeDetails");
  v21[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v10;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 355, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.dataSource"), v24, v26);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 355, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.dataSource"), v24);
  }

LABEL_3:
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("currentDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preparedDataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preparedUnderlyingChangeDetails"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
    objc_msgSend(v9, "dataSourceUpdatedWithChange:underlyingArrayChangeDetails:", v7, &v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v28;
  }
  v13 = v12;
  if (objc_msgSend(v12, "hasAnyChanges"))
  {
    PLSyndicationUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Data Source has non-empty underlying change details: %{public}@.", buf, 0xCu);
    }

  }
  if (v11 != v9)
  {
    v27 = v7;
    v15 = objc_alloc((Class)off_1E50B4A18);
    v16 = objc_msgSend(v9, "identifier");
    v17 = objc_msgSend(v11, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = &unk_1E53EF450;
    v34[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v15, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v16, v17, v18, v19, 0);

    PLSyndicationUIGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = v9;
      v31 = 2114;
      v32 = v11;
      _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Updating data Source from: %{public}@ to %{public}@", buf, 0x16u);
    }

    -[PXContentSyndicationPhotoKitDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v11, v20);
    v7 = v27;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_assetFetchResultProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __78__PXContentSyndicationPhotoKitDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 341, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.dataSource"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 341, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.dataSource"), v9, v13);

    goto LABEL_6;
  }
LABEL_3:
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77__PXContentSyndicationPhotoKitDataSourceManager_setDataSource_changeDetails___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  if (*(_QWORD *)(a1 + 48) > a2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(void **)(a1 + 32);
    v8[0] = v4;
    v8[1] = v5;
    v8[2] = a2;
    v8[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "objectAtIndexPath:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

  }
}

void __77__PXContentSyndicationPhotoKitDataSourceManager_setDataSource_changeDetails___block_invoke_195(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  if (*(_QWORD *)(a1 + 48) > a2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(void **)(a1 + 32);
    v8[0] = v4;
    v8[1] = v5;
    v8[2] = a2;
    v8[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "objectAtIndexPath:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

  }
}

void __72__PXContentSyndicationPhotoKitDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PXContentSyndicationPhotoKitDataSource.fullBatchFetch", ", buf, 2u);
  }

  PXContentSyndicationCollectionsFetchResultForPhotoLibraryWithFetchLimit(*(void **)(*(_QWORD *)(a1 + 40) + 128), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PXContentSyndicationPhotoKitDataSource.fullBatchFetch", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  v11 = v10;
  objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
  v13 = v12;
  PLSyndicationUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134218496;
    v22 = v15;
    v23 = 2048;
    v24 = v13 * 1000.0;
    v25 = 2048;
    v26 = v11 * 1000.0;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: Loaded delayed full batch of Shared with You items: %lu items. Took %.0fms for full batch fetch, %.0fms since initial data source", buf, 0x20u);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__PXContentSyndicationPhotoKitDataSourceManager_createInitialDataSource__block_invoke_189;
  v18[3] = &unk_1E5148D08;
  v16 = *(_QWORD *)(a1 + 40);
  v19 = v5;
  v20 = v16;
  v17 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

void __72__PXContentSyndicationPhotoKitDataSourceManager_createInitialDataSource__block_invoke_189(uint64_t a1)
{
  PXContentSyndicationPhotoKitDataSource *v2;

  v2 = -[PXContentSyndicationPhotoKitDataSource initWithFetchResult:]([PXContentSyndicationPhotoKitDataSource alloc], "initWithFetchResult:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setDataSource:changeDetails:", v2, 0);

}

+ (id)createCountsController
{
  return objc_alloc_init(PXContentSyndicationPhotoKitCountsController);
}

@end
