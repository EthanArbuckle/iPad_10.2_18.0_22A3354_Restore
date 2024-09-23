@implementation STKDeviceLockMonitor

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_1);
  return (id)sharedInstance___instance;
}

void __38__STKDeviceLockMonitor_sharedInstance__block_invoke()
{
  STKDeviceLockMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(STKDeviceLockMonitor);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (STKDeviceLockMonitor)init
{
  STKDeviceLockMonitor *v2;
  STKDeviceLockMonitor *v3;
  int *p_notify_token;
  NSObject *v5;
  uint32_t v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)STKDeviceLockMonitor;
  v2 = -[STKDeviceLockMonitor init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_stateLock._os_unfair_lock_opaque = 0;
    v2->_observersLock._os_unfair_lock_opaque = 0;
    v2->_notify_token = -1;
    p_notify_token = &v2->_notify_token;
    objc_initWeak(&location, v2);
    dispatch_get_global_queue(33, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __28__STKDeviceLockMonitor_init__block_invoke;
    v14 = &unk_24D563360;
    objc_copyWeak(&v15, &location);
    v6 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v3->_notify_token, v5, &v11);

    STKCommonLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *p_notify_token;
      *(_DWORD *)buf = 67109120;
      v19 = v8;
      _os_log_impl(&dword_216439000, v7, OS_LOG_TYPE_DEFAULT, "Received token: %d for lock status update", buf, 8u);
    }

    if (v6)
    {
      STKCommonLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[STKDeviceLockMonitor init].cold.1(v6, v9);

    }
    -[STKDeviceLockMonitor _updateDeviceLockState](v3, "_updateDeviceLockState", v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __28__STKDeviceLockMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDeviceLockState");

}

- (void)dealloc
{
  int notify_token;
  objc_super v4;

  notify_token = self->_notify_token;
  if (notify_token != -1)
  {
    notify_cancel(notify_token);
    self->_notify_token = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)STKDeviceLockMonitor;
  -[STKDeviceLockMonitor dealloc](&v4, sel_dealloc);
}

- (BOOL)isDeviceLocked
{
  STKDeviceLockMonitor *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_deviceLocked;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observersList;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    observersList = self->_observersList;
    if (!observersList)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithWeakObjects");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observersList;
      self->_observersList = v6;

      observersList = self->_observersList;
    }
    -[NSHashTable addObject:](observersList, "addObject:", v8);
    os_unfair_lock_unlock(&self->_observersLock);
    v4 = v8;
  }

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;
  NSHashTable *observersList;

  if (a3)
  {
    p_observersLock = &self->_observersLock;
    v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable removeObject:](self->_observersList, "removeObject:", v5);

    if (!-[NSHashTable count](self->_observersList, "count"))
    {
      observersList = self->_observersList;
      self->_observersList = 0;

    }
    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)_updateDeviceLockState
{
  os_unfair_lock_s *p_stateLock;
  os_unfair_lock_s *p_observersLock;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v5 = +[STKUtil isDeviceLocked](STKUtil, "isDeviceLocked");
  v6 = v5;
  if (self->_deviceLocked == v5)
  {
    v7 = 0;
  }
  else
  {
    self->_deviceLocked = v5;
    v7 = (void *)-[NSHashTable copy](self->_observersList, "copy");
    STKCommonLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "unlocked";
      if (v6)
        v9 = "locked";
      *(_DWORD *)buf = 136315138;
      v21 = v9;
      _os_log_impl(&dword_216439000, v8, OS_LOG_TYPE_DEFAULT, "Device is %s", buf, 0xCu);
    }

  }
  os_unfair_lock_unlock(p_observersLock);
  os_unfair_lock_unlock(p_stateLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "deviceLockStateChanged:", v6, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersList, 0);
}

- (void)init
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_216439000, a2, OS_LOG_TYPE_ERROR, "Could not register for lock state notification: %d", (uint8_t *)v2, 8u);
}

@end
