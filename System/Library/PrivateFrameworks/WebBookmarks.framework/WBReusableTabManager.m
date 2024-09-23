@implementation WBReusableTabManager

+ (WBReusableTabManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WBReusableTabManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBReusableTabManager sharedManager]::onceToken != -1)
    dispatch_once(&+[WBReusableTabManager sharedManager]::onceToken, block);
  return (WBReusableTabManager *)(id)+[WBReusableTabManager sharedManager]::sharedManager;
}

void __37__WBReusableTabManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[WBReusableTabManager sharedManager]::sharedManager;
  +[WBReusableTabManager sharedManager]::sharedManager = (uint64_t)v1;

}

- (WBReusableTabManager)init
{
  WBReusableTabManager *v2;
  NSCache *v3;
  NSCache *uuidToTabCache;
  void *v5;
  WBReusableTabManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBReusableTabManager;
  v2 = -[WBReusableTabManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    uuidToTabCache = v2->_uuidToTabCache;
    v2->_uuidToTabCache = v3;

    -[NSCache setCountLimit:](v2->_uuidToTabCache, "setCountLimit:", 100);
    -[NSCache setDelegate:](v2->_uuidToTabCache, "setDelegate:", v2);
    -[WBReusableTabManager tabGroupManager](v2, "tabGroupManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTabGroupObserver:", v2);
    v6 = v2;

  }
  return v2;
}

- (void)addReusableTab:(id)a3
{
  WBReusableTabEntry *v4;
  NSCache *uuidToTabCache;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[WBReusableTabEntry initWithReusableTab:]([WBReusableTabEntry alloc], "initWithReusableTab:", v7);
  uuidToTabCache = self->_uuidToTabCache;
  objc_msgSend(v7, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:](uuidToTabCache, "setObject:forKey:", v4, v6);

  -[WBReusableTabManager _scheduleCleanup](self, "_scheduleCleanup");
}

- (void)removeReusableTabWithUUID:(id)a3
{
  -[NSCache removeObjectForKey:](self->_uuidToTabCache, "removeObjectForKey:", a3);
}

- (id)reuseTabForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSCache objectForKey:](self->_uuidToTabCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_reusing = 1;
  -[NSCache removeObjectForKey:](self->_uuidToTabCache, "removeObjectForKey:", v4);
  self->_reusing = 0;
  objc_msgSend(v5, "reusableTab");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)referenceToTabWithUUID:(id)a3
{
  void *v3;
  void *v4;

  -[NSCache objectForKey:](self->_uuidToTabCache, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reusableTab");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isTabSuspended:(id)a3
{
  id v4;
  void *v5;
  NSCache *uuidToTabCache;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    uuidToTabCache = self->_uuidToTabCache;
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](uuidToTabCache, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reusableTab");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == v5;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_scheduleCleanup
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  NSTimer *v7;
  NSTimer *cleanupTimer;

  if (self->_cleanupTimer)
  {
    self->_pendingCleanup = 1;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBCF40];
    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatForKey:", CFSTR("reusableTabManagerCleanupDelaySeconds"));
    if (v5 == 0.0)
      v6 = 600.0;
    else
      v6 = v5;

    objc_msgSend(v3, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__cleanUp, 0, 0, v6);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    cleanupTimer = self->_cleanupTimer;
    self->_cleanupTimer = v7;

  }
}

- (void)_cleanUp
{
  NSTimer *cleanupTimer;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  double v19;
  NSCache *uuidToTabCache;
  void *v21;
  void *v22;
  WBReusableTabManager *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  cleanupTimer = self->_cleanupTimer;
  self->_cleanupTimer = 0;

  v23 = self;
  -[WBReusableTabManager allGroupsTabsUUIDs](self, "allGroupsTabsUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache allObjects](v23->_uuidToTabCache, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "reusableTab");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "containsObject:", v12);

        objc_msgSend(v10, "dateCreated");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceNow");
        v16 = v15;
        objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatForKey:", CFSTR("reusableTabManagerMaxAgeSeconds"));
        if (v18 == 0.0)
          v19 = 3600.0;
        else
          v19 = v18;

        if (((v19 >= -v16) & v13) == 0)
        {
          uuidToTabCache = v23->_uuidToTabCache;
          objc_msgSend(v10, "reusableTab");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache removeObjectForKey:](uuidToTabCache, "removeObjectForKey:", v22);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  if (v23->_pendingCleanup)
  {
    v23->_pendingCleanup = 0;
    -[WBReusableTabManager _scheduleCleanup](v23, "_scheduleCleanup");
  }

}

- (NSSet)allGroupsTabsUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBReusableTabManager tabGroupManager](self, "tabGroupManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "allNamedTabGroupsUnsorted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        -[WBReusableTabManager _addTabUUIDsFromGroup:toSet:](self, "_addTabUUIDsFromGroup:toSet:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8++), v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WBReusableTabManager windowStates](self, "windowStates", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "localTabGroup");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBReusableTabManager _addTabUUIDsFromGroup:toSet:](self, "_addTabUUIDsFromGroup:toSet:", v13, v3);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v14;
}

- (void)_addTabUUIDsFromGroup:(id)a3 toSet:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "tabs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v10, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
        objc_msgSend(v5, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (id)windowStates
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)tabGroupManager
{
  return 0;
}

- (void)enumerateReusableTabs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSCache allObjects](self->_uuidToTabCache, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__WBReusableTabManager_enumerateReusableTabs___block_invoke;
  v7[3] = &unk_24CB34520;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __46__WBReusableTabManager_enumerateReusableTabs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "reusableTab");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  NSTimer *cleanupTimer;

  -[NSTimer invalidate](self->_cleanupTimer, "invalidate", a3, a4);
  cleanupTimer = self->_cleanupTimer;
  self->_cleanupTimer = 0;

  -[WBReusableTabManager _cleanUp](self, "_cleanUp");
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (!self->_reusing)
  {
    v7 = v5;
    objc_msgSend(v5, "reusableTab");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "evictFromTabReuse");

    v5 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_uuidToTabCache, 0);
}

@end
