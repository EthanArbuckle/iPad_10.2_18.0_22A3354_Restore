@implementation RETrainingSimulationServer

+ (id)sharedServer
{
  id WeakRetained;

  if (_fetchedInternalBuildOnceToken != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken, &__block_literal_global_7);
  if (_isInternalDevice)
  {
    os_unfair_lock_lock(&sharedServer_ServerLock);
    WeakRetained = objc_loadWeakRetained(&sharedServer_SharedServer);
    if (!WeakRetained)
    {
      WeakRetained = -[RETrainingSimulationServer _init]([RETrainingSimulationServer alloc], "_init");
      objc_storeWeak(&sharedServer_SharedServer, WeakRetained);
    }
    os_unfair_lock_unlock(&sharedServer_ServerLock);
  }
  else
  {
    WeakRetained = 0;
  }
  return WeakRetained;
}

uint64_t __42__RETrainingSimulationServer_sharedServer__block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice = result;
  return result;
}

- (id)_init
{
  RETrainingSimulationServer *v2;
  uint64_t v3;
  NSMutableSet *connections;
  REObserverStore *v5;
  REObserverStore *observers;
  uint64_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  NSXPCListener *listener;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RETrainingSimulationServer;
  v2 = -[RETrainingSimulationServer init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v3;

    v5 = objc_alloc_init(REObserverStore);
    observers = v2->_observers;
    v2->_observers = v5;

    RECreateSharedQueue(CFSTR("TrainingSimulationClient"));
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    RETrainingSimulationMachServiceForProcessName(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v11);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v12;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");

  }
  return v2;
}

- (void)dealloc
{
  NSXPCListener *listener;
  objc_super v4;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)RETrainingSimulationServer;
  -[RETrainingSimulationServer dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  -[REObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[REObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)availableRelevanceEnginesDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_9, (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "availableRelevanceEnginesDidChange");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  RELogForDomain(10);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke_2_cold_1((uint64_t)v2, v3);

}

- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_group_t v11;
  REObserverStore *observers;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *queue;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  dispatch_group_t v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_group_create();
  observers = self->_observers;
  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke;
  v21[3] = &unk_24CF8B188;
  v22 = v11;
  v23 = v8;
  v24 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v11;
  -[REObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v21);
  queue = self->_queue;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke_3;
  v19[3] = &unk_24CF8B1B0;
  v20 = v10;
  v18 = v10;
  dispatch_group_notify(v16, queue, v19);

}

void __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke_2;
  v7[3] = &unk_24CF8B160;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "relevanceEngine:createElementFromDescription:completion:", v6, v5, v7);

}

void __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  dispatch_group_t v14;
  REObserverStore *observers;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *queue;
  id v22;
  _QWORD block[4];
  id v24;
  _QWORD v25[4];
  dispatch_group_t v26;
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = dispatch_group_create();
  observers = self->_observers;
  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke;
  v25[3] = &unk_24CF8B1D8;
  v26 = v14;
  v27 = v10;
  v28 = v11;
  v29 = v12;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  v20 = v14;
  -[REObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v25);
  queue = self->_queue;
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke_3;
  block[3] = &unk_24CF8B1B0;
  v24 = v13;
  v22 = v13;
  dispatch_group_notify(v20, queue, block);

}

void __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke_2;
  v8[3] = &unk_24CF8B160;
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v4, "relevanceEngine:performCommand:withOptions:completion:", v7, v5, v6, v8);

}

void __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_safelyEnumerateObserversWithBlock:(id)a3 observerAccessBlock:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_group_t v11;
  REObserverStore *observers;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  int v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_group_create();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2810000000;
  v21[3] = &unk_2133F94DA;
  v22 = 0;
  observers = self->_observers;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__RETrainingSimulationServer__safelyEnumerateObserversWithBlock_observerAccessBlock_completion___block_invoke;
  v16[3] = &unk_24CF8B228;
  v13 = v11;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v20 = v21;
  v15 = v8;
  v19 = v15;
  -[REObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v16);
  dispatch_group_notify(v13, (dispatch_queue_t)self->_queue, v10);

  _Block_object_dispose(v21, 8);
}

void __96__RETrainingSimulationServer__safelyEnumerateObserversWithBlock_observerAccessBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __96__RETrainingSimulationServer__safelyEnumerateObserversWithBlock_observerAccessBlock_completion___block_invoke_2;
  v8[3] = &unk_24CF8B200;
  v7 = *(_OWORD *)(a1 + 48);
  v6 = (id)v7;
  v10 = v7;
  v9 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, id, _QWORD *))(v5 + 16))(v5, v4, v8);

}

void __96__RETrainingSimulationServer__safelyEnumerateObserversWithBlock_observerAccessBlock_completion___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)availableRelevanceEngines:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke;
  v12[3] = &unk_24CF8B250;
  v13 = v5;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_4;
  v9[3] = &unk_24CF8B2E0;
  v10 = v13;
  v11 = v4;
  v7 = v13;
  v8 = v4;
  -[RETrainingSimulationServer _safelyEnumerateObserversWithBlock:observerAccessBlock:completion:](self, "_safelyEnumerateObserversWithBlock:observerAccessBlock:completion:", v12, &__block_literal_global_14, v9);

}

uint64_t __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

void __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_3;
  v6[3] = &unk_24CF8B2B8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "availableRelevanceEngines:", v6);

}

uint64_t __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  v18 = 0;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke;
  v16[3] = &unk_24CF8B308;
  v16[4] = v17;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_2;
  v14[3] = &unk_24CF8B330;
  v9 = v6;
  v15 = v9;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_4;
  v11[3] = &unk_24CF8B358;
  v10 = v7;
  v12 = v10;
  v13 = v17;
  -[RETrainingSimulationServer _safelyEnumerateObserversWithBlock:observerAccessBlock:completion:](self, "_safelyEnumerateObserversWithBlock:observerAccessBlock:completion:", v16, v14, v11);

  _Block_object_dispose(v17, 8);
}

void __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id v8;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
  {
    v8 = v4;
    objc_storeStrong(v6, a2);
    v4 = v8;
  }

}

void __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_3;
  v8[3] = &unk_24CF8B2B8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "fetchAllElementIdentifiersInRelevanceEngine:completion:", v6, v8);

}

uint64_t __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

- (void)fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  v18 = 0;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke;
  v16[3] = &unk_24CF8B308;
  v16[4] = v17;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_2;
  v14[3] = &unk_24CF8B330;
  v9 = v6;
  v15 = v9;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_4;
  v11[3] = &unk_24CF8B358;
  v10 = v7;
  v12 = v10;
  v13 = v17;
  -[RETrainingSimulationServer _safelyEnumerateObserversWithBlock:observerAccessBlock:completion:](self, "_safelyEnumerateObserversWithBlock:observerAccessBlock:completion:", v16, v14, v11);

  _Block_object_dispose(v17, 8);
}

void __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id v8;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
  {
    v8 = v4;
    objc_storeStrong(v6, a2);
    v4 = v8;
  }

}

void __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_3;
  v8[3] = &unk_24CF8B2B8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "fetchAllElementsInRelevanceEngine:completion:", v6, v8);

}

uint64_t __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

- (void)gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[6];
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__1;
  v18[4] = __Block_byref_object_dispose__1;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke;
  v17[3] = &unk_24CF8B380;
  v17[4] = v20;
  v17[5] = v18;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_2;
  v15[3] = &unk_24CF8B330;
  v9 = v6;
  v16 = v9;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_4;
  v11[3] = &unk_24CF8B3D0;
  v10 = v7;
  v12 = v10;
  v13 = v20;
  v14 = v18;
  -[RETrainingSimulationServer _safelyEnumerateObserversWithBlock:observerAccessBlock:completion:](self, "_safelyEnumerateObserversWithBlock:observerAccessBlock:completion:", v17, v15, v11);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

void __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  id v9;
  void *v10;

  v4 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v10 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;
LABEL_6:

      v4 = v10;
      goto LABEL_7;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = v10;
      v6 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_3;
  v8[3] = &unk_24CF8B3A8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "gatherDiagnosticLogsForRelevanceEngine:completion:", v6, v8);

}

uint64_t __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (!a2)
    a2 = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

uint64_t __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[3];
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke;
  v21[3] = &unk_24CF8B308;
  v21[4] = v22;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_2;
  v18[3] = &unk_24CF8B420;
  v12 = v8;
  v19 = v12;
  v13 = v9;
  v20 = v13;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_4;
  v15[3] = &unk_24CF8B358;
  v14 = v10;
  v16 = v14;
  v17 = v22;
  -[RETrainingSimulationServer _safelyEnumerateObserversWithBlock:observerAccessBlock:completion:](self, "_safelyEnumerateObserversWithBlock:observerAccessBlock:completion:", v21, v18, v15);

  _Block_object_dispose(v22, 8);
}

uint64_t __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(a2, "BOOLValue");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

void __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_3;
  v9[3] = &unk_24CF8B3F8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(a2, "relevanceEngine:runActionOfElementWithDescription1:completion:", v7, v6, v9);

}

void __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
}

- (void)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__1;
  v22[4] = __Block_byref_object_dispose__1;
  v23 = 0;
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke;
  v21[3] = &unk_24CF8B308;
  v21[4] = v22;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke_2;
  v18[3] = &unk_24CF8B420;
  v12 = v8;
  v19 = v12;
  v13 = v9;
  v20 = v13;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke_3;
  v15[3] = &unk_24CF8B358;
  v14 = v10;
  v16 = v14;
  v17 = v22;
  -[RETrainingSimulationServer _safelyEnumerateObserversWithBlock:observerAccessBlock:completion:](self, "_safelyEnumerateObserversWithBlock:observerAccessBlock:completion:", v21, v18, v15);

  _Block_object_dispose(v22, 8);
}

void __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id v8;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
  {
    v8 = v4;
    objc_storeStrong(v6, a2);
    v4 = v8;
  }

}

uint64_t __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "relevanceEngine:encodedObjectAtPath:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

uint64_t __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *queue;
  id v12;
  _QWORD v14[5];
  id v15;
  id location;
  _QWORD block[5];
  id v18;

  v6 = a3;
  v7 = a4;
  RETrainingSimulationClientInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  RETrainingSimulationServerInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", self);
  v10 = MEMORY[0x24BDAC760];
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_24CF8AB18;
  block[4] = self;
  v12 = v7;
  v18 = v12;
  dispatch_async(queue, block);
  objc_initWeak(&location, v12);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v14[3] = &unk_24CF8B470;
  v14[4] = self;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v12, "setInvalidationHandler:", v14);
  objc_msgSend(v12, "resume");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

uint64_t __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

void __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke_3;
  v3[3] = &unk_24CF8B448;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", WeakRetained);
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

void __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Unable to access remote object: %@", (uint8_t *)&v2, 0xCu);
}

@end
