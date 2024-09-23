@implementation WBSUserDefinedContentBlockerManager

- (WBSUserDefinedContentBlockerManager)initWithDataStore:(id)a3
{
  id v5;
  WBSUserDefinedContentBlockerManager *v6;
  uint64_t v7;
  NSMutableSet *hostsWithLoadedPerSiteContentBlockers;
  uint64_t v9;
  NSHashTable *observers;
  WBSUserDefinedContentBlockerManager *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSUserDefinedContentBlockerManager;
  v6 = -[WBSUserDefinedContentBlockerManager init](&v16, sel_init);
  if (v6)
  {
    objc_initWeak(&location, v6);
    objc_storeStrong((id *)&v6->_dataStore, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    hostsWithLoadedPerSiteContentBlockers = v6->_hostsWithLoadedPerSiteContentBlockers;
    v6->_hostsWithLoadedPerSiteContentBlockers = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v9;

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__WBSUserDefinedContentBlockerManager_initWithDataStore___block_invoke;
    v13[3] = &unk_1E4B3D530;
    objc_copyWeak(&v14, &location);
    -[WBSUserDefinedContentBlockerManager getNumberOfContentBlockersThatContainActionsWithCompletionHandler:](v6, "getNumberOfContentBlockersThatContainActionsWithCompletionHandler:", v13);
    v11 = v6;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __57__WBSUserDefinedContentBlockerManager_initWithDataStore___block_invoke(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;
  _BYTE *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[41] = a2 != 0;
    if (a2)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_notifyDidUpdateAllRules");
      WeakRetained = v4;
    }
  }

}

- (id)_rulesJsonForContentBlocker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = v4;
  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v11, "typeString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "appendString:", CFSTR(", "));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "selector");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendString:", v14);

        objc_msgSend(v11, "typeString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_msgSend(CFSTR("["), "mutableCopy");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v5, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    v21 = 1;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        if ((v21 & 1) == 0)
          objc_msgSend(v16, "appendString:", CFSTR(","));
        objc_msgSend(v29, "host");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSUserDefinedContentBlockerManager _jsonStringForActionType:urlFilter:selectors:](self, "_jsonStringForActionType:urlFilter:selectors:", v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v26);

        v21 = 0;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      v21 = 0;
    }
    while (v19);
  }

  objc_msgSend(v16, "appendString:", CFSTR("]"));
  v27 = (void *)objc_msgSend(v16, "copy");

  return v27;
}

- (id)_jsonStringForActionType:(id)a3 urlFilter:(id)a4 selectors:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ \"trigger\": { \"url-filter\": \"%@\"}, \"action\": {\"type\": \"%@\", \"selector\": \"%@\" } }"), a4, a3, a5);
}

- (id)_identifierStringForContentBlocker:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.UserGeneratedContentBlockers.%@"), CFSTR("Global"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.Safari.UserGeneratedContentBlockers.%@"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)loadContentBlockerIfNeededForHost:(id)a3 loaderBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (self->_hasContentBlockerWithActions
    && objc_msgSend(v6, "length")
    && (-[NSMutableSet containsObject:](self->_hostsWithLoadedPerSiteContentBlockers, "containsObject:", v6) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_hostsWithLoadedPerSiteContentBlockers, "addObject:", v6);
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__WBSUserDefinedContentBlockerManager_loadContentBlockerIfNeededForHost_loaderBlock___block_invoke;
    v8[3] = &unk_1E4B3D580;
    objc_copyWeak(&v11, &location);
    v10 = v7;
    v9 = v6;
    -[WBSUserDefinedContentBlockerManager contentBlockerForHost:createIfNeeded:completionHandler:](self, "contentBlockerForHost:createIfNeeded:completionHandler:", v9, 0, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __85__WBSUserDefinedContentBlockerManager_loadContentBlockerIfNeededForHost_loaderBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__WBSUserDefinedContentBlockerManager_loadContentBlockerIfNeededForHost_loaderBlock___block_invoke_2;
  v5[3] = &unk_1E4B3D558;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v8 = a1[5];
  v7 = a1[4];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __85__WBSUserDefinedContentBlockerManager_loadContentBlockerIfNeededForHost_loaderBlock___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v6 = WeakRetained;
      v4 = objc_msgSend(v3, "databaseID");
      WeakRetained = v6;
      if (v4)
      {
        v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        WeakRetained = v6;
        if (v5 == 1)
        {
          objc_msgSend(v6[2], "removeObject:", *(_QWORD *)(a1 + 40));
          WeakRetained = v6;
        }
      }
    }
  }

}

- (void)resetLoadingStateOfContentBlockerForHost:(id)a3
{
  -[NSMutableSet removeObject:](self->_hostsWithLoadedPerSiteContentBlockers, "removeObject:", a3);
}

- (void)contentBlockerForHost:(id)a3 createIfNeeded:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  WBSUserDefinedContentBlockerSQLiteStore *dataStore;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    dataStore = self->_dataStore;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__WBSUserDefinedContentBlockerManager_contentBlockerForHost_createIfNeeded_completionHandler___block_invoke;
    v11[3] = &unk_1E4B3D5A8;
    v12 = v9;
    -[WBSUserDefinedContentBlockerSQLiteStore getPerSiteContentBlockerForHost:createIfNeeded:completionHandler:](dataStore, "getPerSiteContentBlockerForHost:createIfNeeded:completionHandler:", v8, v6, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __94__WBSUserDefinedContentBlockerManager_contentBlockerForHost_createIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__WBSUserDefinedContentBlockerManager_contentBlockerForHost_createIfNeeded_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4B2B998;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __94__WBSUserDefinedContentBlockerManager_contentBlockerForHost_createIfNeeded_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)globalContentBlockerWithCompletionHandler:(id)a3
{
  id v4;
  WBSUserDefinedContentBlockerSQLiteStore *dataStore;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B3D5A8;
  v8 = v4;
  v6 = v4;
  -[WBSUserDefinedContentBlockerSQLiteStore getGlobalContentBlockerWithCompletionHandler:](dataStore, "getGlobalContentBlockerWithCompletionHandler:", v7);

}

void __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E4B2B998;
    v4 = &v8;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_cold_1();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_20;
    v9[3] = &unk_1E4B2A6E0;
    v4 = &v10;
    v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v9);
  }

}

uint64_t __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getAllContentBlockerHostsWithCompletionHandler:(id)a3
{
  id v4;
  WBSUserDefinedContentBlockerSQLiteStore *dataStore;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__WBSUserDefinedContentBlockerManager_getAllContentBlockerHostsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A578;
  v8 = v4;
  v6 = v4;
  -[WBSUserDefinedContentBlockerSQLiteStore getAllContentBlockerHostsWithCompletionHandler:](dataStore, "getAllContentBlockerHostsWithCompletionHandler:", v7);

}

void __86__WBSUserDefinedContentBlockerManager_getAllContentBlockerHostsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__WBSUserDefinedContentBlockerManager_getAllContentBlockerHostsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E4B2B998;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __86__WBSUserDefinedContentBlockerManager_getAllContentBlockerHostsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getNumberOfContentBlockersThatContainActionsWithCompletionHandler:(id)a3
{
  id v4;
  WBSUserDefinedContentBlockerSQLiteStore *dataStore;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__WBSUserDefinedContentBlockerManager_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B3D5F8;
  v8 = v4;
  v6 = v4;
  -[WBSUserDefinedContentBlockerSQLiteStore getNumberOfContentBlockersThatContainActionsWithCompletionHandler:](dataStore, "getNumberOfContentBlockersThatContainActionsWithCompletionHandler:", v7);

}

void __105__WBSUserDefinedContentBlockerManager_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  _QWORD v3[4];
  id v4;
  int v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __105__WBSUserDefinedContentBlockerManager_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E4B3D5D0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __105__WBSUserDefinedContentBlockerManager_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)addActions:(id)a3 forContentBlocker:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "databaseID"))
  {
    if (objc_msgSend(v6, "count"))
    {
      if (objc_msgSend(v7, "databaseID") == 1)
      {
        objc_msgSend(v7, "actions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSUserDefinedContentBlockerManager _setCachedGlobalContentBlockerActions:](self, "_setCachedGlobalContentBlockerActions:", v9);

      }
      -[WBSUserDefinedContentBlockerSQLiteStore insertActions:forContentBlockerID:](self->_dataStore, "insertActions:forContentBlockerID:", v6, objc_msgSend(v7, "databaseID"));
      self->_hasContentBlockerWithActions = 1;
    }
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSUserDefinedContentBlockerManager addActions:forContentBlocker:].cold.1();
  }

}

- (void)deleteActionsForContentBlocker:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (objc_msgSend(v4, "databaseID"))
  {
    -[WBSUserDefinedContentBlockerSQLiteStore deleteActionsForContentBlockerID:](self->_dataStore, "deleteActionsForContentBlockerID:", objc_msgSend(v4, "databaseID"));
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSUserDefinedContentBlockerManager deleteActionsForContentBlocker:].cold.1();
  }

}

- (void)addCrossSiteContent:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (objc_msgSend(v4, "databaseID"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSUserDefinedContentBlockerManager addCrossSiteContent:].cold.1();
  }
  else
  {
    -[WBSUserDefinedContentBlockerSQLiteStore insertCrossSiteContent:](self->_dataStore, "insertCrossSiteContent:", v4);
  }

}

- (void)deleteUnassociatedCrossSiteContent
{
  -[WBSUserDefinedContentBlockerSQLiteStore deleteUnassociatedCrossSiteContent](self->_dataStore, "deleteUnassociatedCrossSiteContent");
}

- (void)getCrossSiteContentsForSourceURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  WBSUserDefinedContentBlockerSQLiteStore *dataStore;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  dataStore = self->_dataStore;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__WBSUserDefinedContentBlockerManager_getCrossSiteContentsForSourceURLString_completionHandler___block_invoke;
  v9[3] = &unk_1E4B2A578;
  v10 = v6;
  v8 = v6;
  -[WBSUserDefinedContentBlockerSQLiteStore getCrossSiteContentsWithSource:completionHandler:](dataStore, "getCrossSiteContentsWithSource:completionHandler:", a3, v9);

}

void __96__WBSUserDefinedContentBlockerManager_getCrossSiteContentsForSourceURLString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__WBSUserDefinedContentBlockerManager_getCrossSiteContentsForSourceURLString_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4B2B998;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __96__WBSUserDefinedContentBlockerManager_getCrossSiteContentsForSourceURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getAllContentBlockerActionsWithType:(id)a3 excludeHost:(id)a4 completion:(id)a5
{
  id v8;
  WBSUserDefinedContentBlockerSQLiteStore *dataStore;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  dataStore = self->_dataStore;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__WBSUserDefinedContentBlockerManager_getAllContentBlockerActionsWithType_excludeHost_completion___block_invoke;
  v11[3] = &unk_1E4B2A578;
  v12 = v8;
  v10 = v8;
  -[WBSUserDefinedContentBlockerSQLiteStore getAllContentBlockerActionsWithType:excludeHost:completion:](dataStore, "getAllContentBlockerActionsWithType:excludeHost:completion:", a3, a4, v11);

}

void __98__WBSUserDefinedContentBlockerManager_getAllContentBlockerActionsWithType_excludeHost_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__WBSUserDefinedContentBlockerManager_getAllContentBlockerActionsWithType_excludeHost_completion___block_invoke_2;
  v6[3] = &unk_1E4B2B998;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __98__WBSUserDefinedContentBlockerManager_getAllContentBlockerActionsWithType_excludeHost_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)associateAction:(id)a3 withCrossSiteContent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "databaseID") && objc_msgSend(v7, "databaseID"))
  {
    -[WBSUserDefinedContentBlockerSQLiteStore associateAction:withCrossSiteContentID:](self->_dataStore, "associateAction:withCrossSiteContentID:", v6, objc_msgSend(v7, "databaseID"));
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSUserDefinedContentBlockerManager associateAction:withCrossSiteContent:].cold.1(v8, v6, v7);
  }

}

- (void)_setCachedGlobalContentBlockerActions:(id)a3
{
  NSArray *v4;
  NSArray *cachedGlobalContentBlockerActions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  cachedGlobalContentBlockerActions = self->_cachedGlobalContentBlockerActions;
  self->_cachedGlobalContentBlockerActions = v4;

  self->_didLoadGlobalContentBlockerActions = 1;
}

- (void)getGlobalContentBlockerWithCompletionHandler:(id)a3
{
  id v4;
  WBSUserDefinedContentBlockerSQLiteStore *dataStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__WBSUserDefinedContentBlockerManager_getGlobalContentBlockerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B3D620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WBSUserDefinedContentBlockerSQLiteStore getGlobalContentBlockerWithCompletionHandler:](dataStore, "getGlobalContentBlockerWithCompletionHandler:", v7);

}

void __84__WBSUserDefinedContentBlockerManager_getGlobalContentBlockerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WBSUserDefinedContentBlockerManager_getGlobalContentBlockerWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4B2A0F0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__WBSUserDefinedContentBlockerManager_getGlobalContentBlockerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setCachedGlobalContentBlockerActions:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)deleteGlobalContentBlockerActionsWithSelectors:(id)a3 completionHandler:(id)a4
{
  id v6;
  WBSUserDefinedContentBlockerSQLiteStore *dataStore;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  dataStore = self->_dataStore;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__WBSUserDefinedContentBlockerManager_deleteGlobalContentBlockerActionsWithSelectors_completionHandler___block_invoke;
  v9[3] = &unk_1E4B3D620;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[WBSUserDefinedContentBlockerSQLiteStore deleteGlobalContentBlockerActionsWithSelectors:completionHandler:](dataStore, "deleteGlobalContentBlockerActionsWithSelectors:completionHandler:", a3, v9);

}

void __104__WBSUserDefinedContentBlockerManager_deleteGlobalContentBlockerActionsWithSelectors_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__WBSUserDefinedContentBlockerManager_deleteGlobalContentBlockerActionsWithSelectors_completionHandler___block_invoke_2;
  block[3] = &unk_1E4B2A0F0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __104__WBSUserDefinedContentBlockerManager_deleteGlobalContentBlockerActionsWithSelectors_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setCachedGlobalContentBlockerActions:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)resetDatabaseWithCompletionHandler:(id)a3
{
  id v4;
  WBSUserDefinedContentBlockerSQLiteStore *dataStore;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__WBSUserDefinedContentBlockerManager_resetDatabaseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B3D670;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[WBSUserDefinedContentBlockerSQLiteStore resetDatabaseWithCompletionHandler:](dataStore, "resetDatabaseWithCompletionHandler:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __74__WBSUserDefinedContentBlockerManager_resetDatabaseWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WBSUserDefinedContentBlockerManager_resetDatabaseWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4B3D648;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __74__WBSUserDefinedContentBlockerManager_resetDatabaseWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "removeAllObjects");
    v2 = WeakRetained[3];
    WeakRetained[3] = (id)MEMORY[0x1E0C9AA60];

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_notifyDidUpdateAllRules
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "userDefinedContentBlockerManagerDidUpdateAllRules:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)addUserDefinedContentBlockerObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeUserDefinedContentBlockerObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)didLoadGlobalContentBlockerActions
{
  return self->_didLoadGlobalContentBlockerActions;
}

- (BOOL)hasContentBlockerWithActions
{
  return self->_hasContentBlockerWithActions;
}

- (NSArray)cachedGlobalContentBlockerActions
{
  return self->_cachedGlobalContentBlockerActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedGlobalContentBlockerActions, 0);
  objc_storeStrong((id *)&self->_hostsWithLoadedPerSiteContentBlockers, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

void __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Could not get Global content blocker.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addActions:forContentBlocker:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Aborted adding actions to non-existent content blocker id.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)deleteActionsForContentBlocker:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Aborted deleting actions from non-existent content blocker id.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addCrossSiteContent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Cannot add CrossSiteContent because it is already in database.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)associateAction:(void *)a3 withCrossSiteContent:.cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = 134218240;
  v7 = objc_msgSend(a2, "databaseID");
  v8 = 2048;
  v9 = objc_msgSend(a3, "databaseID");
  _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Cannot associate CrossSiteContent(%ld) with action(%ld) with invalid databaseID(s).", (uint8_t *)&v6, 0x16u);

}

@end
