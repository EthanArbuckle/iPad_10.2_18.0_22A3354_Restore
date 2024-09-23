@implementation ICQUsageStorageCache

- (ICQUsageStorageCache)init
{
  ICQUsageStorageCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *cache_operation_queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQUsageStorageCache;
  v2 = -[ICQUsageStorageCache init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.preferences.usage_storage_monitor", 0);
    cache_operation_queue = v2->_cache_operation_queue;
    v2->_cache_operation_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)populateUsageDataWithProgressBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *cache_operation_queue;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (!v4)
    -[ICQUsageStorageCache populateUsageDataWithProgressBlock:].cold.1();
  v5 = v4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__8;
  v14[4] = __Block_byref_object_dispose__8;
  v15 = (id)objc_opt_new();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__8;
  v12[4] = __Block_byref_object_dispose__8;
  v13 = (id)objc_opt_new();
  cache_operation_queue = self->_cache_operation_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke;
  v8[3] = &unk_24E3F5098;
  v10 = v14;
  v11 = v12;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(cache_operation_queue, v8);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);

}

void __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  dispatch_time_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  id v21;
  __int128 v22;
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD block[5];

  v2 = dispatch_group_create();
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_2;
  block[3] = &unk_24E3F3610;
  block[4] = a1[4];
  dispatch_group_async(v2, v3, block);

  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_3;
  v24[3] = &unk_24E3F4FF8;
  v5 = a1[6];
  v24[4] = a1[4];
  v24[5] = v5;
  dispatch_group_async(v2, v3, v24);

  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_6;
  v23[3] = &unk_24E3F4FF8;
  v6 = a1[7];
  v23[4] = a1[4];
  v23[5] = v6;
  dispatch_group_async(v2, v3, v23);

  v7 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v2, v7))
  {
    v8 = MEMORY[0x24BDAC9B8];
    do
    {
      v9 = a1[4];
      if (!*(_BYTE *)(v9 + 48))
      {
        v10 = (void *)objc_msgSend(*(id *)(v9 + 16), "copy");
        v19[0] = v4;
        v19[1] = 3221225472;
        v19[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_9;
        v19[3] = &unk_24E3F5048;
        v11 = (void *)a1[5];
        v19[4] = a1[4];
        v12 = v11;
        v22 = *((_OWORD *)a1 + 3);
        v20 = v10;
        v21 = v12;
        v13 = v10;
        dispatch_async(v8, v19);

      }
      v14 = dispatch_time(0, 3000000000);
    }
    while (dispatch_group_wait(v2, v14));
  }
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_10;
  v16[3] = &unk_24E3F5070;
  v15 = (void *)a1[5];
  v16[4] = a1[4];
  v17 = v15;
  v18 = *((_OWORD *)a1 + 3);
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "populateMediaCache");
}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_3(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_4;
  v2[3] = &unk_24E3F4FD0;
  return objc_msgSend(*(id *)(a1 + 32), "populateUsageAppsCacheWithHandler:", v2);
}

BOOL __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_5;
  v8[3] = &unk_24E3F4348;
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);
  v6 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) == 0;

  return v6;
}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_6(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_7;
  v2[3] = &unk_24E3F5020;
  return objc_msgSend(*(id *)(a1 + 32), "populateUsageBundlesCacheWithHandler:", v2);
}

BOOL __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_8;
  v8[3] = &unk_24E3F4348;
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);
  v6 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) == 0;

  return v6;
}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

void __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_9(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!*(_BYTE *)(a1[4] + 48))
  {
    (*(void (**)(void))(a1[6] + 16))();
    v2 = objc_opt_new();
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = objc_opt_new();
    v6 = *(_QWORD *)(a1[8] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_10(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = a1[4];
  if (!*(_BYTE *)(v1 + 48))
  {
    v2 = a1[5];
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    v5 = (id)objc_msgSend(*(id *)(v1 + 16), "copy");
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, uint64_t))(v2 + 16))(v2, v3, v4, v5, 1);

  }
}

- (void)cancelUsageDataPopulation
{
  NSObject *cache_operation_queue;
  _QWORD block[5];

  self->_cacheUpdateCancelled = 1;
  cache_operation_queue = self->_cache_operation_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICQUsageStorageCache_cancelUsageDataPopulation__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(cache_operation_queue, block);
}

uint64_t __49__ICQUsageStorageCache_cancelUsageDataPopulation__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 0;
  return result;
}

- (void)populateUsageBundlesCacheWithHandler:(id)a3
{
  id v4;
  PSUsageBundleManager *usageBundlesManager;
  PSUsageBundleManager *v6;
  PSUsageBundleManager *v7;
  NSArray *v8;
  NSArray *usageBundlesCache;
  NSObject *v10;
  NSArray *v11;
  int v12;
  NSArray *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_usageBundlesCache)
  {
    usageBundlesManager = self->_usageBundlesManager;
    if (!usageBundlesManager)
    {
      v6 = (PSUsageBundleManager *)objc_alloc_init(MEMORY[0x24BE75640]);
      v7 = self->_usageBundlesManager;
      self->_usageBundlesManager = v6;

      usageBundlesManager = self->_usageBundlesManager;
    }
    -[PSUsageBundleManager vendUsageBundleAppsWithHandler:](usageBundlesManager, "vendUsageBundleAppsWithHandler:", v4);
    if (!self->_cacheUpdateCancelled)
    {
      -[PSUsageBundleManager allUsageBundleApps](self->_usageBundlesManager, "allUsageBundleApps");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      usageBundlesCache = self->_usageBundlesCache;
      self->_usageBundlesCache = v8;

      ICQUSLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_usageBundlesCache;
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Populating usage bundles cache with %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }

}

- (void)removeMediaCollectionCacheForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_mediaCache, "removeObjectForKey:", a3);
}

- (id)mediaCollectionForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_mediaCache, "objectForKey:", a3);
}

- (float)sizeForMediaQuery:(id)a3 withGroupingType:(int64_t)a4 storingInCache:(id)a5 withKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  uint64_t j;
  void *v29;
  float v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  float v39;
  double v40;
  double v41;
  void *v43;
  id v44;
  id v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDDBBE0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFilterPredicate:", v12);

  v13 = (void *)objc_opt_new();
  if (a4)
  {
    objc_msgSend(v9, "setGroupingType:", a4);
    objc_msgSend(v9, "collections");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v43 = v13;
      v44 = v11;
      v45 = v10;
      v46 = v9;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      obj = v14;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v57;
        v19 = *MEMORY[0x24BDDBB70];
        v20 = 0.0;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v57 != v18)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            objc_msgSend(v22, "items");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v53;
              v27 = 0.0;
              do
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v53 != v26)
                    objc_enumerationMutation(v23);
                  objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "valueForProperty:", v19);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "floatValue");
                  v27 = v27 + v30;

                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
              }
              while (v25);
            }
            else
            {
              v27 = 0.0;
            }

            v20 = v20 + v27;
            *(float *)&v31 = v27;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v32);

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        }
        while (v17);
      }
      else
      {
        v20 = 0.0;
      }
      v14 = obj;

      v13 = v43;
      objc_msgSend(v43, "setGrouped:", 1);
      objc_msgSend(v43, "setItems:", obj);
      *(float *)&v40 = v20;
      objc_msgSend(v43, "setTotalSize:", v40);
      objc_msgSend(v43, "setItemSizes:", v15);

      v10 = v45;
      v9 = v46;
      v11 = v44;
      goto LABEL_34;
    }
LABEL_29:
    v20 = 0.0;
    goto LABEL_34;
  }
  objc_msgSend(v9, "items");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "count"))
    goto LABEL_29;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v14 = v14;
  v33 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v49;
    v36 = *MEMORY[0x24BDDBB70];
    v20 = 0.0;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v49 != v35)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * k), "valueForProperty:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "floatValue");
        v20 = v20 + v39;

      }
      v34 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v34);
  }
  else
  {
    v20 = 0.0;
  }

  objc_msgSend(v13, "setItems:", v14);
  *(float *)&v41 = v20;
  objc_msgSend(v13, "setTotalSize:", v41);
LABEL_34:

  objc_msgSend(v10, "setObject:forKey:", v13, v11);
  return v20;
}

- (void)populateMediaCache
{
  NSMutableDictionary *v3;
  NSMutableDictionary *mediaCache;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  dispatch_semaphore_t v29;
  dispatch_queue_t v30;
  NSObject *v31;
  _QWORD v32[4];

  if (!self->_mediaCache)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mediaCache = self->_mediaCache;
    self->_mediaCache = v3;

    objc_msgSend(MEMORY[0x24BDDC818], "setFilteringDisabled:", 1);
    v5 = (void *)MEMORY[0x24BDDC7F0];
    objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "libraryDataProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadDynamicPropertiesForLibraryDataProvider:", v7);

    objc_msgSend(MEMORY[0x24BDDC818], "ITunesUAudioQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUsageStorageCache sizeForMediaQuery:withGroupingType:storingInCache:withKey:](self, "sizeForMediaQuery:withGroupingType:storingInCache:withKey:", v8, 1, self->_mediaCache, CFSTR("audiocourses"));

    if (self->_cacheUpdateCancelled)
    {
      v9 = self->_mediaCache;
      self->_mediaCache = 0;

    }
    else
    {
      v10 = objc_alloc(MEMORY[0x24BDDC818]);
      v11 = (void *)MEMORY[0x24BDBCF20];
      v12 = (void *)MEMORY[0x24BDDC810];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4096);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x24BDDBC30];
      objc_msgSend(v12, "predicateWithValue:forProperty:", v13, *MEMORY[0x24BDDBC30]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v10, "initWithFilterPredicates:", v16);

      -[ICQUsageStorageCache sizeForMediaQuery:withGroupingType:storingInCache:withKey:](self, "sizeForMediaQuery:withGroupingType:storingInCache:withKey:", v17, 1, self->_mediaCache, CFSTR("videocourses"));
      if (self->_cacheUpdateCancelled)
      {
        v18 = self->_mediaCache;
        self->_mediaCache = 0;

      }
      else
      {
        v19 = objc_alloc(MEMORY[0x24BDDC818]);
        v20 = (void *)MEMORY[0x24BDBCF20];
        v21 = (void *)MEMORY[0x24BDDC810];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "predicateWithValue:forProperty:", v22, v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setWithObject:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v19, "initWithFilterPredicates:", v24);

        -[ICQUsageStorageCache sizeForMediaQuery:withGroupingType:storingInCache:withKey:](self, "sizeForMediaQuery:withGroupingType:storingInCache:withKey:", v25, 7, self->_mediaCache, CFSTR("audiopodcasts"));
        if (self->_cacheUpdateCancelled)
          goto LABEL_9;
        objc_msgSend(MEMORY[0x24BDDC818], "videoPodcastsQuery");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUsageStorageCache sizeForMediaQuery:withGroupingType:storingInCache:withKey:](self, "sizeForMediaQuery:withGroupingType:storingInCache:withKey:", v26, 7, self->_mediaCache, CFSTR("videopodcasts"));

        if (self->_cacheUpdateCancelled
          || (objc_msgSend(MEMORY[0x24BDDC818], "audiobooksQuery"),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              -[ICQUsageStorageCache sizeForMediaQuery:withGroupingType:storingInCache:withKey:](self, "sizeForMediaQuery:withGroupingType:storingInCache:withKey:", v27, 10, self->_mediaCache, CFSTR("audiobooks")), v27, self->_cacheUpdateCancelled))
        {
LABEL_9:
          v28 = self->_mediaCache;
          self->_mediaCache = 0;

        }
        else
        {
          v29 = dispatch_semaphore_create(0);
          v30 = dispatch_queue_create(0, 0);
          v32[0] = 0;
          v32[1] = v32;
          v32[2] = 0x2020000000;
          v32[3] = 0;
          v31 = v29;
          ALGetLibrarySizes();
          dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);

          _Block_object_dispose(v32, 8);
        }

      }
    }
  }
}

void __42__ICQUsageStorageCache_populateMediaCache__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  ICQUsageMediaCollection *v6;
  void *v7;
  uint64_t v8;
  double v9;

  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = objc_alloc_init(ICQUsageMediaCollection);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUsageMediaCollection setItems:](v6, "setItems:", v7);

    v8 = a2 - 1;
    if ((unint64_t)(a2 - 1) >= 8 || ((0x8Bu >> v8) & 1) == 0)
      __42__ICQUsageStorageCache_populateMediaCache__block_invoke_cold_1();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v6, off_24E3F5150[v8]);
    *(float *)&v9 = (float)a3;
    -[ICQUsageMediaCollection setTotalSize:](v6, "setTotalSize:", v9);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 15)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)checkAndFixUpVersion:(id)a3
{
  __CFString *v3;
  const __CFString *v4;

  v3 = (__CFString *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[__CFString stringValue](v3, "stringValue");
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    v3 = (__CFString *)v4;
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !-[__CFString length](v3, "length"))
  {
    v4 = &stru_24E400750;
    goto LABEL_6;
  }
  return v3;
}

- (float)specialStorageUsageForBundleID:(id)a3
{
  id v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = 0.0;
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE758D0]))
    goto LABEL_43;
  v42 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v42, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24E400750;
  objc_msgSend(v6, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v11;
  objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("iBooksSizingCache.plist"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v44 = v14;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "enumeratorAtPath:", CFSTR("/var/mobile/Media/Books"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  obj = v16;
  if (!v17)
  {
LABEL_31:

    goto LABEL_33;
  }
  v18 = v17;
  v39 = v3;
  v19 = 0;
  v16 = 0;
  v20 = *(_QWORD *)v50;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v50 != v20)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      objc_msgSend(CFSTR("/var/mobile/Media/Books"), "stringByAppendingPathComponent:", v22, v39);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && (objc_msgSend(v22, "hasPrefix:", v16) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v24, v16);

        v19 = 0;
        v16 = 0;
      }
      objc_msgSend(v22, "pathExtension");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "isEqualToString:", CFSTR("epub")) & 1) != 0
        || objc_msgSend(v25, "isEqualToString:", CFSTR("ibooks")))
      {
        objc_msgSend(v15, "addObject:", v22);
        objc_msgSend(v44, "objectForKey:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = objc_msgSend(v26, "unsignedLongLongValue");
          objc_msgSend(obj, "skipDescendants");

          goto LABEL_27;
        }
        if (v16)
          -[ICQUsageStorageCache specialStorageUsageForBundleID:].cold.2();
        if (v19)
          -[ICQUsageStorageCache specialStorageUsageForBundleID:].cold.1();
        v16 = v22;

      }
      objc_msgSend(v42, "attributesOfItemAtPath:error:", v23, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v28, "fileSize");

      if (v16)
        v29 = v27;
      else
        v29 = 0;
      v19 += v29;
LABEL_27:
      v4 = v4 + (float)v27;

    }
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  }
  while (v18);

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKey:", v30, v16);

    v3 = v39;
    goto LABEL_31;
  }
  v3 = v39;
LABEL_33:
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v32 = v44;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        if ((objc_msgSend(v15, "containsObject:", v37) & 1) == 0)
          objc_msgSend(v31, "addObject:", v37);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v34);
  }

  objc_msgSend(v32, "removeObjectsForKeys:", v31);
  objc_msgSend(v32, "writeToFile:atomically:", v40, 1);

LABEL_43:
  return v4;
}

- (void)populateUsageAppsCacheWithHandler:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *appsCache;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  size_t v12;
  NSObject *v13;
  id v14;
  id v15;
  NSMutableArray *v16;
  _QWORD block[4];
  id v18;
  id v19;
  ICQUsageStorageCache *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[4];
  id v28;

  v4 = a3;
  if (!self->_appsCache)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    appsCache = self->_appsCache;
    self->_appsCache = v5;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BE758D0], *MEMORY[0x24BE758C8], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __58__ICQUsageStorageCache_populateUsageAppsCacheWithHandler___block_invoke;
    v27[3] = &unk_24E3F50E8;
    v11 = v8;
    v28 = v11;
    objc_msgSend(v9, "enumerateBundlesOfType:block:", 1, v27);

    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v12 = objc_msgSend(v11, "count");
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __58__ICQUsageStorageCache_populateUsageAppsCacheWithHandler___block_invoke_2;
    block[3] = &unk_24E3F5110;
    v22 = &v23;
    v14 = v11;
    v18 = v14;
    v15 = v7;
    v19 = v15;
    v20 = self;
    v21 = v4;
    dispatch_apply(v12, v13, block);

    if (*((_BYTE *)v24 + 24))
    {
      v16 = self->_appsCache;
      self->_appsCache = 0;

    }
    _Block_object_dispose(&v23, 8);

  }
}

uint64_t __58__ICQUsageStorageCache_populateUsageAppsCacheWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __58__ICQUsageStorageCache_populateUsageAppsCacheWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  ICQUsageApp *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v4 = (void *)MEMORY[0x2207C89EC]();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC1518]) & 1) != 0)
    {

    }
    else
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6);

      if ((v8 & 1) == 0)
      {
LABEL_12:

        objc_autoreleasePoolPop(v4);
        return;
      }
    }
    v9 = objc_alloc_init(ICQUsageApp);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "addObject:", v9);
    objc_msgSend(v5, "localizedNameForContext:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v5, "bundleURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleWithURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "localizedInfoDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDBD1E0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "checkAndFixUpVersion:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v4;
    if (!objc_msgSend(v16, "length"))
    {
      objc_msgSend(v5, "shortVersionString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "checkAndFixUpVersion:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v16, "length"))
      {
        objc_msgSend(v5, "bundleVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "checkAndFixUpVersion:", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v5, "diskUsage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "staticUsage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v22 = v21;

    objc_msgSend(v5, "diskUsage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dynamicUsage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v25;

    objc_msgSend(*(id *)(a1 + 48), "specialStorageUsageForBundleID:", v6);
    v28 = v27;
    -[ICQUsageApp setName:](v9, "setName:", v10);
    -[ICQUsageApp setBundleIdentifier:](v9, "setBundleIdentifier:", v6);
    -[ICQUsageApp setBundleVersion:](v9, "setBundleVersion:", v16);
    LODWORD(v29) = v22;
    -[ICQUsageApp setStaticSize:](v9, "setStaticSize:", v29);
    LODWORD(v30) = v26;
    -[ICQUsageApp setDynamicSize:](v9, "setDynamicSize:", v30);
    LODWORD(v31) = v28;
    -[ICQUsageApp setSpecialSize:](v9, "setSpecialSize:", v31);
    objc_msgSend(v5, "applicationType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUsageApp setSystemApp:](v9, "setSystemApp:", objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BDC1508]));

    v33 = *(_QWORD *)(a1 + 56);
    if (v33)
    {
      if (((*(uint64_t (**)(uint64_t, ICQUsageApp *))(v33 + 16))(v33, v9) & 1) == 0)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

    v4 = v34;
    goto LABEL_12;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache_operation_queue, 0);
  objc_storeStrong((id *)&self->_usageBundlesCache, 0);
  objc_storeStrong((id *)&self->_appsCache, 0);
  objc_storeStrong((id *)&self->_mediaCache, 0);
  objc_storeStrong((id *)&self->_usageBundlesManager, 0);
}

- (void)populateUsageDataWithProgressBlock:.cold.1()
{
  __assert_rtn("-[ICQUsageStorageCache populateUsageDataWithProgressBlock:]", "ICQUsageStorageMonitor.m", 136, "progressBlock");
}

void __42__ICQUsageStorageCache_populateMediaCache__block_invoke_cold_1()
{
  __assert_rtn("-[ICQUsageStorageCache populateMediaCache]_block_invoke", "ICQUsageStorageMonitor.m", 311, "0");
}

- (void)specialStorageUsageForBundleID:.cold.1()
{
  __assert_rtn("-[ICQUsageStorageCache specialStorageUsageForBundleID:]", "ICQUsageStorageMonitor.m", 380, "!currentItemSize");
}

- (void)specialStorageUsageForBundleID:.cold.2()
{
  __assert_rtn("-[ICQUsageStorageCache specialStorageUsageForBundleID:]", "ICQUsageStorageMonitor.m", 379, "!currentBook");
}

@end
