@implementation SBRecentDisplayItemsDataStore

- (SBRecentDisplayItemsDataStore)init
{
  void *v3;
  void *v4;
  SBRecentDisplayItemsDataStore *v5;

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentAppLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBRecentDisplayItemsDataStore initWithRecentLayouts:fallbackToRecentAppLayouts:](self, "initWithRecentLayouts:fallbackToRecentAppLayouts:", v4, 1);

  return v5;
}

- (SBRecentDisplayItemsDataStore)initWithRecentLayouts:(id)a3 fallbackToRecentAppLayouts:(BOOL)a4
{
  id v7;
  SBRecentDisplayItemsDataStore *v8;
  SBRecentDisplayItemsDataStore *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBRecentDisplayItemsDataStore;
  v8 = -[SBRecentDisplayItemsDataStore init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recentLayouts, a3);
    v9->_shouldFallbackToRecentAppLayouts = a4;
  }

  return v9;
}

- (void)setDisplayItems:(id)a3
{
  SBRecentDisplayItemsPersistenceDelegate **p_persistenceDelegate;
  id v5;
  id WeakRetained;

  p_persistenceDelegate = &self->_persistenceDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_persistenceDelegate);
  objc_msgSend(WeakRetained, "dataStore:persistDisplayItems:", self, v5);

}

- (NSOrderedSet)displayItems
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_persistenceDelegate);
  objc_msgSend(WeakRetained, "persistedDisplayItemsForDataStore:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (self->_shouldFallbackToRecentAppLayouts)
    {
      -[SBRecentDisplayItemsDataStore _displayItemsFromRecentAppLayouts:](self, "_displayItemsFromRecentAppLayouts:", self->_recentLayouts);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentDisplayItemsDataStore setDisplayItems:](self, "setDisplayItems:", v4);
    }
    else
    {
      v4 = 0;
    }
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(WeakRetained, "dataStore:shouldRestorePersistedDisplayItem:", self, v11, (_QWORD)v13))objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSOrderedSet *)v5;
}

- (id)_displayItemsFromRecentAppLayouts:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = v20;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v9, "itemForLayoutRole:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "integerValue"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "bundleIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15 && (objc_msgSend(v5, "containsObject:", v16) & 1) == 0)
              {
                objc_msgSend(v4, "addObject:", v15);
                objc_msgSend(v5, "addObject:", v16);
              }

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }

  return v4;
}

- (SBRecentDisplayItemsPersistenceDelegate)persistenceDelegate
{
  return (SBRecentDisplayItemsPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_persistenceDelegate);
}

- (void)setPersistenceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_persistenceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistenceDelegate);
  objc_storeStrong((id *)&self->_recentLayouts, 0);
}

@end
