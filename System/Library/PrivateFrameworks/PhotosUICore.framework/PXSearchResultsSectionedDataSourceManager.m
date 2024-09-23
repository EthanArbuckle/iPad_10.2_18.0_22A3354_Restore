@implementation PXSearchResultsSectionedDataSourceManager

- (PXSearchResultsSectionedDataSourceManager)initWithSearchSectionedDataSource:(id)a3
{
  id v4;
  PXSearchResultsSectionedDataSourceManager *v5;
  PXSearchResultsSectionedDataSourceManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXSearchResultsSectionedDataSourceManager;
  v5 = -[PXSearchResultsSectionedDataSourceManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PXSearchResultsSectionedDataSourceManager setSearchResultsDataSource:](v5, "setSearchResultsDataSource:", v4);

  return v6;
}

- (void)prepareDataSourceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PXSearchResultsSectionedDataSourceManager setCachingImageManager:](self, "setCachingImageManager:", v5);

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PXSearchResultsSectionedDataSourceManager_prepareDataSourceWithCompletion___block_invoke;
  v10[3] = &unk_1E512CFB8;
  v10[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  objc_msgSend(v7, "preWarmSearchIndexSynchronously:completion:", 0, v10);

}

- (void)mergePendingChanges
{
  id v2;

  -[PXSearchResultsSectionedDataSourceManager searchResultsDataSource](self, "searchResultsDataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergePendingChanges");

}

- (BOOL)resultsReady
{
  void *v2;
  char v3;

  -[PXSearchResultsSectionedDataSourceManager searchResultsDataSource](self, "searchResultsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resultsReady");

  return v3;
}

- (BOOL)queryHasChanged:(id)a3 maxSuggestionCount:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[PXSearchResultsSectionedDataSourceManager activeSearch](self, "activeSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    -[PXSearchResultsSectionedDataSourceManager setActiveSearch:](self, "setActiveSearch:", v6);
    -[PXSearchResultsSectionedDataSourceManager searchResultsDataSource](self, "searchResultsDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "representedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "priorityAssetUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSearchString:representedObjects:maxSuggestionCount:priorityAssetUUID:libraryScope:", v10, v11, a4, v12, objc_msgSend(v6, "libraryScope"));

  }
  return v8 ^ 1;
}

- (void)startMonitoringSearchIndexStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  -[PXSearchResultsSectionedDataSourceManager searchIndexStatusTimer](self, "searchIndexStatusTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  if (!v5)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetsdClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "libraryInternalClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E88];
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __92__PXSearchResultsSectionedDataSourceManager_startMonitoringSearchIndexStatusWithCompletion___block_invoke;
    v16[3] = &unk_1E512D030;
    v12 = v10;
    v17 = v12;
    objc_copyWeak(&v19, &location);
    v18 = v4;
    objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 1, v16, 10.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultsSectionedDataSourceManager setSearchIndexStatusTimer:](self, "setSearchIndexStatusTimer:", v13);
    objc_msgSend(v13, "fire");

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  dispatch_get_global_queue(17, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __92__PXSearchResultsSectionedDataSourceManager_startMonitoringSearchIndexStatusWithCompletion___block_invoke_4;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v14, block);

}

- (void)stopMonitoringSearchIndexStatus
{
  void *v3;

  -[PXSearchResultsSectionedDataSourceManager searchIndexStatusTimer](self, "searchIndexStatusTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PXSearchResultsSectionedDataSourceManager setSearchIndexStatusTimer:](self, "setSearchIndexStatusTimer:", 0);
}

- (void)searchResultsDataSource:(id)a3 didChangeThumbnailAssetsForSearchResult:(id)a4 topAssetsSectionExists:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[PXSearchResultsSectionedDataSourceManager delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchResultsDataSource:didChangeThumbnailAssetsForSearchResult:topAssetsSectionExists:", v9, v8, v5);

}

- (void)searchResultsDataSource:(id)a3 didFetchAssetsForSearchResult:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PXSearchResultsSectionedDataSourceManager delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchResultsDataSource:didFetchAssetsForSearchResult:indexPath:", v10, v9, v8);

}

- (void)searchResultsDataSourceHasPendingChanges:(id)a3 shouldMergePendingChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PXSearchResultsSectionedDataSourceManager delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchResultsDataSourceHasPendingChanges:shouldMergePendingChanges:", v6, v4);

}

- (void)searchResultsDataSource:(id)a3 didChangeThumbnailAssetsForSearchResult:(id)a4 atIndexes:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PXSearchResultsSectionedDataSourceManager delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchResultsDataSource:didChangeThumbnailAssetsForSearchResult:atIndexes:", v10, v9, v8);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PXSearchResultsSectionedDataSourceManager searchResultsDataSource](self, "searchResultsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setChangeObserver:", 0);

  -[PXSearchResultsSectionedDataSourceManager searchResultsDataSource](self, "searchResultsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)PXSearchResultsSectionedDataSourceManager;
  -[PXSearchResultsSectionedDataSourceManager dealloc](&v5, sel_dealloc);
}

- (NSDictionary)debugDictionary
{
  void *v2;
  void *v3;

  -[PXSearchResultsSectionedDataSourceManager searchResultsDataSource](self, "searchResultsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (PXSearchActiveSearch)activeSearch
{
  return self->_activeSearch;
}

- (void)setActiveSearch:(id)a3
{
  objc_storeStrong((id *)&self->_activeSearch, a3);
}

- (PHCachingImageManager)cachingImageManager
{
  return self->_cachingImageManager;
}

- (void)setCachingImageManager:(id)a3
{
  objc_storeStrong((id *)&self->_cachingImageManager, a3);
}

- (PXSearchResultsSectionedDataSource)searchResultsDataSource
{
  return self->_searchResultsDataSource;
}

- (void)setSearchResultsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsDataSource, a3);
}

- (BOOL)isIndexingPaused
{
  return self->_isIndexingPaused;
}

- (void)setIsIndexingPaused:(BOOL)a3
{
  self->_isIndexingPaused = a3;
}

- (unint64_t)itemsRemainingCount
{
  return self->_itemsRemainingCount;
}

- (void)setItemsRemainingCount:(unint64_t)a3
{
  self->_itemsRemainingCount = a3;
}

- (PXSearchResultsSectionedDataSourceChangeObserver)delegate
{
  return (PXSearchResultsSectionedDataSourceChangeObserver *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PSIDatabase)psiSearchIndex
{
  return self->_psiSearchIndex;
}

- (void)setPsiSearchIndex:(id)a3
{
  objc_storeStrong((id *)&self->_psiSearchIndex, a3);
}

- (NSTimer)searchIndexStatusTimer
{
  return self->_searchIndexStatusTimer;
}

- (void)setSearchIndexStatusTimer:(id)a3
{
  objc_storeStrong((id *)&self->_searchIndexStatusTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchIndexStatusTimer, 0);
  objc_storeStrong((id *)&self->_psiSearchIndex, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchResultsDataSource, 0);
  objc_storeStrong((id *)&self->_cachingImageManager, 0);
  objc_storeStrong((id *)&self->_activeSearch, 0);
}

void __92__PXSearchResultsSectionedDataSourceManager_startMonitoringSearchIndexStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__PXSearchResultsSectionedDataSourceManager_startMonitoringSearchIndexStatusWithCompletion___block_invoke_2;
  v5[3] = &unk_1E512D008;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "getSearchIndexProgress:", v5);

  objc_destroyWeak(&v7);
}

uint64_t __92__PXSearchResultsSectionedDataSourceManager_startMonitoringSearchIndexStatusWithCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "updateSearchMetadata");
}

void __92__PXSearchResultsSectionedDataSourceManager_startMonitoringSearchIndexStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  _QWORD v6[4];
  id v7;
  id v8[2];
  char v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__PXSearchResultsSectionedDataSourceManager_startMonitoringSearchIndexStatusWithCompletion___block_invoke_3;
  v6[3] = &unk_1E512CFE0;
  objc_copyWeak(v8, (id *)(a1 + 40));
  v9 = a3;
  v8[1] = a2;
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(v8);
}

uint64_t __92__PXSearchResultsSectionedDataSourceManager_startMonitoringSearchIndexStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsIndexingPaused:", v2);

  v5 = *(_QWORD *)(a1 + 48);
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setItemsRemainingCount:", v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__PXSearchResultsSectionedDataSourceManager_prepareDataSourceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  PXSearchResultsSectionedDataSource *v3;
  void *v4;
  void *v5;
  PXSearchResultsSectionedDataSource *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPsiSearchIndex:", a2);
    v3 = [PXSearchResultsSectionedDataSource alloc];
    objc_msgSend(*(id *)(a1 + 32), "psiSearchIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXSearchResultsSectionedDataSource initWithSearchIndex:photoLibrary:](v3, "initWithSearchIndex:photoLibrary:", v4, v5);
    objc_msgSend(*(id *)(a1 + 32), "setSearchResultsDataSource:", v6);

    objc_msgSend(*(id *)(a1 + 32), "searchResultsDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChangeObserver:", *(_QWORD *)(a1 + 32));

    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "searchResultsDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v9 != 0);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
