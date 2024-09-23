@implementation TUSearchController

+ (TUSearchController)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_35);
  return (TUSearchController *)(id)sharedInstance_gSharedController;
}

void __36__TUSearchController_sharedInstance__block_invoke()
{
  TUSearchController *v0;
  void *v1;

  v0 = objc_alloc_init(TUSearchController);
  v1 = (void *)sharedInstance_gSharedController;
  sharedInstance_gSharedController = (uint64_t)v0;

}

- (TUSearchController)init
{
  TUSearchController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *searchQueue;
  uint64_t v5;
  NSMutableDictionary *searchModules;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUSearchController;
  v2 = -[TUSearchController init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.telephonyutilities.searchcontroller", 0);
    searchQueue = v2->_searchQueue;
    v2->_searchQueue = (OS_dispatch_queue *)v3;

    v2->_searchModulesLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    searchModules = v2->_searchModules;
    v2->_searchModules = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_msgSend(MEMORY[0x1E0C97298], "tu_contactStore");
    v4 = (CNContactStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)recentsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUSearchController searchQueue](self, "searchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__TUSearchController_recentsWithCompletion___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__TUSearchController_recentsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
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
  objc_msgSend(*(id *)(a1 + 32), "_cancelRecentSearches");
  +[TUSearchModuleManager recentsModuleClasses](TUSearchModuleManager, "recentsModuleClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRecentsModules:", v3);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_alloc_init(*(Class *)(*((_QWORD *)&v22 + 1) + 8 * v8));
        objc_msgSend(v9, "setSearchController:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 32), "recentsModules");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "recentsModules", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
        objc_msgSend(*(id *)(a1 + 32), "recentsModuleCompletionWithCompletion:", *(_QWORD *)(a1 + 40));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "searchForString:completion:", &stru_1E38A53C8, v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

}

- (void)searchForString:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUSearchController searchQueue](self, "searchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__TUSearchController_searchForString_completion___block_invoke;
  block[3] = &unk_1E38A3068;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __49__TUSearchController_searchForString_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cancelSearchsForSearchTerm:", *(_QWORD *)(a1 + 40));
  +[TUSearchModuleManager searchModuleClasses](TUSearchModuleManager, "searchModuleClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_alloc_init(*(Class *)(*((_QWORD *)&v24 + 1) + 8 * i));
        objc_msgSend(v9, "setSearchController:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v10 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(*(id *)(a1 + 32), "searchModules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          v18 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "searchModuleCompletionWithSearchTerm:completion:", v18, *(_QWORD *)(a1 + 48), (_QWORD)v20);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "searchForString:completion:", v18, v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

  }
}

- (void)_cancelRecentSearches
{
  void *v3;
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
  -[TUSearchController recentsModules](self, "recentsModules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[TUSearchController recentsModules](self, "recentsModules", 0);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "cancelSearch");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[TUSearchController setRecentsModules:](self, "setRecentsModules:", 0);
    +[TUIDSLookupManager sharedManager](TUIDSLookupManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelQueries");

    -[TUSearchController _clearIdsDestinations](self, "_clearIdsDestinations");
  }
}

- (void)_cancelSearchsForSearchTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_searchModulesLock);
  -[TUSearchController searchModules](self, "searchModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "cancelSearch", (_QWORD)v14);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[TUSearchController searchModules](self, "searchModules");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v4);

    +[TUIDSLookupManager sharedManager](TUIDSLookupManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cancelQueries");

    -[TUSearchController _clearIdsDestinations](self, "_clearIdsDestinations");
  }
  os_unfair_lock_unlock(&self->_searchModulesLock);

}

- (void)_fetchIdsDestinationsIfNeeded:(id)a3 withReason:(int)a4
{
  NSObject *v6;
  NSMutableSet *v7;
  NSMutableSet *idsDestinations;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  -[TUSearchController searchQueue](self, "searchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!self->_idsDestinations)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    idsDestinations = self->_idsDestinations;
    self->_idsDestinations = v7;

  }
  if (a4 == 1)
  {
    v9 = (id)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v9, "minusSet:", self->_idsDestinations);
  }
  else if (a4)
  {
    v9 = 0;
  }
  else
  {
    v9 = v11;
  }
  if (objc_msgSend(v9, "count"))
  {
    +[TUIDSLookupManager sharedManager](TUIDSLookupManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginBatchQueryWithDestinations:", v9);

    -[NSMutableSet unionSet:](self->_idsDestinations, "unionSet:", v9);
  }

}

- (void)_clearIdsDestinations
{
  NSObject *v3;
  NSMutableSet *idsDestinations;

  -[TUSearchController searchQueue](self, "searchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  idsDestinations = self->_idsDestinations;
  self->_idsDestinations = 0;

}

- (id)recentsModuleCompletionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUSearchController recentsModules](self, "recentsModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSearchController _searchModuleCompletionWithModules:searchTerm:resultsClass:completion:](self, "_searchModuleCompletionWithModules:searchTerm:resultsClass:completion:", v5, &stru_1E38A53C8, objc_opt_class(), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)searchModuleCompletionWithSearchTerm:(id)a3 completion:(id)a4
{
  os_unfair_lock_s *p_searchModulesLock;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  p_searchModulesLock = &self->_searchModulesLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_searchModulesLock);
  -[TUSearchController searchModules](self, "searchModules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_searchModulesLock);
  -[TUSearchController _searchModuleCompletionWithModules:searchTerm:resultsClass:completion:](self, "_searchModuleCompletionWithModules:searchTerm:resultsClass:completion:", v10, v8, objc_opt_class(), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_searchModuleCompletionWithModules:(id)a3 searchTerm:(id)a4 resultsClass:(Class)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD aBlock[5];
  id v20;
  id v21;
  id v22;
  Class v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__TUSearchController__searchModuleCompletionWithModules_searchTerm_resultsClass_completion___block_invoke;
  aBlock[3] = &unk_1E38A3488;
  aBlock[4] = self;
  v20 = v10;
  v22 = v12;
  v23 = a5;
  v21 = v11;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = _Block_copy(aBlock);
  v17 = _Block_copy(v16);

  return v17;
}

void __92__TUSearchController__searchModuleCompletionWithModules_searchTerm_resultsClass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "searchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__TUSearchController__searchModuleCompletionWithModules_searchTerm_resultsClass_completion___block_invoke_2;
  v8[3] = &unk_1E38A3460;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v14 = *(_QWORD *)(a1 + 64);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  dispatch_async(v4, v8);

}

void __92__TUSearchController__searchModuleCompletionWithModules_searchTerm_resultsClass_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  os_unfair_lock_s *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v33;
LABEL_4:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v6), "isSearchComplete"))
          break;
        if (v4 == ++v6)
        {
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
          if (v4)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      if (+[TUCallCapabilities supportsTelephonyCalls](TUCallCapabilities, "supportsTelephonyCalls"))
        v7 = +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling") ^ 1;
      else
        v7 = 0;
      v2 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "initWithSearchTerm:shouldAddAdhocResults:", *(_QWORD *)(a1 + 48), v7);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v8 = *(id *)(a1 + 32);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v29;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "searchResults");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addSearchResults:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v10);
      }

      objc_msgSend(v2, "finalizeSearchResults");
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v2, "allDataItems", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v25;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "idsCanonicalDestinations");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObjectsFromArray:", v20);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        }
        while (v17);
      }

      objc_msgSend(*(id *)(a1 + 56), "_fetchIdsDestinationsIfNeeded:withReason:", v14, objc_msgSend(*(id *)(a1 + 48), "length") == 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v21 = objc_msgSend(*(id *)(a1 + 48), "length");
      v22 = *(os_unfair_lock_s **)(a1 + 56);
      if (v21)
      {
        os_unfair_lock_lock(v22 + 2);
        objc_msgSend(*(id *)(a1 + 56), "searchModules");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 8));
      }
      else
      {
        -[os_unfair_lock_s setRecentsModules:](v22, "setRecentsModules:", 0);
      }

    }
  }
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSMutableDictionary)searchModules
{
  return self->_searchModules;
}

- (void)setSearchModules:(id)a3
{
  objc_storeStrong((id *)&self->_searchModules, a3);
}

- (NSMutableArray)recentsModules
{
  return self->_recentsModules;
}

- (void)setRecentsModules:(id)a3
{
  objc_storeStrong((id *)&self->_recentsModules, a3);
}

- (OS_dispatch_queue)searchQueue
{
  return self->_searchQueue;
}

- (void)setSearchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_searchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_recentsModules, 0);
  objc_storeStrong((id *)&self->_searchModules, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_idsDestinations, 0);
}

@end
