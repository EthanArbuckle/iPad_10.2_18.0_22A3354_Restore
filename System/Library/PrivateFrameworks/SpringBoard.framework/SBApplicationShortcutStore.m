@implementation SBApplicationShortcutStore

- (void)_saveQueue_save
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSArray *cachedLanguages;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  NSUInteger v20;
  const __CFString *v21;
  NSArray *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_stateLock, "lock");
  SBLogAppShortcuts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBApplicationShortcutStore bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving...", (uint8_t *)&v17, 0xCu);

  }
  if (self->_isDirty && self->_isLoaded)
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationShortcutStore _stateLock_truncateIfNeeded:](self, "_stateLock_truncateIfNeeded:", v6);

    -[SBApplicationShortcutStore _plistArrayFromApplicationShortcutItems:](self, "_plistArrayFromApplicationShortcutItems:", self->_cachedApplicationShortcutItems);
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v7, "count"))
    {
      v23[1] = CFSTR("version");
      v24[0] = v7;
      v23[0] = CFSTR("applicationShortcutItems");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cachedVersion);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      cachedLanguages = self->_cachedLanguages;
      if (cachedLanguages)
      {
        v21 = CFSTR("languages");
        v22 = cachedLanguages;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bs_dictionaryByAddingEntriesFromDictionary:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v12;
      }
      SBLogAppShortcuts();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[SBApplicationShortcutStore bundleIdentifier](self, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[NSArray count](self->_cachedApplicationShortcutItems, "count");
        v17 = 138543618;
        v18 = v14;
        v19 = 2048;
        v20 = v15;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "%{public}@: Committing app shortcut store w/ %lu shortcuts", (uint8_t *)&v17, 0x16u);

      }
      -[FBSApplicationDataStore setArchivedObject:forKey:](self->_dataStore, "setArchivedObject:forKey:", v9, CFSTR("SBApplicationShortcutItems"));
      objc_msgSend(MEMORY[0x1E0D23068], "synchronize");

    }
    self->_isDirty = 0;
  }
  else
  {
    SBLogAppShortcuts();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SBApplicationShortcutStore bundleIdentifier](self, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring save request because not dirty", (uint8_t *)&v17, 0xCu);

    }
  }

  -[NSLock unlock](self->_stateLock, "unlock");
}

- (BOOL)_stateLock_truncateIfNeeded:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *p_super;
  _BOOL4 v7;
  void *v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  void *v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  NSArray *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  NSUInteger v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_isLoaded)
  {
    SBLogAppShortcuts();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      -[SBApplicationShortcutStore bundleIdentifier](self, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1D0540000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: SBApplicationShortcutStore cannot truncate; data isn't loaded.",
        (uint8_t *)&v19,
        0xCu);

    }
    goto LABEL_15;
  }
  v5 = -[NSArray count](self->_cachedApplicationShortcutItems, "count");
  SBLogAppShortcuts();
  p_super = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (v5 <= 0xA)
  {
    if (v7)
    {
      -[SBApplicationShortcutStore bundleIdentifier](self, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSArray count](self->_cachedApplicationShortcutItems, "count");
      v19 = 138543874;
      v20 = v8;
      v21 = 2112;
      v22 = v4;
      v23 = 2048;
      v24 = v9;
      _os_log_impl(&dword_1D0540000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: SBApplicationShortcutStore doesn't need truncation (truncation reason: %@); there are %ld applicatio"
        "n shortcut items.",
        (uint8_t *)&v19,
        0x20u);

    }
LABEL_15:
    v15 = 0;
    goto LABEL_19;
  }
  if (v7)
  {
    -[SBApplicationShortcutStore bundleIdentifier](self, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSArray count](self->_cachedApplicationShortcutItems, "count");
    v19 = 138543874;
    v20 = v11;
    v21 = 2112;
    v22 = v4;
    v23 = 2048;
    v24 = v12;
    _os_log_impl(&dword_1D0540000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: SBApplicationShortcutStore needs truncation (truncation reason: %@); there are %ld application shortcut items.",
      (uint8_t *)&v19,
      0x20u);

  }
  if (_stateLock_truncateIfNeeded__onceToken != -1)
    dispatch_once(&_stateLock_truncateIfNeeded__onceToken, &__block_literal_global_349);
  if (_stateLock_truncateIfNeeded__isInternalInstall)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("SBSuppressAppShortcutTruncation"));

    if (v14)
    {
      SBLogAppShortcuts();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[SBApplicationShortcutStore _stateLock_truncateIfNeeded:].cold.2(self, p_super);
      goto LABEL_15;
    }
  }
  SBLogAppShortcuts();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[SBApplicationShortcutStore _stateLock_truncateIfNeeded:].cold.1(self, v5, v16);

  -[NSArray subarrayWithRange:](self->_cachedApplicationShortcutItems, "subarrayWithRange:", 0, 10);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  p_super = &self->_cachedApplicationShortcutItems->super;
  self->_cachedApplicationShortcutItems = v17;
  v15 = 1;
LABEL_19:

  return v15;
}

- (id)_plistArrayFromApplicationShortcutItems:(id)a3
{
  id v3;
  xpc_object_t v4;
  void *v5;

  v3 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

  BSDeserializeCFValueFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)version
{
  unint64_t cachedVersion;

  -[NSLock lock](self->_stateLock, "lock");
  -[SBApplicationShortcutStore _stateLock_loadFromStoreIfNeeded](self, "_stateLock_loadFromStoreIfNeeded");
  cachedVersion = self->_cachedVersion;
  -[NSLock unlock](self->_stateLock, "unlock");
  return cachedVersion;
}

- (void)setApplicationShortcutItems:(id)a3 withLanguages:(id)a4 version:(unint64_t)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  -[NSLock lock](self->_stateLock, "lock");
  -[SBApplicationShortcutStore _stateLock_loadFromStoreIfNeeded](self, "_stateLock_loadFromStoreIfNeeded");
  if (self->_isLoaded)
    goto LABEL_7;
  SBLogAppShortcuts();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SBApplicationShortcutStore setApplicationShortcutItems:withLanguages:version:].cold.1(self);

  if (self->_isLoaded)
  {
LABEL_7:
    if (!objc_msgSend(v9, "isEqualToArray:", self->_cachedApplicationShortcutItems)
      || !objc_msgSend(v10, "isEqualToArray:", self->_cachedLanguages)
      || self->_cachedVersion != a5)
    {
      objc_storeStrong((id *)&self->_cachedApplicationShortcutItems, a3);
      objc_storeStrong((id *)&self->_cachedLanguages, a4);
      self->_cachedVersion = a5;
      SBLogAppShortcuts();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[SBApplicationShortcutStore bundleIdentifier](self, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating app shortcut store...", (uint8_t *)&v14, 0xCu);

      }
      -[SBApplicationShortcutStore _stateLock_markDirty](self, "_stateLock_markDirty");
    }
  }
  -[NSLock unlock](self->_stateLock, "unlock");

}

- (NSArray)languages
{
  void *v3;

  -[NSLock lock](self->_stateLock, "lock");
  -[SBApplicationShortcutStore _stateLock_loadFromStoreIfNeeded](self, "_stateLock_loadFromStoreIfNeeded");
  v3 = (void *)-[NSArray copy](self->_cachedLanguages, "copy");
  -[NSLock unlock](self->_stateLock, "unlock");
  return (NSArray *)v3;
}

- (void)_stateLock_loadFromStoreIfNeeded
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%{public}@: Unexpected data from store: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)invalidateCache
{
  NSArray *cachedApplicationShortcutItems;
  NSArray *cachedLanguages;

  -[NSLock lock](self->_stateLock, "lock");
  self->_isLoaded = 0;
  cachedApplicationShortcutItems = self->_cachedApplicationShortcutItems;
  self->_cachedApplicationShortcutItems = 0;

  cachedLanguages = self->_cachedLanguages;
  self->_cachedLanguages = 0;

  self->_cachedVersion = 0;
  -[NSLock unlock](self->_stateLock, "unlock");
}

- (NSArray)applicationShortcutItems
{
  void *v3;

  -[NSLock lock](self->_stateLock, "lock");
  -[SBApplicationShortcutStore _stateLock_loadFromStoreIfNeeded](self, "_stateLock_loadFromStoreIfNeeded");
  v3 = (void *)-[NSArray copy](self->_cachedApplicationShortcutItems, "copy");
  -[NSLock unlock](self->_stateLock, "unlock");
  return (NSArray *)v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)_stateLock_markDirty
{
  NSObject *v3;
  void *v4;
  NSObject *saveQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_isDirty)
  {
    self->_isDirty = 1;
    SBLogAppShortcuts();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[SBApplicationShortcutStore bundleIdentifier](self, "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "%{public}@: Marking as dirty...", buf, 0xCu);

    }
    saveQueue = self->_saveQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SBApplicationShortcutStore__stateLock_markDirty__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(saveQueue, block);
  }
}

uint64_t __50__SBApplicationShortcutStore__stateLock_markDirty__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveQueue_save");
}

+ (void)clearStore
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  objc_msgSend(MEMORY[0x1E0D23068], "applicationsWithAvailableStores", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0D23068], "storeForApplication:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObjectForKey:", CFSTR("SBApplicationShortcutItems"));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (SBApplicationShortcutStore)initWithBundleIdentifier:(id)a3
{
  id v4;
  SBApplicationShortcutStore *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  FBSApplicationDataStore *dataStore;
  NSLock *v10;
  NSLock *stateLock;
  uint64_t Serial;
  OS_dispatch_queue *saveQueue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBApplicationShortcutStore;
  v5 = -[SBApplicationShortcutStore init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0D23068], "storeForApplication:", v5->_bundleIdentifier);
    v8 = objc_claimAutoreleasedReturnValue();
    dataStore = v5->_dataStore;
    v5->_dataStore = (FBSApplicationDataStore *)v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    stateLock = v5->_stateLock;
    v5->_stateLock = v10;

    -[NSLock setName:](v5->_stateLock, "setName:", CFSTR("com.apple.springboard.sbapplicationshortcutstore"));
    Serial = BSDispatchQueueCreateSerial();
    saveQueue = v5->_saveQueue;
    v5->_saveQueue = (OS_dispatch_queue *)Serial;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationShortcutStore bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("bundleIdentifier"));

  if (self->_isLoaded)
  {
    v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_cachedLanguages, CFSTR("languages"));
    v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_cachedApplicationShortcutItems, CFSTR("applicationShortcutItems"));
    v8 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_cachedVersion, CFSTR("version"));
    v9 = (id)objc_msgSend(v3, "appendBool:withName:", self->_isDirty, CFSTR("isDirty"));
  }
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)saveSynchronously
{
  NSObject *saveQueue;
  _QWORD block[5];

  saveQueue = self->_saveQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBApplicationShortcutStore_saveSynchronously__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_sync(saveQueue, block);
}

uint64_t __47__SBApplicationShortcutStore_saveSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveQueue_save");
}

- (void)truncateIfNecessary
{
  -[NSLock lock](self->_stateLock, "lock");
  -[SBApplicationShortcutStore _stateLock_loadFromStoreIfNeeded](self, "_stateLock_loadFromStoreIfNeeded");
  if (-[SBApplicationShortcutStore _stateLock_truncateIfNeeded:](self, "_stateLock_truncateIfNeeded:", CFSTR("truncateIfNeeded")))
  {
    -[SBApplicationShortcutStore _stateLock_markDirty](self, "_stateLock_markDirty");
  }
  -[NSLock unlock](self->_stateLock, "unlock");
}

- (id)_applicationShortcutItemsFromPlistArray:(id)a3
{
  id v3;
  xpc_object_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  BSSerializeCFValueToXPCDictionaryWithKey();

  BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

uint64_t __58__SBApplicationShortcutStore__stateLock_truncateIfNeeded___block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _stateLock_truncateIfNeeded__isInternalInstall = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_cachedLanguages, 0);
  objc_storeStrong((id *)&self->_cachedApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

- (void)setApplicationShortcutItems:(void *)a1 withLanguages:version:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%{public}@: Ignoring request to save shortcut items because existing shortcuts could not be read from disk: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_stateLock_truncateIfNeeded:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543874;
  v7 = v5;
  v8 = 2048;
  v9 = a2;
  v10 = 2048;
  v11 = 10;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@: SBApplicationShortcutStore has too many app shortcuts (%ld); discarding all shortcuts after first %ld.",
    (uint8_t *)&v6,
    0x20u);

}

- (void)_stateLock_truncateIfNeeded:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "%@: SBApplicationShortcutStore suppressing truncation for some reason.", (uint8_t *)&v4, 0xCu);

}

@end
