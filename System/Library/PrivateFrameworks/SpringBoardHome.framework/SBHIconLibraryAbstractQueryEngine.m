@implementation SBHIconLibraryAbstractQueryEngine

- (SBHIconLibraryAbstractQueryEngine)initWithIconModel:(id)a3
{
  id v5;
  SBHIconLibraryAbstractQueryEngine *v6;
  SBHIconLibraryAbstractQueryEngine *v7;
  uint64_t v8;
  NSHashTable *executingQueryContexts;
  objc_class *v10;
  void *v11;
  id v12;
  uint64_t v13;
  OS_dispatch_queue *processingQueue;
  void *v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBHIconLibraryAbstractQueryEngine;
  v6 = -[SBHIconLibraryAbstractQueryEngine init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconModel, a3);
    -[SBHIconLibraryAbstractQueryEngine _setupNotifications](v7, "_setupNotifications");
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    executingQueryContexts = v7->_executingQueryContexts;
    v7->_executingQueryContexts = (NSHashTable *)v8;

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.processingQueue."), "stringByAppendingString:", v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "UTF8String");
    v13 = BSDispatchQueueCreateWithQualityOfService();
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v13;

    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addMonitor:subjectMask:subscriptionOptions:", v7, 1, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_appPrototectionSubjectMonitorSubscription, v16);

  }
  return v7;
}

- (SBHIconLibraryAbstractQueryEngine)init
{

  return 0;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
  objc_msgSend(WeakRetained, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SBHIconLibraryAbstractQueryEngine;
  -[SBHIconLibraryAbstractQueryEngine dealloc](&v4, sel_dealloc);
}

- (BOOL)_processingQueue_isIconModelReloading
{
  return self->_iconModelIsReloading;
}

- (void)_setupNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SBHIconLibraryAbstractQueryEngine__setupNotifications__block_invoke;
  block[3] = &unk_1E8D84C50;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __56__SBHIconLibraryAbstractQueryEngine__setupNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(v2 + 16);
  objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__iconModelNeedsIconAdded_, CFSTR("SBIconModelDidAddIconNotification"), v3);
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__iconModelNeedsIconReplaced_, CFSTR("SBIconModelDidReplaceIconNotification"), v3);
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__iconModelNeedsIconRemoved_, CFSTR("SBIconModelWillRemoveIconNotification"), v3);
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__iconModelWillReload_, CFSTR("SBIconModelWillReloadIconsNotification"), v3);
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__iconModelDidReload_, CFSTR("SBIconModelDidReloadIconsNotification"), v3);
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__iconModelVisibilityDidChange_, CFSTR("SBIconModelVisibilityDidChangeNotification"), v3);

}

- (void)_teardownNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SBHIconLibraryAbstractQueryEngine__teardownNotifications__block_invoke;
  block[3] = &unk_1E8D84C50;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __59__SBHIconLibraryAbstractQueryEngine__teardownNotifications__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SBHIconLibraryAbstractQueryEngine_addObserver___block_invoke;
  block[3] = &unk_1E8D88E90;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__SBHIconLibraryAbstractQueryEngine_addObserver___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = (void *)WeakRetained[4];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v6[4];
      v6[4] = v4;

      v3 = (void *)v6[4];
    }
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v6;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SBHIconLibraryAbstractQueryEngine_removeObserver___block_invoke;
  block[3] = &unk_1E8D88E90;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__SBHIconLibraryAbstractQueryEngine_removeObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[4], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)shutdown
{
  NSObject *processingQueue;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __45__SBHIconLibraryAbstractQueryEngine_shutdown__block_invoke;
  v7 = &unk_1E8D88B98;
  objc_copyWeak(&v8, &location);
  dispatch_async(processingQueue, &v4);
  -[SBHIconLibraryAbstractQueryEngine _teardownNotifications](self, "_teardownNotifications", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__SBHIconLibraryAbstractQueryEngine_shutdown__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
    *((_BYTE *)v3 + 40) = 1;
  }

}

- (BOOL)_processingQueue_isShutdown
{
  return self->_isShutdown;
}

- (BOOL)isShutdown
{
  NSObject *processingQueue;
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
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SBHIconLibraryAbstractQueryEngine_isShutdown__block_invoke;
  v5[3] = &unk_1E8D8D5B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SBHIconLibraryAbstractQueryEngine_isShutdown__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (void)_processingQueue_observerDispatchQueryResultsWereUpdated:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "engine:queryResultsWereUpdated:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_processingQueue_observerDispatchError:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "engine:failedToExecuteQuery:withError:", self, v7, v6);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_processingQueue_startNewQueryContext:(id)a3
{
  -[NSHashTable addObject:](self->_executingQueryContexts, "addObject:", a3);
}

- (id)_processingQueue_lastQueryResultForContext:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kLastQueryResultKey"));
}

- (void)_addItemsWithBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __107__SBHIconLibraryAbstractQueryEngine__addItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke;
    v10[3] = &unk_1E8D8D608;
    objc_copyWeak(&v12, &location);
    v11 = v9;
    v13 = a5;
    -[SBHIconLibraryAbstractQueryEngine _mapBundleIdentifiersToIcons:completion:](self, "_mapBundleIdentifiersToIcons:completion:", v8, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __107__SBHIconLibraryAbstractQueryEngine__addItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[6];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __107__SBHIconLibraryAbstractQueryEngine__addItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke_2;
    v7[3] = &unk_1E8D8D5E0;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    v11 = *(_BYTE *)(a1 + 48);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
  }

}

void __107__SBHIconLibraryAbstractQueryEngine__addItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_processingQueue_addIcons:iconLibraryQueryContext:notifyDelegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    WeakRetained = v3;
  }

}

- (void)_processingQueue_addIcons:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  SBHIconLibraryQueryResult *v17;
  id v18;

  v5 = a5;
  v18 = a4;
  v8 = a3;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kLastQueryResultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "icons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v14 = v13;

  objc_msgSend(v14, "unionSet:", v8);
  if ((objc_msgSend(v10, "isEqualToSet:", v14) & 1) == 0)
  {
    -[SBHIconLibraryAbstractQueryEngine _processingQueue_sortComperatorForQueryContext:](self, "_processingQueue_sortComperatorForQueryContext:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "query");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SBHIconLibraryQueryResult initWithQuery:icons:sortComparator:]([SBHIconLibraryQueryResult alloc], "initWithQuery:icons:sortComparator:", v16, v14, v15);
    -[SBHIconLibraryAbstractQueryEngine _processingQueue_noteQueryResultsWereUpdated:iconLibraryQueryContext:notifyDelegate:](self, "_processingQueue_noteQueryResultsWereUpdated:iconLibraryQueryContext:notifyDelegate:", v17, v18, v5);

  }
}

- (void)_processingQueue_noteQueryResultsWereUpdated:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;

  v5 = a5;
  v8 = a3;
  objc_msgSend(a4, "setObject:forKeyedSubscript:");
  if (v5)
    -[SBHIconLibraryAbstractQueryEngine _processingQueue_observerDispatchQueryResultsWereUpdated:](self, "_processingQueue_observerDispatchQueryResultsWereUpdated:", v8);

}

- (void)_processingQueue_removeItemsWithBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  SBHIconLibraryQueryResult *v21;
  _QWORD v22[4];
  id v23;

  v5 = a5;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kLastQueryResultKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "icons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_opt_new();
  v15 = v14;

  v16 = (void *)MEMORY[0x1E0CB3880];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __126__SBHIconLibraryAbstractQueryEngine__processingQueue_removeItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke;
  v22[3] = &unk_1E8D8D630;
  v17 = v9;
  v23 = v17;
  objc_msgSend(v16, "predicateWithBlock:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filterUsingPredicate:", v18);

  if ((objc_msgSend(v11, "isEqualToSet:", v15) & 1) == 0)
  {
    -[SBHIconLibraryAbstractQueryEngine _processingQueue_sortComperatorForQueryContext:](self, "_processingQueue_sortComperatorForQueryContext:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "query");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SBHIconLibraryQueryResult initWithQuery:icons:sortComparator:]([SBHIconLibraryQueryResult alloc], "initWithQuery:icons:sortComparator:", v20, v15, v19);
    -[SBHIconLibraryAbstractQueryEngine _processingQueue_noteQueryResultsWereUpdated:iconLibraryQueryContext:notifyDelegate:](self, "_processingQueue_noteQueryResultsWereUpdated:iconLibraryQueryContext:notifyDelegate:", v21, v8, v5);

  }
}

uint64_t __126__SBHIconLibraryAbstractQueryEngine__processingQueue_removeItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "leafIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (id)_processingQueue_sortComperatorForQueryContext:(id)a3
{
  return 0;
}

+ (id)_leafIdentifiersForBundleIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_mapBundleIdentifiersToIcons:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SBHIconLibraryAbstractQueryEngine__mapBundleIdentifiersToIcons_completion___block_invoke;
  v10[3] = &unk_1E8D8D658;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __77__SBHIconLibraryAbstractQueryEngine__mapBundleIdentifiersToIcons_completion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = a1[4];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*((id *)WeakRetained + 2), "leafIconForIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*((id *)WeakRetained + 2), "isIconVisible:", v9)
            && _SBIconIsLeafIconAndNotWidgetIcon(v9))
          {
            objc_msgSend(v3, "addObject:", v9);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    v10 = *((_QWORD *)WeakRetained + 6);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__SBHIconLibraryAbstractQueryEngine__mapBundleIdentifiersToIcons_completion___block_invoke_2;
    v15[3] = &unk_1E8D85C70;
    v11 = a1[5];
    v16 = v3;
    v17 = v11;
    v12 = v3;
    dispatch_async(v10, v15);

  }
  else
  {
    v13 = (void (**)(id, void *))a1[5];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v14);

  }
}

uint64_t __77__SBHIconLibraryAbstractQueryEngine__mapBundleIdentifiersToIcons_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_processingQueue_teardownQueryContext:(id)a3
{
  -[SBHIconLibraryAbstractQueryEngine _processingQueue_teardownQueryContext:removeContext:](self, "_processingQueue_teardownQueryContext:removeContext:", a3, 1);
}

- (void)_processingQueue_teardownQueryContext:(id)a3 removeContext:(BOOL)a4
{
  if (a4)
    -[NSHashTable removeObject:](self->_executingQueryContexts, "removeObject:", a3);
}

- (void)_iconModelNeedsIconAdded:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconAdded___block_invoke;
  block[3] = &unk_1E8D88E90;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconAdded___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[3];
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("icon"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 && _SBIconIsLeafIconAndNotWidgetIcon(v6))
      {
        v7 = (void *)objc_opt_class();
        v20 = v6;
        objc_msgSend(v6, "leafIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_leafIdentifiersForBundleIdentifier:", v8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v4, "allObjects");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v9)
        {
          v10 = v9;
          v22 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v29 != v22)
                objc_enumerationMutation(obj);
              v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              v24 = 0u;
              v25 = 0u;
              v26 = 0u;
              v27 = 0u;
              v13 = v23;
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v25;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v25 != v16)
                      objc_enumerationMutation(v13);
                    v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                    if (objc_msgSend(v3, "_processingQueue_isBundleIdentifierValid:iconLibraryQueryContext:", v18, v12))
                    {
                      v32 = v18;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v3, "_addItemsWithBundleIdentifiers:iconLibraryQueryContext:notifyDelegate:", v19, v12, 1);

                    }
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
                }
                while (v15);
              }

            }
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          }
          while (v10);
        }

        v6 = v20;
      }

    }
  }

}

- (void)_iconModelNeedsIconReplaced:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconReplaced___block_invoke;
  block[3] = &unk_1E8D88E90;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconReplaced___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id obj;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[3];
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("icon"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 && _SBIconIsLeafIconAndNotWidgetIcon(v6))
      {
        v7 = (void *)objc_opt_class();
        v17 = v6;
        objc_msgSend(v6, "leafIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_leafIdentifiersForBundleIdentifier:", v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v4, "allObjects");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v21)
        {
          v19 = *(_QWORD *)v28;
          v9 = MEMORY[0x1E0C809B0];
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v28 != v19)
                objc_enumerationMutation(obj);
              v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v3, "_processingQueue_removeItemsWithBundleIdentifiers:iconLibraryQueryContext:notifyDelegate:", v20, v11, 0);
              v25 = 0u;
              v26 = 0u;
              v23 = 0u;
              v24 = 0u;
              v12 = v20;
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v24;
                do
                {
                  for (j = 0; j != v14; ++j)
                  {
                    if (*(_QWORD *)v24 != v15)
                      objc_enumerationMutation(v12);
                    if (objc_msgSend(v3, "_processingQueue_isBundleIdentifierValid:iconLibraryQueryContext:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), v11))
                    {
                      v22[0] = v9;
                      v22[1] = 3221225472;
                      v22[2] = __65__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconReplaced___block_invoke_2;
                      v22[3] = &unk_1E8D8D680;
                      v22[4] = v3;
                      v22[5] = v11;
                      objc_msgSend(v3, "_mapBundleIdentifiersToIcons:completion:", v12, v22);
                    }
                  }
                  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                }
                while (v14);
              }

            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          }
          while (v21);
        }

        v6 = v17;
      }

    }
  }

}

uint64_t __65__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconReplaced___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processingQueue_addIcons:iconLibraryQueryContext:notifyDelegate:", a2, *(_QWORD *)(a1 + 40), 1);
}

- (void)_iconModelNeedsIconRemoved:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconRemoved___block_invoke;
  block[3] = &unk_1E8D88E90;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconRemoved___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("icon"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && _SBIconIsLeafIconAndNotWidgetIcon(v4))
    {
      objc_msgSend(v4, "leafIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_processingQueue_removeItemsWithBundleIdentifiers:", v6);

    }
  }

}

- (void)_iconModelWillReload:(id)a3
{
  NSObject *processingQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SBHIconLibraryAbstractQueryEngine__iconModelWillReload___block_invoke;
  v5[3] = &unk_1E8D88B98;
  objc_copyWeak(&v6, &location);
  dispatch_async(processingQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__SBHIconLibraryAbstractQueryEngine__iconModelWillReload___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _BYTE *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((id *)WeakRetained + 3);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v2, "_processingQueue_teardownQueryContext:removeContext:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), 0);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    v2[8] = 1;
    +[SBHIconLibraryQueryResult nullQueryResults](SBHIconLibraryQueryResult, "nullQueryResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_processingQueue_noteQueryResultsWereUpdated:iconLibraryQueryContext:notifyDelegate:", v9, 0, 1);

  }
}

- (void)_iconModelDidReload:(id)a3
{
  NSObject *processingQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SBHIconLibraryAbstractQueryEngine__iconModelDidReload___block_invoke;
  v5[3] = &unk_1E8D88B98;
  objc_copyWeak(&v6, &location);
  dispatch_async(processingQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__SBHIconLibraryAbstractQueryEngine__iconModelDidReload___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 8) = 0;
    v3 = WeakRetained[3];
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "query");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "executeQuery:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)_iconModelVisibilityDidChange:(id)a3
{
  NSObject *processingQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SBHIconLibraryAbstractQueryEngine__iconModelVisibilityDidChange___block_invoke;
  v5[3] = &unk_1E8D88B98;
  objc_copyWeak(&v6, &location);
  dispatch_async(processingQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__SBHIconLibraryAbstractQueryEngine__iconModelVisibilityDidChange___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[3];
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v2, "_processingQueue_teardownQueryContext:removeContext:", v9, 1);
          objc_msgSend(v9, "query");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "executeQuery:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)_processingQueue_isBundleIdentifierValid:(id)a3 iconLibraryQueryContext:(id)a4
{
  return 1;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *processingQueue;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        v13 = objc_opt_class();
        v14 = v12;
        if (v13)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
        }
        else
        {
          v15 = 0;
        }
        v16 = v15;

        objc_msgSend(v16, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SBHIconLibraryAbstractQueryEngine_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E8D88E90;
  objc_copyWeak(&v22, &location);
  v21 = v6;
  v19 = v6;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __82__SBHIconLibraryAbstractQueryEngine_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_processingQueue_removeItemsWithBundleIdentifiers:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_processingQueue_removeItemsWithBundleIdentifiers:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_executingQueryContexts;
  if (-[NSHashTable count](v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend((id)objc_opt_class(), "_leafIdentifiersForBundleIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSHashTable allObjects](v5, "allObjects", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[SBHIconLibraryAbstractQueryEngine _processingQueue_removeItemsWithBundleIdentifiers:iconLibraryQueryContext:notifyDelegate:](self, "_processingQueue_removeItemsWithBundleIdentifiers:iconLibraryQueryContext:notifyDelegate:", v6, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), 1);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

  }
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (APSubjectMonitorSubscription)appPrototectionSubjectMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
}

- (void)setAppPrototectionSubjectMonitorSubscription:(id)a3
{
  objc_storeWeak((id *)&self->_appPrototectionSubjectMonitorSubscription, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appPrototectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_executingQueryContexts, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

@end
