@implementation WFWeatherStoreCache

+ (id)wf_mainDomains
{
  if (wf_mainDomains_onceToken != -1)
    dispatch_once(&wf_mainDomains_onceToken, &__block_literal_global_22_0);
  return (id)wf_mainDomains_mainDomains;
}

void __37__WFWeatherStoreCache_wf_mainDomains__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("almanac_data");
  v4[1] = CFSTR("forecasts");
  v4[2] = CFSTR("historical_data");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)wf_mainDomains_mainDomains;
  wf_mainDomains_mainDomains = v2;

}

+ (id)createCacheIfNecessary:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v31;
  id v32;

  v5 = a3;
  WFLogForCategory(5uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.7();

  if (v5)
  {
    if (objc_msgSend(v5, "wf_isInMemoryAddress"))
    {
      WFLogForCategory(5uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);

      v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:", v5);
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v18 = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v32);
    v19 = v32;

    if ((v18 & 1) == 0)
    {
      WFLogForCategory(5uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.6();

      if (a4)
        *a4 = objc_retainAutorelease(v19);
    }
    v31 = 0;
    v21 = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", &v31);
    v22 = v31;
    if ((v21 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isWritableFileAtPath:", v24);

      WFLogForCategory(5uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if ((v25 & 1) != 0)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.3();

        v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:", v5);
        goto LABEL_33;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.4();

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 513, 0);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
    }
    else
    {
      WFLogForCategory(5uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.5();

      if (a4)
      {
        v29 = objc_retainAutorelease(v22);
LABEL_31:
        v15 = 0;
        *a4 = v29;
LABEL_33:

        goto LABEL_34;
      }
    }
    v15 = 0;
    goto LABEL_33;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 513, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  WFLogForCategory(5uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.1(v16);

  v15 = 0;
LABEL_34:

  return v15;
}

- (WFWeatherStoreCache)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Please use designated initializer initWithURL:"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (WFWeatherStoreCache)initWithURL:(id)a3
{
  id v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  WFWeatherStoreCache *v12;
  WFWeatherStoreCache *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *cacheConcurrentQueue;
  uint64_t v17;
  NSMutableDictionary *cacheForDomain;
  uint64_t v19;
  NSMutableSet *dirtyCacheDomains;
  WFWeatherStoreCache *v21;
  NSObject *v22;
  id v24;
  objc_super v25;
  id v26;

  v5 = a3;
  if (!v5 || (v6 = v5, (objc_msgSend(v5, "isFileURL") & 1) == 0) && (objc_msgSend(v6, "wf_isInMemoryAddress") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("URL was invalid"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  if ((objc_msgSend(v6, "wf_isInMemoryAddress") & 1) == 0)
  {
    v26 = 0;
    v8 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", &v26);
    v7 = v26;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isWritableFileAtPath:", v10);

      if ((v11 & 1) != 0)
        goto LABEL_8;
      WFLogForCategory(5uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WFWeatherStoreCache initWithURL:].cold.1();
    }
    else
    {
      WFLogForCategory(5uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WFWeatherStoreCache initWithURL:].cold.2();
    }

    v21 = 0;
    goto LABEL_16;
  }
  v7 = 0;
LABEL_8:
  v25.receiver = self;
  v25.super_class = (Class)WFWeatherStoreCache;
  v12 = -[WFWeatherStoreCache init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.WeatherFoundation.cacheReadWriteQueue", v14);
    cacheConcurrentQueue = v13->_cacheConcurrentQueue;
    v13->_cacheConcurrentQueue = (OS_dispatch_queue *)v15;

    v17 = objc_opt_new();
    cacheForDomain = v13->_cacheForDomain;
    v13->_cacheForDomain = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    dirtyCacheDomains = v13->_dirtyCacheDomains;
    v13->_dirtyCacheDomains = (NSMutableSet *)v19;

    -[WFWeatherStoreCache _startCacheStoreTimer](v13, "_startCacheStoreTimer");
  }
  self = v13;
  v21 = self;
LABEL_16:

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  -[WFWeatherStoreCache _stopCacheStoreTimer](self, "_stopCacheStoreTimer");
  v3.receiver = self;
  v3.super_class = (Class)WFWeatherStoreCache;
  -[WFWeatherStoreCache dealloc](&v3, sel_dealloc);
}

- (void)_startCacheStoreTimer
{
  _QWORD block[5];

  -[WFWeatherStoreCache _stopCacheStoreTimer](self, "_stopCacheStoreTimer");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WFWeatherStoreCache__startCacheStoreTimer__block_invoke;
  block[3] = &unk_24CCA06F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __44__WFWeatherStoreCache__startCacheStoreTimer__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_writeCacheDictionaryToFile, 0, 1, 20.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCacheStoreTimer:", v2);

  objc_msgSend(*(id *)(a1 + 32), "cacheStoreTimer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTolerance:", 5.0);

}

- (void)_stopCacheStoreTimer
{
  _QWORD block[5];

  if (self->_cacheStoreTimer)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__WFWeatherStoreCache__stopCacheStoreTimer__block_invoke;
    block[3] = &unk_24CCA06F8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __43__WFWeatherStoreCache__stopCacheStoreTimer__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "cacheStoreTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setCacheStoreTimer:", 0);
}

- (void)deleteOldDataFromCache:(id)a3 allowedStaleness:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a3;
  if (v6)
  {
    objc_initWeak(&location, self);
    -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __63__WFWeatherStoreCache_deleteOldDataFromCache_allowedStaleness___block_invoke;
    v8[3] = &unk_24CCA0720;
    objc_copyWeak(v10, &location);
    v9 = v6;
    v10[1] = (id)a4;
    dispatch_barrier_sync(v7, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }

}

void __63__WFWeatherStoreCache_deleteOldDataFromCache_allowedStaleness___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)writeCacheDictionaryToFile
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  WFLogForCategory(5uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21189A000, v3, OS_LOG_TYPE_INFO, "write cache to file", buf, 2u);
  }

  -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WFWeatherStoreCache_writeCacheDictionaryToFile__block_invoke;
  block[3] = &unk_24CCA06F8;
  block[4] = self;
  dispatch_barrier_sync(v4, block);

}

uint64_t __49__WFWeatherStoreCache_writeCacheDictionaryToFile__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_concurrentQueue_barrier_writeCacheDictionaryToFile");
}

- (void)_concurrentQueue_barrier_writeCacheDictionaryToFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Synchronizing Cache to disk @ %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "writeToURL:options:error:", v6, 1, &v12);
  v9 = v12;
  WFLogForCategory(5uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke_cold_2();
  }

}

+ (BOOL)removeObjectsFromCache:(id)a3 passingTest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("values"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __58__WFWeatherStoreCache_removeObjectsFromCache_passingTest___block_invoke;
  v23 = &unk_24CCA0770;
  v25 = v6;
  v8 = v5;
  v24 = v8;
  v9 = v6;
  objc_msgSend(v7, "keysOfEntriesPassingTest:", &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count", v20, v21, v22, v23);
  if (v11)
  {
    WFLogForCategory(5uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[WFWeatherStoreCache removeObjectsFromCache:passingTest:].cold.1();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("values"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectsForKeys:", v14);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dates"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectsForKeys:", v16);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WFWeatherStoreCacheRecordExpirationDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectsForKeys:", v18);

  }
  return v11 != 0;
}

uint64_t __58__WFWeatherStoreCache_removeObjectsFromCache_passingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_254AC7978) & 1) != 0)
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("dates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (*(uint64_t (**)(uint64_t, id, void *, id))(v7 + 16))(v7, v5, v9, v6);

  }
  else
  {
    WFLogForCategory(5uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __58__WFWeatherStoreCache_removeObjectsFromCache_passingTest___block_invoke_cold_1();

    v10 = 1;
  }

  return v10;
}

- (id)cachedObjectWithinDomain:(id)a3 forKey:(id)a4
{
  return -[WFWeatherStoreCache cachedObjectWithinDomain:forKey:staleness:](self, "cachedObjectWithinDomain:forKey:staleness:", a3, a4, 0x7FFFFFFFFFFFFFFFLL);
}

- (id)cachedObjectWithinDomain:(id)a3 forKey:(id)a4 staleness:(unint64_t)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSObject *v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;
  _QWORD block[4];
  NSMutableDictionary *v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v8 = a3;
  v9 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  -[WFWeatherStoreCache _ensureDomainIsLoaded:](self, "_ensureDomainIsLoaded:", v8);
  v10 = self->_cacheForDomain;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke;
  block[3] = &unk_24CCA0798;
  v13 = v10;
  v25 = v13;
  v14 = v8;
  v26 = v14;
  v28 = &v35;
  v15 = v9;
  v27 = v15;
  v29 = &v31;
  v30 = a5;
  dispatch_sync(v11, block);

  if (*((_BYTE *)v32 + 24))
  {
    objc_initWeak(&location, self);
    -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke_54;
    v19[3] = &unk_24CCA07C0;
    objc_copyWeak(&v22, &location);
    v20 = v14;
    v21 = v15;
    dispatch_barrier_async(v16, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  v17 = (id)v36[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v17;
}

void __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WFWeatherStoreCacheRecordExpirationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (uint64_t *)(a1 + 48);
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "compare:", v14);

    if (v15 == -1)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = 0;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      WFLogForCategory(5uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v28 = *v9;
        v29 = *v2;
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSinceDate:", v13);
        *(_DWORD *)buf = 138412802;
        v31 = v28;
        v32 = 2112;
        v33 = v29;
        v34 = 2048;
        v35 = v27;
        _os_log_debug_impl(&dword_21189A000, v18, OS_LOG_TYPE_DEBUG, "Removing Stale Cache @ key %@ / domain %@.  Expired approx %f seconds ago.", buf, 0x20u);

      }
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (*(_QWORD *)(a1 + 72) == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v19, "timeIntervalSinceNow");
    if (!v19 || !v20 || (v22 = v21 / 60.0, v22 < 0.0) && -v22 >= (double)v20)
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = 0;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
LABEL_14:
      WFLogForCategory(5uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke_cold_1(v9, v2, v25);

    }
  }

}

void __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke_54(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_removeObjectWithinDomain:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)cache:(id)a3 withinDomain:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  WFLogForCategory(5uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21189A000, v11, OS_LOG_TYPE_INFO, "caching weather objects", v13, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreCache cache:withinDomain:date:forKey:expiration:synchronous:](self, "cache:withinDomain:date:forKey:expiration:synchronous:", v10, v9, v12, v8, 0, 0);

}

- (void)cache:(id)a3 withinDomain:(id)a4 forKey:(id)a5 expiration:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v10 = (void *)MEMORY[0x24BDBCE60];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "date");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreCache cache:withinDomain:date:forKey:expiration:synchronous:](self, "cache:withinDomain:date:forKey:expiration:synchronous:", v14, v13, v15, v12, v11, 0);

}

- (void)cache:(id)a3 withinDomain:(id)a4 date:(id)a5 forKey:(id)a6 expiration:(id)a7 synchronous:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v8 = a8;
  v44 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot cache w/o date"), 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v19 = v18;
  if (v18
    && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v19, "compare:", v20),
        v20,
        v21 == -1))
  {
    WFLogForCategory(5uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v39 = v17;
      v40 = 2112;
      v41 = v15;
      v42 = 2112;
      v43 = v19;
      _os_log_debug_impl(&dword_21189A000, v25, OS_LOG_TYPE_DEBUG, "Unable to cache key '%@' within domain '%@':  Expiration date '%@' is already expired.", buf, 0x20u);
    }
  }
  else
  {
    -[WFWeatherStoreCache _ensureDomainIsLoaded:](self, "_ensureDomainIsLoaded:", v15);
    -[WFWeatherStoreCache dirtyCacheDomains](self, "dirtyCacheDomains");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherStoreCache cacheForDomain](self, "cacheForDomain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __77__WFWeatherStoreCache_cache_withinDomain_date_forKey_expiration_synchronous___block_invoke;
    v30[3] = &unk_24CCA07E8;
    v31 = v23;
    v32 = v15;
    v33 = v19;
    v34 = v17;
    v35 = v16;
    v36 = v14;
    v37 = v22;
    v24 = v22;
    v25 = v23;
    v26 = (void *)MEMORY[0x212BE2990](v30);
    -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v8)
      dispatch_barrier_sync(v27, v26);
    else
      dispatch_barrier_async(v27, v26);

  }
}

void __77__WFWeatherStoreCache_cache_withinDomain_date_forKey_expiration_synchronous___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("values"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dates"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WFWeatherStoreCacheRecordExpirationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(v2 + 8);
  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
  WFLogForCategory(5uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v19 = *(_QWORD *)(a1 + 40);
    v20 = 138412802;
    v21 = v17;
    v22 = 2112;
    v23 = v19;
    v24 = 2112;
    v25 = v18;
    _os_log_debug_impl(&dword_21189A000, v9, OS_LOG_TYPE_DEBUG, "Successfully cached key '%@' within domain '%@'.  Expires %@", (uint8_t *)&v20, 0x20u);
  }

  WFLogForCategory(5uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __77__WFWeatherStoreCache_cache_withinDomain_date_forKey_expiration_synchronous___block_invoke_cold_1(v2, v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend(*(id *)(a1 + 80), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObjectWithinDomain:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *cacheConcurrentQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[WFWeatherStoreCache _ensureDomainIsLoaded:](self, "_ensureDomainIsLoaded:", v6);
  objc_initWeak(&location, self);
  cacheConcurrentQueue = self->_cacheConcurrentQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__WFWeatherStoreCache_removeObjectWithinDomain_forKey___block_invoke;
  v11[3] = &unk_24CCA07C0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_sync(cacheConcurrentQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__WFWeatherStoreCache_removeObjectWithinDomain_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_removeObjectWithinDomain:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)removeAllObjects
{
  NSObject *v3;
  _QWORD block[5];

  -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WFWeatherStoreCache_removeAllObjects__block_invoke;
  block[3] = &unk_24CCA06F8;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

uint64_t __39__WFWeatherStoreCache_removeAllObjects__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cacheForDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "dirtyCacheDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "_concurrentQueue_barrier_writeCacheDictionaryToFile");
}

- (void)executeTransaction:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  (*((void (**)(id, WFWeatherStoreCache *))a3 + 2))(a3, self);
  WFLogForCategory(5uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[WFWeatherStoreCache executeTransaction:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  -[WFWeatherStoreCache writeCacheDictionaryToFile](self, "writeCacheDictionaryToFile");
}

- (void)_shrinkDomain:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__WFWeatherStoreCache__shrinkDomain___block_invoke;
    block[3] = &unk_24CCA0810;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_barrier_sync(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __37__WFWeatherStoreCache__shrinkDomain___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_shrinkDomain:", *(_QWORD *)(a1 + 32));

}

- (void)_concurrentQueue_barrier_shrinkDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if (v4)
  {
    -[WFWeatherStoreCache cacheForDomain](self, "cacheForDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("values"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "count");
    WFLogForCategory(5uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 > 0x1F3)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WFWeatherStoreCache _concurrentQueue_barrier_shrinkDomain:].cold.3(v7, v11);

      v12 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v8, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayWithArray:", v13);
      v11 = objc_claimAutoreleasedReturnValue();

      -[NSObject sortUsingSelector:](v11, "sortUsingSelector:", sel_compare_);
      -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", -[NSObject count](v11, "count") - 250);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_opt_class();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __61__WFWeatherStoreCache__concurrentQueue_barrier_shrinkDomain___block_invoke;
      v18[3] = &unk_24CCA0838;
      v16 = v14;
      v19 = v16;
      if (objc_msgSend(v15, "removeObjectsFromCache:passingTest:", v6, v18))
      {
        WFLogForCategory(5uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[WFWeatherStoreCache _concurrentQueue_barrier_shrinkDomain:].cold.2();

        -[NSMutableSet addObject:](self->_dirtyCacheDomains, "addObject:", v4);
      }

    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[WFWeatherStoreCache _concurrentQueue_barrier_shrinkDomain:].cold.1();
    }

  }
}

BOOL __61__WFWeatherStoreCache__concurrentQueue_barrier_shrinkDomain___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", *(_QWORD *)(a1 + 32)) == -1;
}

- (BOOL)_loadDomain:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_initWeak(&location, self);
  -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__WFWeatherStoreCache__loadDomain___block_invoke;
  v8[3] = &unk_24CCA0860;
  v10 = &v13;
  objc_copyWeak(&v11, &location);
  v9 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, v8);

  LOBYTE(v5) = *((_BYTE *)v14 + 24);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return (char)v5;
}

void __35__WFWeatherStoreCache__loadDomain___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "_concurrentQueue_barrier_loadDomain:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_concurrentQueue_barrier_loadDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v23;
  uint64_t v24;
  id v25;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[WFWeatherStoreCache URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      WFLogForCategory(5uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:].cold.5();

      if (_concurrentQueue_barrier_loadDomain__onceToken != -1)
        dispatch_once(&_concurrentQueue_barrier_loadDomain__onceToken, &__block_literal_global_62);
      v25 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", _concurrentQueue_barrier_loadDomain__CacheClasses, v9, &v25);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v25;
      v13 = v12;
      if (v11 || !v12)
      {

        if (v11)
        {
          -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("Version"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "unsignedIntegerValue");

          if (v24 == 18)
          {
            v20 = 0;
LABEL_16:
            -[WFWeatherStoreCache cacheForDomain](self, "cacheForDomain");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v11, v4);

            goto LABEL_20;
          }
        }
LABEL_13:
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v15 = objc_claimAutoreleasedReturnValue();

        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", &unk_24CCC0350, CFSTR("Version"));
        v16 = (void *)objc_opt_new();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v16, CFSTR("values"));

        v17 = (void *)objc_opt_new();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, CFSTR("dates"));

        v18 = (void *)objc_opt_new();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, CFSTR("WFWeatherStoreCacheRecordExpirationDate"));

        WFLogForCategory(5uLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:].cold.2();

        v20 = 1;
        v11 = v15;
        goto LABEL_16;
      }
      WFLogForCategory(7uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:].cold.3();

    }
    v11 = 0;
    goto LABEL_13;
  }
  WFLogForCategory(5uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:].cold.1();
  v20 = 0;
LABEL_20:

  return v20;
}

void __59__WFWeatherStoreCache__concurrentQueue_barrier_loadDomain___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_concurrentQueue_barrier_loadDomain__CacheClasses;
  _concurrentQueue_barrier_loadDomain__CacheClasses = v4;

}

- (void)_markDomainDirty:(id)a3
{
  id v4;
  NSObject *cacheConcurrentQueue;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (v4)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = __Block_byref_object_copy_;
    v9[4] = __Block_byref_object_dispose_;
    -[WFWeatherStoreCache dirtyCacheDomains](self, "dirtyCacheDomains");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    cacheConcurrentQueue = self->_cacheConcurrentQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__WFWeatherStoreCache__markDomainDirty___block_invoke;
    v6[3] = &unk_24CCA08A8;
    v7 = v4;
    v8 = v9;
    dispatch_barrier_async(cacheConcurrentQueue, v6);

    _Block_object_dispose(v9, 8);
  }

}

uint64_t __40__WFWeatherStoreCache__markDomainDirty___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  WFLogForCategory(5uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __40__WFWeatherStoreCache__markDomainDirty___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

- (id)_loadedCacheDomains
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__WFWeatherStoreCache__loadedCacheDomains__block_invoke;
  v6[3] = &unk_24CCA08D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__WFWeatherStoreCache__loadedCacheDomains__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cacheForDomain");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_dirtyCacheDomains
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD v13[5];
  id v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  -[WFWeatherStoreCache dirtyCacheDomains](self, "dirtyCacheDomains");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[WFWeatherStoreCache cacheConcurrentQueue](self, "cacheConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__WFWeatherStoreCache__dirtyCacheDomains__block_invoke;
  v6[3] = &unk_24CCA08F8;
  v6[4] = &v7;
  v6[5] = v13;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

void __41__WFWeatherStoreCache__dirtyCacheDomains__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_ensureDomainIsLoaded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[WFWeatherStoreCache _loadedCacheDomains](self, "_loadedCacheDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    WFLogForCategory(5uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[WFWeatherStoreCache _ensureDomainIsLoaded:].cold.1();

  }
  else
  {
    -[WFWeatherStoreCache _loadDomain:](self, "_loadDomain:", v4);
  }

}

- (void)_concurrentQueue_barrier_deleteOldDataFromCache
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[WFWeatherStoreCache _concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:](self, "_concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:", CFSTR("forecasts"), 720);
  -[WFWeatherStoreCache _concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:](self, "_concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:", CFSTR("almanac_data"), 2628000);
  -[WFWeatherStoreCache _concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:](self, "_concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:", CFSTR("historical_data"), 26280000);
  objc_initWeak(&location, self);
  -[NSMutableDictionary allKeys](self->_cacheForDomain, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__WFWeatherStoreCache__concurrentQueue_barrier_deleteOldDataFromCache__block_invoke;
  v4[3] = &unk_24CCA0920;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__WFWeatherStoreCache__concurrentQueue_barrier_deleteOldDataFromCache__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_shrinkDomain:", v3);

}

- (void)_concurrentQueue_barrier_deleteOldDataFromCache:(id)a3 allowedStaleness:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  _QWORD v12[5];

  v6 = a3;
  -[WFWeatherStoreCache cacheForDomain](self, "cacheForDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_class();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__WFWeatherStoreCache__concurrentQueue_barrier_deleteOldDataFromCache_allowedStaleness___block_invoke;
  v12[3] = &__block_descriptor_40_e34_B32__0_8__NSDate_16___NSCoding__24l;
  v12[4] = a4;
  LODWORD(v7) = objc_msgSend(v9, "removeObjectsFromCache:passingTest:", v8, v12);
  WFLogForCategory(5uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)v7)
  {
    if (v11)
      -[WFWeatherStoreCache _concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:].cold.1();

    -[WFWeatherStoreCache dirtyCacheDomains](self, "dirtyCacheDomains");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v10, "addObject:", v6);
  }
  else if (v11)
  {
    -[WFWeatherStoreCache _concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:].cold.2();
  }

}

BOOL __88__WFWeatherStoreCache__concurrentQueue_barrier_deleteOldDataFromCache_allowedStaleness___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  double v5;
  _BOOL8 result;
  double v7;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "timeIntervalSinceNow");
  result = 1;
  if (a3 && v4)
  {
    v7 = v5 / 60.0;
    return v7 < 0.0 && -v7 >= (double)v4;
  }
  return result;
}

- (void)_concurrentQueue_barrier_removeObjectWithinDomain:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  -[WFWeatherStoreCache cacheForDomain](self, "cacheForDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("values"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v7);
  objc_msgSend(v10, "removeObjectForKey:", v7);
  WFLogForCategory(5uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[WFWeatherStoreCache _concurrentQueue_barrier_removeObjectWithinDomain:forKey:].cold.1();

  -[NSMutableSet addObject:](self->_dirtyCacheDomains, "addObject:", v6);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSTimer)cacheStoreTimer
{
  return self->_cacheStoreTimer;
}

- (void)setCacheStoreTimer:(id)a3
{
  objc_storeStrong((id *)&self->_cacheStoreTimer, a3);
}

- (OS_dispatch_queue)cacheConcurrentQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCacheConcurrentQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)cacheForDomain
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCacheForDomain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)dirtyCacheDomains
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDirtyCacheDomains:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyCacheDomains, 0);
  objc_storeStrong((id *)&self->_cacheForDomain, 0);
  objc_storeStrong((id *)&self->_cacheConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_cacheStoreTimer, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (void)createCacheIfNecessary:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21189A000, log, OS_LOG_TYPE_ERROR, "Can't create cache with nil URL", v1, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)createCacheIfNecessary:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_21189A000, a1, a3, "Utilizing in-memory cache", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

+ (void)createCacheIfNecessary:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Utilizing disk cache @ %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)createCacheIfNecessary:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "Cannot write to resources @ %@, aborting cache creation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)createCacheIfNecessary:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_21189A000, v0, v1, "Cannot reach resources @ %@, aborting cache creation: %@");
  OUTLINED_FUNCTION_1();
}

+ (void)createCacheIfNecessary:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_21189A000, v0, v1, "Cannot create directory @ %@, aborting cache creation: %@");
  OUTLINED_FUNCTION_1();
}

+ (void)createCacheIfNecessary:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Creating cache @ %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "Cannot write to resources @ %@, aborting cache initialization", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "Unable to initialize cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_21189A000, v0, v1, "Cache domain '%@' was successfully written to %@");
  OUTLINED_FUNCTION_1();
}

void __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_21189A000, v0, v1, "Writing cache to \"%@\" failed: %@");
  OUTLINED_FUNCTION_1();
}

+ (void)removeObjectsFromCache:passingTest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Deleting old cached data based on staleness: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__WFWeatherStoreCache_removeObjectsFromCache_passingTest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "Found invalid data in the cache, deleting it: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke_cold_1(_QWORD *a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_5(&dword_21189A000, (uint64_t)a2, a3, "Successfully retrieved cached value at cache key '%@' within cache domain '%@'", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __77__WFWeatherStoreCache_cache_withinDomain_date_forKey_expiration_synchronous___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21189A000, a2, a3, "Marking cache domain '%@' as dirty.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)executeTransaction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_21189A000, a1, a3, "Executing write transaction...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)_concurrentQueue_barrier_shrinkDomain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Cache domain '%@' is below the high-water mark. Skipping _shrinkDomain:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_concurrentQueue_barrier_shrinkDomain:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Marking cache domain '%@' as dirty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_concurrentQueue_barrier_shrinkDomain:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4();
  v4 = 2048;
  v5 = 500;
  _os_log_error_impl(&dword_21189A000, a2, OS_LOG_TYPE_ERROR, "Deleting old cached data based on dictionary size: %lu, max allowed size: %lu", v3, 0x16u);
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "Cache Domain '%@' is invalid.'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Generating new domain for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "Error occured while unarchiving %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "There was an exception while unarchiving the cache dictionary.  This could be caused by a class being present in the archive, but not in the program (such as if it was deleted or renamed).  Since it is a cache we don't care about migrating data so we will just create a new dictionary.  If this exception appears repeatedly, then it may be more concerning, but one-off is fine.  Exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_21189A000, v0, v1, "Loading Cache Domain '%@' @ %@");
  OUTLINED_FUNCTION_1();
}

void __40__WFWeatherStoreCache__markDomainDirty___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21189A000, a2, a3, "Marking cache domain '%@' as dirty.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_ensureDomainIsLoaded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Cache domain is already loaded: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Deleting old data from Cache Domain '%@' & marking domain as dirty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Could not delete any old data from Cache Domain '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_concurrentQueue_barrier_removeObjectWithinDomain:forKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_21189A000, v0, v1, "Deleting cache key '%@' within domain '%@'.  Domain will be marked as Dirty.");
  OUTLINED_FUNCTION_1();
}

@end
