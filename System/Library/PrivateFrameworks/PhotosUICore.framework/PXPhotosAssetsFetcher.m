@implementation PXPhotosAssetsFetcher

+ (id)sharedFetcherForPhotoLibrary:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v10;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotosAssetsFetcher.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  if (sharedFetcherForPhotoLibrary__onceToken != -1)
    dispatch_once(&sharedFetcherForPhotoLibrary__onceToken, &__block_literal_global_144903);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__144849;
  v18 = __Block_byref_object_dispose__144850;
  v19 = 0;
  v6 = sharedFetcherForPhotoLibrary__fetchersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PXPhotosAssetsFetcher_sharedFetcherForPhotoLibrary___block_invoke_278;
  block[3] = &unk_1E5148AA8;
  v12 = v5;
  v13 = &v14;
  v7 = v5;
  dispatch_sync(v6, block);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (PXPhotosAssetsFetcher)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXPhotosAssetsFetcher *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  void *v10;
  int v11;
  uint64_t v12;
  NSMapTable *queue_cachedFetchResultsByContainerByConfiguration;
  id v14;
  void *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosAssetsFetcher;
  v6 = -[PXPhotosAssetsFetcher init](&v17, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.photos.assetsFetcher-queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "enableFetchResultCaching");

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v12 = objc_claimAutoreleasedReturnValue();
      queue_cachedFetchResultsByContainerByConfiguration = v6->_queue_cachedFetchResultsByContainerByConfiguration;
      v6->_queue_cachedFetchResultsByContainerByConfiguration = (NSMapTable *)v12;

    }
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PXPhotosAssetsFetcher.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    }
    v14 = objc_storeWeak((id *)&v6->_photoLibrary, v5);
    objc_msgSend(v5, "px_registerChangeObserver:", v6);

  }
  return v6;
}

void __54__PXPhotosAssetsFetcher_sharedFetcherForPhotoLibrary___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedFetcherForPhotoLibrary__sharedFetcherByPhotoLibrary;
  sharedFetcherForPhotoLibrary__sharedFetcherByPhotoLibrary = v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.photos.assetsfetcher-isolation-queue", v4);
  v3 = (void *)sharedFetcherForPhotoLibrary__fetchersQueue;
  sharedFetcherForPhotoLibrary__fetchersQueue = (uint64_t)v2;

}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "px_unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosAssetsFetcher;
  -[PXPhotosAssetsFetcher dealloc](&v4, sel_dealloc);
}

- (id)fetchAssetsInContainer:(id)a3 configuration:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  PXPhotosAssetsFetcher *v24;
  uint64_t v25;
  void *v26;
  char v27;
  char v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_msgSend(a4, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    switch(objc_msgSend(v8, "curationKind"))
    {
      case 0:
        objc_msgSend(v8, "filterPredicate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "inclusionPredicate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v8, "includeUnsavedSyndicatedAssets");
        v45 = objc_msgSend(v8, "includeAllBurstAssets");
        v43 = objc_msgSend(v8, "fetchLimit");
        v24 = self;
        v25 = objc_msgSend(v8, "options");
        objc_msgSend(v8, "sortDescriptors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v8, "reverseSortOrder");
        v28 = objc_msgSend(v8, "hideHiddenAssets");
        objc_msgSend(v8, "fetchPropertySets");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v8, "libraryFilter");
        LOBYTE(v42) = objc_msgSend(v8, "includeOthersInSocialGroupAssets");
        BYTE1(v41) = v28;
        LOBYTE(v41) = v27;
        -[PXPhotosAssetsFetcher _fetchAssetsInAssetCollection:withFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:](v24, "_fetchAssetsInAssetCollection:withFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:", v9, v51, v49, v47, v45, v43, v25, v26, v41, v29, v30, v42);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 1:
      case 2:
      case 3:
        objc_msgSend(v8, "referencePersons");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v8, "curationType");
        v46 = objc_msgSend(v8, "curationKind");
        v44 = objc_msgSend(v8, "curationLength");
        v10 = objc_msgSend(v8, "options");
        objc_msgSend(v8, "sortDescriptors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v9;
        v13 = objc_msgSend(v8, "reverseSortOrder");
        objc_msgSend(v8, "filterPredicate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fetchPropertySets");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v8, "libraryFilter");
        LOBYTE(v42) = objc_msgSend(v8, "includeOthersInSocialGroupAssets");
        LOBYTE(v40) = v13;
        v9 = v12;
        -[PXPhotosAssetsFetcher _fetchCuratedAssetsInAssetCollection:referencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:](self, "_fetchCuratedAssetsInAssetCollection:referencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:", v12, v50, v48, v46, v44, v10, v11, v40, v14, v15, v16, v42);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 4:
        goto LABEL_11;
      case 5:
        if (objc_msgSend(v9, "supportsFastKeyAssetCuration"))
        {
          objc_msgSend(v8, "referenceAsset");
          v31 = v9;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "referencePersons");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXPhotosAssetsFetcher _fetchCuratedKeyAssetsInAssetCollection:referenceAsset:referencePersons:options:libraryFilter:](self, "_fetchCuratedKeyAssetsInAssetCollection:referenceAsset:referencePersons:options:libraryFilter:", v31, v32, v33, objc_msgSend(v8, "options"), objc_msgSend(v8, "libraryFilter"));
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v31;
        }
        else
        {
          PLUIGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v9;
            _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_DEFAULT, "%@ doesn't support fast key asset curation, falling back to uncurated key asset", buf, 0xCu);
          }

LABEL_11:
          v35 = v9;
          v36 = objc_msgSend(v8, "options");
          v37 = objc_msgSend(v8, "libraryFilter");
          v38 = v36;
          v9 = v35;
          -[PXPhotosAssetsFetcher _fetchKeyAssetsInAssetCollection:options:libraryFilter:](self, "_fetchKeyAssetsInAssetCollection:options:libraryFilter:", v35, v38, v37);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }
        break;
      default:
        break;
    }

  }
  else
  {
    v17 = objc_msgSend(v8, "curationKind");
    v18 = objc_msgSend(v8, "curationLength");
    v19 = objc_msgSend(v8, "options");
    objc_msgSend(v8, "sortDescriptors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filterPredicate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchPropertySets");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v8, "libraryFilter");
    LOBYTE(v41) = objc_msgSend(v8, "includeOthersInSocialGroupAssets");
    -[PXPhotosAssetsFetcher _fetchAssetsInContainer:curationKind:curationLength:options:sortDescriptors:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:](self, "_fetchAssetsInContainer:curationKind:curationLength:options:sortDescriptors:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:", v7, v17, v18, v19, v20, v21, v22, v23, v41);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)existingAssetsFetchResultForContainer:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  PXPhotosAssetsFetcher *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = objc_msgSend(v7, "curationKind");
    v15 = objc_msgSend(v7, "curationLength");
    v16 = objc_msgSend(v7, "options");
    objc_msgSend(v7, "sortDescriptors");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterPredicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchPropertySets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "libraryFilter");
    LOBYTE(v28) = objc_msgSend(v7, "includeOthersInSocialGroupAssets");
    -[PXPhotosAssetsFetcher _existingAssetsInContainer:curationKind:curationLength:options:sortDescriptors:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:](self, "_existingAssetsInContainer:curationKind:curationLength:options:sortDescriptors:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:", v6, v14, v15, v16, v8, v11, v12, v17, v28);
    v13 = (PXPhotosAssetsFetcher *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = v6;
  v9 = objc_msgSend(v7, "curationKind");
  if ((unint64_t)(v9 - 1) < 3)
  {
    objc_msgSend(v7, "referencePersons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v7, "curationType");
    v32 = objc_msgSend(v7, "curationKind");
    v30 = objc_msgSend(v7, "curationLength");
    v18 = objc_msgSend(v7, "options");
    objc_msgSend(v7, "sortDescriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v7, "reverseSortOrder");
    objc_msgSend(v7, "filterPredicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchPropertySets");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = v19;
    -[PXPhotosAssetsFetcher _existingCuratedAssetsFetchResultForAssetCollection:referencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:](self, "_existingCuratedAssetsFetchResultForAssetCollection:referencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:", v8, v11, v34, v32, v30, v18, v12, v27, v20, v21, objc_msgSend(v7, "libraryFilter"));
    self = (PXPhotosAssetsFetcher *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if ((unint64_t)(v9 - 4) < 2)
  {
    v10 = objc_msgSend(v7, "curationKind") == 5;
    objc_msgSend(v7, "referenceAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "referencePersons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosAssetsFetcher _existingKeyAssetsFetchResultForAssetCollection:referenceAsset:referencePersons:curated:options:libraryFilter:](self, "_existingKeyAssetsFetchResultForAssetCollection:referenceAsset:referencePersons:curated:options:libraryFilter:", v8, v11, v12, v10, objc_msgSend(v7, "options"), objc_msgSend(v7, "libraryFilter"));
    v13 = (PXPhotosAssetsFetcher *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    self = v13;
    goto LABEL_10;
  }
  if (v9)
    goto LABEL_11;
  objc_msgSend(v7, "filterPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inclusionPredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v7, "includeUnsavedSyndicatedAssets");
  v33 = objc_msgSend(v7, "includeAllBurstAssets");
  v31 = objc_msgSend(v7, "fetchLimit");
  v29 = objc_msgSend(v7, "options");
  objc_msgSend(v7, "sortDescriptors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v7, "reverseSortOrder");
  v24 = objc_msgSend(v7, "hideHiddenAssets");
  objc_msgSend(v7, "fetchPropertySets");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v28) = v24;
  LOBYTE(v28) = v23;
  -[PXPhotosAssetsFetcher _existingFetchResultForAssetCollection:withFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:](self, "_existingFetchResultForAssetCollection:withFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:", v8, v11, v12, v35, v33, v31, v29, v22, v28, v25, objc_msgSend(v7, "libraryFilter"));
  self = (PXPhotosAssetsFetcher *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_11:

  return self;
}

- (void)clearFetchResultsForAssetCollection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosAssetsFetcher.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection != nil"));

  }
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcher clearFetchResultsForAssetCollections:](self, "clearFetchResultsForAssetCollections:", v6);

}

- (void)clearFetchResultsForAssetCollections:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PXPhotosAssetsFetcher_clearFetchResultsForAssetCollections___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_fetchAssetsInContainer:(id)a3 curationKind:(int64_t)a4 curationLength:(int64_t)a5 options:(unint64_t)a6 sortDescriptors:(id)a7 filterPredicate:(id)a8 fetchPropertySets:(id)a9 libraryFilter:(int64_t)a10 includeOthersInSocialGroupAssets:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;
  void *v28;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  SEL v38;
  int64_t v39;
  BOOL v40;

  v16 = a3;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  LOBYTE(v26) = a11;
  -[PXPhotosAssetsFetcher _fetchConfigurationForCuratedAssetsWithCurationKind:curationLength:options:sortDescriptors:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:](self, "_fetchConfigurationForCuratedAssetsWithCurationKind:curationLength:options:sortDescriptors:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:", a4, a5, a6, v17, v18, v19, a10, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __182__PXPhotosAssetsFetcher__fetchAssetsInContainer_curationKind_curationLength_options_sortDescriptors_filterPredicate_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke;
  v30[3] = &unk_1E512D610;
  v30[4] = self;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v35 = a4;
  v36 = a6;
  v37 = a10;
  v40 = a11;
  v38 = a2;
  v39 = a5;
  v20 = v19;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  -[PXPhotosAssetsFetcher _fetchResultForContainer:configuration:factory:](self, "_fetchResultForContainer:configuration:factory:", v23, v28, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_fetchOptionsForContainer:(id)a3 curationKind:(int64_t)a4 options:(unint64_t)a5 sortDescriptors:(id)a6 filterPredicate:(id)a7 fetchPropertySets:(id)a8 libraryFilter:(int64_t)a9
{
  PHPhotoLibrary **p_photoLibrary;
  id v15;
  id v16;
  id v17;
  id v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  p_photoLibrary = &self->_photoLibrary;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v20, "setInternalPredicate:", v16);

  objc_msgSend(v20, "setFetchPropertySets:", v15);
  objc_msgSend(v20, "setInternalSortDescriptors:", v17);

  _addFetchPropertySetsForCurationKind(v20, a4);
  objc_msgSend(v20, "setSharingFilter:", _sharingFilterForLibraryFilterInContainer(a9, v18));
  objc_msgSend(v20, "setIncludeGuestAssets:", (a5 >> 2) & 1);
  objc_opt_class();
  LOBYTE(a5) = objc_opt_isKindOfClass();

  if ((a5 & 1) != 0)
  {
    objc_msgSend(v20, "sortDescriptors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v22;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setInternalSortDescriptors:", v24);

    }
  }
  return v20;
}

- (id)_fetchOptionsForAssetsInAssetCollection:(id)a3 withFetcherOptions:(unint64_t)a4 filterPredicate:(id)a5 inclusionPredicate:(id)a6 fetchLimit:(unint64_t)a7 sortDescriptors:(id)a8 reverseSortOrder:(BOOL)a9 fetchPropertySets:(id)a10 hideHiddenAssets:(BOOL)a11 includeAllBurstAssets:(BOOL)a12
{
  PHPhotoLibrary **p_photoLibrary;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id WeakRetained;
  void *v24;
  _BOOL8 v25;

  p_photoLibrary = &self->_photoLibrary;
  v18 = a10;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_photoLibrary);
  objc_msgSend(WeakRetained, "px_standardLibrarySpecificFetchOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setInternalPredicate:", v21);
  objc_msgSend(v24, "setInternalInclusionPredicate:", v20);

  objc_msgSend(v24, "setFetchLimit:", a7);
  objc_msgSend(v24, "setInternalSortDescriptors:", v19);

  objc_msgSend(v24, "setReverseSortOrder:", a9);
  objc_msgSend(v24, "setFetchPropertySets:", v18);

  v25 = +[PXPhotosAssetsFetcher _shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:](PXPhotosAssetsFetcher, "_shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:", v22, a4);
  objc_msgSend(v24, "setReverseDefaultSortDescriptors:", v25);
  if (a11)
    objc_msgSend(v24, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v24, "setExcludeNonVisibleStackedAssets:", a12, a4);
  return v24;
}

- (id)_fetchOptionsForCuratedAssetsInAssetCollection:(id)a3 withFetcherOptions:(unint64_t)a4 curationKind:(int64_t)a5 reverseSortOrder:(BOOL)a6 filterPredicate:(id)a7 fetchPropertySets:(id)a8 libraryFilter:(int64_t)a9
{
  _BOOL8 v10;
  PHPhotoLibrary **p_photoLibrary;
  id v15;
  id v16;
  id v17;
  id WeakRetained;
  void *v19;

  v10 = a6;
  p_photoLibrary = &self->_photoLibrary;
  v15 = a8;
  v16 = a7;
  v17 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setSharingFilter:", _sharingFilterForLibraryFilterInContainer(a9, v17));
  objc_msgSend(v19, "setIncludeGuestAssets:", (a4 >> 2) & 1);
  objc_msgSend(v19, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v19, "setInternalPredicate:", v16);

  objc_msgSend(v19, "setReverseSortOrder:", v10);
  objc_msgSend(v19, "setFetchPropertySets:", v15);

  objc_msgSend(v19, "setReverseDefaultSortDescriptors:", +[PXPhotosAssetsFetcher _shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:](PXPhotosAssetsFetcher, "_shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:", v17, a4));
  _addFetchPropertySetsForCurationKind(v19, a5);

  return v19;
}

- (id)_fetchKeyAssetsInContainer:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PXPeopleUtilities keyAssetForPerson:face:](PXPeopleUtilities, "keyAssetForPerson:face:", v7, 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosAssetsFetcher.m"), 376, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetForSocialGroup:createIfNeeded:options:", v7, 1, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)_existingAssetsInContainer:(id)a3 curationKind:(int64_t)a4 curationLength:(int64_t)a5 options:(unint64_t)a6 sortDescriptors:(id)a7 filterPredicate:(id)a8 fetchPropertySets:(id)a9 libraryFilter:(int64_t)a10 includeOthersInSocialGroupAssets:(BOOL)a11
{
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v17 = a3;
  LOBYTE(v21) = a11;
  -[PXPhotosAssetsFetcher _fetchConfigurationForCuratedAssetsWithCurationKind:curationLength:options:sortDescriptors:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:](self, "_fetchConfigurationForCuratedAssetsWithCurationKind:curationLength:options:sortDescriptors:filterPredicate:fetchPropertySets:libraryFilter:includeOthersInSocialGroupAssets:", a4, a5, a6, a7, a8, a9, a10, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcher _cachedFetchResultForContainer:configuration:](self, "_cachedFetchResultForContainer:configuration:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_fetchAssetsInAssetCollection:(id)a3 withFilterPredicate:(id)a4 inclusionPredicate:(id)a5 includeUnsavedSyndicatedAssets:(BOOL)a6 includeAllBurstAssets:(BOOL)a7 fetchLimit:(unint64_t)a8 options:(unint64_t)a9 sortDescriptors:(id)a10 reverseSortOrder:(BOOL)a11 hideHiddenAssets:(BOOL)a12 fetchPropertySets:(id)a13 libraryFilter:(int64_t)a14 includeOthersInSocialGroupAssets:(BOOL)a15
{
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  unint64_t v42;
  unint64_t v43;
  int64_t v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  BOOL v49;

  v32 = a6;
  v33 = a7;
  v30 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a10;
  v20 = a13;
  v21 = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:](PXPhotosAssetsFetcher, "_adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:", v30, a11, a9);
  BYTE1(v29) = a12;
  LOBYTE(v29) = v21;
  -[PXPhotosAssetsFetcher _fetchConfigurationWithFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:](self, "_fetchConfigurationWithFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:", v17, v18, v32, v33, a8, a9, v19, v29, v20, a14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __281__PXPhotosAssetsFetcher__fetchAssetsInAssetCollection_withFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke;
  v36[3] = &unk_1E512D638;
  v36[4] = self;
  v37 = v30;
  v38 = v17;
  v39 = v18;
  v40 = v19;
  v42 = a9;
  v43 = a8;
  v45 = v21;
  v41 = v20;
  v46 = a12;
  v47 = v33;
  v48 = v32;
  v44 = a14;
  v49 = a15;
  v22 = v20;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v30;
  -[PXPhotosAssetsFetcher _fetchResultForContainer:configuration:factory:](self, "_fetchResultForContainer:configuration:factory:", v26, v31, v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_importantFetchNameForCollectionSubtype:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("RecentsSmartAlbum");
  if (a3 != 209)
    v3 = 0;
  if (a3 == 1000000205)
    return CFSTR("AllPhotosSmartAlbum");
  else
    return (id)v3;
}

- (id)_existingFetchResultForAssetCollection:(id)a3 withFilterPredicate:(id)a4 inclusionPredicate:(id)a5 includeUnsavedSyndicatedAssets:(BOOL)a6 includeAllBurstAssets:(BOOL)a7 fetchLimit:(unint64_t)a8 options:(unint64_t)a9 sortDescriptors:(id)a10 reverseSortOrder:(BOOL)a11 hideHiddenAssets:(BOOL)a12 fetchPropertySets:(id)a13 libraryFilter:(int64_t)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;
  _BOOL4 v27;
  _BOOL4 v28;

  v27 = a6;
  v28 = a7;
  v18 = a13;
  v19 = a10;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  BYTE1(v26) = a12;
  LOBYTE(v26) = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:](PXPhotosAssetsFetcher, "_adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:", v22, a11, a9);
  -[PXPhotosAssetsFetcher _fetchConfigurationWithFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:](self, "_fetchConfigurationWithFilterPredicate:inclusionPredicate:includeUnsavedSyndicatedAssets:includeAllBurstAssets:fetchLimit:options:sortDescriptors:reverseSortOrder:hideHiddenAssets:fetchPropertySets:libraryFilter:", v21, v20, v27, v28, a8, a9, v19, v26, v18, a14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosAssetsFetcher _cachedFetchResultForContainer:configuration:](self, "_cachedFetchResultForContainer:configuration:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_fetchCuratedKeyAssetsInAssetCollection:(id)a3 referenceAsset:(id)a4 referencePersons:(id)a5 options:(unint64_t)a6 libraryFilter:(int64_t)a7
{
  return -[PXPhotosAssetsFetcher _fetchKeyAssetsInAssetCollection:curated:referenceAsset:referencePersons:options:libraryFilter:](self, "_fetchKeyAssetsInAssetCollection:curated:referenceAsset:referencePersons:options:libraryFilter:", a3, 1, a4, a5, a6, a7);
}

- (id)_fetchKeyAssetsInAssetCollection:(id)a3 options:(unint64_t)a4 libraryFilter:(int64_t)a5
{
  return -[PXPhotosAssetsFetcher _fetchKeyAssetsInAssetCollection:curated:referenceAsset:referencePersons:options:libraryFilter:](self, "_fetchKeyAssetsInAssetCollection:curated:referenceAsset:referencePersons:options:libraryFilter:", a3, 0, 0, 0, a4, a5);
}

- (id)_fetchKeyAssetsInAssetCollection:(id)a3 curated:(BOOL)a4 referenceAsset:(id)a5 referencePersons:(id)a6 options:(unint64_t)a7 libraryFilter:(int64_t)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  int64_t v28;
  unint64_t v29;
  BOOL v30;

  v12 = a4;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  -[PXPhotosAssetsFetcher _fetchConfigurationForKeyAssetWithReferenceAsset:referencePersons:curated:options:libraryFilter:](self, "_fetchConfigurationForKeyAssetWithReferenceAsset:referencePersons:curated:options:libraryFilter:", v15, v16, v12, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __120__PXPhotosAssetsFetcher__fetchKeyAssetsInAssetCollection_curated_referenceAsset_referencePersons_options_libraryFilter___block_invoke;
  v24[3] = &unk_1E512D660;
  v24[4] = self;
  v25 = v14;
  v28 = a8;
  v29 = a7;
  v30 = v12;
  v26 = v16;
  v27 = v15;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __120__PXPhotosAssetsFetcher__fetchKeyAssetsInAssetCollection_curated_referenceAsset_referencePersons_options_libraryFilter___block_invoke_309;
  v23[3] = &unk_1E513C230;
  v23[4] = self;
  v18 = v15;
  v19 = v16;
  v20 = v14;
  -[PXPhotosAssetsFetcher _fetchResultForContainer:configuration:factory:fallbackFactory:](self, "_fetchResultForContainer:configuration:factory:fallbackFactory:", v20, v17, v24, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_fetchKeyCuratedAssetsInPhotosHighlight:(id)a3 options:(id)a4
{
  PHPhotoLibrary **p_photoLibrary;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;

  p_photoLibrary = &self->_photoLibrary;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "sharingFilter");
  objc_msgSend(v9, "setSharingFilter:", v10);
  objc_msgSend(v9, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchCollageAssetsForDayHighlight:options:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_existingKeyAssetsFetchResultForAssetCollection:(id)a3 referenceAsset:(id)a4 referencePersons:(id)a5 curated:(BOOL)a6 options:(unint64_t)a7 libraryFilter:(int64_t)a8
{
  _BOOL8 v10;
  id v14;
  void *v15;
  void *v16;

  v10 = a6;
  v14 = a3;
  -[PXPhotosAssetsFetcher _fetchConfigurationForKeyAssetWithReferenceAsset:referencePersons:curated:options:libraryFilter:](self, "_fetchConfigurationForKeyAssetWithReferenceAsset:referencePersons:curated:options:libraryFilter:", a4, a5, v10, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcher _cachedFetchResultForContainer:configuration:](self, "_cachedFetchResultForContainer:configuration:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_fetchCuratedAssetsInAssetCollection:(id)a3 referencePersons:(id)a4 curationType:(int64_t)a5 curationKind:(int64_t)a6 curationLength:(int64_t)a7 options:(unint64_t)a8 sortDescriptors:(id)a9 reverseSortOrder:(BOOL)a10 filterPredicate:(id)a11 fetchPropertySets:(id)a12 libraryFilter:(int64_t)a13 includeOthersInSocialGroupAssets:(BOOL)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v30;
  id v31;
  void *v32;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  unint64_t v42;
  int64_t v43;
  int64_t v44;
  int64_t v45;
  int64_t v46;
  SEL v47;
  BOOL v48;
  BOOL v49;

  v31 = a3;
  v18 = a4;
  v19 = a9;
  v20 = a11;
  v21 = a12;
  v22 = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:](PXPhotosAssetsFetcher, "_adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:", v31, 0, a8);
  LOBYTE(v30) = v22;
  -[PXPhotosAssetsFetcher _fetchConfigurationForCurationWithReferencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:](self, "_fetchConfigurationForCurationWithReferencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:", v18, a5, a6, a7, a8, v19, v30, v20, v21, a13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __242__PXPhotosAssetsFetcher__fetchCuratedAssetsInAssetCollection_referencePersons_curationType_curationKind_curationLength_options_sortDescriptors_reverseSortOrder_filterPredicate_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke;
  v36[3] = &unk_1E512D688;
  v36[4] = self;
  v37 = v31;
  v38 = v20;
  v42 = a8;
  v43 = a6;
  v48 = v22;
  v39 = v21;
  v40 = v18;
  v41 = v19;
  v44 = a13;
  v45 = a5;
  v49 = a14;
  v46 = a7;
  v47 = a2;
  v23 = v19;
  v24 = v18;
  v25 = v21;
  v26 = v20;
  v27 = v31;
  -[PXPhotosAssetsFetcher _fetchResultForContainer:configuration:factory:](self, "_fetchResultForContainer:configuration:factory:", v27, v32, v36);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_existingCuratedAssetsFetchResultForAssetCollection:(id)a3 referencePersons:(id)a4 curationType:(int64_t)a5 curationKind:(int64_t)a6 curationLength:(int64_t)a7 options:(unint64_t)a8 sortDescriptors:(id)a9 reverseSortOrder:(BOOL)a10 filterPredicate:(id)a11 fetchPropertySets:(id)a12 libraryFilter:(int64_t)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v18 = a12;
  v19 = a11;
  v20 = a9;
  v21 = a4;
  v22 = a3;
  LOBYTE(v26) = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:](PXPhotosAssetsFetcher, "_adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:", v22, 0, a8);
  -[PXPhotosAssetsFetcher _fetchConfigurationForCurationWithReferencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:](self, "_fetchConfigurationForCurationWithReferencePersons:curationType:curationKind:curationLength:options:sortDescriptors:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:", v21, a5, a6, a7, a8, v20, v26, v19, v18, a13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosAssetsFetcher _cachedFetchResultForContainer:configuration:](self, "_cachedFetchResultForContainer:configuration:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_fetchResultForContainer:(id)a3 configuration:(id)a4 factory:(id)a5
{
  return -[PXPhotosAssetsFetcher _fetchResultForContainer:configuration:factory:fallbackFactory:](self, "_fetchResultForContainer:configuration:factory:fallbackFactory:", a3, a4, a5, 0);
}

- (id)_fetchResultForContainer:(id)a3 configuration:(id)a4 factory:(id)a5 fallbackFactory:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a5;
  v13 = (void (**)(_QWORD))a6;
  -[PXPhotosAssetsFetcher _cachedFetchResultForContainer:configuration:](self, "_cachedFetchResultForContainer:configuration:", v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    v12[2](v12);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v17 = (void *)v18;
      -[PXPhotosAssetsFetcher _cacheFetchResult:forContainer:configuration:](self, "_cacheFetchResult:forContainer:configuration:", v18, v10, v11);
      goto LABEL_6;
    }
    if (!v13)
    {
      v17 = 0;
      goto LABEL_6;
    }
    v13[2](v13);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
LABEL_6:

  return v17;
}

- (id)_cachedFetchResultForContainer:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__144849;
  v21 = __Block_byref_object_dispose__144850;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PXPhotosAssetsFetcher__cachedFetchResultForContainer_configuration___block_invoke;
  v13[3] = &unk_1E513D0D8;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)_cacheFetchResult:(id)a3 forContainer:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__PXPhotosAssetsFetcher__cacheFetchResult_forContainer_configuration___block_invoke;
  v15[3] = &unk_1E513DD48;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(queue, v15);

}

- (id)_fetchConfigurationForCuratedAssetsWithCurationKind:(int64_t)a3 curationLength:(int64_t)a4 options:(unint64_t)a5 sortDescriptors:(id)a6 filterPredicate:(id)a7 fetchPropertySets:(id)a8 libraryFilter:(int64_t)a9 includeOthersInSocialGroupAssets:(BOOL)a10
{
  char v12;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[9];

  v12 = a5;
  v32[8] = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = _curationAlgorithmForOptions(v12);
  v29 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v30;
  v19 = (uint64_t)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v19;
  v32[2] = v19;
  v20 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[3] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v21;
  v22 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[5] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v29, "initWithObjects:", v25);

  if (!v17)
  if (!v16)
  {

    if (v15)
      goto LABEL_11;
LABEL_13:

    goto LABEL_11;
  }
  if (!v15)
    goto LABEL_13;
LABEL_11:

  return v26;
}

- (id)_fetchConfigurationWithFilterPredicate:(id)a3 inclusionPredicate:(id)a4 includeUnsavedSyndicatedAssets:(BOOL)a5 includeAllBurstAssets:(BOOL)a6 fetchLimit:(unint64_t)a7 options:(unint64_t)a8 sortDescriptors:(id)a9 reverseSortOrder:(BOOL)a10 hideHiddenAssets:(BOOL)a11 fetchPropertySets:(id)a12 libraryFilter:(int64_t)a13
{
  char v13;
  _BOOL8 v15;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  unint64_t v23;
  _BOOL8 v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  _BOOL4 v45;
  id v46;
  _QWORD v47[13];

  v13 = a8;
  v15 = a6;
  v45 = a5;
  v47[11] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a9;
  v44 = a12;
  if (_fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__onceToken[0] != -1)
    dispatch_once(_fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__onceToken, &__block_literal_global_319_144842);
  v20 = _curationAlgorithmForOptions(v13);
  v21 = v20;
  if (v17 || v18 || v45)
  {
    v27 = (uint64_t)v17;
    v22 = a11;
    v23 = a7;
    v24 = v15;
    if (v17)
      goto LABEL_17;
    goto LABEL_16;
  }
  v22 = a11;
  v23 = a7;
  v24 = v15;
  if (v23 || v15 || v19 || a10 || v44 || a11 || a13 || v20)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v42 = v21;
    v40 = (void *)v27;
    v47[0] = v27;
    v28 = (uint64_t)v18;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    v43 = v18;
    v47[1] = v28;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v45, v28);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v41;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v30;
    v31 = v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = v17;
    v47[5] = v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47[6] = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v47[7] = v33;
    v34 = v44;
    if (!v44)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v47[8] = v34;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47[9] = v35;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v42);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47[10] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 11);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v44;
    if (!v44)

    v17 = v46;
    if (!v19)

    v18 = v43;
    if (v43)
    {
      if (v46)
      {
LABEL_29:
        v25 = (id)objc_msgSend(objc_alloc((Class)off_1E50B5CD8), "initWithObjects:", v37);

        goto LABEL_30;
      }
    }
    else
    {

      if (v46)
        goto LABEL_29;
    }

    goto LABEL_29;
  }
  v25 = (id)_fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__nullTuple;
  v26 = 0;
LABEL_30:

  return v25;
}

- (id)_fetchConfigurationForCurationWithReferencePersons:(id)a3 curationType:(int64_t)a4 curationKind:(int64_t)a5 curationLength:(int64_t)a6 options:(unint64_t)a7 sortDescriptors:(id)a8 reverseSortOrder:(BOOL)a9 filterPredicate:(id)a10 fetchPropertySets:(id)a11 libraryFilter:(int64_t)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;

  v17 = a3;
  v18 = a8;
  v19 = a10;
  v20 = a11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count") + 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", CFSTR("PXCuratedFetchConfiguration"));
  if (v17)
    objc_msgSend(v21, "addObjectsFromArray:", v17);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4, a12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v24);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v26);

  if (v18)
  {
    objc_msgSend(v21, "addObject:", v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v27);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v28);

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v29);

    if (v20)
      goto LABEL_8;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v30);

    goto LABEL_11;
  }
  objc_msgSend(v21, "addObject:", v19);
  if (!v20)
    goto LABEL_10;
LABEL_8:
  objc_msgSend(v21, "addObject:", v20);
LABEL_11:
  v31 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5CD8), "initWithObjects:", v21);

  return v31;
}

- (id)_fetchConfigurationForKeyAssetWithReferenceAsset:(id)a3 referencePersons:(id)a4 curated:(BOOL)a5 options:(unint64_t)a6 libraryFilter:(int64_t)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a5;
  v11 = a3;
  v12 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count") + 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", CFSTR("PXKeyAssetFetchConfiguration"));
  if (v11 && !v9)
    objc_msgSend(v13, "addObject:", v11);
  if (v12 && !v9)
    objc_msgSend(v13, "addObjectsFromArray:", v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v16);

  v17 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5CD8), "initWithObjects:", v13);
  return v17;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke;
  v6[3] = &unk_1E5148D08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_queue_cachedFetchResultsByContainerByConfiguration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke_2;
  v4[3] = &unk_1E5148D08;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v15)
  {
    v14 = *(_QWORD *)v24;
    do
    {
      v1 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(obj);
        v16 = v1;
        v2 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v1);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v2, "keyEnumerator");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v20 != v7)
                objc_enumerationMutation(v4);
              v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
              objc_msgSend(v2, "objectForKey:", v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "changeDetailsForFetchResult:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "fetchResultAfterChanges");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v9);

            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v6);
        }

        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke_3;
        v18[3] = &unk_1E512D6D0;
        v18[4] = v2;
        objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v18);

        v1 = v16 + 1;
      }
      while (v16 + 1 != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v15);
  }

}

uint64_t __58__PXPhotosAssetsFetcher_photoLibraryDidChangeOnMainQueue___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

void __237__PXPhotosAssetsFetcher__fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[12];

  v9[11] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C9AAA0];
  v9[1] = v2;
  v9[2] = MEMORY[0x1E0C9AAA0];
  v9[3] = MEMORY[0x1E0C9AAA0];
  v9[4] = &unk_1E53EDD40;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v4;
  v9[6] = v3;
  v9[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[8] = v5;
  v9[9] = &unk_1E53EDD58;
  v9[10] = &unk_1E53EDD58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v0, "initWithObjects:", v6);
  v8 = (void *)_fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__nullTuple;
  _fetchConfigurationWithFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter__nullTuple = v7;

}

void __70__PXPhotosAssetsFetcher__cacheFetchResult_forContainer_configuration___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", v3, a1[5]);
    v2 = v3;
  }
  v4 = v2;
  objc_msgSend(v2, "setObject:forKey:", a1[6], a1[7]);

}

void __70__PXPhotosAssetsFetcher__cachedFetchResultForContainer_configuration___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __242__PXPhotosAssetsFetcher__fetchCuratedAssetsInAssetCollection_referencePersons_curationType_curationKind_curationLength_options_sortDescriptors_reverseSortOrder_filterPredicate_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  char v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableFilteringCuratedGridsForContentSyndication");

  objc_msgSend(*(id *)(a1 + 32), "_fetchOptionsForCuratedAssetsInAssetCollection:withFetcherOptions:curationKind:reverseSortOrder:filterPredicate:fetchPropertySets:libraryFilter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 128), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(_curationAlgorithmForOptions(*(_QWORD *)(a1 + 80)))
  {
    case 0:
      v5 = objc_msgSend(*(id *)(a1 + 64), "count");
      if (!v5)
      {
        if (objc_msgSend(*(id *)(a1 + 40), "assetCollectionType") != 6)
        {
          if (objc_msgSend(*(id *)(a1 + 40), "assetCollectionType") != 4 || (*(_BYTE *)(a1 + 80) & 2) == 0)
          {
            objc_msgSend(v4, "setCurationType:", *(_QWORD *)(a1 + 104));
            v47 = *MEMORY[0x1E0CD19F0];
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addFetchPropertySets:", v28);

            objc_msgSend(MEMORY[0x1E0CD1390], "fetchCuratedAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 40), v4);
            v19 = objc_claimAutoreleasedReturnValue();
            goto LABEL_64;
          }
          v48 = *MEMORY[0x1E0CD19F0];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addFetchPropertySets:", v35);

          +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "allowCustomUserAssets");

          if (v37)
          {
            objc_msgSend(MEMORY[0x1E0CD1390], "fetchCustomUserAssetsInMemory:options:", *(_QWORD *)(a1 + 40), v4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = 0;
          }
          if (!objc_msgSend(v16, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CD1390], "fetchUserCuratedAssetsInMemory:options:", *(_QWORD *)(a1 + 40), v4);
            v39 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v39;
          }
          goto LABEL_65;
        }
        if ((*(_QWORD *)(a1 + 80) & 1) != 0)
          goto LABEL_24;
        if (objc_msgSend(*(id *)(a1 + 40), "isAggregation") && (*(_BYTE *)(a1 + 80) & 8) != 0)
        {
          v18 = 0;
        }
        else
        {
          v17 = *(_QWORD *)(a1 + 104);
          if (v17 == 2)
          {
            v18 = 2;
          }
          else if (v17 == 1)
          {
            v18 = 1;
          }
          else
          {
            if (v17)
            {
LABEL_57:
              objc_msgSend(v4, "setIsExclusivePredicate:", 1);
              if ((objc_msgSend(v4, "includeGuestAssets") & 1) == 0 && ((v3 ^ 1) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 0);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "internalPredicate");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v41)
                {
                  v42 = (void *)MEMORY[0x1E0CB3528];
                  objc_msgSend(v4, "internalPredicate");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v49[0] = v43;
                  v49[1] = v40;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "andPredicateWithSubpredicates:", v44);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setInternalPredicate:", v45);

                }
                else
                {
                  objc_msgSend(v4, "setInternalPredicate:", v40);
                }

              }
              goto LABEL_63;
            }
            v18 = objc_msgSend(*(id *)(a1 + 40), "px_curationType");
          }
        }
        objc_msgSend(v4, "setHighlightCurationType:", v18);
        goto LABEL_57;
      }
      v6 = v5;
      v51[0] = *MEMORY[0x1E0CD1A08];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addFetchPropertySets:", v7);

      if (v6 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v20;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSortDescriptors:", v22);

        objc_msgSend(MEMORY[0x1E0CD1390], "requestCuratedAssetsInAssetCollection:referencePersons:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v4);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_64;
      }
      objc_msgSend(*(id *)(a1 + 64), "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*(_QWORD *)(a1 + 72))
      {
        objc_msgSend(v4, "setInternalSortDescriptors:");
      }
      else
      {
        +[PXPeopleUtilities sortDescriptorsWithPersonAssetSortOrder:](PXPeopleUtilities, "sortDescriptorsWithPersonAssetSortOrder:", objc_msgSend(v8, "assetSortOrder"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setInternalSortDescriptors:", v29);

      }
      +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "enableNewPeoplePetsCuration");

      if ((v31 & 1) != 0)
        v32 = 0;
      else
        v32 = !+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
      if ((v32 & 1) != 0 || (*(_QWORD *)(a1 + 80) & 0x10) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CD1390], "requestCuratedAssetsInAssetCollection:referencePersons:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v4);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "useSummaryAssetsForCuration");

        objc_msgSend(MEMORY[0x1E0D77EB0], "fetchCuratedAssetsForPerson:options:useSummary:", v9, v4, v34);
        v15 = objc_claimAutoreleasedReturnValue();
      }
LABEL_13:
      v16 = (void *)v15;
LABEL_14:

LABEL_65:
      return v16;
    case 1:
      if ((*(_QWORD *)(a1 + 80) & 1) == 0)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E78]), "initWithFetchOptions:", v4);
        objc_msgSend(v9, "setIncludeOthersInSocialGroupAssets:", *(unsigned __int8 *)(a1 + 129));
        switch(*(_QWORD *)(a1 + 88))
        {
          case 0:
          case 4:
          case 5:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            v25 = *(_QWORD *)(a1 + 120);
            v26 = *(_QWORD *)(a1 + 32);
            v27 = 703;
            goto LABEL_68;
          case 1:
            v10 = objc_msgSend(*(id *)(a1 + 40), "assetCollectionType");
            v11 = *(_QWORD *)(a1 + 112);
            if (v10 != 4)
            {
              switch(v11)
              {
                case 0:
                  v38 = v9;
                  v13 = 2;
                  goto LABEL_49;
                case 1:
                case 4:
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = v23;
                  v25 = *(_QWORD *)(a1 + 120);
                  v26 = *(_QWORD *)(a1 + 32);
                  v27 = 684;
                  goto LABEL_68;
                case 2:
                  goto LABEL_44;
                case 3:
                case 5:
                  v13 = qword_1A7C09990[v11 - 1];
                  goto LABEL_48;
                default:
                  goto LABEL_43;
              }
            }
            v12 = v11 - 1;
            if (v12 > 4)
              v13 = 0;
            else
              v13 = qword_1A7C09990[v12];
LABEL_48:
            v38 = v9;
LABEL_49:
            objc_msgSend(v38, "setCurationLength:", v13);
            objc_msgSend(MEMORY[0x1E0D77E70], "fetchEditorialAssetsForCollection:options:", *(_QWORD *)(a1 + 40), v9);
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          case 2:
            objc_msgSend(MEMORY[0x1E0D77E70], "fetchMovieAssetsForCollection:options:", *(_QWORD *)(a1 + 40), v9);
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          case 3:
LABEL_44:
            objc_msgSend(MEMORY[0x1E0D77E70], "fetchPreviewAssetsForCollection:options:", *(_QWORD *)(a1 + 40), v9);
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          default:
LABEL_43:
            v16 = 0;
            goto LABEL_14;
        }
      }
LABEL_24:
      objc_msgSend(*(id *)(a1 + 32), "_fetchCuratedKeyAssetsInAssetCollection:referenceAsset:referencePersons:options:libraryFilter:", *(_QWORD *)(a1 + 40), 0, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_64;
    case 2:
      v14 = *(_QWORD *)(a1 + 88);
      if (v14 - 1 < 3)
      {
        +[PXFakePhotoKitAssetsFetcher defaultFetcher](PXFakePhotoKitAssetsFetcher, "defaultFetcher");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fetchAssetsInContainer:curationKind:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      v16 = 0;
      if (v14 <= 5 && ((1 << v14) & 0x31) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = *(_QWORD *)(a1 + 120);
        v26 = *(_QWORD *)(a1 + 32);
        v27 = 719;
LABEL_68:
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("PXPhotosAssetsFetcher.m"), v27, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      goto LABEL_65;
    case 3:
LABEL_63:
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 40), v4);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_64:
      v16 = (void *)v19;
      goto LABEL_65;
    default:
      v16 = 0;
      goto LABEL_65;
  }
}

id __120__PXPhotosAssetsFetcher__fetchKeyAssetsInAssetCollection_curated_referenceAsset_referencePersons_options_libraryFilter___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setSharingFilter:", _sharingFilterForLibraryFilterInContainer(*(_QWORD *)(a1 + 64), *(void **)(a1 + 40)));
  objc_msgSend(v3, "setIncludeGuestAssets:", 1);
  objc_msgSend(v3, "setReverseDefaultSortDescriptors:", +[PXPhotosAssetsFetcher _shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:](PXPhotosAssetsFetcher, "_shouldReverseDefaultSortDescriptorsForCollection:fetcherOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72)));
  if (objc_msgSend(*(id *)(a1 + 40), "assetCollectionSubtype") == 101 && (*(_BYTE *)(a1 + 72) & 0x20) != 0)
    objc_msgSend(v3, "setReverseSortOrder:", 1);
  if (!*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 40), v3);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v4 = _curationAlgorithmForOptions(*(_QWORD *)(a1 + 72));
  if (v4 < 2)
  {
LABEL_8:
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referencePersons:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 40), "assetCollectionType") == 6)
        objc_msgSend(v3, "setIsExclusivePredicate:", 1);
      v10 = *(_QWORD *)(a1 + 40);
      if ((*(_BYTE *)(a1 + 72) & 0x40) != 0)
        objc_msgSend(*(id *)(a1 + 32), "_fetchKeyCuratedAssetsInPhotosHighlight:options:", v10, v3);
      else
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v10, *(_QWORD *)(a1 + 56), v3);
      v5 = objc_claimAutoreleasedReturnValue();
    }
LABEL_11:
    v6 = (void *)v5;
    if (v5)
      goto LABEL_15;
    goto LABEL_12;
  }
  if (v4 == 2)
  {
    +[PXFakePhotoKitAssetsFetcher defaultFetcher](PXFakePhotoKitAssetsFetcher, "defaultFetcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchAssetsInContainer:curationKind:", *(_QWORD *)(a1 + 40), 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_15;
  }
  else if (v4 == 3)
  {
    goto LABEL_8;
  }
LABEL_12:
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "%@ keyAssetsFetchResult is nil", (uint8_t *)&v12, 0xCu);
  }

  v6 = 0;
LABEL_15:

  return v6;
}

id __120__PXPhotosAssetsFetcher__fetchKeyAssetsInAssetCollection_curated_referenceAsset_referencePersons_options_libraryFilter___block_invoke_309(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CD1620]);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], WeakRetained, v4, 0, 0, 0);

  return v5;
}

id __281__PXPhotosAssetsFetcher__fetchAssetsInAssetCollection_withFilterPredicate_inclusionPredicate_includeUnsavedSyndicatedAssets_includeAllBurstAssets_fetchLimit_options_sortDescriptors_reverseSortOrder_hideHiddenAssets_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _BOOL8 v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  LOWORD(v22) = *(_WORD *)(a1 + 105);
  LOBYTE(v21) = *(_BYTE *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 32), "_fetchOptionsForAssetsInAssetCollection:withFetcherOptions:filterPredicate:inclusionPredicate:fetchLimit:sortDescriptors:reverseSortOrder:fetchPropertySets:hideHiddenAssets:includeAllBurstAssets:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64), v21, *(_QWORD *)(a1 + 72), v22);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 107))
    goto LABEL_13;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "dataSourceType");
  if (v5 >= 6)
  {
    if (v5 == 6)
    {
      v6 = objc_msgSend(MEMORY[0x1E0D73310], "maskForMomentSharedAsset");
    }
    else
    {
      if (v5 != 7)
        goto LABEL_12;
      v6 = objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset");
    }
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "internalInclusionPredicate");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      v23[0] = v8;
      v23[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setInternalInclusionPredicate:", v11);

    }
    else
    {
      objc_msgSend(v2, "setInternalInclusionPredicate:", v7);
    }

    goto LABEL_12;
  }
  objc_msgSend(v2, "setIncludeGuestAssets:", 1);
LABEL_12:

LABEL_13:
  v12 = _sharingFilterForLibraryFilterInContainer(*(_QWORD *)(a1 + 96), *(void **)(a1 + 40));
  objc_msgSend(v2, "setSharingFilter:", v12);
  if ((_DWORD)v12)
    v13 = 0;
  else
    v13 = objc_msgSend(*(id *)(a1 + 40), "assetCollectionType") == 3;
  objc_msgSend(v2, "setIsExclusivePredicate:", v13);
  switch(_curationAlgorithmForOptions(*(_QWORD *)(a1 + 80)))
  {
    case 0:
    case 3:
      v14 = objc_msgSend(*(id *)(a1 + 40), "assetCollectionSubtype");
      if (v14 >> 1 == 500000151 && (objc_msgSend(*(id *)(a1 + 40), "isSharingSuggestion") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", *(_QWORD *)(a1 + 40), 0);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!*(_QWORD *)(a1 + 88) && !*(_QWORD *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 32), "_importantFetchNameForCollectionSubtype:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setImportantFetchName:", v15);

        }
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 40), v2);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v16;
      break;
    case 1:
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E78]), "initWithFetchOptions:", v2);
      objc_msgSend(v18, "setIncludeOthersInSocialGroupAssets:", *(unsigned __int8 *)(a1 + 108));
      objc_msgSend(MEMORY[0x1E0D77E70], "fetchAllAssetsForCollection:options:", *(_QWORD *)(a1 + 40), v18);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 2:
      +[PXFakePhotoKitAssetsFetcher defaultFetcher](PXFakePhotoKitAssetsFetcher, "defaultFetcher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fetchAssetsInContainer:curationKind:", *(_QWORD *)(a1 + 40), 0);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v17 = (void *)v19;

      break;
    default:
      v17 = 0;
      break;
  }

  return v17;
}

id __182__PXPhotosAssetsFetcher__fetchAssetsInContainer_curationKind_curationLength_options_sortDescriptors_filterPredicate_fetchPropertySets_libraryFilter_includeOthersInSocialGroupAssets___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_fetchOptionsForContainer:curationKind:options:sortDescriptors:filterPredicate:fetchPropertySets:libraryFilter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _curationAlgorithmForOptions(*(_QWORD *)(a1 + 80));
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E78]), "initWithFetchOptions:", v2);
      objc_msgSend(v8, "setIncludeOthersInSocialGroupAssets:", *(unsigned __int8 *)(a1 + 112));
      switch(*(_QWORD *)(a1 + 72))
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0D77E70], "fetchAllAssetsForCollection:options:", *(_QWORD *)(a1 + 40), v8);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        case 1:
          v11 = *(_QWORD *)(a1 + 104);
          switch(v11)
          {
            case 0:
              v13 = v8;
              v12 = 2;
              goto LABEL_22;
            case 1:
            case 4:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), CFSTR("PXPhotosAssetsFetcher.m"), 279, CFSTR("Code which should be unreachable has been reached"));

              abort();
            case 2:
              goto LABEL_19;
            case 3:
            case 5:
              v12 = qword_1A7C09990[v11 - 1];
              v13 = v8;
LABEL_22:
              objc_msgSend(v13, "setCurationLength:", v12);
              objc_msgSend(MEMORY[0x1E0D77E70], "fetchEditorialAssetsForCollection:options:", *(_QWORD *)(a1 + 40), v8);
              v9 = objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            default:
              goto LABEL_18;
          }
        case 2:
          objc_msgSend(MEMORY[0x1E0D77E70], "fetchMovieAssetsForCollection:options:", *(_QWORD *)(a1 + 40), v8);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        case 3:
LABEL_19:
          objc_msgSend(MEMORY[0x1E0D77E70], "fetchPreviewAssetsForCollection:options:", *(_QWORD *)(a1 + 40), v8);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        case 4:
        case 5:
          objc_msgSend(*(id *)(a1 + 32), "_fetchKeyAssetsInContainer:options:", *(_QWORD *)(a1 + 40), v2);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        default:
LABEL_18:
          v10 = 0;
          goto LABEL_24;
      }
    }
    if (v3)
      goto LABEL_14;
    v4 = *(_QWORD *)(a1 + 72);
    v5 = v4 >= 4;
    v6 = v4 - 4;
    if (!v5)
    {
      PXAssertGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v14 = *(_QWORD *)(a1 + 72);
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "cannot fetch curated assets %ti in %@ using PhotoKit", buf, 0x16u);
      }

      goto LABEL_14;
    }
    if (v6 < 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_fetchKeyAssetsInContainer:options:", *(_QWORD *)(a1 + 40), v2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
LABEL_14:
    v10 = 0;
    goto LABEL_25;
  }
  if (*(_QWORD *)(a1 + 72) > 5uLL)
    goto LABEL_14;
  +[PXFakePhotoKitAssetsFetcher defaultFetcher](PXFakePhotoKitAssetsFetcher, "defaultFetcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsInContainer:curationKind:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_23:
  v10 = (void *)v9;
LABEL_24:

LABEL_25:
  return v10;
}

void __62__PXPhotosAssetsFetcher_clearFetchResultsForAssetCollections___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = *(id *)(a1 + 40);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

+ (BOOL)_adjustedReverseSortOrderForCollection:(id)a3 reverseSortOrder:(BOOL)a4 fetcherOptions:(unint64_t)a5
{
  char v5;
  id v7;
  void (**v8)(_QWORD);
  char v9;
  _QWORD aBlock[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;

  v5 = a5;
  v7 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PXPhotosAssetsFetcher__adjustedReverseSortOrderForCollection_reverseSortOrder_fetcherOptions___block_invoke;
  aBlock[3] = &unk_1E51482E0;
  aBlock[4] = &v12;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((v5 & 0x20) != 0
    && objc_msgSend(v7, "assetCollectionType") == 2
    && ((objc_msgSend(v7, "px_isUserSmartAlbum") & 1) == 0 && !objc_msgSend(v7, "isTransient")
     || objc_msgSend(v7, "px_isUtilityCollection")))
  {
    v8[2](v8);
  }
  v9 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v9;
}

+ (BOOL)_shouldReverseDefaultSortDescriptorsForCollection:(id)a3 fetcherOptions:(unint64_t)a4
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "assetCollectionType") == 1 && objc_msgSend(v4, "assetCollectionSubtype") == 101;

  return v5;
}

uint64_t __96__PXPhotosAssetsFetcher__adjustedReverseSortOrderForCollection_reverseSortOrder_fetcherOptions___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) ^= 1u;
  return result;
}

void __54__PXPhotosAssetsFetcher_sharedFetcherForPhotoLibrary___block_invoke_278(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  PXPhotosAssetsFetcher *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)sharedFetcherForPhotoLibrary__sharedFetcherByPhotoLibrary, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = -[PXPhotosAssetsFetcher initWithPhotoLibrary:]([PXPhotosAssetsFetcher alloc], "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend((id)sharedFetcherForPhotoLibrary__sharedFetcherByPhotoLibrary, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

@end
