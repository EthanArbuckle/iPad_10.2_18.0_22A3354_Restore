@implementation WBSPasswordWarningStore

- (id)_initWithBackingStoreURL:(id)a3
{
  id v4;
  WBSPasswordWarningStore *v5;
  uint64_t v6;
  NSURL *backingStoreURL;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  WBSPasswordWarningStore *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSPasswordWarningStore;
  v5 = -[WBSPasswordWarningStore init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    backingStoreURL = v5->_backingStoreURL;
    v5->_backingStoreURL = (NSURL *)v6;

    v8 = dispatch_queue_create("com.apple.SafariShared.WBSPasswordWarningStoreQueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)_initWithDefaultBackingStore
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_settingsDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("PasswordAuditing.plist"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WBSPasswordWarningStore _initWithBackingStoreURL:](self, "_initWithBackingStoreURL:", v5);
  return v6;
}

+ (WBSPasswordWarningStore)sharedStore
{
  if (+[WBSPasswordWarningStore sharedStore]::onceToken != -1)
    dispatch_once(&+[WBSPasswordWarningStore sharedStore]::onceToken, &__block_literal_global_46);
  return (WBSPasswordWarningStore *)(id)+[WBSPasswordWarningStore sharedStore]::sharedStore;
}

void __38__WBSPasswordWarningStore_sharedStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WBSPasswordWarningStore _initWithDefaultBackingStore]([WBSPasswordWarningStore alloc], "_initWithDefaultBackingStore");
  v1 = (void *)+[WBSPasswordWarningStore sharedStore]::sharedStore;
  +[WBSPasswordWarningStore sharedStore]::sharedStore = (uint64_t)v0;

}

- (void)_loadStoreIfNecessary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *lastWarningDatesByPersistentIdentifier;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  double v17;
  void *v18;
  id v19;
  WBSPasswordWarningStore *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_lastWarningDatesByPersistentIdentifier)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastWarningDatesByPersistentIdentifier = self->_lastWarningDatesByPersistentIdentifier;
    self->_lastWarningDatesByPersistentIdentifier = v3;

    v20 = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", self->_backingStoreURL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    if (v5)
    {
      objc_msgSend(v5, "safari_arrayForKey:", CFSTR("PasswordAuditWarnings"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v7 = v18;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v8)
        {
          v9 = 0;
          v10 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_msgSend(v12, "safari_dataForKey:", CFSTR("PersistentIdentifier"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "safari_dateForKey:", CFSTR("LastWarningDate"));
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = (void *)v14;
              if (v13)
                v16 = v14 == 0;
              else
                v16 = 1;
              if (v16 || (objc_msgSend(v6, "timeIntervalSinceDate:", v14), v17 > 7776000.0))
                v9 = 1;
              else
                -[NSMutableDictionary setObject:forKeyedSubscript:](v20->_lastWarningDatesByPersistentIdentifier, "setObject:forKeyedSubscript:", v15, v13);

            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v8);

          if ((v9 & 1) != 0)
            -[WBSPasswordWarningStore _saveStoreSoon](v20, "_saveStoreSoon");
        }
        else
        {

        }
      }

      v5 = v19;
    }

  }
}

- (void)_saveStoreSoon
{
  SafariShared::SuddenTerminationDisabler *v3;
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD block[5];

  if (self->_backingStoreURL)
  {
    if (!self->_hasPendingChanges)
    {
      self->_hasPendingChanges = 1;
      v3 = (SafariShared::SuddenTerminationDisabler *)operator new();
      SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(v3, CFSTR("com.apple.SafariShared.WBSPasswordWarningStore.saveChanges"));
      std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_suddenTerminationDisabler, (id *)v3);
      v4 = dispatch_time(0, 5000000000);
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__WBSPasswordWarningStore__saveStoreSoon__block_invoke;
      block[3] = &unk_1E649A460;
      block[4] = self;
      dispatch_after(v4, queue, block);
    }
  }
}

uint64_t __41__WBSPasswordWarningStore__saveStoreSoon__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveStoreNow");
}

- (void)_saveStoreNow
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1B2621000, a2, a3, "Failed to save PasswordWarning store: %{public}@", (uint8_t *)a2);

}

void __40__WBSPasswordWarningStore__saveStoreNow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v8[0] = CFSTR("PersistentIdentifier");
  v8[1] = CFSTR("LastWarningDate");
  v9[0] = v5;
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (void)saveStoreSynchronously
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WBSPasswordWarningStore_saveStoreSynchronously__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __49__WBSPasswordWarningStore_saveStoreSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveStoreNow");
}

- (void)getContainsPersistentIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSPasswordWarningStore_getContainsPersistentIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E649E6C0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __77__WBSPasswordWarningStore_getContainsPersistentIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pm_defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "BOOLForKey:", CFSTR("EnablePasswordManagerDemoMode"));

  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadStoreIfNecessary");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", v5);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (void)_addPersistentIdentifier:(id)a3 withLastWarningDate:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WBSPasswordWarningStore__addPersistentIdentifier_withLastWarningDate___block_invoke;
  block[3] = &unk_1E649A6B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __72__WBSPasswordWarningStore__addPersistentIdentifier_withLastWarningDate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadStoreIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_saveStoreSoon");
}

- (void)addPersistentIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordWarningStore _addPersistentIdentifier:withLastWarningDate:](self, "_addPersistentIdentifier:withLastWarningDate:", v5, v4);

}

- (void)clearStoreSynchronously
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSPasswordWarningStore_clearStoreSynchronously__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __50__WBSPasswordWarningStore_clearStoreSynchronously__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_saveStoreNow");
}

- (void)synchronousyClearIdentifiersAddedAfterDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    -[WBSPasswordWarningStore clearStoreSynchronously](self, "clearStoreSynchronously");
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__WBSPasswordWarningStore_synchronousyClearIdentifiersAddedAfterDate___block_invoke;
    block[3] = &unk_1E649A540;
    block[4] = self;
    v8 = v6;
    dispatch_sync(queue, block);

  }
}

void __70__WBSPasswordWarningStore_synchronousyClearIdentifiersAddedAfterDate___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__WBSPasswordWarningStore_synchronousyClearIdentifiersAddedAfterDate___block_invoke_2;
  v6[3] = &unk_1E649E6E8;
  v7 = v3;
  v5 = v2;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectsForKeys:", v5);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_saveStoreNow");

}

void __70__WBSPasswordWarningStore_synchronousyClearIdentifiersAddedAfterDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "compare:", *(_QWORD *)(a1 + 32)) == 1)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWarningDatesByPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_backingStoreURL, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_suddenTerminationDisabler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
