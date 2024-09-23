@implementation PXPhotosMetadataFetcher

- (PXPhotosMetadataFetcher)initWithPhotoLibrary:(id)a3
{
  id v4;
  PXPhotosMetadataFetcher *v5;
  PXPhotosMetadataFetcher *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v10;
  NSMutableDictionary *queue_fetchResultByFetchedFact;
  NSMutableDictionary *v12;
  NSMutableDictionary *queue_OIDsByDerivedFacts;
  PXPhotosMetadataFetcher *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosMetadataFetcher;
  v5 = -[PXPhotosMetadataFetcher init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_photoLibrary, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.photos.metadata-fetcher-queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queue_fetchResultByFetchedFact = v6->_queue_fetchResultByFetchedFact;
    v6->_queue_fetchResultByFetchedFact = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queue_OIDsByDerivedFacts = v6->_queue_OIDsByDerivedFacts;
    v6->_queue_OIDsByDerivedFacts = v12;

    if (v4)
    {
      v14 = v6;
      objc_msgSend(v4, "px_changeDistributor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "registerInternalChangeObserver:", v14);

    }
  }

  return v6;
}

- (PXPhotosMetadataFetcher)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMetadataFetcher.m"), 92, CFSTR("%s is not available as initializer"), "-[PXPhotosMetadataFetcher init]");

  abort();
}

- (BOOL)getAssetCounts:(id *)a3 guestAssetCounts:(id *)a4 forFetchResult:(id)a5 allowFetch:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  NSObject *queue;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  BOOL v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  BOOL v46;
  BOOL v47;
  PXPhotosMetadataCountsCache *v48;
  void *v49;
  void *v51;
  void *v52;
  uint64_t v53;
  PXPhotosMetadataFetcher *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id object;
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD block[10];
  BOOL v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  unint64_t v88;
  unint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _BYTE v103[128];
  uint64_t v104;

  v6 = a6;
  v104 = *MEMORY[0x1E0C80C00];
  object = a5;
  v55 = self;
  objc_opt_class();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  objc_getAssociatedObject(object, &PXPhotosMetadataCountsCacheKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v10);

  if (v11)
  {
    objc_msgSend(v11, "assetCounts");
    v12 = v88;
    v57 = v90;
    v58 = (uint64_t)v89;
    objc_msgSend(v11, "guestAssetCounts");
    v13 = (unint64_t)v89;
    v56 = v88;
    v14 = 1;
    v15 = v90;
    goto LABEL_45;
  }
  v17 = *(_QWORD *)off_1E50B7ED8;
  v16 = *((_QWORD *)off_1E50B7ED8 + 1);
  v18 = *((_QWORD *)off_1E50B7ED8 + 2);
  if (v6)
  {
    v56 = *(_QWORD *)off_1E50B7ED8;
    v57 = *((_QWORD *)off_1E50B7ED8 + 2);
    v58 = *((_QWORD *)off_1E50B7ED8 + 1);
    v53 = objc_msgSend(object, "count");
    objc_msgSend(object, "fetchedObjectIDsSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(object, "count"));
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v20 = object;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v95;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v95 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
            objc_msgSend(v24, "objectID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v24, "objectID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v26);

            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
        }
        while (v21);
      }

      v11 = (void *)objc_msgSend(v19, "copy");
    }
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__91857;
    v92 = __Block_byref_object_dispose__91858;
    v93 = 0;
    v82 = 0;
    v83 = &v82;
    v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__91857;
    v86 = __Block_byref_object_dispose__91858;
    v87 = 0;
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__91857;
    v80 = __Block_byref_object_dispose__91858;
    v81 = 0;
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__91857;
    v74 = __Block_byref_object_dispose__91858;
    v75 = 0;
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__91857;
    v68 = __Block_byref_object_dispose__91858;
    v69 = 0;
    queue = v55->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__PXPhotosMetadataFetcher_getAssetCounts_guestAssetCounts_forFetchResult_allowFetch___block_invoke;
    block[3] = &unk_1E5124D38;
    block[4] = v55;
    block[5] = &v88;
    v63 = v6;
    block[6] = &v82;
    block[7] = &v76;
    block[8] = &v70;
    block[9] = &v64;
    dispatch_sync(queue, block);
    v28 = v89[5];
    if (v28 && v83[5] && v77[5] && v71[5] && v65[5])
    {
      v102[0] = v11;
      v102[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      PXSetsIntersection(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v30, "count");

      v31 = v83[5];
      v101[0] = v11;
      v101[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      PXSetsIntersection(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v33, "count");

      v12 = v53 - (v58 + v57);
      v35 = v57 == 0x7FFFFFFFFFFFFFFFLL || v58 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0x7FFFFFFFFFFFFFFFLL;
      if (v35 && v53 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v55, CFSTR("PXPhotosMetadataFetcher.m"), 140, CFSTR("Total count doesn't match individual counts: %lu != %lu"), v53, 0x7FFFFFFFFFFFFFFFLL);

      }
      v36 = v77[5];
      v100[0] = v11;
      v100[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      PXSetsIntersection(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");

      v40 = v71[5];
      v99[0] = v11;
      v99[1] = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      PXSetsIntersection(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v42, "count");

      v43 = v65[5];
      v98[0] = v11;
      v98[1] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      PXSetsIntersection(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v45, "count");

      v46 = v15 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL;
      v56 = v39 - (v13 + v15);
      v47 = v46 || v39 - (v13 + v15) == 0x7FFFFFFFFFFFFFFFLL;
      if (v47 && v39 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v55, CFSTR("PXPhotosMetadataFetcher.m"), 146, CFSTR("Guest total count doesn't match individual counts: %lu != %lu"), v39, 0x7FFFFFFFFFFFFFFFLL);

      }
      v61[0] = v53 - (v58 + v57);
      v61[1] = v58;
      v61[2] = v57;
      v60[0] = v39 - (v13 + v15);
      v60[1] = v13;
      v60[2] = v15;
      v48 = -[PXPhotosMetadataCountsCache initWithAssetCounts:guestAssetCounts:]([PXPhotosMetadataCountsCache alloc], "initWithAssetCounts:guestAssetCounts:", v61, v60);
      objc_opt_class();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v49);
      objc_setAssociatedObject(object, &PXPhotosMetadataCountsCacheKey, v48, (void *)0x301);
      objc_sync_exit(v49);

      v14 = 1;
    }
    else
    {
      v14 = 0;
      v15 = v57;
      v13 = v58;
      v12 = v56;
    }
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v76, 8);

    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(&v88, 8);

LABEL_45:
    v18 = v57;
    v16 = v58;
    v17 = v56;
    if (!a3)
      goto LABEL_47;
    goto LABEL_46;
  }
  v14 = 0;
  v13 = *((_QWORD *)off_1E50B7ED8 + 1);
  v15 = *((_QWORD *)off_1E50B7ED8 + 2);
  v12 = *(_QWORD *)off_1E50B7ED8;
  if (a3)
  {
LABEL_46:
    a3->var0 = v12;
    a3->var1 = v16;
    a3->var2 = v18;
  }
LABEL_47:
  if (a4)
  {
    a4->var0 = v17;
    a4->var1 = v13;
    a4->var2 = v15;
  }

  return v14;
}

- (id)_queue_fetchResultForFact:(unint64_t)a3 allowFetch:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *queue_fetchResultByFetchedFact;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;

  v4 = a4;
  queue_fetchResultByFetchedFact = self->_queue_fetchResultByFetchedFact;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](queue_fetchResultByFetchedFact, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    -[PXPhotosMetadataFetcher photoLibrary](self, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setIsExclusivePredicate:", 1);
    -[PXPhotosMetadataFetcher _predicateForFact:](self, "_predicateForFact:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v13);

    objc_msgSend(v12, "setInternalSortDescriptors:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_queue_fetchResultByFetchedFact;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v9, v15);

  }
  return v9;
}

- (id)_queue_oidsForFacts:(unint64_t)a3 allowFetch:(BOOL)a4
{
  NSMutableDictionary *queue_OIDsByDerivedFacts;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  int v13;
  NSMutableDictionary *v14;
  void *v15;
  _QWORD v17[2];
  void (*v18)(_QWORD *);
  void *v19;
  PXPhotosMetadataFetcher *v20;
  id v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  unsigned __int8 v28;

  queue_OIDsByDerivedFacts = self->_queue_OIDsByDerivedFacts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](queue_OIDsByDerivedFacts, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v18 = (void (*)(_QWORD *))__58__PXPhotosMetadataFetcher__queue_oidsForFacts_allowFetch___block_invoke;
    v19 = &unk_1E5124D60;
    v20 = self;
    v23 = a4;
    v11 = v10;
    v12 = 0;
    v21 = v11;
    v22 = &v24;
    v28 = 0;
    do
    {
      if (((1 << v12) & a3) != 0)
      {
        v18(v17);
        v13 = v28;
      }
      else
      {
        v13 = 0;
      }
      if (v12 > 0x3E)
        break;
      ++v12;
    }
    while (!v13);
    if (*((_BYTE *)v25 + 24))
    {
      PXSetsIntersection(v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_queue_OIDsByDerivedFacts;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v9, v15);

    }
    else
    {
      v9 = 0;
    }

    _Block_object_dispose(&v24, 8);
  }
  return v9;
}

- (id)_predicateForFact:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 4)
  {
    v3 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0CD1390], "filterPredicateForUnsavedSyndicationAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d OR %K = %d"), CFSTR("kind"), 2, CFSTR("kind"), 3);
    }
    else
    {
      if (a3 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMetadataFetcher.m"), 219, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kind"), 1, v12, v13);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)photoLibraryWillChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PXPhotosMetadataFetcher_photoLibraryWillChange___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_queue_OIDsByDerivedFacts, 0);
  objc_storeStrong((id *)&self->_queue_fetchResultByFetchedFact, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __50__PXPhotosMetadataFetcher_photoLibraryWillChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PXPhotosMetadataFetcher_photoLibraryWillChange___block_invoke_2;
  v5[3] = &unk_1E5124D88;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __50__PXPhotosMetadataFetcher_photoLibraryWillChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "changeDetailsForFetchResult:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "insertedIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
    {
      objc_msgSend(v7, "removedIndexes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "count"))
      {
        v18 = objc_msgSend(v7, "hasIncrementalChanges");

        if ((v18 & 1) != 0)
        {
LABEL_16:
          objc_msgSend(v7, "fetchResultAfterChanges");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", v17, v5);

          goto LABEL_17;
        }
LABEL_6:
        v10 = objc_msgSend(v5, "unsignedIntegerValue");
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allKeys", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
              if ((v10 & ~objc_msgSend(v16, "unsignedIntegerValue")) == 0)
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKeyedSubscript:", 0, v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v13);
        }

        goto LABEL_16;
      }

    }
    goto LABEL_6;
  }
LABEL_17:

}

void __58__PXPhotosMetadataFetcher__queue_oidsForFacts_allowFetch___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_fetchResultForFact:allowFetch:", a2, *(unsigned __int8 *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    v8 = v5;
    objc_msgSend(v5, "fetchedObjectIDsSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    v5 = v8;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }

}

void __85__PXPhotosMetadataFetcher_getAssetCounts_guestAssetCounts_forFetchResult_allowFetch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 1, *(unsigned __int8 *)(a1 + 80));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 2, *(unsigned __int8 *)(a1 + 80));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 4, *(unsigned __int8 *)(a1 + 80));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 5, *(unsigned __int8 *)(a1 + 80));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 6, *(unsigned __int8 *)(a1 + 80));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

+ (id)sharedFetcherForPhotoLibrary:(id)a3
{
  id v5;
  id v6;
  PXPhotosMetadataFetcher *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotosMetadataFetcher.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary != nil"));

  }
  v6 = a1;
  objc_sync_enter(v6);
  objc_getAssociatedObject(v5, &sharedFetcherForPhotoLibrary__sharedFetcherForPhotoLibraryKey);
  v7 = (PXPhotosMetadataFetcher *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PXPhotosMetadataFetcher initWithPhotoLibrary:]([PXPhotosMetadataFetcher alloc], "initWithPhotoLibrary:", v5);
    objc_setAssociatedObject(v5, &sharedFetcherForPhotoLibrary__sharedFetcherForPhotoLibraryKey, v7, (void *)0x301);
  }
  objc_sync_exit(v6);

  return v7;
}

@end
