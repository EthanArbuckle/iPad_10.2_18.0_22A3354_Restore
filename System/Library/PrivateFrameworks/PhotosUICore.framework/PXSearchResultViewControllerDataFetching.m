@implementation PXSearchResultViewControllerDataFetching

+ (id)photosViewConfigurationForAssetAggregationSearchResult:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "assetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXPhotosViewConfigurationForSearchResultsWithAllowedAssetUUIDs(v10, v11, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setOneUpPresentationOrigin:", 35);
  return v12;
}

+ (id)photosViewConfigurationForAlbumSearchResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  v6 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v5, "collectionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localIdentifierWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CD13B8];
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchAssetCollectionsWithLocalIdentifiers:options:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    _PXPhotosViewConfigurationForAssetCollectionFetchResultIgnoreSharedLibrary(v13, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOneUpPresentationOrigin:", 35);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)photosViewConfigurationForCollectionSearchResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  +[PXSearchResultViewControllerDataFetching _fetchAssetCollectionsForCollectionSearchResult:](PXSearchResultViewControllerDataFetching, "_fetchAssetCollectionsForCollectionSearchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    _PXPhotosViewConfigurationForAssetCollectionFetchResultIgnoreSharedLibrary(v6, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOneUpPresentationOrigin:", 35);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_fetchAssetCollectionsForCollectionSearchResult:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  v6 = objc_msgSend(v5, "subtype");
  if (v6 != 2 && v6 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 78, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v7 = (void *)objc_opt_class();
  objc_msgSend(v5, "collectionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localIdentifierWithUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setIncludeLocalMemories:", 1);
  v12 = (void *)MEMORY[0x1E0CD13B8];
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)photosDetailsContextForCollectionSearchResult:(id)a3
{
  void *v3;
  PXPhotosDataSourceConfiguration *v4;
  void *v5;
  PXPhotosDataSource *v6;
  PXPhotosDetailsContext *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[PXSearchResultViewControllerDataFetching _fetchAssetCollectionsForCollectionSearchResult:](PXSearchResultViewControllerDataFetching, "_fetchAssetCollectionsForCollectionSearchResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v3, 0);
    -[PXPhotosDataSourceConfiguration setLibraryFilterState:](v4, "setLibraryFilterState:", 0);
    -[PXPhotosDataSourceConfiguration setLibraryFilter:](v4, "setLibraryFilter:", 0);
    v9[0] = *MEMORY[0x1E0CD1958];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v4, "setFetchPropertySets:", v5);

    v6 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v4);
    v7 = -[PXPhotosDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]([PXPhotosDetailsContext alloc], "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:", v6, 0, 0, 0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)storyConfigurationForCollectionSearchResult:(id)a3
{
  void *v3;
  PXStoryConfiguration *v4;
  void *v5;
  PXStoryConfiguration *v6;

  +[PXSearchResultViewControllerDataFetching _fetchAssetCollectionsForCollectionSearchResult:](PXSearchResultViewControllerDataFetching, "_fetchAssetCollectionsForCollectionSearchResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = [PXStoryConfiguration alloc];
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXStoryConfiguration initWithAssetCollection:](v4, "initWithAssetCollection:", v5);

    -[PXStoryConfiguration setLaunchType:](v6, "setLaunchType:", CFSTR("Search"));
    -[PXStoryConfiguration setOptions:](v6, "setOptions:", -[PXStoryConfiguration options](v6, "options") | 0x200);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)personForPersonSearchResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  objc_msgSend(v5, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIncludedDetectionTypes:", v10);

  v11 = (void *)MEMORY[0x1E0CD16C0];
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchPersonsWithLocalIdentifiers:options:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)assetCollectionForAssetAggregationSearchResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  objc_msgSend(v5, "assetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assetCollectionForAssetUUIDs:title:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)assetCollectionForAlbumSearchResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  objc_msgSend(v5, "collectionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "localIdentifierWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CD13B8];
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAssetCollectionsWithLocalIdentifiers:options:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)assetCollectionForAssetUUIDs:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultViewControllerDataFetching.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUIDs"));

  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInternalPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
