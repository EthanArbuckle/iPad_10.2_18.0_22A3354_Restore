@implementation PXPhotoKitCollectionsDataSourceManager

- (void)getDisplayableAssets:(id *)a3 indexes:(id *)a4 forCollection:(id)a5 maximumCount:(int64_t)a6 useCache:(BOOL)a7
{
  id v13;
  PXPhotoKitCollectionsDataSourceManager *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
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
  id v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  int64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  int64_t v61;
  void *v62;
  id v63;
  id *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void (**v71)(void);
  _QWORD aBlock[4];
  PXPhotoKitCollectionsDataSourceManager *v73;
  id v74;
  _QWORD *v75;
  BOOL v76;
  _QWORD v77[5];
  id v78;
  id v79;
  void *v80;
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSourceManager+KeyAssets.m"), 19, CFSTR("expected out param"));

  }
  v14 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[PXPhotoKitCollectionsDataSourceManager containsAnyAssets:](v14, "containsAnyAssets:", v13))
  {
    v64 = a4;
    if (a7)
      -[PXPhotoKitCollectionsDataSourceManager keyAssetsFetchResultForCollection:](v14, "keyAssetsFetchResultForCollection:", v13);
    else
      -[PXPhotoKitCollectionsDataSourceManager uncachedKeyAssetFetchResultForSubCollection:](v14, "uncachedKeyAssetFetchResultForSubCollection:", v13);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x3032000000;
    v77[3] = __Block_byref_object_copy__131268;
    v77[4] = __Block_byref_object_dispose__131269;
    v78 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __118__PXPhotoKitCollectionsDataSourceManager_KeyAssets__getDisplayableAssets_indexes_forCollection_maximumCount_useCache___block_invoke;
    aBlock[3] = &unk_1E512B2E8;
    v75 = v77;
    v76 = a7;
    v73 = v14;
    v63 = v13;
    v74 = v63;
    v71 = (void (**)(void))_Block_copy(aBlock);
    v15 = objc_msgSend(v68, "count");
    if (v15)
    {
      objc_msgSend(v68, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      if (a6 >= 2 && v15 >= 2)
      {
        objc_msgSend(v68, "objectAtIndex:", 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (a6 <= 2 || v15 < 3)
      {
        v18 = v16 != 0;
        if (a6 == 1 && v16)
        {
          if (a3)
          {
            v85[0] = v16;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          v65 = v16;
          if (!a4)
          {

LABEL_90:
            _Block_object_dispose(v77, 8);

            goto LABEL_91;
          }
          v29 = (void *)MEMORY[0x1E0C99D20];
          v30 = (void *)MEMORY[0x1E0CB37E8];
          v71[2]();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v22, "indexOfObject:", v16));
          v70 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "arrayWithObject:", v70);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v66 = 0;
          goto LABEL_48;
        }
        v66 = 0;
        v20 = a6 == 3;
        v19 = v69 != 0;
LABEL_31:
        v71[2]();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v32, "count");
        v65 = v16;

        if (!v67)
        {
LABEL_89:

          goto LABEL_90;
        }
        v33 = v67 == 2 && v20;
        if (v33 && v18 && v19)
        {
          v34 = v16;
          if (a3)
          {
            v82[0] = v16;
            v82[1] = v69;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            v34 = v16;
          }
          if (!v64)
            goto LABEL_89;
          v35 = (void *)MEMORY[0x1E0CB37E8];
          v71[2]();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v22, "indexOfObject:", v34));
          v70 = (id)objc_claimAutoreleasedReturnValue();
          v81[0] = v70;
          v36 = (void *)MEMORY[0x1E0CB37E8];
          v71[2]();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v37, "indexOfObject:", v69));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v81[1] = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
          *v64 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_88;
        }
        v39 = v67 - 1;
        v40 = v67 == 1 && v20;
        if (!v40 || !v18)
        {
          if (a3)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a6);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v22 = 0;
          }
          if (v64)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a6);
            v70 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v70 = 0;
          }
          if (v18
            && (v71[2](),
                v42 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v42, "objectAtIndex:", 0),
                v43 = (void *)objc_claimAutoreleasedReturnValue(),
                v44 = objc_msgSend(v16, "isEqual:", v43),
                v43,
                v42,
                !v44))
          {
            v71[2]();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectAtIndex:", v39);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v65, "isEqual:", v46);

            if ((v47 & 1) == 0)
            {
              v71[2]();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "indexOfObject:", v65);

              if (v49 == 0x7FFFFFFFFFFFFFFFLL)
                v39 = 0;
              else
                v39 = v49;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (!objc_msgSend(v63, "keyAssetsAtEnd"))
                v39 = 0;
            }
            else
            {
              v39 = 0;
            }
          }
          v50 = 0;
          if (a6 >= 1 && v39 < v67)
          {
            v51 = v39;
            do
            {
              v71[2]();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "objectAtIndex:", v51);
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "addObject:", v53);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "addObject:", v54);

              if (v22)
                v55 = objc_msgSend(v22, "count");
              else
                v55 = objc_msgSend(v70, "count");
              v50 = v55;

              if (v50 >= a6)
                break;
              ++v51;
            }
            while (v51 < v67);
          }
          if (v50 < a6 && v39 >= 1 && v39 <= v67)
          {
            do
            {
              v71[2]();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = v39 - 1;
              objc_msgSend(v56, "objectAtIndex:", v39 - 1);
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "addObject:", v58);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39 - 1);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "addObject:", v59);

              if (v22)
                v60 = objc_msgSend(v22, "count");
              else
                v60 = objc_msgSend(v70, "count");
              v61 = v60;

              if (v61 >= a6)
                break;
              if ((unint64_t)v39 < 2)
                break;
              --v39;
            }
            while (v57 <= v67);
          }
          if (a3)
            *a3 = objc_retainAutorelease(v22);
          if (v64)
          {
            v70 = objc_retainAutorelease(v70);
            *v64 = v70;
          }
          goto LABEL_88;
        }
        if (a3)
        {
          v80 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!v64)
          goto LABEL_89;
        v41 = (void *)MEMORY[0x1E0CB37E8];
        v71[2]();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v22, "indexOfObject:", v16));
        v70 = (id)objc_claimAutoreleasedReturnValue();
        v79 = v70;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
        v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:
        *v64 = v31;
LABEL_88:

        goto LABEL_89;
      }
      objc_msgSend(v68, "objectAtIndex:", 2);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v69;
    }
    else
    {
      v66 = 0;
      v17 = 0;
      v16 = 0;
    }
    v18 = v16 != 0;
    v69 = v17;
    v19 = v17 != 0;
    v20 = a6 == 3;
    if (a6 == 3 && v16 && v17 && v66)
    {
      if (a3)
      {
        v84[0] = v16;
        v84[1] = v17;
        v84[2] = v66;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      v65 = v16;
      if (!v64)
        goto LABEL_89;
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v71[2]();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "indexOfObject:", v16));
      v70 = (id)objc_claimAutoreleasedReturnValue();
      v83[0] = v70;
      v23 = (void *)MEMORY[0x1E0CB37E8];
      v71[2]();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "indexOfObject:", v69));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v83[1] = v25;
      v26 = (void *)MEMORY[0x1E0CB37E8];
      v71[2]();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "indexOfObject:", v66));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v83[2] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3);
      *v64 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_88;
    }
    goto LABEL_31;
  }
LABEL_91:

}

- (id)displayableAssetsForCollectionList:(id)a3 maximumCount:(int64_t)a4 useCache:(BOOL)a5 correspondingCollections:(id *)a6
{
  _BOOL8 v6;
  id v9;
  PXPhotoKitCollectionsDataSourceManager *v10;
  PXPhotoKitCollectionsDataSourceManager *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v22;
  id v23;

  v6 = a5;
  v9 = a3;
  v10 = self;
  v11 = v10;
  v22 = v9;
  if (v6)
    -[PXPhotoKitCollectionsDataSourceManager keyAssetsFetchResultForCollection:](v10, "keyAssetsFetchResultForCollection:", v9);
  else
    -[PXPhotoKitCollectionsDataSourceManager uncachedKeyAssetFetchResultForSubCollection:](v10, "uncachedKeyAssetFetchResultForSubCollection:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") <= (unint64_t)a4)
    a4 = objc_msgSend(v12, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v15 = 0;
    while (1)
    {
      objc_msgSend(v12, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      -[PXPhotoKitCollectionsDataSourceManager getDisplayableAssets:indexes:forCollection:maximumCount:useCache:](v11, "getDisplayableAssets:indexes:forCollection:maximumCount:useCache:", &v23, 0, v16, 1, v6);
      v17 = v23;
      v18 = v17;
      if (v17)
      {
        if (objc_msgSend(v17, "count"))
        {
          objc_msgSend(v18, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

          objc_msgSend(v14, "addObject:", v16);
          if (objc_msgSend(v13, "count") == a4)
            break;
        }
      }

      if (++v15 >= (unint64_t)objc_msgSend(v12, "count"))
        goto LABEL_14;
    }

  }
LABEL_14:
  if (a6)
    *a6 = objc_retainAutorelease(v14);

  return v13;
}

id __118__PXPhotoKitCollectionsDataSourceManager_KeyAssets__getDisplayableAssets_indexes_forCollection_maximumCount_useCache___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v3, "assetsFetchResultForCollection:", v4);
    else
      objc_msgSend(v3, "uncachedFetchResultForSubCollection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  return v2;
}

- (PXPhotoKitCollectionsDataSourceManager)initWithConfiguration:(id)a3
{
  id v5;
  PXPhotoKitCollectionsDataSourceManager *v6;
  PXPhotoKitCollectionsDataSourceManager *v7;
  uint64_t v8;
  PHCollectionList *collectionList;
  uint64_t v10;
  PHFetchResult *collectionsFetchResult;
  uint64_t v12;
  NSMutableDictionary *subCollectionKeyAssetFetchResultsCache;
  uint64_t v14;
  NSMutableDictionary *subCollectionFetchResultsCache;
  uint64_t v16;
  NSMutableDictionary *collectionIndexPathByCollection;
  uint64_t v18;
  NSMutableDictionary *subCollectionActiveCountFetchOperations;
  NSOperationQueue *v20;
  NSOperationQueue *subCollectionFetchOperationQueue;
  NSOperationQueue *v22;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *subCollectionActiveKeyAssetsFetchOperations;
  NSOperationQueue *v26;
  NSOperationQueue *subCollectionKeyAssetsFetchOperationQueue;
  NSOperationQueue *v28;
  void *v29;
  uint64_t v30;
  NSMutableSet *changedSubCollections;
  uint64_t v32;
  NSMutableSet *pendingChangedCollections;
  void *v34;
  void *v35;
  id *p_photoLibrary;
  void *v37;
  void *v38;
  PXLibraryFilterState *v39;
  PXLibraryFilterState *libraryFilterState;
  _QWORD v42[4];
  id v43;
  id location;
  objc_super v45;

  v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PXPhotoKitCollectionsDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v45, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isPhotoLibraryEmpty = 1;
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(v5, "collectionList");
    v8 = objc_claimAutoreleasedReturnValue();
    collectionList = v7->_collectionList;
    v7->_collectionList = (PHCollectionList *)v8;

    objc_msgSend(v5, "collectionsFetchResult");
    v10 = objc_claimAutoreleasedReturnValue();
    collectionsFetchResult = v7->_collectionsFetchResult;
    v7->_collectionsFetchResult = (PHFetchResult *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    subCollectionKeyAssetFetchResultsCache = v7->_subCollectionKeyAssetFetchResultsCache;
    v7->_subCollectionKeyAssetFetchResultsCache = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    subCollectionFetchResultsCache = v7->_subCollectionFetchResultsCache;
    v7->_subCollectionFetchResultsCache = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    collectionIndexPathByCollection = v7->_collectionIndexPathByCollection;
    v7->_collectionIndexPathByCollection = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    subCollectionActiveCountFetchOperations = v7->__subCollectionActiveCountFetchOperations;
    v7->__subCollectionActiveCountFetchOperations = (NSMutableDictionary *)v18;

    v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    subCollectionFetchOperationQueue = v7->_subCollectionFetchOperationQueue;
    v7->_subCollectionFetchOperationQueue = v20;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_subCollectionFetchOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v7->_subCollectionFetchOperationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setName:](v7->_subCollectionFetchOperationQueue, "setName:", CFSTR("PXCollectionsDataSourceManager-subCollectionsFetchQueue"));
    v22 = v7->_subCollectionFetchOperationQueue;
    +[PXPhotoKitCollectionsDataSourceManager sharedSubCollectionsFetchQueue](PXPhotoKitCollectionsDataSourceManager, "sharedSubCollectionsFetchQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v22, "setUnderlyingQueue:", v23);

    -[NSOperationQueue setSuspended:](v7->_subCollectionFetchOperationQueue, "setSuspended:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    subCollectionActiveKeyAssetsFetchOperations = v7->__subCollectionActiveKeyAssetsFetchOperations;
    v7->__subCollectionActiveKeyAssetsFetchOperations = (NSMutableDictionary *)v24;

    v26 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    subCollectionKeyAssetsFetchOperationQueue = v7->_subCollectionKeyAssetsFetchOperationQueue;
    v7->_subCollectionKeyAssetsFetchOperationQueue = v26;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_subCollectionKeyAssetsFetchOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v7->_subCollectionKeyAssetsFetchOperationQueue, "setQualityOfService:", 17);
    -[NSOperationQueue setName:](v7->_subCollectionKeyAssetsFetchOperationQueue, "setName:", CFSTR("PXCollectionsDataSourceManager-subCollectionsKeyAssetsFetchQueue"));
    v28 = v7->_subCollectionKeyAssetsFetchOperationQueue;
    +[PXPhotoKitCollectionsDataSourceManager sharedKeyAssetsFetchQueue](PXPhotoKitCollectionsDataSourceManager, "sharedKeyAssetsFetchQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v28, "setUnderlyingQueue:", v29);

    -[NSOperationQueue setSuspended:](v7->_subCollectionKeyAssetsFetchOperationQueue, "setSuspended:", 1);
    v7->_simulateNonIncrementalChanges = objc_msgSend(v5, "simulateNonIncrementalChanges");
    v7->_pausedChangeDetailsBufferLength = objc_msgSend(v5, "pausedChangeDetailsBufferLength");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = objc_claimAutoreleasedReturnValue();
    changedSubCollections = v7->_changedSubCollections;
    v7->_changedSubCollections = (NSMutableSet *)v30;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v32 = objc_claimAutoreleasedReturnValue();
    pendingChangedCollections = v7->_pendingChangedCollections;
    v7->_pendingChangedCollections = (NSMutableSet *)v32;

    -[PHCollectionList photoLibrary](v7->_collectionList, "photoLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (!v34)
    {
      -[PHFetchResult photoLibrary](v7->_collectionsFetchResult, "photoLibrary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    p_photoLibrary = (id *)&v7->_photoLibrary;
    objc_storeStrong((id *)&v7->_photoLibrary, v35);
    if (!v34)

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:forKeyPath:options:context:", v7, CFSTR("IncludeSharedWithYou"), 0, PXUserDefaultsObservationContext_299891);
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", *p_photoLibrary);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v38);
    libraryFilterState = v7->_libraryFilterState;
    v7->_libraryFilterState = v39;

    -[PXLibraryFilterState registerChangeObserver:context:](v7->_libraryFilterState, "registerChangeObserver:context:", v7, PXLibraryFilterStateObservationContext_299889);
    if ((objc_msgSend(v5, "shouldIgnoreLibraryChanges") & 1) == 0)
      objc_msgSend(*p_photoLibrary, "px_registerChangeObserver:", v7);
    objc_initWeak(&location, v7);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __64__PXPhotoKitCollectionsDataSourceManager_initWithConfiguration___block_invoke;
    v42[3] = &unk_1E5148D30;
    objc_copyWeak(&v43, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v42);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);

  }
  return v7;
}

- (void)_registerContentSyndicationConfigurationProviderChangeObserver
{
  PXContentSyndicationConfigurationProvider *v3;
  PXContentSyndicationConfigurationProvider *contentSyndicationConfigurationProvider;

  +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", self->_photoLibrary);
  v3 = (PXContentSyndicationConfigurationProvider *)objc_claimAutoreleasedReturnValue();
  contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
  self->_contentSyndicationConfigurationProvider = v3;

  -[PXContentSyndicationConfigurationProvider registerChangeObserver:context:](self->_contentSyndicationConfigurationProvider, "registerChangeObserver:context:", self, PXContentSyndicationConfigurationObservationContext_299888);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("IncludeSharedWithYou"), PXUserDefaultsObservationContext_299891);
  -[PHPhotoLibrary px_unregisterChangeObserver:](self->_photoLibrary, "px_unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXPhotoKitCollectionsDataSourceManager;
  -[PXPhotoKitCollectionsDataSourceManager dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  PHCollectionList *collectionList;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  collectionList = self->_collectionList;
  -[PXSectionedDataSourceManager dataSourceIfExists](self, "dataSourceIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, collectionList:%@ dataSource:%@>"), v5, self, collectionList, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *changeProcessingPausedReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  changeProcessingPausedReasons = self->_changeProcessingPausedReasons;
  v10 = v6;
  if (!changeProcessingPausedReasons)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = self->_changeProcessingPausedReasons;
    self->_changeProcessingPausedReasons = v8;

    v6 = v10;
    changeProcessingPausedReasons = self->_changeProcessingPausedReasons;
  }
  if (v4)
    -[NSMutableSet addObject:](changeProcessingPausedReasons, "addObject:", v6);
  else
    -[NSMutableSet removeObject:](changeProcessingPausedReasons, "removeObject:", v6);
  -[PXPhotoKitCollectionsDataSourceManager setIsChangeProcessingPaused:](self, "setIsChangeProcessingPaused:", -[NSMutableSet count](self->_changeProcessingPausedReasons, "count") != 0);

}

- (void)setIsChangeProcessingPaused:(BOOL)a3
{
  NSMutableArray *changesDetailsWhilePaused;
  id v5;

  if (self->_isChangeProcessingPaused != a3)
  {
    self->_isChangeProcessingPaused = a3;
    if (!a3 && self->_changesOccurredWhilePaused)
    {
      v5 = -[PXPhotoKitCollectionsDataSourceManager _newDataSource](self, "_newDataSource");
      -[PXPhotoKitCollectionsDataSourceManager setDataSource:changeDetailsArray:](self, "setDataSource:changeDetailsArray:", v5, self->_changesDetailsWhilePaused);
      self->_changesOccurredWhilePaused = 0;
      changesDetailsWhilePaused = self->_changesDetailsWhilePaused;
      self->_changesDetailsWhilePaused = 0;

    }
  }
}

- (void)setCollectionFilterPredicate:(id)a3
{
  NSPredicate *v5;
  char v6;
  NSPredicate *v7;

  v7 = (NSPredicate *)a3;
  v5 = self->_collectionFilterPredicate;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSPredicate isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_collectionFilterPredicate, a3);
      -[PXPhotoKitCollectionsDataSourceManager _reloadAndRestartBackgroundFetchesIfNeeded](self, "_reloadAndRestartBackgroundFetchesIfNeeded");
    }
  }

}

- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *changesDetailsWhilePaused;
  uint64_t v11;
  NSMutableArray *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_simulateNonIncrementalChanges && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fromDataSourceIdentifier");
    objc_msgSend(v8, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B4A18, "changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:", v14, objc_msgSend(v15, "toDataSourceIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v17;
  }
  if (self->_isChangeProcessingPaused)
  {
    if (self->_changesOccurredWhilePaused)
    {
      if (!v8)
        goto LABEL_9;
    }
    else
    {
      self->_changesOccurredWhilePaused = 1;
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      changesDetailsWhilePaused = self->_changesDetailsWhilePaused;
      self->_changesDetailsWhilePaused = v9;

      if (!v8)
      {
LABEL_9:
        v12 = self->_changesDetailsWhilePaused;
        self->_changesDetailsWhilePaused = 0;

        goto LABEL_11;
      }
    }
    v11 = -[NSMutableArray count](self->_changesDetailsWhilePaused, "count");
    if ((unint64_t)(objc_msgSend(v8, "count") + v11) <= self->_pausedChangeDetailsBufferLength)
    {
      -[NSMutableArray addObjectsFromArray:](self->_changesDetailsWhilePaused, "addObjectsFromArray:", v8);
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v18.receiver = self;
  v18.super_class = (Class)PXPhotoKitCollectionsDataSourceManager;
  -[PXSectionedDataSourceManager setDataSource:changeDetailsArray:](&v18, sel_setDataSource_changeDetailsArray_, v6, v8);
LABEL_11:

}

- (id)_newDataSource
{
  NSMutableDictionary *subCollectionKeyAssetFetchResultsCache;
  NSMutableDictionary *collectionIndexPathByCollection;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  PXPhotoKitCollectionsDataSource *v7;
  void *v8;
  void *v9;
  void *v10;
  PHFetchResult *collectionsFetchResult;
  void *v12;
  void *v13;
  PXPhotoKitCollectionsDataSource *v14;
  uint64_t v16;
  NSMutableDictionary *v17;
  void *v18;

  -[PXPhotoKitCollectionsDataSourceManager _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  subCollectionKeyAssetFetchResultsCache = self->_subCollectionKeyAssetFetchResultsCache;
  collectionIndexPathByCollection = self->_collectionIndexPathByCollection;
  v5 = self->_subCollectionFetchResultsCache;
  v17 = collectionIndexPathByCollection;
  v6 = subCollectionKeyAssetFetchResultsCache;
  v7 = [PXPhotoKitCollectionsDataSource alloc];
  -[PXPhotoKitCollectionsDataSourceManager collectionList](self, "collectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSourceManager _collectionListBySection](self, "_collectionListBySection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSourceManager _virtualCollections](self, "_virtualCollections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  collectionsFetchResult = self->_collectionsFetchResult;
  -[PXPhotoKitCollectionsDataSourceManager libraryFilterState](self, "libraryFilterState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(subCollectionKeyAssetFetchResultsCache) = objc_msgSend(v12, "sharingFilter");
  -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v16) = (_WORD)subCollectionKeyAssetFetchResultsCache;
  v14 = -[PXPhotoKitCollectionsDataSource initWithRootCollectionList:collectionListBySection:collectionsFetchResultBySection:keyAssetsFetchResultsByCollection:collectionsIndexPathsByCollection:itemFetchResultByCollection:virtualCollections:collectionsFetchResult:sharingFilter:dataSourceConfiguration:](v7, "initWithRootCollectionList:collectionListBySection:collectionsFetchResultBySection:keyAssetsFetchResultsByCollection:collectionsIndexPathsByCollection:itemFetchResultByCollection:virtualCollections:collectionsFetchResult:sharingFilter:dataSourceConfiguration:", v8, v9, v18, v6, v17, v5, v10, collectionsFetchResult, v16, v13);

  return v14;
}

- (NSArray)_collectionsFetchResultBySection
{
  NSArray *collectionsFetchResultBySection;

  collectionsFetchResultBySection = self->__collectionsFetchResultBySection;
  if (!collectionsFetchResultBySection)
  {
    -[PXPhotoKitCollectionsDataSourceManager _updateFilteredCollectionsFetchResults](self, "_updateFilteredCollectionsFetchResults");
    collectionsFetchResultBySection = self->__collectionsFetchResultBySection;
  }
  return collectionsFetchResultBySection;
}

- (void)_updateFilteredCollectionsFetchResults
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotoKitCollectionsDataSourceManager _getSectionedCollectionListAndFetchResultsFromFetchResult:](self, "_getSectionedCollectionListAndFetchResultsFromFetchResult:", self->_collectionsFetchResult);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSourceManager _setCollectionListBySection:](self, "_setCollectionListBySection:", v3);

  objc_msgSend(v5, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSourceManager _setCollectionsFetchResultBySection:](self, "_setCollectionsFetchResultBySection:", v4);

  -[PXPhotoKitCollectionsDataSourceManager _updateCollectionIndexMappingForFilteredFetchResults](self, "_updateCollectionIndexMappingForFilteredFetchResults");
}

- (id)createInitialDataSource
{
  return -[PXPhotoKitCollectionsDataSourceManager _newDataSource](self, "_newDataSource");
}

- (id)customFetchOptionsForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customFetchOptionsForCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "includeGuestAssets") & 1) != 0)
  {
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "includeSharedWithYou");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIncludeGuestAssets:", objc_msgSend(v8, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v6, "setIncludeGuestAssets:", 0);
  }
  if ((objc_msgSend(v4, "px_isSharedAlbum") & 1) == 0)
  {
    -[PXPhotoKitCollectionsDataSourceManager libraryFilterState](self, "libraryFilterState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSharingFilter:", objc_msgSend(v9, "sharingFilter"));

  }
  return v6;
}

- (NSArray)_virtualCollections
{
  NSArray *virtualCollections;
  NSArray *v4;
  void *v5;
  void *v6;
  NSArray *v7;

  virtualCollections = self->__virtualCollections;
  if (!virtualCollections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (-[PXPhotoKitCollectionsDataSourceManagerConfiguration includePeopleAlbum](self->_configuration, "includePeopleAlbum"))
    {
      -[PHPhotoLibrary px_virtualCollections](self->_photoLibrary, "px_virtualCollections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "peopleCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v4, "addObject:", v6);

    }
    v7 = self->__virtualCollections;
    self->__virtualCollections = v4;

    virtualCollections = self->__virtualCollections;
  }
  return virtualCollections;
}

- (unint64_t)_fixedOrderPriorityForVirtualCollection:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "px_isPeopleVirtualCollection") & 1) != 0)
  {
    v4 = 40;
  }
  else if (objc_msgSend(v3, "px_isMemoriesVirtualCollection"))
  {
    v4 = 53;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)_isEmpty
{
  void *v3;
  void *v4;

  if (!self->_isPhotoLibraryEmpty)
    return 0;
  -[PHPhotoLibrary px_standardLibrarySpecificFetchOptions](self->_photoLibrary, "px_standardLibrarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(v3, "setIncludeAllBurstAssets:", 1);
  objc_msgSend(v3, "setIncludeAssetSourceTypes:", 7);
  objc_msgSend(v3, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isPhotoLibraryEmpty = objc_msgSend(v4, "count") == 0;

  return self->_isPhotoLibraryEmpty;
}

- (id)_getSectionedCollectionListAndFetchResultsFromFetchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitCollectionsDataSourceManager _filterFetchResult:](self, "_filterFetchResult:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CD14E0];
      objc_msgSend(v4, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transientCollectionListWithCollections:title:identifier:photoLibrary:", v8, 0, 0, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);
      objc_msgSend(v6, "addObject:", v12);

    }
    objc_msgSend(v7, "second");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration separateSectionsForSmartAndUserCollections](self->_configuration, "separateSectionsForSmartAndUserCollections");
    v15 = &stru_1E5149688;
    if (v14)
      v15 = CFSTR("PXUserCollectionsSectionTitle");
    v16 = (void *)MEMORY[0x1E0CD14E0];
    v17 = v15;
    objc_msgSend(v4, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transientCollectionListWithCollections:title:identifier:photoLibrary:", v13, v17, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);
    objc_msgSend(v6, "addObject:", v20);
    v21 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5CE0), "initWithFirst:second:", v5, v6);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_filterFetchResult:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  PXPhotoKitCollectionsDataSourceManager *v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v4 = a3;
  v5 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration separateSectionsForSmartAndUserCollections](self->_configuration, "separateSectionsForSmartAndUserCollections");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (id)v8;
  }
  else
  {
    v9 = v6;
    v8 = 0;
  }
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke;
  v20[3] = &unk_1E51486F0;
  v20[4] = self;
  v11 = v7;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v20);
  -[PXPhotoKitCollectionsDataSourceManager _virtualCollections](self, "_virtualCollections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") && !-[PXPhotoKitCollectionsDataSourceManager _isEmpty](self, "_isEmpty"))
  {
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke_2;
    v16[3] = &unk_1E5148740;
    v17 = v12;
    v18 = v13;
    v19 = self;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v16);

  }
  v14 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5CE0), "initWithFirst:second:", v8, v11);

  return v14;
}

- (BOOL)isInitialDuplicateDetectorProcessingCompleted
{
  void *v3;
  void *v4;
  double v5;
  BOOL isInitialDuplicateDetectorProcessingCompleted;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_lastDuplicatesProcessingCheckDate || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > 300.0))
  {
    self->_isInitialDuplicateDetectorProcessingCompleted = -[PHPhotoLibrary isInitialDuplicateDetectorProcessingCompleted](self->_photoLibrary, "isInitialDuplicateDetectorProcessingCompleted");
    objc_storeStrong((id *)&self->_lastDuplicatesProcessingCheckDate, v4);
  }
  isInitialDuplicateDetectorProcessingCompleted = self->_isInitialDuplicateDetectorProcessingCompleted;

  return isInitialDuplicateDetectorProcessingCompleted;
}

- (BOOL)_shouldIncludeCollection:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v16;
  uint64_t v17;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self->_configuration, "collectionTypesToInclude");
  v7 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration assetTypesToInclude](self->_configuration, "assetTypesToInclude");
  v8 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration shouldExcludePrivacySensitiveAlbums](self->_configuration, "shouldExcludePrivacySensitiveAlbums");
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration assetsFilterPredicate](self->_configuration, "assetsFilterPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSourceManager collectionFilterPredicate](self, "collectionFilterPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    LOBYTE(v12) = 0;
    if (!objc_msgSend(v10, "evaluateWithObject:", v5) || !v6)
      goto LABEL_89;
  }
  else if (!v6)
  {
    goto LABEL_86;
  }
  if ((objc_msgSend(v5, "px_isUnableToUploadSmartAlbum") & 1) != 0
    || (objc_msgSend(v5, "px_isRecoveredSmartAlbum") & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    if (objc_msgSend(v5, "px_isAllLibraryDuplicatesSmartAlbum"))
      v13 = -[PXPhotoKitCollectionsDataSourceManager isInitialDuplicateDetectorProcessingCompleted](self, "isInitialDuplicateDetectorProcessingCompleted");
    else
      v13 = 0;
    if (v6 == -1 && v7 == -1 && v13 == 0)
      goto LABEL_88;
  }
  if ((objc_msgSend(v5, "isTransient") & 1) == 0
    && (objc_msgSend(v5, "px_isSmartAlbum") & 1) == 0
    && (objc_msgSend(v5, "px_isSmartFolder") & 1) == 0
    && !objc_msgSend(v5, "px_isMyPhotoStreamAlbum"))
  {
    if (objc_msgSend(v5, "px_isUserCreated"))
    {
      if ((~(_DWORD)v6 & 0x4C0000) == 0)
      {
LABEL_14:
        LODWORD(v12) = 1;
        if (!v8)
          goto LABEL_75;
        goto LABEL_74;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (v6 >> 18) & 1;
        goto LABEL_73;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (v6 >> 19) & 1;
        goto LABEL_73;
      }
    }
    else
    {
      if ((objc_msgSend(v5, "px_isMacSyncedAlbum") & 1) != 0
        || (objc_msgSend(v5, "px_isMacSyncedFacesFolder") & 1) != 0
        || objc_msgSend(v5, "px_isMacSyncedEventsFolder"))
      {
        v12 = (v6 >> 21) & 1;
        if (!v8)
          goto LABEL_75;
        goto LABEL_74;
      }
      if (objc_msgSend(v5, "px_isSharedAlbum"))
      {
        v12 = (v6 >> 20) & 1;
        goto LABEL_73;
      }
    }
    goto LABEL_98;
  }
  if ((~(_DWORD)v6 & 0x1DFDCLL) == 0)
    goto LABEL_14;
  if (objc_msgSend(v5, "px_isAllPhotosSmartAlbum"))
  {
    v12 = (v6 >> 2) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isRecentlyAddedSmartAlbum"))
  {
    v12 = (v6 >> 3) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isFavoritesSmartAlbum"))
  {
    v12 = (v6 >> 4) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isRecentsSmartAlbum"))
  {
    v12 = (v6 >> 11) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isRecentlyEditedSmartAlbum"))
  {
    v12 = (v6 >> 12) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isPlacesSmartAlbum"))
  {
    v12 = (v6 >> 6) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isMediaTypeSmartAlbum"))
  {
    v12 = (uint64_t)v5;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_54:
        v16 = objc_msgSend((id)v12, "assetCollectionSubtype");
        if (v9
          || (v7 & 2) != 0
          || (unint64_t)(v16 - 202) > 6
          || ((1 << (v16 + 54)) & 0x45) == 0)
        {
          v17 = (v6 >> 7) & 1;
        }
        else
        {
          LODWORD(v17) = 0;
        }

        LODWORD(v12) = v17;
        if (!v8)
          goto LABEL_75;
        goto LABEL_74;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSourceManager.m"), 522, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v22, v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSourceManager.m"), 522, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v22);
    }

    goto LABEL_54;
  }
  if (objc_msgSend(v5, "px_isMyPhotoStreamAlbum"))
  {
    v12 = (v6 >> 10) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isHiddenSmartAlbum"))
  {
    v12 = (v6 >> 8) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isRecentlyDeletedSmartAlbum"))
  {
    v12 = (v6 >> 9) & 1;
    goto LABEL_73;
  }
  if ((objc_msgSend(v5, "px_isMacSyncedFacesFolder") & 1) != 0
    || objc_msgSend(v5, "px_isMacSyncedEventsFolder"))
  {
    v12 = (v6 >> 21) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isUserCreated"))
  {
    v12 = (v6 >> 22) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isImportSessionCollection"))
  {
    v12 = (v6 >> 14) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isUnableToUploadSmartAlbum"))
  {
    v12 = (v6 >> 15) & 1;
    goto LABEL_73;
  }
  if (!objc_msgSend(v5, "px_isAllLibraryDuplicatesSmartAlbum"))
  {
LABEL_98:
    LODWORD(v12) = 0;
    if (!v8)
      goto LABEL_75;
    goto LABEL_74;
  }
  v12 = (v6 >> 16) & 1;
LABEL_73:
  if (v8)
LABEL_74:
    LODWORD(v12) = v12 & ~objc_msgSend(v5, "px_isPrivacySensitiveAlbum");
LABEL_75:
  if ((v9 || v7 != -1) && (objc_msgSend(v5, "px_isRecentsSmartAlbum") & 1) == 0)
    v13 |= objc_msgSend(v5, "px_isFavoritesSmartAlbum") ^ 1;
  if ((_DWORD)v12 && ((v13 ^ 1) & (v6 >> 1) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[PXPhotoKitCollectionsDataSourceManager _containsAnyAssets:](self, "_containsAnyAssets:", v5))
      {
LABEL_87:
        self->_isPhotoLibraryEmpty = 0;
LABEL_88:
        LOBYTE(v12) = 1;
        goto LABEL_89;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || -[PXPhotoKitCollectionsDataSourceManager _containsAnyAlbumsWithAssets:](self, "_containsAnyAlbumsWithAssets:", v5))
      {
        goto LABEL_87;
      }
    }
LABEL_86:
    LOBYTE(v12) = 0;
  }
LABEL_89:

  return v12;
}

- (void)_updateCollectionIndexMappingForFilteredFetchResults
{
  void *v3;
  _QWORD v4[5];

  -[NSMutableDictionary removeAllObjects](self->_collectionIndexPathByCollection, "removeAllObjects");
  if (self->_collectionsFetchResult)
  {
    -[PXPhotoKitCollectionsDataSourceManager _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __94__PXPhotoKitCollectionsDataSourceManager__updateCollectionIndexMappingForFilteredFetchResults__block_invoke;
    v4[3] = &unk_1E5148790;
    v4[4] = self;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  }
}

- (void)_enumerateAllPhotoKitCollectionsUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PXPhotoKitCollectionsDataSourceManager__enumerateAllPhotoKitCollectionsUsingBlock___block_invoke;
  v7[3] = &unk_1E51487B8;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

- (int64_t)estimatedCountForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager libraryFilterState](self, "libraryFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sharingFilter");

  if (v6 == 2)
  {
    -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PXPhotoKitCollectionsDataSource estimatedCountForAssetCollection:withConfiguration:](PXPhotoKitCollectionsDataSource, "estimatedCountForAssetCollection:withConfiguration:", v4, v7);

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (BOOL)_containsAnyAssets:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v13;
  uint64_t v14;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager libraryFilterState](self, "libraryFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFiltering");

  if (!v6)
  {
    v9 = -[PXPhotoKitCollectionsDataSourceManager estimatedCountForAssetCollection:](self, "estimatedCountForAssetCollection:", v4);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v9 > 0;
      goto LABEL_9;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_subCollectionKeyAssetFetchResultsCache, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_subCollectionFetchResultsCache, "objectForKeyedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "count"))
      {
        v8 = 1;
        -[PXPhotoKitCollectionsDataSourceManager _keyAssetFetchResultForSubCollection:fetchIfNeeded:](self, "_keyAssetFetchResultForSubCollection:fetchIfNeeded:", v4, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14)
          goto LABEL_9;
        if ((objc_msgSend(v4, "px_isHiddenSmartAlbum") & 1) == 0
          && (objc_msgSend(v4, "px_isRecoveredSmartAlbum") & 1) == 0
          && !objc_msgSend(v4, "px_isImportSessionCollection"))
        {
          v8 = 0;
          goto LABEL_9;
        }
        goto LABEL_2;
      }

    }
    v8 = 1;
    goto LABEL_9;
  }
LABEL_2:
  -[PXPhotoKitCollectionsDataSourceManager fetchResultForSubCollection:](self, "fetchResultForSubCollection:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

LABEL_9:
  return v8;
}

- (BOOL)_containsAnyAlbumsWithAssets:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PXPhotoKitCollectionsDataSourceManager fetchResultForSubCollection:](self, "fetchResultForSubCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PXPhotoKitCollectionsDataSourceManager__containsAnyAlbumsWithAssets___block_invoke;
  v7[3] = &unk_1E51487E0;
  v7[4] = self;
  v7[5] = &v8;
  -[PXPhotoKitCollectionsDataSourceManager _recursivelyEnumerateAssetCollectionsInFetchResult:block:](self, "_recursivelyEnumerateAssetCollectionsInFetchResult:block:", v5, v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (id)indexPathForCollection:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_collectionIndexPathByCollection, "objectForKeyedSubscript:", a3);
}

- (void)_recursivelyEnumerateAssetCollectionsInFetchResult:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      if (objc_msgSend(v12, "canContainCollections"))
      {
        -[PXPhotoKitCollectionsDataSourceManager fetchResultForSubCollection:](self, "fetchResultForSubCollection:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __99__PXPhotoKitCollectionsDataSourceManager__recursivelyEnumerateAssetCollectionsInFetchResult_block___block_invoke;
        v14[3] = &unk_1E5148808;
        v15 = v7;
        v16 = &v21;
        -[PXPhotoKitCollectionsDataSourceManager _recursivelyEnumerateAssetCollectionsInFetchResult:block:](self, "_recursivelyEnumerateAssetCollectionsInFetchResult:block:", v13, v14);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          (*((void (**)(id, void *, uint64_t *))v7 + 2))(v7, v12, v22 + 3);
      }
      if (*((_BYTE *)v22 + 24))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_recursivelyCollectCollectionsIn:(id)a3 fetchResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "canContainCollections"))
        {
          objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v12, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXPhotoKitCollectionsDataSourceManager _recursivelyCollectCollectionsIn:fetchResult:](self, "_recursivelyCollectCollectionsIn:fetchResult:", v6, v13);

        }
        else if (objc_msgSend(v12, "canContainAssets"))
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)prepareBackgroundFetchingIfNeeded
{
  if (!self->_preparedBackgroundFetching)
  {
    self->_preparedBackgroundFetching = 1;
    -[PXPhotoKitCollectionsDataSourceManager _prepareBackgroundFetchingIfNeeded](self, "_prepareBackgroundFetchingIfNeeded");
  }
}

- (void)_prepareBackgroundFetchingIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "skipKeyAssetFetches") || (objc_msgSend(v3, "skipAssetFetches") & 1) == 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __76__PXPhotoKitCollectionsDataSourceManager__prepareBackgroundFetchingIfNeeded__block_invoke;
    v4[3] = &unk_1E5148830;
    v4[4] = self;
    -[PXPhotoKitCollectionsDataSourceManager _enumerateAllPhotoKitCollectionsUsingBlock:](self, "_enumerateAllPhotoKitCollectionsUsingBlock:", v4);
  }

}

- (void)_prepareBackgroundFetchingIfNeededForCollection:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PXPhotoKitCollectionsDataSourceManager _needsFetchResultForCollection:](self, "_needsFetchResultForCollection:"))
  {
    -[PXPhotoKitCollectionsDataSourceManager _enqueueFetchCountsOperationForCollection:](self, "_enqueueFetchCountsOperationForCollection:", v4);
  }
  if (-[PXPhotoKitCollectionsDataSourceManager _needsKeyAssetsFetchResultForCollection:](self, "_needsKeyAssetsFetchResultForCollection:", v4))
  {
    -[PXPhotoKitCollectionsDataSourceManager _enqueueFetchKeyAssetsOperationForCollection:](self, "_enqueueFetchKeyAssetsOperationForCollection:", v4);
  }

}

- (void)_reloadAndRestartBackgroundFetchesIfNeeded
{
  id v3;
  PXCollectionsDataSourceChangeDetails *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PXCollectionsDataSourceChangeDetails *v8;
  id v9;

  -[NSMutableDictionary removeAllObjects](self->_subCollectionFetchResultsCache, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_subCollectionKeyAssetFetchResultsCache, "removeAllObjects");
  if (self->_preparedBackgroundFetching)
    -[PXPhotoKitCollectionsDataSourceManager _cancelAllBackgroundFetches](self, "_cancelAllBackgroundFetches");
  if (self->__collectionsFetchResultBySection)
    -[PXPhotoKitCollectionsDataSourceManager _updateFilteredCollectionsFetchResults](self, "_updateFilteredCollectionsFetchResults");
  if (self->_preparedBackgroundFetching)
    -[PXPhotoKitCollectionsDataSourceManager _prepareBackgroundFetchingIfNeeded](self, "_prepareBackgroundFetchingIfNeeded");
  -[PXSectionedDataSourceManager dataSourceIfExists](self, "dataSourceIfExists");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v3 = -[PXPhotoKitCollectionsDataSourceManager _newDataSource](self, "_newDataSource");
    v4 = [PXCollectionsDataSourceChangeDetails alloc];
    v5 = objc_msgSend(v9, "identifier");
    v6 = objc_msgSend(v3, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:](v4, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v5, v6, v7, 0, 0);

    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v3, v8);
  }

}

- (void)_cancelAllBackgroundFetches
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveCountFetchOperations](self, "_subCollectionActiveCountFetchOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_183_299925);

  -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveCountFetchOperations](self, "_subCollectionActiveCountFetchOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveKeyAssetsFetchOperations](self, "_subCollectionActiveKeyAssetsFetchOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_185_299926);

  -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveKeyAssetsFetchOperations](self, "_subCollectionActiveKeyAssetsFetchOperations");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

- (void)startBackgroundFetchingIfNeeded
{
  -[NSOperationQueue setSuspended:](self->_subCollectionFetchOperationQueue, "setSuspended:", 0);
  -[NSOperationQueue setSuspended:](self->_subCollectionKeyAssetsFetchOperationQueue, "setSuspended:", 0);
}

- (void)pauseBackgroundFetching
{
  -[NSOperationQueue setSuspended:](self->_subCollectionFetchOperationQueue, "setSuspended:", 1);
  -[NSOperationQueue setSuspended:](self->_subCollectionKeyAssetsFetchOperationQueue, "setSuspended:", 1);
}

- (BOOL)isBackgroundFetching
{
  if (-[NSOperationQueue isSuspended](self->_subCollectionFetchOperationQueue, "isSuspended"))
    return !-[NSOperationQueue isSuspended](self->_subCollectionKeyAssetsFetchOperationQueue, "isSuspended");
  else
    return 1;
}

- (void)_enqueueFetchCountsOperationForCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveCountFetchOperations](self, "_subCollectionActiveCountFetchOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "cancel");
    -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveCountFetchOperations](self, "_subCollectionActiveCountFetchOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v10);

  }
  +[PXCollectionFetchOperation fetchOperationWithCollection:delegate:](PXCollectionFetchOperation, "fetchOperationWithCollection:delegate:", v10, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXPhotoKitCollectionsDataSourceManager customFetchOptionsForCollection:](self, "customFetchOptionsForCollection:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFetchOptions:", v8);
    -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveCountFetchOperations](self, "_subCollectionActiveCountFetchOperations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v10);

    -[NSOperationQueue addOperation:](self->_subCollectionFetchOperationQueue, "addOperation:", v7);
  }

}

- (void)_updateVisibleCountsForCollection:(id)a3 withWithFetchResult:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PXPhotoKitCollectionsDataSourceManager indexPathForCollection:](self, "indexPathForCollection:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_subCollectionFetchResultsCache, "objectForKeyedSubscript:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subCollectionFetchResultsCache, "setObject:forKeyedSubscript:", v6, v9);
    }
    -[PXPhotoKitCollectionsDataSourceManager _updateDataSourceForChangeOnCollection:](self, "_updateDataSourceForChangeOnCollection:", v9);
  }

}

- (void)_enqueueFetchKeyAssetsOperationForCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveKeyAssetsFetchOperations](self, "_subCollectionActiveKeyAssetsFetchOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "cancel");
    -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveKeyAssetsFetchOperations](self, "_subCollectionActiveKeyAssetsFetchOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v10);

  }
  +[PXCollectionFetchOperation fetchOperationWithCollection:delegate:](PXKeyAssetsCollectionFetchOperation, "fetchOperationWithCollection:delegate:", v10, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXPhotoKitCollectionsDataSourceManager customFetchOptionsForCollection:](self, "customFetchOptionsForCollection:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFetchOptions:", v8);
    objc_msgSend(v7, "setMaxKeyAssets:", 9);
    -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveKeyAssetsFetchOperations](self, "_subCollectionActiveKeyAssetsFetchOperations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v10);

    -[NSOperationQueue addOperation:](self->_subCollectionKeyAssetsFetchOperationQueue, "addOperation:", v7);
  }

}

- (void)_updateKeyAssetsCacheForCollection:(id)a3 withFetchResult:(id)a4 otherFetchResultsByAssetCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXPhotoKitCollectionsDataSourceManager indexPathForCollection:](self, "indexPathForCollection:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v9 && v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_subCollectionKeyAssetFetchResultsCache, "objectForKeyedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subCollectionKeyAssetFetchResultsCache, "setObject:forKeyedSubscript:", v9, v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v12;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_subCollectionKeyAssetFetchResultsCache, "objectForKeyedSubscript:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subCollectionKeyAssetFetchResultsCache, "setObject:forKeyedSubscript:", v9, v8);
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v24 = v10;
        v15 = v10;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v26 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_subCollectionKeyAssetFetchResultsCache, "objectForKeyedSubscript:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v21)
              {
                objc_msgSend(v15, "objectForKeyedSubscript:", v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subCollectionKeyAssetFetchResultsCache, "setObject:forKeyedSubscript:", v22, v20);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v17);
        }

        v12 = v23;
        v10 = v24;
      }
    }
  }

}

- (void)_updateDataSourceForChangeOnCollection:(id)a3
{
  double v4;
  double v5;
  double v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[NSMutableSet addObject:](self->_pendingChangedCollections, "addObject:", a3);
  if (!self->_publishChangesScheduledOnRunLoop)
  {
    self->_publishChangesScheduledOnRunLoop = 1;
    v4 = CFAbsoluteTimeGetCurrent() - self->_lastPublishChangesTime;
    if (v4 <= 0.0)
      v5 = 0.5;
    else
      v5 = 0.5 - v4;
    objc_initWeak(&location, self);
    v6 = 100000000.0;
    if (v5 >= 0.1)
      v6 = v5 * 1000000000.0;
    v7 = dispatch_time(0, (uint64_t)v6);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__PXPhotoKitCollectionsDataSourceManager__updateDataSourceForChangeOnCollection___block_invoke;
    v8[3] = &unk_1E5148D30;
    objc_copyWeak(&v9, &location);
    dispatch_after(v7, MEMORY[0x1E0C80D38], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_publishPendingCollectionChanges
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  PXCollectionsDataSourceChangeDetails *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  self->_publishChangesScheduledOnRunLoop = 0;
  v26 = -[PXPhotoKitCollectionsDataSourceManager _newDataSource](self, "_newDataSource");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = self->_pendingChangedCollections;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        -[PXPhotoKitCollectionsDataSourceManager indexPathForCollection:](self, "indexPathForCollection:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "section"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v11);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);
          }
          objc_msgSend(v12, "addIndex:", objc_msgSend(v10, "item"));

        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        v20 = objc_alloc((Class)off_1E50B1608);
        objc_msgSend(v14, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v21);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:]([PXCollectionsDataSourceChangeDetails alloc], "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v23, "identifier"), objc_msgSend(v26, "identifier"), v25, v13, 0);
  -[PXCollectionsDataSourceChangeDetails setCountUpdateChange:](v24, "setCountUpdateChange:", 1);
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v26, v24);
  -[NSMutableSet removeAllObjects](self->_pendingChangedCollections, "removeAllObjects");
  self->_lastPublishChangesTime = CFAbsoluteTimeGetCurrent();

}

- (void)collectionFetchOperationDidBegin:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  char isKindOfClass;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSourceManager dataSourceManagerLog](self, "dataSourceManagerLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, v4);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v9 = v6;
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      objc_msgSend(v5, "localizedTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      v12 = "FetchKeyAssetOperation";
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, v12, "%{public}@", (uint8_t *)&v13, 0xCu);

    }
  }
  else if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    objc_msgSend(v5, "localizedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    v12 = "FetchCollectionOperation";
    goto LABEL_8;
  }

}

- (void)collectionFetchOperationDidComplete:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[PXPhotoKitCollectionsDataSourceManager _endSignpostForFetchOperation:](self, "_endSignpostForFetchOperation:", v15);
  objc_msgSend(v15, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveKeyAssetsFetchOperations](self, "_subCollectionActiveKeyAssetsFetchOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v15)
    {
      -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveKeyAssetsFetchOperations](self, "_subCollectionActiveKeyAssetsFetchOperations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v4);

      objc_msgSend(v15, "outputFetchResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "outputOtherFetchResultsByAssetCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitCollectionsDataSourceManager _updateKeyAssetsCacheForCollection:withFetchResult:otherFetchResultsByAssetCollection:](self, "_updateKeyAssetsCacheForCollection:withFetchResult:otherFetchResultsByAssetCollection:", v4, v8, v9);

      -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v10, "updateKeyAssetFetchesInBackground");

      if ((_DWORD)v9)
        -[PXPhotoKitCollectionsDataSourceManager _updateDataSourceForChangeOnCollection:](self, "_updateDataSourceForChangeOnCollection:", v4);
    }
  }
  else
  {
    -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveCountFetchOperations](self, "_subCollectionActiveCountFetchOperations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v4);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v15)
    {
      -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveCountFetchOperations](self, "_subCollectionActiveCountFetchOperations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v4);

      objc_msgSend(v15, "outputFetchResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitCollectionsDataSourceManager _updateVisibleCountsForCollection:withWithFetchResult:](self, "_updateVisibleCountsForCollection:withWithFetchResult:", v4, v14);

    }
  }

}

- (void)_endSignpostForFetchOperation:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  char isKindOfClass;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager dataSourceManagerLog](self, "dataSourceManagerLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, v4);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = v5;
  v9 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      v13 = 0;
      v10 = "FetchKeyAssetOperation";
      v11 = (uint8_t *)&v13;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, v6, v10, "", v11, 2u);
    }
  }
  else if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v12 = 0;
    v10 = "FetchCollectionOperation";
    v11 = (uint8_t *)&v12;
    goto LABEL_8;
  }

}

- (id)keyAssetsFetchResultForCollection:(id)a3
{
  return -[PXPhotoKitCollectionsDataSourceManager keyAssetsFetchResultForCollection:fetchIfNeeded:](self, "keyAssetsFetchResultForCollection:fetchIfNeeded:", a3, 1);
}

- (BOOL)hasAssetsFetchResultForCollection:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_subCollectionFetchResultsCache, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)fetchResultForSubCollection:(id)a3
{
  return -[PXPhotoKitCollectionsDataSourceManager assetsFetchResultForCollection:fetchIfNeeded:](self, "assetsFetchResultForCollection:fetchIfNeeded:", a3, 1);
}

- (id)assetsFetchResultForCollection:(id)a3 fetchIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_subCollectionFetchResultsCache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    -[PXPhotoKitCollectionsDataSourceManager uncachedFetchResultForSubCollection:](self, "uncachedFetchResultForSubCollection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subCollectionFetchResultsCache, "setObject:forKeyedSubscript:", v7, v6);
  }

  return v7;
}

- (id)uncachedFetchResultForSubCollection:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager dataSourceManagerLog](self, "dataSourceManagerLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(v4, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchCollectionFetchResult", "%{public}@", (uint8_t *)&v15, 0xCu);

  }
  if (objc_msgSend(v4, "canContainAssets"))
  {
    -[PXPhotoKitCollectionsDataSourceManager customFetchOptionsForCollection:](self, "customFetchOptionsForCollection:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v4, "canContainCollections"))
  {
    objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = v8;
  v13 = v12;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_END, v6, "FetchCollectionFetchResult", ", (uint8_t *)&v15, 2u);
  }

  return v11;
}

- (BOOL)isCachedFetchResultOutdatedForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager fetchResultForSubCollection:](self, "fetchResultForSubCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSourceManager uncachedFetchResultForSubCollection:](self, "uncachedFetchResultForSubCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fetchedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToArray:", v8) ^ 1;

  return v9;
}

- (id)_keyAssetFetchResultForSubCollection:(id)a3 fetchIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v4 = a4;
  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSourceManager.m"), 1023, CFSTR("%s must be called on the main thread"), "-[PXPhotoKitCollectionsDataSourceManager _keyAssetFetchResultForSubCollection:fetchIfNeeded:]");

  }
  -[NSMutableDictionary objectForKey:](self->_subCollectionKeyAssetFetchResultsCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 1;
  else
    v9 = !v4;
  if (!v9)
  {
    -[PXPhotoKitCollectionsDataSourceManager uncachedKeyAssetFetchResultForSubCollection:](self, "uncachedKeyAssetFetchResultForSubCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subCollectionKeyAssetFetchResultsCache, "setObject:forKeyedSubscript:", v8, v7);
      -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveKeyAssetsFetchOperations](self, "_subCollectionActiveKeyAssetsFetchOperations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "cancel");
        -[PXPhotoKitCollectionsDataSourceManager _subCollectionActiveKeyAssetsFetchOperations](self, "_subCollectionActiveKeyAssetsFetchOperations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v7);

      }
    }
  }

  return v8;
}

- (id)uncachedKeyAssetFetchResultForSubCollection:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager dataSourceManagerLog](self, "dataSourceManagerLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(v4, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchKeyAsset", "%{public}@", (uint8_t *)&v18, 0xCu);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_13;
    }
    v12 = v4;
    objc_msgSend(v12, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_standardLibrarySpecificFetchOptions");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setReverseSortOrder:", objc_msgSend(v12, "keyCollectionsAtEnd"));
    objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v12, v10);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v10 = v4;
  if (objc_msgSend(v10, "assetCollectionType") != 4)
  {
    -[PXPhotoKitCollectionsDataSourceManager customFetchOptionsForCollection:](self, "customFetchOptionsForCollection:", v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSuppressSlowFetchReports:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v10, v12);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = (void *)v14;

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_13:
  v15 = v8;
  v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_END, v6, "FetchKeyAsset", ", (uint8_t *)&v18, 2u);
  }

  return v11;
}

- (BOOL)_updateCachedSubCollectionFetchResultsForChange:(id)a3 fetchResultChangeDetails:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *subCollectionFetchResultsCache;
  uint64_t v10;
  id v11;
  NSMutableDictionary *subCollectionKeyAssetFetchResultsCache;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  PXPhotoKitCollectionsDataSourceManager *v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  PXPhotoKitCollectionsDataSourceManager *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  objc_msgSend(v7, "removedObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(v7, "changedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "count"))
  {
    -[NSMutableDictionary removeObjectsForKeys:](self->_subCollectionFetchResultsCache, "removeObjectsForKeys:", v26);
    -[NSMutableDictionary removeObjectsForKeys:](self->_subCollectionKeyAssetFetchResultsCache, "removeObjectsForKeys:", v26);
  }
  subCollectionFetchResultsCache = self->_subCollectionFetchResultsCache;
  v10 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __115__PXPhotoKitCollectionsDataSourceManager__updateCachedSubCollectionFetchResultsForChange_fetchResultChangeDetails___block_invoke;
  v36[3] = &unk_1E51488D8;
  v11 = v6;
  v37 = v11;
  v38 = self;
  v39 = &v40;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subCollectionFetchResultsCache, "enumerateKeysAndObjectsUsingBlock:", v36);
  subCollectionKeyAssetFetchResultsCache = self->_subCollectionKeyAssetFetchResultsCache;
  v32[0] = v10;
  v32[1] = 3221225472;
  v32[2] = __115__PXPhotoKitCollectionsDataSourceManager__updateCachedSubCollectionFetchResultsForChange_fetchResultChangeDetails___block_invoke_2;
  v32[3] = &unk_1E51488D8;
  v27 = v11;
  v33 = v27;
  v34 = self;
  v35 = &v40;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subCollectionKeyAssetFetchResultsCache, "enumerateKeysAndObjectsUsingBlock:", v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v17, "assetCollectionType") != 2)
        {
          -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "updateKeyAssetFetchesInBackground");

          if (v19)
          {
            if (-[PXPhotoKitCollectionsDataSourceManager _needsKeyAssetsFetchResultForCollection:](self, "_needsKeyAssetsFetchResultForCollection:", v17))
            {
              objc_msgSend(v17, "objectID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                objc_msgSend(v17, "objectID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v27, "keyAssetsChangedForPHAssetCollectionOID:", v21);

                if (v22)
                {
                  -[NSMutableDictionary removeObjectForKey:](self->_subCollectionKeyAssetFetchResultsCache, "removeObjectForKey:", v17);
                  -[PXPhotoKitCollectionsDataSourceManager _enqueueFetchKeyAssetsOperationForCollection:](self, "_enqueueFetchKeyAssetsOperationForCollection:", v17);
                }
              }
            }
          }
          else
          {
            -[NSMutableDictionary removeObjectForKey:](self->_subCollectionKeyAssetFetchResultsCache, "removeObjectForKey:", v17);
          }
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    }
    while (v14);
  }

  v23 = *((_BYTE *)v41 + 24) != 0;
  _Block_object_dispose(&v40, 8);

  return v23;
}

- (id)_changedSubCollectionIndexesBySections
{
  void *v3;
  NSMutableSet *changedSubCollections;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  changedSubCollections = self->_changedSubCollections;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PXPhotoKitCollectionsDataSourceManager__changedSubCollectionIndexesBySections__block_invoke;
  v9[3] = &unk_1E5148900;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[NSMutableSet enumerateObjectsUsingBlock:](changedSubCollections, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)_subitemChangeDetailsByItemBySection
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[PXPhotoKitCollectionsDataSourceManager _changedSubCollectionIndexesBySections](self, "_changedSubCollectionIndexesBySections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __78__PXPhotoKitCollectionsDataSourceManager__subitemChangeDetailsByItemBySection__block_invoke;
    v6[3] = &unk_1E5148950;
    v4 = v3;
    v7 = v4;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  PXPhotoKitCollectionsDataSourceManager *v22;

  v10 = a3;
  if ((void *)PXUserDefaultsObservationContext_299891 == a6)
  {
    v12 = (void *)MEMORY[0x1E0C99EA0];
    v13 = a4;
    objc_msgSend(v12, "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (v15)
    {
      v16 = objc_msgSend(v10, "isEqual:", CFSTR("IncludeSharedWithYou"));

      if (v16)
      {
        v18 = MEMORY[0x1E0C809B0];
        v19 = 3221225472;
        v20 = __89__PXPhotoKitCollectionsDataSourceManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v21 = &unk_1E5149198;
        v22 = self;
        px_dispatch_on_main_queue();
      }
    }
    else
    {

    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PXPhotoKitCollectionsDataSourceManager;
    v11 = a4;
    -[PXPhotoKitCollectionsDataSourceManager observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  NSMutableDictionary *subCollectionFetchResultsCache;
  id v10;
  _QWORD v11[5];

  v6 = a4;
  v8 = a3;
  if ((void *)PXContentSyndicationConfigurationObservationContext_299888 == a5)
  {
    if ((v6 & 5) != 0)
    {
      v10 = v8;
      subCollectionFetchResultsCache = self->_subCollectionFetchResultsCache;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __71__PXPhotoKitCollectionsDataSourceManager_observable_didChange_context___block_invoke;
      v11[3] = &unk_1E5148978;
      v11[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subCollectionFetchResultsCache, "enumerateKeysAndObjectsUsingBlock:", v11);
      -[NSMutableDictionary removeAllObjects](self->_subCollectionFetchResultsCache, "removeAllObjects");
      goto LABEL_7;
    }
  }
  else if ((v6 & 1) != 0 && (void *)PXLibraryFilterStateObservationContext_299889 == a5)
  {
    v10 = v8;
    -[PXPhotoKitCollectionsDataSourceManager _reloadAndRestartBackgroundFetchesIfNeeded](self, "_reloadAndRestartBackgroundFetchesIfNeeded");
LABEL_7:
    v8 = v10;
  }

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  return 0;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  BOOL v7;
  _BOOL4 v9;
  PHCollectionList *v10;
  PHFetchResult *v11;
  NSArray *v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  NSArray *v30;
  PHCollectionList *collectionList;
  PHFetchResult *collectionsFetchResult;
  NSArray *collectionListBySection;
  NSArray *collectionsFetchResultBySection;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  PXCollectionsDataSourceChangeDetails *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t i;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  PHFetchResult *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSArray *v58;
  PHCollectionList *v59;
  NSArray *v60;
  PXPhotoKitCollectionsDataSourceManager *v61;
  void *v62;
  void *v63;
  PHFetchResult *v64;
  NSArray *v65;
  PHCollectionList *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  PXPhotoKitCollectionsDataSourceManager *v72;

  v67 = a3;
  objc_msgSend(v67, "changeDetailsForFetchResult:", self->_collectionsFetchResult);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "changeDetailsForObject:", self->_collectionList);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPhotoKitCollectionsDataSourceManager _updateCachedSubCollectionFetchResultsForChange:fetchResultChangeDetails:](self, "_updateCachedSubCollectionFetchResultsForChange:fetchResultChangeDetails:", v67, v4);
  if (v4)
    v7 = 0;
  else
    v7 = v5 == 0;
  if (!v7 || v6)
  {
    v9 = v6;
    v10 = self->_collectionList;
    v11 = self->_collectionsFetchResult;
    -[PXPhotoKitCollectionsDataSourceManager _collectionListBySection](self, "_collectionListBySection");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitCollectionsDataSourceManager _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
    v65 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v62 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectAfterChanges");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (PHCollectionList *)v13;
    }
    v59 = v10;
    v61 = self;
    if (v4)
    {
      v14 = v65;
      objc_msgSend(v4, "fetchResultAfterChanges");
      v15 = objc_claimAutoreleasedReturnValue();

      v54 = (PHFetchResult *)v15;
      -[PXPhotoKitCollectionsDataSourceManager _getSectionedCollectionListAndFetchResultsFromFetchResult:](self, "_getSectionedCollectionListAndFetchResultsFromFetchResult:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "first");
      v55 = objc_claimAutoreleasedReturnValue();

      v56 = v16;
      objc_msgSend(v16, "second");
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v57 = v4;
      objc_msgSend(v4, "changedObjects");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[NSArray count](v14, "count");
      if (v19 | -[NSArray count](v17, "count"))
      {
        v20 = 0;
        do
        {
          if (v20 >= -[NSArray count](v14, "count"))
          {
            v21 = 0;
          }
          else
          {
            -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (v20 >= -[NSArray count](v17, "count"))
          {
            v23 = 0;
            v24 = 0;
          }
          else
          {
            -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", v20);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = (void *)v22;
            v24 = 0;
            if (v21 && v22)
            {
              objc_msgSend(MEMORY[0x1E0CD1588], "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v21, v22, v63);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, v26);

          ++v20;
          v27 = -[NSArray count](v14, "count");
          v28 = -[NSArray count](v17, "count");
          if (v27 <= v28)
            v29 = v28;
          else
            v29 = v27;
        }
        while (v20 < v29);
      }

      v11 = v54;
      v30 = v65;
    }
    else
    {
      if (!v9)
      {
        v18 = 0;
        v17 = v65;
        goto LABEL_27;
      }
      v57 = 0;
      -[PXPhotoKitCollectionsDataSourceManager _getSectionedCollectionListAndFetchResultsFromFetchResult:](self, "_getSectionedCollectionListAndFetchResultsFromFetchResult:", v11);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "first");
      v55 = objc_claimAutoreleasedReturnValue();

      v56 = v43;
      objc_msgSend(v43, "second");
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v65;
      v44 = -[NSArray count](v65, "count");
      v45 = -[NSArray count](v17, "count");
      if (v44 <= v45)
        v46 = v45;
      else
        v46 = v44;
      if (v46 >= 1)
      {
        for (i = 0; i != v46; ++i)
        {
          if (i >= -[NSArray count](v30, "count"))
          {
            v48 = 0;
          }
          else
          {
            -[NSArray objectAtIndexedSubscript:](v30, "objectAtIndexedSubscript:", i);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (i >= -[NSArray count](v17, "count"))
          {
            v50 = 0;
            v51 = 0;
          }
          else
          {
            -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", i);
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)v49;
            v51 = 0;
            if (v48 && v49)
            {
              objc_msgSend(MEMORY[0x1E0CD1588], "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v48, v49, MEMORY[0x1E0C9AA60]);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v52, v53);

          v30 = v65;
        }
      }
    }

    v12 = (NSArray *)v55;
    v4 = v57;
LABEL_27:
    collectionList = v61->_collectionList;
    v61->_collectionList = v59;
    v66 = v59;

    collectionsFetchResult = v61->_collectionsFetchResult;
    v61->_collectionsFetchResult = v11;
    v64 = v11;

    collectionListBySection = v61->__collectionListBySection;
    v61->__collectionListBySection = v12;
    v60 = v12;

    collectionsFetchResultBySection = v61->__collectionsFetchResultBySection;
    v61->__collectionsFetchResultBySection = v17;
    v58 = v17;

    -[PXPhotoKitCollectionsDataSourceManager _updateCollectionIndexMappingForFilteredFetchResults](v61, "_updateCollectionIndexMappingForFilteredFetchResults");
    v35 = -[PXPhotoKitCollectionsDataSourceManager _newDataSource](v61, "_newDataSource");
    v36 = MEMORY[0x1E0C809B0];
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke;
    v70[3] = &unk_1E51489C8;
    v71 = v35;
    v72 = v61;
    v37 = v35;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v70);
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v68[0] = v36;
    v68[1] = 3221225472;
    v68[2] = __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke_3;
    v68[3] = &unk_1E51489F0;
    v69 = (id)objc_claimAutoreleasedReturnValue();
    v39 = v69;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v68);
    -[PXPhotoKitCollectionsDataSourceManager _subitemChangeDetailsByItemBySection](v61, "_subitemChangeDetailsByItemBySection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeAllObjects](v61->_changedSubCollections, "removeAllObjects");
    -[PXSectionedDataSourceManager dataSource](v61, "dataSource");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:]([PXCollectionsDataSourceChangeDetails alloc], "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v41, "identifier"), objc_msgSend(v37, "identifier"), v38, v39, v40);
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](v61, "setDataSource:changeDetails:", v37, v42);

    v5 = v62;
  }

}

- (BOOL)_needsKeyAssetsFetchResultForCollection:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v9;
  int v10;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "skipKeyAssetFetches"))
  {

LABEL_4:
    v7 = 0;
    goto LABEL_5;
  }
  v6 = -[PXPhotoKitCollectionsDataSourceManager _isPlacesAlbumAssetCollection:](self, "_isPlacesAlbumAssetCollection:", v4);

  if (v6)
    goto LABEL_4;
  -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "skipKeyAssetFetchesForSmartAlbums");

  v7 = !v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || objc_msgSend(v4, "assetCollectionType") != 2;
LABEL_5:

  return v7;
}

- (BOOL)_needsFetchResultForCollection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  int v8;
  _BOOL4 v9;
  int isKindOfClass;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "skipAssetFetches");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "assetCollectionType") == 2)
      v8 = !-[PXPhotoKitCollectionsDataSourceManager _isPlacesAlbumAssetCollection:](self, "_isPlacesAlbumAssetCollection:", v4);
    else
      v8 = 0;
    v9 = -[PXPhotoKitCollectionsDataSourceManager _isImportsAssetCollection:](self, "_isImportsAssetCollection:", v4);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetsFilterPredicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = objc_msgSend(v4, "px_isRegularAlbum");
    else
      v13 = 0;
    -[PXPhotoKitCollectionsDataSourceManager libraryFilterState](self, "libraryFilterState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "sharingFilter");

    if (((v8 | v9 | isKindOfClass) & 1) != 0)
    {
      v7 = 1;
    }
    else if (v15 == 2)
    {
      v7 = v13;
    }
    else
    {
      v7 = 1;
    }
  }

  return v7;
}

- (BOOL)_isPlacesAlbumAssetCollection:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "assetCollectionSubtype") == 1000000203;

  return v4;
}

- (BOOL)_isImportsAssetCollection:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "assetCollectionType") == 9;

  return v4;
}

- (BOOL)canEditAlbums
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PXPhotoKitCollectionsDataSourceManager collectionList](self, "collectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isTransient") & 1) == 0)
  {
    v7 = 1;
    if ((objc_msgSend(v4, "canPerformEditOperation:", 1) & 1) == 0)
    {
      if ((objc_msgSend(v4, "canPerformEditOperation:", 3) & 1) != 0
        || (objc_msgSend(v4, "canPerformEditOperation:", 4) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        v7 = objc_msgSend(v4, "canPerformEditOperation:", 5);
      }
    }
  }
  else
  {
    -[PXPhotoKitCollectionsDataSourceManager collectionsFetchResult](self, "collectionsFetchResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD1BA0]);
  }

  return v7;
}

- (BOOL)canDeleteCollection:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "canPerformEditOperation:", 6);
  else
    v4 = 0;

  return v4;
}

- (BOOL)canRenameCollection:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "canPerformEditOperation:", 7);
  else
    v4 = 0;

  return v4;
}

- (BOOL)canReorderCollection:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "px_isSharedAlbum") & 1) == 0)
  {
    -[PXPhotoKitCollectionsDataSourceManager configuration](self, "configuration");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "collectionList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canPerformEditOperation:", 5);

    LODWORD(v6) = objc_msgSend(v4, "collectionHasFixedOrder");
    v9 = (v6 | objc_msgSend(v4, "isTransient")) ^ 1;
    if (v8)
      v5 = v9;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)indexOfFirstReorderableCollection
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXPhotoKitCollectionsDataSourceManager collectionsFetchResult](self, "collectionsFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PXPhotoKitCollectionsDataSourceManager_indexOfFirstReorderableCollection__block_invoke;
  v6[3] = &unk_1E5148A18;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = objc_msgSend(v3, "count");
    v8[3] = v4;
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)startCoalescingFetchResultChanges
{
  self->_publishChangesScheduledOnRunLoop = 1;
}

- (void)waitUntilBackgroundFetchingFinishedWithCompletionBlock:(id)a3
{
  id v4;
  NSOperationQueue *subCollectionFetchOperationQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  PXPhotoKitCollectionsDataSourceManager *v11;
  id v12;

  v4 = a3;
  subCollectionFetchOperationQueue = self->_subCollectionFetchOperationQueue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke;
  v10 = &unk_1E5148CE0;
  v11 = self;
  v12 = v4;
  v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](subCollectionFetchOperationQueue, "addOperationWithBlock:", &v7);
  -[NSOperationQueue setSuspended:](self->_subCollectionFetchOperationQueue, "setSuspended:", 0, v7, v8, v9, v10, v11);
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_subCollectionFetchOperationQueue, "waitUntilAllOperationsAreFinished");

}

- (int64_t)numberOfPendingKeyAssetFetches
{
  return -[NSOperationQueue operationCount](self->_subCollectionKeyAssetsFetchOperationQueue, "operationCount");
}

- (OS_os_log)dataSourceManagerLog
{
  if (dataSourceManagerLog_onceToken != -1)
    dispatch_once(&dataSourceManagerLog_onceToken, &__block_literal_global_205_299874);
  return (OS_os_log *)(id)dataSourceManagerLog_dataSourceManagerLog;
}

- (NSMutableDictionary)_subCollectionActiveCountFetchOperations
{
  return self->__subCollectionActiveCountFetchOperations;
}

- (NSMutableDictionary)_subCollectionActiveKeyAssetsFetchOperations
{
  return self->__subCollectionActiveKeyAssetsFetchOperations;
}

- (NSArray)_collectionListBySection
{
  return self->__collectionListBySection;
}

- (void)_setCollectionListBySection:(id)a3
{
  objc_storeStrong((id *)&self->__collectionListBySection, a3);
}

- (void)_setCollectionsFetchResultBySection:(id)a3
{
  objc_storeStrong((id *)&self->__collectionsFetchResultBySection, a3);
}

- (void)set_virtualCollections:(id)a3
{
  objc_storeStrong((id *)&self->__virtualCollections, a3);
}

- (BOOL)isChangeProcessingPaused
{
  return self->_isChangeProcessingPaused;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setIsInitialDuplicateDetectorProcessingCompleted:(BOOL)a3
{
  self->_isInitialDuplicateDetectorProcessingCompleted = a3;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (PHFetchResult)collectionsFetchResult
{
  return self->_collectionsFetchResult;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)configuration
{
  return self->_configuration;
}

- (NSPredicate)collectionFilterPredicate
{
  return self->_collectionFilterPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionFilterPredicate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->__virtualCollections, 0);
  objc_storeStrong((id *)&self->__collectionsFetchResultBySection, 0);
  objc_storeStrong((id *)&self->__collectionListBySection, 0);
  objc_storeStrong((id *)&self->__subCollectionActiveKeyAssetsFetchOperations, 0);
  objc_storeStrong((id *)&self->__subCollectionActiveCountFetchOperations, 0);
  objc_storeStrong((id *)&self->_lastDuplicatesProcessingCheckDate, 0);
  objc_storeStrong((id *)&self->_changesDetailsWhilePaused, 0);
  objc_storeStrong((id *)&self->_changeProcessingPausedReasons, 0);
  objc_storeStrong((id *)&self->_changedSubCollections, 0);
  objc_storeStrong((id *)&self->_pendingChangedCollections, 0);
  objc_storeStrong((id *)&self->_subCollectionKeyAssetsFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_subCollectionFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_collectionIndexPathByCollection, 0);
  objc_storeStrong((id *)&self->_subCollectionKeyAssetFetchResultsCache, 0);
  objc_storeStrong((id *)&self->_subCollectionFetchResultsCache, 0);
  objc_storeStrong((id *)&self->_contentSyndicationConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_collectionsFetchResult, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
}

void __62__PXPhotoKitCollectionsDataSourceManager_dataSourceManagerLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "PhotoKitDataSourceManager");
  v1 = (void *)dataSourceManagerLog_dataSourceManagerLog;
  dataSourceManagerLog_dataSourceManagerLog = (uint64_t)v0;

}

void __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E5148A40;
  v4[1] = 3221225472;
  v5 = v2;
  objc_msgSend(v3, "addOperationWithBlock:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setSuspended:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "waitUntilAllOperationsAreFinished");

}

void __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke_3;
  block[3] = &unk_1E5148A40;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __75__PXPhotoKitCollectionsDataSourceManager_indexOfFirstReorderableCollection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canReorderCollection:", a2);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

void __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  objc_msgSend(a3, "insertedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke_2;
  v8[3] = &unk_1E51489A0;
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v8);

}

void __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = v8;
  }
  v7 = v6;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

}

void __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionAtIndexPath:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "_prepareBackgroundFetchingIfNeededForCollection:", v5);
}

uint64_t __71__PXPhotoKitCollectionsDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueFetchCountsOperationForCollection:", a2);
}

uint64_t __89__PXPhotoKitCollectionsDataSourceManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadAndRestartBackgroundFetchesIfNeeded");
}

void __78__PXPhotoKitCollectionsDataSourceManager__subitemChangeDetailsByItemBySection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PXPhotoKitCollectionsDataSourceManager__subitemChangeDetailsByItemBySection__block_invoke_2;
  v10[3] = &unk_1E5148928;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

void __78__PXPhotoKitCollectionsDataSourceManager__subitemChangeDetailsByItemBySection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = objc_alloc((Class)off_1E50B1608);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v8);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

void __80__PXPhotoKitCollectionsDataSourceManager__changedSubCollectionIndexesBySections__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v9 = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    }
    objc_msgSend(v6, "addIndex:", objc_msgSend(v9, "item"));

    v3 = v9;
  }

}

void __115__PXPhotoKitCollectionsDataSourceManager__updateCachedSubCollectionFetchResultsForChange_fetchResultChangeDetails___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "changeDetailsForFetchResult:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "fetchResultAfterChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "setObject:forKeyedSubscript:", v7, v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "addObject:", v8);

  }
}

void __115__PXPhotoKitCollectionsDataSourceManager__updateCachedSubCollectionFetchResultsForChange_fetchResultChangeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "changeDetailsForObject:", v10);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "changeDetailsForFetchResult:", v6);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v7 | v8)
  {
    objc_msgSend((id)v8, "fetchResultAfterChanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "setObject:forKeyedSubscript:", v9, v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "addObject:", v10);

  }
}

void __81__PXPhotoKitCollectionsDataSourceManager__updateDataSourceForChangeOnCollection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = *MEMORY[0x1E0C99748];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:modes:", sel__publishPendingCollectionChanges, 0, 0, v2);

}

uint64_t __69__PXPhotoKitCollectionsDataSourceManager__cancelAllBackgroundFetches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

uint64_t __69__PXPhotoKitCollectionsDataSourceManager__cancelAllBackgroundFetches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

uint64_t __76__PXPhotoKitCollectionsDataSourceManager__prepareBackgroundFetchingIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareBackgroundFetchingIfNeededForCollection:", a2);
}

uint64_t __99__PXPhotoKitCollectionsDataSourceManager__recursivelyEnumerateAssetCollectionsInFetchResult_block___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __71__PXPhotoKitCollectionsDataSourceManager__containsAnyAlbumsWithAssets___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_containsAnyAssets:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __85__PXPhotoKitCollectionsDataSourceManager__enumerateAllPhotoKitCollectionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateObjectsUsingBlock:", *(_QWORD *)(a1 + 32));
}

uint64_t __94__PXPhotoKitCollectionsDataSourceManager__updateCollectionIndexMappingForFilteredFetchResults__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __94__PXPhotoKitCollectionsDataSourceManager__updateCollectionIndexMappingForFilteredFetchResults__block_invoke_2;
  v4[3] = &unk_1E5148768;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = a3;
  return objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);
}

void __94__PXPhotoKitCollectionsDataSourceManager__updateCollectionIndexMappingForFilteredFetchResults__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB36B0];
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v5, "indexPathForItem:inSection:", a3, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setObject:forKeyedSubscript:", v8, v7);

}

void __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldIncludeCollection:"))
  {
    v3 = objc_msgSend(v5, "px_isUserCreated");
    v4 = 48;
    if (v3)
      v4 = 40;
    objc_msgSend(*(id *)(a1 + v4), "addObject:", v5);
  }

}

void __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  uint64_t v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke_3;
  v12 = &unk_1E5148718;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13 = v6;
  v14 = v7;
  v8 = objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1024, &v9);
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v4, v8, v9, v10, v11, v12);

}

uint64_t __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  if (objc_msgSend(v6, "containsObject:", v7))
    v8 = objc_msgSend(*(id *)(a1 + 40), "_fixedOrderPriorityForVirtualCollection:", v7);
  else
    v8 = objc_msgSend(v7, "collectionFixedOrderPriority");
  v9 = v8;

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
    v10 = objc_msgSend(*(id *)(a1 + 40), "_fixedOrderPriorityForVirtualCollection:", v5);
  else
    v10 = objc_msgSend(v5, "collectionFixedOrderPriority");
  if (v9 < v10)
    v11 = -1;
  else
    v11 = v9 > v10;

  return v11;
}

void __64__PXPhotoKitCollectionsDataSourceManager_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_registerContentSyndicationConfigurationProviderChangeObserver");

}

+ (OS_dispatch_queue)sharedSubCollectionsFetchQueue
{
  if (sharedSubCollectionsFetchQueue_onceToken != -1)
    dispatch_once(&sharedSubCollectionsFetchQueue_onceToken, &__block_literal_global_299974);
  return (OS_dispatch_queue *)(id)sharedSubCollectionsFetchQueue_queue;
}

+ (OS_dispatch_queue)sharedKeyAssetsFetchQueue
{
  if (sharedKeyAssetsFetchQueue_onceToken != -1)
    dispatch_once(&sharedKeyAssetsFetchQueue_onceToken, &__block_literal_global_129_299972);
  return (OS_dispatch_queue *)(id)sharedKeyAssetsFetchQueue_queue;
}

+ (id)standardDataSourceManagerForCollectionList:(id)a3
{
  id v4;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v5;
  void *v6;

  v4 = a3;
  v5 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration initWithCollectionList:]([PXPhotoKitCollectionsDataSourceManagerConfiguration alloc], "initWithCollectionList:", v4);

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:", v5);
  return v6;
}

void __67__PXPhotoKitCollectionsDataSourceManager_sharedKeyAssetsFetchQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PXCollectionsDataSourceManager-subCollectionsKeyAssetsFetchQueue-shared", attr);
  v2 = (void *)sharedKeyAssetsFetchQueue_queue;
  sharedKeyAssetsFetchQueue_queue = (uint64_t)v1;

}

void __72__PXPhotoKitCollectionsDataSourceManager_sharedSubCollectionsFetchQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PXCollectionsDataSourceManager-subCollectionsFetchQueue-shared", attr);
  v2 = (void *)sharedSubCollectionsFetchQueue_queue;
  sharedSubCollectionsFetchQueue_queue = (uint64_t)v1;

}

@end
