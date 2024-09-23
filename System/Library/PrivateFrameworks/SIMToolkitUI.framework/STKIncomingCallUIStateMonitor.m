@implementation STKIncomingCallUIStateMonitor

+ (STKIncomingCallUIStateMonitor)sharedInstance
{
  if (sharedInstance___once_0 != -1)
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_4);
  return (STKIncomingCallUIStateMonitor *)(id)sharedInstance___instance_0;
}

void __47__STKIncomingCallUIStateMonitor_sharedInstance__block_invoke()
{
  STKIncomingCallUIStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(STKIncomingCallUIStateMonitor);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;

}

- (STKIncomingCallUIStateMonitor)init
{
  STKIncomingCallUIStateMonitor *v2;
  STKIncomingCallUIStateMonitor *v3;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STKIncomingCallUIStateMonitor;
  v2 = -[STKIncomingCallUIStateMonitor init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_observersLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    dispatch_get_global_queue(33, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __37__STKIncomingCallUIStateMonitor_init__block_invoke;
    v9 = &unk_24D563360;
    objc_copyWeak(&v10, &location);
    notify_register_dispatch("MPInCallAlertStateChangeNotification", &v3->_inCallAlertVisibleNotifyToken, v4, &v6);

    -[STKIncomingCallUIStateMonitor _refreshState](v3, "_refreshState", v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __37__STKIncomingCallUIStateMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshState");

}

- (BOOL)isShowingIncomingCallUI
{
  STKIncomingCallUIStateMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_showingIncomingCallUI;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observersLock_observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    observersLock_observers = self->_observersLock_observers;
    if (!observersLock_observers)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithWeakObjects");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observersLock_observers;
      self->_observersLock_observers = v6;

      observersLock_observers = self->_observersLock_observers;
    }
    -[NSHashTable addObject:](observersLock_observers, "addObject:", v8);
    os_unfair_lock_unlock(&self->_observersLock);
    v4 = v8;
  }

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;
  NSHashTable *observersLock_observers;

  if (a3)
  {
    p_observersLock = &self->_observersLock;
    v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable removeObject:](self->_observersLock_observers, "removeObject:", v5);

    if (!-[NSHashTable count](self->_observersLock_observers, "count"))
    {
      observersLock_observers = self->_observersLock_observers;
      self->_observersLock_observers = 0;

    }
    os_unfair_lock_unlock(p_observersLock);
  }
}

- (double)_fallbackTimerDuration
{
  return 300.0;
}

- (void)_refreshState
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(self->_inCallAlertVisibleNotifyToken, &state64);
  -[STKIncomingCallUIStateMonitor _setIncomingCallUIState:forReason:](self, "_setIncomingCallUIState:forReason:", state64 != 0, CFSTR("Refresh"));
}

- (void)_setIncomingCallUIState:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BSTimer *fallbackTimer;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  BSTimer *v14;
  BSTimer *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  uint8_t v26[128];
  uint8_t buf[4];
  _BOOL4 v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_lock(&self->_observersLock);
  if (self->_lock_showingIncomingCallUI == v4)
  {
    v7 = 0;
  }
  else
  {
    self->_lock_showingIncomingCallUI = v4;
    -[BSTimer cancel](self->_fallbackTimer, "cancel");
    fallbackTimer = self->_fallbackTimer;
    self->_fallbackTimer = 0;

    v7 = (void *)-[NSHashTable copy](self->_observersLock_observers, "copy");
    STKCommonLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v28 = v4;
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_216439000, v9, OS_LOG_TYPE_DEFAULT, "Incoming call UI state changed to: %d for reason: %{public}@", buf, 0x12u);
    }

    if (v4)
    {
      v10 = (void *)MEMORY[0x24BE0BEB0];
      -[STKIncomingCallUIStateMonitor _fallbackTimerDuration](self, "_fallbackTimerDuration");
      v12 = v11;
      dispatch_get_global_queue(33, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __67__STKIncomingCallUIStateMonitor__setIncomingCallUIState_forReason___block_invoke;
      v25[3] = &unk_24D563080;
      v25[4] = self;
      objc_msgSend(v10, "scheduledTimerWithFireInterval:queue:handler:", v13, v25, v12);
      v14 = (BSTimer *)objc_claimAutoreleasedReturnValue();
      v15 = self->_fallbackTimer;
      self->_fallbackTimer = v14;

    }
  }
  os_unfair_lock_unlock(&self->_observersLock);
  os_unfair_lock_unlock(&self->_lock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "incomingCallUIStateDidChange:", v4, (_QWORD)v21);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v18);
  }

}

uint64_t __67__STKIncomingCallUIStateMonitor__setIncomingCallUIState_forReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setIncomingCallUIState:forReason:", 0, CFSTR("Timeout - falling back to NO"));
}

- (void)setIsShowingIncomingCallUI:(BOOL)a3
{
  self->_isShowingIncomingCallUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTimer, 0);
  objc_storeStrong((id *)&self->_observersLock_observers, 0);
}

@end
