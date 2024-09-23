@implementation PXImportAssetsDataSourceManager

- (PXImportAssetsDataSourceManager)initWithDelegate:(id)a3 logIdentifier:(id)a4
{
  id v6;
  id v7;
  PXImportAssetsDataSourceManager *v8;
  PXImportAssetsDataSourceManager *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *allAssetCollectionsById;
  NSDictionary *v12;
  NSDictionary *filteredAssetCollectionsById;
  NSMutableArray *v14;
  NSMutableArray *allAssetCollections;
  NSArray *v16;
  NSArray *filteredAssetCollections;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *modelQueue;
  PXImportAssetsDataSource *v26;
  uint64_t v27;
  PXImportAssetsDataSource *unfilteredDataSource;
  uint64_t v29;
  NSString *logIdentifier;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PXImportAssetsDataSourceManager;
  v8 = -[PXSectionedDataSourceManager init](&v32, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    allAssetCollectionsById = v9->_allAssetCollectionsById;
    v9->_allAssetCollectionsById = v10;

    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    filteredAssetCollectionsById = v9->_filteredAssetCollectionsById;
    v9->_filteredAssetCollectionsById = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allAssetCollections = v9->_allAssetCollections;
    v9->_allAssetCollections = v14;

    v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    filteredAssetCollections = v9->_filteredAssetCollections;
    v9->_filteredAssetCollections = v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_UTILITY, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@-modelQueue"), v22);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = dispatch_queue_create((const char *)objc_msgSend(v23, "UTF8String"), v19);
    modelQueue = v9->_modelQueue;
    v9->_modelQueue = (OS_dispatch_queue *)v24;

    v9->_maxAlreadyImportedItems = 0x7FFFFFFFFFFFFFFFLL;
    v9->_showAlreadyImportedItems = 1;
    v9->_showNotYetImportedItems = 1;
    *(_WORD *)&v9->_alreadyImportedItemsSelectable = 1;
    v26 = [PXImportAssetsDataSource alloc];
    v27 = -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:](v26, "initWithAssetCollections:assetsMap:startsAtEnd:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], v9->_dataSourcesStartAtEnd);
    unfilteredDataSource = v9->_unfilteredDataSource;
    v9->_unfilteredDataSource = (PXImportAssetsDataSource *)v27;

    v29 = objc_msgSend(v7, "copy");
    logIdentifier = v9->_logIdentifier;
    v9->_logIdentifier = (NSString *)v29;

  }
  return v9;
}

- (PXImportAssetsDataSourceManager)initWithAssetsFromDataSourceManager:(id)a3 delegate:(id)a4 logIdentifier:(id)a5
{
  id v8;
  PXImportAssetsDataSourceManager *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  PXImportAssetsDataSource *v16;
  void *v17;
  uint64_t v18;
  PXImportAssetsDataSource *unfilteredDataSource;
  id v21;
  id v22;

  v8 = a3;
  v9 = -[PXImportAssetsDataSourceManager initWithDelegate:logIdentifier:](self, "initWithDelegate:logIdentifier:", a4, a5);
  if (v9)
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(v8, "allAssetCollections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    objc_msgSend(v10, "copyFromAssetCollections:toAssetCollections:assetCollectionsById:", v11, &v22, &v21);
    v12 = v22;
    v13 = v21;

    -[NSMutableArray addObjectsFromArray:](v9->_allAssetCollections, "addObjectsFromArray:", v12);
    -[NSMutableDictionary addEntriesFromDictionary:](v9->_allAssetCollectionsById, "addEntriesFromDictionary:", v13);
    -[PXImportAssetsDataSourceManager delegate](v9, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewModelMapForImportAssetsDataSourceManager:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = [PXImportAssetsDataSource alloc];
    -[PXImportAssetsDataSourceManager allAssetCollections](v9, "allAssetCollections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:](v16, "initWithAssetCollections:assetsMap:startsAtEnd:", v17, v15, -[PXImportAssetsDataSourceManager dataSourcesStartAtEnd](v9, "dataSourcesStartAtEnd"));
    unfilteredDataSource = v9->_unfilteredDataSource;
    v9->_unfilteredDataSource = (PXImportAssetsDataSource *)v18;

    v9->_needsFilterUpdate = 1;
    -[PXImportAssetsDataSourceManager updateFilteredAssetsIfNeeded](v9, "updateFilteredAssetsIfNeeded");

  }
  return v9;
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXImportAssetsDataSourceManager;
  -[PXSectionedDataSourceManager registerChangeObserver:context:](&v4, sel_registerChangeObserver_context_, a3, a4);
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXImportAssetsDataSourceManager;
  -[PXSectionedDataSourceManager unregisterChangeObserver:context:](&v4, sel_unregisterChangeObserver_context_, a3, a4);
}

- (id)createInitialDataSource
{
  PXImportAssetsDataSource *v3;
  _BOOL8 v4;

  v3 = [PXImportAssetsDataSource alloc];
  v4 = -[PXImportAssetsDataSourceManager dataSourcesStartAtEnd](self, "dataSourcesStartAtEnd");
  return -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:](v3, "initWithAssetCollections:assetsMap:startsAtEnd:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], v4);
}

- (void)addAssets:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importDataSourceManagerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PXImportAssetsDataSourceManager logIdentifier](self, "logIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add %ld assets"), objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v12 = v6;
    v13 = 2080;
    v14 = "-[PXImportAssetsDataSourceManager addAssets:]";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %s: %@", buf, 0x20u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PXImportAssetsDataSourceManager_addAssets___block_invoke;
  v9[3] = &unk_1E511C960;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[PXImportAssetsDataSourceManager modifyAssetCollectionsWithBlock:](self, "modifyAssetCollectionsWithBlock:", v9);

}

- (void)removeAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PXImportAssetsDataSourceManager_removeAssets___block_invoke;
  v6[3] = &unk_1E511C960;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXImportAssetsDataSourceManager modifyAssetCollectionsWithBlock:](self, "modifyAssetCollectionsWithBlock:", v6);

}

- (void)updateFilteredAssetsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  if (-[PXImportAssetsDataSourceManager needsFilterUpdate](self, "needsFilterUpdate"))
  {
    -[PXImportAssetsDataSourceManager delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModelMapForImportAssetsDataSourceManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __63__PXImportAssetsDataSourceManager_updateFilteredAssetsIfNeeded__block_invoke;
      v6[3] = &unk_1E511C960;
      v6[4] = self;
      v7 = v5;
      -[PXImportAssetsDataSourceManager modifyAssetCollectionsWithBlock:](self, "modifyAssetCollectionsWithBlock:", v6);

    }
  }
}

- (void)modifyAssetCollectionsWithBlock:(id)a3
{
  id v4;
  NSObject *modelQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  modelQueue = self->_modelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke;
  block[3] = &unk_1E5148CE0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(modelQueue, block);

}

- (id)filteredModelsFromModels:(id)a3 inAssetCollections:(id)a4 assetCollectionsById:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, void *);
  void *v16;
  PXImportAssetsDataSourceManager *v17;
  id v18;

  v7 = a5;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __100__PXImportAssetsDataSourceManager_filteredModelsFromModels_inAssetCollections_assetCollectionsById___block_invoke;
  v16 = &unk_1E511C9D8;
  v17 = self;
  v18 = v7;
  v8 = v7;
  v9 = a3;
  objc_msgSend(v9, "indexesOfObjectsPassingTest:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectsAtIndexes:", v10, v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)existingModelsFromModels:(id)a3 inAssetCollections:(id)a4 assetCollectionsById:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__PXImportAssetsDataSourceManager_existingModelsFromModels_inAssetCollections_assetCollectionsById___block_invoke;
  v12[3] = &unk_1E511CA00;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend(v8, "indexesOfObjectsPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)rebuildAlreadyImportedAssetCollectionInCollections:(id)a3 collectionsById:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  BOOL v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = a4;
  if (-[PXImportAssetsDataSourceManager maxAlreadyImportedItems](self, "maxAlreadyImportedItems") != 0x7FFFFFFFFFFFFFFFLL)
  {
    +[PXImportItemViewModel alreadyImportedGroupIdentifier](PXImportItemViewModel, "alreadyImportedGroupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "removeAllObjects");
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__43091;
      v33 = __Block_byref_object_dispose__43092;
      v34 = 0;
      -[PXImportAssetsDataSourceManager unfilteredAlreadyImportedAssetCollection](self, "unfilteredAlreadyImportedAssetCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __102__PXImportAssetsDataSourceManager_rebuildAlreadyImportedAssetCollectionInCollections_collectionsById___block_invoke;
      v28[3] = &unk_1E511C9B0;
      v28[4] = &v29;
      objc_msgSend(v10, "arrangedObjects:", v28);

      v11 = objc_msgSend((id)v30[5], "count");
      +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "alreadyImportedTruncationMode");

      v14 = -[PXImportAssetsDataSourceManager forcedAlreadyImportedTruncationMode](self, "forcedAlreadyImportedTruncationMode");
      if ((unint64_t)(v14 - 1) < 3)
        v13 = v14 - 1;
      v16 = v11 > -[PXImportAssetsDataSourceManager maxAlreadyImportedItems](self, "maxAlreadyImportedItems")
         && -[PXImportAssetsDataSourceManager maxAlreadyImportedItems](self, "maxAlreadyImportedItems") > 0
         && v13 == 1;
      if (v13 != 1)
        v16 = 1;
      if (v13 && v16)
      {
        if (v13 == 2)
        {
          v17 = -[PXImportAssetsDataSourceManager maxAlreadyImportedItems](self, "maxAlreadyImportedItems");
          if (v17 >= v11)
            v18 = v11;
          else
            v18 = v17;
          objc_msgSend((id)v30[5], "subarrayWithRange:", v11 - v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v19);
        }
        else
        {
          v22 = -[PXImportAssetsDataSourceManager maxAlreadyImportedItems](self, "maxAlreadyImportedItems");
          if (v22 >= 0)
            v23 = v22;
          else
            v23 = v22 + 1;
          v24 = -[PXImportAssetsDataSourceManager maxAlreadyImportedItems](self, "maxAlreadyImportedItems");
          objc_msgSend((id)v30[5], "subarrayWithRange:", 0, v24 + ~(v23 >> 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v30[5], "subarrayWithRange:", v11 - (v23 >> 1), v23 >> 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v19);
          +[PXImportExpansionPlaceholderViewModel sharedInstance](PXImportExpansionPlaceholderViewModel, "sharedInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v26);

          objc_msgSend(v9, "addObjectsFromArray:", v25);
        }
      }
      else
      {
        v20 = -[PXImportAssetsDataSourceManager maxAlreadyImportedItems](self, "maxAlreadyImportedItems");
        if (v20 >= v11)
          v21 = v11;
        else
          v21 = v20;
        objc_msgSend((id)v30[5], "subarrayWithRange:", 0, v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v19);
      }

      if (!objc_msgSend(v9, "numberOfItems"))
      {
        objc_msgSend(v6, "removeObject:", v9);
        objc_msgSend(v9, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObjectForKey:", v27);

      }
      _Block_object_dispose(&v29, 8);

    }
  }

}

- (void)pruneEmptyAssetCollectionsInCollections:(id)a3 collectionsById:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v14, "numberOfItems", (_QWORD)v16))
        {
          objc_msgSend(v7, "addObject:", v14);
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v9, "removeObjectsInArray:", v7);
  objc_msgSend(v6, "removeObjectsForKeys:", v8);

}

- (void)setNeedsFilterUpdate
{
  -[PXImportAssetsDataSourceManager setNeedsFilterUpdate:](self, "setNeedsFilterUpdate:", 1);
}

- (void)setVisibleImportAssetIdentifiers:(id)a3
{
  unint64_t v4;
  NSSet *visibleImportAssetIdentifiers;
  BOOL v6;
  NSSet *v7;
  NSSet *v8;
  void *v9;

  v4 = (unint64_t)a3;
  visibleImportAssetIdentifiers = self->_visibleImportAssetIdentifiers;
  if (v4 | (unint64_t)visibleImportAssetIdentifiers)
  {
    v9 = (void *)v4;
    v6 = -[NSSet isEqualToSet:](visibleImportAssetIdentifiers, "isEqualToSet:", v4);
    v4 = (unint64_t)v9;
    if (!v6)
    {
      v7 = (NSSet *)objc_msgSend(v9, "copy");
      v8 = self->_visibleImportAssetIdentifiers;
      self->_visibleImportAssetIdentifiers = v7;

      -[PXImportAssetsDataSourceManager setNeedsFilterUpdate](self, "setNeedsFilterUpdate");
      v4 = (unint64_t)v9;
    }
  }

}

- (void)setMaxAlreadyImportedItems:(int64_t)a3
{
  if (self->_maxAlreadyImportedItems != a3)
  {
    self->_maxAlreadyImportedItems = a3;
    -[PXImportAssetsDataSourceManager setNeedsFilterUpdate](self, "setNeedsFilterUpdate");
  }
}

- (void)setShowAlreadyImportedItems:(BOOL)a3
{
  if (self->_showAlreadyImportedItems != a3)
  {
    self->_showAlreadyImportedItems = a3;
    -[PXImportAssetsDataSourceManager setNeedsFilterUpdate](self, "setNeedsFilterUpdate");
  }
}

- (void)setShowNotYetImportedItems:(BOOL)a3
{
  if (self->_showNotYetImportedItems != a3)
  {
    self->_showNotYetImportedItems = a3;
    -[PXImportAssetsDataSourceManager setNeedsFilterUpdate](self, "setNeedsFilterUpdate");
  }
}

- (void)setAlreadyImportedItemsSelectable:(BOOL)a3
{
  if (self->_alreadyImportedItemsSelectable != a3)
  {
    self->_alreadyImportedItemsSelectable = a3;
    -[PXImportAssetsDataSourceManager updateAlreadyImportedSelectability](self, "updateAlreadyImportedSelectability");
  }
}

- (void)updateAlreadyImportedSelectability
{
  void *v3;
  BOOL v4;
  uint64_t v5;
  _QWORD v6[6];
  BOOL v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  -[PXImportAssetsDataSourceManager unfilteredAlreadyImportedAssetCollection](self, "unfilteredAlreadyImportedAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PXImportAssetsDataSourceManager alreadyImportedItemsSelectable](self, "alreadyImportedItemsSelectable");
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = __Block_byref_object_copy__43091;
    v9[4] = __Block_byref_object_dispose__43092;
    v5 = MEMORY[0x1E0C809B0];
    v10 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke;
    v8[3] = &unk_1E511C9B0;
    v8[4] = v9;
    objc_msgSend(v3, "arrangedObjects:", v8);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke_2;
    v6[3] = &unk_1E513FF00;
    v6[4] = self;
    v6[5] = v9;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    _Block_object_dispose(v9, 8);

  }
}

- (PXImportAssetCollection)unfilteredAlreadyImportedAssetCollection
{
  void *v3;
  void *v4;
  void *v5;

  +[PXImportItemViewModel alreadyImportedGroupIdentifier](PXImportItemViewModel, "alreadyImportedGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportAssetsDataSourceManager allAssetCollectionsById](self, "allAssetCollectionsById");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXImportAssetCollection *)v5;
}

- (int64_t)countOfUnfilteredAlreadyImportedAssetCollection
{
  void *v2;
  int64_t v3;

  -[PXImportAssetsDataSourceManager unfilteredAlreadyImportedAssetCollection](self, "unfilteredAlreadyImportedAssetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItems");

  return v3;
}

- (int64_t)countOfAlreadyImportedAssetCollectionInCollectionsMap:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  +[PXImportItemViewModel alreadyImportedGroupIdentifier](PXImportItemViewModel, "alreadyImportedGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "numberOfItems");
  return v6;
}

- (void)setUnfilteredDataSource:(id)a3
{
  PXImportAssetsDataSource *v5;
  PXImportAssetsDataSource *v6;

  v5 = (PXImportAssetsDataSource *)a3;
  if (self->_unfilteredDataSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_unfilteredDataSource, a3);
    -[PXImportAssetsDataSourceManager updateAlreadyImportedSelectability](self, "updateAlreadyImportedSelectability");
    v5 = v6;
  }

}

- (PXImportAssetsDataSourceManagerDelegate)delegate
{
  return (PXImportAssetsDataSourceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXImportAssetsDataSource)unfilteredDataSource
{
  return self->_unfilteredDataSource;
}

- (BOOL)dispatchesDataSourceUpdatesOnMainQueue
{
  return self->_dispatchesDataSourceUpdatesOnMainQueue;
}

- (void)setDispatchesDataSourceUpdatesOnMainQueue:(BOOL)a3
{
  self->_dispatchesDataSourceUpdatesOnMainQueue = a3;
}

- (NSSet)visibleImportAssetIdentifiers
{
  return self->_visibleImportAssetIdentifiers;
}

- (BOOL)showAlreadyImportedItems
{
  return self->_showAlreadyImportedItems;
}

- (BOOL)showNotYetImportedItems
{
  return self->_showNotYetImportedItems;
}

- (BOOL)alreadyImportedItemsSelectable
{
  return self->_alreadyImportedItemsSelectable;
}

- (BOOL)dataSourcesStartAtEnd
{
  return self->_dataSourcesStartAtEnd;
}

- (void)setDataSourcesStartAtEnd:(BOOL)a3
{
  self->_dataSourcesStartAtEnd = a3;
}

- (NSMutableDictionary)allAssetCollectionsById
{
  return self->_allAssetCollectionsById;
}

- (void)setAllAssetCollectionsById:(id)a3
{
  objc_storeStrong((id *)&self->_allAssetCollectionsById, a3);
}

- (NSDictionary)filteredAssetCollectionsById
{
  return self->_filteredAssetCollectionsById;
}

- (void)setFilteredAssetCollectionsById:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSMutableArray)allAssetCollections
{
  return self->_allAssetCollections;
}

- (void)setAllAssetCollections:(id)a3
{
  objc_storeStrong((id *)&self->_allAssetCollections, a3);
}

- (NSArray)filteredAssetCollections
{
  return self->_filteredAssetCollections;
}

- (void)setFilteredAssetCollections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (OS_dispatch_queue)modelQueue
{
  return self->_modelQueue;
}

- (void)setModelQueue:(id)a3
{
  objc_storeStrong((id *)&self->_modelQueue, a3);
}

- (BOOL)needsFilterUpdate
{
  return self->_needsFilterUpdate;
}

- (void)setNeedsFilterUpdate:(BOOL)a3
{
  self->_needsFilterUpdate = a3;
}

- (int64_t)maxAlreadyImportedItems
{
  return self->_maxAlreadyImportedItems;
}

- (int64_t)forcedAlreadyImportedTruncationMode
{
  return self->_forcedAlreadyImportedTruncationMode;
}

- (void)setForcedAlreadyImportedTruncationMode:(int64_t)a3
{
  self->_forcedAlreadyImportedTruncationMode = a3;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_modelQueue, 0);
  objc_storeStrong((id *)&self->_filteredAssetCollections, 0);
  objc_storeStrong((id *)&self->_allAssetCollections, 0);
  objc_storeStrong((id *)&self->_filteredAssetCollectionsById, 0);
  objc_storeStrong((id *)&self->_allAssetCollectionsById, 0);
  objc_storeStrong((id *)&self->_visibleImportAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_unfilteredDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  _QWORD v10[4];
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "isSelectable");
        if (v9 != objc_msgSend(*(id *)(a1 + 32), "alreadyImportedItemsSelectable"))
        {
          v10[0] = v6;
          v10[1] = 3221225472;
          v10[2] = __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke_3;
          v10[3] = &__block_descriptor_33_e40_v16__0___PXMutableImportItemViewModel__8l;
          v11 = *(_BYTE *)(a1 + 48);
          objc_msgSend(v8, "performChanges:", v10);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectable:", *(unsigned __int8 *)(a1 + 32));
}

void __102__PXImportAssetsDataSourceManager_rebuildAlreadyImportedAssetCollectionInCollections_collectionsById___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

BOOL __100__PXImportAssetsDataSourceManager_existingModelsFromModels_inAssetCollections_assetCollectionsById___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5 && objc_msgSend(v5, "indexOfItem:", v3) != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

BOOL __100__PXImportAssetsDataSourceManager_filteredModelsFromModels_inAssetCollections_assetCollectionsById___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v3 = a2;
  objc_msgSend(v3, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visibleImportAssetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_3;
  objc_msgSend(v3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visibleImportAssetIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "member:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = 0;
  }
  else
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = v10
       && (!objc_msgSend(v10, "alreadyImportedGroup")
        || objc_msgSend(*(id *)(a1 + 32), "showAlreadyImportedItems"))
       && ((objc_msgSend(v11, "alreadyImportedGroup") & 1) != 0
        || objc_msgSend(*(id *)(a1 + 32), "showNotYetImportedItems"));

  }
  return v12;
}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  PXImportAssetsDataSource *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD block[5];
  PXImportAssetsDataSource *v41;
  id v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModelMapForImportAssetsDataSourceManager:", *v2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_class();
  objc_msgSend(*v2, "filteredAssetCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v62 = 0;
  objc_msgSend(v4, "copyFromAssetCollections:toAssetCollections:assetCollectionsById:", v5, &v62, &v61);
  v38 = v62;
  v39 = v61;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = objc_opt_class();
  objc_msgSend(*v2, "filteredAssetCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend((id)v6, "assetCollectionsArray:isEqualToAssetCollectionsArray:", v7, v38);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:]([PXImportAssetsDataSource alloc], "initWithAssetCollections:assetsMap:startsAtEnd:", v38, v34, objc_msgSend(*(id *)(a1 + 32), "dataSourcesStartAtEnd"));
    v8 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(*(id *)(a1 + 32), "filteredAssetCollections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v38, "count"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "filteredAssetCollections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_2;
    v59[3] = &unk_1E511C988;
    v32 = v10;
    v60 = v32;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v59);

    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_3;
    v57[3] = &unk_1E511C988;
    v31 = (id)v11;
    v58 = v31;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", v57);
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v32, v31, MEMORY[0x1E0C9AA60]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "insertedIndexes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v13, "count");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "filteredAssetCollections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v14, "count") == 0;

    if ((v11 & 1) == 0)
    {
      v15 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "filteredAssetCollections", v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v51 = 0;
          v52 = &v51;
          v53 = 0x3032000000;
          v54 = __Block_byref_object_copy__43091;
          v55 = __Block_byref_object_dispose__43092;
          v56 = 0;
          v20 = MEMORY[0x1E0C809B0];
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_17;
          v50[3] = &unk_1E511C9B0;
          v50[4] = &v51;
          objc_msgSend(v17, "arrangedObjects:", v50);
          v44 = 0;
          v45 = &v44;
          v46 = 0x3032000000;
          v47 = __Block_byref_object_copy__43091;
          v48 = __Block_byref_object_dispose__43092;
          v49 = 0;
          v43[0] = v20;
          v43[1] = 3221225472;
          v43[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_2_19;
          v43[3] = &unk_1E511C9B0;
          v43[4] = &v44;
          objc_msgSend(v19, "arrangedObjects:", v43);
          objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v52[5], v45[5], MEMORY[0x1E0C9AA60]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "hasAnyChanges"))
          {
            v22 = v15;
            if (v35)
            {
              v63[0] = v36;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(off_1E50B1608, "indexAfterApplyingChanges:toIndex:objectChanged:", v23, v15, 0);

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v21, v24);

          }
          _Block_object_dispose(&v44, 8);

          _Block_object_dispose(&v51, 8);
        }

        objc_msgSend(*(id *)(a1 + 32), "filteredAssetCollections");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        ++v15;
      }
      while (v15 < v26);
    }
    v27 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A18), "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v30, "identifier"), -[PXImportAssetsDataSource identifier](v33, "identifier"), v36, v37, 0);
    v28 = (void *)objc_msgSend(v39, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setFilteredAssetCollectionsById:", v28);

    v29 = (void *)objc_msgSend(v38, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setFilteredAssetCollections:", v29);

    if ((objc_msgSend(*(id *)(a1 + 32), "dispatchesDataSourceUpdatesOnMainQueue") & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_3_22;
      block[3] = &unk_1E51457C8;
      block[4] = *(_QWORD *)(a1 + 32);
      v41 = v33;
      v42 = v27;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setDataSource:changeDetails:", v33, v27);
    }

  }
}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_17(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_2_19(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_3_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDataSource:changeDetails:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __63__PXImportAssetsDataSourceManager_updateFilteredAssetsIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "allAssetCollections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allAssetCollectionsById");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredModelsFromModels:inAssetCollections:assetCollectionsById:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "removeAllObjects", (_QWORD)v19);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  v17 = objc_msgSend(*(id *)(a1 + 32), "countOfAlreadyImportedAssetCollectionInCollectionsMap:", v6);
  objc_msgSend((id)objc_opt_class(), "addModels:toAssetCollections:assetCollectionsById:", v11, v12, v6);
  v18 = objc_msgSend(*(id *)(a1 + 32), "countOfAlreadyImportedAssetCollectionInCollectionsMap:", v6);
  if (objc_msgSend(*(id *)(a1 + 32), "maxAlreadyImportedItems") != 0x7FFFFFFFFFFFFFFFLL && v17 != v18)
    objc_msgSend(*(id *)(a1 + 32), "rebuildAlreadyImportedAssetCollectionInCollections:collectionsById:", v12, v6);
  objc_msgSend(*(id *)(a1 + 32), "pruneEmptyAssetCollectionsInCollections:collectionsById:", v12, v6, (_QWORD)v19);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsFilterUpdate:", 0);

}

void __48__PXImportAssetsDataSourceManager_removeAssets___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PXImportAssetsDataSource *v23;
  void *v24;
  PXImportAssetsDataSource *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  v7 = a3;
  v8 = a4;
  _importDataSourceManagerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Remove %ld assets"), objc_msgSend(*(id *)(a1 + 40), "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v10;
    v37 = 2080;
    v38 = "-[PXImportAssetsDataSourceManager removeAssets:]_block_invoke";
    v39 = 2112;
    v40 = v11;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %s: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = *(id *)(a1 + 40);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          objc_msgSend(v12, "addObject:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  v20 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "allAssetCollections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allAssetCollectionsById");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeModels:fromAssetCollections:assetCollectionsById:", v12, v21, v22);

  v23 = [PXImportAssetsDataSource alloc];
  objc_msgSend(*(id *)(a1 + 32), "allAssetCollections");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:](v23, "initWithAssetCollections:assetsMap:startsAtEnd:", v24, v8, objc_msgSend(*(id *)(a1 + 32), "dataSourcesStartAtEnd"));
  objc_msgSend(*(id *)(a1 + 32), "setUnfilteredDataSource:", v25);

  objc_msgSend(*(id *)(a1 + 32), "existingModelsFromModels:inAssetCollections:assetCollectionsById:", v12, v29, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(*(id *)(a1 + 32), "countOfAlreadyImportedAssetCollectionInCollectionsMap:", v7);
  objc_msgSend((id)objc_opt_class(), "removeModels:fromAssetCollections:assetCollectionsById:", v26, v29, v7);
  v28 = objc_msgSend(*(id *)(a1 + 32), "countOfAlreadyImportedAssetCollectionInCollectionsMap:", v7);
  if (objc_msgSend(*(id *)(a1 + 32), "maxAlreadyImportedItems") != 0x7FFFFFFFFFFFFFFFLL && v27 != v28)
    objc_msgSend(*(id *)(a1 + 32), "rebuildAlreadyImportedAssetCollectionInCollections:collectionsById:", v29, v7);

}

void __45__PXImportAssetsDataSourceManager_addAssets___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PXImportAssetsDataSource *v20;
  void *v21;
  PXImportAssetsDataSource *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  v7 = a3;
  v8 = a4;
  v29 = objc_msgSend(*(id *)(a1 + 32), "countOfUnfilteredAlreadyImportedAssetCollection");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = *(id *)(a1 + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          objc_msgSend(v9, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "allAssetCollections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allAssetCollectionsById");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addModels:toAssetCollections:assetCollectionsById:", v9, v18, v19);

  if (v29 != objc_msgSend(*(id *)(a1 + 32), "countOfUnfilteredAlreadyImportedAssetCollection"))
    objc_msgSend(*(id *)(a1 + 32), "updateAlreadyImportedSelectability");
  v20 = [PXImportAssetsDataSource alloc];
  objc_msgSend(*(id *)(a1 + 32), "allAssetCollections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:](v20, "initWithAssetCollections:assetsMap:startsAtEnd:", v21, v8, objc_msgSend(*(id *)(a1 + 32), "dataSourcesStartAtEnd"));
  objc_msgSend(*(id *)(a1 + 32), "setUnfilteredDataSource:", v22);

  v23 = *(void **)(a1 + 32);
  objc_msgSend(v23, "allAssetCollections");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allAssetCollectionsById");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredModelsFromModels:inAssetCollections:assetCollectionsById:", v9, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(*(id *)(a1 + 32), "countOfAlreadyImportedAssetCollectionInCollectionsMap:", v7);
  objc_msgSend((id)objc_opt_class(), "addModels:toAssetCollections:assetCollectionsById:", v26, v30, v7);
  v28 = objc_msgSend(*(id *)(a1 + 32), "countOfAlreadyImportedAssetCollectionInCollectionsMap:", v7);
  if (objc_msgSend(*(id *)(a1 + 32), "maxAlreadyImportedItems") != 0x7FFFFFFFFFFFFFFFLL && v27 != v28)
    objc_msgSend(*(id *)(a1 + 32), "rebuildAlreadyImportedAssetCollectionInCollections:collectionsById:", v30, v7);

}

+ (void)copyFromAssetCollections:(id)a3 toAssetCollections:(id *)a4 assetCollectionsById:(id *)a5
{
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
  void *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copy");
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(v21, "identifier", (_QWORD)v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  v23 = objc_retainAutorelease(v16);
  *a4 = v23;
  v24 = objc_retainAutorelease(v15);
  *a5 = v24;

}

+ (BOOL)assetCollectionsArray:(id)a3 isEqualToAssetCollectionsArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  BOOL v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v13)
        break;
      v14 = objc_msgSend(v9, "numberOfItems");
      if (v14 != objc_msgSend(v10, "numberOfItems"))
        break;
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__43091;
      v31 = __Block_byref_object_dispose__43092;
      v32 = 0;
      v15 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __88__PXImportAssetsDataSourceManager_assetCollectionsArray_isEqualToAssetCollectionsArray___block_invoke;
      v26[3] = &unk_1E511C9B0;
      v26[4] = &v27;
      objc_msgSend(v9, "arrangedObjects:", v26);
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__43091;
      v24 = __Block_byref_object_dispose__43092;
      v25 = 0;
      v19[0] = v15;
      v19[1] = 3221225472;
      v19[2] = __88__PXImportAssetsDataSourceManager_assetCollectionsArray_isEqualToAssetCollectionsArray___block_invoke_2;
      v19[3] = &unk_1E511C9B0;
      v19[4] = &v20;
      objc_msgSend(v10, "arrangedObjects:", v19);
      v16 = objc_msgSend((id)v28[5], "isEqualToArray:", v21[5]);
      _Block_object_dispose(&v20, 8);

      _Block_object_dispose(&v27, 8);
      if ((v16 & 1) == 0)
        break;

      if (++v8 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_8;
    }

    goto LABEL_10;
  }
LABEL_8:
  v17 = 1;
LABEL_11:

  return v17;
}

+ (void)addModels:(id)a3 toAssetCollections:(id)a4 assetCollectionsById:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  PXImportAssetCollection *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "groupIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v16);
        v17 = (PXImportAssetCollection *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v17 = objc_alloc_init(PXImportAssetCollection);
          -[PXImportAssetCollection setIdentifier:](v17, "setIdentifier:", v16);
          -[PXImportAssetCollection setAlreadyImportedGroup:](v17, "setAlreadyImportedGroup:", objc_msgSend(v15, "isDuplicate"));
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v16);
          objc_msgSend(v8, "addObject:", v17);
          v12 = 1;
        }
        -[PXImportAssetCollection addObject:](v17, "addObject:", v15);

      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
    if ((v12 & 1) != 0)
      objc_msgSend((id)objc_opt_class(), "sortAssetCollectionsInArray:", v8);
  }

}

+ (void)removeModels:(id)a3 fromAssetCollections:(id)a4 assetCollectionsById:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  NSObject *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v24;
    *(_QWORD *)&v11 = 138412546;
    v22 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "groupIdentifier", v22);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = v17;
            -[NSObject removeObject:](v17, "removeObject:", v15);
            if (!-[NSObject numberOfItems](v18, "numberOfItems"))
            {
              v19 = objc_msgSend(v8, "indexOfObject:", v18);
              _importDataSourceManagerLog();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                v28 = v19;
                v29 = 2112;
                v30 = v18;
                _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "Removing asset collection at index %tu: %@, because it no longer has assets", buf, 0x16u);
              }

              objc_msgSend(v9, "removeObjectForKey:", v16);
              objc_msgSend(v8, "removeObject:", v18);
            }
          }
          else
          {
            PXAssertGetLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v22;
              v28 = (uint64_t)v15;
              v29 = 2112;
              v30 = v16;
              _os_log_fault_impl(&dword_1A6789000, v21, OS_LOG_TYPE_FAULT, "No asset collection for model: %@, with group identifier: %@", buf, 0x16u);
            }

            v18 = 0;
          }
        }
        else
        {
          PXAssertGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = (uint64_t)v15;
            _os_log_fault_impl(&dword_1A6789000, v18, OS_LOG_TYPE_FAULT, "No group identifier for model: %@", buf, 0xCu);
          }
        }

      }
      v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v12);
  }

}

+ (void)sortAssetCollectionsInArray:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_43131);
}

uint64_t __63__PXImportAssetsDataSourceManager_sortAssetCollectionsInArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __88__PXImportAssetsDataSourceManager_assetCollectionsArray_isEqualToAssetCollectionsArray___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __88__PXImportAssetsDataSourceManager_assetCollectionsArray_isEqualToAssetCollectionsArray___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
