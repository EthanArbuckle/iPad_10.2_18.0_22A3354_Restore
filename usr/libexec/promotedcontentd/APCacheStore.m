@implementation APCacheStore

- (void)setObject:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  APCacheStoreOperationSet *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (v15)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ object cannot be nil"), objc_opt_class(self));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    APSimulateCrash(5, v12, 1);

    if (v8)
      goto LABEL_3;
  }
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ key cannot be nil"), objc_opt_class(self));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  APSimulateCrash(5, v14, 1);

LABEL_3:
  v10 = -[APCacheStoreOperationSet initWithCacheStore:key:object:]([APCacheStoreOperationSet alloc], "initWithCacheStore:key:object:", self, v8, v15);
  if (v9)
    objc_msgSend(v9, "addOperation:", v10);
  else
    -[APCacheStore _executeOperation:](self, "_executeOperation:", v10);

}

- (NSCache)memoryCache
{
  return self->_memoryCache;
}

- (NSMapTable)liveObjectsTracker
{
  return self->_liveObjectsTracker;
}

- (APFileSystemAdapter)fileStorage
{
  return self->_fileStorage;
}

- (id)createTransaction
{
  return -[APCacheStoreTransaction initWithCacheStore:]([APCacheStoreTransaction alloc], "initWithCacheStore:", self);
}

- (id)objectForKey:(id)a3 ignoreKeys:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ key cannot be nil"), objc_opt_class(self));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    APSimulateCrash(5, v9, 1);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore lock](self, "lock"));
  objc_msgSend(v10, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore _objectForKey:ignoreKeys:](self, "_objectForKey:ignoreKeys:", v6, v7));
  objc_msgSend(v10, "unlock");

  return v11;
}

- (id)objectForKey:(id)a3
{
  return -[APCacheStore objectForKey:ignoreKeys:](self, "objectForKey:ignoreKeys:", a3, 0);
}

- (id)_objectForKey:(id)a3 ignoreKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  id v17;
  NSErrorDomain v18;
  NSErrorDomain v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;

  v6 = a3;
  v7 = a4;
  ++self->_diagnosticsOperations;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore memoryCache](self, "memoryCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  if (!v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore liveObjectsTracker](self, "liveObjectsTracker"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v6));

    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore memoryCache](self, "memoryCache"));
      objc_msgSend(v12, "setObject:forKey:", v9, v6);

      v10 = 24;
      goto LABEL_5;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore fileStorage](self, "fileStorage"));
    v30 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "readDataFromFile:error:", v6, &v30));
    v17 = v30;

    if (v17)
    {
      v18 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "domain"));
      v19 = v18;
      if (v18 != NSCocoaErrorDomain)
      {

LABEL_14:
        v24 = APLogForCategory(32);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
LABEL_17:

          goto LABEL_18;
        }
        *(_DWORD *)buf = 138543619;
        v32 = v6;
        v33 = 2113;
        v34 = v17;
        v26 = "Unable to read file %{public}@. Error: %{private}@";
        v27 = v25;
        v28 = 22;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
        goto LABEL_17;
      }
      v23 = objc_msgSend(v17, "code");

      if (v23 != (id)260)
        goto LABEL_14;
    }
    else if (objc_msgSend(v16, "length"))
    {
      v20 = objc_claimAutoreleasedReturnValue(+[APCacheableBaseObject deserializeFromData:ignoreKeys:](APCacheableBaseObject, "deserializeFromData:ignoreKeys:", v16, v7));
      if (v20)
      {
        v21 = (void *)v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore memoryCache](self, "memoryCache"));
        objc_msgSend(v22, "setObject:forKey:", v21, v6);

        v13 = v21;
LABEL_19:

        goto LABEL_6;
      }
      v29 = APLogForCategory(32);
      v25 = objc_claimAutoreleasedReturnValue(v29);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 138543362;
      v32 = v6;
      v26 = "Unable to deserialize object %{public}@.";
      v27 = v25;
      v28 = 12;
      goto LABEL_16;
    }
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  v10 = 8;
LABEL_5:
  ++*(Class *)((char *)&self->super.super.isa + v10);
  v13 = v9;
LABEL_6:

  return v13;
}

- (void)executeBlock:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[APCacheStore lock](self, "lock"));
  objc_msgSend(v5, "lock");
  v4[2](v4);

  objc_msgSend(v5, "unlock");
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (APCacheStore)initWithFileStorage:(id)a3 memoryCache:(id)a4
{
  id v7;
  id v8;
  APCacheStore *v9;
  APUnfairRecursiveLock *v10;
  APUnfairRecursiveLock *lock;
  uint64_t v12;
  NSMapTable *liveObjectsTracker;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)APCacheStore;
  v9 = -[APCacheStore init](&v15, "init");
  if (v9)
  {
    v10 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    lock = v9->_lock;
    v9->_lock = v10;

    objc_storeStrong((id *)&v9->_fileStorage, a3);
    objc_storeStrong((id *)&v9->_memoryCache, a4);
    v12 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToWeakObjectsMapTable](NSMapTable, "weakToWeakObjectsMapTable"));
    liveObjectsTracker = v9->_liveObjectsTracker;
    v9->_liveObjectsTracker = (NSMapTable *)v12;

  }
  return v9;
}

- (APCacheStore)initWithTotalCostLimit:(int64_t)a3
{
  id v5;
  void *v6;
  APFileSystemAdapter *v7;
  APCacheStore *v8;

  v5 = objc_alloc_init((Class)NSCache);
  v6 = v5;
  if ((a3 & 0x8000000000000000) == 0)
    objc_msgSend(v5, "setTotalCostLimit:", a3);
  v7 = objc_alloc_init(APFileSystemAdapter);
  v8 = -[APCacheStore initWithFileStorage:memoryCache:](self, "initWithFileStorage:memoryCache:", v7, v6);

  return v8;
}

- (BOOL)hasObjectForKey:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ key cannot be nil"), objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    APSimulateCrash(5, v6, 1);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore lock](self, "lock"));
  objc_msgSend(v7, "lock");
  v8 = -[APCacheStore _hasObjectForKey:](self, "_hasObjectForKey:", v4);
  objc_msgSend(v7, "unlock");

  return v8;
}

- (BOOL)_hasObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore memoryCache](self, "memoryCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore fileStorage](self, "fileStorage"));
    v7 = objc_msgSend(v8, "fileExists:", v4);

  }
  return v7;
}

- (void)removeObjectForKey:(id)a3
{
  -[APCacheStore removeObjectForKey:transaction:](self, "removeObjectForKey:transaction:", a3, 0);
}

- (void)removeObjectForKey:(id)a3 transaction:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  APCacheStoreOperationRemove *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!v10)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ key cannot be nil"), objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    APSimulateCrash(5, v8, 1);

  }
  v9 = -[APCacheStoreOperationRemove initWithCacheStore:key:]([APCacheStoreOperationRemove alloc], "initWithCacheStore:key:", self, v10);
  if (v6)
    objc_msgSend(v6, "addOperation:", v9);
  else
    -[APCacheStore _executeOperation:](self, "_executeOperation:", v9);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[APCacheStore setObject:forKey:transaction:](self, "setObject:forKey:transaction:", a3, a4, 0);
}

- (void)touchObjectForKey:(id)a3
{
  -[APCacheStore touchObjectForKey:transaction:](self, "touchObjectForKey:transaction:", a3, 0);
}

- (void)touchObjectForKey:(id)a3 transaction:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  APCacheStoreOperationTouch *v9;
  void *v10;
  APCacheStoreOperationTouch *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!v12)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ key cannot be nil"), objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    APSimulateCrash(5, v8, 1);

  }
  v9 = [APCacheStoreOperationTouch alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v11 = -[APCacheStoreOperationTouch initWithCacheStore:key:timestamp:](v9, "initWithCacheStore:key:timestamp:", self, v12, v10);

  if (v6)
    objc_msgSend(v6, "addOperation:", v11);
  else
    -[APCacheStore _executeOperation:](self, "_executeOperation:", v11);

}

- (BOOL)_executeOperation:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore lock](self, "lock"));
  objc_msgSend(v5, "lock");
  v6 = objc_msgSend(v4, "execute");
  if (v6)
    objc_msgSend(v4, "commit");
  else
    objc_msgSend(v4, "rollBack");

  objc_msgSend(v5, "unlock");
  return v6;
}

- (BOOL)isObjectAliveForKey:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ key cannot be nil"), objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    APSimulateCrash(5, v6, 1);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore lock](self, "lock"));
  objc_msgSend(v7, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore liveObjectsTracker](self, "liveObjectsTracker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v4));
  v10 = v9 != 0;

  objc_msgSend(v7, "unlock");
  return v10;
}

- (void)evictObjectFromMemoryCacheForKey:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ key cannot be nil"), objc_opt_class(self));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    APSimulateCrash(5, v5, 1);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore lock](self, "lock"));
  objc_msgSend(v6, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore memoryCache](self, "memoryCache"));
  objc_msgSend(v7, "removeObjectForKey:", v9);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore liveObjectsTracker](self, "liveObjectsTracker"));
  objc_msgSend(v8, "removeObjectForKey:", v9);

  objc_msgSend(v6, "unlock");
}

- (id)enumerateIDsWithExtension:(id)a3
{
  id v4;
  _APMapEnumerator *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(_APMapEnumerator);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore fileStorage](self, "fileStorage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enumeratorForFilesWithExtension:", v4));

  -[_APMapEnumerator setSrcEnumerator:](v5, "setSrcEnumerator:", v7);
  -[_APMapEnumerator setTransformationBlock:](v5, "setTransformationBlock:", &stru_100218698);
  return v5;
}

- (void)enableDiagnosticsWithInterval:(double)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *diagnostics_memory_event_source;
  OS_dispatch_source *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v13;
  id location;
  _QWORD handler[4];
  OS_dispatch_source *v16;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    self->_diagnosticsInterval = a3;
    if (a3 > 0.0)
    {
      global_queue = dispatch_get_global_queue(-2, 0);
      v6 = objc_claimAutoreleasedReturnValue(global_queue);
      v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 7uLL, v6);
      diagnostics_memory_event_source = self->_diagnostics_memory_event_source;
      self->_diagnostics_memory_event_source = v7;

      v9 = self->_diagnostics_memory_event_source;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100167B38;
      handler[3] = &unk_100212FE0;
      v16 = v9;
      v10 = v9;
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume(v10);
      objc_initWeak(&location, self);
      v11 = dispatch_time(0, (uint64_t)(self->_diagnosticsInterval * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100167C08;
      block[3] = &unk_100213F18;
      objc_copyWeak(&v13, &location);
      dispatch_after(v11, v6, block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);

    }
  }
}

- (void)_printCacheStatistics
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t diagnosticsOperations;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  dispatch_queue_global_t global_queue;
  NSObject *v26;
  void *v27;
  void *context;
  _QWORD block[4];
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;

  context = objc_autoreleasePoolPush();
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore lock](self, "lock"));
  objc_msgSend(v27, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore liveObjectsTracker](self, "liveObjectsTracker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyEnumerator"));

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore liveObjectsTracker](self, "liveObjectsTracker"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v6));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStore memoryCache](self, "memoryCache"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v6));

        v15 = objc_msgSend(v12, "objectSize");
        if (v14)
        {
          v8 += (uint64_t)v15;
          ++v7;
        }
        else
        {
          v10 += (uint64_t)v15;
          ++v9;
        }
      }

      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));
      v6 = (void *)v16;
    }
    while (v16);
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v8 = 0;
    v7 = 0;
  }
  objc_msgSend(v27, "unlock");

  objc_autoreleasePoolPop(context);
  diagnosticsOperations = self->_diagnosticsOperations;
  if (diagnosticsOperations)
  {
    v18 = (double)self->_diagnosticsMemoryCacheHits * 100.0 / (double)diagnosticsOperations;
    v19 = (double)self->_diagnosticsLiveObjectHits * 100.0 / (double)diagnosticsOperations;
  }
  else
  {
    v18 = 0.0;
    v19 = 0.0;
  }
  v20 = APLogForCategory(32);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v8, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v10, 1));
    *(_DWORD *)buf = 134219267;
    v32 = v7;
    v33 = 2113;
    v34 = v22;
    v35 = 2048;
    v36 = v9;
    v37 = 2113;
    v38 = v23;
    v39 = 2048;
    v40 = v18;
    v41 = 2048;
    v42 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Cache Stats:\n\tCached Objects: %lu\n\tCached Objects Size: %{private}@\n\tAlive Uncached Objects: %lu\n\tAlive Uncached Objects Size: %{private}@\n\tMemory cache hits rate: %.2f%%\n\tLive objects hits rate: %.2f%%", buf, 0x3Eu);

  }
  objc_initWeak((id *)buf, self);
  v24 = dispatch_time(0, (uint64_t)(self->_diagnosticsInterval * 1000000000.0));
  global_queue = dispatch_get_global_queue(-2, 0);
  v26 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100167F94;
  block[3] = &unk_100213F18;
  objc_copyWeak(&v30, (id *)buf);
  dispatch_after(v24, v26, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_liveObjectsTracker, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_fileStorage, 0);
  objc_storeStrong((id *)&self->_diagnostics_memory_event_source, 0);
}

@end
