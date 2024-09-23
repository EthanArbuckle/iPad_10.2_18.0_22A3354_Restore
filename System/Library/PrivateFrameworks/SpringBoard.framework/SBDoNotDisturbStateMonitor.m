@implementation SBDoNotDisturbStateMonitor

+ (SBDoNotDisturbStateMonitor)sharedInstance
{
  if (sharedInstance_onceToken_52 != -1)
    dispatch_once(&sharedInstance_onceToken_52, &__block_literal_global_348);
  return (SBDoNotDisturbStateMonitor *)(id)sharedInstance_monitor_0;
}

void __44__SBDoNotDisturbStateMonitor_sharedInstance__block_invoke()
{
  SBDoNotDisturbStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(SBDoNotDisturbStateMonitor);
  v1 = (void *)sharedInstance_monitor_0;
  sharedInstance_monitor_0 = (uint64_t)v0;

}

- (SBDoNotDisturbStateMonitor)init
{
  SBDoNotDisturbStateMonitor *v2;
  SBDoNotDisturbStateMonitor *v3;
  uint64_t v4;
  NSHashTable *lock_observers;
  uint64_t v6;
  DNDStateService *stateService;
  DNDStateService *v8;
  _QWORD v10[4];
  SBDoNotDisturbStateMonitor *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBDoNotDisturbStateMonitor;
  v2 = -[SBDoNotDisturbStateMonitor init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v4;

    objc_msgSend(MEMORY[0x1E0D1D758], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.dndstatemonitor"));
    v6 = objc_claimAutoreleasedReturnValue();
    stateService = v3->_stateService;
    v3->_stateService = (DNDStateService *)v6;

    -[DNDStateService addStateUpdateListener:withCompletionHandler:](v3->_stateService, "addStateUpdateListener:withCompletionHandler:", v3, 0);
    v8 = v3->_stateService;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__SBDoNotDisturbStateMonitor_init__block_invoke;
    v10[3] = &unk_1E8EBCE00;
    v11 = v3;
    -[DNDStateService queryCurrentStateWithCompletionHandler:](v8, "queryCurrentStateWithCompletionHandler:", v10);

  }
  return v3;
}

uint64_t __34__SBDoNotDisturbStateMonitor_init__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_noteNewDNDState:", a2);
  return result;
}

- (DNDState)state
{
  os_unfair_lock_s *p_lock;
  DNDState *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;

  objc_msgSend(a4, "state", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDoNotDisturbStateMonitor _noteNewDNDState:](self, "_noteNewDNDState:", v5);

}

- (void)_noteNewDNDState:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  SBDoNotDisturbStateMonitor *v10;
  id v11;

  v4 = (void *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_state, v4);
  v5 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
  os_unfair_lock_unlock(&self->_lock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBDoNotDisturbStateMonitor__noteNewDNDState___block_invoke;
  block[3] = &unk_1E8E9E270;
  v9 = v5;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __47__SBDoNotDisturbStateMonitor__noteNewDNDState___block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "doNotDisturbStateMonitor:didUpdateToState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateService, 0);
  objc_storeStrong((id *)&self->_lock_state, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end
