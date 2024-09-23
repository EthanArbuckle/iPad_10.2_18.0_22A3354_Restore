@implementation PXForYouSuggestionAssetsDataSourceManager

- (PXForYouSuggestionAssetsDataSourceManager)initWithSuggestionsDataSourceManager:(id)a3
{
  id v5;
  PXForYouSuggestionAssetsDataSourceManager *v6;
  PXForYouSuggestionAssetsDataSourceManager *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXForYouSuggestionAssetsDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestionsDataSourceManager, a3);
    objc_msgSend(v5, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionAssetsDataSourceManager setSuggestionsDataSource:](v7, "setSuggestionsDataSource:", v8);

    objc_msgSend(v5, "registerChangeObserver:context:", v7, dataSourceManagerObservationContext);
  }

  return v7;
}

- (NSString)collectionIdentifier
{
  void *v2;
  int v3;
  __CFString *v4;
  __CFString *v5;

  -[PXForYouSuggestionAssetsDataSourceManager suggestionsDataSourceManager](self, "suggestionsDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataSourceType");

  if (v3 == 2)
  {
    v4 = CFSTR("PXFeaturedPhotosVirtualCollection");
    v5 = CFSTR("PXFeaturedPhotosVirtualCollection");
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (id)createInitialDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXForYouSuggestionAssetsDataSourceManager suggestionsDataSource](self, "suggestionsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionAssetsDataSourceManager collectionIdentifier](self, "collectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dataSourceWithSuggestionsDataSource(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_registerChangeObserver:", self);

  return v5;
}

- (PXPhotosDataSource)photosDataSource
{
  void *v3;
  void *v4;
  void *v5;

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (PXPhotosDataSource *)v5;
}

- (NSDictionary)snapshotAssetToSuggestionMap
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  -[PXForYouSuggestionAssetsDataSourceManager suggestionsDataSource](self, "suggestionsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "numberOfSections") >= 1 && (v3 = objc_msgSend(v2, "numberOfItemsInSection:", 0)) != 0)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "identifier");
    if (v4 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v4; ++i)
      {
        v13[0] = v7;
        v13[1] = 0;
        v13[2] = i;
        v13[3] = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(v2, "objectAtIndexPath:", v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fetchKeyAssets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKey:", v9, v11);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  v9 = a3;
  if ((void *)dataSourceManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionAssetsDataSourceManager.m"), 129, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
    px_dispatch_on_main_queue();

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _OWORD v23[2];
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsAnyItems"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    if (v5)
      objc_msgSend(v5, "firstItemIndexPath");
    else
      memset(v23, 0, sizeof(v23));
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __78__PXForYouSuggestionAssetsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke;
    v19[3] = &unk_1E513B078;
    v7 = v5;
    v20 = v7;
    v21 = v4;
    v8 = v6;
    v22 = v8;
    objc_msgSend(v7, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v23, 0, v19);
    if (objc_msgSend(v8, "count"))
    {
      -[PXForYouSuggestionAssetsDataSourceManager suggestionsDataSource](self, "suggestionsDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXForYouSuggestionAssetsDataSourceManager collectionIdentifier](self, "collectionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      dataSourceWithSuggestionsDataSource(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v8);
      v13 = objc_alloc((Class)off_1E50B4A18);
      v14 = objc_msgSend(v7, "identifier");
      v15 = objc_msgSend(v11, "identifier");
      v24 = &unk_1E53ECC18;
      v25[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v13, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v14, v15, v18, v16, 0);

      -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v11, v17);
    }

  }
}

- (PXSuggestionsDataSourceManager)suggestionsDataSourceManager
{
  return self->_suggestionsDataSourceManager;
}

- (PXSuggestionsDataSource)suggestionsDataSource
{
  return self->_suggestionsDataSource;
}

- (void)setSuggestionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_suggestionsDataSourceManager, 0);
}

void __78__PXForYouSuggestionAssetsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v4;
  __int128 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _OWORD v10[2];

  v4 = *(void **)(a1 + 32);
  v5 = a2[1];
  v10[0] = *a2;
  v10[1] = v5;
  objc_msgSend(v4, "objectAtIndexPath:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (v7)
    {
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 40), "changeDetailsForObject:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "assetContentChanged"))
        objc_msgSend(*(id *)(a1 + 48), "addIndex:", *((_QWORD *)a2 + 2));

    }
  }

}

void __74__PXForYouSuggestionAssetsDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "suggestionsDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "suggestionsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSuggestionsDataSource:", v10);
  objc_msgSend(*(id *)(a1 + 32), "suggestionsDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v3, "identifier"), objc_msgSend(v10, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "collectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dataSourceWithSuggestionsDataSource(v10, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setDataSource:changeDetails:", v9, v7);
}

@end
