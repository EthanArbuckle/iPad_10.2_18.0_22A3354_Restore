@implementation SBApplicationShortcutStoreManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_384);
  return (id)sharedManager___sharedManager;
}

- (void)setApplicationShortcutItems:(id)a3 forBundleIdentifier:(id)a4 withVersion:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  if (a4)
  {
    v8 = (void *)MEMORY[0x1E0C99DC8];
    v9 = a4;
    v10 = a3;
    objc_msgSend(v8, "preferredLanguages");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[NSLock lock](self->_stateLock, "lock");
    -[SBApplicationShortcutStoreManager _stateLock_storeForBundleIdentifier:](self, "_stateLock_storeForBundleIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setApplicationShortcutItems:withLanguages:version:", v10, v12, a5);
    -[NSLock unlock](self->_stateLock, "unlock");

  }
}

- (id)applicationShortcutItemsForBundleIdentifier:(id)a3 withVersion:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DC8];
    v7 = a3;
    objc_msgSend(v6, "preferredLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock lock](self->_stateLock, "lock");
    -[SBApplicationShortcutStoreManager _stateLock_storeForBundleIdentifier:](self, "_stateLock_storeForBundleIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "languages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToArray:", v8))
    {
      v11 = objc_msgSend(v9, "version");

      if (v11 == a4)
      {
        objc_msgSend(v9, "applicationShortcutItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");

LABEL_8:
        -[NSLock unlock](self->_stateLock, "unlock");

        return v13;
      }
    }
    else
    {

    }
    objc_msgSend(v9, "invalidateCache");
    v13 = 0;
    goto LABEL_8;
  }
  v13 = 0;
  return v13;
}

- (id)_stateLock_storeForBundleIdentifier:(id)a3
{
  id v4;
  SBApplicationShortcutStore *v5;
  NSObject *v6;
  int v8;
  SBApplicationShortcutStoreManager *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storesKeyedByBundleIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (SBApplicationShortcutStore *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = self;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%@: Creating store for bundle identifier: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    v5 = -[SBApplicationShortcutStore initWithBundleIdentifier:]([SBApplicationShortcutStore alloc], "initWithBundleIdentifier:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storesKeyedByBundleIdentifier, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

void __50__SBApplicationShortcutStoreManager_sharedManager__block_invoke()
{
  SBApplicationShortcutStoreManager *v0;
  void *v1;

  v0 = objc_alloc_init(SBApplicationShortcutStoreManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

}

- (SBApplicationShortcutStoreManager)init
{
  SBApplicationShortcutStoreManager *v2;
  NSLock *v3;
  NSLock *stateLock;
  NSMutableDictionary *v5;
  NSMutableDictionary *storesKeyedByBundleIdentifier;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBApplicationShortcutStoreManager;
  v2 = -[SBApplicationShortcutStoreManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    stateLock = v2->_stateLock;
    v2->_stateLock = v3;

    -[NSLock setName:](v2->_stateLock, "setName:", CFSTR("com.apple.springboard.sbapplicationshortcutstoremanager"));
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storesKeyedByBundleIdentifier = v2->_storesKeyedByBundleIdentifier;
    v2->_storesKeyedByBundleIdentifier = v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__installedAppsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBApplicationShortcutStoreManager;
  -[SBApplicationShortcutStoreManager dealloc](&v4, sel_dealloc);
}

- (void)invalidateCache
{
  NSObject *v3;
  NSMutableDictionary *storesKeyedByBundleIdentifier;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  SBApplicationShortcutStoreManager *v16;
  __int16 v17;
  NSMutableDictionary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    storesKeyedByBundleIdentifier = self->_storesKeyedByBundleIdentifier;
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = storesKeyedByBundleIdentifier;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "%@: Request to invalidate all stores immediately: %@", buf, 0x16u);
  }

  -[NSLock lock](self->_stateLock, "lock");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_storesKeyedByBundleIdentifier, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "invalidateCache");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  +[SBApplicationShortcutStore clearStore](SBApplicationShortcutStore, "clearStore");
  -[NSLock unlock](self->_stateLock, "unlock");
}

- (void)saveSynchronously
{
  NSObject *v3;
  NSMutableDictionary *storesKeyedByBundleIdentifier;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  SBApplicationShortcutStoreManager *v16;
  __int16 v17;
  NSMutableDictionary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    storesKeyedByBundleIdentifier = self->_storesKeyedByBundleIdentifier;
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = storesKeyedByBundleIdentifier;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "%@: Request to save all stores immediately: %@", buf, 0x16u);
  }

  -[NSLock lock](self->_stateLock, "lock");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_storesKeyedByBundleIdentifier, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "saveSynchronously");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NSLock unlock](self->_stateLock, "unlock");
}

- (void)_installedAppsDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  SBApplicationShortcutStoreManager *v18;
  __int16 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBInstalledApplicationsRemovedBundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
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
        SBLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v18 = self;
          v19 = 2114;
          v20 = v11;
          _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "%@: Removing shortcut items for %{public}@ because it was uninstalled", buf, 0x16u);
        }

        -[SBApplicationShortcutStoreManager setApplicationShortcutItems:forBundleIdentifier:withVersion:](self, "setApplicationShortcutItems:forBundleIdentifier:withVersion:", 0, v11, 0);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storesKeyedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end
