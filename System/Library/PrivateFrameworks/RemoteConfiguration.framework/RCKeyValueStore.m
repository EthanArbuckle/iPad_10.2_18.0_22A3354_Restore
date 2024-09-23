@implementation RCKeyValueStore

- (id)_loadFromDisk
{
  void *v3;
  void *v4;
  void *v5;
  double Current;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[RCKeyValueStore storeDirectory](self, "storeDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCKeyValueStore name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    -[RCKeyValueStore setStoreSize:](self, "setStoreSize:", objc_msgSend(v7, "length"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v44;
    objc_msgSend(v10, "objectForKey:", CFSTR("data"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v12);
    objc_msgSend(v10, "objectForKey:", CFSTR("version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v10, "objectForKey:", CFSTR("clientVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v15, "unsignedIntegerValue");

    v16 = CFAbsoluteTimeGetCurrent();
    RCSharedLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[RCKeyValueStore name](self, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v18;
      v48 = 2048;
      v49 = (v16 - Current) * 1000.0;
      _os_log_impl(&dword_1A1FB5000, v17, OS_LOG_TYPE_DEBUG, "Loaded %@ cache in %f ms", buf, 0x16u);

    }
    if (v14 == 1)
    {
      if (v39 == -[RCKeyValueStore clientVersion](self, "clientVersion"))
      {
        v19 = v9;
      }
      else
      {
        v38 = v11;
        if (-[RCKeyValueStore _shouldMigrateOnUpgrade](self, "_shouldMigrateOnUpgrade"))
        {
          -[RCKeyValueStore migrator](self, "migrator");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[RCKeyValueStore _loadFromDisk].cold.1();
        }
        if (-[RCKeyValueStore _shouldMigrateOnUpgrade](self, "_shouldMigrateOnUpgrade")
          && (-[RCKeyValueStore migrator](self, "migrator"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = objc_msgSend(v21, "keyValueStore:canMigrateFromVersion:", self, v39),
              v21,
              v22))
        {
          v34 = v12;
          v35 = v10;
          v36 = v8;
          v37 = v5;
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          objc_msgSend(v9, "allKeys");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "copy");

          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v41 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
                objc_msgSend(v9, "objectForKey:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[RCKeyValueStore migrator](self, "migrator");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "keyValueStore:migrateObject:forKey:fromVersion:", self, v30, v29, v39);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (v32)
                  objc_msgSend(v9, "setObject:forKey:", v32, v29);
                else
                  objc_msgSend(v9, "removeObjectForKey:", v29);

              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
            }
            while (v26);
          }

          v19 = v9;
          v8 = v36;
          v5 = v37;
          v12 = v34;
          v10 = v35;
        }
        else
        {
          -[RCKeyValueStore _clearStore](self, "_clearStore");
          v19 = 0;
        }
        v11 = v38;
      }
    }
    else
    {
      -[RCKeyValueStore _clearStore](self, "_clearStore");
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)storeDirectory
{
  return self->_storeDirectory;
}

- (void)setStoreSize:(unint64_t)a3
{
  self->_storeSize = a3;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)clientVersion
{
  return self->_clientVersion;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RCKeyValueStore objectsByKey](self, "objectsByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)objectsByKey
{
  return self->_objectsByKey;
}

- (id)allKeys
{
  void *v2;
  void *v3;

  -[RCKeyValueStore objectsByKey](self, "objectsByKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      -[RCKeyValueStore objectsByKey](self, "objectsByKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 != v6)
      {
        -[RCKeyValueStore writeLock](self, "writeLock");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __36__RCKeyValueStore_setObject_forKey___block_invoke;
        v11[3] = &unk_1E470EC50;
        v11[4] = self;
        v12 = v6;
        v13 = v7;
        objc_msgSend(v10, "performWithLockSync:", v11);

      }
      -[RCKeyValueStore _queueSave](self, "_queueSave");
    }
    else
    {
      -[RCKeyValueStore removeObjectForKey:](self, "removeObjectForKey:", v7);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCKeyValueStore setObject:forKey:].cold.1();
  }

}

void __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  double Current;
  void *v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "_persistOnlyInMemoryEnabled"))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    return;
  }
  objc_msgSend(*v2, "writeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  if (objc_msgSend(*v2, "needSave"))
  {
    objc_msgSend(*v2, "objectsByKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*v2, "setNeedSave:", 0);
  objc_msgSend(*v2, "writeLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  if (v6)
  {
    objc_msgSend(*v2, "storeDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E4718620, CFSTR("version"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*v2, "clientVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("clientVersion"));

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("data"));
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, &v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke_cold_1(v2, (uint64_t)v14);
      RCSharedLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*v2, "name");
        v16 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v16;
        v31 = 2114;
        v32 = *(double *)&v14;
        _os_log_impl(&dword_1A1FB5000, v15, OS_LOG_TYPE_ERROR, "failed to serialize %{public}@ key-value store plist with error: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      if (!v13)
      {
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(*v2, "setStoreSize:", objc_msgSend(v13, "length"));
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "writeToURL:atomically:", v15, 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*v2, "_isBackupEnabled") ^ 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0C999D8];
      v27 = 0;
      v20 = -[NSObject setResourceValue:forKey:error:](v15, "setResourceValue:forKey:error:", v18, v19, &v27);
      v26 = v27;

      if ((v20 & 1) == 0)
      {
        RCSharedLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v15;
          v31 = 2114;
          v32 = *(double *)&v26;
          _os_log_impl(&dword_1A1FB5000, v21, OS_LOG_TYPE_ERROR, "Failed to set backup status for %{public}@ -- %{public}@", buf, 0x16u);
        }

      }
      v22 = CFAbsoluteTimeGetCurrent();
      RCSharedLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*v2, "name");
        v24 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v24;
        v31 = 2048;
        v32 = v22 - Current;
        _os_log_impl(&dword_1A1FB5000, v23, OS_LOG_TYPE_DEBUG, "Saved %@ cache in %f ms", buf, 0x16u);

      }
      objc_msgSend(*v2, "_logCacheStatus");

    }
    goto LABEL_22;
  }
LABEL_23:
  v25 = *(_QWORD *)(a1 + 40);
  if (v25)
    (*(void (**)(void))(v25 + 16))();

}

- (RCMutexLock)writeLock
{
  return self->_writeLock;
}

- (void)setNeedSave:(BOOL)a3
{
  self->_needSave = a3;
}

uint64_t __36__RCKeyValueStore_setObject_forKey___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectsByKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 32), "setNeedSave:", 1);
}

- (BOOL)needSave
{
  return self->_needSave;
}

- (void)_queueSave
{
  id v2;

  -[RCKeyValueStore saveThrottler](self, "saveThrottler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tickle");

}

- (RCOperationThrottler)saveThrottler
{
  return self->_saveThrottler;
}

- (BOOL)_persistOnlyInMemoryEnabled
{
  return (LOBYTE(self->_optionsMask) >> 2) & 1;
}

- (void)_logCacheStatus
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[RCKeyValueStore storeSize](self, "storeSize");
  RCSharedLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[RCKeyValueStore name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2048;
    v9 = (float)((float)v3 * 0.00000095367);
    _os_log_impl(&dword_1A1FB5000, v4, OS_LOG_TYPE_DEBUG, "Cache Status:\n* Cache name:\t\t%@\n* Total size (MB):\t%2.4f\n*", (uint8_t *)&v6, 0x16u);

  }
}

- (unint64_t)storeSize
{
  return self->_storeSize;
}

- (BOOL)_isBackupEnabled
{
  return self->_optionsMask & 1;
}

void __35__RCKeyValueStore_persistenceQueue__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  objc_msgSend(CFSTR("com.apple.remoteconfiguration."), "stringByAppendingString:", CFSTR("persistenceQueue"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)persistenceQueue_s_persistenceQueue;
  persistenceQueue_s_persistenceQueue = (uint64_t)v0;

  objc_msgSend((id)persistenceQueue_s_persistenceQueue, "setQualityOfService:", 9);
  objc_msgSend((id)persistenceQueue_s_persistenceQueue, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend((id)persistenceQueue_s_persistenceQueue, "setName:", v2);

}

- (RCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 migrator:(id)a7
{
  id v13;
  id v14;
  id v15;
  RCKeyValueStore *v16;
  RCKeyValueStore *v17;
  uint64_t v18;
  NSString *storeDirectory;
  RCMutexLock *v20;
  RCMutexLock *writeLock;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *objectsByKey;
  RCTimedOperationThrottler *v26;
  RCOperationThrottler *saveThrottler;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v29.receiver = self;
  v29.super_class = (Class)RCKeyValueStore;
  v16 = -[RCKeyValueStore init](&v29, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    v17->_clientVersion = a5;
    v17->_optionsMask = a6;
    -[RCKeyValueStore _initializeStoreDirectoryWithName:](v17, "_initializeStoreDirectoryWithName:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    storeDirectory = v17->_storeDirectory;
    v17->_storeDirectory = (NSString *)v18;

    objc_storeStrong((id *)&v17->_migrator, a7);
    v20 = objc_alloc_init(RCMutexLock);
    writeLock = v17->_writeLock;
    v17->_writeLock = v20;

    v22 = (void *)MEMORY[0x1E0C99E08];
    -[RCKeyValueStore _loadFromDisk](v17, "_loadFromDisk");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryWithDictionary:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    objectsByKey = v17->_objectsByKey;
    v17->_objectsByKey = (NSMutableDictionary *)v24;

    v17->_needSave = 1;
    v26 = -[RCTimedOperationThrottler initWithDelegate:]([RCTimedOperationThrottler alloc], "initWithDelegate:", v17);
    -[RCTimedOperationThrottler setCooldownTime:](v26, "setCooldownTime:", 1.0);
    saveThrottler = v17->_saveThrottler;
    v17->_saveThrottler = (RCOperationThrottler *)v26;

  }
  return v17;
}

- (RCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6
{
  return -[RCKeyValueStore initWithName:directory:version:options:migrator:](self, "initWithName:directory:version:options:migrator:", a3, a4, a5, a6, 0);
}

- (id)_initializeStoreDirectoryWithName:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  id v8;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v10);
    v8 = v10;

    if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[RCKeyValueStore _initializeStoreDirectoryWithName:].cold.1((uint64_t)v8);

  }
  return v3;
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  -[RCKeyValueStore _saveAsyncWithCompletionHandler:](self, "_saveAsyncWithCompletionHandler:", a4);
}

- (void)_saveAsyncWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "persistenceQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E470DEC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

+ (id)persistenceQueue
{
  if (persistenceQueue_onceToken != -1)
    dispatch_once(&persistenceQueue_onceToken, &__block_literal_global_5);
  return (id)persistenceQueue_s_persistenceQueue;
}

+ (BOOL)shouldDumpToJSON
{
  return 0;
}

- (RCKeyValueStore)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[RCKeyValueStore init]";
    v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Persistence/RCKeyValueStore.m";
    v11 = 1024;
    v12 = 73;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[RCKeyValueStore init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)containsObjectForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[RCKeyValueStore objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setObjects:(id)a3 forKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCKeyValueStore addEntriesFromDictionary:](self, "addEntriesFromDictionary:", v9);

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCKeyValueStore setObjects:forKeys:].cold.2();
  if (!v8)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[RCKeyValueStore setObjects:forKeys:].cold.1();
  }
LABEL_9:

}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  RCKeyValueStore *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    -[RCKeyValueStore writeLock](self, "writeLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __44__RCKeyValueStore_addEntriesFromDictionary___block_invoke;
    v9 = &unk_1E470DE50;
    v10 = self;
    v11 = v4;
    objc_msgSend(v5, "performWithLockSync:", &v6);

    -[RCKeyValueStore _queueSave](self, "_queueSave", v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCKeyValueStore addEntriesFromDictionary:].cold.1();
  }

}

uint64_t __44__RCKeyValueStore_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectsByKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "setNeedSave:", 1);
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  RCKeyValueStore *v12;
  id v13;

  v4 = a3;
  -[RCKeyValueStore objectsByKey](self, "objectsByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RCKeyValueStore writeLock](self, "writeLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __38__RCKeyValueStore_removeObjectForKey___block_invoke;
    v11 = &unk_1E470DE50;
    v12 = self;
    v13 = v4;
    objc_msgSend(v7, "performWithLockSync:", &v8);

    -[RCKeyValueStore _queueSave](self, "_queueSave", v8, v9, v10, v11, v12);
  }

}

uint64_t __38__RCKeyValueStore_removeObjectForKey___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectsByKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "setNeedSave:", 1);
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  RCKeyValueStore *v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[RCKeyValueStore writeLock](self, "writeLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __40__RCKeyValueStore_removeObjectsForKeys___block_invoke;
    v9 = &unk_1E470DE50;
    v10 = self;
    v11 = v4;
    objc_msgSend(v5, "performWithLockSync:", &v6);

    -[RCKeyValueStore _queueSave](self, "_queueSave", v6, v7, v8, v9, v10);
  }

}

uint64_t __40__RCKeyValueStore_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectsByKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "setNeedSave:", 1);
}

- (void)removeAllObjects
{
  void *v3;
  _QWORD v4[5];

  -[RCKeyValueStore writeLock](self, "writeLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__RCKeyValueStore_removeAllObjects__block_invoke;
  v4[3] = &unk_1E470DFF0;
  v4[4] = self;
  objc_msgSend(v3, "performWithLockSync:", v4);

  -[RCKeyValueStore _queueSave](self, "_queueSave");
}

uint64_t __35__RCKeyValueStore_removeAllObjects__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectsByKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "setNeedSave:", 1);
}

- (void)updateObjectsForKeys:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  RCKeyValueStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v7 && v8)
  {
    -[RCKeyValueStore writeLock](self, "writeLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__RCKeyValueStore_updateObjectsForKeys_withBlock___block_invoke;
    v10[3] = &unk_1E470EC78;
    v11 = v6;
    v12 = self;
    v13 = v7;
    objc_msgSend(v9, "performWithLockSync:", v10);

    -[RCKeyValueStore _queueSave](self, "_queueSave");
  }

}

uint64_t __50__RCKeyValueStore_updateObjectsForKeys_withBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "objectsByKey", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "objectsByKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v10, v7);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setNeedSave:", 1);
}

- (id)objectsForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RCKeyValueStore objectsByKey](self, "objectsByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rc_subdictionaryForKeys:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setBoolValue:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[RCKeyValueStore setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (BOOL)BOOLValueForKey:(id)a3
{
  void *v3;
  char v4;

  -[RCKeyValueStore objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)addAllEntriesToDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RCKeyValueStore objectsByKey](self, "objectsByKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

}

- (NSDictionary)asDictionary
{
  void *v2;
  void *v3;

  -[RCKeyValueStore objectsByKey](self, "objectsByKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (void)saveWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RCKeyValueStore saveThrottler](self, "saveThrottler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tickleWithCompletion:", v4);

}

- (id)_dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RCKeyValueStore writeLock](self, "writeLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[RCKeyValueStore objectsByKey](self, "objectsByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[RCKeyValueStore writeLock](self, "writeLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return v5;
}

- (void)_clearStore
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[RCKeyValueStore storeDirectory](self, "storeDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCKeyValueStore name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

  -[RCKeyValueStore setStoreSize:](self, "setStoreSize:", 0);
}

- (BOOL)_shouldMigrateOnUpgrade
{
  return (LOBYTE(self->_optionsMask) >> 1) & 1;
}

- (void)setOptionBackupEnabled:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[RCKeyValueStore writeLock](self, "writeLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__RCKeyValueStore_setOptionBackupEnabled___block_invoke;
  v6[3] = &unk_1E470ECA0;
  v7 = a3;
  v6[4] = self;
  objc_msgSend(v5, "performWithLockSync:", v6);

}

uint64_t __42__RCKeyValueStore_setOptionBackupEnabled___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 56) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56) & 0xFFFFFFFFFFFFFFFELL | *(unsigned __int8 *)(result + 40);
  return result;
}

- (BOOL)shouldExportJSONSidecar
{
  return self->_shouldExportJSONSidecar;
}

- (void)setShouldExportJSONSidecar:(BOOL)a3
{
  self->_shouldExportJSONSidecar = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setObjectsByKey:(id)a3
{
  objc_storeStrong((id *)&self->_objectsByKey, a3);
}

- (void)setStoreDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_storeDirectory, a3);
}

- (void)setClientVersion:(unint64_t)a3
{
  self->_clientVersion = a3;
}

- (unint64_t)optionsMask
{
  return self->_optionsMask;
}

- (void)setOptionsMask:(unint64_t)a3
{
  self->_optionsMask = a3;
}

- (RCKeyValueStoreMigrating)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_migrator, a3);
}

- (void)setWriteLock:(id)a3
{
  objc_storeStrong((id *)&self->_writeLock, a3);
}

- (void)setSaveThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_saveThrottler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveThrottler, 0);
  objc_storeStrong((id *)&self->_writeLock, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);
  objc_storeStrong((id *)&self->_objectsByKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setObject:forKey:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"key", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)setObjects:forKeys:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"keys", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)setObjects:forKeys:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"objects", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)addEntriesFromDictionary:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherDictionary", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_loadFromDisk
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a migrator in order to migrate between KVS client versions"));
  v1 = 136315906;
  v2 = "-[RCKeyValueStore _loadFromDisk]";
  v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Persistence/RCKeyValueStore.m";
  v5 = 1024;
  v6 = 329;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

void __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke_cold_1(id *a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a2;
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("failed to serialize %@ key-value store plist with error: %@"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v7, "*** Assertion failure: %s %s:%d %{public}@", v8, v9, v10, v11, (uint64_t)v5, v12, 2u);

}

- (void)_initializeStoreDirectoryWithName:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v8;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to create cache directory with error: %@"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v2, "*** Assertion failure: %s %s:%d %{public}@", v3, v4, v5, v6, a1, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
