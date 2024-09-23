@implementation WFServiceReachabilityObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken_0 != -1)
    dispatch_once(&sharedObserver_onceToken_0, &__block_literal_global_10);
  return (id)sharedObserver_defaultObserver_0;
}

void __47__WFServiceReachabilityObserver_sharedObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WFServiceReachabilityObserver _init]([WFServiceReachabilityObserver alloc], "_init");
  v1 = (void *)sharedObserver_defaultObserver_0;
  sharedObserver_defaultObserver_0 = (uint64_t)v0;

}

- (WFServiceReachabilityObserver)init
{

  return 0;
}

- (id)_init
{
  WFServiceReachabilityObserver *v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFServiceReachabilityObserver;
  v2 = -[WFServiceReachabilityObserver init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WeatherFoundation.reachability.observerQueue", MEMORY[0x24BDAC9C0]);
    -[WFServiceReachabilityObserver setObserverQueue:](v2, "setObserverQueue:", v3);

    v4 = (void *)objc_opt_new();
    -[WFServiceReachabilityObserver setBlockObserversForUUID:](v2, "setBlockObserversForUUID:", v4);

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFServiceReachabilityObserver setObserverObjects:](v2, "setObserverObjects:", v5);

    -[WFServiceReachabilityObserver _setupReachability](v2, "_setupReachability");
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[WFServiceReachabilityObserver removeAllObservers](self, "removeAllObservers");
  -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__WFServiceReachabilityObserver_dealloc__block_invoke;
  block[3] = &unk_24CCA06F8;
  block[4] = self;
  dispatch_barrier_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)WFServiceReachabilityObserver;
  -[WFServiceReachabilityObserver dealloc](&v4, sel_dealloc);
}

void __40__WFServiceReachabilityObserver_dealloc__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "serviceReachabilityEvaluator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), CFSTR("path.status"));

}

- (OS_dispatch_queue)callbackQueue
{
  OS_dispatch_queue *callbackQueue;
  OS_dispatch_queue **p_callbackQueue;

  p_callbackQueue = &self->_callbackQueue;
  callbackQueue = self->_callbackQueue;
  if (!callbackQueue)
  {
    objc_storeStrong((id *)p_callbackQueue, MEMORY[0x24BDAC9B8]);
    callbackQueue = *p_callbackQueue;
  }
  return callbackQueue;
}

- (int64_t)reachability
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__WFServiceReachabilityObserver_reachability__block_invoke;
  v6[3] = &unk_24CCA08D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __45__WFServiceReachabilityObserver_reachability__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (BOOL)isServiceAvailable
{
  return -[WFServiceReachabilityObserver reachability](self, "reachability") == 1;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, v4);
    -[WFServiceReachabilityObserver observerObjects](self, "observerObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__WFServiceReachabilityObserver_addObserver___block_invoke;
    block[3] = &unk_24CCA1690;
    v9 = v5;
    v7 = v5;
    objc_copyWeak(&v10, &location);
    dispatch_barrier_async(v6, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __45__WFServiceReachabilityObserver_addObserver___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "addObject:", WeakRetained);

}

- (BOOL)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, v4);
    -[WFServiceReachabilityObserver observerObjects](self, "observerObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__WFServiceReachabilityObserver_removeObserver___block_invoke;
    block[3] = &unk_24CCA18B0;
    v17 = &v19;
    v8 = v5;
    v16 = v8;
    objc_copyWeak(&v18, &location);
    dispatch_sync(v6, block);

    if (*((_BYTE *)v20 + 24))
    {
      -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __48__WFServiceReachabilityObserver_removeObserver___block_invoke_2;
      v12[3] = &unk_24CCA1690;
      v13 = v8;
      objc_copyWeak(&v14, &location);
      dispatch_barrier_async(v9, v12);

      objc_destroyWeak(&v14);
      v10 = *((_BYTE *)v20 + 24) != 0;
    }
    else
    {
      v10 = 0;
    }
    objc_destroyWeak(&v18);

    _Block_object_dispose(&v19, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __48__WFServiceReachabilityObserver_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "containsObject:", WeakRetained);

}

void __48__WFServiceReachabilityObserver_removeObserver___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "removeObject:", WeakRetained);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("path")))
  {
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "status");
    -[WFServiceReachabilityObserver _deliverReachabilityUpdate:](self, "_deliverReachabilityUpdate:", (v14 & 0xFFFFFFFFFFFFFFFDLL) == 1);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFServiceReachabilityObserver;
    -[WFServiceReachabilityObserver observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v12, v11, a6);

  }
}

- (id)addBlockObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    -[WFServiceReachabilityObserver blockObserversForUUID](self, "blockObserversForUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__WFServiceReachabilityObserver_addBlockObserver___block_invoke;
    block[3] = &unk_24CCA18D8;
    v14 = v5;
    v16 = v4;
    v8 = v6;
    v15 = v8;
    v9 = v5;
    dispatch_barrier_async(v7, block);

    v10 = v15;
    v11 = v8;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __50__WFServiceReachabilityObserver_addBlockObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

}

- (BOOL)removeBlockObserverWithHandle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  if (v4)
  {
    -[WFServiceReachabilityObserver blockObserversForUUID](self, "blockObserversForUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__WFServiceReachabilityObserver_removeBlockObserverWithHandle___block_invoke;
    block[3] = &unk_24CCA1900;
    v19 = &v20;
    v8 = v5;
    v17 = v8;
    v9 = v4;
    v18 = v9;
    dispatch_sync(v6, block);

    if (*((_BYTE *)v21 + 24))
    {
      -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __63__WFServiceReachabilityObserver_removeBlockObserverWithHandle___block_invoke_2;
      v13[3] = &unk_24CCA17B0;
      v14 = v8;
      v15 = v9;
      dispatch_barrier_async(v10, v13);

      v11 = *((_BYTE *)v21 + 24) != 0;
    }
    else
    {
      v11 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __63__WFServiceReachabilityObserver_removeBlockObserverWithHandle___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 32), *(const void **)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

uint64_t __63__WFServiceReachabilityObserver_removeBlockObserverWithHandle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)_setupReachability
{
  WFReachabilityConfigurationRequest *v3;
  WFReachabilityConfigurationRequest *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  -[WFServiceReachabilityObserver serviceReachabilityEvaluator](self, "serviceReachabilityEvaluator");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7[5])
  {
    v3 = [WFReachabilityConfigurationRequest alloc];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __51__WFServiceReachabilityObserver__setupReachability__block_invoke;
    v5[3] = &unk_24CCA1928;
    v5[4] = &v6;
    v4 = -[WFReachabilityConfigurationRequest initWithResultHandler:](v3, "initWithResultHandler:", v5);
    -[WFTask executeSynchronously](v4, "executeSynchronously");
    -[WFServiceReachabilityObserver setServiceReachabilityEvaluator:](self, "setServiceReachabilityEvaluator:", v7[5]);
    objc_msgSend((id)v7[5], "addObserver:forKeyPath:options:context:", self, CFSTR("path"), 5, 0);
    -[WFServiceReachabilityObserver _deliverReachabilityUpdate:](self, "_deliverReachabilityUpdate:", objc_msgSend((id)v7[5], "wf_isReachable"));

  }
  _Block_object_dispose(&v6, 8);

}

void __51__WFServiceReachabilityObserver__setupReachability__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_deliverReachabilityUpdate:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  int64_t v16;

  -[WFServiceReachabilityObserver blockObserversForUUID](self, "blockObserversForUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFServiceReachabilityObserver observerObjects](self, "observerObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFServiceReachabilityObserver callbackQueue](self, "callbackQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke;
  block[3] = &unk_24CCA19A0;
  v15 = v7;
  v16 = a3;
  block[4] = self;
  v13 = v6;
  v14 = v5;
  v9 = v7;
  v10 = v5;
  v11 = v6;
  dispatch_barrier_async(v8, block);

}

void __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) != *(_QWORD *)(a1 + 64))
  {
    WFLogForCategory(8uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      if (*(_QWORD *)(a1 + 64) == 1)
        v3 = CFSTR("UP");
      else
        v3 = CFSTR("DOWN");
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      _os_log_impl(&dword_21189A000, v2, OS_LOG_TYPE_INFO, "Network state changed: %@", buf, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_18;
    block[3] = &unk_24CCA19A0;
    v13 = v6;
    v8 = *(id *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v14 = v8;
    v15 = v5;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = v9;
    v10 = v5;
    v11 = v6;
    dispatch_async(v7, block);

  }
}

void __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_18(uint64_t a1)
{
  size_t v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  size_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_2;
  block[3] = &unk_24CCA1950;
  v4 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 64);
  v17 = v5;
  v18 = v6;
  dispatch_apply(v2, v4, block);
  v7 = objc_msgSend(*(id *)(a1 + 48), "count");
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_3;
  v12[3] = &unk_24CCA1978;
  v8 = *(NSObject **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v13 = v9;
  v14 = v10;
  v15 = v11;
  dispatch_apply(v7, v8, v12);

}

void __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(_QWORD *)(a1 + 40));

}

void __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceConnectivityObserver:hasUpdatedReachability:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeAllObservers
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  -[WFServiceReachabilityObserver blockObserversForUUID](self, "blockObserversForUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFServiceReachabilityObserver observerObjects](self, "observerObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFServiceReachabilityObserver observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__WFServiceReachabilityObserver_removeAllObservers__block_invoke;
  v8[3] = &unk_24CCA17B0;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_barrier_async(v5, v8);

}

uint64_t __51__WFServiceReachabilityObserver_removeAllObservers__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
}

- (void)setReachability:(int64_t)a3
{
  self->_reachability = a3;
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObserverQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)blockObserversForUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBlockObserversForUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSHashTable)observerObjects
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObserverObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (NWPathEvaluator)serviceReachabilityEvaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceReachabilityEvaluator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceReachabilityEvaluator, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observerObjects, 0);
  objc_storeStrong((id *)&self->_blockObserversForUUID, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

@end
