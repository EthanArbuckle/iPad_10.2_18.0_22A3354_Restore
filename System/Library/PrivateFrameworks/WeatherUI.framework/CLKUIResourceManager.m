@implementation CLKUIResourceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  return (id)sharedInstance___sharedInstance;
}

void __38__CLKUIResourceManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v0;

}

- (CLKUIResourceManager)init
{
  CLKUIResourceManager *v2;
  uint64_t v3;
  NSMutableDictionary *atlasesByUuid;
  uint64_t v5;
  NSMutableDictionary *providersByKey;
  uint64_t v7;
  NSMutableDictionary *recentProvidersForUuid;
  uint64_t v9;
  NSMutableArray *textureLoaderQueues;
  int v11;
  uint64_t v12;
  NSRecursiveLock *v13;
  NSRecursiveLock *lock;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLKUIResourceManager;
  v2 = -[CLKUIResourceManager init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    atlasesByUuid = v2->_atlasesByUuid;
    v2->_atlasesByUuid = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    providersByKey = v2->_providersByKey;
    v2->_providersByKey = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    recentProvidersForUuid = v2->_recentProvidersForUuid;
    v2->_recentProvidersForUuid = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    textureLoaderQueues = v2->_textureLoaderQueues;
    v2->_textureLoaderQueues = (NSMutableArray *)v9;

    v11 = CLKRunningInProcess();
    v12 = 36700160;
    if (!v11)
      v12 = -1;
    v2->_memoryLimit = v12;
    v2->_explicitMemoryLimit = -1;
    v13 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v2->_lock;
    v2->_lock = v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__purgeAllUnconditionally, *MEMORY[0x1E0C93E68], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93E68], 0);

  v4.receiver = self;
  v4.super_class = (Class)CLKUIResourceManager;
  -[CLKUIResourceManager dealloc](&v4, sel_dealloc);
}

- (id)nullAtlas2D
{
  return 0;
}

- (id)nullAtlasCube
{
  return 0;
}

- (id)textureForUuid:(id)a3 delegate:(id)a4 rect:(id)a5 nullTexture:
{
  __int128 v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CLKUITexture *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  double v20;

  v19 = v5;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "resourceProviderKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = 0;
  if (v9 && v12)
  {
    objc_msgSend(v12, "key");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSRecursiveLock lock](self->_lock, "lock");
    -[NSMutableDictionary objectForKey:](self->_providersByKey, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v16 = (void *)objc_msgSend((id)objc_opt_new(), "initWithDelegate:key:", v10, v15);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_providersByKey, "setObject:forKeyedSubscript:", v16, v15);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentProvidersForUuid, "setObject:forKeyedSubscript:", v16, v9, v19);
    objc_msgSend(v16, "addUuidToHistory:", v9);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", v9);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = -[CLKUIResourceManager _newAtlasForUuid:nullTexture:](self, "_newAtlasForUuid:nullTexture:", v9, v11);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_atlasesByUuid, "setObject:forKeyedSubscript:", v17, v9);
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    v14 = -[CLKUITexture initWithAtlas:rect:]([CLKUITexture alloc], "initWithAtlas:rect:", v17, v20);

  }
  return v14;
}

- (void)purge:(id)a3
{
  NSRecursiveLock *lock;
  id v5;
  void *v6;
  id v7;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isPurgable"))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "addObject:", v7);
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    -[CLKUIResourceManager _purgeAtlases:](self, "_purgeAtlases:", v6);

  }
  else
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

}

- (unint64_t)_memoryLimit
{
  unint64_t explicitMemoryLimit;

  -[NSRecursiveLock lock](self->_lock, "lock");
  explicitMemoryLimit = self->_explicitMemoryLimit;
  if (explicitMemoryLimit == -1)
    explicitMemoryLimit = self->_memoryLimit;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return explicitMemoryLimit;
}

- (unint64_t)_computeMemoryAvailable
{
  unint64_t explicitMemoryLimit;
  unint64_t v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  explicitMemoryLimit = self->_explicitMemoryLimit;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (explicitMemoryLimit == -1 && !CLKRunningInProcess())
    return -1;
  v4 = MEMORY[0x1B5E03990]();
  if (v4 >= 0x500000)
    return v4 - 5242880;
  else
    return 0;
}

- (id)_fetchOldestAtlas
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  id v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_atlasesByUuid;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isPurgable"))
        {
          if (v6)
          {
            objc_msgSend(v10, "boundTime");
            if (v11 < v8)
            {
              v12 = v11;
              v13 = v10;

              v8 = v12;
              v6 = v13;
            }
          }
          else
          {
            v6 = v10;
            objc_msgSend(v6, "boundTime");
            v8 = v14;
          }
        }

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v6;
}

- (id)borrowTextureLoadingQueue
{
  void *v3;
  NSObject *v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[NSMutableArray count](self->_textureLoaderQueues, "count"))
  {
    -[NSMutableArray lastObject](self->_textureLoaderQueues, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_textureLoaderQueues, "removeLastObject");
  }
  else
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create("CLKUIMetalTexture queue", v4);

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)returnTextureLoadingQueue:(id)a3
{
  NSRecursiveLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[NSMutableArray addObject:](self->_textureLoaderQueues, "addObject:", v5);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)memoryIsAvailable:(unint64_t)a3
{
  unint64_t v5;
  BOOL v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = -[CLKUIResourceManager _computeMemoryAvailable](self, "_computeMemoryAvailable");
  v7 = self->_memoryUsed + a3 <= -[CLKUIResourceManager _memoryLimit](self, "_memoryLimit") && v5 >= a3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (BOOL)ensureMemoryAvailable:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  NSObject *v9;
  unint64_t memoryUsed;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  void *v19;
  NSObject *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  unint64_t v27;
  __int128 v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = -[CLKUIResourceManager _computeMemoryAvailable](self, "_computeMemoryAvailable");
  v6 = -[CLKUIResourceManager _memoryLimit](self, "_memoryLimit");
  if (self->_memoryUsed + a3 <= v6 && v5 >= a3)
  {
LABEL_12:
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    return 1;
  }
  v8 = v6;
  CLKLoggingObjectForDomain();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    memoryUsed = self->_memoryUsed;
    *(_DWORD *)buf = 134218752;
    v31 = a3;
    v32 = 2048;
    v33 = v5;
    v34 = 2048;
    v35 = memoryUsed;
    v36 = 2048;
    v37 = v8;
    _os_log_impl(&dword_1AFABF000, v9, OS_LOG_TYPE_DEFAULT, "evications begin (needs %lu bytes, %lu available bytes, %lu memory used, %lu limit)", buf, 0x2Au);
  }

  -[CLKUIResourceManager purgeAllUnused](self, "purgeAllUnused");
  v11 = -[CLKUIResourceManager _computeMemoryAvailable](self, "_computeMemoryAvailable");
  v12 = v11;
  if (self->_memoryUsed + a3 <= v8 && v11 >= a3)
  {
    CLKLoggingObjectForDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_memoryUsed;
      *(_DWORD *)buf = 134218240;
      v31 = v12;
      v32 = 2048;
      v33 = v14;
      _os_log_impl(&dword_1AFABF000, v13, OS_LOG_TYPE_DEFAULT, "evications end: success (%lu available bytes, %lu memory used)", buf, 0x16u);
    }

    goto LABEL_12;
  }
  v16 = (void *)objc_opt_new();
  -[CLKUIResourceManager _fetchOldestAtlas](self, "_fetchOldestAtlas");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v19 = (void *)v17;
    *(_QWORD *)&v18 = 138412290;
    v29 = v18;
    while (1)
    {
      CLKLoggingObjectForDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v29;
        v31 = (unint64_t)v21;
        _os_log_impl(&dword_1AFABF000, v20, OS_LOG_TYPE_DEFAULT, "evict uuid %@", buf, 0xCu);

      }
      objc_msgSend(v16, "addObject:", v19);
      -[CLKUIResourceManager _purgeAtlases:](self, "_purgeAtlases:", v16);
      objc_msgSend(v16, "removeAllObjects");
      v22 = -[CLKUIResourceManager _computeMemoryAvailable](self, "_computeMemoryAvailable");
      v12 = v22;
      if (self->_memoryUsed + a3 <= v8 && v22 >= a3)
        break;
      -[CLKUIResourceManager _fetchOldestAtlas](self, "_fetchOldestAtlas", v29);
      v23 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v23;
      if (!v23)
        goto LABEL_20;
    }
    CLKLoggingObjectForDomain();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = self->_memoryUsed;
      *(_DWORD *)buf = 134218240;
      v31 = v12;
      v32 = 2048;
      v33 = v27;
      _os_log_impl(&dword_1AFABF000, v26, OS_LOG_TYPE_DEFAULT, "evications end: success (%lu available bytes, %lu memory used)", buf, 0x16u);
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
    v15 = 1;
  }
  else
  {
LABEL_20:
    CLKLoggingObjectForDomain();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_memoryUsed;
      *(_DWORD *)buf = 134218240;
      v31 = v12;
      v32 = 2048;
      v33 = v25;
      _os_log_impl(&dword_1AFABF000, v24, OS_LOG_TYPE_DEFAULT, "evications end: failed (%lu available bytes, %lu memory used)", buf, 0x16u);
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
    v15 = 0;
  }

  return v15;
}

- (void)purgeAllUnused
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v3 = self->_providersByKey;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_providersByKey, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          if (!v6)
            v6 = (void *)objc_opt_new();
          objc_msgSend(v6, "addObject:", v9);
        }

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = self->_atlasesByUuid;
  v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "instanceCount"))
        {
          if (objc_msgSend(v20, "isPurgable"))
          {
            if (!v16)
              v16 = (void *)objc_opt_new();
            objc_msgSend(v16, "addObject:", v20);
          }
          if (!v15)
            v15 = (void *)objc_opt_new();
          objc_msgSend(v15, "addObject:", v19);
        }

      }
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    }
    while (v14);

    if (v16)
      -[CLKUIResourceManager _purgeAtlases:](self, "_purgeAtlases:", v16);
    if (v6)
      goto LABEL_32;
  }
  else
  {

    v16 = 0;
    v15 = 0;
    if (v6)
LABEL_32:
      -[NSMutableDictionary removeObjectsForKeys:](self->_providersByKey, "removeObjectsForKeys:", v6);
  }
  if (v15)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v21 = v15;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    if (v22)
    {
      v24 = v22;
      v25 = *(_QWORD *)v31;
      *(_QWORD *)&v23 = 138412290;
      v29 = v23;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v21);
          v27 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k);
          CLKLoggingObjectForDomain();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v43 = v27;
            _os_log_impl(&dword_1AFABF000, v28, OS_LOG_TYPE_DEFAULT, "discard uuid %@", buf, 0xCu);
          }

          -[NSMutableDictionary removeObjectForKey:](self->_atlasesByUuid, "removeObjectForKey:", v27);
          -[NSMutableDictionary removeObjectForKey:](self->_recentProvidersForUuid, "removeObjectForKey:", v27);
        }
        v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      }
      while (v24);
    }

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock", v29, (_QWORD)v30);

}

- (void)updateTextureStreaming
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_atlasesByUuid, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isPurgable"))
          -[CLKUIResourceManager _updateTextureStreamingForAtlas:](self, "_updateTextureStreamingForAtlas:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)notifyAtlas:(id)a3 willChangeToMemoryCost:(unint64_t)a4
{
  NSRecursiveLock *lock;
  id v7;
  uint64_t v8;

  lock = self->_lock;
  v7 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  self->_memoryUsed += a4;
  v8 = objc_msgSend(v7, "memoryCost");

  self->_memoryUsed -= v8;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (id)delegateForUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_recentProvidersForUuid, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (!v5 || (objc_msgSend(v5, "delegate"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v16 = v5;
    -[NSRecursiveLock lock](self->_lock, "lock");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_providersByKey;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_providersByKey, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "delegate");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            objc_msgSend(v12, "uuidHistory");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "containsObject:", v4);

            if ((v14 & 1) != 0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentProvidersForUuid, "setObject:forKeyedSubscript:", v12, v4);
              -[NSRecursiveLock unlock](self->_lock, "unlock");

              goto LABEL_14;
            }
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
    v6 = 0;
LABEL_14:
    v5 = v16;
  }

  return v6;
}

- (void)_purgeAllUnconditionally
{
  void *v3;
  NSMutableDictionary *v4;
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
  v3 = (void *)objc_opt_new();
  -[NSRecursiveLock lock](self->_lock, "lock");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_atlasesByUuid;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isPurgable"))
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[CLKUIResourceManager _purgeAtlases:](self, "_purgeAtlases:", v3);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4
{
  return 0;
}

- (unint64_t)explicitMemoryLimit
{
  return self->_explicitMemoryLimit;
}

- (void)setExplicitMemoryLimit:(unint64_t)a3
{
  self->_explicitMemoryLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_textureLoaderQueues, 0);
  objc_storeStrong((id *)&self->_providersByKey, 0);
  objc_storeStrong((id *)&self->_atlasesByUuid, 0);
  objc_storeStrong((id *)&self->_recentProvidersForUuid, 0);
}

@end
