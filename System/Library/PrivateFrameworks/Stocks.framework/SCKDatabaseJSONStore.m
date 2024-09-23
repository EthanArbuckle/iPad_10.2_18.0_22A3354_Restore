@implementation SCKDatabaseJSONStore

+ (id)preferredFileURLForSchema:(id)a3 parentDirectoryURL:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "environment");

  v10 = CFSTR("sandbox");
  if (v9 == 1)
    v10 = CFSTR("production");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@-dbstore.json"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (SCKDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4 allowedCommands:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCKDatabaseJSONStore *v11;
  SCKDatabaseJSONStore *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *zoneStoresByName;
  NSMutableDictionary *v15;
  NSMutableDictionary *foreignZoneDictsByName;
  uint64_t v17;
  NSHashTable *observers;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *accessQueue;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *workQueue;
  SCKOperationThrottler *v26;
  SCKOperationThrottler *saveThrottler;
  uint64_t v28;
  NSFileCoordinator *fileCoordinator;
  uint64_t v30;
  NSOperationQueue *presentedItemOperationQueue;
  uint64_t v32;
  NSSet *allowedCommandClasses;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  SCKZoneJSONStore *v40;
  void *v41;
  SCKZoneJSONStore *v42;
  void *v43;
  void *v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v51.receiver = self;
  v51.super_class = (Class)SCKDatabaseJSONStore;
  v11 = -[SCKDatabaseJSONStore init](&v51, sel_init);
  v12 = v11;
  if (v11)
  {
    v46 = v9;
    objc_storeStrong((id *)&v11->_storeURL, a4);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    zoneStoresByName = v12->_zoneStoresByName;
    v12->_zoneStoresByName = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    foreignZoneDictsByName = v12->_foreignZoneDictsByName;
    v12->_foreignZoneDictsByName = v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 0);
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v17;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("SCKDatabaseJSONStore.access", v19);
    accessQueue = v12->_accessQueue;
    v12->_accessQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("SCKDatabaseJSONStore.work", v23);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v24;

    v26 = -[SCKOperationThrottler initWithDelegate:updateQueue:]([SCKOperationThrottler alloc], "initWithDelegate:updateQueue:", v12, v12->_workQueue);
    saveThrottler = v12->_saveThrottler;
    v12->_saveThrottler = v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", v12);
    fileCoordinator = v12->_fileCoordinator;
    v12->_fileCoordinator = (NSFileCoordinator *)v28;

    objc_storeStrong((id *)&v12->_presentedItemURL, v12->_storeURL);
    v30 = objc_opt_new();
    presentedItemOperationQueue = v12->_presentedItemOperationQueue;
    v12->_presentedItemOperationQueue = (NSOperationQueue *)v30;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v12->_presentedItemOperationQueue, "setMaxConcurrentOperationCount:", 1);
    if (objc_msgSend(v10, "count"))
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    else
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v32 = objc_claimAutoreleasedReturnValue();
    allowedCommandClasses = v12->_allowedCommandClasses;
    v12->_allowedCommandClasses = (NSSet *)v32;

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v8, "zoneSchemas");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v40 = [SCKZoneJSONStore alloc];
          objc_msgSend(v39, "zoneName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[SCKZoneJSONStore initWithZoneName:serverRecords:lastSyncDate:lastDirtyDate:serverChangeToken:pendingCommands:](v40, "initWithZoneName:serverRecords:lastSyncDate:lastDirtyDate:serverChangeToken:pendingCommands:", v41, 0, 0, 0, 0, 0);

          -[SCKDatabaseJSONStore zoneStoresByName](v12, "zoneStoresByName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "zoneName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, v44);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v36);
    }

    -[SCKDatabaseJSONStore _listenForChangesToFileURL:](v12, "_listenForChangesToFileURL:", v12->_storeURL);
    v9 = v46;
  }

  return v12;
}

- (SCKDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4 allowedCommands:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SCKDatabaseJSONStore *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "preferredFileURLForSchema:parentDirectoryURL:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SCKDatabaseJSONStore initWithSchema:fileURL:allowedCommands:](self, "initWithSchema:fileURL:allowedCommands:", v10, v11, v8);
  return v12;
}

- (SCKDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4
{
  return -[SCKDatabaseJSONStore initWithSchema:fileURL:allowedCommands:](self, "initWithSchema:fileURL:allowedCommands:", a3, a4, 0);
}

- (SCKDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4
{
  return -[SCKDatabaseJSONStore initWithSchema:parentDirectoryURL:allowedCommands:](self, "initWithSchema:parentDirectoryURL:allowedCommands:", a3, a4, 0);
}

- (id)zoneStoreForSchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SCKDatabaseJSONStore zoneStoresByName](self, "zoneStoresByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->_cloudBackupEnabled = a3;
  -[SCKDatabaseJSONStore _applyCloudBackupEnabledPropertyToStoreURL](self, "_applyCloudBackupEnabledPropertyToStoreURL");
}

- (void)readWithAccessor:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[SCKDatabaseJSONStore accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke;
  block[3] = &unk_24D74C130;
  block[4] = self;
  v7 = v4;
  v15 = v7;
  v16 = &v17;
  dispatch_sync(v5, block);

  if (!*((_BYTE *)v18 + 24))
  {
    -[SCKDatabaseJSONStore fileCoordinator](self, "fileCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCKDatabaseJSONStore storeURL](self, "storeURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke_2;
    v11[3] = &unk_24D74C180;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v8, "coordinateReadingItemAtURL:options:error:byAccessor:", v9, 0, &v13, v11);
    v10 = v13;

  }
  _Block_object_dispose(&v17, 8);

}

uint64_t __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "loadedFromDisk");
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke_3;
  block[3] = &unk_24D74C158;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_sync(v4, block);

}

uint64_t __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reloadIfNeededFromFileURL:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)writeWithAccessor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  -[SCKDatabaseJSONStore fileCoordinator](self, "fileCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore storeURL](self, "storeURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__SCKDatabaseJSONStore_writeWithAccessor___block_invoke;
  v10[3] = &unk_24D74C180;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "coordinateReadingItemAtURL:options:error:byAccessor:", v6, 0, &v12, v10);
  v8 = v12;

  -[SCKDatabaseJSONStore saveThrottler](self, "saveThrottler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tickle");

}

void __42__SCKDatabaseJSONStore_writeWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SCKDatabaseJSONStore_writeWithAccessor___block_invoke_2;
  block[3] = &unk_24D74C158;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_sync(v4, block);

}

uint64_t __42__SCKDatabaseJSONStore_writeWithAccessor___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_reloadIfNeededFromFileURL:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  result = objc_msgSend(*(id *)(a1 + 32), "havePendingChanges");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHavePendingChanges:", 1);
    return objc_msgSend(MEMORY[0x24BDD1570], "addFilePresenter:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

- (void)reloadWithAccessor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  -[SCKDatabaseJSONStore fileCoordinator](self, "fileCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore storeURL](self, "storeURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__SCKDatabaseJSONStore_reloadWithAccessor___block_invoke;
  v9[3] = &unk_24D74C180;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v5, "coordinateReadingItemAtURL:options:error:byAccessor:", v6, 0, &v11, v9);
  v8 = v11;

}

void __43__SCKDatabaseJSONStore_reloadWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SCKDatabaseJSONStore_reloadWithAccessor___block_invoke_2;
  block[3] = &unk_24D74C158;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_sync(v4, block);

}

uint64_t __43__SCKDatabaseJSONStore_reloadWithAccessor___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reloadIfNeededFromFileURL:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)readZone:(id)a3 withAccessor:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__SCKDatabaseJSONStore_readZone_withAccessor___block_invoke;
  v10[3] = &unk_24D74C1A8;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[SCKDatabaseJSONStore readWithAccessor:](self, "readWithAccessor:", v10);

}

void __46__SCKDatabaseJSONStore_readZone_withAccessor___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "zoneStoreForSchema:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)writeZone:(id)a3 withAccessor:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__SCKDatabaseJSONStore_writeZone_withAccessor___block_invoke;
  v10[3] = &unk_24D74C1A8;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[SCKDatabaseJSONStore writeWithAccessor:](self, "writeWithAccessor:", v10);

}

void __47__SCKDatabaseJSONStore_writeZone_withAccessor___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "zoneStoreForSchema:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCKDatabaseJSONStore observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCKDatabaseJSONStore observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)operationThrottlerPerformOperation:(id)a3
{
  void *v4;
  int v5;
  SCKDatabaseJSONStore *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%p JSON store will flush changes to disk", (uint8_t *)&v5, 0xCu);
  }
  -[SCKDatabaseJSONStore storeURL](self, "storeURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore _saveIfNeededToFileURL:](self, "_saveIfNeededToFileURL:", v4);

}

- (void)savePresentedItemChangesWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  int v6;
  SCKDatabaseJSONStore *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%p JSON store will flush changes to disk for another reader", (uint8_t *)&v6, 0xCu);
  }
  -[SCKDatabaseJSONStore storeURL](self, "storeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore _saveIfNeededToFileURL:](self, "_saveIfNeededToFileURL:", v5);

  v4[2](v4, 0);
}

- (BOOL)flushToDiskWithTimeout:(double)a3
{
  void *v4;

  -[SCKDatabaseJSONStore storeURL](self, "storeURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore _saveIfNeededToFileURL:](self, "_saveIfNeededToFileURL:", v4);

  return 1;
}

- (void)_saveToFileURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  int v48;
  id v49;
  id v50;
  id obj;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint32_t value;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  -[SCKDatabaseJSONStore foreignZoneDictsByName](self, "foreignZoneDictsByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v71 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v8);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[SCKDatabaseJSONStore zoneStoresByName](self, "zoneStoresByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v12;
  v54 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v54)
  {
    v52 = *(_QWORD *)v67;
    v53 = v4;
    do
    {
      for (j = 0; j != v54; ++j)
      {
        if (*(_QWORD *)v67 != v52)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        objc_msgSend(v14, "serverRecords");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v63;
          do
          {
            for (k = 0; k != v18; ++k)
            {
              if (*(_QWORD *)v63 != v19)
                objc_enumerationMutation(v16);
              -[SCKDatabaseJSONStore _encodeCodableObject:](self, "_encodeCodableObject:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * k));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
          }
          while (v18);
        }

        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        objc_msgSend(v14, "pendingCommands");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v59;
          do
          {
            for (m = 0; m != v25; ++m)
            {
              if (*(_QWORD *)v59 != v26)
                objc_enumerationMutation(v23);
              -[SCKDatabaseJSONStore _encodeCodableObject:](self, "_encodeCodableObject:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * m));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v28);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
          }
          while (v25);
        }

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "zoneName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("name"));

        objc_msgSend(v29, "setObject:forKeyedSubscript:", v15, CFSTR("serverRecords"));
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v22, CFSTR("pendingCommands"));
        objc_msgSend(v14, "lastSyncDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCKDatabaseJSONStore _encodeDate:](self, "_encodeDate:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("lastSyncDate"));

        objc_msgSend(v14, "lastDirtyDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCKDatabaseJSONStore _encodeDate:](self, "_encodeDate:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v34, CFSTR("lastDirtyDate"));

        objc_msgSend(v14, "serverChangeToken");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCKDatabaseJSONStore _encodeCodableObject:](self, "_encodeCodableObject:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v36, CFSTR("serverChangeToken"));

        v4 = v53;
        objc_msgSend(v53, "addObject:", v29);

      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v54);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore lastSyncDate](self, "lastSyncDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore _encodeDate:](self, "_encodeDate:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, CFSTR("lastSyncDate"));

  -[SCKDatabaseJSONStore lastDirtyDate](self, "lastDirtyDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore _encodeDate:](self, "_encodeDate:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v41, CFSTR("lastDirtyDate"));

  -[SCKDatabaseJSONStore serverChangeToken](self, "serverChangeToken");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore _encodeCodableObject:](self, "_encodeCodableObject:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v43, CFSTR("serverChangeToken"));

  objc_msgSend(v37, "setObject:forKeyedSubscript:", v4, CFSTR("zones"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v37, CFSTR("database"));
  v57 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v44, 0, &v57);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v57;
  if (v45)
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v45, 4);
    v56 = v46;
    v48 = objc_msgSend(v47, "writeToURL:atomically:encoding:error:", v50, 1, 4, &v56);
    v49 = v56;

    if (v48)
    {
      value = arc4random_uniform(0xFFFFFFFE) + 1;
      setxattr((const char *)objc_msgSend(objc_retainAutorelease(v50), "fileSystemRepresentation"), "com.apple.stocks.jsonStoreChangeTag", &value, 4uLL, 0, 0);
      -[SCKDatabaseJSONStore setLastKnownStoreChangeTag:](self, "setLastKnownStoreChangeTag:", value);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[SCKDatabaseJSONStore _saveToFileURL:].cold.2();
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SCKDatabaseJSONStore _saveToFileURL:].cold.1();
    v49 = v46;
  }
  -[SCKDatabaseJSONStore _applyCloudBackupEnabledPropertyToStoreURL](self, "_applyCloudBackupEnabledPropertyToStoreURL");
  ++self->_diskWriteCount;

}

- (void)_applyCloudBackupEnabledPropertyToStoreURL
{
  const __CFString *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("disable");
  v4 = 134218498;
  v5 = a1;
  v6 = 2114;
  if ((a2 & 1) != 0)
    v3 = CFSTR("enable");
  v7 = v3;
  v8 = 2114;
  v9 = a3;
  _os_log_error_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%p failed to %{public}@ cloud backup for JSON database store: %{public}@", (uint8_t *)&v4, 0x20u);
}

- (void)_saveIfNeededToFileURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[SCKDatabaseJSONStore fileCoordinator](self, "fileCoordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKDatabaseJSONStore storeURL](self, "storeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = self;
  v8 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SCKDatabaseJSONStore__saveIfNeededToFileURL___block_invoke;
  v7[3] = &unk_24D74C1F8;
  objc_msgSend(v4, "coordinateWritingItemAtURL:options:error:byAccessor:", v5, 4, &v8, v7);
  v6 = v8;

}

void __47__SCKDatabaseJSONStore__saveIfNeededToFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SCKDatabaseJSONStore__saveIfNeededToFileURL___block_invoke_2;
  block[3] = &unk_24D74C1D0;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

uint64_t __47__SCKDatabaseJSONStore__saveIfNeededToFileURL___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "havePendingChanges");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_saveToFileURL:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setHavePendingChanges:", 0);
    return objc_msgSend(MEMORY[0x24BDD1570], "removeFilePresenter:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

- (void)_loadFromFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSDate *v11;
  NSDate *lastSyncDate;
  void *v13;
  NSDate *v14;
  NSDate *lastDirtyDate;
  uint64_t v16;
  void *v17;
  CKServerChangeToken *v18;
  CKServerChangeToken *serverChangeToken;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  SCKZoneJSONStore *v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  _BYTE v92[128];
  uint8_t v93[128];
  uint8_t buf[4];
  SCKDatabaseJSONStore *v95;
  __int16 v96;
  id v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v4, 4, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    objc_msgSend(v63, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, &v91);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v91;
    v8 = v7;
    if (v6)
    {
      v70 = v7;
      v72 = v5;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("database"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lastSyncDate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCKDatabaseJSONStore _decodeDate:](self, "_decodeDate:", v10);
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastSyncDate = self->_lastSyncDate;
      self->_lastSyncDate = v11;

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lastDirtyDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCKDatabaseJSONStore _decodeDate:](self, "_decodeDate:", v13);
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastDirtyDate = self->_lastDirtyDate;
      self->_lastDirtyDate = v14;

      v16 = objc_opt_class();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("serverChangeToken"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCKDatabaseJSONStore _decodeCodableObjectOfClass:from:error:](self, "_decodeCodableObjectOfClass:from:error:", v16, v17, 0);
      v18 = (CKServerChangeToken *)objc_claimAutoreleasedReturnValue();
      serverChangeToken = self->_serverChangeToken;
      self->_serverChangeToken = v18;

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("zones"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v88 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("name"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setObject:forKeyedSubscript:", v25, v26);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
        }
        while (v22);
      }

      v8 = v70;
      v5 = v72;
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[SCKDatabaseJSONStore _loadFromFileURL:].cold.1();
    }

  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v69, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
  if (v66)
  {
    v27 = 0x24BDBC000uLL;
    v65 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v66; ++j)
      {
        if (*(_QWORD *)v84 != v65)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
        objc_msgSend(v69, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCKDatabaseJSONStore zoneStoresByName](self, "zoneStoresByName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v67 = v29;
          v68 = j;
          objc_msgSend(*(id *)(v27 + 3768), "array");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v71 = v30;
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("serverRecords"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v80;
            do
            {
              for (k = 0; k != v36; ++k)
              {
                if (*(_QWORD *)v80 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k);
                v40 = objc_opt_class();
                v78 = 0;
                -[SCKDatabaseJSONStore _decodeCodableObjectOfClass:from:error:](self, "_decodeCodableObjectOfClass:from:error:", v40, v39, &v78);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = v78;
                if (v41)
                {
                  objc_msgSend(v33, "addObject:", v41);
                }
                else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  v95 = self;
                  v96 = 2114;
                  v97 = v42;
                  _os_log_error_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%p failed to decode server record with error: %{public}@", buf, 0x16u);
                }

              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
            }
            while (v36);
          }

          objc_msgSend(*(id *)(v27 + 3768), "array");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("pendingCommands"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v75;
            do
            {
              for (m = 0; m != v46; ++m)
              {
                if (*(_QWORD *)v75 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * m);
                -[SCKDatabaseJSONStore allowedCommandClasses](self, "allowedCommandClasses");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = 0;
                -[SCKDatabaseJSONStore _decodeCodableObjectOfClasses:from:error:](self, "_decodeCodableObjectOfClasses:from:error:", v50, v49, &v73);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = v73;

                if (v51)
                {
                  objc_msgSend(v43, "addObject:", v51);
                }
                else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  v95 = self;
                  v96 = 2114;
                  v97 = v52;
                  _os_log_error_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%p failed to decode command with error: %{public}@", buf, 0x16u);
                }

              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
            }
            while (v46);
          }

          v30 = v71;
          objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("lastSyncDate"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCKDatabaseJSONStore _decodeDate:](self, "_decodeDate:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("lastDirtyDate"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCKDatabaseJSONStore _decodeDate:](self, "_decodeDate:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          v57 = objc_opt_class();
          objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("serverChangeToken"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCKDatabaseJSONStore _decodeCodableObjectOfClass:from:error:](self, "_decodeCodableObjectOfClass:from:error:", v57, v58, 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          v60 = -[SCKZoneJSONStore initWithZoneName:serverRecords:lastSyncDate:lastDirtyDate:serverChangeToken:pendingCommands:]([SCKZoneJSONStore alloc], "initWithZoneName:serverRecords:lastSyncDate:lastDirtyDate:serverChangeToken:pendingCommands:", v67, v33, v54, v56, v59, v43);
          -[SCKDatabaseJSONStore zoneStoresByName](self, "zoneStoresByName");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, v67);

          v27 = 0x24BDBC000;
          j = v68;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v95 = self;
            v96 = 2114;
            v97 = v29;
            _os_log_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%p preserving unknown zone %{public}@", buf, 0x16u);
          }
          -[SCKDatabaseJSONStore foreignZoneDictsByName](self, "foreignZoneDictsByName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v30, v29);
        }

      }
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
    }
    while (v66);
  }

  ++self->_diskReadCount;
}

- (BOOL)_reloadIfNeededFromFileURL:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  BOOL v9;
  unsigned int value;

  v4 = a3;
  if (objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0))
  {
    value = 0;
    v5 = objc_retainAutorelease(v4);
    getxattr((const char *)objc_msgSend(v5, "fileSystemRepresentation"), "com.apple.stocks.jsonStoreChangeTag", &value, 4uLL, 0, 0);
    v6 = value;
    v7 = -[SCKDatabaseJSONStore lastKnownStoreChangeTag](self, "lastKnownStoreChangeTag");
    v8 = v6 == v7;
    v9 = v6 != v7;
    if (!v8)
    {
      -[SCKDatabaseJSONStore _loadFromFileURL:](self, "_loadFromFileURL:", v5);
      -[SCKDatabaseJSONStore setLastKnownStoreChangeTag:](self, "setLastKnownStoreChangeTag:", value);
    }
  }
  else
  {
    v9 = 0;
  }
  -[SCKDatabaseJSONStore setLoadedFromDisk:](self, "setLoadedFromDisk:", 1);

  return v9;
}

- (void)_listenForChangesToFileURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  NSObject *v8;
  dispatch_source_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  int v16;
  _QWORD handler[5];
  id v18;

  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingLastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0x8000);

  -[SCKDatabaseJSONStore workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_source_create(MEMORY[0x24BDACA28], v7, 0xEuLL, v8);
  -[SCKDatabaseJSONStore setChangeListenerSource:](self, "setChangeListenerSource:", v9);

  -[SCKDatabaseJSONStore changeListenerSource](self, "changeListenerSource");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke;
  handler[3] = &unk_24D74C1D0;
  handler[4] = self;
  v18 = v4;
  v12 = v4;
  dispatch_source_set_event_handler(v10, handler);

  -[SCKDatabaseJSONStore changeListenerSource](self, "changeListenerSource");
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke_44;
  v15[3] = &__block_descriptor_36_e5_v8__0l;
  v16 = v7;
  dispatch_source_set_cancel_handler(v13, v15);

  -[SCKDatabaseJSONStore changeListenerSource](self, "changeListenerSource");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v14);

}

void __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke_2;
  block[3] = &unk_24D74C220;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v16 = v4;
  v17 = &v18;
  dispatch_sync(v2, block);

  if (*((_BYTE *)v19 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v24 = v5;
      _os_log_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%p JSON store will notify of external changes from another writer", buf, 0xCu);
    }
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "observers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "storeCoordinatorDiscoveredExternalChanges:", *(_QWORD *)(a1 + 32));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v22, 16);
      }
      while (v7);
    }

  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t result;
  int value;

  value = 0;
  getxattr((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), "com.apple.stocks.jsonStoreChangeTag", &value, 4uLL, 0, 0);
  v2 = value;
  result = objc_msgSend(*(id *)(a1 + 40), "lastKnownStoreChangeTag");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != (_DWORD)result;
  return result;
}

uint64_t __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke_44(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (id)_encodeCodableObject:(id)a3
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v9;

  v3 = &stru_24D74CF50;
  if (a3)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (__CFString *)v5;
    else
      v7 = &stru_24D74CF50;
    v3 = v7;

  }
  return v3;
}

- (id)_decodeCodableObjectOfClass:(Class)a3 from:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v7, 0);
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a3, v8, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_decodeCodableObjectOfClasses:(id)a3 from:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v8, 0);
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v7, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_encodeDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_decodeDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isCloudBackupEnabled
{
  return self->_cloudBackupEnabled;
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (NSFileCoordinator)fileCoordinator
{
  return self->_fileCoordinator;
}

- (void)setFileCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinator, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (BOOL)loadedFromDisk
{
  return self->_loadedFromDisk;
}

- (void)setLoadedFromDisk:(BOOL)a3
{
  self->_loadedFromDisk = a3;
}

- (unsigned)lastKnownStoreChangeTag
{
  return self->_lastKnownStoreChangeTag;
}

- (void)setLastKnownStoreChangeTag:(unsigned int)a3
{
  self->_lastKnownStoreChangeTag = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableDictionary)zoneStoresByName
{
  return self->_zoneStoresByName;
}

- (void)setZoneStoresByName:(id)a3
{
  objc_storeStrong((id *)&self->_zoneStoresByName, a3);
}

- (NSMutableDictionary)foreignZoneDictsByName
{
  return self->_foreignZoneDictsByName;
}

- (void)setForeignZoneDictsByName:(id)a3
{
  objc_storeStrong((id *)&self->_foreignZoneDictsByName, a3);
}

- (BOOL)havePendingChanges
{
  return self->_havePendingChanges;
}

- (void)setHavePendingChanges:(BOOL)a3
{
  self->_havePendingChanges = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (SCKOperationThrottler)saveThrottler
{
  return self->_saveThrottler;
}

- (void)setSaveThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_saveThrottler, a3);
}

- (OS_dispatch_source)changeListenerSource
{
  return self->_changeListenerSource;
}

- (void)setChangeListenerSource:(id)a3
{
  objc_storeStrong((id *)&self->_changeListenerSource, a3);
}

- (NSSet)allowedCommandClasses
{
  return self->_allowedCommandClasses;
}

- (void)setAllowedCommandClasses:(id)a3
{
  objc_storeStrong((id *)&self->_allowedCommandClasses, a3);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (unint64_t)diskReadCount
{
  return self->_diskReadCount;
}

- (unint64_t)diskWriteCount
{
  return self->_diskWriteCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_allowedCommandClasses, 0);
  objc_storeStrong((id *)&self->_changeListenerSource, 0);
  objc_storeStrong((id *)&self->_saveThrottler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_foreignZoneDictsByName, 0);
  objc_storeStrong((id *)&self->_zoneStoresByName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

- (void)_saveToFileURL:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_21736B000, MEMORY[0x24BDACB70], v0, "%p failed to generate database JSON with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)_saveToFileURL:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_21736B000, MEMORY[0x24BDACB70], v0, "%p failed to write database JSON to disk with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)_loadFromFileURL:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_21736B000, MEMORY[0x24BDACB70], v0, "%p failed to decode database JSON with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
