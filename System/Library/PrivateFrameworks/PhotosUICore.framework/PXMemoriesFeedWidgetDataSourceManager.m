@implementation PXMemoriesFeedWidgetDataSourceManager

- (unint64_t)_extendedMaxCount
{
  return -[PXMemoriesFeedWidgetDataSourceManager maxCount](self, "maxCount") + 2;
}

- (id)fetchOptions
{
  void *v3;
  id v4;
  void (**v5)(void *, void *);
  void *v6;
  int v7;
  void *v8;
  id v9;
  _QWORD aBlock[4];
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXMemoriesFeedWidgetDataSourceManager;
  -[PXMemoriesFeedDataSourceManagerBase fetchOptions](&v13, sel_fetchOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PXMemoriesFeedWidgetDataSourceManager_fetchOptions__block_invoke;
  aBlock[3] = &unk_1E51419B0;
  v4 = v3;
  v12 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (-[PXMemoriesFeedWidgetDataSourceManager maxCount](self, "maxCount"))
    objc_msgSend(v4, "setFetchLimit:", -[PXMemoriesFeedWidgetDataSourceManager _extendedMaxCount](self, "_extendedMaxCount"));
  objc_msgSend(v4, "setIncludePendingMemories:", 1);
  objc_msgSend(v4, "setFetchLimit:", 5);
  if (PFOSVariantHasInternalUI())
  {
    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "showLocalMemories");

    if (v7)
      objc_msgSend(v4, "setIncludeLocalMemories:", 1);
  }
  if (-[PXMemoriesFeedWidgetDataSourceManager onlyFavorites](self, "onlyFavorites"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("favorite == true"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v8);

  }
  v9 = v4;

  return v9;
}

- (void)startGeneratingMemories
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMemoriesFeedWidgetDataSourceManager;
  -[PXMemoriesFeedDataSourceManagerBase startGeneratingMemories](&v3, sel_startGeneratingMemories);
  -[PXMemoriesFeedWidgetDataSourceManager _regenerateMemoriesWithChange:](self, "_regenerateMemoriesWithChange:", 0);
}

- (id)_generateEntryFromMemories:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v9;
  PXMemoryEntryInfo *v10;
  PXMemoryEntryInfo *v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLMemoriesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[Widget] Generate a feed entry from %lu memories...", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "generateEntriesFromMemories:startingFromIndex:maximumNumberOfEntries:finalMemoryIndex:", v4, 0, -[PXMemoriesFeedWidgetDataSourceManager _extendedMaxCount](self, "_extendedMaxCount"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXMemoriesFeedWidgetDataSourceManager maxCount](self, "maxCount");
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __68__PXMemoriesFeedWidgetDataSourceManager__generateEntryFromMemories___block_invoke;
  v17 = &unk_1E512C770;
  v9 = v8;
  v18 = v9;
  v19 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v14);
  v10 = [PXMemoryEntryInfo alloc];
  v11 = -[PXMemoryEntryInfo initWithSortedMemories:](v10, "initWithSortedMemories:", v9, v14, v15, v16, v17);
  PLMemoriesGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = (uint64_t)v11;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "[Widget] Generated feed entry: %@", buf, 0xCu);
  }

  return v11;
}

- (void)_regenerateMemoriesWithChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PXMemoriesFeedDataSource *v7;
  void *v8;
  PXMemoriesFeedDataSource *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PXMemoriesFeedWidgetDataSourceManager maxCount](self, "maxCount"))
  {
    v10 = 0;
    v9 = 0;
    goto LABEL_21;
  }
  -[PXMemoriesFeedDataSourceManagerBase memoriesFetchResult](self, "memoriesFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v5;
  if (objc_msgSend(v5, "count"))
  {
    -[PXMemoriesFeedWidgetDataSourceManager _generateEntryFromMemories:](self, "_generateEntryFromMemories:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [PXMemoriesFeedDataSource alloc];
    v31[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXMemoriesFeedDataSource initWithEntries:](v7, "initWithEntries:", v8);

  }
  else
  {
    v9 = 0;
  }
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "numberOfSections"))
    v12 = -[PXMemoriesFeedDataSource numberOfSections](v9, "numberOfSections") == 0;
  else
    v12 = 0;
  if (objc_msgSend(v11, "numberOfSections"))
    v13 = 0;
  else
    v13 = -[PXMemoriesFeedDataSource numberOfSections](v9, "numberOfSections") != 0;
  if (!v12)
  {
    v14 = 0;
    if (!v13)
      goto LABEL_14;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_16;
LABEL_14:
  v15 = 0;
LABEL_17:
  objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v4;
  if ((objc_msgSend(v16, "hasAnyChanges") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v14, v15, 0, 0, v17);
  v19 = objc_alloc((Class)off_1E50B4A18);
  v25 = (void *)v14;
  v26 = v11;
  v20 = objc_msgSend(v11, "identifier");
  v21 = (void *)v15;
  v22 = -[PXMemoriesFeedDataSource identifier](v9, "identifier");
  v29 = &unk_1E53EDA28;
  v30 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v19, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v20, v22, v18, v23, 0);

  objc_msgSend(v27, "count");
  v4 = v28;
LABEL_21:
  px_dispatch_on_main_queue();
  if (v9)
  {
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v9, v10);
  }
  else
  {
    +[PXSectionedDataSource emptyDataSource](PXMemoriesFeedDataSource, "emptyDataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v24, v10);

  }
}

- (void)setMaxCount:(unint64_t)a3
{
  if (self->_maxCount != a3)
  {
    self->_maxCount = a3;
    -[PXMemoriesFeedDataSourceManagerBase resetMemoriesFetchResult](self, "resetMemoriesFetchResult");
    -[PXMemoriesFeedWidgetDataSourceManager _regenerateMemoriesWithChange:](self, "_regenerateMemoriesWithChange:", 0);
  }
}

- (void)handleIncrementalFetchResultChange:(id)a3 updatedFetchResultsForMemoriesWithChangedKeyAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PXMemoriesFeedDataSourceManagerBase memoriesFetchResult](self, "memoriesFetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeDetailsForFetchResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "count");
  objc_msgSend(v9, "fetchResultAfterChanges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (-[PXMemoriesFeedDataSourceManagerBase memoriesFetchResult](self, "memoriesFetchResult"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11 != v12))
  {
    PLMemoriesGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134217984;
      v15 = v10;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "[Widget] Handling incremental update. Key assets changed: %lu.", (uint8_t *)&v14, 0xCu);
    }

    -[PXMemoriesFeedDataSourceManagerBase setMemoriesFetchResult:](self, "setMemoriesFetchResult:", v11);
    -[PXMemoriesFeedWidgetDataSourceManager _regenerateMemoriesWithChange:](self, "_regenerateMemoriesWithChange:", v9);
  }

}

- (void)handleNonIncrementalFetchResultChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

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
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "[Widget] Handling non-incremental update.", v7, 2u);
    }

    -[PXMemoriesFeedDataSourceManagerBase setMemoriesFetchResult:](self, "setMemoriesFetchResult:", v4);
    -[PXMemoriesFeedWidgetDataSourceManager _regenerateMemoriesWithChange:](self, "_regenerateMemoriesWithChange:", 0);
  }

}

- (void)handleChangedKeyAssetsForMemories:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "count");
  if (v4)
  {
    v5 = v4;
    PLMemoriesGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "[Widget] Handling updates to key assets: %lu.", (uint8_t *)&v7, 0xCu);
    }

    -[PXMemoriesFeedWidgetDataSourceManager _regenerateMemoriesWithChange:](self, "_regenerateMemoriesWithChange:", 0);
  }
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (BOOL)onlyFavorites
{
  return self->_onlyFavorites;
}

- (void)setOnlyFavorites:(BOOL)a3
{
  self->_onlyFavorites = a3;
}

uint64_t __71__PXMemoriesFeedWidgetDataSourceManager__regenerateMemoriesWithChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFirstUngroupedMemoryIndex:", *(_QWORD *)(a1 + 40));
}

void __68__PXMemoriesFeedWidgetDataSourceManager__generateEntryFromMemories___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(a2, "memories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PXMemoriesFeedWidgetDataSourceManager__generateEntryFromMemories___block_invoke_2;
  v6[3] = &unk_1E512C748;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

}

void __68__PXMemoriesFeedWidgetDataSourceManager__generateEntryFromMemories___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 40))
    *a4 = 1;
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __53__PXMemoriesFeedWidgetDataSourceManager_fetchOptions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v4;
    v9[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPredicate:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPredicate:", v3);
  }

}

@end
