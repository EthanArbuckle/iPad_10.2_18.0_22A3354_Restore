@implementation PUIMappedImageCacheManager

+ (id)defaultCacheManager
{
  if (defaultCacheManager_onceToken != -1)
    dispatch_once(&defaultCacheManager_onceToken, &__block_literal_global_26);
  return (id)defaultCacheManager_defaultCacheManager;
}

void __49__PUIMappedImageCacheManager_defaultCacheManager__block_invoke()
{
  PUIMappedImageCacheManager *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v0 = [PUIMappedImageCacheManager alloc];
  objc_msgSend(MEMORY[0x24BE74D08], "scopedSystemContainerForCurrentProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "providerByAppendingPathComponent:", CFSTR("PBUIMappedImageCacheManager-Default"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PUIMappedImageCacheManager initWithNumberOfManagedCaches:pathProvider:](v0, "initWithNumberOfManagedCaches:pathProvider:", 10, v2);
  v4 = (void *)defaultCacheManager_defaultCacheManager;
  defaultCacheManager_defaultCacheManager = v3;

  v5 = *(void **)(defaultCacheManager_defaultCacheManager + 48);
  *(_QWORD *)(defaultCacheManager_defaultCacheManager + 48) = CFSTR("PBUIMappedImageCacheManager-Default");

  dispatch_get_global_queue(9, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, &__block_literal_global_3_0);

}

uint64_t __49__PUIMappedImageCacheManager_defaultCacheManager__block_invoke_2()
{
  return +[PUIMappedImageCacheManager cleanupOldCaches](PUIMappedImageCacheManager, "cleanupOldCaches");
}

+ (void)cleanupOldCaches
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE74D08], "scopedSystemContainerForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v16 = v2;
  objc_msgSend(v2, "cachesPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("PosterViewController"));

        if (v12)
        {
          v17 = 0;
          v13 = objc_msgSend(v3, "removeItemAtURL:error:", v10, &v17);
          v14 = v17;
          if ((v13 & 1) == 0)
          {
            PUILogCaching();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v23 = v10;
              v24 = 2114;
              v25 = v14;
              _os_log_error_impl(&dword_24464E000, v15, OS_LOG_TYPE_ERROR, "Unable to remove old cache %@: %{public}@", buf, 0x16u);
            }

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

}

+ (id)registerCacheManager:(id)a3 cacheManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_knownCacheDirectoryLock);
    if (registerCacheManager_cacheManager__onceToken != -1)
      dispatch_once(&registerCacheManager_cacheManager__onceToken, &__block_literal_global_7_2);
    objc_msgSend((id)__knownCacheDirectories, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend((id)__knownCacheDirectories, "setObject:forKey:", v7, v5);
      if ((objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PFFileProtectionNoneAttributes();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        v11 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, v10, &v15);
        v12 = v15;

        if ((v11 & 1) == 0)
        {
          PUILogCaching();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            +[PUIMappedImageCacheManager registerCacheManager:cacheManager:].cold.1();

        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_knownCacheDirectoryLock);
  }

  return v8;
}

void __64__PUIMappedImageCacheManager_registerCacheManager_cacheManager___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__knownCacheDirectories;
  __knownCacheDirectories = v0;

}

+ (BOOL)unregisterCacheManagerForURL:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_knownCacheDirectoryLock);
  objc_msgSend((id)__knownCacheDirectories, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  objc_msgSend((id)__knownCacheDirectories, "removeObjectForKey:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_knownCacheDirectoryLock);
  return v5;
}

- (PUIMappedImageCacheManager)initWithNumberOfManagedCaches:(unint64_t)a3 pathProvider:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PUIMappedImageCacheManager *v11;
  PUIMappedImageCacheManager *v12;
  PUIMappedImageCacheManager *v13;
  PUIMappedImageCacheManager *v14;
  PUIMappedImageCacheManager *v15;
  uint64_t v16;
  BSAtomicFlag *invalidationFlag;
  uint64_t v18;
  NSURL *manifestURL;
  uint64_t v20;
  PFPathProvider *pathProvider;
  uint64_t v22;
  NSMapTable *cacheLock_cacheKeyToWeakCache;
  NSURL *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  uint64_t v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *cacheLock_manifest;
  PUIMappedImageCacheManager *v35;
  void *v37;
  id v38;
  objc_super v39;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathProvider"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIMappedImageCacheManager initWithNumberOfManagedCaches:pathProvider:].cold.1(a2);
LABEL_26:
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446977B8);
  }
  v8 = v7;
  objc_msgSend(v7, "cachesPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByStandardizingPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[cacheURL isFileURL]"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIMappedImageCacheManager initWithNumberOfManagedCaches:pathProvider:].cold.3(a2);
    goto LABEL_26;
  }
  objc_msgSend((id)objc_opt_class(), "registerCacheManager:cacheManager:", v10, self);
  v11 = (PUIMappedImageCacheManager *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || v11 == self)
  {
    v39.receiver = self;
    v39.super_class = (Class)PUIMappedImageCacheManager;
    v14 = -[PUIMappedImageCacheManager init](&v39, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_cacheURL, v10);
      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BDA0]), "initWithFlag:", 0);
      invalidationFlag = v15->_invalidationFlag;
      v15->_invalidationFlag = (BSAtomicFlag *)v16;

      -[NSURL URLByAppendingPathComponent:isDirectory:](v15->_cacheURL, "URLByAppendingPathComponent:isDirectory:", CFSTR(".CacheManagerManifest.plist"), 0);
      v18 = objc_claimAutoreleasedReturnValue();
      manifestURL = v15->_manifestURL;
      v15->_manifestURL = (NSURL *)v18;

      v15->_numberOfManagedCaches = a3;
      objc_msgSend(MEMORY[0x24BE74D08], "providerFromProvider:", v8);
      v20 = objc_claimAutoreleasedReturnValue();
      pathProvider = v15->_pathProvider;
      v15->_pathProvider = (PFPathProvider *)v20;

      v15->_cacheLock._os_unfair_lock_opaque = 0;
      objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
      v22 = objc_claimAutoreleasedReturnValue();
      cacheLock_cacheKeyToWeakCache = v15->_cacheLock_cacheKeyToWeakCache;
      v15->_cacheLock_cacheKeyToWeakCache = (NSMapTable *)v22;

      v24 = v15->_manifestURL;
      v38 = 0;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v24, 1, &v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v38;
      if (v26)
      {
        PUILogCaching();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[PUIMappedImageCacheManager initWithNumberOfManagedCaches:pathProvider:].cold.2();

      }
      if (objc_msgSend(v25, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v25, 0, 0, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "mutableCopy");
        v30 = v29;
        if (v29)
          v31 = v29;
        else
          v31 = (NSMutableDictionary *)objc_opt_new();
        cacheLock_manifest = v15->_cacheLock_manifest;
        v15->_cacheLock_manifest = v31;

        if (a3 != 0x7FFFFFFFFFFFFFFFLL)
          -[PUIMappedImageCacheManager _cacheLock_truncateCaches:](v15, "_cacheLock_truncateCaches:", 1);
      }
      else
      {
        v32 = objc_opt_new();
        v33 = v15->_cacheLock_manifest;
        v15->_cacheLock_manifest = (NSMutableDictionary *)v32;

      }
    }
    v13 = v15;
    self = v13;
  }
  else
  {
    v13 = v11;
  }
  v35 = v13;

  return v35;
}

- (void)dealloc
{
  objc_super v3;

  -[PUIMappedImageCacheManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PUIMappedImageCacheManager;
  -[PUIMappedImageCacheManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    v4 = (id)objc_msgSend(v3, "appendString:", CFSTR("invalidated"));
  }
  else
  {
    -[PUIMappedImageCacheManager activeCaches](self, "activeCaches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v5, CFSTR("activeCaches"), 1);

  }
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)checkoutImageCache:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIMappedImageCacheManager checkoutImageCache:date:](self, "checkoutImageCache:date:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)checkoutImageCache:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  void *v9;
  os_unfair_lock_s *p_cacheLock;
  id result;
  void *v12;

  v7 = a3;
  v8 = a4;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v9 = 0;
LABEL_5:

    return v9;
  }
  if (objc_msgSend(v7, "length"))
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    -[PUIMappedImageCacheManager _cacheLock_checkoutImageCache:didCreateNew:bumpDate:](self, "_cacheLock_checkoutImageCache:didCreateNew:bumpDate:", v7, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_cacheLock);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[imageCacheKey length] > 0"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[PUIMappedImageCacheManager checkoutImageCache:date:].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)returnImageCacheForKey:(id)a3
{
  id v4;
  BOOL v5;
  os_unfair_lock_s *p_cacheLock;

  v4 = a3;
  if (objc_msgSend(v4, "length") && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    v5 = -[PUIMappedImageCacheManager _cacheLock_teardownCacheForKey:](self, "_cacheLock_teardownCacheForKey:", v4);
    os_unfair_lock_unlock(p_cacheLock);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)returnImageCache:(id)a3
{
  void *v4;
  BOOL v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "pui_cacheIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[PUIMappedImageCacheManager returnImageCacheForKey:](self, "returnImageCacheForKey:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)removeImageCacheForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cacheLock;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    v6 = -[PUIMappedImageCacheManager _cacheLock_removeCacheForKey:](self, "_cacheLock_removeCacheForKey:", v4);
    os_unfair_lock_unlock(p_cacheLock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSSet)activeCaches
{
  void *v3;
  os_unfair_lock_s *p_cacheLock;

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    -[PUIMappedImageCacheManager _cacheLock_activeCaches](self, "_cacheLock_activeCaches");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_cacheLock);
  }
  return (NSSet *)v3;
}

- (id)_cacheLock_activeCaches
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_opt_new();
  -[NSMapTable keyEnumerator](self->_cacheLock_cacheKeyToWeakCache, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v3, "addObject:", v6);
      objc_msgSend(v4, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }

  return v3;
}

- (NSSet)knownCaches
{
  void *v3;
  os_unfair_lock_s *p_cacheLock;
  void *v5;
  void *v6;

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    v5 = (void *)MEMORY[0x24BDBCF20];
    -[NSMutableDictionary allKeys](self->_cacheLock_manifest, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_cacheLock);
  }
  return (NSSet *)v3;
}

- (void)invalidate
{
  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    objc_msgSend((id)objc_opt_class(), "unregisterCacheManagerForURL:", self->_cacheURL);
    os_unfair_lock_lock(&self->_cacheLock);
    -[NSMapTable removeAllObjects](self->_cacheLock_cacheKeyToWeakCache, "removeAllObjects");
    os_unfair_lock_unlock(&self->_cacheLock);
  }
}

- (id)_cacheLock_checkoutImageCache:(id)a3 didCreateNew:(BOOL *)a4 bumpDate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSString *cacheName;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSString *v15;
  void *v16;
  NSString *v18;
  int v19;
  NSString *v20;
  __int16 v21;
  PUIMappedImageCacheManager *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  PUILogCaching();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    v19 = 138544130;
    v20 = cacheName;
    v21 = 2048;
    v22 = self;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_24464E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] checkoutImageCache:%@ bumpDate:%@", (uint8_t *)&v19, 0x2Au);
  }

  -[NSMapTable objectForKey:](self->_cacheLock_cacheKeyToWeakCache, "objectForKey:", v8);
  v12 = objc_claimAutoreleasedReturnValue();
  PUILogCaching();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = self->_cacheName;
      v19 = 138543874;
      v20 = v15;
      v21 = 2048;
      v22 = self;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_24464E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] checkoutImageCache found cache for %@", (uint8_t *)&v19, 0x20u);
    }

    v16 = (void *)v12;
    if (a4)
LABEL_7:
      *a4 = v12 == 0;
  }
  else
  {
    if (v14)
    {
      v18 = self->_cacheName;
      v19 = 138543874;
      v20 = v18;
      v21 = 2048;
      v22 = self;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_24464E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] checkoutImageCache faulting in cache for %@", (uint8_t *)&v19, 0x20u);
    }

    -[PUIMappedImageCacheManager _cacheLock_buildMappedImageCacheForKey:](self, "_cacheLock_buildMappedImageCacheForKey:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      goto LABEL_7;
  }
  -[PUIMappedImageCacheManager _cacheLock_bumpManifestForImageCacheKey:bumpDate:](self, "_cacheLock_bumpManifestForImageCacheKey:bumpDate:", v8, v9);

  return v16;
}

- (id)_cacheLock_buildMappedImageCacheForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *cacheName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  NSString *v13;
  __int16 v14;
  PUIMappedImageCacheManager *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PUILogCaching();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    v12 = 138543874;
    v13 = cacheName;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_24464E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] building mapped image cache for key %@", (uint8_t *)&v12, 0x20u);
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74D08]), "initFromProvider:", self->_pathProvider);
  objc_msgSend(v7, "providerByAppendingPathComponent:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0BF30], "optionsWithContainerPathProvider:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BF28]), "initWithUniqueIdentifier:options:", v4, v9);
  objc_msgSend(v10, "pbui_setCacheManager:cacheIdentifier:", self, v4);
  -[NSMapTable setObject:forKey:](self->_cacheLock_cacheKeyToWeakCache, "setObject:forKey:", v10, v4);

  return v10;
}

- (BOOL)_cacheLock_teardownCacheForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *cacheName;
  void *v7;
  NSObject *v8;
  NSString *v9;
  const char *v10;
  void *v11;
  _BOOL4 v12;
  NSString *v13;
  NSString *v15;
  int v16;
  NSString *v17;
  __int16 v18;
  PUIMappedImageCacheManager *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PUILogCaching();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    v16 = 138543874;
    v17 = cacheName;
    v18 = 2048;
    v19 = self;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_24464E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] teardownCacheForKey key %@", (uint8_t *)&v16, 0x20u);
  }

  -[NSMapTable objectForKey:](self->_cacheLock_cacheKeyToWeakCache, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PUILogCaching();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_12;
    }
    v9 = self->_cacheName;
    v16 = 138543874;
    v17 = v9;
    v18 = 2048;
    v19 = self;
    v20 = 2112;
    v21 = v4;
    v10 = "[%{public}@/%p] teardownCacheForKey key %@ aborted; cache still alive somewhere";
LABEL_6:
    _os_log_impl(&dword_24464E000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, 0x20u);
    goto LABEL_7;
  }
  -[NSMutableDictionary objectForKey:](self->_cacheLock_manifest, "objectForKey:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PUILogCaching();
  v8 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (!v12)
      goto LABEL_7;
    v15 = self->_cacheName;
    v16 = 138543874;
    v17 = v15;
    v18 = 2048;
    v19 = self;
    v20 = 2112;
    v21 = v4;
    v10 = "[%{public}@/%p] teardownCacheForKey key %@ ignored - already cleaned up";
    goto LABEL_6;
  }
  if (v12)
  {
    v13 = self->_cacheName;
    v16 = 138543874;
    v17 = v13;
    v18 = 2048;
    v19 = self;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_24464E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] teardownCacheForKey key %@ finished", (uint8_t *)&v16, 0x20u);
  }

  -[PUIMappedImageCacheManager _cacheLock_truncateCaches:](self, "_cacheLock_truncateCaches:", 0);
LABEL_12:

  return v7 == 0;
}

- (BOOL)_cacheLock_removeCacheForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *cacheName;
  void *v7;
  NSObject *v8;
  NSString *v9;
  const char *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  NSString *v16;
  NSString *v18;
  NSString *v19;
  id v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  PUIMappedImageCacheManager *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PUILogCaching();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    *(_DWORD *)buf = 138543874;
    v22 = cacheName;
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_24464E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] removeCacheForKey %@", buf, 0x20u);
  }

  -[NSMapTable objectForKey:](self->_cacheLock_cacheKeyToWeakCache, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PUILogCaching();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      v11 = 0;
      goto LABEL_16;
    }
    v9 = self->_cacheName;
    *(_DWORD *)buf = 138543874;
    v22 = v9;
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    v10 = "[%{public}@/%p] removeCacheForKey %@ aborted; cache is live";
LABEL_6:
    _os_log_impl(&dword_24464E000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0x20u);
    goto LABEL_7;
  }
  -[NSMutableDictionary objectForKey:](self->_cacheLock_manifest, "objectForKey:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    PUILogCaching();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v18 = self->_cacheName;
    *(_DWORD *)buf = 138543874;
    v22 = v18;
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    v10 = "[%{public}@/%p] removeCacheForKey %@ aborted; not currently in manifest";
    goto LABEL_6;
  }
  v20 = 0;
  v13 = -[PUIMappedImageCacheManager _cacheLock_deleteCacheDirectoryForKey:error:](self, "_cacheLock_deleteCacheDirectoryForKey:error:", v4, &v20);
  v8 = v20;
  if (!v13)
  {
    PUILogCaching();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_cacheName;
      *(_DWORD *)buf = 138544130;
      v22 = v19;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v4;
      v27 = 2114;
      v28 = v8;
      _os_log_error_impl(&dword_24464E000, v14, OS_LOG_TYPE_ERROR, "[%{public}@/%p] removeCacheForKey; failed to cleanup cache key %@: %{public}@",
        buf,
        0x2Au);
    }

  }
  PUILogCaching();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_cacheName;
    *(_DWORD *)buf = 138543874;
    v22 = v16;
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_24464E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] removeCacheForKey %@ completed; cache destroyed",
      buf,
      0x20u);
  }

  v11 = 1;
LABEL_16:

  return v11;
}

- (void)_cacheLock_bumpManifestForImageCacheKey:(id)a3 bumpDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *cacheName;
  NSMutableDictionary *cacheLock_manifest;
  void *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  PUIMappedImageCacheManager *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PUILogCaching();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    v12 = 138544130;
    v13 = cacheName;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_24464E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] bumpManifestForImageCacheKey %@ ; bumping to %{public}@",
      (uint8_t *)&v12,
      0x2Au);
  }

  cacheLock_manifest = self->_cacheLock_manifest;
  if (v7)
  {
    -[NSMutableDictionary setObject:forKey:](self->_cacheLock_manifest, "setObject:forKey:", v7, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](cacheLock_manifest, "setObject:forKey:", v11, v6);

  }
  -[PUIMappedImageCacheManager _cacheLock_writeManifest](self, "_cacheLock_writeManifest");

}

- (void)_cacheLock_writeManifest
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_4(&dword_24464E000, v0, v1, "[%{public}@/%p] writeManifest failed: %{public}@");
  OUTLINED_FUNCTION_10_0();
}

- (void)_cacheLock_truncateCaches:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSString *cacheName;
  unint64_t v7;
  NSObject *v8;
  NSString *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  NSString *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSMutableDictionary *cacheLock_manifest;
  id v23;
  uint64_t v24;
  NSObject *v25;
  NSString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  int v35;
  NSObject *v36;
  _BOOL4 v37;
  NSString *v38;
  NSString *v39;
  BOOL v40;
  NSObject *v41;
  NSObject *v42;
  NSString *v43;
  NSString *v44;
  NSString *v45;
  int v46;
  NSObject *v47;
  NSString *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  NSObject *v55;
  NSString *v56;
  BOOL v57;
  NSObject *v58;
  NSObject *v59;
  NSString *v60;
  NSObject *v61;
  NSString *v62;
  id v63;
  _BOOL4 v64;
  int v65;
  id obj;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  uint8_t v79[128];
  uint8_t buf[4];
  NSString *v81;
  __int16 v82;
  PUIMappedImageCacheManager *v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  NSObject *v87;
  _BYTE v88[128];
  uint64_t v89;

  v3 = a3;
  v89 = *MEMORY[0x24BDAC8D0];
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    PUILogCaching();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      cacheName = self->_cacheName;
      *(_DWORD *)buf = 138543874;
      v81 = cacheName;
      v82 = 2048;
      v83 = self;
      v84 = 1024;
      LODWORD(v85) = v3;
      _os_log_impl(&dword_24464E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; truncate on disk caches? %{BOOL}u",
        buf,
        0x1Cu);
    }

    v7 = -[PUIMappedImageCacheManager numberOfManagedCaches](self, "numberOfManagedCaches");
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PUILogCaching();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_cacheName;
        *(_DWORD *)buf = 138543618;
        v81 = v9;
        v82 = 2048;
        v83 = self;
        _os_log_impl(&dword_24464E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches bailing;  number of managed caches is NSNotFound",
          buf,
          0x16u);
      }
LABEL_65:

      return;
    }
    v10 = v7;
    -[PUIMappedImageCacheManager _cacheLock_activeCaches](self, "_cacheLock_activeCaches");
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    -[NSMutableDictionary allKeys](self->_cacheLock_manifest, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "count");
    PUILogCaching();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14 <= v10)
    {
      if (v16)
      {
        v45 = self->_cacheName;
        *(_DWORD *)buf = 138543618;
        v81 = v45;
        v82 = 2048;
        v83 = self;
        _os_log_impl(&dword_24464E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; known caches is less than max number of managed caches",
          buf,
          0x16u);
      }

      v46 = 0;
      if (!v3)
        goto LABEL_60;
    }
    else
    {
      if (v16)
      {
        v17 = self->_cacheName;
        *(_DWORD *)buf = 138543618;
        v81 = v17;
        v82 = 2048;
        v83 = self;
        _os_log_impl(&dword_24464E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will proceed",
          buf,
          0x16u);
      }

      v18 = objc_alloc(MEMORY[0x24BE0BE38]);
      v19 = -[NSMutableDictionary count](self->_cacheLock_manifest, "count");
      objc_msgSend(MEMORY[0x24BE0BE58], "sortUsingComparator:", &__block_literal_global_41_0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v18, "initWithCapacity:keyOrderingStrategy:", v19, v20);

      cacheLock_manifest = self->_cacheLock_manifest;
      v77[0] = MEMORY[0x24BDAC760];
      v77[1] = 3221225472;
      v77[2] = __56__PUIMappedImageCacheManager__cacheLock_truncateCaches___block_invoke_2;
      v77[3] = &unk_25154CE40;
      v23 = v21;
      v78 = v23;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cacheLock_manifest, "enumerateKeysAndObjectsUsingBlock:", v77);
      v24 = objc_msgSend(v23, "count") - v10;
      if (v24 < 1)
      {
        v31 = 0;
      }
      else
      {
        PUILogCaching();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = self->_cacheName;
          *(_DWORD *)buf = 138543874;
          v81 = v26;
          v82 = 2048;
          v83 = self;
          v84 = 2048;
          v85 = v24;
          _os_log_impl(&dword_24464E000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will attempt to cleanup %lu caches",
            buf,
            0x20u);
        }
        v64 = v3;

        v63 = v23;
        objc_msgSend(v23, "allValues");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "subarrayWithRange:", v10, v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = 0u;
        v74 = 0u;
        v75 = 0u;
        v73 = 0u;
        obj = v28;
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
        if (v29)
        {
          v30 = v29;
          v31 = 0;
          v32 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v74 != v32)
                objc_enumerationMutation(obj);
              v34 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
              v35 = -[NSObject containsObject:](v8, "containsObject:", v34);
              PUILogCaching();
              v36 = objc_claimAutoreleasedReturnValue();
              v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
              if (v35)
              {
                if (v37)
                {
                  v38 = self->_cacheName;
                  *(_DWORD *)buf = 138543874;
                  v81 = v38;
                  v82 = 2048;
                  v83 = self;
                  v84 = 2114;
                  v85 = v34;
                  _os_log_impl(&dword_24464E000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will not cleanup cache %{public}@ as it is still active",
                    buf,
                    0x20u);
                }
              }
              else
              {
                if (v37)
                {
                  v39 = self->_cacheName;
                  *(_DWORD *)buf = 138543874;
                  v81 = v39;
                  v82 = 2048;
                  v83 = self;
                  v84 = 2114;
                  v85 = v34;
                  _os_log_impl(&dword_24464E000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will cleanup cache %{public}@",
                    buf,
                    0x20u);
                }

                -[NSMutableDictionary removeObjectForKey:](self->_cacheLock_manifest, "removeObjectForKey:", v34);
                v72 = 0;
                v40 = -[PUIMappedImageCacheManager _cacheLock_deleteCacheDirectoryForKey:error:](self, "_cacheLock_deleteCacheDirectoryForKey:error:", v34, &v72);
                v36 = v72;
                if (!v40)
                {
                  PUILogCaching();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  {
                    v44 = self->_cacheName;
                    *(_DWORD *)buf = 138544130;
                    v81 = v44;
                    v82 = 2048;
                    v83 = self;
                    v84 = 2112;
                    v85 = v34;
                    v86 = 2114;
                    v87 = v36;
                    _os_log_error_impl(&dword_24464E000, v41, OS_LOG_TYPE_ERROR, "[%{public}@/%p] truncateCaches; failed to cleanup cache key %@: %{public}@",
                      buf,
                      0x2Au);
                  }

                }
                PUILogCaching();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  v43 = self->_cacheName;
                  *(_DWORD *)buf = 138543874;
                  v81 = v43;
                  v82 = 2048;
                  v83 = self;
                  v84 = 2114;
                  v85 = v34;
                  _os_log_impl(&dword_24464E000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; did cleanup cache %{public}@",
                    buf,
                    0x20u);
                }

                v31 = 1;
              }

            }
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
          }
          while (v30);
        }
        else
        {
          v31 = 0;
        }

        v3 = v64;
        v23 = v63;
      }

      v46 = v31 & 1;
      if (!v3)
        goto LABEL_60;
    }
    v65 = v46;
    PUILogCaching();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = self->_cacheName;
      *(_DWORD *)buf = 138543618;
      v81 = v48;
      v82 = 2048;
      v83 = self;
      _os_log_impl(&dword_24464E000, v47, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will truncate on disk caches",
        buf,
        0x16u);
    }

    -[PUIMappedImageCacheManager _cacheLock_onDiskCaches](self, "_cacheLock_onDiskCaches");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v69 != v52)
            objc_enumerationMutation(v49);
          v54 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
          if ((objc_msgSend(v13, "containsObject:", v54) & 1) == 0
            && (-[NSObject containsObject:](v8, "containsObject:", v54) & 1) == 0)
          {
            PUILogCaching();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              v56 = self->_cacheName;
              *(_DWORD *)buf = 138543874;
              v81 = v56;
              v82 = 2048;
              v83 = self;
              v84 = 2114;
              v85 = v54;
              _os_log_impl(&dword_24464E000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; truncating on disk cache %{public}@",
                buf,
                0x20u);
            }

            v67 = 0;
            v57 = -[PUIMappedImageCacheManager _cacheLock_deleteCacheDirectoryForKey:error:](self, "_cacheLock_deleteCacheDirectoryForKey:error:", v54, &v67);
            v58 = v67;
            if (!v57)
            {
              PUILogCaching();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v60 = self->_cacheName;
                *(_DWORD *)buf = 138544130;
                v81 = v60;
                v82 = 2048;
                v83 = self;
                v84 = 2112;
                v85 = v54;
                v86 = 2114;
                v87 = v58;
                _os_log_error_impl(&dword_24464E000, v59, OS_LOG_TYPE_ERROR, "[%{public}@/%p] truncateOnDiskCaches; failed to cleanup on disk cache key %@: %{public}@",
                  buf,
                  0x2Au);
              }

            }
          }
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      }
      while (v51);
    }

    v46 = v65;
LABEL_60:
    if (v46)
    {
      PUILogCaching();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = self->_cacheName;
        *(_DWORD *)buf = 138543618;
        v81 = v62;
        v82 = 2048;
        v83 = self;
        _os_log_impl(&dword_24464E000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; wrinting to manifest",
          buf,
          0x16u);
      }

      -[PUIMappedImageCacheManager _cacheLock_writeManifest](self, "_cacheLock_writeManifest");
    }

    goto LABEL_65;
  }
}

uint64_t __56__PUIMappedImageCacheManager__cacheLock_truncateCaches___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __56__PUIMappedImageCacheManager__cacheLock_truncateCaches___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a2, a3);
}

- (BOOL)_cacheLock_deleteCacheDirectoryForKey:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD1580];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_cacheURL, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v8, "removeItemAtURL:error:", v9, a4);
  return (char)a4;
}

- (id)_cacheLock_onDiskCaches
{
  void *v3;
  NSURL *cacheURL;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSString *cacheName;
  void *v22;
  void *v24;
  PUIMappedImageCacheManager *v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  PUIMappedImageCacheManager *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v26 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self;
  cacheURL = self->_cacheURL;
  v5 = *MEMORY[0x24BDBCC40];
  v43[0] = *MEMORY[0x24BDBCC40];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", cacheURL, v6, 5, &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;

  if (v8)
  {
    PUILogCaching();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PUIMappedImageCacheManager _cacheLock_onDiskCaches].cold.1();

  }
  v24 = v8;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    v14 = *MEMORY[0x24BDBCC38];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
        v27 = 0;
        v28 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v28, v5, &v27);
        v17 = v28;
        v18 = v27;
        if (v18)
        {
          PUILogCaching();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            cacheName = v25->_cacheName;
            *(_DWORD *)buf = 138544130;
            v35 = cacheName;
            v36 = 2048;
            v37 = v25;
            v38 = 2112;
            v39 = v16;
            v40 = 2114;
            v41 = v18;
            _os_log_error_impl(&dword_24464E000, v19, OS_LOG_TYPE_ERROR, "[%{public}@/%p] onDiskCaches; failed to read resource type for URL %@: %{public}@",
              buf,
              0x2Au);
          }

        }
        if (objc_msgSend(v17, "isEqualToString:", v14))
        {
          objc_msgSend(v16, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v20);

        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v12);
  }

  v22 = (void *)objc_msgSend(v26, "copy");
  return v22;
}

- (unint64_t)numberOfManagedCaches
{
  return self->_numberOfManagedCaches;
}

- (BSPathProviding)pathProvider
{
  return (BSPathProviding *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_pathProvider, 0);
  objc_storeStrong((id *)&self->_cacheLock_manifest, 0);
  objc_storeStrong((id *)&self->_cacheLock_cacheKeyToWeakCache, 0);
}

+ (void)registerCacheManager:cacheManager:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_2(&dword_24464E000, v0, v1, "Unable to create directory %@: %{public}@");
}

- (void)initWithNumberOfManagedCaches:(const char *)a1 pathProvider:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithNumberOfManagedCaches:pathProvider:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_2(&dword_24464E000, v0, v1, "[%p] failed to read manifest: %{public}@");
}

- (void)initWithNumberOfManagedCaches:(const char *)a1 pathProvider:.cold.3(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)checkoutImageCache:(const char *)a1 date:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_cacheLock_onDiskCaches
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_4(&dword_24464E000, v0, v1, "[%{public}@/%p] onDiskCaches; failed to read on disk caches: %{public}@");
  OUTLINED_FUNCTION_10_0();
}

@end
