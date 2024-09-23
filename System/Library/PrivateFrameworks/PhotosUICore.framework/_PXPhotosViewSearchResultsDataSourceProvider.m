@implementation _PXPhotosViewSearchResultsDataSourceProvider

- (_PXPhotosViewSearchResultsDataSourceProvider)initWithAssetUUIDs:(id)a3 searchTitle:(id)a4 reverseSortOrder:(BOOL)a5
{
  id v9;
  id v10;
  _PXPhotosViewSearchResultsDataSourceProvider *v11;
  _PXPhotosViewSearchResultsDataSourceProvider *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXPhotosViewSearchResultsDataSourceProvider;
  v11 = -[_PXPhotosViewSearchResultsDataSourceProvider init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetUUIDs, a3);
    objc_storeStrong((id *)&v12->_title, a4);
    v12->_reverseSortOrder = a5;
  }

  return v12;
}

- (void)_updateConfiguration:(id)a3 fromDataSourceManager:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v5, "filterPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilterPredicate:", v6);

  v7 = objc_msgSend(v5, "ignoreSharedLibraryFilters");
  objc_msgSend(v9, "setIgnoreSharedLibraryFilters:", v7);
  v8 = objc_msgSend(v5, "libraryFilter");

  objc_msgSend(v9, "setLibraryFilter:", v8);
  if ((_DWORD)v7)
  {
    objc_msgSend(v9, "setLibraryFilterState:", 0);
    objc_msgSend(v9, "setLibraryFilter:", 0);
  }

}

- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PXPhotosDataSourceConfiguration *v8;
  void *v9;
  PXPhotosDataSourceConfiguration *v10;
  PXPhotosDataSource *v11;

  v4 = (void *)MEMORY[0x1E0CD1570];
  v5 = a3;
  objc_msgSend(v4, "px_searchAssetFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PXPhotosDataSourceConfiguration alloc];
  objc_msgSend(MEMORY[0x1E0CD1620], "emptyFetchResultWithPhotoLibrary:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXPhotosDataSourceConfiguration initWithAssetFetchResult:options:](v8, "initWithAssetFetchResult:options:", v9, 0);

  -[_PXPhotosViewSearchResultsDataSourceProvider _updateConfiguration:fromDataSourceManager:](self, "_updateConfiguration:fromDataSourceManager:", v10, v5);
  v11 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v10);

  return v11;
}

- (id)loadInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  void *v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *assetUUIDs;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXPhotosDataSourceConfiguration *v18;
  void *v19;
  PXPhotosDataSource *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3928];
  v5 = !self->_reverseSortOrder;
  v6 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v9);

  assetUUIDs = self->_assetUUIDs;
  if (!assetUUIDs)
    assetUUIDs = (NSArray *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), assetUUIDs);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalPredicate:", v11);

  objc_msgSend(v8, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v12, self->_title);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CD14E0];
  v24 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transientCollectionListWithCollections:title:", v15, self->_title);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v17, 0);
  v22 = v13;
  v23 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceConfiguration setExistingAssetCollectionFetchResults:](v18, "setExistingAssetCollectionFetchResults:", v19);

  -[_PXPhotosViewSearchResultsDataSourceProvider _updateConfiguration:fromDataSourceManager:](self, "_updateConfiguration:fromDataSourceManager:", v18, v6);
  v20 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v18);

  return v20;
}

- (id)localizedInitialLoadingStatusMessageForDataSourceManager:(id)a3
{
  return PXLocalizedStringFromTable(CFSTR("SEARCH_RESULTS_LOADING"), CFSTR("PhotosUICore"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

@end
