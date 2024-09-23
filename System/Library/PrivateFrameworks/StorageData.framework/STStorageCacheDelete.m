@implementation STStorageCacheDelete

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken_0 != -1)
    dispatch_once(&sharedMonitor_onceToken_0, &__block_literal_global_7);
  return (id)sharedMonitor__monitor;
}

void __37__STStorageCacheDelete_sharedMonitor__block_invoke()
{
  STStorageCacheDelete *v0;
  void *v1;

  v0 = objc_alloc_init(STStorageCacheDelete);
  v1 = (void *)sharedMonitor__monitor;
  sharedMonitor__monitor = (uint64_t)v0;

}

- (STStorageCacheDelete)init
{
  STStorageCacheDelete *v2;
  NSObject *v3;
  uint64_t v4;
  int *v5;
  NSObject *v6;
  _QWORD v8[4];
  int *v9;
  _QWORD block[4];
  int *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STStorageCacheDelete;
  v2 = -[STStorageCacheDelete init](&v12, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(25, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__STStorageCacheDelete_init__block_invoke;
    block[3] = &unk_24C75F658;
    v5 = v2;
    v11 = v5;
    dispatch_async(v3, block);

    dispatch_get_global_queue(9, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __28__STStorageCacheDelete_init__block_invoke_2;
    v8[3] = &unk_24C75FDB8;
    v9 = v5;
    notify_register_dispatch("CACHE_DELETE_PURGEABLE_UPDATED", v5 + 2, v6, v8);

    notify_suspend(v5[2]);
  }
  return v2;
}

uint64_t __28__STStorageCacheDelete_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshPurgeableSpace");
}

void __28__STStorageCacheDelete_init__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshPurgeableSpace");
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_3);
}

void __28__STStorageCacheDelete_init__block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("STStoragePurgeableChangedNotification"), 0);

}

- (void)dealloc
{
  int cdNotifyToken;
  objc_super v4;

  cdNotifyToken = self->_cdNotifyToken;
  if (cdNotifyToken)
    notify_cancel(cdNotifyToken);
  v4.receiver = self;
  v4.super_class = (Class)STStorageCacheDelete;
  -[STStorageCacheDelete dealloc](&v4, sel_dealloc);
}

- (void)startMonitor
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__STStorageCacheDelete_startMonitor__block_invoke;
  block[3] = &unk_24C75F658;
  block[4] = self;
  dispatch_async(v3, block);

  notify_resume(self->_cdNotifyToken);
}

uint64_t __36__STStorageCacheDelete_startMonitor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshPurgeableSpace");
}

- (void)stopMonitor
{
  notify_suspend(self->_cdNotifyToken);
}

- (void)refreshPurgeableSpace
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  int64_t v18;
  NSDictionary *itemsDict;
  _Unwind_Exception *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v3 = getCacheDeleteCopyPurgeableSpaceWithInfoSymbolLoc_ptr;
  v24 = getCacheDeleteCopyPurgeableSpaceWithInfoSymbolLoc_ptr;
  if (!getCacheDeleteCopyPurgeableSpaceWithInfoSymbolLoc_ptr)
  {
    v4 = (void *)CacheDeleteLibrary();
    v3 = dlsym(v4, "CacheDeleteCopyPurgeableSpaceWithInfo");
    v22[3] = (uint64_t)v3;
    getCacheDeleteCopyPurgeableSpaceWithInfoSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v21, 8);
  if (!v3)
  {
    -[STStorageCacheDelete refreshPurgeableSpace].cold.1();
    goto LABEL_15;
  }
  v5 = ((uint64_t (*)(void *))v3)(&unk_24C768DB8);
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x24BDBD1B8];
  if (v5)
    v8 = (void *)v5;
  else
    v8 = (void *)MEMORY[0x24BDBD1B8];
  v9 = v8;

  objc_msgSend(v9, "objectForKey:", CFSTR("CACHE_DELETE_TOTAL_PURGEABLE"), v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("/private/var"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v12 = getCacheDeleteCopyItemizedPurgeableSpaceWithInfoSymbolLoc_ptr;
  v24 = getCacheDeleteCopyItemizedPurgeableSpaceWithInfoSymbolLoc_ptr;
  if (!getCacheDeleteCopyItemizedPurgeableSpaceWithInfoSymbolLoc_ptr)
  {
    v13 = (void *)CacheDeleteLibrary();
    v12 = dlsym(v13, "CacheDeleteCopyItemizedPurgeableSpaceWithInfo");
    v22[3] = (uint64_t)v12;
    getCacheDeleteCopyItemizedPurgeableSpaceWithInfoSymbolLoc_ptr = v12;
  }
  _Block_object_dispose(&v21, 8);
  if (!v12)
  {
LABEL_15:
    v20 = (_Unwind_Exception *)-[STStorageCacheDelete refreshPurgeableSpace].cold.1();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v20);
  }
  v14 = ((uint64_t (*)(void *))v12)(&unk_24C768DE0);
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v7;
  v17 = v16;

  os_unfair_lock_lock(&self->_updateLock);
  v18 = objc_msgSend(v11, "longLongValue", v21);
  itemsDict = self->_itemsDict;
  self->_totalPurgeable = v18;
  self->_itemsDict = v17;

  os_unfair_lock_unlock(&self->_updateLock);
  self->_inited = 1;

}

- (id)cacheDeleteDict
{
  os_unfair_lock_s *p_updateLock;
  NSDictionary *v4;

  while (!self->_inited)
    usleep(0x186A0u);
  p_updateLock = &self->_updateLock;
  os_unfair_lock_lock(&self->_updateLock);
  v4 = self->_itemsDict;
  os_unfair_lock_unlock(p_updateLock);
  return v4;
}

- (int64_t)totalPurgeable
{
  os_unfair_lock_s *p_updateLock;
  int64_t totalPurgeable;

  while (!self->_inited)
    usleep(0x186A0u);
  p_updateLock = &self->_updateLock;
  os_unfair_lock_lock(&self->_updateLock);
  totalPurgeable = self->_totalPurgeable;
  os_unfair_lock_unlock(p_updateLock);
  return totalPurgeable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsDict, 0);
}

- (uint64_t)refreshPurgeableSpace
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __48__STStorageDataInterface_storageInfoDict_Remote__block_invoke_cold_1(v0);
}

@end
