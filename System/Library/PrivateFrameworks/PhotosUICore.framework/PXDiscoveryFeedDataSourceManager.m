@implementation PXDiscoveryFeedDataSourceManager

- (PXDiscoveryFeedDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDiscoveryFeedDataSourceManager.m"), 37, CFSTR("%s is not available as initializer"), "-[PXDiscoveryFeedDataSourceManager init]");

  abort();
}

- (PXDiscoveryFeedDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXDiscoveryFeedDataSourceManager *v6;
  PXDiscoveryFeedDataSourceManager *v7;
  void *v8;
  uint64_t v9;
  OS_dispatch_queue *workQueue;
  PXDiscoveryFeedGenerationOptions *v11;
  void *v12;
  PXDiscoveryFeedGenerationSession *v13;
  PXDiscoveryFeedGenerationSession *session;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXDiscoveryFeedDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    px_dispatch_queue_create();
    v9 = objc_claimAutoreleasedReturnValue();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc_init(PXDiscoveryFeedGenerationOptions);
    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDiscoveryFeedGenerationOptions setDiscoveryRankingMode:](v11, "setDiscoveryRankingMode:", objc_msgSend(v12, "discoveryRankingMode"));

    v13 = -[PXDiscoveryFeedGenerationSession initWithPhotoLibrary:options:]([PXDiscoveryFeedGenerationSession alloc], "initWithPhotoLibrary:options:", v5, v11);
    session = v7->_session;
    v7->_session = v13;

  }
  return v7;
}

- (void)loadMoreContentWithCompletionHandler:(id)a3
{
  id v4;
  atomic_flag *p_hasDispatchedCallToGetAdditionalItems;
  unsigned __int8 v6;
  dispatch_block_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  p_hasDispatchedCallToGetAdditionalItems = &self->_hasDispatchedCallToGetAdditionalItems;
  do
    v6 = __ldaxr((unsigned __int8 *)p_hasDispatchedCallToGetAdditionalItems);
  while (__stlxr(1u, (unsigned __int8 *)p_hasDispatchedCallToGetAdditionalItems));
  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PXDiscoveryFeedDataSourceManager_loadMoreContentWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5146480;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async((dispatch_queue_t)self->_workQueue, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)_loadMoreContentWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *assetCollections;
  id v12;
  void *v13;
  PXDiscoveryFeedDataSource *v14;
  id v15;
  PXDiscoveryFeedDataSource *v16;
  _QWORD v17[4];
  PXDiscoveryFeedDataSource *v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_assetCollections);
  -[PXDiscoveryFeedGenerationSession additionaItemsWithTargetCount:](self->_session, "additionaItemsWithTargetCount:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "fetchedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    objc_msgSend(v6, "fetchedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

    v10 = (NSArray *)objc_msgSend(v5, "copy");
    assetCollections = self->_assetCollections;
    self->_assetCollections = v10;

    v12 = objc_alloc(MEMORY[0x1E0CD1620]);
    v13 = (void *)objc_msgSend(v12, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v5, self->_photoLibrary, *MEMORY[0x1E0CD1BB0], 0, 0, 1);
    v14 = -[PXDiscoveryFeedDataSource initWithAssetCollections:]([PXDiscoveryFeedDataSource alloc], "initWithAssetCollections:", v13);

  }
  else
  {
    v14 = 0;
  }
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__PXDiscoveryFeedDataSourceManager__loadMoreContentWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E51422C8;
  objc_copyWeak(&v20, &location);
  v18 = v14;
  v19 = v4;
  v15 = v4;
  v16 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_handleMoreContentLoadedWithDataSource:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__PXDiscoveryFeedDataSourceManager__handleMoreContentLoadedWithDataSource___block_invoke;
    v6[3] = &unk_1E51422F0;
    v7 = v4;
    -[PXDiscoveryFeedDataSourceManager performChanges:](self, "performChanges:", v6);

  }
  atomic_store(0, (unsigned __int8 *)&self->_hasDispatchedCallToGetAdditionalItems);

}

- (id)createInitialDataSource
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *workQueue;
  id v7;
  PXDiscoveryFeedDataSource *v8;
  PXDiscoveryFeedDataSource *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  PXDiscoveryFeedDataSourceManager *v15;
  id v16;

  -[PXDiscoveryFeedGenerationSession additionaItemsWithTargetCount:](self->_session, "additionaItemsWithTargetCount:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDiscoveryFeedDataSourceManager _requestMemoryWithCount:beforeDate:](self, "_requestMemoryWithCount:beforeDate:", 5, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  workQueue = self->_workQueue;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __59__PXDiscoveryFeedDataSourceManager_createInitialDataSource__block_invoke;
  v14 = &unk_1E5148D08;
  v15 = self;
  v16 = v3;
  v7 = v3;
  dispatch_async(workQueue, &v11);
  v8 = [PXDiscoveryFeedDataSource alloc];
  v9 = -[PXDiscoveryFeedDataSource initWithAssetCollections:](v8, "initWithAssetCollections:", v7, v11, v12, v13, v14, v15);

  return v9;
}

- (id)_requestMemoryWithCount:(int64_t)a3 beforeDate:(id)a4
{
  PHPhotoLibrary *photoLibrary;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  photoLibrary = self->_photoLibrary;
  v6 = a4;
  -[PHPhotoLibrary librarySpecificFetchOptions](photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v7, "setIncludePendingMemories:", 1);
  objc_msgSend(v7, "setFetchLimit:", a3);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate < %@"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v11);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __59__PXDiscoveryFeedDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "fetchedObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

uint64_t __75__PXDiscoveryFeedDataSourceManager__handleMoreContentLoadedWithDataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDataSource:changeDetails:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __74__PXDiscoveryFeedDataSourceManager__loadMoreContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleMoreContentLoadedWithDataSource:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __73__PXDiscoveryFeedDataSourceManager_loadMoreContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_loadMoreContentWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

@end
