@implementation SBPocketStateMonitor

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBPocketStateMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_49 != -1)
    dispatch_once(&sharedInstance_onceToken_49, block);
  return (id)sharedInstance___result_3;
}

void __38__SBPocketStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v4 = objc_alloc_init(MEMORY[0x1E0CA56A8]);
  v2 = objc_msgSend(v1, "initWithCMPocketStateManager:calloutQueue:", v4, MEMORY[0x1E0C80D38]);
  v3 = (void *)sharedInstance___result_3;
  sharedInstance___result_3 = v2;

}

- (SBPocketStateMonitor)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init not supported -- use initWithCMPocketStateManager:calloutQueue:"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SBPocketStateMonitor)initWithCMPocketStateManager:(id)a3 calloutQueue:(id)a4
{
  id v7;
  id v8;
  SBPocketStateMonitor *v9;
  SBPocketStateMonitor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBPocketStateMonitor;
  v9 = -[SBPocketStateMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_pocketState = 0;
    objc_storeStrong((id *)&v9->_calloutQueue, a4);
    if (objc_msgSend((id)objc_opt_class(), "isPocketStateAvailable"))
    {
      objc_storeStrong((id *)&v10->_pocketStateManager, a3);
      -[CMPocketStateManager setDelegate:](v10->_pocketStateManager, "setDelegate:", v10);
    }
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[CMPocketStateManager setDelegate:](self->_pocketStateManager, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBPocketStateMonitor;
  -[SBPocketStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  NSObject *calloutQueue;
  _QWORD v5[6];

  calloutQueue = self->_calloutQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SBPocketStateMonitor_pocketStateManager_didUpdateState___block_invoke;
  v5[3] = &unk_1E8E9DE88;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(calloutQueue, v5);
}

void __58__SBPocketStateMonitor_pocketStateManager_didUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v2 - 1) >= 4)
    v2 = 0;
  v3 = *(_QWORD *)(v1 + 16);
  if (v3 != v2)
  {
    *(_QWORD *)(v1 + 16) = v2;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "pocketStateMonitor:pocketStateDidChangeFrom:to:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (int64_t)pocketState
{
  return self->_pocketState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
}

@end
