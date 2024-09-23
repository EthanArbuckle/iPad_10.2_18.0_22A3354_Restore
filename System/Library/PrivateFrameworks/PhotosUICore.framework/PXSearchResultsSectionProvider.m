@implementation PXSearchResultsSectionProvider

- (void)requestImageForAssetUUID:(id)a3 orAsset:(id)a4 withPhotoLibrary:(id)a5 cachingImageManager:(id)a6 imageRequestSize:(CGSize)a7 resultHandler:(id)a8
{
  CGFloat height;
  CGFloat width;
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  CGFloat v34;
  CGFloat v35;

  height = a7.height;
  width = a7.width;
  v16 = (unint64_t)a3;
  v17 = (unint64_t)a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  if (!(v16 | v17))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider+ImageRequests.m"), 30, CFSTR("Photos Search Results: Attempted to request image with nil asset UUID and nil asset."));

  }
  dispatch_get_global_queue(25, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __150__PXSearchResultsSectionProvider_ImageRequests__requestImageForAssetUUID_orAsset_withPhotoLibrary_cachingImageManager_imageRequestSize_resultHandler___block_invoke;
  block[3] = &unk_1E5139768;
  v29 = (id)v17;
  v30 = (id)v16;
  v32 = v19;
  v33 = v20;
  v31 = v18;
  v34 = width;
  v35 = height;
  v23 = v19;
  v24 = v20;
  v25 = v18;
  v26 = (id)v16;
  v27 = (id)v17;
  dispatch_async(v22, block);

}

- (void)requestImageForPersonUUID:(id)a3 photoLibrary:(id)a4 imageRequestSize:(CGSize)a5 displayScale:(double)a6 resultHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  double v28;

  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider+ImageRequests.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUID"));

  }
  dispatch_get_global_queue(25, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__PXSearchResultsSectionProvider_ImageRequests__requestImageForPersonUUID_photoLibrary_imageRequestSize_displayScale_resultHandler___block_invoke;
  block[3] = &unk_1E512CE48;
  v23 = v15;
  v24 = v14;
  v25 = v16;
  v26 = width;
  v27 = height;
  v28 = a6;
  v18 = v16;
  v19 = v14;
  v20 = v15;
  dispatch_async(v17, block);

}

void __132__PXSearchResultsSectionProvider_ImageRequests__requestImageForPersonUUID_photoLibrary_imageRequestSize_displayScale_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXPeopleFaceCropFetchOptions *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  PXPeopleFaceCropFetchOptions *v17;
  uint8_t buf[4];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptionsForPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CD16C0];
  v20[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchPersonsWithLocalIdentifiers:options:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v6, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __132__PXSearchResultsSectionProvider_ImageRequests__requestImageForPersonUUID_photoLibrary_imageRequestSize_displayScale_resultHandler___block_invoke_2;
    v11[3] = &unk_1E5147AB8;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "requestFaceCropForOptions:resultHandler:", v7, v11);

  }
  else
  {
    PLPhotosSearchGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Photos Search Results: Fetched person is nil for image request. Person UUID: %@", buf, 0xCu);
    }

    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __132__PXSearchResultsSectionProvider_ImageRequests__requestImageForPersonUUID_photoLibrary_imageRequestSize_displayScale_resultHandler___block_invoke_143;
    v16 = &unk_1E5148A40;
    v17 = (PXPeopleFaceCropFetchOptions *)*(id *)(a1 + 48);
    px_dispatch_on_main_queue();
    v7 = v17;
  }

}

uint64_t __132__PXSearchResultsSectionProvider_ImageRequests__requestImageForPersonUUID_photoLibrary_imageRequestSize_displayScale_resultHandler___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

void __132__PXSearchResultsSectionProvider_ImageRequests__requestImageForPersonUUID_photoLibrary_imageRequestSize_displayScale_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "CGRectValue");
  v13 = *(id *)(a1 + 32);
  v12 = v5;
  v9 = v7;
  v10 = v5;
  px_dispatch_on_main_queue();
  if (v9)
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "PXSearchResultsSectionProvider+ImageRequests: error requesting face crop: %@", buf, 0xCu);
    }

  }
}

uint64_t __132__PXSearchResultsSectionProvider_ImageRequests__requestImageForPersonUUID_photoLibrary_imageRequestSize_displayScale_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __150__PXSearchResultsSectionProvider_ImageRequests__requestImageForAssetUUID_orAsset_withPhotoLibrary_cachingImageManager_imageRequestSize_resultHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptionsForPhotoLibrary:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CD1390];
  v24[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAssetsWithLocalIdentifiers:options:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;

    v2 = v8;
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CD15A8], "px_searchRequestOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 56);
    v21 = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startCachingImagesForAssets:targetSize:contentMode:options:", v10, 1, v3, *(double *)(a1 + 72), *(double *)(a1 + 80));

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __150__PXSearchResultsSectionProvider_ImageRequests__requestImageForAssetUUID_orAsset_withPhotoLibrary_cachingImageManager_imageRequestSize_resultHandler___block_invoke_2;
    v14[3] = &unk_1E5147AB8;
    v11 = *(void **)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v11, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v2, 1, v3, v14, *(double *)(a1 + 72), *(double *)(a1 + 80));
    v6 = v15;
    goto LABEL_5;
  }
  PLPhotosSearchGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Photos Search Results: Fetched asset is nil image request. Asset UUID: %@", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __150__PXSearchResultsSectionProvider_ImageRequests__requestImageForAssetUUID_orAsset_withPhotoLibrary_cachingImageManager_imageRequestSize_resultHandler___block_invoke_134;
  v19 = &unk_1E5148A40;
  v20 = *(id *)(a1 + 64);
  px_dispatch_on_main_queue();

LABEL_5:
}

uint64_t __150__PXSearchResultsSectionProvider_ImageRequests__requestImageForAssetUUID_orAsset_withPhotoLibrary_cachingImageManager_imageRequestSize_resultHandler___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __150__PXSearchResultsSectionProvider_ImageRequests__requestImageForAssetUUID_orAsset_withPhotoLibrary_cachingImageManager_imageRequestSize_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v6 = v8;
  v7 = v5;
  px_dispatch_on_main_queue();

}

uint64_t __150__PXSearchResultsSectionProvider_ImageRequests__requestImageForAssetUUID_orAsset_withPhotoLibrary_cachingImageManager_imageRequestSize_resultHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (PXSearchResultsSectionProvider)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXSearchResultsSectionProvider *v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSearchResultsSectionProvider;
  v6 = -[PXSearchResultsSectionProvider init](&v9, sel_init);
  if (v6)
  {
    v6->identifier = sub_1A7ADF414();
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v6->_sectionsStartExpanded = 0;
    v7 = (void *)objc_opt_new();
    -[PXSearchResultsSectionProvider _setSearchResults:searchAssetResults:curatedAssetsFetchResult:reloadItemIdentifiers:localizedQueryString:searchQueryMatchInfo:](v6, "_setSearchResults:searchAssetResults:curatedAssetsFetchResult:reloadItemIdentifiers:localizedQueryString:searchQueryMatchInfo:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v7, MEMORY[0x1E0C9AA60], 0, 0);

  }
  return v6;
}

- (PHCachingImageManager)cachingImageManager
{
  PHCachingImageManager *cachingImageManager;
  PHCachingImageManager *v4;
  PHCachingImageManager *v5;

  cachingImageManager = self->_cachingImageManager;
  if (!cachingImageManager)
  {
    v4 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E0CD1488]);
    v5 = self->_cachingImageManager;
    self->_cachingImageManager = v4;

    cachingImageManager = self->_cachingImageManager;
  }
  return cachingImageManager;
}

- (void)setSearchQueryResult:(id)a3
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
  id v14;

  v5 = a3;
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryResult"));

    v5 = 0;
  }
  objc_msgSend(v5, "searchResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchAssetResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "curatedAssetsFetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadItemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedQueryString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchQueryMatchInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsSectionProvider _setSearchResults:searchAssetResults:curatedAssetsFetchResult:reloadItemIdentifiers:localizedQueryString:searchQueryMatchInfo:](self, "_setSearchResults:searchAssetResults:curatedAssetsFetchResult:reloadItemIdentifiers:localizedQueryString:searchQueryMatchInfo:", v6, v7, v8, v9, v11, v12);

}

- (void)_setSearchResults:(id)a3 searchAssetResults:(id)a4 curatedAssetsFetchResult:(id)a5 reloadItemIdentifiers:(id)a6 localizedQueryString:(id)a7 searchQueryMatchInfo:(id)a8
{
  id v15;
  id v16;
  id v17;
  __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v31 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (__CFString *)a7;
  v19 = a8;
  if (v31)
  {
    if (v15)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("allAssetSearchResults"));

    if (v17)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResults"));

  if (!v15)
    goto LABEL_11;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifiersToReload"));

LABEL_4:
  -[PXSearchResultsSectionProvider _sectionIdentifierToSectionMapWithResults:allAssetResults:assetsFetchResult:](self, "_sectionIdentifierToSectionMapWithResults:allAssetResults:assetsFetchResult:", v31, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsSectionProvider localizedQueryString](self, "localizedQueryString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", v18);

  if (v22)
  {
    -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __160__PXSearchResultsSectionProvider__setSearchResults_searchAssetResults_curatedAssetsFetchResult_reloadItemIdentifiers_localizedQueryString_searchQueryMatchInfo___block_invoke;
    v32[3] = &unk_1E5128BB0;
    v33 = v20;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v32);

  }
  -[PXSearchResultsSectionProvider setSectionIdentifierToSectionMap:](self, "setSectionIdentifierToSectionMap:", v20);
  objc_msgSend(v20, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsSectionProvider _sortedSectionIdentifiersForSections:](self, "_sortedSectionIdentifiersForSections:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsSectionProvider setSectionIdentifiers:](self, "setSectionIdentifiers:", v25);

  if (v18)
    v26 = v18;
  else
    v26 = &stru_1E5149688;
  -[PXSearchResultsSectionProvider setLocalizedQueryString:](self, "setLocalizedQueryString:", v26);
  -[PXSearchResultsSectionProvider setSearchQueryMatchInfo:](self, "setSearchQueryMatchInfo:", v19);
  -[PXSearchResultsSectionProvider changeObserver](self, "changeObserver");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "searchDataSourceSectionProviderDidChange:reloadItemIdentifiers:animateChanges:", self, v17, 0);

}

- (id)searchResultForIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestedResultIdentifier"));

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "searchResultForIdentifier:", v5);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)_searchResultsSectionForItemIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "searchResultForIdentifier:", v5);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          v8 = v11;

          goto LABEL_13;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v8;
}

- (id)assetSearchResultForAsset:(id)a3 inSection:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint8_t buf[4];
  int64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PXSearchResultsSectionProvider sectionIdentifiers](self, "sectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((a4 & 0x8000000000000000) == 0 && objc_msgSend(v8, "count") > (unint64_t)a4)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "type") != 17)
    {
      v14 = 0;
      goto LABEL_11;
    }
    v13 = v12;
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_6:
        objc_msgSend(v13, "searchResultForAsset:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 150, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResultsSection"), v19, v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 150, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResultsSection"), v19);
    }

    goto LABEL_6;
  }
  PXAssertGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v23 = a4;
    v24 = 2112;
    v25 = v9;
    _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Requested asset search result for section out of bounds. Section: %ld, sectionIdentifiers: %@", buf, 0x16u);
  }

  v14 = 0;
LABEL_12:

  return v14;
}

- (id)assetForSearchResult:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsSectionProvider _searchResultsSectionForItemIdentifier:](self, "_searchResultsSectionForItemIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") != 17)
  {
    v8 = 0;
    goto LABEL_6;
  }
  v7 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 165, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("section"), v12);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 165, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("section"), v12, v14);

    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v7, "assetForSearchResultIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

- (id)assetsFetchResultForSection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "type") != 17)
  {
    v9 = 0;
    goto LABEL_8;
  }
  v8 = v7;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 177, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("section"), v14);
LABEL_11:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 177, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("section"), v14, v16);

    goto LABEL_11;
  }
LABEL_6:
  objc_msgSend(v8, "curatedAssetFetchResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

- (BOOL)isSectionExpanded:(id)a3
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isExpanded");
  return (char)v6;
}

- (void)setExpanded:(BOOL)a3 forSection:(id)a4 sectionHeaderView:(id)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  v15 = a4;
  v9 = a5;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isExpanded") != v6)
  {
    objc_msgSend(v11, "setExpanded:", v6);
    -[PXSearchResultsSectionProvider changeObserver](self, "changeObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchDataSourceSectionProviderDidChange:animateChanges:", self, 1);

    if (v9)
    {
      -[PXSearchResultsSectionProvider _seeAllButtonTitleForSection:](self, "_seeAllButtonTitleForSection:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSeeAllButtonTitle:", v13);

    }
  }

}

- (unint64_t)searchResultTypeForSection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v12;
  void *v13;

  v5 = a3;
  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section"));

  }
  objc_msgSend(v7, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  v10 = objc_msgSend(v9, "type");

  return v10;
}

- (id)sections
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[PXSearchResultsSectionProvider sectionIdentifiers](self, "sectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXSearchResultsSectionProvider sectionIdentifiers](self, "sectionIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)_sectionIdentifierToSectionMapWithResults:(id)a3 allAssetResults:(id)a4 assetsFetchResult:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  id obj;
  _QWORD v31[4];
  id v32;
  PXSearchResultsSectionProvider *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v29 = a4;
  v28 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResults"));

  }
  v10 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v16 = -[PXSearchResultsSectionProvider _sectionTypeForSearchResult:](self, "_sectionTypeForSearchResult:", v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          v20 = (id)objc_opt_new();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v17);
        }

        objc_msgSend(v20, "addObject:", v15);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }

  v21 = (void *)objc_opt_new();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __110__PXSearchResultsSectionProvider__sectionIdentifierToSectionMapWithResults_allAssetResults_assetsFetchResult___block_invoke;
  v31[3] = &unk_1E5128BD8;
  v32 = v28;
  v33 = self;
  v34 = v29;
  v35 = v21;
  v22 = v21;
  v23 = v29;
  v24 = v28;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v31);
  v25 = (void *)objc_msgSend(v22, "copy");

  return v25;
}

- (int64_t)_sectionTypeForSearchResult:(id)a3
{
  id v5;
  id v6;
  int64_t v7;
  int64_t v8;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  switch(objc_msgSend(v5, "type"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 276, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v6 = v5;
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_6;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "px_descriptionForAssertionMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 281, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v13, v18);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 281, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v13);
      }

LABEL_6:
      v7 = -[PXSearchResultsSectionProvider _sectionTypeForAssetAggregationType:](self, "_sectionTypeForAssetAggregationType:", objc_msgSend(v6, "subtype"));
      goto LABEL_11;
    case 2:
      v6 = v5;
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_10;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "px_descriptionForAssertionMessage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 280, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v16, v20);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 280, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v16);
      }

LABEL_10:
      v7 = -[PXSearchResultsSectionProvider _sectionTypeForCollectionType:](self, "_sectionTypeForCollectionType:", objc_msgSend(v6, "subtype"));
LABEL_11:
      v8 = v7;

LABEL_14:
      return v8;
    case 3:
      v8 = 10;
      goto LABEL_14;
    case 4:
      v8 = 11;
      goto LABEL_14;
    default:
      v8 = 17;
      goto LABEL_14;
  }
}

- (int64_t)_sectionTypeForAssetAggregationType:(unint64_t)a3
{
  int64_t result;
  void *v6;

  result = 2;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 287, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 2uLL:
      result = 3;
      break;
    case 3uLL:
    case 4uLL:
      result = 4;
      break;
    case 5uLL:
      result = 1;
      break;
    case 6uLL:
      result = 5;
      break;
    case 7uLL:
      result = 6;
      break;
    case 8uLL:
      result = 7;
      break;
    case 9uLL:
      result = 12;
      break;
    case 0xAuLL:
      result = 13;
      break;
    case 0xBuLL:
      result = 14;
      break;
    case 0xCuLL:
      result = 15;
      break;
    case 0xDuLL:
      result = 16;
      break;
    case 0xEuLL:
      result = 18;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)_sectionTypeForCollectionType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  switch(a3)
  {
    case 1uLL:
      return 1;
    case 3uLL:
      return 8;
    case 0uLL:
      v13 = v4;
      v14 = v3;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v6, v5, v13, v14, v7, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 307, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return 9;
}

- (BOOL)_isTopAssetsSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[PXSearchResultsSectionProvider sectionIdentifiers](self, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type") == 17;

  return v9;
}

- (id)_sortedSectionIdentifiersForSections:(id)a3
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sections"));

  }
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)type
{
  return 2;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
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
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 344, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "visibleResultIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)registerClassesForCellReuseIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = objc_opt_class();
  +[PXSearchResultAssetCell reuseIdentifier](PXSearchResultAssetCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, void *))a3 + 2))(v4, v5, v6);

  v7 = objc_opt_class();
  +[PXSearchResultTitledCell reuseIdentifier](PXSearchResultTitledCell, "reuseIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, id))a3 + 2))(v4, v7, v8);

}

- (id)cellReuseIdentifierForItemIdentifier:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  __objc2_class **v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = a3;
  -[PXSearchResultsSectionProvider searchResultForIdentifier:](self, "searchResultForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 362, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  v7 = objc_msgSend(v6, "type");
  if ((unint64_t)(v7 - 1) < 4)
  {
    v8 = off_1E50B48B8;
LABEL_9:
    -[__objc2_class reuseIdentifier](*v8, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v7 == 5)
  {
    v8 = off_1E50B4898;
    goto LABEL_9;
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 375, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (void)configureCell:(id)a3 forItemIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[PXSearchResultsSectionProvider searchResultForIdentifier:](self, "searchResultForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  v10 = objc_msgSend(v9, "type");
  v11 = v7;
  v12 = v11;
  if (v10 != 5)
  {
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_12:
        -[PXSearchResultsSectionProvider _configureTitledCell:forSearchResult:](self, "_configureTitledCell:forSearchResult:", v12, v9);
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 399, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("cell"), v28, v34);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 399, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("cell"), v28);
    }

    goto LABEL_12;
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 387, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("cell"), v21, v30);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 387, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("cell"), v21);
  }

LABEL_6:
  -[PXSearchResultsSectionProvider _searchResultsSectionForItemIdentifier:](self, "_searchResultsSectionForItemIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 389, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section"));

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 390, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("section"), v25);
LABEL_24:

    goto LABEL_8;
  }
  v15 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_descriptionForAssertionMessage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 390, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("section"), v25, v32);

    goto LABEL_24;
  }
LABEL_8:
  objc_msgSend(v14, "assetForSearchResultIdentifier:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[PXSearchResultsSectionProvider _configureCellThumbnailImageWithAssetUUID:orAsset:forCell:](self, "_configureCellThumbnailImageWithAssetUUID:orAsset:forCell:", 0, v16, v12);
  }
  else
  {
    PXAssertGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v8;
      _os_log_fault_impl(&dword_1A6789000, v17, OS_LOG_TYPE_FAULT, "Asset unexpectedly nil during cell configuration for item identifier: %@", buf, 0xCu);
    }

  }
LABEL_17:

}

- (void)_configureTitledCell:(id)a3 forSearchResult:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  id v24;

  v24 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  switch(objc_msgSend(v7, "type"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 433, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      objc_msgSend(v24, "configureWithResult:", v7);
      v8 = v7;
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 410, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v12);
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 410, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v12, v13);
      goto LABEL_23;
    case 2:
      objc_msgSend(v24, "configureWithResult:", v7);
      v8 = v7;
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_12;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "px_descriptionForAssertionMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 417, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v12, v13);
LABEL_23:

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 417, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v12);
      }
LABEL_24:

LABEL_12:
      objc_msgSend(v8, "thumbnailAssetUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchResultsSectionProvider _configureCellThumbnailImageWithAssetUUID:orAsset:forCell:](self, "_configureCellThumbnailImageWithAssetUUID:orAsset:forCell:", v9, 0, v24);
      goto LABEL_13;
    case 3:
    case 4:
      objc_msgSend(v24, "configureWithResult:", v7);
      v8 = v7;
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_6;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "px_descriptionForAssertionMessage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 425, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v17, v19);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 425, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v17);
      }

LABEL_6:
      objc_msgSend(v8, "personUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchResultsSectionProvider _configureCellThumbnailImageWithPersonUUID:forCell:](self, "_configureCellThumbnailImageWithPersonUUID:forCell:", v9, v24);
LABEL_13:

LABEL_15:
LABEL_16:
      objc_msgSend(v24, "setIsAccessibilityElement:", 1);

      return;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 430, CFSTR("Photos Search Results: Attempted to configure titled cell for asset result. Asset results should use PXSearchResultAssetCell instead."));
      goto LABEL_15;
    default:
      goto LABEL_16;
  }
}

- (void)_configureCellThumbnailImageWithAssetUUID:(id)a3 orAsset:(id)a4 forCell:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t v33;

  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  if (!(v9 | v10))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 442, CFSTR("Photos Search Results: Attempted to configure result cell thumbnail image with nil asset UUID and nil asset."));

  }
  v13 = objc_msgSend(v11, "tag") + 1;
  objc_msgSend(v11, "setTag:", v13);
  objc_msgSend(v11, "setIsAccessibilityElement:", 1);
  objc_msgSend((id)v10, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v14);

  objc_msgSend(v11, "thumbnailImageViewPixelSize");
  v16 = v15;
  v18 = v17;
  -[PXSearchResultsSectionProvider photoLibrary](self, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsSectionProvider cachingImageManager](self, "cachingImageManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __92__PXSearchResultsSectionProvider__configureCellThumbnailImageWithAssetUUID_orAsset_forCell___block_invoke;
  v30[3] = &unk_1E5128C40;
  v21 = v11;
  v31 = v21;
  v33 = v13;
  v22 = (id)v10;
  v32 = v22;
  -[PXSearchResultsSectionProvider requestImageForAssetUUID:orAsset:withPhotoLibrary:cachingImageManager:imageRequestSize:resultHandler:](self, "requestImageForAssetUUID:orAsset:withPhotoLibrary:cachingImageManager:imageRequestSize:resultHandler:", v9, v22, v19, v20, v30, v16, v18);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v23 = objc_msgSend(v22, "px_isUnsavedSyndicatedAsset");
    if (v9)
    {
      v24 = (id)v9;
    }
    else
    {
      objc_msgSend(v22, "uuid");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;
    -[PXSearchResultsSectionProvider searchQueryMatchInfo](self, "searchQueryMatchInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ocrAssetUUIDs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "containsObject:", v25);

    if (v28)
      v29 = v23 | 2;
    else
      v29 = v23;
    if (objc_msgSend(v22, "isVideo"))
      v29 |= 4uLL;
    if (objc_msgSend(v22, "isFavorite"))
      v29 |= 0x10uLL;
    objc_msgSend(v21, "setAssetThumbnailBadgeTypes:forAsset:", (8 * (objc_msgSend(v22, "mediaSubtypes") & 1)) | v29, v22);

  }
}

- (void)_configureCellThumbnailImageWithPersonUUID:(id)a3 forCell:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "tag") + 1;
  objc_msgSend(v7, "setTag:", v8);
  +[PXSearchZeroKeywordCollectionViewCell thumbnailSize](PXSearchZeroKeywordCollectionViewCell, "thumbnailSize");
  v10 = v9;
  v12 = v11;
  -[PXSearchResultsSectionProvider photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  v16 = v15;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85__PXSearchResultsSectionProvider__configureCellThumbnailImageWithPersonUUID_forCell___block_invoke;
  v19[3] = &unk_1E5128C68;
  v21 = v6;
  v22 = v8;
  v20 = v7;
  v17 = v6;
  v18 = v7;
  -[PXSearchResultsSectionProvider requestImageForPersonUUID:photoLibrary:imageRequestSize:displayScale:resultHandler:](self, "requestImageForPersonUUID:photoLibrary:imageRequestSize:displayScale:resultHandler:", v17, v13, v19, v10, v12, v16);

}

- (void)registerClassesForSupplementaryViewReuseIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = *MEMORY[0x1E0DC48A8];
  +[PXSearchResultsHeaderView reuseIdentifier](PXSearchResultsHeaderView, "reuseIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, uint64_t, id))a3 + 2))(v4, v5, v6, v7);

}

- (id)supplementaryViewReuseIdentifierForKind:(id)a3 indexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if ((id)*MEMORY[0x1E0DC48A8] != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 515, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v9 = v8;
  +[PXSearchResultsHeaderView reuseIdentifier](PXSearchResultsHeaderView, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)configureSupplementaryView:(id)a3 kind:(id)a4 indexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  SEL v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((id)*MEMORY[0x1E0DC48A8] != v10)
    goto LABEL_7;
  v12 = v9;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 520, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("view"), v22);
LABEL_10:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 520, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("view"), v22, v24);

    goto LABEL_10;
  }
LABEL_4:
  -[PXSearchResultsSectionProvider sectionIdentifiers](self, "sectionIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v11, "section"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 523, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section"));

  }
  objc_msgSend(v16, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitleLabelString:", v17);
  -[PXSearchResultsSectionProvider _seeAllButtonTitleForSection:](self, "_seeAllButtonTitleForSection:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSeeAllButtonTitle:", v18);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__PXSearchResultsSectionProvider_configureSupplementaryView_kind_indexPath___block_invoke;
  v26[3] = &unk_1E5128C90;
  v26[4] = self;
  v27 = v16;
  v28 = a2;
  v19 = v16;
  objc_msgSend(v12, "setSectionIdentifier:seeAllButtonHandler:", v14, v26);

LABEL_7:
}

- (id)_seeAllButtonTitleForSection:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;

  v3 = a3;
  v4 = CFSTR("SEARCH_RESULTS_SECTION_SEE_ALL_BUTTON");
  if (objc_msgSend(v3, "type") != 17)
  {
    if (!objc_msgSend(v3, "isExpandable"))
    {
      v5 = &stru_1E5149688;
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isExpanded"))
      v4 = CFSTR("SEARCH_RESULTS_SECTION_SEE_LESS_BUTTON");
  }
  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v5;
}

- (id)_allAssetResultUUIDsForSection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v5 = a3;
  -[PXSearchResultsSectionProvider sectionIdentifierToSectionMap](self, "sectionIdentifierToSectionMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 610, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self.sectionIdentifierToSectionMap objectForKey:sectionIdentifier]"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 610, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self.sectionIdentifierToSectionMap objectForKey:sectionIdentifier]"), v12, v14);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v7, "allAssetResultUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)layoutForSectionIdentifier:(id)a3 environment:(id)a4 collectionViewLayoutMargins:(UIEdgeInsets)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;

  v8 = a3;
  v9 = a4;
  -[PXSearchResultsSectionProvider sectionIdentifiers](self, "sectionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v8);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionProvider.m"), 619, CFSTR("Failed to find sectionIdentifier: %@, in %@"), v8, self);

  }
  if (-[PXSearchResultsSectionProvider _isTopAssetsSection:](self, "_isTopAssetsSection:", v11))
    +[PXSearchResultsSectionProvider assetGridLayoutSectionWithEnvironment:](PXSearchResultsSectionProvider, "assetGridLayoutSectionWithEnvironment:", v9);
  else
    +[PXSearchResultsSectionProvider rowStyleLayoutSectionWithEnvironment:](PXSearchResultsSectionProvider, "rowStyleLayoutSectionWithEnvironment:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sectionIdentifiers: %@"), self->_sectionIdentifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifierToSectionMap: %@"), self->_sectionIdentifierToSectionMap);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v6 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained((id *)&self->changeObserver);
  objc_msgSend(v6, "stringWithFormat:", CFSTR("changeObserver: %@"), WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@>"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (PXSearchDataSourceSectionProviderChangeObserver)changeObserver
{
  return (PXSearchDataSourceSectionProviderChangeObserver *)objc_loadWeakRetained((id *)&self->changeObserver);
}

- (void)setChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->changeObserver, a3);
}

- (int64_t)identifier
{
  return self->identifier;
}

- (id)assetsSeeAllButtonHandler
{
  return self->_assetsSeeAllButtonHandler;
}

- (void)setAssetsSeeAllButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)collectionsSeeAllButtonHandler
{
  return self->_collectionsSeeAllButtonHandler;
}

- (void)setCollectionsSeeAllButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (void)setSearchQueryMatchInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)localizedQueryString
{
  return self->_localizedQueryString;
}

- (void)setLocalizedQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)sectionsStartExpanded
{
  return self->_sectionsStartExpanded;
}

- (void)setSectionsStartExpanded:(BOOL)a3
{
  self->_sectionsStartExpanded = a3;
}

- (BOOL)showAssetResults
{
  return self->_showAssetResults;
}

- (void)setShowAssetResults:(BOOL)a3
{
  self->_showAssetResults = a3;
}

- (ParsecReportingDelegate)parsecReportingDelegate
{
  return (ParsecReportingDelegate *)objc_loadWeakRetained((id *)&self->_parsecReportingDelegate);
}

- (void)setParsecReportingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_parsecReportingDelegate, a3);
}

- (NSDictionary)sectionIdentifierToSectionMap
{
  return self->_sectionIdentifierToSectionMap;
}

- (void)setSectionIdentifierToSectionMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (void)setSectionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setCachingImageManager:(id)a3
{
  objc_storeStrong((id *)&self->_cachingImageManager, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_cachingImageManager, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToSectionMap, 0);
  objc_destroyWeak((id *)&self->_parsecReportingDelegate);
  objc_storeStrong((id *)&self->_localizedQueryString, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong(&self->_collectionsSeeAllButtonHandler, 0);
  objc_storeStrong(&self->_assetsSeeAllButtonHandler, 0);
  objc_destroyWeak((id *)&self->changeObserver);
}

void __76__PXSearchResultsSectionProvider_configureSupplementaryView_kind_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  id v27;

  v27 = a2;
  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "searchResultTypeForSection:", v27);
  if ((unint64_t)(v6 - 1) >= 4)
  {
    if (v6 != 5)
    {
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXSearchResultsSectionProvider.m"), 554, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 32), "assetsSeeAllButtonHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_12;
    +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportShowMoreResultsSelected:searchResultsSection:", 1, *(_QWORD *)(a1 + 40));

    v10 = *(id *)(a1 + 40);
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_10:
        objc_msgSend(v10, "allAssetResultUUIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "assetsSeeAllButtonHandler");
        v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "localizedQueryString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "searchQueryMatchInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, void *, void *, void *))v15)[2](v15, v27, v14, v16, v17);

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 48);
      v24 = *(_QWORD *)(a1 + 32);
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, CFSTR("PXSearchResultsSectionProvider.m"), 536, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("section"), v22, v26);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 48);
      v20 = *(_QWORD *)(a1 + 32);
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("PXSearchResultsSectionProvider.m"), 536, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("section"), v22);
    }

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "collectionsSeeAllButtonHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportShowMoreResultsSelected:searchResultsSection:", objc_msgSend(*(id *)(a1 + 40), "isExpanded") ^ 1, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "parsecReportingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportVisibleSearchResultsToParsec");

    objc_msgSend(*(id *)(a1 + 32), "collectionsSeeAllButtonHandler");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, id))v10 + 2))(v10, v27, v5);
LABEL_11:

  }
LABEL_12:

}

void __85__PXSearchResultsSectionProvider__configureCellThumbnailImageWithPersonUUID_forCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "setThumbnailImage:", v5);
  }
  else
  {
    PLPhotosSearchGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Photos Search Results: Requested image returned nil for cell thumbnail image configuration.\nPerson UUID:%@\nReturned error: %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

void __92__PXSearchResultsSectionProvider__configureCellThumbnailImageWithAssetUUID_orAsset_forCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "setThumbnailImage:", v5);
  }
  else
  {
    PLPhotosSearchGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Photos Search Results: Requested image returned nil for cell thumbnail image configuration.\nAsset:%@\nReturned info: %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

uint64_t __71__PXSearchResultsSectionProvider__sortedSectionIdentifiersForSections___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __110__PXSearchResultsSectionProvider__sectionIdentifierToSectionMapWithResults_allAssetResults_assetsFetchResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  PXNewSearchResultAssetsSection *v6;
  PXNewSearchResultsSection *p_super;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v5 == 17)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count") && !objc_msgSend(*(id *)(a1 + 40), "showAssetResults"))
      goto LABEL_8;
    v6 = -[PXNewSearchResultAssetsSection initWithCuratedAssetSearchResults:curatedAssetSearchResultsFetchResult:allAssetSearchResults:]([PXNewSearchResultAssetsSection alloc], "initWithCuratedAssetSearchResults:curatedAssetSearchResultsFetchResult:allAssetSearchResults:", v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    p_super = &v6->super;
    v8 = 1;
  }
  else
  {
    p_super = -[PXNewSearchResultsSection initWithType:results:]([PXNewSearchResultsSection alloc], "initWithType:results:", v5, v10);
    v8 = objc_msgSend(*(id *)(a1 + 40), "sectionsStartExpanded");
    v6 = (PXNewSearchResultAssetsSection *)p_super;
  }
  -[PXNewSearchResultsSection setExpanded:](v6, "setExpanded:", v8);
  if (p_super)
  {
    -[PXNewSearchResultsSection identifier](p_super, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", p_super, v9);

  }
LABEL_8:

}

void __160__PXSearchResultsSectionProvider__setSearchResults_searchAssetResults_curatedAssetsFetchResult_reloadItemIdentifiers_localizedQueryString_searchQueryMatchInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExpanded");

  objc_msgSend(v7, "setExpanded:", v6);
}

+ (id)assetGridLayoutSectionWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PXSearchResultsSectionProvider _assetGridLayoutGroupWithEnvironment:](PXSearchResultsSectionProvider, "_assetGridLayoutGroupWithEnvironment:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchResultsSectionProvider _headerViewSupplementaryItem](PXSearchResultsSectionProvider, "_headerViewSupplementaryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    objc_msgSend(v6, "setContentInsets:", 0.0, 20.0, 0.0, 20.0);
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBoundarySupplementaryItems:", v7);

  objc_msgSend(v3, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "horizontalSizeClass");
  if (v9 == 2)
    v10 = 4;
  else
    v10 = 2;
  objc_msgSend(v5, "setContentInsetsReference:", v10);

  return v5;
}

+ (id)_assetGridLayoutGroupWithEnvironment:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  if (v4 == 1)
    v5 = 3;
  else
    v5 = 5;
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0 / (double)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:subitem:count:", v10, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 2.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterItemSpacing:", v12);

  return v11;
}

+ (id)rowStyleLayoutSectionWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4098]), "initWithAppearanceStyle:layoutEnvironment:", 2, v3);
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    +[PXLemonadePeopleCellSpecsConstants smallCornerRadius](PXLemonadePeopleCellSpecsConstants, "smallCornerRadius");
    objc_msgSend(v4, "setCornerRadius:");
  }
  objc_msgSend(v4, "setSectionHeaderHeight:", 0.0);
  objc_msgSend(v4, "setSectionFooterHeight:", 0.0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4090]), "initWithConfiguration:layoutEnvironment:", v4, v3);
  +[PXSearchResultsSectionProvider _headerViewSupplementaryItem](PXSearchResultsSectionProvider, "_headerViewSupplementaryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBoundarySupplementaryItems:", v7);

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    objc_msgSend(v5, "setInterGroupSpacing:", 7.0);
    v8 = 2;
  }
  else
  {
    objc_msgSend(v5, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    v8 = 4;
  }
  objc_msgSend(v5, "setContentInsetsReference:", v8);

  return v5;
}

+ (id)_headerViewSupplementaryItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 67.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v4, *MEMORY[0x1E0DC48A8], 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
