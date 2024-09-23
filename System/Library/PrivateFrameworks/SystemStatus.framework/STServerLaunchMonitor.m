@implementation STServerLaunchMonitor

+ (id)sharedInstance
{
  if (qword_1ED0CB3E0 != -1)
    dispatch_once(&qword_1ED0CB3E0, &__block_literal_global_2);
  return (id)_MergedGlobals_4;
}

void __39__STServerLaunchMonitor_sharedInstance__block_invoke()
{
  STServerLaunchMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(STServerLaunchMonitor);
  v1 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = (uint64_t)v0;

}

- (STServerLaunchMonitor)init
{
  STServerLaunchMonitor *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  uint64_t v7;
  OS_dispatch_queue *clientQueue;
  NSObject *v9;
  _QWORD block[4];
  STServerLaunchMonitor *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)STServerLaunchMonitor;
  v2 = -[STServerLaunchMonitor init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    v7 = BSDispatchQueueCreateSerial();
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v7;

    v2->_notifyToken = -1;
    objc_initWeak(&location, v2);
    v9 = v2->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__STServerLaunchMonitor_init__block_invoke;
    block[3] = &unk_1E91E4E18;
    v12 = v2;
    objc_copyWeak(&v13, &location);
    dispatch_sync(v9, block);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__STServerLaunchMonitor_init__block_invoke(uint64_t a1)
{
  int *v2;
  int *v3;
  NSObject *v4;
  _QWORD handler[4];
  id v6;

  v2 = *(int **)(a1 + 32);
  v3 = v2 + 2;
  if (v2)
    v2 = (int *)*((_QWORD *)v2 + 3);
  v4 = v2;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __29__STServerLaunchMonitor_init__block_invoke_2;
  handler[3] = &unk_1E91E4DF0;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  notify_register_dispatch("com.apple.systemstatus.server-launch", v3, v4, handler);

  objc_destroyWeak(&v6);
}

void __29__STServerLaunchMonitor_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)objc_msgSend(*((id *)WeakRetained + 2), "copy");
    v4 = v2[4];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __29__STServerLaunchMonitor_init__block_invoke_3;
    v6[3] = &unk_1E91E4AD8;
    v7 = v3;
    v8 = v2;
    v5 = v3;
    dispatch_async(v4, v6);

  }
}

void __29__STServerLaunchMonitor_init__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "didObserveServerLaunch:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)invalidate
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__STServerLaunchMonitor_invalidate__block_invoke;
  block[3] = &unk_1E91E4E40;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __35__STServerLaunchMonitor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 8);
  if (v3 != -1)
  {
    notify_cancel(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__STServerLaunchMonitor_addObserver___block_invoke;
  block[3] = &unk_1E91E4AD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __37__STServerLaunchMonitor_addObserver___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[2];
  return objc_msgSend(v1, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__STServerLaunchMonitor_removeObserver___block_invoke;
  block[3] = &unk_1E91E4AD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __40__STServerLaunchMonitor_removeObserver___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[2];
  return objc_msgSend(v1, "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
