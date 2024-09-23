@implementation RELocationAuthorizationStatusCache

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RELocationAuthorizationStatusCache;
  v2 = -[RESingleton _init](&v16, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[1];
    v2[1] = v3;

    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = (void *)v2[2];
    v2[2] = v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v2[3];
    v2[3] = v7;

    v9 = dispatch_queue_create("com.apple.relevanceengine.scheduleCLAuth", 0);
    v10 = (void *)v2[4];
    v2[4] = v9;

    v11 = dispatch_queue_create("com.apple.relevanceengine.queryCLAuth", 0);
    v12 = (void *)v2[5];
    v2[5] = v11;

    v13 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v14 = (void *)v2[6];
    v2[6] = v13;

  }
  return v2;
}

- (int)cachedAuthorizationStatusForBundleIdentifier:(id)a3 invalidationUpdateQueue:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _RECallbackAndPreviousStatus *v12;
  NSObject *schedulingQueue;
  id v14;
  _RECallbackAndPreviousStatus *v15;
  _QWORD block[5];
  _RECallbackAndPreviousStatus *v18;
  id v19;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = -[RELocationAuthorizationStatusCache _cachedStatusForBundleIdentifier:](self, "_cachedStatusForBundleIdentifier:", v8);
  v12 = objc_alloc_init(_RECallbackAndPreviousStatus);
  -[_RECallbackAndPreviousStatus setStatus:](v12, "setStatus:", v11);
  -[_RECallbackAndPreviousStatus setInvalidationCallback:](v12, "setInvalidationCallback:", v9);

  -[_RECallbackAndPreviousStatus setQueue:](v12, "setQueue:", v10);
  schedulingQueue = self->_schedulingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__RELocationAuthorizationStatusCache_cachedAuthorizationStatusForBundleIdentifier_invalidationUpdateQueue_withCallback___block_invoke;
  block[3] = &unk_24CF8C580;
  block[4] = self;
  v18 = v12;
  v19 = v8;
  v14 = v8;
  v15 = v12;
  dispatch_async(schedulingQueue, block);

  return v11;
}

uint64_t __120__RELocationAuthorizationStatusCache_cachedAuthorizationStatusForBundleIdentifier_invalidationUpdateQueue_withCallback___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_s_queue_addCallbackInfo:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_s_queue_scheduleUpdatedStatusForBundleIdentifier:", *(_QWORD *)(a1 + 48));
}

- (int)_cachedStatusForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[NSLock lock](self->_bundleToStatusCacheLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleToStatusCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "intValue");
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleToStatusCache, "setObject:forKeyedSubscript:", &unk_24CFC1348, v4);
    v7 = 0;
  }
  -[NSLock unlock](self->_bundleToStatusCacheLock, "unlock");

  return v7;
}

- (void)_s_queue_addCallbackInfo:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleToCallbackBlocks, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleToCallbackBlocks, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (void)_s_queue_scheduleUpdatedStatusForBundleIdentifier:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *queryQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_bundlesAwaitingQuery, "containsObject:", v4) & 1) == 0)
  {
    v5 = dispatch_time(0, 1000000000);
    queryQueue = self->_queryQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __88__RELocationAuthorizationStatusCache__s_queue_scheduleUpdatedStatusForBundleIdentifier___block_invoke;
    v7[3] = &unk_24CF8AB18;
    v7[4] = self;
    v8 = v4;
    dispatch_after(v5, queryQueue, v7);

  }
}

uint64_t __88__RELocationAuthorizationStatusCache__s_queue_scheduleUpdatedStatusForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_queue_queryStatusFromCLForBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_q_queue_queryStatusFromCLForBundleIdentifier:(id)a3
{
  id v4;
  int v5;
  NSObject *schedulingQueue;
  id v7;
  _QWORD block[5];
  id v9;
  int v10;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x24BDBFA88], "authorizationStatusForBundleIdentifier:", v4);
  schedulingQueue = self->_schedulingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__RELocationAuthorizationStatusCache__q_queue_queryStatusFromCLForBundleIdentifier___block_invoke;
  block[3] = &unk_24CF8E848;
  v10 = v5;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(schedulingQueue, block);

}

uint64_t __84__RELocationAuthorizationStatusCache__q_queue_queryStatusFromCLForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_s_queue_updateCacheFromCLWithStatus:forBundleIdentifier:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_s_queue_updateCacheFromCLWithStatus:(int)a3 forBundleIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  RELocationAuthorizationStatusCache *v16;
  void *v17;
  _QWORD block[5];
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NSLock lock](self->_bundleToStatusCacheLock, "lock");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleToStatusCache, "setObject:forKeyedSubscript:", v7, v6);

  -[NSLock unlock](self->_bundleToStatusCacheLock, "unlock");
  v16 = self;
  v17 = v6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleToCallbackBlocks, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v14, "status") != (_DWORD)v4)
        {
          objc_msgSend(v14, "queue");
          v15 = objc_claimAutoreleasedReturnValue();
          block[0] = v12;
          block[1] = 3221225472;
          block[2] = __95__RELocationAuthorizationStatusCache__s_queue_updateCacheFromCLWithStatus_forBundleIdentifier___block_invoke;
          block[3] = &unk_24CF8E870;
          block[4] = v14;
          v19 = v4;
          dispatch_async(v15, block);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  -[NSMutableDictionary removeObjectForKey:](v16->_bundleToCallbackBlocks, "removeObjectForKey:", v17);
  -[NSMutableSet removeObject:](v16->_bundlesAwaitingQuery, "removeObject:", v17);

}

void __95__RELocationAuthorizationStatusCache__s_queue_updateCacheFromCLWithStatus_forBundleIdentifier___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "invalidationCallback");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(unsigned int *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleToStatusCacheLock, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_schedulingQueue, 0);
  objc_storeStrong((id *)&self->_bundlesAwaitingQuery, 0);
  objc_storeStrong((id *)&self->_bundleToCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_bundleToStatusCache, 0);
}

@end
