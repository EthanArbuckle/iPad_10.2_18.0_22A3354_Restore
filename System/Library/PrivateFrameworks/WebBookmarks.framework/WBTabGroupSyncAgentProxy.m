@implementation WBTabGroupSyncAgentProxy

+ (WBTabGroupSyncAgentProxy)sharedProxy
{
  if (sharedProxy_onceToken != -1)
    dispatch_once(&sharedProxy_onceToken, &__block_literal_global_2);
  return (WBTabGroupSyncAgentProxy *)(id)sharedProxy_sharedProxy;
}

void __39__WBTabGroupSyncAgentProxy_sharedProxy__block_invoke()
{
  WBTabGroupSyncAgentProxy *v0;
  void *v1;

  v0 = objc_alloc_init(WBTabGroupSyncAgentProxy);
  v1 = (void *)sharedProxy_sharedProxy;
  sharedProxy_sharedProxy = (uint64_t)v0;

}

- (WBTabGroupSyncAgentProxy)init
{
  WBTabGroupSyncAgentProxy *v2;
  WBTabGroupSyncAgentProxy *v3;
  uint64_t v4;
  NSHashTable *syncObservers;
  NSObject *v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *syncObserverQueue;
  void *v10;
  WBTabGroupSyncAgentProxy *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBTabGroupSyncAgentProxy;
  v2 = -[WBTabGroupSyncAgentProxy init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    syncObservers = v3->_syncObservers;
    v3->_syncObservers = (NSHashTable *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.WebBookmarks.WBTabGroupSyncAgentProxy.%@.%p._syncObserverQueue"), objc_opt_class(), v3);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), v6);
    syncObserverQueue = v3->_syncObserverQueue;
    v3->_syncObserverQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel__syncAgentDidLaunch_, *MEMORY[0x24BE82FC0], 0);

    -[WBTabGroupSyncAgentProxy _setUpConnectionIfNeeded](v3, "_setUpConnectionIfNeeded");
    v11 = v3;

  }
  return v3;
}

void __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[2];
  _QWORD *(*v13)(uint64_t);
  void *v14;
  os_unfair_lock_s *v15;
  id v16;

  v16 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "safari_isEmpty");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v16);
  objc_msgSend(v16, "safari_setDeallocationSentinelForObserver:", *(_QWORD *)(a1 + 32));
  if ((v4 & 1) != 0)
  {
    v5 = *(os_unfair_lock_s **)(a1 + 32);
    v6 = v5 + 2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v13 = __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke_2;
    v14 = &unk_24CB315A0;
    v15 = v5;
    v7 = v12;
    os_unfair_lock_lock(v6);
    v13((uint64_t)v7);

    os_unfair_lock_unlock(v6);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 8));
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSyncObserver:", *(_QWORD *)(a1 + 32));

    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke_cold_1(v11);
    }
  }
  WBSReleaseOnMainQueueImpl();

}

- (void)scheduleSyncIfNeeded
{
  id v2;

  -[WBTabGroupSyncAgentProxy _remoteObjectProxy](self, "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleSyncIfNeeded");

}

- (id)_remoteObjectProxy
{
  -[WBTabGroupSyncAgentProxy _setUpConnectionIfNeeded](self, "_setUpConnectionIfNeeded");
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (void)_setUpConnectionIfNeeded
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_connection)
  {
    -[WBTabGroupSyncAgentProxy _setUpConnection](self, "_setUpConnection");
    -[WBTabGroupSyncAgentProxy _setUpSyncObserverIfNeeded](self, "_setUpSyncObserverIfNeeded");
  }
  os_unfair_lock_unlock(p_lock);
}

_QWORD *__44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke_2(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[2])
    return (_QWORD *)objc_msgSend(result, "_setUpConnection");
  return result;
}

- (void)_setUpSyncObserverIfNeeded
{
  NSObject *syncObserverQueue;
  _QWORD block[5];

  syncObserverQueue = self->_syncObserverQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke;
  block[3] = &unk_24CB315A0;
  block[4] = self;
  dispatch_async(syncObserverQueue, block);
}

- (void)_setUpConnection
{
  id v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = objc_alloc(MEMORY[0x24BDD1988]);
  v4 = (NSXPCConnection *)objc_msgSend(v3, "initWithMachServiceName:options:", *MEMORY[0x24BE82FC8], 0);
  connection = self->_connection;
  self->_connection = v4;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A9A9A0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WBSetupTabGroupSyncAgentProtocolInterface(v6);
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke;
  v17[3] = &unk_24CB318D0;
  objc_copyWeak(&v18, &location);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_2;
  v15[3] = &unk_24CB318F8;
  v8 = (id)MEMORY[0x212BD4C84](v17);
  v16 = v8;
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v15);
  v10 = v7;
  v11 = 3221225472;
  v12 = __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_68;
  v13 = &unk_24CB318F8;
  v9 = v8;
  v14 = v9;
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &v10);
  -[NSXPCConnection resume](self->_connection, "resume", v10, v11, v12, v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)addSyncObserver:(id)a3
{
  NSObject *syncObserverQueue;
  id v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__0;
  v7[4] = __Block_byref_object_dispose__0;
  v8 = a3;
  syncObserverQueue = self->_syncObserverQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke;
  v6[3] = &unk_24CB31610;
  v6[4] = self;
  v6[5] = v7;
  v5 = v8;
  dispatch_async(syncObserverQueue, v6);
  _Block_object_dispose(v7, 8);

}

void __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  _QWORD *v4;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  os_unfair_lock_s *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__0;
    v14 = __Block_byref_object_dispose__0;
    v15 = 0;
    v2 = *(os_unfair_lock_s **)(a1 + 32);
    v3 = v2 + 2;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v6 = __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke_73;
    v7 = &unk_24CB319A0;
    v8 = v2;
    v9 = &v10;
    v4 = v5;
    os_unfair_lock_lock(v3);
    v6((uint64_t)v4);

    os_unfair_lock_unlock(v3);
    objc_msgSend((id)v11[5], "addSyncObserver:", *(_QWORD *)(a1 + 32));
    _Block_object_dispose(&v10, 8);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBTabGroupSyncAgentProxy;
  -[WBTabGroupSyncAgentProxy dealloc](&v3, sel_dealloc);
}

void __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  void *v3;
  os_unfair_lock_s *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 2;
    v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    v3 = *(void **)&v4[4]._os_unfair_lock_opaque;
    *(_QWORD *)&v4[4]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2);
    -[os_unfair_lock_s _setUpSyncObserverIfNeeded](v4, "_setUpSyncObserverIfNeeded");
    WeakRetained = v4;
  }

}

uint64_t __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_68(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_68_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)emptyCompletionHandler
{
  return &__block_literal_global_70;
}

- (id)emptyChangeSetCompletionHandler
{
  return &__block_literal_global_72;
}

- (BOOL)_shouldAttemptToReconnect
{
  NSDate *firstReconnectionAttemptDate;
  double v4;
  NSDate *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  firstReconnectionAttemptDate = self->_firstReconnectionAttemptDate;
  if (!firstReconnectionAttemptDate)
    return 1;
  -[NSDate timeIntervalSinceNow](firstReconnectionAttemptDate, "timeIntervalSinceNow");
  if (v4 < -20.0)
  {
    v5 = self->_firstReconnectionAttemptDate;
    self->_firstReconnectionAttemptDate = 0;

    return 1;
  }
  return self->_numberOfReconnectionAttempts < 5;
}

void __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke_73(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 32;
  v2 = *(id **)(a1 + 32);
  if (v2[2])
  {
    objc_msgSend(v2[2], "remoteObjectProxy");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  }
  else
  {
    v9 = objc_msgSend(v2, "_shouldAttemptToReconnect");
    v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Will attempt to add sync observer again after connection ended", (uint8_t *)&v20, 2u);
      }
      if (!*(_QWORD *)(*(_QWORD *)v3 + 40))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(*(_QWORD *)v3 + 40);
        *(_QWORD *)(*(_QWORD *)v3 + 40) = v12;

        *(_QWORD *)(*(_QWORD *)v3 + 48) = 0;
      }
      v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(*(_QWORD *)v3 + 40);
        v16 = *(_QWORD *)(*(_QWORD *)v3 + 48);
        v20 = 134218242;
        v21 = v16;
        v22 = 2114;
        v23 = v15;
        _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "Will attempt to reconnect after %ld retries since %{public}@", (uint8_t *)&v20, 0x16u);
      }
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      objc_msgSend(*(id *)(a1 + 32), "_setUpConnection");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxy");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke_73_cold_1(v3, v11);
    }
  }
}

- (void)_enumerateSyncObserversUsingBlock:(id)a3
{
  id v4;
  NSObject *syncObserverQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  syncObserverQueue = self->_syncObserverQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__WBTabGroupSyncAgentProxy__enumerateSyncObserversUsingBlock___block_invoke;
  v7[3] = &unk_24CB319F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(syncObserverQueue, v7);

}

void __62__WBTabGroupSyncAgentProxy__enumerateSyncObserversUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v2 = (void *)MEMORY[0x212BD4AC8]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setRepresentation");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v11[5];
  v11[5] = v3;

  v5 = objc_msgSend((id)v11[5], "count");
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeSyncObserver:", *(_QWORD *)(a1 + 32));

  }
  objc_autoreleasePoolPop(v2);
  if (v5)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__WBTabGroupSyncAgentProxy__enumerateSyncObserversUsingBlock___block_invoke_2;
    v7[3] = &unk_24CB319C8;
    v9 = &v10;
    v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
  _Block_object_dispose(&v10, 8);

}

void __62__WBTabGroupSyncAgentProxy__enumerateSyncObserversUsingBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (void)removeSyncObserver:(id)a3
{
  id v4;
  NSObject *syncObserverQueue;
  id v6;
  _QWORD block[4];
  id v8;
  WBTabGroupSyncAgentProxy *v9;

  v4 = a3;
  syncObserverQueue = self->_syncObserverQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__WBTabGroupSyncAgentProxy_removeSyncObserver___block_invoke;
  block[3] = &unk_24CB31830;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(syncObserverQueue, block);

}

void __47__WBTabGroupSyncAgentProxy_removeSyncObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "safari_removeDeallocationSentinelForObserver:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "safari_isEmpty"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(v2 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "_remoteObjectProxy");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeSyncObserver:", *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)userDidAcceptTabGroupShareWithMetadata:(id)a3 inProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WBTabGroupSyncAgentProxy _remoteObjectProxy](self, "_remoteObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userDidAcceptTabGroupShareWithMetadata:inProfileWithIdentifier:completionHandler:", v10, v9, v8);

}

- (void)beginSharingTabGroupWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *connection;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WBTabGroupSyncAgentProxy _setUpConnectionIfNeeded](self, "_setUpConnectionIfNeeded");
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__WBTabGroupSyncAgentProxy_beginSharingTabGroupWithUUID_completionHandler___block_invoke;
  v11[3] = &unk_24CB31A18;
  v12 = v6;
  v9 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginSharingTabGroupWithUUID:completionHandler:", v7, v9);

}

uint64_t __75__WBTabGroupSyncAgentProxy_beginSharingTabGroupWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)movePresenceForParticipantToTabWithUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBTabGroupSyncAgentProxy _remoteObjectProxy](self, "_remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "movePresenceForParticipantToTabWithUUID:", v4);

}

- (void)acceptShareForURL:(id)a3 invitationTokenData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WBTabGroupSyncAgentProxy _remoteObjectProxy](self, "_remoteObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "acceptShareForURL:invitationTokenData:completionHandler:", v10, v9, v8);

}

- (void)sentinelDidDeallocateWithContext:(id)a3
{
  NSObject *syncObserverQueue;
  _QWORD block[5];

  syncObserverQueue = self->_syncObserverQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__WBTabGroupSyncAgentProxy_sentinelDidDeallocateWithContext___block_invoke;
  block[3] = &unk_24CB315A0;
  block[4] = self;
  dispatch_async(syncObserverQueue, block);
}

void __61__WBTabGroupSyncAgentProxy_sentinelDidDeallocateWithContext___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "safari_isEmpty"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeSyncObserver:", *(_QWORD *)(a1 + 32));

  }
}

- (void)shareDidUpdateForTabGroupWithUUID:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__WBTabGroupSyncAgentProxy_shareDidUpdateForTabGroupWithUUID___block_invoke;
  v7[3] = &unk_24CB31A40;
  v8 = v5;
  v9 = a2;
  v6 = v5;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v7);

}

void __62__WBTabGroupSyncAgentProxy_shareDidUpdateForTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "shareDidUpdateForTabGroupWithUUID:", *(_QWORD *)(a1 + 32));

}

- (void)participants:(id)a3 didJoinSharedTabGroupWithUUID:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__WBTabGroupSyncAgentProxy_participants_didJoinSharedTabGroupWithUUID___block_invoke;
  v11[3] = &unk_24CB31A68;
  v13 = v8;
  v14 = a2;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v11);

}

void __71__WBTabGroupSyncAgentProxy_participants_didJoinSharedTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "participants:didJoinSharedTabGroupWithUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)participants:(id)a3 didLeaveSharedTabGroupWithUUID:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__WBTabGroupSyncAgentProxy_participants_didLeaveSharedTabGroupWithUUID___block_invoke;
  v11[3] = &unk_24CB31A68;
  v13 = v8;
  v14 = a2;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v11);

}

void __72__WBTabGroupSyncAgentProxy_participants_didLeaveSharedTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "participants:didLeaveSharedTabGroupWithUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)activeParticipantsDidUpdateInTabGroupWithUUID:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__WBTabGroupSyncAgentProxy_activeParticipantsDidUpdateInTabGroupWithUUID___block_invoke;
  v7[3] = &unk_24CB31A40;
  v8 = v5;
  v9 = a2;
  v6 = v5;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v7);

}

void __74__WBTabGroupSyncAgentProxy_activeParticipantsDidUpdateInTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "activeParticipantsDidUpdateInTabGroupWithUUID:", *(_QWORD *)(a1 + 32));

}

- (void)activeParticipantsDidUpdateInTabWithUUID:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__WBTabGroupSyncAgentProxy_activeParticipantsDidUpdateInTabWithUUID___block_invoke;
  v7[3] = &unk_24CB31A40;
  v8 = v5;
  v9 = a2;
  v6 = v5;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v7);

}

void __69__WBTabGroupSyncAgentProxy_activeParticipantsDidUpdateInTabWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "activeParticipantsDidUpdateInTabWithUUID:", *(_QWORD *)(a1 + 32));

}

- (void)didAddTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __103__WBTabGroupSyncAgentProxy_didAddTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v19[3] = &unk_24CB31A90;
  v23 = v14;
  v24 = a2;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v19);

}

void __103__WBTabGroupSyncAgentProxy_didAddTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didAddTabWithUUID:title:inSharedTabGroupWithUUID:byParticipantWithRecordID:", a1[4], a1[5], a1[6], a1[7]);

}

- (void)didNavigateInTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __110__WBTabGroupSyncAgentProxy_didNavigateInTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v19[3] = &unk_24CB31A90;
  v23 = v14;
  v24 = a2;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v19);

}

void __110__WBTabGroupSyncAgentProxy_didNavigateInTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didNavigateInTabWithUUID:title:inSharedTabGroupWithUUID:byParticipantWithRecordID:", a1[4], a1[5], a1[6], a1[7]);

}

- (void)didRemoveTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __106__WBTabGroupSyncAgentProxy_didRemoveTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v19[3] = &unk_24CB31A90;
  v23 = v14;
  v24 = a2;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v19);

}

void __106__WBTabGroupSyncAgentProxy_didRemoveTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didRemoveTabWithUUID:title:inSharedTabGroupWithUUID:byParticipantWithRecordID:", a1[4], a1[5], a1[6], a1[7]);

}

- (void)didChangeScopedFavoritesInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __103__WBTabGroupSyncAgentProxy_didChangeScopedFavoritesInSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v11[3] = &unk_24CB31A68;
  v13 = v8;
  v14 = a2;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v11);

}

void __103__WBTabGroupSyncAgentProxy_didChangeScopedFavoritesInSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didChangeScopedFavoritesInSharedTabGroupWithUUID:byParticipantWithRecordID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didChangeBackgroundImageInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __103__WBTabGroupSyncAgentProxy_didChangeBackgroundImageInSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v11[3] = &unk_24CB31A68;
  v13 = v8;
  v14 = a2;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v11);

}

void __103__WBTabGroupSyncAgentProxy_didChangeBackgroundImageInSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didChangeBackgroundImageInSharedTabGroupWithUUID:byParticipantWithRecordID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didFetchRecentlyAcceptedSharedTabGroupWithUUID:(id)a3 acceptedShareDate:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __93__WBTabGroupSyncAgentProxy_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke;
  v11[3] = &unk_24CB31A68;
  v13 = v8;
  v14 = a2;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  -[WBTabGroupSyncAgentProxy _enumerateSyncObserversUsingBlock:](self, "_enumerateSyncObserversUsingBlock:", v11);

}

void __93__WBTabGroupSyncAgentProxy_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didFetchRecentlyAcceptedSharedTabGroupWithUUID:acceptedShareDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstReconnectionAttemptDate, 0);
  objc_storeStrong((id *)&self->_syncObservers, 0);
  objc_storeStrong((id *)&self->_syncObserverQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Connection to TabGroups sync agent was interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_68_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Connection to TabGroups sync agent was invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke_73_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_fault_impl(&dword_211022000, a2, OS_LOG_TYPE_FAULT, "Failed to reconnect too many times to sync agent since %{public}@, stopping.", (uint8_t *)&v3, 0xCu);
}

void __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_211022000, log, OS_LOG_TYPE_FAULT, "Unable to establish connection to sync agent, giving up.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

@end
