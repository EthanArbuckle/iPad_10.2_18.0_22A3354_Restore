@implementation PXSearchResultsSectionedDataSource

- (PXSearchResultsSectionedDataSource)initWithSearchIndex:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  PXSearchResultsSectionedDataSource *v9;
  PXSearchResultsSectionedDataSource *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  PLSearchProcessor *searchProcessor;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PXSearchResultsSectionedDataSource;
  v9 = -[PXSearchResultsSectionedDataSource init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchIndex, a3);
    v11 = dispatch_queue_create(0, 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71AE8]), "initWithDatabase:", v10->_searchIndex);
    searchProcessor = v10->_searchProcessor;
    v10->_searchProcessor = (PLSearchProcessor *)v13;

    objc_storeStrong((id *)&v10->_photoLibrary, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel__confirmationDidFinish_, CFSTR("PXPeopleConfirmationDidFinish"), 0);

    objc_initWeak(&location, v10);
    dispatch_get_global_queue(17, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__PXSearchResultsSectionedDataSource_initWithSearchIndex_photoLibrary___block_invoke;
    v18[3] = &unk_1E5148D30;
    objc_copyWeak(&v19, &location);
    dispatch_async(v16, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)initForUnitTests
{
  PXSearchResultsSectionedDataSource *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSearchResultsSectionedDataSource;
  v2 = -[PXSearchResultsSectionedDataSource init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (int64_t)numberOfSections
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PXSearchResultsSectionedDataSource_numberOfSections__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isSectionExpandable:(int64_t)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PXSearchResultsSectionedDataSource_isSectionExpandable___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isSectionExpanded:(int64_t)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXSearchResultsSectionedDataSource_isSectionExpanded___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)expandSection:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PXSearchResultsSectionedDataSource_expandSection___block_invoke;
  v4[3] = &unk_1E5144EB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)collapseSection:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PXSearchResultsSectionedDataSource_collapseSection___block_invoke;
  v4[3] = &unk_1E5144EB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (int64_t)numberOfVisibleSearchResultsInSection:(int64_t)a3
{
  NSObject *queue;
  int64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXSearchResultsSectionedDataSource_numberOfVisibleSearchResultsInSection___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int64_t)numberOfSearchResultsInSection:(int64_t)a3
{
  NSObject *queue;
  int64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PXSearchResultsSectionedDataSource_numberOfSearchResultsInSection___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)searchResultAtIndexPath:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  PXSearchResultsSectionedDataSource *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__36112;
  v17 = __Block_byref_object_dispose__36113;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PXSearchResultsSectionedDataSource_searchResultAtIndexPath___block_invoke;
  block[3] = &unk_1E513FD98;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)allSearchResultsForSection:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36112;
  v11 = __Block_byref_object_dispose__36113;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PXSearchResultsSectionedDataSource_allSearchResultsForSection___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)isTopAssetsSection:(int64_t)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXSearchResultsSectionedDataSource_isTopAssetsSection___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)titleForHeaderInSection:(int64_t)a3 accessibilityIdentifier:(id *)a4
{
  NSObject *queue;
  id v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__36112;
  v19 = __Block_byref_object_dispose__36113;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__36112;
  v13 = __Block_byref_object_dispose__36113;
  v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PXSearchResultsSectionedDataSource_titleForHeaderInSection_accessibilityIdentifier___block_invoke;
  v8[3] = &unk_1E5140068;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  v8[7] = a3;
  dispatch_sync(queue, v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v10[5]);
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (void)setSearchString:(id)a3 representedObjects:(id)a4 maxSuggestionCount:(unint64_t)a5 priorityAssetUUID:(id)a6 libraryScope:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke;
  v19[3] = &unk_1E511B7C8;
  v19[4] = self;
  v20 = v12;
  v23 = a7;
  v24 = a5;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(queue, v19);

}

- (BOOL)resultsReady
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PXSearchResultsSectionedDataSource_resultsReady__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_shouldCancel:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PXSearchResultsSectionedDataSource__shouldCancel___block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  LOBYTE(a3) = v8[3] != a3;
  _Block_object_dispose(&v7, 8);
  return a3;
}

- (void)_inqBackgroundProcessAssetResults:(id)a3 assetResultsForCompletions:(id)a4 collectionResults:(id)a5 topAssetsResult:(id)a6 topCollectionResults:(id)a7 withTag:(unint64_t)a8 searchString:(id)a9 representedObjects:(id)a10 maxSuggestionCount:(unint64_t)a11 priorityAssetUUID:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  unint64_t queryTag;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  BOOL v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  PLPhotoLibrary *photoLibrary;
  os_signpost_id_t v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  NSObject *v46;
  _QWORD *v47;
  _QWORD *v48;
  uint8_t *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  unint64_t v53;
  SEL v54;
  os_signpost_id_t v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  uint8_t *v69;
  unint64_t v70;
  unint64_t v71;
  char v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[3];
  BOOL v78;
  _QWORD v79[5];
  id v80;
  _QWORD v81[4];
  _QWORD v82[5];
  id v83;
  uint8_t buf[8];
  uint8_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  _QWORD v90[3];
  BOOL v91;
  _QWORD v92[3];
  char v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v40 = a4;
  v41 = a5;
  v42 = a6;
  v43 = a7;
  v19 = a9;
  v20 = a10;
  v21 = a12;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x2020000000;
  v93 = 0;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x2020000000;
  queryTag = self->_queryTag;
  v91 = queryTag != a8;
  if (queryTag == a8)
  {
    objc_msgSend((id)objc_opt_class(), "postQuerySearchResultsLog");
    v23 = objc_claimAutoreleasedReturnValue();
    v38 = v21;
    v24 = os_signpost_id_generate(v23);
    v25 = v23;
    v26 = v25;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "SearchResults-PostQuery", ", buf, 2u);
    }
    v37 = v24;

    *(_QWORD *)buf = 0;
    v85 = buf;
    v86 = 0x3032000000;
    v87 = __Block_byref_object_copy__36112;
    v88 = __Block_byref_object_dispose__36113;
    v89 = 0;
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x3032000000;
    v82[3] = __Block_byref_object_copy__36112;
    v82[4] = __Block_byref_object_dispose__36113;
    v83 = 0;
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x2020000000;
    v81[3] = 0;
    v79[0] = 0;
    v79[1] = v79;
    v79[2] = 0x3032000000;
    v79[3] = __Block_byref_object_copy__36112;
    v79[4] = __Block_byref_object_dispose__36113;
    v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x2020000000;
    v78 = 0;
    if ((unint64_t)objc_msgSend(v20, "count") <= 1)
    {
      if (objc_msgSend(v20, "count"))
        v27 = objc_msgSend(v19, "length") != 0;
      else
        v27 = 0;
    }
    else
    {
      v27 = 1;
    }
    v78 = v27;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v28 = v20;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v74;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v74 != v30)
            objc_enumerationMutation(v28);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "userCategory") == 5)
          {
            LOBYTE(v29) = 1;
            goto LABEL_20;
          }
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
        if (v29)
          continue;
        break;
      }
    }
LABEL_20:

    photoLibrary = self->_photoLibrary;
    ++self->_unprocessedSearchResultsCount;
    v32 = v18;
    v33 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke;
    v56[3] = &unk_1E511B840;
    v56[4] = self;
    v70 = a8;
    v63 = v90;
    v64 = v81;
    v35 = v32;
    v57 = v32;
    v65 = v79;
    v66 = v77;
    v58 = v40;
    v59 = v41;
    v60 = v43;
    v67 = v92;
    v72 = v29;
    v61 = v42;
    v62 = v38;
    v71 = a11;
    v68 = v82;
    v69 = buf;
    v44[0] = v33;
    v44[1] = 3221225472;
    v44[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_2_201;
    v44[3] = &unk_1E511B888;
    v44[4] = self;
    v47 = v90;
    v48 = v82;
    v53 = a8;
    v54 = a2;
    v49 = buf;
    v50 = v81;
    v45 = v19;
    v51 = v79;
    v52 = v92;
    v34 = v26;
    v46 = v34;
    v55 = v37;
    -[PLPhotoLibrary performBlock:completionHandler:](photoLibrary, "performBlock:completionHandler:", v56, v44);

    v18 = v35;
    _Block_object_dispose(v77, 8);
    _Block_object_dispose(v79, 8);

    _Block_object_dispose(v81, 8);
    _Block_object_dispose(v82, 8);

    _Block_object_dispose(buf, 8);
    v21 = v38;
  }
  _Block_object_dispose(v90, 8);
  _Block_object_dispose(v92, 8);

}

- (id)_fetchObjectsWithEntityName:(id)a3 uuids:(id)a4
{
  PLPhotoLibrary *photoLibrary;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  photoLibrary = self->_photoLibrary;
  v6 = a4;
  v7 = a3;
  -[PLPhotoLibrary managedObjectContext](photoLibrary, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPropertiesToFetch:", &unk_1E53E8A30);
  objc_msgSend(v9, "setIncludesPendingChanges:", 0);
  objc_msgSend(v9, "setPredicate:", v10);
  v13 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v9, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_asyncFetchAssetsWithQueryTag:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke;
  v6[3] = &unk_1E5144EB8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (BOOL)hasPendingChanges
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PXSearchResultsSectionedDataSource_hasPendingChanges__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)mergePendingChanges
{
  NSObject *queue;
  void *v5;
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionedDataSource.m"), 721, CFSTR("expect main thread"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXSearchResultsSectionedDataSource_mergePendingChanges__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_inqCancel
{
  PSIQuery *query;
  NSArray *uncommittedSuggestions;
  NSArray *uncommittedResults;
  PHFetchResult *homePersons;

  ++self->_queryTag;
  self->_unprocessedSearchResultsCount = 0;
  -[PSIQuery cancel](self->_query, "cancel");
  query = self->_query;
  self->_query = 0;

  uncommittedSuggestions = self->_uncommittedSuggestions;
  self->_uncommittedSuggestions = 0;

  uncommittedResults = self->_uncommittedResults;
  self->_uncommittedResults = 0;

  self->_uncommittedMaxGroupedResultsCount = 0;
  homePersons = self->_homePersons;
  self->_homePersons = 0;

  self->_sectionFetchIndex = 0;
  atomic_store(0, (unsigned __int8 *)&self->_didMerge);
  self->_ignorePastResults = 1;
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PXSearchResultsSectionedDataSource_cancel__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setResults:(id)a3
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
  block[2] = __49__PXSearchResultsSectionedDataSource_setResults___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (BOOL)searchIsFinished:(id)a3
{
  NSObject *queue;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PXSearchResultsSectionedDataSource_searchIsFinished___block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (PLSearchIndexDateFormatter)dateFormatter
{
  PLSearchIndexDateFormatter *dateFormatter;
  PLSearchIndexDateFormatter *v4;
  PLSearchIndexDateFormatter *v5;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (PLSearchIndexDateFormatter *)objc_alloc_init(MEMORY[0x1E0D71AD0]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  NSDateIntervalFormatter *dateIntervalFormatter;
  NSDateIntervalFormatter *v4;
  NSDateIntervalFormatter *v5;

  dateIntervalFormatter = self->_dateIntervalFormatter;
  if (!dateIntervalFormatter)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    v5 = self->_dateIntervalFormatter;
    self->_dateIntervalFormatter = v4;

    -[NSDateIntervalFormatter setDateStyle:](self->_dateIntervalFormatter, "setDateStyle:", 2);
    -[NSDateIntervalFormatter setTimeStyle:](self->_dateIntervalFormatter, "setTimeStyle:", 0);
    dateIntervalFormatter = self->_dateIntervalFormatter;
  }
  return dateIntervalFormatter;
}

- (id)stringWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  NSCalendar *v8;
  NSCalendar *calendar;
  NSDateComponents *dateRangeFormattingComponents;
  NSDateComponents *v11;
  NSDateComponents *v12;
  void *v13;
  NSCalendar *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (!self->_calendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    calendar = self->_calendar;
    self->_calendar = v8;

  }
  dateRangeFormattingComponents = self->_dateRangeFormattingComponents;
  if (!dateRangeFormattingComponents)
  {
    v11 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E0C99D78]);
    v12 = self->_dateRangeFormattingComponents;
    self->_dateRangeFormattingComponents = v11;

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateComponents setTimeZone:](self->_dateRangeFormattingComponents, "setTimeZone:", v13);

    -[NSDateComponents setHour:](self->_dateRangeFormattingComponents, "setHour:", 12);
    dateRangeFormattingComponents = self->_dateRangeFormattingComponents;
  }
  v14 = self->_calendar;
  -[PXSearchResultsSectionedDataSource dateIntervalFormatter](self, "dateIntervalFormatter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchResultsDataUtility stringWithStartDate:endDate:calendar:dateComponents:dateIntervalFormatter:](PXSearchResultsDataUtility, "stringWithStartDate:endDate:calendar:dateComponents:dateIntervalFormatter:", v6, v7, v14, dateRangeFormattingComponents, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)didChangeThumbnailAssetsForSearchResult:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionedDataSource.m"), 814, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionedDataSource.m"), 815, CFSTR("%s expected main thread"), "-[PXSearchResultsSectionedDataSource didChangeThumbnailAssetsForSearchResult:]");

  }
  v6 = (void *)-[NSArray mutableCopy](self->_results, "mutableCopy");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_results;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v12, "sectionType") == 1)
        {
          objc_msgSend(v5, "topAssetsFetchResult");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          v13 = v15 != 0;
          objc_msgSend(v6, "removeObject:", v12);
          if (v15)
          {
            +[PXSearchResultsSectionedDataSource topAssetsSectionForSearchResultsValue:](PXSearchResultsSectionedDataSource, "topAssetsSectionForSearchResultsValue:", v5);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "insertObject:atIndex:", v16, 0);

          }
          v17 = (void *)objc_msgSend(v6, "copy");
          -[PXSearchResultsSectionedDataSource setResults:](self, "setResults:", v17);

          goto LABEL_17;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_17:

  -[PXSearchResultsSectionedDataSource changeObserver](self, "changeObserver");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "searchResultsDataSource:didChangeThumbnailAssetsForSearchResult:topAssetsSectionExists:", self, v5, v13);

}

- (void)didChangeThumbnailAssetsForSearchResult:(id)a3 atIndexes:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PXSearchResultsSectionedDataSource changeObserver](self, "changeObserver");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchResultsDataSource:didChangeThumbnailAssetsForSearchResult:atIndexes:", self, v7, v6);

}

- (NSArray)suggestions
{
  NSObject *queue;
  NSArray *v4;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__36112;
  v7[4] = __Block_byref_object_dispose__36113;
  v8 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PXSearchResultsSectionedDataSource_suggestions__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = v7;
  dispatch_sync(queue, v6);
  v4 = self->_suggestions;
  _Block_object_dispose(v7, 8);

  return v4;
}

- (id)wordEmbeddingSubstitutions
{
  return -[PXSearchResultsSectionedDataSource _wordEmbeddingSubstitutionsWantsSubstitutedString:](self, "_wordEmbeddingSubstitutionsWantsSubstitutedString:", 0);
}

- (id)selectedWordEmbeddingTextAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[PXSearchResultsSectionedDataSource _wordEmbeddingSubstitutionsWantsSubstitutedString:](self, "_wordEmbeddingSubstitutionsWantsSubstitutedString:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_wordEmbeddingSubstitutionsWantsSubstitutedString:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSDictionary *sceneAncestryInformation;
  void *v7;
  void *v8;

  v3 = a3;
  -[PSIQuery searchText](self->_query, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sceneAncestryInformation = self->_sceneAncestryInformation;
  -[PSIQuery substitutions](self->_query, "substitutions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchResultsDataUtility wordEmbeddingSubstitutionsForSearchText:wantsSubstitutedString:sceneAncestoryInformation:substitutions:](PXSearchResultsDataUtility, "wordEmbeddingSubstitutionsForSearchText:wantsSubstitutedString:sceneAncestoryInformation:substitutions:", v5, v3, sceneAncestryInformation, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tapToRadarAttachments
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-Summary"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsSectionedDataSource debugDictionary](self, "debugDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXFeedbackTapToRadarUtilitiesWriteDictionaryToPlistFile(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (NSDictionary)debugDictionary
{
  void *v3;
  NSObject *queue;
  id v5;
  NSDictionary *v6;
  _QWORD v8[4];
  id v9;
  PXSearchResultsSectionedDataSource *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PXSearchResultsSectionedDataSource_debugDictionary__block_invoke;
  v8[3] = &unk_1E5148D08;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(queue, v8);
  v6 = (NSDictionary *)v5;

  return v6;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[PXSearchResultsSectionedDataSource debugDictionary](self, "debugDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_confirmationDidFinish:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[NSArray count](self->_results, "count"))
  {
    objc_msgSend(v5, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionedDataSource.m"), 942, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("notification.object"), v21, v23);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSectionedDataSource.m"), 942, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("notification.object"), v21);
    }

LABEL_4:
    objc_msgSend(v6, "sourcePerson");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetPerson");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "otherPersons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_pl_map:", &__block_literal_global_280);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "verifiedType"))
    {
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v8;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "The notification for bootstrap / confirmation flow provided an invalid target person: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "librarySpecificFetchOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "uuid");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        PXAssertGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v7;
          _os_log_error_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "The notification for bootstrap / confirmation flow provided an invalid source person: %@", buf, 0xCu);
        }

        goto LABEL_10;
      }
      v15 = (void *)v14;
      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v14, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v17;
    }
    -[PXSearchResultsSectionedDataSource _updateResultsWithMergeTargetPerson:sourcePerson:tombstonedCandidatesLocalIdentifiers:](self, "_updateResultsWithMergeTargetPerson:sourcePerson:tombstonedCandidatesLocalIdentifiers:", v8, v7, v10);
LABEL_10:

  }
}

- (void)_updateResultsWithMergeTargetPerson:(id)a3 sourcePerson:(id)a4 tombstonedCandidatesLocalIdentifiers:(id)a5
{
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  id WeakRetained;
  NSArray *v35;
  PXSearchResultsSectionedDataSource *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v40 = a4;
  v38 = a5;
  v8 = self->_results;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = v8;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (!v10)
    goto LABEL_30;
  v11 = v10;
  v12 = *(_QWORD *)v47;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v47 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      if (objc_msgSend(v14, "sectionType") == 2)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v14, "searchResults");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v16)
        {
          v17 = v16;
          v36 = self;
          v37 = v14;
          v35 = v9;
          v39 = 0;
          v18 = 0;
          v19 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v43 != v19)
                objc_enumerationMutation(v15);
              v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              objc_msgSend(v21, "person");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "localIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "localIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v23, "isEqualToString:", v24);

              if (v25)
              {
                v26 = v21;

                v18 = v26;
              }
              else
              {
                objc_msgSend(v22, "localIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "localIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v27, "isEqualToString:", v28);

                if (v29)
                {
                  v30 = v21;

                  v39 = v30;
                }
                else
                {
                  objc_msgSend(v22, "localIdentifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v38, "containsObject:", v31);

                  if (v32)
                    objc_msgSend(v37, "removeSearchResult:", v21);
                }
              }

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v17);

          self = v36;
          if (v18)
          {
            v9 = v35;
            v33 = v39;
            if (v39)
              objc_msgSend(v37, "removeSearchResult:", v39);
            goto LABEL_29;
          }
          v9 = v35;
          v33 = v39;
        }
        else
        {

          v33 = 0;
        }
        objc_msgSend(v33, "_setPerson:", v41);
        objc_msgSend(v33, "_setApproximateCount:", objc_msgSend(v41, "numberOfAssets"));
        v18 = 0;
LABEL_29:
        WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
        objc_msgSend(WeakRetained, "searchResultsDataSourceHasPendingChanges:shouldMergePendingChanges:", self, 0);

        goto LABEL_30;
      }
    }
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v11)
      continue;
    break;
  }
LABEL_30:

}

- (PXSearchResultsSectionedDataSourceChangeObserver)changeObserver
{
  return (PXSearchResultsSectionedDataSourceChangeObserver *)objc_loadWeakRetained((id *)&self->_changeObserver);
}

- (void)setChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_changeObserver, a3);
}

- (void)setResultsReady:(BOOL)a3
{
  self->_resultsReady = a3;
}

- (id)topAssetFilter
{
  return self->_topAssetFilter;
}

- (void)setTopAssetFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (BOOL)ignorePastResults
{
  return self->_ignorePastResults;
}

- (void)setIgnorePastResults:(BOOL)a3
{
  self->_ignorePastResults = a3;
}

- (NSArray)results
{
  return self->_results;
}

- (NSArray)uncommittedResults
{
  return self->_uncommittedResults;
}

- (void)setUncommittedResults:(id)a3
{
  objc_storeStrong((id *)&self->_uncommittedResults, a3);
}

- (unint64_t)sectionFetchIndex
{
  return self->_sectionFetchIndex;
}

- (void)setSectionFetchIndex:(unint64_t)a3
{
  self->_sectionFetchIndex = a3;
}

- (unint64_t)maxGroupedResultsCount
{
  return self->_maxGroupedResultsCount;
}

- (void)setMaxGroupedResultsCount:(unint64_t)a3
{
  self->_maxGroupedResultsCount = a3;
}

- (unint64_t)queryTag
{
  return self->_queryTag;
}

- (void)setQueryTag:(unint64_t)a3
{
  self->_queryTag = a3;
}

- (unint64_t)uncommittedMaxGroupedResultsCount
{
  return self->_uncommittedMaxGroupedResultsCount;
}

- (void)setUncommittedMaxGroupedResultsCount:(unint64_t)a3
{
  self->_uncommittedMaxGroupedResultsCount = a3;
}

- (unint64_t)unprocessedSearchResultsCount
{
  return self->_unprocessedSearchResultsCount;
}

- (void)setUnprocessedSearchResultsCount:(unint64_t)a3
{
  self->_unprocessedSearchResultsCount = a3;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void)setDateIntervalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateIntervalFormatter, a3);
}

- (PLSearchProcessor)searchProcessor
{
  return self->_searchProcessor;
}

- (void)setSearchProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_searchProcessor, a3);
}

- (PSIDatabase)searchIndex
{
  return self->_searchIndex;
}

- (void)setSearchIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchIndex, a3);
}

- (PSIQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)didMerge
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_didMerge);
  return v2 & 1;
}

- (void)setDidMerge:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_didMerge);
}

- (PHFetchResult)homePersons
{
  return self->_homePersons;
}

- (void)setHomePersons:(id)a3
{
  objc_storeStrong((id *)&self->_homePersons, a3);
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (NSArray)uncommittedSuggestions
{
  return self->_uncommittedSuggestions;
}

- (void)setUncommittedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_uncommittedSuggestions, a3);
}

- (NSDictionary)sceneAncestryInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSceneAncestryInformation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (NSDateComponents)dateRangeFormattingComponents
{
  return self->_dateRangeFormattingComponents;
}

- (void)setDateRangeFormattingComponents:(id)a3
{
  objc_storeStrong((id *)&self->_dateRangeFormattingComponents, a3);
}

- (BOOL)wordEmbeddingsRequested
{
  return self->_wordEmbeddingsRequested;
}

- (void)setWordEmbeddingsRequested:(BOOL)a3
{
  self->_wordEmbeddingsRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRangeFormattingComponents, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_sceneAncestryInformation, 0);
  objc_storeStrong((id *)&self->_uncommittedSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_homePersons, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_searchProcessor, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_uncommittedResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong(&self->_topAssetFilter, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

uint64_t __61__PXSearchResultsSectionedDataSource__confirmationDidFinish___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void __53__PXSearchResultsSectionedDataSource_debugDictionary__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%p"), v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("self"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 40) + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "debugDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("searchResults"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("sectionFetchIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("maxGroupedResultCount"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, CFSTR("homePersonsFetchResult"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "fetchedObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKey:", CFSTR("description"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, CFSTR("homePersons"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, CFSTR("query"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "substitutions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchResultsDataUtility sortedWordEmbeddingsForCurrentQueryFromSubstitutions:](PXSearchResultsDataUtility, "sortedWordEmbeddingsForCurrentQueryFromSubstitutions:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, CFSTR("wordEmbeddings"));
  v21 = *(id *)(*(_QWORD *)(a1 + 40) + 160);
  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v21, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v22, CFSTR("suggestions"));

  }
}

void __49__PXSearchResultsSectionedDataSource_suggestions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
}

uint64_t __55__PXSearchResultsSectionedDataSource_searchIsFinished___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v2 + 88))
  {
    v3 = 0;
  }
  else
  {
    result = objc_msgSend(*(id *)(v2 + 48), "count");
    v3 = result == 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = v3;
  return result;
}

void __49__PXSearchResultsSectionedDataSource_setResults___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __44__PXSearchResultsSectionedDataSource_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqCancel");
}

void __57__PXSearchResultsSectionedDataSource_mergePendingChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(*(_QWORD *)(a1 + 32) + 168));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 168);
  *(_QWORD *)(v2 + 168) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10));
}

uint64_t __55__PXSearchResultsSectionedDataSource_hasPendingChanges__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[10];
  _QWORD v32[4];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _QWORD v43[3];
  char v44;

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__36112;
  v37 = __Block_byref_object_dispose__36113;
  v38 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 144);
  block[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_2;
  block[3] = &unk_1E511B8B0;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[4] = v2;
  block[5] = v43;
  block[6] = &v39;
  block[7] = v32;
  block[8] = &v33;
  block[9] = v3;
  dispatch_sync(v4, block);
  if (*((_BYTE *)v40 + 24))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)v34[5];
    v28[0] = v5;
    v28[1] = 3221225472;
    v28[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_3;
    v28[3] = &unk_1E511B8D8;
    v9 = v6;
    v29 = v9;
    v10 = v7;
    v30 = v10;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v28);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchAssetsWithLocalIdentifiers:options:", v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_4;
    v26[3] = &unk_1E51478D8;
    v15 = v11;
    v27 = v15;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v26);
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_5;
    v19[3] = &unk_1E51393A0;
    v20 = v15;
    v21 = v10;
    v16 = *(_QWORD *)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = &v33;
    v24 = v32;
    v25 = v16;
    v17 = v10;
    v18 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v43, 8);
}

void __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_2(_QWORD *a1)
{
  unsigned __int8 v2;
  BOOL v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 72) != a1[9];
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v2 = atomic_load((unsigned __int8 *)(a1[4] + 10));
    v3 = (v2 & 1) == 0;
    v4 = 40;
    if (v3)
      v4 = 48;
    v5 = *(id *)(a1[4] + v4);
    v6 = *(_QWORD *)(a1[4] + 56);
    v11 = v5;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v6 < objc_msgSend(v5, "count");
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 56);
      objc_msgSend(v11, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchResults");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[8] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      ++*(_QWORD *)(a1[4] + 56);
    }

  }
}

void __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "itemType") != 2)
  {
    objc_msgSend(v5, "assetLocalIdentifiersForPreview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!v13)
            v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

uint64_t __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];
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
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(a1 + 32);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(obj);
        v24 = v2;
        v3 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v2);
        v4 = *(void **)(a1 + 40);
        objc_msgSend(v3, "localIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v27 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "unsignedIntegerValue"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (void *)MEMORY[0x1E0CD1390];
              objc_msgSend(v3, "localIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "uuidFromLocalIdentifier:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "_setAsset:forUUID:", v3, v15);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v9);
        }

        v2 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v23);
  }

  v16 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 10));
  if ((v16 & 1) != 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 160), "count"))
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_6;
    v25[3] = &unk_1E511B900;
    v19 = *(_QWORD *)(a1 + 64);
    v25[4] = v17;
    v25[5] = v19;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v25);
  }
  return objc_msgSend(*(id *)(a1 + 48), "_asyncFetchAssetsWithQueryTag:", *(_QWORD *)(a1 + 72));
}

void __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id WeakRetained;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB36B0];
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = a2;
  objc_msgSend(v5, "indexPathForRow:inSection:", a3, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "searchResultsDataSource:didFetchAssetsForSearchResult:indexPath:", *(_QWORD *)(a1 + 32), v7, v9);

}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __objc2_class **v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  PXSearchResultsSection *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  PXSearchResultsSection *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  int v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  os_signpost_id_t v56;
  NSObject *v57;
  NSObject *v58;
  PXSearchTopAssetsResult *v59;
  void *v60;
  PXSearchTopAssetsResult *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  __int128 v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id obj;
  int v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  id v87;
  void (**v88)(void *, id, void *);
  _QWORD v89[5];
  id v90;
  id v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD aBlock[5];
  id v104;
  id v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD block[5];
  __int128 v112;
  uint64_t v113;
  uint8_t buf[4];
  uint64_t v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v1 = a1;
  v119 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 144);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_2;
  block[3] = &unk_1E5140068;
  v4 = *(_QWORD *)(v1 + 144);
  block[4] = v2;
  v113 = v4;
  v112 = *(_OWORD *)(v1 + 88);
  dispatch_sync(v3, block);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 24))
  {
    v79 = (void *)objc_opt_new();
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v5 = *(id *)(v1 + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
    if (v6)
    {
      v7 = v6;
      LOBYTE(v8) = 0;
      v9 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v108 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
          if ((v8 & 1) != 0)
            v8 = 1;
          else
            v8 = objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i), "isImplicitlyTokenized");
          if (objc_msgSend(v11, "isSinglePersonOrPetResult"))
          {
            objc_msgSend(v11, "lookupIdentifiers");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "addObject:", v13);

          }
          if ((objc_msgSend(v11, "categoryMask") & 0x1C000000000) != 0)
          {
            v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 104) + 8) + 40);
            objc_msgSend(v11, "assetUUIDs");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObjectsFromArray:", v15);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
      }
      while (v7);

      if (v8)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 24) = 1;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v79, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_3;
    aBlock[3] = &unk_1E511B7F0;
    aBlock[4] = *(_QWORD *)(v1 + 32);
    v75 = v18;
    v104 = v75;
    v19 = v17;
    v20 = *(_QWORD *)(v1 + 96);
    v74 = v19;
    v105 = v19;
    v106 = v20;
    v88 = (void (**)(void *, id, void *))_Block_copy(aBlock);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 120), "searchResultSectionsForQuery:withAssetResults:assetResultsForCompletions:collectionResults:combineAssetSections:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 136), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 24));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 120), "updatedSearchSections:withTopCollectionResults:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    obj = v21;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v100;
      v25 = off_1E50B4000;
      v77 = *(_QWORD *)v100;
      do
      {
        v26 = 0;
        v78 = v23;
        do
        {
          if (*(_QWORD *)v100 != v24)
            objc_enumerationMutation(obj);
          v84 = v26;
          v27 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v26);
          v28 = objc_msgSend(v27, "categoryMask");
          objc_msgSend(v27, "searchResults");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[__objc2_class sectionIsHighlightsSection:](v25[283], "sectionIsHighlightsSection:", v27);
          if (v28 != 0x2000000000)
          {
            v30 = v29;
            v31 = +[PXSearchResultsSection sectionTypeForCategoryMask:isMomentSection:isTopAssetSection:](PXSearchResultsSection, "sectionTypeForCategoryMask:isMomentSection:isTopAssetSection:", v28, v29, 0);
            if (v31)
            {
              v32 = v31;
              v81 = v30;
              v83 = v28;
              -[__objc2_class sectionTitleFromSearchResultSection:shouldCombineAssetsSections:](v25[283], "sectionTitleFromSearchResultSection:shouldCombineAssetsSections:", v27, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 24));
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = -[PXSearchResultsSection initWithTitle:withSectionType:]([PXSearchResultsSection alloc], "initWithTitle:withSectionType:", v82, v32);
              v95 = 0u;
              v96 = 0u;
              v97 = 0u;
              v98 = 0u;
              v87 = v85;
              v34 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
              if (!v34)
                goto LABEL_44;
              v35 = v34;
              v36 = *(_QWORD *)v96;
              while (1)
              {
                v37 = 0;
                v86 = v35;
                do
                {
                  if (*(_QWORD *)v96 != v36)
                    objc_enumerationMutation(v87);
                  v38 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v37);
                  v39 = objc_msgSend(v38, "type");
                  if (v39 == 2)
                  {
                    v41 = v33;
                    v42 = v1;
                    v43 = v38;
                    objc_msgSend(v43, "sortDate");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v88[2](v88, v43, v44);
                    v40 = objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v43, "subtitle");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v45)
                    {
                      objc_msgSend(v43, "startDate");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "endDate");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject setStartDate:endDate:](v40, "setStartDate:endDate:", v46, v47);

                    }
                    v48 = objc_msgSend(v43, "collectionType");
                    objc_msgSend(v43, "uuid");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "title");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject _setCollectionType:uuid:title:subtitle:](v40, "_setCollectionType:uuid:title:subtitle:", v48, v49, v50, v45);

                    v1 = v42;
                    v33 = v41;
                    v35 = v86;
                    if (v40)
                    {
LABEL_38:
                      -[PXSearchResultsSection addSearchResult:](v33, "addSearchResult:", v40);
                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 24) = 1;
LABEL_41:

                    }
                  }
                  else
                  {
                    if (v39 != 1)
                    {
                      PLUIGetLog();
                      v40 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                      {
                        v51 = objc_msgSend(v38, "type");
                        *(_DWORD *)buf = 134217984;
                        v115 = v51;
                        _os_log_impl(&dword_1A6789000, v40, OS_LOG_TYPE_ERROR, "Search result has unsupported type: %ld", buf, 0xCu);
                      }
                      goto LABEL_41;
                    }
                    v88[2](v88, v38, 0);
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (v40)
                      goto LABEL_38;
                  }
                  ++v37;
                }
                while (v35 != v37);
                v35 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
                if (!v35)
                {
LABEL_44:

                  v52 = v81;
                  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 24))
                    v52 = 1;
                  if (v83 == 256)
                    v52 = 1;
                  if (v83 == 4096)
                    v52 = 1;
                  if (v83 == 0x10000000000000 || v83 == 128)
                  {
                    if (*(_BYTE *)(v1 + 160))
                      LOBYTE(v52) = 0;
                    v24 = v77;
                    v23 = v78;
                    v25 = off_1E50B4000;
                    if ((v52 & 1) == 0)
                    {
LABEL_59:

                      break;
                    }
                  }
                  else
                  {
                    v24 = v77;
                    v23 = v78;
                    v25 = off_1E50B4000;
                    if (!v52)
                      goto LABEL_59;
                  }
                  -[PXSearchResultsSection searchResults](v33, "searchResults");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = objc_msgSend(v53, "count");

                  if (v54)
                    objc_msgSend(v76, "addObject:", v33);
                  goto LABEL_59;
                }
              }
            }
          }

          v26 = v84 + 1;
        }
        while (v84 + 1 != v23);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
      }
      while (v23);
    }

    if (objc_msgSend(*(id *)(v1 + 72), "assetCount"))
    {
      objc_msgSend((id)objc_opt_class(), "postQuerySearchResultsLog");
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = os_signpost_id_generate(v55);
      v57 = v55;
      v58 = v57;
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "SearchResults-TopAssets", ", buf, 2u);
      }

      v59 = [PXSearchTopAssetsResult alloc];
      objc_msgSend(*(id *)(v1 + 72), "assetUUIDs");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[PXSearchTopAssetsResult initWithAssetUUIDs:priorityAssetUUID:](v59, "initWithAssetUUIDs:priorityAssetUUID:", v60, *(_QWORD *)(v1 + 80));

      -[PXSearchTopAssetsResult topAssetsFetchResult](v61, "topAssetsFetchResult");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v62, "count"))
      {
        -[PXSearchTopAssetsResult setDelegate:](v61, "setDelegate:", *(_QWORD *)(v1 + 32));
        objc_msgSend(*(id *)(v1 + 32), "topAssetFilter");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSearchTopAssetsResult setTopAssetFilter:](v61, "setTopAssetFilter:", v63);

        +[PXSearchResultsSectionedDataSource topAssetsSectionForSearchResultsValue:](PXSearchResultsSectionedDataSource, "topAssetsSectionForSearchResultsValue:", v61);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "addObject:", v64);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 24) = 1;

      }
      v65 = v58;
      v66 = v65;
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v66, OS_SIGNPOST_INTERVAL_END, v56, "SearchResults-TopAssets", ", buf, 2u);
      }

    }
    v67 = *(_QWORD *)(v1 + 32);
    v68 = *(NSObject **)(v67 + 144);
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_197;
    v89[3] = &unk_1E511B818;
    v69 = *(_QWORD *)(v1 + 88);
    v89[4] = v67;
    v90 = v76;
    v91 = v73;
    v92 = v69;
    v70 = *(_OWORD *)(v1 + 144);
    v93 = *(_OWORD *)(v1 + 128);
    v94 = v70;
    v71 = v73;
    v72 = v76;
    dispatch_sync(v68, v89);

  }
}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_2_201(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 144);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_3_202;
  v8[3] = &unk_1E511B888;
  v8[4] = v2;
  v5 = *(_QWORD *)(a1 + 112);
  v14 = *(_QWORD *)(a1 + 104);
  v15 = v5;
  v11 = *(_OWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 72);
  v9 = v3;
  v13 = *(_OWORD *)(a1 + 88);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 120);
  v10 = v6;
  v16 = v7;
  dispatch_async(v4, v8);

}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_3_202(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PXSearchQueryMatchInfo *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[8];
  _QWORD block[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(a1 + 104) != *(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                  + 72);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(v2 + 88);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 32), CFSTR("PXSearchResultsSectionedDataSource.m"), 570, CFSTR("expect bumped counter"));

      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(v2 + 88);
    }
    *(_QWORD *)(v2 + 88) = v3 - 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v33 = v4;
    objc_msgSend(v4, "queryTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v12, "userCategory") == 14 || !objc_msgSend(v12, "userCategory"))
          {
            objc_msgSend(v12, "text");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

          }
          objc_msgSend(v12, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v15)
          {
            objc_msgSend(v12, "text");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v9);
    }

    objc_msgSend(v33, "personIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v18 = objc_claimAutoreleasedReturnValue();

    +[PXSearchDisplayUtility localizedListStringFromSearchTokenNames:searchText:includeQuotationDelimitersForSearchText:](PXSearchDisplayUtility, "localizedListStringFromSearchTokenNames:searchText:includeQuotationDelimitersForSearchText:", v6, *(_QWORD *)(a1 + 40), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = [PXSearchQueryMatchInfo alloc];
    objc_msgSend(v33, "sceneIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "audioIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "humanActionIdentifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PXSearchQueryMatchInfo initWithLocalizedQueryString:matchedSceneIdentifiers:personLocalIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrTexts:ocrAssetUUIDS:queryEmbedding:countOfQueryTerms:](v20, "initWithLocalizedQueryString:matchedSceneIdentifiers:personLocalIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrTexts:ocrAssetUUIDS:queryEmbedding:countOfQueryTerms:", v19, v21, v22, v23, v24, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), 0, 0);
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(v26 + 32);
    *(_QWORD *)(v26 + 32) = v25;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)
      || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setResultsReady:", 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_5;
      block[3] = &unk_1E5149198;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "_asyncFetchAssetsWithQueryTag:", *(_QWORD *)(a1 + 104));

  }
  v28 = *(id *)(a1 + 48);
  v29 = v28;
  v30 = *(_QWORD *)(a1 + 120);
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v29, OS_SIGNPOST_INTERVAL_END, v30, "SearchResults-PostQuery", ", buf, 2u);
  }

}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "searchResultsDataSourceHasPendingChanges:shouldMergePendingChanges:", *(_QWORD *)(a1 + 32), 1);

}

uint64_t __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", a2);
}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 72) != a1[7];
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v2 = a1[4];
    if (!*(_QWORD *)(v2 + 168) && !*(_QWORD *)(v2 + 48) && !*(_BYTE *)(v2 + 9))
    {
      objc_storeStrong((id *)(v2 + 168), *(id *)(v2 + 160));
      objc_storeStrong((id *)(a1[4] + 48), *(id *)(a1[4] + 40));
      *(_QWORD *)(a1[4] + 80) = *(_QWORD *)(a1[4] + 64);
      v2 = a1[4];
    }
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(v2 + 80);
  }
}

PXSearchResultsValue *__231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  PXSearchResultsValue *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  PXSearchResultsValue *v26;
  unint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "assetCount");
  v8 = objc_alloc_init(PXSearchResultsValue);
  -[PXSearchResultsValue setDelegate:](v8, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[PXSearchResultsValue _setSearchResult:](v8, "_setSearchResult:", v5);
  -[PXSearchResultsValue _setApproximateCount:](v8, "_setApproximateCount:", v7);
  -[PXSearchResultsValue _setDate:](v8, "_setDate:", v6);
  if (objc_msgSend(v5, "isSinglePersonOrPetResult"))
  {
    v28 = v7;
    v30 = v6;
    objc_msgSend(v5, "lookupIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = a1;
    v11 = *(id *)(a1 + 40);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v16, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v10);

          if (v18)
          {
            -[PXSearchResultsValue _setPerson:](v8, "_setPerson:", v16);
            goto LABEL_12;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_12:

    -[PXSearchResultsValue person](v8, "person");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = v29;
    v6 = v30;
    v7 = v28;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v10, *(_QWORD *)(v29 + 48));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        v26 = 0;
        goto LABEL_23;
      }
      -[PXSearchResultsValue _setPerson:](v8, "_setPerson:", v21);

    }
  }
  objc_msgSend(v5, "keyAssetUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
    PLUIGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v5;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "keyAssetUUID is nil for searchResult: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v10, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsValue _setAssetUUIDs:](v8, "_setAssetUUIDs:", v23);

  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v25 = *(_QWORD *)(v24 + 24);
  if (v25 <= v7)
    v25 = v7;
  *(_QWORD *)(v24 + 24) = v25;
  v26 = v8;
LABEL_23:

  return v26;
}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_197(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 72) != a1[10];
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sectionType"), 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)a1[5];
    v15[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingDescriptors:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1[4] + 136), "searchText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v8 = a1[4];
    if (v7)
    {
      objc_msgSend(*(id *)(v8 + 120), "completionSuggestionsForQuery:withSearchSections:numberOfSuggestions:", *(_QWORD *)(v8 + 136), a1[6], a1[11]);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(*(id *)(v8 + 136), "numberOfNextKeywordSuggestionToProcess"))
      {
LABEL_7:
        v12 = *(_QWORD *)(a1[9] + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v5;
        v14 = v5;

        *(_QWORD *)(a1[4] + 56) = 0;
        return;
      }
      objc_msgSend(*(id *)(a1[4] + 136), "nextKeywordSuggestions");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = *(_QWORD *)(a1[8] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    goto LABEL_7;
  }
}

uint64_t __52__PXSearchResultsSectionedDataSource__shouldCancel___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

uint64_t __50__PXSearchResultsSectionedDataSource_resultsReady__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  qos_class_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend(*(id *)(a1 + 32), "_inqCancel");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[9];
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 == 2)
    v5 = 2;
  else
    v5 = v4 == 1;
  objc_msgSend(v2, "searchIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "newQueryWithSearchText:queryTokens:useWildcardSearchText:libraryScope:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, v5);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 136);
  *(_QWORD *)(v8 + 136) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setWordEmbeddingMode:", 258);
  if (!objc_msgSend(*(id *)(a1 + 40), "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setNumberOfNextKeywordSuggestionToProcess:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setResultsReady:", 0);
  v10 = qos_class_self();
  dispatch_get_global_queue(v10, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_2;
  v15[3] = &unk_1E511B7C8;
  v12 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v19 = v3;
  v16 = v12;
  v13 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 72);
  v17 = v13;
  v20 = v14;
  v18 = *(id *)(a1 + 56);
  dispatch_async(v11, v15);

}

void __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 120);
  v5 = *(_QWORD *)(v2 + 136);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_3;
  v9[3] = &unk_1E511B7A0;
  v6 = *(_QWORD *)(a1 + 64);
  v9[4] = v2;
  v13 = v6;
  v10 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 72);
  v11 = v7;
  v14 = v8;
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v4, "performQuery:withResultsHandler:", v5, v9);

}

void __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_4;
  block[3] = &unk_1E511B778;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v18 = *(NSObject **)(v16 + 144);
  block[1] = 3221225472;
  block[4] = v16;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v35 = *(_QWORD *)(a1 + 64);
  v32 = v17;
  v19 = *(id *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 72);
  v33 = v19;
  v36 = v20;
  v34 = *(id *)(a1 + 56);
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  v25 = v11;
  dispatch_async(v18, block);

}

void __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_inqBackgroundProcessAssetResults:assetResultsForCompletions:collectionResults:topAssetsResult:topCollectionResults:withTag:searchString:representedObjects:maxSuggestionCount:priorityAssetUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "substitutions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "wordEmbeddingsRequested");

    if ((v4 & 1) == 0)
    {
      v5 = *(void **)(a1 + 32);
      v6 = 1;
LABEL_11:
      objc_msgSend(v5, "setWordEmbeddingsRequested:", v6);
      return;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "substitutions");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") || !objc_msgSend(*(id *)(a1 + 40), "count") && !objc_msgSend(*(id *)(a1 + 56), "count"))
  {

    return;
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "wordEmbeddingsRequested");

  if (v8)
  {
    v5 = *(void **)(a1 + 32);
    v6 = 0;
    goto LABEL_11;
  }
}

void __86__PXSearchResultsSectionedDataSource_titleForHeaderInSection_accessibilityIdentifier___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  id v8;

  v2 = a1[7];
  if (v2 < objc_msgSend(*(id *)(a1[4] + 40), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", a1[7]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = objc_msgSend(v8, "sectionType");
    if ((unint64_t)(v6 - 1) > 0x14)
      v7 = 0;
    else
      v7 = off_1E511B960[v6 - 1];
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);

  }
}

void __57__PXSearchResultsSectionedDataSource_isTopAssetsSection___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a1[6];
  if (v2 < objc_msgSend(*(id *)(a1[4] + 40), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", a1[6]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchResults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v4, "itemType") == 2;
  }
}

void __65__PXSearchResultsSectionedDataSource_allSearchResultsForSection___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = a1[6];
  if (v2 < objc_msgSend(*(id *)(a1[4] + 40), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", a1[6]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchResults");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __62__PXSearchResultsSectionedDataSource_searchResultAtIndexPath___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "section");
  if (v2 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectAtIndexedSubscript:", v2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(*(id *)(a1 + 32), "row");
    if (v3 < objc_msgSend(v8, "visibleCount"))
    {
      objc_msgSend(v8, "searchResults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "row"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
}

void __69__PXSearchResultsSectionedDataSource_numberOfSearchResultsInSection___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  id v3;

  v2 = a1[6];
  if (v2 < objc_msgSend(*(id *)(a1[4] + 40), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", a1[6]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "totalCount");

  }
}

void __76__PXSearchResultsSectionedDataSource_numberOfVisibleSearchResultsInSection___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  id v3;

  v2 = a1[6];
  if (v2 < objc_msgSend(*(id *)(a1[4] + 40), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", a1[6]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "visibleCount");

  }
}

void __54__PXSearchResultsSectionedDataSource_collapseSection___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExpanded:", 0);

  }
}

void __52__PXSearchResultsSectionedDataSource_expandSection___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExpanded:", 1);

  }
}

void __56__PXSearchResultsSectionedDataSource_isSectionExpanded___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  id v3;

  v2 = a1[6];
  if (v2 < objc_msgSend(*(id *)(a1[4] + 40), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", a1[6]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "isExpanded");

  }
}

void __58__PXSearchResultsSectionedDataSource_isSectionExpandable___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  id v3;

  v2 = a1[6];
  if (v2 < objc_msgSend(*(id *)(a1[4] + 40), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", a1[6]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "isExpandable");

  }
}

uint64_t __54__PXSearchResultsSectionedDataSource_numberOfSections__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __71__PXSearchResultsSectionedDataSource_initWithSearchIndex_photoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = 0;
    +[PXSearchTaxonomyUtility localizedSceneAncestryInformationWithError:](PXSearchTaxonomyUtility, "localizedSceneAncestryInformationWithError:", &v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4;
    if (v2)
    {
      objc_msgSend(WeakRetained, "setSceneAncestryInformation:", v2);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not get scene ancestry information, error %@", buf, 0xCu);
    }

  }
}

+ (id)topAssetsSectionForSearchResultsValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PXSearchResultsSection *v7;
  uint64_t v9;

  v3 = a3;
  PXLocalizedStringFromTable(CFSTR("SEARCH_RESULT_SECTION_HEADER_PHOTOS_TITLE"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "count");
  PXLocalizedStringWithValidatedFormat(v4, CFSTR("%lu"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXSearchResultsSection initWithTitle:withSectionType:]([PXSearchResultsSection alloc], "initWithTitle:withSectionType:", v6, +[PXSearchResultsSection sectionTypeForCategoryMask:isMomentSection:isTopAssetSection:](PXSearchResultsSection, "sectionTypeForCategoryMask:isMomentSection:isTopAssetSection:", 0x8000000, 0, 1, v9));
  -[PXSearchResultsSection addSearchResult:](v7, "addSearchResult:", v3);

  return v7;
}

+ (id)postQuerySearchResultsLog
{
  if (postQuerySearchResultsLog_onceToken != -1)
    dispatch_once(&postQuerySearchResultsLog_onceToken, &__block_literal_global_244);
  return (id)postQuerySearchResultsLog_postQuerySearchResultsLog;
}

void __63__PXSearchResultsSectionedDataSource_postQuerySearchResultsLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui.search", "SearchResults-PostQuery");
  v1 = (void *)postQuerySearchResultsLog_postQuerySearchResultsLog;
  postQuerySearchResultsLog_postQuerySearchResultsLog = (uint64_t)v0;

}

@end
