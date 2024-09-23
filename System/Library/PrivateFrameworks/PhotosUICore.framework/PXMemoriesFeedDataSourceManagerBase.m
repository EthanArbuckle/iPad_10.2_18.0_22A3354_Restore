@implementation PXMemoriesFeedDataSourceManagerBase

- (NSDate)mostRecentCreationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_class();
  -[PXMemoriesFeedDataSourceManagerBase photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseFetchOptionsWithPhotoLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

- (PXMemoriesFeedDataSourceManagerBase)initWithPhotoLibrary:(id)a3
{
  id v4;
  PXMemoriesFeedDataSourceManagerBase *v5;
  void *v6;
  void *v7;
  int v8;
  PXDiscoveryFeedDataSourceManager *v9;
  PXDiscoveryFeedDataSourceManager *discoveryDataSourceManager;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXMemoriesFeedDataSourceManagerBase;
  v5 = -[PXSectionedDataSourceManager init](&v14, sel_init);
  if (v5)
  {
    v6 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_photoLibrary, v6);
    if (!v4)

    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "enableDiscoveryFeed");

    if (v8)
    {
      v9 = -[PXDiscoveryFeedDataSourceManager initWithPhotoLibrary:]([PXDiscoveryFeedDataSourceManager alloc], "initWithPhotoLibrary:", v5->_photoLibrary);
      discoveryDataSourceManager = v5->_discoveryDataSourceManager;
      v5->_discoveryDataSourceManager = v9;

      -[PXSectionedDataSourceManager dataSource](v5->_discoveryDataSourceManager, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "assetCollections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMemoriesFeedDataSourceManagerBase setMemoriesFetchResult:](v5, "setMemoriesFetchResult:", v12);

    }
  }

  return v5;
}

- (id)createInitialDataSource
{
  return +[PXSectionedDataSource emptyDataSource](PXMemoriesFeedDataSource, "emptyDataSource");
}

- (BOOL)hasAnyMemories
{
  void *v2;
  BOOL v3;

  -[PXMemoriesFeedDataSourceManagerBase memoriesFetchResult](self, "memoriesFetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)fetchOptions
{
  void *v2;
  void *v3;
  PXLibraryFilterState *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PXMemoriesFeedDataSourceManagerBase photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v3);
  +[PXMemoriesFeedDataSourceManagerBase baseFetchOptionsWithPhotoLibrary:](PXMemoriesFeedDataSourceManagerBase, "baseFetchOptionsWithPhotoLibrary:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhotoLibrary:", v2);
  v10[0] = *MEMORY[0x1E0CD1D28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  v7 = -[PXLibraryFilterState viewMode](v4, "viewMode");
  if (v7 == 2)
    v8 = 1;
  else
    v8 = 2 * (v7 != 1);
  objc_msgSend(v5, "setSharingFilter:", v8);

  return v5;
}

- (void)setMemoriesFetchResult:(id)a3
{
  PHFetchResult *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (PHFetchResult *)a3;
  if (self->_memoriesFetchResult != v5)
  {
    objc_storeStrong((id *)&self->_memoriesFetchResult, a3);
    if (!v5)
    {
      PLMemoriesGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315138;
        v8 = "-[PXMemoriesFeedDataSourceManagerBase setMemoriesFetchResult:]";
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Set memoriesFetchResult to nil, %s", (uint8_t *)&v7, 0xCu);
      }

    }
  }

}

- (void)resetMemoriesFetchResult
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  if (self->_memoryGenerationHasStarted)
  {
    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "enableDiscoveryFeed");

    if (v4)
    {
      -[PXSectionedDataSourceManager dataSource](self->_discoveryDataSourceManager, "dataSource");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assetCollections");
    }
    else
    {
      -[PXMemoriesFeedDataSourceManagerBase fetchOptions](self, "fetchOptions");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoriesFeedDataSourceManagerBase setMemoriesFetchResult:](self, "setMemoriesFetchResult:", v5);

  }
}

- (void)startGeneratingMemories
{
  self->_memoryGenerationHasStarted = 1;
  -[PXMemoriesFeedDataSourceManagerBase resetMemoriesFetchResult](self, "resetMemoriesFetchResult");
}

- (void)generateAdditionalEntriesIfPossible
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedDataSourceManagerBase.m"), 146, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMemoriesFeedDataSourceManagerBase generateAdditionalEntriesIfPossible]", v6);

  abort();
}

- (void)loadMoreContentWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableDiscoveryFeed");

  if (v6)
  {
    -[PXMemoriesFeedDataSourceManagerBase discoveryDataSourceManager](self, "discoveryDataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__PXMemoriesFeedDataSourceManagerBase_loadMoreContentWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E511FF08;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "loadMoreContentWithCompletionHandler:", v8);

  }
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PXMemoriesFeedDataSourceManagerBase photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_beginPausingChangesWithTimeout:identifier:", v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXMemoriesFeedDataSourceManagerBase photoLibrary](self, "photoLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_endPausingChanges:", v4);

}

- (void)startObservingChanges
{
  -[PHPhotoLibrary px_registerChangeObserver:](self->_photoLibrary, "px_registerChangeObserver:", self);
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__68844;
  v21 = __Block_byref_object_dispose__68845;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__68844;
  v15 = __Block_byref_object_dispose__68845;
  v16 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PXMemoriesFeedDataSourceManagerBase_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E51401A8;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  objc_msgSend(v4, "changeDetailsForFetchResult:", v12[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXMemoriesFeedDataSourceManagerBase _updatedFetchResultsForMemoriesForDatasource:changeDetails:changeInstance:](PXMemoriesFeedDataSourceManagerBase, "_updatedFetchResultsForMemoriesForDatasource:changeDetails:changeInstance:", v18[5], v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18[5], CFSTR("datasource"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("updatedFetchResultsForMemoriesWithChangedKeyAssets"));
  v8 = v12[5];
  if (v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("memoriesFetchResult"));
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("memoriesFetchResultChangeDetails"));

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("memoriesFetchResultChangeDetails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("updatedFetchResultsForMemoriesWithChangedKeyAssets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("datasource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("memoriesFetchResult"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXMemoriesFeedDataSourceManagerBase memoriesFetchResult](self, "memoriesFetchResult");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v9 == v10 && v11 == (void *)v12)
  {
    if (v7)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(v16, "changeDetailsForFetchResult:", v12);
    v14 = objc_claimAutoreleasedReturnValue();

    +[PXMemoriesFeedDataSourceManagerBase _updatedFetchResultsForMemoriesForDatasource:changeDetails:changeInstance:](PXMemoriesFeedDataSourceManagerBase, "_updatedFetchResultsForMemoriesForDatasource:changeDetails:changeInstance:", v10, v14, v16);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
    v7 = (void *)v14;
    if (v14)
    {
LABEL_4:
      if (objc_msgSend(v7, "hasIncrementalChanges"))
        -[PXMemoriesFeedDataSourceManagerBase handleIncrementalFetchResultChange:updatedFetchResultsForMemoriesWithChangedKeyAssets:](self, "handleIncrementalFetchResultChange:updatedFetchResultsForMemoriesWithChangedKeyAssets:", v16, v8);
      else
        -[PXMemoriesFeedDataSourceManagerBase handleNonIncrementalFetchResultChange:](self, "handleNonIncrementalFetchResultChange:", v7);
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v8, "count"))
    -[PXMemoriesFeedDataSourceManagerBase handleChangedKeyAssetsForMemories:](self, "handleChangedKeyAssetsForMemories:", v8);
LABEL_10:

}

- (void)reloadMemories:(BOOL)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedDataSourceManagerBase.m"), 265, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMemoriesFeedDataSourceManagerBase reloadMemories:]", v7);

  abort();
}

- (void)handleIncrementalFetchResultChange:(id)a3 updatedFetchResultsForMemoriesWithChangedKeyAssets:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedDataSourceManagerBase.m"), 269, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMemoriesFeedDataSourceManagerBase handleIncrementalFetchResultChange:updatedFetchResultsForMemoriesWithChangedKeyAssets:]", v11);

  abort();
}

- (void)handleNonIncrementalFetchResultChange:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedDataSourceManagerBase.m"), 273, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMemoriesFeedDataSourceManagerBase handleNonIncrementalFetchResultChange:]", v8);

  abort();
}

- (void)handleChangedKeyAssetsForMemories:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedDataSourceManagerBase.m"), 277, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMemoriesFeedDataSourceManagerBase handleChangedKeyAssetsForMemories:]", v8);

  abort();
}

- (void)_clearPendingNotificationForMemory:(id)a3
{
  id v4;
  PHPhotoLibrary *photoLibrary;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  photoLibrary = self->_photoLibrary;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PXMemoriesFeedDataSourceManagerBase__clearPendingNotificationForMemory___block_invoke;
  v10[3] = &unk_1E5149198;
  v11 = v4;
  v6 = v4;
  -[PHPhotoLibrary performChanges:completionHandler:](photoLibrary, "performChanges:completionHandler:", v10, &__block_literal_global_68827);
  -[PHPhotoLibrary assetsdClient](self->_photoLibrary, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asyncNotifyInterestingMemoryNotificationViewedForColletionID:", v9);

}

- (void)updateCurrentMemoriesNonPendingAndNotificationStatus
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXMemoriesFeedDataSourceManagerBase memoriesFetchResult](self, "memoriesFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXMemoriesSeenHelper defaultHelper](PXMemoriesSeenHelper, "defaultHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearAnyPendingNotificationsFromMemories:inLibrary:", v3, self->_photoLibrary);
  v5 = -[PXMemoriesFeedDataSourceManagerBase firstUngroupedMemoryIndex](self, "firstUngroupedMemoryIndex");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v3, "count");
    if (v6 >= v7)
      v8 = v7;
    else
      v8 = v6;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectsAtIndexes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearAnyPendingStateFromMemories:inLibrary:", v10, self->_photoLibrary);

  }
  else
  {
    PLMemoriesGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = "-[PXMemoriesFeedDataSourceManagerBase updateCurrentMemoriesNonPendingAndNotificationStatus]";
      v14 = 2048;
      v15 = 0;
      v16 = 2048;
      v17 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "%s Unexpected value for firstUngroupedMemoryIndex: %lu, memoriesFetchResult.count: %lu", (uint8_t *)&v12, 0x20u);
    }

  }
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)_isGeneratingAdditionalEntries
{
  return self->__generatingAdditionalEntries;
}

- (void)_setGeneratingAdditionalEntries:(BOOL)a3
{
  self->__generatingAdditionalEntries = a3;
}

- (PXDiscoveryFeedDataSourceManager)discoveryDataSourceManager
{
  return self->_discoveryDataSourceManager;
}

- (void)setDiscoveryDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryDataSourceManager, a3);
}

- (PHFetchResult)memoriesFetchResult
{
  return self->_memoriesFetchResult;
}

- (unint64_t)firstUngroupedMemoryIndex
{
  return self->_firstUngroupedMemoryIndex;
}

- (void)setFirstUngroupedMemoryIndex:(unint64_t)a3
{
  self->_firstUngroupedMemoryIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoriesFetchResult, 0);
  objc_storeStrong((id *)&self->_discoveryDataSourceManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __74__PXMemoriesFeedDataSourceManagerBase__clearPendingNotificationForMemory___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNotificationState:", 2);

}

void __74__PXMemoriesFeedDataSourceManagerBase__clearPendingNotificationForMemory___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Error while updating memory notification state: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __68__PXMemoriesFeedDataSourceManagerBase_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "memoriesFetchResult");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __76__PXMemoriesFeedDataSourceManagerBase_loadMoreContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "resetMemoriesFetchResult");
}

+ (id)baseFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rejected = NO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v7);

  return v3;
}

+ (id)_updatedFetchResultsForMemoriesForDatasource:(id)a3 changeDetails:(id)a4 changeInstance:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "entries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__PXMemoriesFeedDataSourceManagerBase__updatedFetchResultsForMemoriesForDatasource_changeDetails_changeInstance___block_invoke;
  v18[3] = &unk_1E511FF58;
  v19 = v7;
  v20 = v8;
  v12 = v10;
  v21 = v12;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);
  v15 = v21;
  v16 = v12;

  return v16;
}

+ (id)generateEntriesFromMemories:(id)a3 startingFromIndex:(unint64_t)a4 maximumNumberOfEntries:(unint64_t)a5 finalMemoryIndex:(unint64_t *)a6
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void (**v13)(void *, void *, id);
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  unint64_t *v23;
  id v25;
  _QWORD aBlock[4];
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  PLMemoriesGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Generating feed entries from %lu entries...", buf, 0xCu);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __125__PXMemoriesFeedDataSourceManagerBase_generateEntriesFromMemories_startingFromIndex_maximumNumberOfEntries_finalMemoryIndex___block_invoke;
  aBlock[3] = &unk_1E511FF80;
  v12 = v11;
  v28 = v12;
  v25 = v10;
  v29 = v25;
  v13 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  if (!objc_msgSend(v8, "count"))
  {
    v14 = 0;
    a4 = 0x7FFFFFFFFFFFFFFFLL;
    if (a6)
      goto LABEL_21;
    goto LABEL_22;
  }
  v23 = a6;
  if (objc_msgSend(v8, "count") <= a4)
  {
    v14 = 0;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_15;
  }
  v14 = 0;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v16 = v14;
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16 || (objc_msgSend(a1, "shouldGroupTogetherMemoriesWithCreationDate:andCreationDate:", v14, v16) & 1) != 0)
      goto LABEL_10;
    v13[2](v13, v16, v12);
    v15 = a4 - 1;
    if (objc_msgSend(v25, "count") >= a5)
      break;
    objc_msgSend(v12, "removeAllObjects");
LABEL_10:
    +[PXMemoryInfo memoryInfoWithMemory:](PXMemoryInfo, "memoryInfoWithMemory:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);

    if (++a4 >= objc_msgSend(v8, "count"))
      goto LABEL_15;
  }

  v14 = v16;
LABEL_15:
  if (objc_msgSend(v12, "count"))
  {
    a6 = v23;
    if (objc_msgSend(v25, "count") >= a5)
      a4 = v15;
    else
      v13[2](v13, v14, v12);
  }
  else
  {
    a4 = v15;
    a6 = v23;
  }
  if (a6)
LABEL_21:
    *a6 = a4;
LABEL_22:
  PLMemoriesGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 134217984;
    v31 = v20;
    _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "Generated %lu feed entries:", buf, 0xCu);
  }

  v21 = v25;
  return v21;
}

+ (BOOL)shouldGroupTogetherMemoriesWithCreationDate:(id)a3 andCreationDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v18;

  v7 = a3;
  v8 = a4;
  +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enableDiscoveryFeed");

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    +[PXMemoriesFeedSettings sharedInstance](PXMemoriesFeedSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "memoryGroupingMethod");
    switch(v13)
    {
      case 1:
        v11 = objc_msgSend(v7, "px_isSameDayAsDate:", v8);
        break;
      case 2:
        objc_msgSend(v7, "timeIntervalSinceDate:", v8);
        v15 = fabs(v14);
        objc_msgSend(v12, "memoryGroupingInterval");
        v11 = v15 <= v16;
        break;
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXMemoriesFeedDataSourceManagerBase.m"), 343, CFSTR("Code which should be unreachable has been reached"));

        abort();
      default:
        v11 = 0;
        break;
    }

  }
  return v11;
}

void __125__PXMemoriesFeedDataSourceManagerBase_generateEntriesFromMemories_startingFromIndex_maximumNumberOfEntries_finalMemoryIndex___block_invoke(uint64_t a1)
{
  PXMemoryEntryInfo *v2;
  NSObject *v3;
  int v4;
  PXMemoryEntryInfo *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = -[PXMemoryEntryInfo initWithMemories:]([PXMemoryEntryInfo alloc], "initWithMemories:", *(_QWORD *)(a1 + 32));
  PLMemoriesGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "Generated feed entry: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);
}

void __113__PXMemoriesFeedDataSourceManagerBase__updatedFetchResultsForMemoriesForDatasource_changeDetails_changeInstance___block_invoke(id *a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(a2, "memories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __113__PXMemoriesFeedDataSourceManagerBase__updatedFetchResultsForMemoriesForDatasource_changeDetails_changeInstance___block_invoke_2;
  v4[3] = &unk_1E511FF30;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __113__PXMemoriesFeedDataSourceManagerBase__updatedFetchResultsForMemoriesForDatasource_changeDetails_changeInstance___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "removedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) == 0)
  {
    v6 = a1[5];
    objc_msgSend(v16, "keyAssetFetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeDetailsForFetchResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v16, "keyAssetFetchResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[5], "changeDetailsForObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "assetContentChanged");
      objc_msgSend(v8, "fetchResultAfterChanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", v10);

      if ((v12 & 1) != 0 || !v15)
        objc_msgSend(a1[6], "setObject:forKey:", v13, v3);

    }
  }

}

@end
