@implementation PSSearchModel

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_19);
  return (id)sharedInstance_sharedInstance_1;
}

void __31__PSSearchModel_sharedInstance__block_invoke()
{
  PSSearchModel *v0;
  void *v1;

  v0 = objc_alloc_init(PSSearchModel);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (PSSearchModel)init
{
  PSSearchModel *v2;
  NSOperationQueue *v3;
  NSOperationQueue *indexOperationQueue;
  NSOperationQueue *v5;
  NSOperationQueue *searchOperationQueue;
  uint64_t v7;
  NSMutableSet *delegates;
  uint64_t v9;
  NSMapTable *specifierDataSources;
  uint64_t v11;
  NSMutableArray *rootEntries;
  uint64_t v13;
  NSMutableSet *entriesBeingIndexed;
  uint64_t v15;
  NSMutableSet *indexingEntriesWithLoadedDataSources;
  uint64_t v17;
  NSMutableSet *removedEntriesStillIndexing;
  uint64_t v19;
  NSMutableArray *deferredSpecifierUpdates;
  uint64_t v21;
  NSMutableSet *entriesPendingSearch;
  uint64_t v23;
  NSMutableSet *removedEntriesStillSearching;
  dispatch_queue_t v25;
  OS_dispatch_queue *searchStateAccessQueue;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PSSearchModel;
  v2 = -[PSSearchModel init](&v28, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    indexOperationQueue = v2->_indexOperationQueue;
    v2->_indexOperationQueue = v3;

    -[NSOperationQueue setName:](v2->_indexOperationQueue, "setName:", CFSTR("com.apple.preferences.search.indexingOperationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_indexOperationQueue, "setMaxConcurrentOperationCount:", 8);
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    searchOperationQueue = v2->_searchOperationQueue;
    v2->_searchOperationQueue = v5;

    -[NSOperationQueue setName:](v2->_searchOperationQueue, "setName:", CFSTR("com.apple.preferences.search.searchOperationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_searchOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v7 = objc_opt_new();
    delegates = v2->_delegates;
    v2->_delegates = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    specifierDataSources = v2->_specifierDataSources;
    v2->_specifierDataSources = (NSMapTable *)v9;

    v11 = objc_opt_new();
    rootEntries = v2->_rootEntries;
    v2->_rootEntries = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    entriesBeingIndexed = v2->_entriesBeingIndexed;
    v2->_entriesBeingIndexed = (NSMutableSet *)v13;

    v15 = objc_opt_new();
    indexingEntriesWithLoadedDataSources = v2->_indexingEntriesWithLoadedDataSources;
    v2->_indexingEntriesWithLoadedDataSources = (NSMutableSet *)v15;

    v17 = objc_opt_new();
    removedEntriesStillIndexing = v2->_removedEntriesStillIndexing;
    v2->_removedEntriesStillIndexing = (NSMutableSet *)v17;

    v19 = objc_opt_new();
    deferredSpecifierUpdates = v2->_deferredSpecifierUpdates;
    v2->_deferredSpecifierUpdates = (NSMutableArray *)v19;

    v21 = objc_opt_new();
    entriesPendingSearch = v2->_entriesPendingSearch;
    v2->_entriesPendingSearch = (NSMutableSet *)v21;

    v23 = objc_opt_new();
    removedEntriesStillSearching = v2->_removedEntriesStillSearching;
    v2->_removedEntriesStillSearching = (NSMutableSet *)v23;

    v25 = dispatch_queue_create("com.apple.preferences.search.pendingSearchAccessQueue", 0);
    searchStateAccessQueue = v2->_searchStateAccessQueue;
    v2->_searchStateAccessQueue = (OS_dispatch_queue *)v25;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[NSOperationQueue operations](self->_indexOperationQueue, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_40);

  -[NSOperationQueue cancelAllOperations](self->_indexOperationQueue, "cancelAllOperations");
  -[NSOperationQueue operations](self->_searchOperationQueue, "operations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_41);

  -[NSOperationQueue cancelAllOperations](self->_searchOperationQueue, "cancelAllOperations");
  v5.receiver = self;
  v5.super_class = (Class)PSSearchModel;
  -[PSSearchModel dealloc](&v5, sel_dealloc);
}

uint64_t __24__PSSearchModel_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

uint64_t __24__PSSearchModel_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

- (id)_rootSpecifiers
{
  PSSearchModelDataSource **p_dataSource;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "rootSpecifiersForSearchModel:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {
    v6 = objc_loadWeakRetained((id *)p_dataSource);
    NSLog(CFSTR("Error: %@ data source %@ did not provide any root specifiers!"), self, v6);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[PSSpecifier specifierWithSpecifier:](PSSpecifier, "specifierWithSpecifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)preheat
{
  PSSearchModelDataSource **p_dataSource;
  id WeakRetained;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *rootEntries;
  id v8;
  char v9;
  id v10;
  void *v11;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (!WeakRetained)
    NSLog(CFSTR("Error: %@ was asked to preheat but does not have a data source!"), self);
  if (!self->_hasLoadedRootEntries)
  {
    -[PSSearchModel _rootSpecifiers](self, "_rootSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      SearchEntriesFromSpecifiers(v5, 0, 0);
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      rootEntries = self->_rootEntries;
      self->_rootEntries = v6;

      v8 = objc_loadWeakRetained((id *)p_dataSource);
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)p_dataSource);
        v11 = (void *)objc_msgSend(v10, "rootSearchControllerClassForSearchModel:", self);

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "formatSearchEntries:parent:", self->_rootEntries, 0);
      }
      self->_hasLoadedRootEntries = 1;
    }

  }
  if (-[NSMutableArray count](self->_rootEntries, "count"))
    -[PSSearchModel _beginIndexingIfNecessary](self, "_beginIndexingIfNecessary");
}

- (void)addDelegate:(id)a3
{
  NSMutableSet *delegates;
  id v4;

  if (a3)
  {
    delegates = self->_delegates;
    +[PSWeakReference weakReferenceWithObject:](PSWeakReference, "weakReferenceWithObject:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](delegates, "addObject:", v4);

  }
}

- (void)removeDelegate:(id)a3
{
  if (a3)
    -[NSMutableSet removeObject:](self->_delegates, "removeObject:");
}

- (void)_enumerateDelegatesUsingBlock:(id)a3
{
  id v4;
  NSMutableSet *delegates;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    delegates = self->_delegates;
    v7[1] = 3221225472;
    v7[2] = __47__PSSearchModel__enumerateDelegatesUsingBlock___block_invoke;
    v7[3] = &unk_1E4A677A0;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[NSMutableSet enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

void __47__PSSearchModel__enumerateDelegatesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

- (id)_searchEntriesForSpecifierDataSource:(id)a3
{
  return -[NSMapTable objectForKey:](self->_specifierDataSources, "objectForKey:", a3);
}

- (void)_addSpecifierDataSource:(id)a3 forSearchEntry:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_specifierDataSources, "objectForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_specifierDataSources, "setObject:forKey:", v7, v8);
  }
  objc_msgSend(v7, "addObject:", v6);
  objc_msgSend(v8, "addObserver:", self);

}

- (void)addRootSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_hasLoadedRootEntries)
  {
    SearchEntryFromSpecifier(v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_initWeak(&location, self->_rootEntries);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __34__PSSearchModel_addRootSpecifier___block_invoke;
      v8[3] = &unk_1E4A67270;
      objc_copyWeak(&v10, &location);
      v9 = v6;
      -[PSSearchModel _addSearchEntries:parent:usingBlock:](self, "_addSearchEntries:parent:usingBlock:", v7, 0, v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }

  }
}

void __34__PSSearchModel_addRootSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)reloadRootSpecifier:(id)a3
{
  id v4;

  v4 = a3;
  -[PSSearchModel removeRootSpecifier:](self, "removeRootSpecifier:", v4);
  -[PSSearchModel addRootSpecifier:](self, "addRootSpecifier:", v4);

}

- (void)removeRootSpecifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasLoadedRootEntries)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_rootEntries;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v19;
LABEL_4:
      v10 = 0;
      v16 = v8 + v7;
      while (1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
          break;
        if (v7 == ++v10)
        {
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          v8 = v16;
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }

      if ((v8 ^ 0x7FFFFFFFFFFFFFFFLL) == v10)
        goto LABEL_12;
      -[NSMutableArray objectAtIndexedSubscript:](self->_rootEntries, "objectAtIndexedSubscript:", v8 + v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __37__PSSearchModel_removeRootSpecifier___block_invoke;
      v17[3] = &unk_1E4A677C8;
      v17[4] = self;
      v17[5] = v8 + v10;
      -[PSSearchModel _removeSearchEntries:usingBlock:](self, "_removeSearchEntries:usingBlock:", v15, v17);

    }
    else
    {
LABEL_10:

LABEL_12:
      NSLog(CFSTR("Error: no root search entry found for specifier %@!"), v4);
    }
  }

}

uint64_t __37__PSSearchModel_removeRootSpecifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", *(_QWORD *)(a1 + 40));
}

- (void)_addSearchEntries:(id)a3 parent:(id)a4 usingBlock:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  void *v11;
  NSObject *searchStateAccessQueue;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  PSSearchModel *v18;
  id v19;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = a4;
  -[PSSearchModel currentQuery](self, "currentQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    searchStateAccessQueue = self->_searchStateAccessQueue;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __53__PSSearchModel__addSearchEntries_parent_usingBlock___block_invoke;
    v17 = &unk_1E4A655B8;
    v18 = self;
    v13 = v8;
    v19 = v13;
    dispatch_async(searchStateAccessQueue, &v14);

    v9[2](v9);
    -[PSSearchModel _beginSearchingEntriesForCurrentQuery:newSearch:](self, "_beginSearchingEntriesForCurrentQuery:newSearch:", v13, 0, v14, v15, v16, v17, v18);
  }
  else
  {
    v9[2](v9);
  }
  -[PSSearchModel _updatedEntry:withChildren:](self, "_updatedEntry:withChildren:", v10, v8);

}

uint64_t __53__PSSearchModel__addSearchEntries_parent_usingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "unionSet:", *(_QWORD *)(a1 + 40));
}

- (void)_removeSearchEntries:(id)a3 usingBlock:(id)a4
{
  -[PSSearchModel _removeSearchEntries:usingBlock:forReload:](self, "_removeSearchEntries:usingBlock:forReload:", a3, a4, 0);
}

- (void)_removeSearchEntries:(id)a3 usingBlock:(id)a4 forReload:(BOOL)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  NSObject *searchStateAccessQueue;
  NSMutableSet *removedEntriesStillIndexing;
  void *v14;
  PSSearchResults *currentResults;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  _QWORD block[5];
  id v24;

  v8 = a3;
  v9 = (void (**)(_QWORD))a4;
  -[PSSearchModel currentQuery](self, "currentQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    searchStateAccessQueue = self->_searchStateAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke;
    block[3] = &unk_1E4A655B8;
    block[4] = self;
    v24 = v8;
    dispatch_async(searchStateAccessQueue, block);

  }
  if (!a5)
  {
    removedEntriesStillIndexing = self->_removedEntriesStillIndexing;
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke_2;
    v22[3] = &unk_1E4A677F0;
    v22[4] = self;
    objc_msgSend(v8, "objectsPassingTest:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet unionSet:](removedEntriesStillIndexing, "unionSet:", v14);

  }
  v9[2](v9);
  if (v10)
  {
    currentResults = self->_currentResults;
    objc_msgSend(v8, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PSSearchResults removeEntries:](currentResults, "removeEntries:", v16);

    if (v17)
    {
      -[PSSearchResults sortResults](self->_currentResults, "sortResults");
      -[PSSearchModel currentResults](self, "currentResults");
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke_3;
      v19[3] = &unk_1E4A67818;
      v19[4] = self;
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v10;
      v18 = v20;
      -[PSSearchModel _enumerateDelegatesUsingBlock:](self, "_enumerateDelegatesUsingBlock:", v19);

    }
  }

}

uint64_t __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "unionSet:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", a2);
}

void __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "searchModel:updatedWithNewResults:forQuery:", a1[4], a1[5], a1[6]);

}

- (void)_reloadSearchEntries:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__PSSearchModel__reloadSearchEntries___block_invoke;
  v3[3] = &unk_1E4A67840;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

void __38__PSSearchModel__reloadSearchEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(v3, "childEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_msgSend(v4, "copy");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__PSSearchModel__reloadSearchEntries___block_invoke_2;
    v7[3] = &unk_1E4A654F0;
    v8 = v4;
    objc_msgSend(v5, "_removeSearchEntries:usingBlock:forReload:", v6, v7, 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "_loadChildrenForEntry:", v3);

}

uint64_t __38__PSSearchModel__reloadSearchEntries___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

- (void)_performDeferredUpdatesForEntry:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *deferredSpecifierUpdates;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_deferredSpecifierUpdates, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0x7FFFFFFFFFFFFFFFLL;
  deferredSpecifierUpdates = self->_deferredSpecifierUpdates;
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke;
  v25[3] = &unk_1E4A67868;
  v8 = v4;
  v26 = v8;
  v9 = v5;
  v27 = v9;
  v28 = &v29;
  -[NSMutableArray enumerateObjectsUsingBlock:](deferredSpecifierUpdates, "enumerateObjectsUsingBlock:", v25);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_2;
  v22[3] = &unk_1E4A67890;
  v11 = v8;
  v23 = v11;
  v12 = v10;
  v24 = v12;
  v13 = (void *)MEMORY[0x1A8594D10](v22);
  if (v30[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_3;
    v20[3] = &unk_1E4A678B8;
    v21 = v13;
    objc_msgSend(v9, "enumerateObjectsAtIndexes:options:usingBlock:", v14, 0, v20);
    objc_msgSend(v9, "removeObjectsAtIndexes:", v14);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_4;
  v17[3] = &unk_1E4A678E0;
  v17[4] = self;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v15;
  v16 = v13;
  v19 = v16;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);
  if (objc_msgSend(v12, "count"))
    -[NSMutableArray removeObjectsInArray:](self->_deferredSpecifierUpdates, "removeObjectsInArray:", v12);

  _Block_object_dispose(&v29, 8);
}

void __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "searchEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    if (objc_msgSend(v5, "invalidatedSpecifiers"))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "count") - 1;
  }

}

void __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "searchEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v6, "searchEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

uint64_t __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "invalidatedSpecifiers"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_reloadSearchEntries:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v9, "specifierUpdates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v9, "specifierUpdates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_performSpecifierUpdates:forSearchEntries:", v8, *(_QWORD *)(a1 + 40));

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)hasCompletedIndexing
{
  return self->_hasStartedIndexing && !self->_indexing;
}

- (void)_beginIndexingIfNecessary
{
  uint64_t v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_hasStartedIndexing)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_hasStartedIndexing = 1;
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __42__PSSearchModel__beginIndexingIfNecessary__block_invoke;
    v13[3] = &unk_1E4A67908;
    v13[4] = self;
    -[PSSearchModel _enumerateDelegatesUsingBlock:](self, "_enumerateDelegatesUsingBlock:", v13);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_rootEntries;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[PSSearchModel _loadChildrenForEntry:](self, "_loadChildrenForEntry:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
      }
      while (v6);
    }

  }
}

void __42__PSSearchModel__beginIndexingIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "searchModelWillBeginIndexing:", *(_QWORD *)(a1 + 32));

}

- (void)_loadChildrenForEntry:(id)a3
{
  id v4;
  PSSearchIndexOperation *v5;
  void *v6;
  void *v7;
  NSMutableSet *entriesBeingIndexed;
  id v9;
  NSOperationQueue *indexOperationQueue;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PSSearchIndexOperation initWithSearchEntry:delegate:]([PSSearchIndexOperation alloc], "initWithSearchEntry:delegate:", v4, self);
  if (v5)
  {
    self->_indexing = 1;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    objc_msgSend(v4, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyForKey:", CFSTR("dataSourceClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    entriesBeingIndexed = self->_entriesBeingIndexed;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __39__PSSearchModel__loadChildrenForEntry___block_invoke;
    v15 = &unk_1E4A67930;
    v9 = v7;
    v16 = v9;
    v17 = &v18;
    -[NSMutableSet enumerateObjectsUsingBlock:](entriesBeingIndexed, "enumerateObjectsUsingBlock:", &v12);
    if (!*((_BYTE *)v19 + 24))
    {
      -[NSMutableSet addObject:](self->_entriesBeingIndexed, "addObject:", v4, v12, v13, v14, v15);
      -[PSSearchIndexOperation setQueuePriority:](v5, "setQueuePriority:", -4);
      indexOperationQueue = self->_indexOperationQueue;
      v22[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOperationQueue addOperations:waitUntilFinished:](indexOperationQueue, "addOperations:waitUntilFinished:", v11, self->_waitUntilFinished);

    }
    _Block_object_dispose(&v18, 8);
  }

}

void __39__PSSearchModel__loadChildrenForEntry___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a2, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("dataSourceClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_updatedEntry:(id)a3 withChildren:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[NSMutableSet containsObject:](self->_removedEntriesStillIndexing, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->_removedEntriesStillIndexing, "removeObject:", v6);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          -[PSSearchModel _loadChildrenForEntry:](self, "_loadChildrenForEntry:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)_finishedIndexingEntry:(id)a3
{
  NSMutableSet *entriesBeingIndexed;
  id v5;
  uint64_t v6;
  _QWORD v7[5];

  entriesBeingIndexed = self->_entriesBeingIndexed;
  v5 = a3;
  -[NSMutableSet removeObject:](entriesBeingIndexed, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_indexingEntriesWithLoadedDataSources, "removeObject:", v5);
  -[PSSearchModel _performDeferredUpdatesForEntry:](self, "_performDeferredUpdatesForEntry:", v5);

  if (!-[NSMutableSet count](self->_entriesBeingIndexed, "count"))
  {
    v6 = MEMORY[0x1E0C809B0];
    self->_indexing = 0;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __40__PSSearchModel__finishedIndexingEntry___block_invoke;
    v7[3] = &unk_1E4A67908;
    v7[4] = self;
    -[PSSearchModel _enumerateDelegatesUsingBlock:](self, "_enumerateDelegatesUsingBlock:", v7);
  }
}

void __40__PSSearchModel__finishedIndexingEntry___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "searchModelDidFinishIndexing:", *(_QWORD *)(a1 + 32));

}

- (void)searchIndexOperation:(id)a3 didFindSpecifierDataSource:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "searchEntry");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_indexingEntriesWithLoadedDataSources, "addObject:", v7);
  -[PSSearchModel _addSpecifierDataSource:forSearchEntry:](self, "_addSpecifierDataSource:forSearchEntry:", v6, v7);

}

- (void)searchIndexOperationDidFinish:(id)a3 searchEntries:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v6 = a4;
  objc_msgSend(a3, "searchEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __61__PSSearchModel_searchIndexOperationDidFinish_searchEntries___block_invoke;
    v13 = &unk_1E4A655B8;
    v14 = v7;
    v15 = v8;
    v9 = v8;
    -[PSSearchModel _addSearchEntries:parent:usingBlock:](self, "_addSearchEntries:parent:usingBlock:", v9, v14, &v10);

  }
  -[PSSearchModel _finishedIndexingEntry:](self, "_finishedIndexingEntry:", v7, v10, v11, v12, v13);

}

void __61__PSSearchModel_searchIndexOperationDidFinish_searchEntries___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "childEntries");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", *(_QWORD *)(a1 + 40));

}

- (void)searchIndexOperationDidCancel:(id)a3
{
  id v4;

  objc_msgSend(a3, "searchEntry");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PSSearchModel _finishedIndexingEntry:](self, "_finishedIndexingEntry:", v4);

}

- (BOOL)isLoadingResults
{
  return -[NSOperationQueue operationCount](self->_searchOperationQueue, "operationCount") != 0;
}

- (PSSearchResults)currentResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[PSSearchModel activeSearchOperation](self, "activeSearchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "currentResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isNewQuery") & 1) != 0
      || (-[PSSearchModel currentQuery](self, "currentQuery"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isEqualToString:", self->_queryForCurrentResults),
          v6,
          (v7 & 1) == 0))
    {
      v8 = v5;
    }
    else
    {
      objc_msgSend(v5, "resultsByMergingWithResults:", self->_currentResults);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sortResults");
    }

  }
  else
  {
    v8 = (id)-[PSSearchResults copy](self->_currentResults, "copy");
  }

  return (PSSearchResults *)v8;
}

- (void)searchForQuery:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PSSearchModel preheat](self, "preheat");
  -[PSSearchModel currentQuery](self, "currentQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v5 & 1) == 0)
  {
    -[PSSearchModel setCurrentQuery:](self, "setCurrentQuery:", v7);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_rootEntries);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSearchModel _beginSearchingEntriesForCurrentQuery:newSearch:](self, "_beginSearchingEntriesForCurrentQuery:newSearch:", v6, 1);

  }
}

- (id)_defaultSearchResultsSectionComparator
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_rootEntries);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PSSearchModel__defaultSearchResultsSectionComparator__block_invoke;
  v6[3] = &unk_1E4A67958;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");

  return v4;
}

uint64_t __55__PSSearchModel__defaultSearchResultsSectionComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "rootEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL && v10 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_14;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v13 = -1;
    else
      v13 = 1;
  }
  else
  {
    if (v9 == v10)
    {
LABEL_14:
      objc_msgSend(v5, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "localizedCaseInsensitiveCompare:", v15);

      goto LABEL_15;
    }
    if (v9 > v10)
      v13 = 1;
    else
      v13 = -1;
  }
LABEL_15:

  return v13;
}

- (void)_cancelAllSearchOperations
{
  NSObject *searchStateAccessQueue;
  _QWORD block[5];

  -[NSOperationQueue cancelAllOperations](self->_searchOperationQueue, "cancelAllOperations");
  -[PSSearchModel setActiveSearchOperation:](self, "setActiveSearchOperation:", 0);
  searchStateAccessQueue = self->_searchStateAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PSSearchModel__cancelAllSearchOperations__block_invoke;
  block[3] = &unk_1E4A654F0;
  block[4] = self;
  dispatch_async(searchStateAccessQueue, block);
}

uint64_t __43__PSSearchModel__cancelAllSearchOperations__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
}

- (void)_beginSearchingEntriesForCurrentQuery:(id)a3 newSearch:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  PSSearchOperation *v8;
  NSOperationQueue *searchOperationQueue;
  void *v10;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
    -[PSSearchModel _cancelAllSearchOperations](self, "_cancelAllSearchOperations");
  -[PSSearchModel currentQuery](self, "currentQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = -[PSSearchOperation initWithSearchQuery:rootEntries:]([PSSearchOperation alloc], "initWithSearchQuery:rootEntries:", v7, v6);
    -[PSSearchOperation setDelegate:](v8, "setDelegate:", self);
    -[PSSearchOperation setNewQuery:](v8, "setNewQuery:", v4);
    searchOperationQueue = self->_searchOperationQueue;
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue addOperations:waitUntilFinished:](searchOperationQueue, "addOperations:waitUntilFinished:", v10, self->_waitUntilFinished);

  }
  else
  {
    -[PSSearchModel _updateWithNewSearchResults:forQuery:newSearch:](self, "_updateWithNewSearchResults:forQuery:newSearch:", 0, v7, 1);
  }

}

- (void)_updateWithNewSearchResults:(id)a3 forQuery:(id)a4 newSearch:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSString *v12;
  NSString *queryForCurrentResults;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v5)
  {
    v12 = (NSString *)objc_msgSend(v10, "copy");
    queryForCurrentResults = self->_queryForCurrentResults;
    self->_queryForCurrentResults = v12;

    objc_storeStrong((id *)&self->_currentResults, a3);
  }
  else
  {
    -[PSSearchResults mergeWithResults:](self->_currentResults, "mergeWithResults:", v9);
    -[PSSearchResults sortResults](self->_currentResults, "sortResults");
  }
  -[PSSearchModel currentResults](self, "currentResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__PSSearchModel__updateWithNewSearchResults_forQuery_newSearch___block_invoke;
  v17[3] = &unk_1E4A67818;
  v17[4] = self;
  v18 = v14;
  v19 = v11;
  v15 = v11;
  v16 = v14;
  -[PSSearchModel _enumerateDelegatesUsingBlock:](self, "_enumerateDelegatesUsingBlock:", v17);

}

uint64_t __64__PSSearchModel__updateWithNewSearchResults_forQuery_newSearch___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "searchModel:updatedWithNewResults:forQuery:", a1[4], a1[5], a1[6]);
}

- (void)searchOperationDidBegin:(id)a3
{
  id v4;
  NSObject *searchStateAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PSSearchModel setActiveSearchOperation:](self, "setActiveSearchOperation:", v4);
  searchStateAccessQueue = self->_searchStateAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PSSearchModel_searchOperationDidBegin___block_invoke;
  v7[3] = &unk_1E4A655B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(searchStateAccessQueue, v7);

}

void __41__PSSearchModel_searchOperationDidBegin___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "rootEntries");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "minusSet:", v2);

}

- (void)searchOperation:(id)a3 configureSearchResults:(id)a4
{
  id v6;
  NSObject *searchStateAccessQueue;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  PSSearchModel *v13;

  v6 = a4;
  searchStateAccessQueue = self->_searchStateAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PSSearchModel_searchOperation_configureSearchResults___block_invoke;
  block[3] = &unk_1E4A655B8;
  v10 = v6;
  v12 = v10;
  v13 = self;
  v8 = a3;
  dispatch_sync(searchStateAccessQueue, block);
  LODWORD(searchStateAccessQueue) = objc_msgSend(v8, "isNewQuery");

  if ((_DWORD)searchStateAccessQueue)
  {
    -[PSSearchModel _defaultSearchResultsSectionComparator](self, "_defaultSearchResultsSectionComparator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSectionComparator:", v9);

    objc_msgSend(v10, "sortResults");
  }

}

void __56__PSSearchModel_searchOperation_configureSearchResults___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PSSearchModel_searchOperation_configureSearchResults___block_invoke_2;
  v6[3] = &unk_1E4A677F0;
  v7 = *(id *)(a1 + 32);
  v2 = (void *)MEMORY[0x1A8594D10](v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectsPassingTest:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectsPassingTest:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "minusSet:", v5);

}

uint64_t __56__PSSearchModel_searchOperation_configureSearchResults___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEntry:", a2);
}

- (id)searchOperation:(id)a3 filteredEntriesForEntries:(id)a4
{
  id v5;
  NSObject *searchStateAccessQueue;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  searchStateAccessQueue = self->_searchStateAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PSSearchModel_searchOperation_filteredEntriesForEntries___block_invoke;
  block[3] = &unk_1E4A67980;
  block[4] = self;
  v12 = v5;
  v13 = &v14;
  v7 = v5;
  dispatch_sync(searchStateAccessQueue, block);
  v8 = (void *)v15[5];
  if (!v8)
    v8 = v7;
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __59__PSSearchModel_searchOperation_filteredEntriesForEntries___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1[4] + 80), "count") || objc_msgSend(*(id *)(a1[4] + 88), "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", a1[5]);
    objc_msgSend(v2, "minusSet:", *(_QWORD *)(a1[4] + 80));
    objc_msgSend(v2, "minusSet:", *(_QWORD *)(a1[4] + 88));
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)searchOperationDidFinish:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *searchStateAccessQueue;
  _QWORD v12[5];
  _QWORD v13[5];

  v6 = a3;
  v7 = a4;
  -[PSSearchModel activeSearchOperation](self, "activeSearchOperation");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
    -[PSSearchModel setActiveSearchOperation:](self, "setActiveSearchOperation:", 0);
  objc_msgSend(v6, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSearchModel _updateWithNewSearchResults:forQuery:newSearch:](self, "_updateWithNewSearchResults:forQuery:newSearch:", v7, v9, objc_msgSend(v6, "isNewQuery"));

  if (!-[NSOperationQueue operationCount](self->_searchOperationQueue, "operationCount"))
  {
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__PSSearchModel_searchOperationDidFinish_withResults___block_invoke;
    v13[3] = &unk_1E4A67908;
    v13[4] = self;
    -[PSSearchModel _enumerateDelegatesUsingBlock:](self, "_enumerateDelegatesUsingBlock:", v13);
    searchStateAccessQueue = self->_searchStateAccessQueue;
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __54__PSSearchModel_searchOperationDidFinish_withResults___block_invoke_2;
    v12[3] = &unk_1E4A654F0;
    v12[4] = self;
    dispatch_async(searchStateAccessQueue, v12);
  }

}

void __54__PSSearchModel_searchOperationDidFinish_withResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "searchModelDidFinishQuery:", *(_QWORD *)(a1 + 32));

}

uint64_t __54__PSSearchModel_searchOperationDidFinish_withResults___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
}

- (void)searchOperationDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSSearchModel activeSearchOperation](self, "activeSearchOperation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[PSSearchModel setActiveSearchOperation:](self, "setActiveSearchOperation:", 0);
}

- (int64_t)observerType
{
  return 2;
}

- (void)_performSpecifierUpdates:(id)a3 forSearchEntries:(id)a4
{
  void *v6;
  id v7;
  id v8;
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
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  PSSearchModel *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "updates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v8, "updates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v8, "updates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithCapacity:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke;
  v29[3] = &unk_1E4A679A8;
  v18 = v10;
  v30 = v18;
  v19 = v16;
  v31 = v19;
  v20 = v13;
  v32 = v20;
  objc_msgSend(v8, "enumerateUpdatesUsingBlock:", v29);

  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_2;
  v24[3] = &unk_1E4A679D0;
  v25 = v18;
  v26 = self;
  v27 = v20;
  v28 = v19;
  v21 = v19;
  v22 = v20;
  v23 = v18;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24);

}

void __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "specifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "operation");

  if (v4 == 4)
  {
    v6 = *(void **)(a1 + 48);
LABEL_7:
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    goto LABEL_8;
  }
  if (v4 == 3)
  {
    v6 = *(void **)(a1 + 40);
    goto LABEL_7;
  }
  v5 = v8;
  if (v4 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
LABEL_8:
    v5 = v8;
  }

}

void __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_2(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v3 = a2;
  v4 = objc_msgSend(a1[4], "count");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    SearchEntriesFromSpecifiers(a1[4], v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v9 = a1[5];
      v25[0] = v5;
      v25[1] = 3221225472;
      v25[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_3;
      v25[3] = &unk_1E4A655B8;
      v26 = v3;
      v27 = v8;
      objc_msgSend(v9, "_addSearchEntries:parent:usingBlock:", v27, v26, v25);

    }
  }
  if (objc_msgSend(a1[6], "count"))
  {
    objc_msgSend(v3, "childEntries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_4;
    v23[3] = &unk_1E4A677F0;
    v24 = a1[6];
    objc_msgSend(v10, "objectsPassingTest:", v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v12 = a1[5];
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_5;
      v20[3] = &unk_1E4A655B8;
      v21 = v3;
      v22 = v11;
      objc_msgSend(v12, "_removeSearchEntries:usingBlock:", v22, v20);

    }
  }
  if (objc_msgSend(a1[7], "count"))
  {
    objc_msgSend(v3, "childEntries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    v16 = 3221225472;
    v17 = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_6;
    v18 = &unk_1E4A677F0;
    v19 = a1[7];
    objc_msgSend(v13, "objectsPassingTest:", &v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count", v15, v16, v17, v18))
      objc_msgSend(a1[5], "_reloadSearchEntries:", v14);

  }
}

void __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "childEntries");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", *(_QWORD *)(a1 + 40));

}

uint64_t __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "childEntries");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minusSet:", *(_QWORD *)(a1 + 40));

}

uint64_t __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)dataSource:(id)a3 performUpdates:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PSSearchModel _searchEntriesForSpecifierDataSource:](self, "_searchEntriesForSpecifierDataSource:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intersectSet:", self->_indexingEntriesWithLoadedDataSources);
    objc_msgSend(v8, "minusSet:", v9);
    if (objc_msgSend(v8, "count"))
      -[PSSearchModel _performSpecifierUpdates:forSearchEntries:](self, "_performSpecifierUpdates:forSearchEntries:", v6, v8);
    if (objc_msgSend(v9, "count"))
    {
      +[_PSDeferredUpdates deferredUpdatesWithEntries:specifierUpdates:](_PSDeferredUpdates, "deferredUpdatesWithEntries:specifierUpdates:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_deferredSpecifierUpdates, "addObject:", v10);

    }
  }
  else
  {
    NSLog(CFSTR("Error: could not find search entry for observed data source %@"), v11);
  }

}

- (void)invalidateSpecifiersForDataSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PSSearchModel _searchEntriesForSpecifierDataSource:](self, "_searchEntriesForSpecifierDataSource:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intersectSet:", self->_indexingEntriesWithLoadedDataSources);
    objc_msgSend(v5, "minusSet:", v6);
    if (objc_msgSend(v5, "count"))
      -[PSSearchModel _reloadSearchEntries:](self, "_reloadSearchEntries:", v5);
    if (objc_msgSend(v6, "count"))
    {
      +[_PSDeferredUpdates deferredInvalidationUpdatesWithEntries:](_PSDeferredUpdates, "deferredInvalidationUpdatesWithEntries:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_deferredSpecifierUpdates, "addObject:", v7);

    }
  }
  else
  {
    NSLog(CFSTR("Error: could not find search entry for observed data source %@"), v8);
  }

}

- (id)recursiveDescription
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_rootEntries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "recursiveDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("<%@ %p> entries:\n%@"), objc_opt_class(), self, v3);

  return v10;
}

- (PSSearchModelDataSource)dataSource
{
  return (PSSearchModelDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSString)currentQuery
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCurrentQuery:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (BOOL)isIndexing
{
  return self->_indexing;
}

- (BOOL)waitUntilFinished
{
  return self->_waitUntilFinished;
}

- (void)setWaitUntilFinished:(BOOL)a3
{
  self->_waitUntilFinished = a3;
}

- (PSSearchOperation)activeSearchOperation
{
  return (PSSearchOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setActiveSearchOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)showSectionInDetailText
{
  return self->_showSectionInDetailText;
}

- (void)setShowSectionInDetailText:(BOOL)a3
{
  self->_showSectionInDetailText = a3;
}

- (NSArray)rootEntries
{
  return &self->_rootEntries->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSearchOperation, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_searchOperationQueue, 0);
  objc_storeStrong((id *)&self->_indexOperationQueue, 0);
  objc_storeStrong((id *)&self->_searchStateAccessQueue, 0);
  objc_storeStrong((id *)&self->_removedEntriesStillSearching, 0);
  objc_storeStrong((id *)&self->_entriesPendingSearch, 0);
  objc_storeStrong((id *)&self->_queryForCurrentResults, 0);
  objc_storeStrong((id *)&self->_currentResults, 0);
  objc_storeStrong((id *)&self->_deferredSpecifierUpdates, 0);
  objc_storeStrong((id *)&self->_removedEntriesStillIndexing, 0);
  objc_storeStrong((id *)&self->_indexingEntriesWithLoadedDataSources, 0);
  objc_storeStrong((id *)&self->_entriesBeingIndexed, 0);
  objc_storeStrong((id *)&self->_rootEntries, 0);
  objc_storeStrong((id *)&self->_specifierDataSources, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
