@implementation PXMemoriesFeedDataSourceManager

- (PXMemoriesFeedDataSourceManager)initWithPhotoLibrary:(id)a3
{
  PXMemoriesFeedDataSourceManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *privateWorkQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMemoriesFeedDataSourceManager;
  v3 = -[PXMemoriesFeedDataSourceManagerBase initWithPhotoLibrary:](&v7, sel_initWithPhotoLibrary_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.PXMemoriesFeedDataSourceManager", 0);
    privateWorkQueue = v3->_privateWorkQueue;
    v3->_privateWorkQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)startGeneratingMemories
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXMemoriesFeedDataSourceManager;
  -[PXMemoriesFeedDataSourceManagerBase startGeneratingMemories](&v6, sel_startGeneratingMemories);
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsAnyItems");

  if ((v4 & 1) == 0)
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoriesFeedDataSourceManager generateAdditionalEntriesWithOldDataSource:startingIndex:sync:](self, "generateAdditionalEntriesWithOldDataSource:startingIndex:sync:", v5, 0, 1);

  }
}

- (void)generateAdditionalEntriesWithOldDataSource:(id)a3 startingIndex:(unint64_t)a4 sync:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  NSObject *privateWorkQueue;
  _QWORD block[4];
  id v12;
  id v13[2];
  id buf[2];

  v5 = a5;
  v8 = a3;
  if (-[PXMemoriesFeedDataSourceManager _isGeneratingAdditionalEntries](self, "_isGeneratingAdditionalEntries"))
  {
    PLMemoriesGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring update request while update is already in progress", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    -[PXMemoriesFeedDataSourceManager _setGeneratingAdditionalEntries:](self, "_setGeneratingAdditionalEntries:", 1);
    if (v5)
    {
      -[PXMemoriesFeedDataSourceManager _generateAdditionalEntriesWithOldDataSource:startingIndex:sync:](self, "_generateAdditionalEntriesWithOldDataSource:startingIndex:sync:", v8, a4, 1);
    }
    else
    {
      objc_initWeak(buf, self);
      privateWorkQueue = self->_privateWorkQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __97__PXMemoriesFeedDataSourceManager_generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke;
      block[3] = &unk_1E513FF48;
      objc_copyWeak(v13, buf);
      v12 = v8;
      v13[1] = (id)a4;
      dispatch_async(privateWorkQueue, block);

      objc_destroyWeak(v13);
      objc_destroyWeak(buf);
    }
  }

}

- (void)generateAdditionalEntriesIfPossible
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;

  v3 = -[PXMemoriesFeedDataSourceManagerBase firstUngroupedMemoryIndex](self, "firstUngroupedMemoryIndex");
  -[PXMemoriesFeedDataSourceManagerBase memoriesFetchResult](self, "memoriesFetchResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "count");
  if (v4 && v3 < v4)
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoriesFeedDataSourceManager generateAdditionalEntriesWithOldDataSource:startingIndex:sync:](self, "generateAdditionalEntriesWithOldDataSource:startingIndex:sync:", v5, v3, 0);

  }
}

- (void)reloadMemories:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PXMemoriesFeedDataSourceManager startGeneratingMemories](self, "startGeneratingMemories");
  +[PXSectionedDataSource emptyDataSource](PXMemoriesFeedDataSource, "emptyDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesFeedDataSourceManager generateAdditionalEntriesWithOldDataSource:startingIndex:sync:](self, "generateAdditionalEntriesWithOldDataSource:startingIndex:sync:", v5, 0, v3);

}

- (void)_generateAdditionalEntriesWithOldDataSource:(id)a3 startingIndex:(unint64_t)a4 sync:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PXMemoriesFeedDataSource *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  _QWORD block[4];
  PXMemoriesFeedDataSource *v29;
  id v30;
  id v31[2];
  id location;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;

  v5 = a5;
  v8 = a3;
  v37 = 0x7FFFFFFFFFFFFFFFLL;
  +[PXMemoriesFeedSettings sharedInstance](PXMemoriesFeedSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "groupsPerBatch");

  -[PXMemoriesFeedDataSourceManagerBase memoriesFetchResult](self, "memoriesFetchResult");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "generateEntriesFromMemories:startingFromIndex:maximumNumberOfEntries:finalMemoryIndex:", v27, a4, v10, &v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = MEMORY[0x1E0C809B0];
  if (!v12)
  {
    v26 = (void *)a4;
    v16 = (PXMemoriesFeedDataSource *)v8;
    v24 = 0;
    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__PXMemoriesFeedDataSourceManager__generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke_2;
    block[3] = &unk_1E513A518;
    objc_copyWeak(v31, &location);
    v29 = v16;
    v30 = v24;
    v31[1] = v26;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
    goto LABEL_6;
  }
  v26 = (void *)(v37 + 1);
  objc_msgSend(v8, "entries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXMemoriesFeedDataSource initWithEntries:]([PXMemoriesFeedDataSource alloc], "initWithEntries:", v15);
  v17 = objc_msgSend(v14, "count");
  v18 = objc_msgSend(v11, "count");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v17, v18);
  v25 = v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, v19, 0, 0, 0);
  v33[0] = v13;
  v33[1] = 3221225472;
  v33[2] = __98__PXMemoriesFeedDataSourceManager__generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke;
  v33[3] = &unk_1E5148740;
  v34 = v14;
  v35 = v15;
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = v36;
  v22 = v15;
  v23 = v14;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v33);
  v24 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A18), "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v8, "identifier"), -[PXMemoriesFeedDataSource identifier](v16, "identifier"), v20, v21, 0);

  if (!v25)
    goto LABEL_5;
LABEL_3:
  -[PXMemoriesFeedDataSourceManager _handleFinishedGeneratingAdditionalEntriesWithNewDataSource:changeDetails:firstUngroupedMemoryIndex:](self, "_handleFinishedGeneratingAdditionalEntriesWithNewDataSource:changeDetails:firstUngroupedMemoryIndex:", v16, v24, v26);
LABEL_6:

}

- (void)_handleFinishedGeneratingAdditionalEntriesWithNewDataSource:(id)a3 changeDetails:(id)a4 firstUngroupedMemoryIndex:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  -[PXMemoriesFeedDataSourceManagerBase setFirstUngroupedMemoryIndex:](self, "setFirstUngroupedMemoryIndex:", a5);
  -[PXMemoriesFeedDataSourceManager _setGeneratingAdditionalEntries:](self, "_setGeneratingAdditionalEntries:", 0);
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v9, v8);

}

- (void)handleIncrementalFetchResultChange:(id)a3 updatedFetchResultsForMemoriesWithChangedKeyAssets:(id)a4
{
  id v7;
  id v8;
  NSObject *privateWorkQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  privateWorkQueue = self->_privateWorkQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke;
  v12[3] = &unk_1E5146098;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(privateWorkQueue, v12);

}

- (void)handleNonIncrementalFetchResultChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "fetchResultAfterChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesFeedDataSourceManagerBase memoriesFetchResult](self, "memoriesFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    PLMemoriesGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "Handling non-incremental memories feed update", v8, 2u);
    }

    -[PXMemoriesFeedDataSourceManagerBase setMemoriesFetchResult:](self, "setMemoriesFetchResult:", v4);
    +[PXSectionedDataSource emptyDataSource](PXMemoriesFeedDataSource, "emptyDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoriesFeedDataSourceManager generateAdditionalEntriesWithOldDataSource:startingIndex:sync:](self, "generateAdditionalEntriesWithOldDataSource:startingIndex:sync:", v7, 0, 0);

  }
}

- (void)handleChangedKeyAssetsForMemories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  PXMemoriesFeedDataSource *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v4 = a3;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entries");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v19, "mutableCopy");
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__PXMemoriesFeedDataSourceManager_handleChangedKeyAssetsForMemories___block_invoke;
  v22[3] = &unk_1E511C790;
  v22[4] = self;
  v23 = v6;
  v24 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v22);

  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __69__PXMemoriesFeedDataSourceManager_handleChangedKeyAssetsForMemories___block_invoke_2;
  v20[3] = &unk_1E5148950;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v21;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v20);
  v12 = -[PXMemoriesFeedDataSource initWithEntries:]([PXMemoriesFeedDataSource alloc], "initWithEntries:", v10);
  v13 = objc_alloc((Class)off_1E50B4A18);
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "identifier");
  v16 = -[PXMemoriesFeedDataSource identifier](v12, "identifier");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v13, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v15, v16, v17, v11, 0);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v12, v18);
}

- (unint64_t)_indexOfEntryForMemory:(id)a3 inSortedEntries:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD v14[5];
  id v15;
  SEL v16;

  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v9, "count");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PXMemoriesFeedDataSourceManager__indexOfEntryForMemory_inSortedEntries_options___block_invoke_2;
  v14[3] = &unk_1E511C7F8;
  v15 = &__block_literal_global_41621;
  v16 = a2;
  v14[4] = self;
  v12 = objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, v11, a5, v14);

  return v12;
}

- (unint64_t)_indexOfEntry:(id)a3 inSortedEntries:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  unint64_t v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(v7, "count"), a5, &__block_literal_global_181);

  return v9;
}

- (id)objectReferenceForMemory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v4 = a3;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXMemoriesFeedDataSourceManager _indexOfEntryForMemory:inSortedEntries:options:](self, "_indexOfEntryForMemory:inSortedEntries:options:", v4, v6, 256);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfMemory:", v4);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      v12 = v11;
      v14[0] = objc_msgSend(v5, "identifier");
      v14[1] = v9;
      v14[2] = v12;
      v14[3] = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v5, "objectReferenceAtIndexPath:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

- (BOOL)_isGeneratingAdditionalEntries
{
  return self->__generatingAdditionalEntries;
}

- (void)_setGeneratingAdditionalEntries:(BOOL)a3
{
  self->__generatingAdditionalEntries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
}

uint64_t __73__PXMemoriesFeedDataSourceManager__indexOfEntry_inSortedEntries_options___block_invoke(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

uint64_t __82__PXMemoriesFeedDataSourceManager__indexOfEntryForMemory_inSortedEntries_options___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v5, "compare:", v6);
LABEL_6:
      v8 = v7;
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (*(uint64_t (**)(void))(a1[5] + 16))();
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PXMemoriesFeedDataSourceManager.m"), 527, CFSTR("Unexpected class for comparison"));

    abort();
  }
  v8 = -(*(uint64_t (**)(void))(a1[5] + 16))();
LABEL_9:

  return v8;
}

uint64_t __82__PXMemoriesFeedDataSourceManager__indexOfEntryForMemory_inSortedEntries_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToDate:", v6))
  {

LABEL_4:
    v9 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToDate:", v7);

  if ((v8 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v4, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earlierDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v5)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v4, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "laterDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v5)
      v9 = -1;
    else
      v9 = 0;
  }
LABEL_5:

  return v9;
}

void __69__PXMemoriesFeedDataSourceManager_handleChangedKeyAssetsForMemories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "_indexOfEntryForMemory:inSortedEntries:options:", v20, *(_QWORD *)(a1 + 40), 256);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfMemory:", v20);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9;
      objc_msgSend(v8, "memories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "memoryInfoWithUpdatedKeyAssetFetchResult:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "entryByReplacingMemoryInfoAtIndex:withMemoryInfo:", v10, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", v7, v14);
      v15 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        v18 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

      }
      objc_msgSend(v17, "addIndex:", v10);

    }
  }

}

void __69__PXMemoriesFeedDataSourceManager_handleChangedKeyAssetsForMemories___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  v7 = (id)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  PXMemoriesFeedDataSource *v59;
  PXMemoriesFeedDataSource *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  PXMemoriesFeedDataSource *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  uint64_t v75;
  id v76;
  id v77;
  id obj;
  id v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  _QWORD v84[5];
  PXMemoriesFeedDataSource *v85;
  id v86;
  _QWORD *v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[6];
  _QWORD v96[5];
  id v97;
  id v98;
  uint64_t *v99;
  uint64_t *v100;
  _QWORD v101[5];
  id v102;
  uint64_t *v103;
  uint64_t v104;
  _QWORD v105[5];
  id v106;
  id v107;
  id v108;
  uint64_t *v109;
  uint8_t *v110;
  uint64_t v111;
  _QWORD v112[5];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[5];
  id v118;
  id v119;
  __int128 *v120;
  uint64_t *v121;
  uint64_t *v122;
  uint64_t *v123;
  uint8_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint8_t buf[8];
  uint8_t *v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD block[5];
  id v132;
  uint64_t *v133;
  _QWORD *v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t (*v147)(uint64_t, uint64_t);
  void (*v148)(uint64_t);
  id v149;
  _QWORD v150[4];
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t (*v154)(uint64_t, uint64_t);
  void (*v155)(uint64_t);
  id v156;
  uint8_t v157[128];
  uint8_t v158[4];
  uint64_t v159;
  uint8_t v160[128];
  __int128 v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v151 = 0;
  v152 = &v151;
  v153 = 0x3032000000;
  v154 = __Block_byref_object_copy__41641;
  v155 = __Block_byref_object_dispose__41642;
  v156 = 0;
  v150[0] = 0;
  v150[1] = v150;
  v150[2] = 0x2020000000;
  v150[3] = 0;
  v144 = 0;
  v145 = &v144;
  v146 = 0x3032000000;
  v147 = __Block_byref_object_copy__41641;
  v148 = __Block_byref_object_dispose__41642;
  v149 = 0;
  v138 = 0;
  v139 = &v138;
  v140 = 0x3032000000;
  v141 = __Block_byref_object_copy__41641;
  v142 = __Block_byref_object_dispose__41642;
  v143 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_138;
  block[3] = &unk_1E511C630;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v133 = &v151;
  v3 = v2;
  v75 = a1;
  v137 = *(_QWORD *)(a1 + 56);
  v132 = v3;
  v134 = v150;
  v135 = &v144;
  v136 = &v138;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  PLMemoriesGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "Handling incremental update to memories feed data", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v128 = buf;
  v129 = 0x2020000000;
  v130 = 0;
  v5 = objc_msgSend((id)v145[5], "count");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
    v6 = 0;
  v130 = v6;
  objc_msgSend((id)v152[5], "removedObjects");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  PLMemoriesGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v71, "count");
    LODWORD(v161) = 134217984;
    *(_QWORD *)((char *)&v161 + 4) = v10;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Removing %lu memories from the feed.", (uint8_t *)&v161, 0xCu);
  }

  v11 = objc_msgSend(*(id *)(a1 + 32), "firstUngroupedMemoryIndex");
  *(_QWORD *)&v161 = 0;
  *((_QWORD *)&v161 + 1) = &v161;
  v162 = 0x2020000000;
  v163 = 0;
  objc_msgSend((id)v152[5], "removedIndexes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_140;
  v117[3] = &unk_1E511C658;
  v13 = *(_QWORD *)(a1 + 32);
  v120 = &v161;
  v117[4] = v13;
  v121 = &v151;
  v122 = &v144;
  v14 = *(_QWORD *)(a1 + 56);
  v125 = v11;
  v126 = v14;
  v15 = v7;
  v118 = v15;
  v123 = &v138;
  v124 = buf;
  v83 = v8;
  v119 = v83;
  objc_msgSend(v12, "enumerateIndexesUsingBlock:", v117);
  v70 = v11;

  v69 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 24);
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v160, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v114 != v19)
          objc_enumerationMutation(obj);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * i), "unsignedIntegerValue");
        v112[0] = MEMORY[0x1E0C809B0];
        v112[1] = 3221225472;
        v112[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_149;
        v112[3] = &__block_descriptor_40_e12_B24__0Q8_B16l;
        v112[4] = v21;
        objc_msgSend(v83, "indexesPassingTest:", v112);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");
        v24 = v21 - v23;
        if (v21 >= v23)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, v27);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v28);

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v160, 16);
    }
    while (v18);
  }

  objc_msgSend((id)v139[5], "removeObjectsAtIndexes:", v83);
  objc_msgSend((id)v152[5], "insertedObjects");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PLMemoriesGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_msgSend(v74, "count");
    *(_DWORD *)v158 = 134217984;
    v159 = v31;
    _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEFAULT, "Inserting %lu memories into the feed.", v158, 0xCu);
  }

  v32 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_151;
  v105[3] = &unk_1E511C6C8;
  v33 = *(_QWORD *)(v75 + 32);
  v109 = &v138;
  v105[4] = v33;
  v72 = v32;
  v106 = v72;
  v34 = v29;
  v111 = *(_QWORD *)(v75 + 56);
  v73 = v34;
  v107 = v34;
  v110 = buf;
  v81 = v15;
  v108 = v81;
  objc_msgSend(v74, "enumerateObjectsWithOptions:usingBlock:", 2, v105);
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v101[0] = MEMORY[0x1E0C809B0];
  v101[1] = 3221225472;
  v101[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_165;
  v101[3] = &unk_1E511C6F0;
  v101[4] = *(_QWORD *)(v75 + 32);
  v36 = *(_QWORD *)(v75 + 56);
  v103 = &v138;
  v104 = v36;
  v80 = v35;
  v102 = v80;
  objc_msgSend(v73, "enumerateKeysAndObjectsUsingBlock:", v101);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend((id)v152[5], "changedIndexes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_3;
  v96[3] = &unk_1E511C718;
  v40 = *(_QWORD *)(v75 + 32);
  v99 = &v151;
  v96[4] = v40;
  v100 = &v138;
  v79 = v37;
  v97 = v79;
  v76 = v38;
  v98 = v76;
  objc_msgSend(v39, "enumerateIndexesUsingBlock:", v96);

  v41 = *(void **)(v75 + 48);
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_4;
  v95[3] = &unk_1E511C740;
  v95[4] = *(_QWORD *)(v75 + 32);
  v95[5] = &v138;
  objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v95);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "allKeys");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObjectsFromArray:", v42);

  objc_msgSend(v80, "allKeys");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObjectsFromArray:", v43);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "allKeys");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObjectsFromArray:", v45);

  objc_msgSend(v44, "unionSet:", v82);
  if (*((_QWORD *)v128 + 3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v46);

  }
  v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v94 = 0u;
  v92 = 0u;
  v93 = 0u;
  v91 = 0u;
  v77 = v44;
  v48 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v157, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v92 != v49)
          objc_enumerationMutation(v77);
        v51 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
        v52 = objc_alloc((Class)off_1E50B1608);
        objc_msgSend(v81, "objectForKeyedSubscript:", v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectForKeyedSubscript:", v51);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "objectForKeyedSubscript:", v51);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)objc_msgSend(v52, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v53, v54, 0, 0, v55);

        objc_msgSend(v47, "setObject:forKeyedSubscript:", v56, v51);
        if (objc_msgSend(v82, "containsObject:", v51))
          objc_msgSend(v76, "addIndex:", objc_msgSend(v51, "unsignedIntegerValue"));

      }
      v48 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v157, 16);
    }
    while (v48);
  }

  v57 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v83, v72, 0, 0, v76);
  v58 = objc_msgSend(v74, "count");
  v59 = [PXMemoriesFeedDataSource alloc];
  v60 = -[PXMemoriesFeedDataSource initWithEntries:](v59, "initWithEntries:", v139[5]);
  v61 = objc_alloc((Class)off_1E50B4A18);
  objc_msgSend(*(id *)(v75 + 32), "dataSource");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v61, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v62, "identifier"), -[PXMemoriesFeedDataSource identifier](v60, "identifier"), v57, v47, 0);

  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_5;
  v84[3] = &unk_1E511C768;
  v64 = *(_QWORD *)(v75 + 32);
  v65 = *(_QWORD *)(v75 + 56);
  v88 = &v151;
  v89 = v65;
  v90 = v70 - v69 + v58;
  v84[4] = v64;
  v85 = v60;
  v86 = v63;
  v87 = v150;
  v66 = v63;
  v67 = v60;
  v68 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v84);

  _Block_object_dispose(&v161, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v138, 8);
  _Block_object_dispose(&v144, 8);

  _Block_object_dispose(v150, 8);
  _Block_object_dispose(&v151, 8);

}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_138(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "memoriesFetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "changeDetailsForFetchResult:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v6)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v22 = 136315650;
      v23 = "-[PXMemoriesFeedDataSourceManager handleIncrementalFetchResultChange:updatedFetchResultsForMemoriesWithChang"
            "edKeyAssets:]_block_invoke";
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v2;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "memories incremental update: failed to create change details %s, change: %@, current memoriesFetchResult: %@", (uint8_t *)&v22, 0x20u);
    }

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(v6, "fetchResultAfterChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v22 = 136315906;
      v23 = "-[PXMemoriesFeedDataSourceManager handleIncrementalFetchResultChange:updatedFetchResultsForMemoriesWithChang"
            "edKeyAssets:]_block_invoke";
      v24 = 2112;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      v28 = 2112;
      v29 = v2;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "memories incremental update: nil fetchResultAfterChanges in change details %s, change: %@, changeDetails: %@, current memoriesFetchResult: %@", (uint8_t *)&v22, 0x2Au);
    }

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 168) + 1;
  *(_QWORD *)(v10 + 168) = v11;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entries");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "mutableCopy");
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_140(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 96) > a2)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "fetchResultBeforeChanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(*(id *)(a1 + 32), "_indexOfEntryForMemory:inSortedEntries:options:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 256);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32), CFSTR("PXMemoriesFeedDataSourceManager.m"), 207, CFSTR("Unable to find entry for removed memory"));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfMemory:", v5);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v12 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

    }
    objc_msgSend(v11, "addIndex:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "objectAtIndex:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLMemoriesGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v26 = 138412802;
      v27 = (unint64_t)v5;
      v28 = 2048;
      v29 = v6;
      v30 = 2048;
      v31 = v8;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "Removing memory %@ from feed with memory index path [%lu, %lu]", (uint8_t *)&v26, 0x20u);
    }

    objc_msgSend(v14, "memories");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 != 1)
    {
      objc_msgSend(v14, "entryByRemovingMemory:", v5);
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "replaceObjectAtIndex:withObject:", v6, v24);
      v14 = (void *)v24;
      goto LABEL_18;
    }
    PLMemoriesGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v26 = 134217984;
      v27 = v6;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEBUG, "Only remaining memory removed from entry %lu. Removing entry.", (uint8_t *)&v26, 0xCu);
    }

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v20 = *(_QWORD *)(v19 + 24);
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6 != v20)
    {
      if (v20 == 0x7FFFFFFFFFFFFFFFLL || v6 >= v20)
        goto LABEL_16;
      v21 = v20 - 1;
    }
    *(_QWORD *)(v19 + 24) = v21;
LABEL_16:
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", v6);
    v22 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, v23);

LABEL_18:
  }
}

BOOL __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_149(uint64_t a1, unint64_t a2)
{
  return *(_QWORD *)(a1 + 32) > a2;
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_151(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  PXMemoryEntryInfo *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  _BYTE v47[128];
  uint64_t v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLMemoriesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v3;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "Seeking destination feed entry for memory: %@", buf, 0xCu);
  }

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_152;
  v45[3] = &unk_1E511C6A0;
  v45[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v46 = v7;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v45);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[PXMemoryInfo memoryInfoWithMemory:](PXMemoryInfo, "memoryInfoWithMemory:", v3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = [PXMemoryEntryInfo alloc];
    v39 = (void *)v9;
    v48 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXMemoryEntryInfo initWithSortedMemories:](v10, "initWithSortedMemories:", v11);

    v13 = objc_msgSend(*(id *)(a1 + 32), "_indexOfEntry:inSortedEntries:options:", v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 1024);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("PXMemoriesFeedDataSourceManager.m"), 310, CFSTR("Unable to find insertion index for new entry"));

    }
    v40 = v7;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v15 = *(_QWORD *)(v14 + 24);
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v13 <= v15)
        ++v15;
      *(_QWORD *)(v14 + 24) = v15;
    }
    v38 = (void *)v12;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "insertObject:atIndex:", v12, v13);
    objc_msgSend(*(id *)(a1 + 40), "shiftIndexesStartingAtIndex:by:", v13, 1);
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", v13);
    objc_msgSend(*(id *)(a1 + 56), "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
    v17 = objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v37 = v17;
    -[NSObject reverseObjectEnumerator](v17, "reverseObjectEnumerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v42 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v24 = objc_msgSend(v23, "integerValue");
          if (v24 >= v13)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24 + 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("PXMemoriesFeedDataSourceManager.m"), 325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("removedMemoryIndexesBySection[adjustedSectionNumber] == nil"));

            }
            objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v27, v25);

            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", 0, v23);
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v20);
    }

    v7 = v40;
    v30 = v38;
    v29 = v39;
    v31 = v37;
  }
  else
  {
    v32 = v8;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectAtIndexedSubscript:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "entryByAddingMemory:", v3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v32) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = v33;
        objc_msgSend(v33, "setByAddingObject:", v3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", 0, v29);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v35, v30);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "replaceObjectAtIndex:withObject:", v32, v30);
    PLMemoriesGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v3;
      v51 = 2048;
      v52 = v32;
      _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_DEBUG, "Inserted memory %@ is grouped with entry %lu. Inserting there.", buf, 0x16u);
    }
  }

}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v15 = a2;
  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "_indexOfEntry:inSortedEntries:options:", v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 256);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXMemoriesFeedDataSourceManager.m"), 339, CFSTR("Unable to find inserted entry"));

  }
  objc_msgSend(v15, "memories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_2;
  v16[3] = &unk_1E5124F80;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "count");
  if (v10 != objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXMemoriesFeedDataSourceManager.m"), 346, CFSTR("Count of inserted memories (%lu) doesn't match with count of inserted indexes (%lu)"), objc_msgSend(v8, "count"), objc_msgSend(v9, "count"));

  }
  v11 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v12);

}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fetchResultAfterChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 32), "_indexOfEntryForMemory:inSortedEntries:options:", v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 256);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfMemory:", v17);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      +[PXMemoryInfo memoryInfoWithMemory:](PXMemoryInfo, "memoryInfoWithMemory:", v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "entryByReplacingMemoryInfoAtIndex:withMemoryInfo:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "replaceObjectAtIndex:withObject:", v6, v11);
      v12 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        v15 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

      }
      objc_msgSend(v14, "addIndex:", v9);
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", v6);

    }
  }

}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7 = a3;
  v8 = a2;
  v9 = objc_msgSend(v5, "_indexOfEntryForMemory:inSortedEntries:options:", v8, v6, 256);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndex:", v9);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v15, "indexOfMemory:", v8);

  objc_msgSend(v15, "memories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "memoryInfoWithUpdatedKeyAssetFetchResult:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "entryByReplacingMemoryInfoAtIndex:withMemoryInfo:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "replaceObjectAtIndex:withObject:", v9, v14);

}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_5(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "fetchResultAfterChanges");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      PXAssertGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v6 = 136315394;
        v7 = "-[PXMemoriesFeedDataSourceManager handleIncrementalFetchResultChange:updatedFetchResultsForMemoriesWithChan"
             "gedKeyAssets:]_block_invoke_5";
        v8 = 2112;
        v9 = v5;
        _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "memories incremental update: nil fetchResultAfterChanges in fetchResultChangeDetails, %s, change details: %@", (uint8_t *)&v6, 0x16u);
      }

    }
    v4 = (id)objc_msgSend(v2, "firstObject");
    objc_msgSend(*(id *)(a1 + 32), "setMemoriesFetchResult:", v2);
    objc_msgSend(*(id *)(a1 + 32), "setFirstUngroupedMemoryIndex:", *(_QWORD *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 32), "setDataSource:changeDetails:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);

  return v4;
}

uint64_t __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_152(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "shouldGroupTogetherMemoriesWithCreationDate:andCreationDate:", v5, v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_opt_class();
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "shouldGroupTogetherMemoriesWithCreationDate:andCreationDate:", v9, v10);

  }
  return v7;
}

void __98__PXMemoriesFeedDataSourceManager__generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count") + a3;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB36B8];
  objc_msgSend(v11, "memories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, v7, 0, 0, 0);
  v9 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

}

void __98__PXMemoriesFeedDataSourceManager__generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleFinishedGeneratingAdditionalEntriesWithNewDataSource:changeDetails:firstUngroupedMemoryIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

void __97__PXMemoriesFeedDataSourceManager_generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_generateAdditionalEntriesWithOldDataSource:startingIndex:sync:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0);

}

@end
