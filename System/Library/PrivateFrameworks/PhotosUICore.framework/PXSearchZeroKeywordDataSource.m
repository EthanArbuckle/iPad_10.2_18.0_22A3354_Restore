@implementation PXSearchZeroKeywordDataSource

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXSearchZeroKeywordDataSource)init
{
  PXSearchZeroKeywordDataSource *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *fetchQueue;
  PLSearchIndexSceneTaxonomyProvider *v5;
  PLSearchIndexSceneTaxonomyProvider *sceneTaxonomyProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchZeroKeywordDataSource;
  v2 = -[PXSearchZeroKeywordDataSource init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mobileslideshow.SearchZKFetchQueue", 0);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = (OS_dispatch_queue *)v3;

    v5 = (PLSearchIndexSceneTaxonomyProvider *)objc_alloc_init(MEMORY[0x1E0D71AD8]);
    sceneTaxonomyProvider = v2->_sceneTaxonomyProvider;
    v2->_sceneTaxonomyProvider = v5;

  }
  return v2;
}

+ (id)_fetchOptionsForPersonFetching
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(verifiedType = %ul || verifiedType = %ul) && type != %ul && faceCount > 0"), 1, 2, -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludedDetectionTypes:", v5);

  return v3;
}

+ (id)_fetchFinalMergeTargetPersonForPersonLocalIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchZeroKeywordDataSource+Fetching.m"), 42, CFSTR("localIdentifier is invalid: %@ function: %s"), v5, "+[PXSearchZeroKeywordDataSource(Fetching) _fetchFinalMergeTargetPersonForPersonLocalIdentifier:]");

  }
  objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchZeroKeywordDataSource+Fetching.m"), 44, CFSTR("personUUID is invalid: %@ function: %s"), v6, "+[PXSearchZeroKeywordDataSource(Fetching) _fetchFinalMergeTargetPersonForPersonLocalIdentifier:]");

  }
  +[PXSearchZeroKeywordDataSource _fetchOptionsForPersonFetching](PXSearchZeroKeywordDataSource, "_fetchOptionsForPersonFetching");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)_fetchKeyAssetsForAssetCollectionViewModels:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[3];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  NSStringFromSelector(sel_displayInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchZeroKeywordDataSource _fetchAssetCollectionsForIdentifiers:](PXSearchZeroKeywordDataSource, "_fetchAssetCollectionsForIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "localIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v10);
  }
  v32 = v8;

  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v17;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSortDescriptors:", v19);

  objc_msgSend(v15, "setFetchLimit:", 1);
  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v25, "displayInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (uuid IN %@)"), v20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setPredicate:", v28);

          +[PXSearchZeroKeywordDataSource _fetchKeyAssetOfAssetCollection:withOptions:](PXSearchZeroKeywordDataSource, "_fetchKeyAssetOfAssetCollection:withOptions:", v27, v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "firstObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v25, "setAsset:", v30);
            objc_msgSend(v25, "setAssetCollection:", v27);
            objc_msgSend(v30, "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v31);

          }
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v22);
  }

}

+ (void)_fetchAssetsForAssetViewModels:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__PXSearchZeroKeywordDataSource_Fetching___fetchAssetsForAssetViewModels___block_invoke;
  v20[3] = &unk_1E511D648;
  v21 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v20);
  +[PXSearchZeroKeywordDataSource _fetchAssetsWithLocalIdentifiers:](PXSearchZeroKeywordDataSource, "_fetchAssetsWithLocalIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __74__PXSearchZeroKeywordDataSource_Fetching___fetchAssetsForAssetViewModels___block_invoke_2;
  v18[3] = &unk_1E51478D8;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);
  v12 = v6;
  v13 = 3221225472;
  v14 = __74__PXSearchZeroKeywordDataSource_Fetching___fetchAssetsForAssetViewModels___block_invoke_3;
  v15 = &unk_1E511D670;
  v16 = v9;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v17;
  v11 = v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v12);
  objc_msgSend(v4, "removeObjectsInArray:", v10, v12, v13, v14, v15);

}

+ (id)_personsForLocalIdentifiers:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CD16C0];
  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchZeroKeywordDataSource _fetchOptionsForPersonFetching](PXSearchZeroKeywordDataSource, "_fetchOptionsForPersonFetching");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchPersonsWithLocalIdentifiers:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_zeroKeywordsFromDefaultKeywordStore
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0D71BE8]);
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchIndexZeroKeywordStoreFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithPath:", v4);

  objc_msgSend(v5, "currentZeroKeywordsForLibraryScope:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_fetchAssetCollectionsForIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CD1570];
  v4 = a3;
  objc_msgSend(v3, "px_searchAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_fetchKeyAssetOfAssetCollection:(id)a3 withOptions:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", a3, a4);
}

+ (id)_fetchAssetsWithLocalIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CD1570];
  v4 = a3;
  objc_msgSend(v3, "px_searchAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_fetchKeyAssetForSceneIdentifier:(int)a3 sceneTaxonomyProvider:(id)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (__int16)*MEMORY[0x1E0D72F48];
  objc_msgSend(v5, "searchIndexSceneTaxonomyForSceneAnalysisVersion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "nodeForSceneClassId:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchThreshold");
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetForSceneIdentifier:aboveConfidenceThreshold:minimumSceneAnalysisVersion:options:", v4, v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_13;
  }
  else
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = 67109376;
      v18 = v6;
      v19 = 1024;
      v20 = v4;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Unable to open scene taxonomy version: %i. Unable to provide key asset for scene zeroKeyword for sceneId %d", (uint8_t *)&v17, 0xEu);
    }

  }
  v12 = (__int16)*MEMORY[0x1E0D72F50];
  objc_msgSend(v5, "searchIndexSceneTaxonomyForSceneAnalysisVersion:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "nodeForSceneClassId:", v4);
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject searchThreshold](v15, "searchThreshold");
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetForSceneIdentifier:aboveConfidenceThreshold:minimumSceneAnalysisVersion:options:", v4, v12, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17 = 67109376;
      v18 = v12;
      v19 = 1024;
      v20 = v4;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "Unable to open scene taxonomy version: %i. Unable to provide key asset for scene zeroKeyword for sceneId %d", (uint8_t *)&v17, 0xEu);
    }
    v10 = 0;
  }

LABEL_13:
  return v10;
}

void __74__PXSearchZeroKeywordDataSource_Fetching___fetchAssetsForAssetViewModels___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "displayInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __74__PXSearchZeroKeywordDataSource_Fetching___fetchAssetsForAssetViewModels___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __74__PXSearchZeroKeywordDataSource_Fetching___fetchAssetsForAssetViewModels___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "displayInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PXSearchZeroKeywordDataSource_Fetching___fetchAssetsForAssetViewModels___block_invoke_4;
  v7[3] = &unk_1E5129B08;
  v8 = *(id *)(a1 + 32);
  v6 = v3;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(v6, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __74__PXSearchZeroKeywordDataSource_Fetching___fetchAssetsForAssetViewModels___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 40), "setAsset:", v6);
    v6 = v7;
    *a4 = 1;
  }

}

- (unint64_t)numberOfSections
{
  void *v2;
  unint64_t v3;

  -[PXSearchZeroKeywordDataSource sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PXSearchZeroKeywordDataSource sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218240;
      v11 = a3;
      v12 = 2048;
      v13 = objc_msgSend(v4, "count");
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Section (%ld) is greater than or equal to sections.count (%ld)", (uint8_t *)&v10, 0x16u);
    }

    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  return v7;
}

- (int64_t)sectionTypeForSection:(unint64_t)a3
{
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;

  -[PXSearchZeroKeywordDataSource sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchZeroKeywordDataSource.m"), 87, CFSTR("Section (%ld) is greater than or equal to sections.count (%ld)"), a3, objc_msgSend(v6, "count"));

  }
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sectionType");

  return v8;
}

- (int64_t)sectionForSectionType:(int64_t)a3
{
  void *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXSearchZeroKeywordDataSource sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PXSearchZeroKeywordDataSource_sectionForSectionType___block_invoke;
  v7[3] = &unk_1E5128CB8;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)titleForSection:(unint64_t)a3
{
  __CFString *v5;
  void *v6;

  switch(-[PXSearchZeroKeywordDataSource sectionTypeForSection:](self, "sectionTypeForSection:"))
  {
    case 0:
      v5 = CFSTR("SEARCH_HOME_MOMENTS_HEADER_TITLE");
      goto LABEL_8;
    case 1:
      -[PXSearchZeroKeywordDataSource _titleForPeopleSection:](self, "_titleForPeopleSection:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    case 2:
      v5 = CFSTR("SEARCH_HOME_PLACES_HEADER_TITLE");
      goto LABEL_8;
    case 3:
      v5 = CFSTR("SEARCH_HOME_CATEGORIES_HEADER_TITLE");
      goto LABEL_8;
    case 4:
      v5 = CFSTR("SEARCH_HOME_GROUPS_HEADER_TITLE");
LABEL_8:
      PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (id)viewModelsForSection:(int64_t)a3
{
  id v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[PXSearchZeroKeywordDataSource sectionForSectionType:](self, "sectionForSectionType:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    v8 = -[PXSearchZeroKeywordDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v6);
    if (v8 >= 1)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSearchZeroKeywordDataSource viewModelForIndexPath:](self, "viewModelForIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

      }
    }
  }
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

- (id)viewModelForIndexPath:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = objc_msgSend(v5, "section");
  -[PXSearchZeroKeywordDataSource sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchZeroKeywordDataSource.m"), 151, CFSTR("Section (%ld) is greater than or equal to sections.count (%@)"), v6, v7);

  }
  objc_msgSend(v7, "objectAtIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "row");
  if (v10 >= objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchZeroKeywordDataSource.m"), 154, CFSTR("Row (%ld) is greater than or equal to viewModels.count (%@)"), v10, v9);

  }
  objc_msgSend(v9, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)indexForPlaceKey:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = -[PXSearchZeroKeywordDataSource sectionForSectionType:](self, "sectionForSectionType:", 2);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXSearchZeroKeywordDataSource sections](self, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "viewModels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__PXSearchZeroKeywordDataSource_indexForPlaceKey___block_invoke;
    v11[3] = &unk_1E5128CE0;
    v12 = v4;
    v13 = &v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  }
  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)fetchItems
{
  -[PXSearchZeroKeywordDataSource fetchItems:](self, "fetchItems:", 0);
}

- (void)blockingFetchItems
{
  -[PXSearchZeroKeywordDataSource fetchItems:](self, "fetchItems:", 1);
}

- (void)fetchItems:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  _BOOL4 v23;
  _QWORD block[4];
  void (**v25)(_QWORD);
  _QWORD aBlock[4];
  id v27;
  NSObject *v28;
  id v29[2];
  id buf[2];

  v3 = a3;
  if (-[PXSearchZeroKeywordDataSource _shouldFetchItems](self, "_shouldFetchItems"))
  {
    v23 = v3;
    objc_msgSend((id)objc_opt_class(), "zeroKeywordLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (char *)os_signpost_id_generate(v5);
    v7 = v5;
    v8 = v7;
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v6, "ZeroKeywordDataSourceSetup", ", (uint8_t *)buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("PPT_ZeroKeywordRequestBegan"), 0);

    +[PXSearchZeroKeywordDataSource _zeroKeywordsFromDefaultKeywordStore](PXSearchZeroKeywordDataSource, "_zeroKeywordsFromDefaultKeywordStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("PPT_ZeroKeywordRequestFinished"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("PPT_ZeroKeywordDataSourceSetupBegan"), 0);

    +[PXSearchZeroKeywordDataSource _uniquePersonLocalIdentifiersForZeroKeywords:](PXSearchZeroKeywordDataSource, "_uniquePersonLocalIdentifiersForZeroKeywords:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchZeroKeywordDataSource _personsForLocalIdentifiers:](PXSearchZeroKeywordDataSource, "_personsForLocalIdentifiers:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchZeroKeywordDataSource _personsByLocalIdentifiers:allUniqueLocalIdentifiers:](PXSearchZeroKeywordDataSource, "_personsByLocalIdentifiers:allUniqueLocalIdentifiers:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchZeroKeywordDataSource sceneTaxonomyProvider](self, "sceneTaxonomyProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchZeroKeywordDataSource _sectionsForZeroKeywords:personsByLocalIdentifier:sceneTaxonomyProvider:](PXSearchZeroKeywordDataSource, "_sectionsForZeroKeywords:personsByLocalIdentifier:sceneTaxonomyProvider:", v10, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(buf, self);
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PXSearchZeroKeywordDataSource_fetchItems___block_invoke;
    aBlock[3] = &unk_1E513A518;
    objc_copyWeak(v29, buf);
    v18 = v16;
    v27 = v18;
    v19 = v8;
    v28 = v19;
    v29[1] = v6;
    v20 = (void (**)(_QWORD))_Block_copy(aBlock);
    v21 = v20;
    if (v23)
    {
      v20[2](v20);
    }
    else
    {
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __44__PXSearchZeroKeywordDataSource_fetchItems___block_invoke_2;
      block[3] = &unk_1E5148A40;
      v25 = v20;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    objc_destroyWeak(v29);
    objc_destroyWeak(buf);

  }
}

- (BOOL)hasZeroKeywords
{
  void *v3;
  void *v4;
  BOOL v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[PXSearchZeroKeywordDataSource sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXSearchZeroKeywordDataSource sections](self, "sections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;
    *((_BYTE *)v10 + 24) = v5;
  }
  else
  {
    +[PXSearchZeroKeywordDataSource _zeroKeywordsFromDefaultKeywordStore](PXSearchZeroKeywordDataSource, "_zeroKeywordsFromDefaultKeywordStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__PXSearchZeroKeywordDataSource_hasZeroKeywords__block_invoke;
    v8[3] = &unk_1E5128D08;
    v8[4] = &v9;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  }

  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)_zeroKeywordsFromDefaultKeywordStore
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchIndexZeroKeywordStoreFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BE8]), "initWithPath:", v3);
  objc_msgSend(v4, "currentZeroKeywordsForLibraryScope:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_shouldFetchItems
{
  NSObject *v3;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  -[PXSearchZeroKeywordDataSource fetchQueue](self, "fetchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PXSearchZeroKeywordDataSource__shouldFetchItems__block_invoke;
  block[3] = &unk_1E5139A08;
  objc_copyWeak(&v6, &location);
  block[4] = &v8;
  dispatch_sync(v3, block);

  LOBYTE(v3) = *((_BYTE *)v9 + 24) == 0;
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)v3;
}

- (id)_titleForPeopleSection:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  NSObject *v23;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  NSObject *v31;
  __int16 v32;
  NSObject *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[PXSearchZeroKeywordDataSource sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[PXSearchZeroKeywordDataSource sections](self, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject sectionType](v8, "sectionType") == 1)
    {
      -[NSObject viewModels](v8, "viewModels");
      v9 = objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v10)
      {
        v11 = v10;
        v25 = v8;
        v12 = 0;
        v13 = 0;
        v14 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v9);
            v16 = *(NSObject **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v17 = v16;
              -[NSObject person](v17, "person");
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = -[NSObject detectionType](v18, "detectionType");
              if ((v19 - 2) >= 3)
              {
                if (v19 == 1)
                {
                  ++v13;
                }
                else if (!v19)
                {
                  PLUIGetLog();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v31 = v18;
                    v32 = 2112;
                    v33 = v17;
                    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Unknown detection type for ZKW person: %@ for view model: %@", buf, 0x16u);
                  }

                }
              }
              else
              {
                ++v12;
              }

            }
            else
            {
              PXAssertGetLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v16;
                _os_log_error_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "People view model does not respond to person selector: %@", buf, 0xCu);
              }
            }

          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v11);
        if (v13 && v12)
        {
          PXLocalizedStringFromTable(CFSTR("SEARCH_HOME_PEOPLE_AND_PETS_HEADER_TITLE"), CFSTR("PhotosUICore"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v25;
LABEL_39:

          goto LABEL_40;
        }
        v8 = v25;
        if (v13)
        {
          v22 = CFSTR("SEARCH_HOME_PEOPLE_HEADER_TITLE");
LABEL_34:
          PXLocalizedStringFromTable(v22, CFSTR("PhotosUICore"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_39;
        }
        if (v12)
        {
          v22 = CFSTR("SEARCH_HOME_PETS_HEADER_TITLE");
          goto LABEL_34;
        }
      }
      PLUIGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v8;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "ZKW section of type PLSearchHomeSectionTypePeople has persons with no detection types: %@", buf, 0xCu);
      }

    }
    else
    {
      PXAssertGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v8;
        _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Unexpected non person section type for section %@", buf, 0xCu);
      }
    }
    v21 = 0;
    goto LABEL_39;
  }
  PXAssertGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Invalid ZKW section", buf, 2u);
  }
  v21 = 0;
LABEL_40:

  return v21;
}

- (void)ppt_prepareZeroKeywordRequest:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  v4 = (void (**)(_QWORD))a3;
  if (-[PXSearchZeroKeywordDataSource fetchInProgress](self, "fetchInProgress"))
  {
    v5 = _Block_copy(v4);

    -[PXSearchZeroKeywordDataSource performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_ppt_prepareZeroKeywordRequest_, v5, 1.0);
  }
  else
  {
    v4[2](v4);

    -[PXSearchZeroKeywordDataSource fetchItems](self, "fetchItems");
  }
}

- (id)tapToRadarAttachments
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-Summary.plist"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchZeroKeywordDataSource debugDictionary](self, "debugDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v9, "writeToURL:error:", v8, &v15);
  v11 = v15;
  if ((v10 & 1) != 0)
  {
    v16 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "%@ Failed to save tap-to-radar info, error: %@", buf, 0x16u);
    }

    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)debugDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  id obj;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[PXSearchZeroKeywordDataSource sections](self, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v3)
  {
    v4 = v3;
    v24 = *(_QWORD *)v31;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v6, "viewModels");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v27;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "debugDictionary");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v10);
        }

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("viewModels"));
        v15 = objc_msgSend(v6, "sectionType") - 1;
        v16 = CFSTR("PLSearchHomeSectionTypeEvents");
        if (v15 <= 3)
          v16 = off_1E5128D70[v15];
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("sectionType"));
        -[PXSearchZeroKeywordDataSource titleForSection:](self, "titleForSection:", -[PXSearchZeroKeywordDataSource sectionForSectionType:](self, "sectionForSectionType:", objc_msgSend(v6, "sectionType")));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("localizedTitle"));

        objc_msgSend(v25, "addObject:", v14);
        ++v5;
      }
      while (v5 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v21);

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("sections"));
  return v18;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PXSearchZeroKeywordDataSource debugDictionary](self, "debugDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PXSearchZeroKeywordChangeDelegate)delegate
{
  return (PXSearchZeroKeywordChangeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)fetchInProgress
{
  return self->_fetchInProgress;
}

- (void)setFetchInProgress:(BOOL)a3
{
  self->_fetchInProgress = a3;
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fetchQueue, a3);
}

- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider
{
  return self->_sceneTaxonomyProvider;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __50__PXSearchZeroKeywordDataSource__shouldFetchItems__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "fetchInProgress");

  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "setFetchInProgress:", 1);

  }
}

unint64_t __48__PXSearchZeroKeywordDataSource_hasZeroKeywords__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  unint64_t result;

  result = objc_msgSend(a3, "count");
  if (result >= 3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __44__PXSearchZeroKeywordDataSource_fetchItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setSections:", v2);

  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PPT_ZeroKeywordDataSourceSetupFinished"), 0);

  v8 = *(id *)(a1 + 40);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, v10, "ZeroKeywordDataSourceSetup", ", buf, 2u);
  }

  v11 = objc_loadWeakRetained(v3);
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didUpdateSections:", v6);

  v13 = objc_loadWeakRetained(v3);
  objc_msgSend(v13, "fetchQueue");
  v14 = objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_loadWeakRetained(v3);
    objc_msgSend(v15, "fetchQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      PXAssertGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_loadWeakRetained(v3);
        *(_DWORD *)buf = 138412290;
        v22 = v18;
        _os_log_error_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Fetch queue for PXSearchZeroKeywordDataSource (%@) is nil", buf, 0xCu);

      }
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PXSearchZeroKeywordDataSource_fetchItems___block_invoke_165;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v20, v3);
    dispatch_sync(v14, block);
    objc_destroyWeak(&v20);
  }

}

uint64_t __44__PXSearchZeroKeywordDataSource_fetchItems___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__PXSearchZeroKeywordDataSource_fetchItems___block_invoke_165(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFetchInProgress:", 0);

}

void __50__PXSearchZeroKeywordDataSource_indexForPlaceKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  id v11;

  v7 = a2;
  objc_msgSend(v7, "displayInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v7, "displayInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AC8]);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

uint64_t __55__PXSearchZeroKeywordDataSource_sectionForSectionType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "sectionType");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

+ (id)_uniquePersonLocalIdentifiersForZeroKeywords:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "objectForKey:", &unk_1E53ED560);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  objc_msgSend(v3, "objectForKey:", &unk_1E53ED578);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  v9 = (uint64_t *)MEMORY[0x1E0D72AA0];
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v34;
    v12 = *MEMORY[0x1E0D72AA0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }
  v26 = v7;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    v18 = *v9;
    v19 = *MEMORY[0x1E0D72AE0];
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKeyedSubscript:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v19);
          v24 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v24 = v22;
        }
        objc_msgSend(v4, "addObjectsFromArray:", v24);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v16);
  }

  return v4;
}

+ (id)_personsByLocalIdentifiers:(id)a3 allUniqueLocalIdentifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  const char *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v14, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);
        objc_msgSend(v8, "removeObject:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    v25 = v6;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v8;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
          +[PXSearchZeroKeywordDataSource _fetchFinalMergeTargetPersonForPersonLocalIdentifier:](PXSearchZeroKeywordDataSource, "_fetchFinalMergeTargetPersonForPersonLocalIdentifier:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 && (objc_msgSend(v9, "containsObject:", v22) & 1) == 0)
          {
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v21);
          }
          else
          {
            PLUIGetLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413058;
              v35 = v22;
              v36 = 2112;
              v37 = v7;
              v38 = 2112;
              v39 = v16;
              v40 = 2080;
              v41 = "+[PXSearchZeroKeywordDataSource _personsByLocalIdentifiers:allUniqueLocalIdentifiers:]";
              _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEFAULT, "PHPerson not added to personsByLocalIdentifier dictionary. Person: %@ personsByLocalIdentifier: %@ unusedLocalIdentifiers: %@ Function: %s", buf, 0x2Au);
            }

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
      }
      while (v18);
    }

    v6 = v25;
  }

  return v7;
}

+ (id)_socialGroupsByKeywordwithPersonsByLocalIdentifier:(id)a3 socialGroupZeroKeywords:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v25;
  uint64_t v26;
  id obj;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  const char *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v6;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v39;
    v7 = *MEMORY[0x1E0D72AA0];
    v26 = *MEMORY[0x1E0D72AE0];
    v29 = *MEMORY[0x1E0D72AA0];
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v32 = v9;
        v33 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v26);
          v12 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = v10;
        }
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v15 = v12;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v35 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v5, "objectForKeyedSubscript:", v20);
              v21 = objc_claimAutoreleasedReturnValue();
              if (!v21)
              {
                PLUIGetLog();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v43 = v20;
                  v44 = 2112;
                  v45 = v32;
                  v46 = 2080;
                  v47 = "+[PXSearchZeroKeywordDataSource _socialGroupsByKeywordwithPersonsByLocalIdentifier:socialGroupZeroKeywords:]";
                  _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEFAULT, "No PHPerson with local identifier: %@ for social group: %@ Function: %s", buf, 0x20u);
                }

                goto LABEL_24;
              }
              v22 = (void *)v21;
              if ((objc_msgSend(v14, "containsObject:", v20) & 1) == 0)
              {
                objc_msgSend(v13, "addObject:", v22);
                objc_msgSend(v14, "addObject:", v20);
              }

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
            if (v17)
              continue;
            break;
          }
        }

        if ((objc_msgSend(v28, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v13, v32);
          objc_msgSend(v28, "addObject:", v14);
        }
LABEL_24:

        v7 = v29;
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v31);
  }

  return v25;
}

+ (id)_sectionsForZeroKeywords:(id)a3 personsByLocalIdentifier:(id)a4 sceneTaxonomyProvider:(id)a5
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  void *v66;
  PXSearchZeroKeywordSection *v67;
  id v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  id v100;
  uint64_t v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v75 = a4;
  v69 = a5;
  v8 = 0x1E0C99000uLL;
  v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = 0;
  v76 = *MEMORY[0x1E0D72B00];
  v77 = *MEMORY[0x1E0D72AA0];
  v74 = *MEMORY[0x1E0D72AA8];
  v70 = v7;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(*(Class *)(v8 + 3560));
    switch(v9)
    {
      case 0:
        v73 = v9;
        v13 = objc_alloc_init(*(Class *)(v8 + 3560));
        v14 = objc_alloc_init(*(Class *)(v8 + 3560));
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v72 = v11;
        v15 = v11;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v83;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v83 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
              objc_msgSend(v20, "objectForKeyedSubscript:", v76);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "integerValue");

              switch(v22)
              {
                case 4:
                  +[PXSearchZeroKeywordDataSource _holidayViewModelForKeywordDictionary:](PXSearchZeroKeywordDataSource, "_holidayViewModelForKeywordDictionary:", v20);
                  v23 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_11;
                case 5:
                  +[PXSearchZeroKeywordDataSource _meaningViewModelForKeywordDictionary:](PXSearchZeroKeywordDataSource, "_meaningViewModelForKeywordDictionary:", v20);
                  v26 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_14;
                case 7:
                  +[PXSearchZeroKeywordDataSource _dateViewModelForKeywordDictionary:](PXSearchZeroKeywordDataSource, "_dateViewModelForKeywordDictionary:", v20);
                  v23 = objc_claimAutoreleasedReturnValue();
LABEL_11:
                  v24 = (void *)v23;
                  v25 = v13;
                  goto LABEL_15;
                case 8:
                  +[PXSearchZeroKeywordDataSource _seasonViewModelForKeywordDictionary:](PXSearchZeroKeywordDataSource, "_seasonViewModelForKeywordDictionary:", v20);
                  v26 = objc_claimAutoreleasedReturnValue();
LABEL_14:
                  v24 = (void *)v26;
                  v25 = v14;
LABEL_15:
                  objc_msgSend(v25, "addObject:", v24);
                  objc_msgSend(v12, "addObject:", v24);

                  break;
                default:
                  continue;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
          }
          while (v17);
        }

        +[PXSearchZeroKeywordDataSource _fetchAssetsForAssetViewModels:](PXSearchZeroKeywordDataSource, "_fetchAssetsForAssetViewModels:", v14);
        +[PXSearchZeroKeywordDataSource _fetchKeyAssetsForAssetCollectionViewModels:](PXSearchZeroKeywordDataSource, "_fetchKeyAssetsForAssetCollectionViewModels:", v13);
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v27 = v13;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v79;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v79 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
              objc_msgSend(v32, "asset");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v33)
                objc_msgSend(v12, "removeObject:", v32);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
          }
          while (v29);
        }

        goto LABEL_57;
      case 1:
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v27 = v11;
        v34 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
        if (!v34)
          goto LABEL_72;
        v35 = v34;
        v72 = v11;
        v73 = v9;
        v36 = *(_QWORD *)v95;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v95 != v36)
              objc_enumerationMutation(v27);
            v38 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * k);
            objc_msgSend(v38, "objectForKeyedSubscript:", v77);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "objectForKeyedSubscript:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[PXSearchZeroKeywordDataSource _personViewModelForKeywordDictionary:person:](PXSearchZeroKeywordDataSource, "_personViewModelForKeywordDictionary:person:", v38, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
              objc_msgSend(v12, "addObject:", v41);

          }
          v35 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
        }
        while (v35);
        goto LABEL_58;
      case 2:
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v27 = v11;
        v42 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
        if (!v42)
          goto LABEL_72;
        v43 = v42;
        v72 = v11;
        v73 = v9;
        v44 = *(_QWORD *)v87;
        v45 = v77;
        break;
      case 3:
        v56 = objc_msgSend(v11, "count");
        v98[0] = MEMORY[0x1E0C809B0];
        v57 = 8;
        if (v56 < 8)
          v57 = v56;
        v98[1] = 3221225472;
        v98[2] = __105__PXSearchZeroKeywordDataSource__sectionsForZeroKeywords_personsByLocalIdentifier_sceneTaxonomyProvider___block_invoke;
        v98[3] = &unk_1E5128D30;
        v101 = v57;
        v99 = v69;
        v100 = v12;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v98);

        v27 = v99;
        goto LABEL_72;
      case 4:
        v58 = v9;
        objc_msgSend(v7, "objectForKey:", &unk_1E53ED578);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXSearchZeroKeywordDataSource _socialGroupsByKeywordwithPersonsByLocalIdentifier:socialGroupZeroKeywords:](PXSearchZeroKeywordDataSource, "_socialGroupsByKeywordwithPersonsByLocalIdentifier:socialGroupZeroKeywords:", v75, v59);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v60 = v11;
        v61 = v11;
        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v91;
          do
          {
            for (m = 0; m != v63; ++m)
            {
              if (*(_QWORD *)v91 != v64)
                objc_enumerationMutation(v61);
              +[PXSearchZeroKeywordDataSource _socialGroupViewModelForKeywordDictionary:peopleByKeyword:](PXSearchZeroKeywordDataSource, "_socialGroupViewModelForKeywordDictionary:peopleByKeyword:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * m), v27);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              if (v66)
                objc_msgSend(v12, "addObject:", v66);

            }
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
          }
          while (v63);
        }

        v8 = 0x1E0C99000;
        v9 = v58;
        v11 = v60;
        goto LABEL_72;
      default:
        goto LABEL_73;
    }
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v87 != v44)
          objc_enumerationMutation(v27);
        v47 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v46);
        objc_msgSend(v47, "objectForKeyedSubscript:", v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v50 = 0;
          goto LABEL_50;
        }
        objc_msgSend(v47, "objectForKeyedSubscript:", v45);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", v74);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50 && objc_msgSend(v50, "BOOLValue"))
        {
          objc_msgSend(v47, "objectForKeyedSubscript:", v76);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "integerValue");

          if (v52 == 6)
          {
            +[PXSearchZeroKeywordDataSource _homeViewModelForKeywordDictionary:](PXSearchZeroKeywordDataSource, "_homeViewModelForKeywordDictionary:", v47);
            v53 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v52 != 2)
            {
              v45 = v77;
              goto LABEL_50;
            }
            +[PXSearchZeroKeywordDataSource placeViewModelForKeywordDictionary:](PXSearchZeroKeywordDataSource, "placeViewModelForKeywordDictionary:", v47);
            v53 = objc_claimAutoreleasedReturnValue();
          }
          v54 = (void *)v53;
          v45 = v77;
          if (v53)
          {
            objc_msgSend(v12, "addObject:", v53);

          }
        }
LABEL_50:

        ++v46;
      }
      while (v43 != v46);
      v55 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
      v43 = v55;
    }
    while (v55);
LABEL_57:
    v7 = v70;
LABEL_58:
    v8 = 0x1E0C99000;
    v11 = v72;
    v9 = v73;
LABEL_72:

LABEL_73:
    if ((unint64_t)objc_msgSend(v12, "count") >= 3)
    {
      v67 = -[PXSearchZeroKeywordSection initWithType:viewModels:]([PXSearchZeroKeywordSection alloc], "initWithType:viewModels:", v9, v12);
      objc_msgSend(v71, "addObject:", v67);

    }
    ++v9;
  }
  while (v9 != 5);

  return v71;
}

+ (id)_personViewModelForKeywordDictionary:(id)a3 person:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  PXSearchZeroKeywordPersonViewModel *v8;

  if (a4)
  {
    v5 = *MEMORY[0x1E0D72AF0];
    v6 = a4;
    objc_msgSend(a3, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXSearchZeroKeywordPersonViewModel initWithRepresentedObject:representedPerson:]([PXSearchZeroKeywordPersonViewModel alloc], "initWithRepresentedObject:representedPerson:", v7, v6);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)_socialGroupViewModelForKeywordDictionary:(id)a3 peopleByKeyword:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  PXSearchZeroKeywordSocialGroupViewModel *v13;

  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D72AA0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AE0]);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v8;
  }
  v11 = objc_msgSend(v6, "count");
  if (v11 == objc_msgSend(v10, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXSearchZeroKeywordSocialGroupViewModel initWithRepresentedObject:representedSocialGroup:]([PXSearchZeroKeywordSocialGroupViewModel alloc], "initWithRepresentedObject:representedSocialGroup:", v12, v6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_holidayViewModelForKeywordDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXSearchZeroKeywordHolidayViewModel *v8;

  v3 = *MEMORY[0x1E0D72AF8];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PXSearchZeroKeywordHolidayViewModel initWithTitle:representedObject:displayInfo:]([PXSearchZeroKeywordHolidayViewModel alloc], "initWithTitle:representedObject:displayInfo:", v5, v6, v7);
  return v8;
}

+ (id)_dateViewModelForKeywordDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXSearchZeroKeywordDateViewModel *v8;

  v3 = *MEMORY[0x1E0D72AF8];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PXSearchZeroKeywordDateViewModel initWithTitle:representedObject:displayInfo:]([PXSearchZeroKeywordDateViewModel alloc], "initWithTitle:representedObject:displayInfo:", v5, v6, v7);
  return v8;
}

+ (id)placeViewModelForKeywordDictionary:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PXSearchZeroKeywordTopPlaceViewModel *v21;

  v4 = *MEMORY[0x1E0D72AF8];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_regionFromDisplayInfo:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = v8;
    goto LABEL_5;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AC8]);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D72AB0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AB0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_5:
    v20 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_6;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v21 = -[PXSearchZeroKeywordTopPlaceViewModel initWithTitle:representedObject:fullGeoLocationName:keyAssetLocalIdentifiers:region:]([PXSearchZeroKeywordTopPlaceViewModel alloc], "initWithTitle:representedObject:fullGeoLocationName:keyAssetLocalIdentifiers:region:", v6, v7, v17, v20, v10, v12, v14, v16);

  return v21;
}

+ ($FF1229205817863B52D17A627F035FCE)_regionFromDisplayInfo:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  CLLocationDegrees v12;
  float v13;
  $FF1229205817863B52D17A627F035FCE *result;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AC0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "px_descriptionForAssertionMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a3, a2, CFSTR("PXSearchZeroKeywordDataSource.m"), 557, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("displayInfo[PLSearchHomeItemContextDisplayInfo_LatitudeKey]"), v17, v18);

      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AD8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "px_descriptionForAssertionMessage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, a2, CFSTR("PXSearchZeroKeywordDataSource.m"), 558, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("displayInfo[PLSearchHomeItemContextDisplayInfo_LongitudeKey]"), v21, v22);

      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "px_descriptionForAssertionMessage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a3, a2, CFSTR("PXSearchZeroKeywordDataSource.m"), 559, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("displayInfo[PLSearchHomeItemContextDisplayInfo_LatitudeDeltaKey]"), v25, v26);

      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AD0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a3, a2, CFSTR("PXSearchZeroKeywordDataSource.m"), 560, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("displayInfo[PLSearchHomeItemContextDisplayInfo_LongitudeDeltaKey]"), v29, v30);

      if (v7)
        goto LABEL_14;
    }
    else if (v7)
    {
LABEL_14:
      if (v8 && v9 && v10)
      {
        objc_msgSend(v7, "floatValue");
        v12 = v11;
        objc_msgSend(v8, "floatValue");
        CLLocationCoordinate2DMake(v12, v13);
        objc_msgSend(v9, "floatValue");
        objc_msgSend(v10, "floatValue");
      }
    }

  }
  return result;
}

+ (id)_homeViewModelForKeywordDictionary:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PXSearchZeroKeywordHomeViewModel *v21;

  v4 = *MEMORY[0x1E0D72AF8];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_regionFromDisplayInfo:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = v8;
    goto LABEL_5;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AC8]);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D72AB0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AB0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_5:
    v20 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_6;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v21 = -[PXSearchZeroKeywordHomeViewModel initWithTitle:representedObject:fullGeoLocationName:keyAssetLocalIdentifiers:region:]([PXSearchZeroKeywordHomeViewModel alloc], "initWithTitle:representedObject:fullGeoLocationName:keyAssetLocalIdentifiers:region:", v6, v7, v17, v20, v10, v12, v14, v16);

  return v21;
}

+ (id)_meaningViewModelForKeywordDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXSearchZeroKeywordMeaningViewModel *v8;

  v3 = *MEMORY[0x1E0D72AF8];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PXSearchZeroKeywordMeaningViewModel initWithTitle:representedObject:displayInfo:]([PXSearchZeroKeywordMeaningViewModel alloc], "initWithTitle:representedObject:displayInfo:", v5, v6, v7);
  return v8;
}

+ (id)_seasonViewModelForKeywordDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXSearchZeroKeywordSeasonViewModel *v8;

  v3 = *MEMORY[0x1E0D72AF8];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PXSearchZeroKeywordSeasonViewModel initWithTitle:representedObject:displayInfo:]([PXSearchZeroKeywordSeasonViewModel alloc], "initWithTitle:representedObject:displayInfo:", v5, v6, v7);
  return v8;
}

+ (id)_sceneViewModelForKeywordDictionary:(id)a3 sceneTaxonomyProvider:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PXSearchZeroKeywordSceneViewModel *v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D72AF8];
  v7 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AA0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchZeroKeywordDataSource _fetchKeyAssetForSceneIdentifier:sceneTaxonomyProvider:](PXSearchZeroKeywordDataSource, "_fetchKeyAssetForSceneIdentifier:sceneTaxonomyProvider:", objc_msgSend(v10, "intValue"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[PXSearchZeroKeywordSceneViewModel initWithTitle:representedObject:sceneId:keyAsset:]([PXSearchZeroKeywordSceneViewModel alloc], "initWithTitle:representedObject:sceneId:keyAsset:", v8, v9, v10, v11);
  }
  else
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "No key asset found for Scene ZeroKeyword. Not using ZeroKeyword: %@", (uint8_t *)&v15, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)zeroKeywordLog
{
  if (zeroKeywordLog_onceToken != -1)
    dispatch_once(&zeroKeywordLog_onceToken, &__block_literal_global_117670);
  return (id)zeroKeywordLog_actionPerformerLog;
}

void __47__PXSearchZeroKeywordDataSource_zeroKeywordLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui.search", "ZeroKeywordDataSourceSetup");
  v1 = (void *)zeroKeywordLog_actionPerformerLog;
  zeroKeywordLog_actionPerformerLog = (uint64_t)v0;

}

void __105__PXSearchZeroKeywordDataSource__sectionsForZeroKeywords_personsByLocalIdentifier_sceneTaxonomyProvider___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;

  if (*(_QWORD *)(a1 + 48) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    +[PXSearchZeroKeywordDataSource _sceneViewModelForKeywordDictionary:sceneTaxonomyProvider:](PXSearchZeroKeywordDataSource, "_sceneViewModelForKeywordDictionary:sceneTaxonomyProvider:", a2, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      v5 = v6;
    }

  }
}

@end
