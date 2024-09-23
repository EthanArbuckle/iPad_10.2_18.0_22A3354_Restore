@implementation SKASystemMonitor

- (SKASystemMonitor)init
{
  SKASystemMonitor *v2;
  SKASystemMonitor *v3;
  uint64_t v4;
  NSHashTable *listeners;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKASystemMonitor;
  v2 = -[SKASystemMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_ivarLock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 0);
    listeners = v3->_listeners;
    v3->_listeners = (NSHashTable *)v4;

    v3->_underFirstLock = 0;
    -[SKASystemMonitor _updateLockState](v3, "_updateLockState");
    -[SKASystemMonitor _listenForKeyBagChangeNotifications](v3, "_listenForKeyBagChangeNotifications");
  }
  return v3;
}

+ (SKASystemMonitor)sharedInstance
{
  if (sharedInstance_creation != -1)
    dispatch_once(&sharedInstance_creation, &__block_literal_global_28);
  return (SKASystemMonitor *)(id)sharedInstance_sharedInstance;
}

void __34__SKASystemMonitor_sharedInstance__block_invoke()
{
  SKASystemMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(SKASystemMonitor);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)addListener:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  if (!-[NSHashTable containsObject:](self->_listeners, "containsObject:", v4))
    -[NSHashTable addObject:](self->_listeners, "addObject:", v4);
  os_unfair_lock_unlock(&self->_ivarLock);

}

- (void)removeListener:(id)a3
{
  os_unfair_lock_s *p_ivarLock;
  id v5;

  p_ivarLock = &self->_ivarLock;
  v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  -[NSHashTable removeObject:](self->_listeners, "removeObject:", v5);

  os_unfair_lock_unlock(p_ivarLock);
}

- (BOOL)isUnderFirstDataProtectionLock
{
  SKASystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_underFirstLock;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)_listenForKeyBagChangeNotifications
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2188DF000, log, OS_LOG_TYPE_ERROR, "Error registering for mobile key bag notifications", v1, 2u);
}

void __55__SKASystemMonitor__listenForKeyBagChangeNotifications__block_invoke(int a1, int val)
{
  id v2;

  if (notify_is_valid_token(val))
  {
    +[SKASystemMonitor sharedInstance](SKASystemMonitor, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_updateLockState");

  }
}

- (BOOL)_deviceStillUnderFirstLock
{
  return (int)MKBDeviceUnlockedSinceBoot() < 1;
}

- (void)_updateLockState
{
  os_unfair_lock_s *p_ivarLock;
  BOOL v4;
  _BOOL4 underFirstLock;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v4 = -[SKASystemMonitor _deviceStillUnderFirstLock](self, "_deviceStillUnderFirstLock");
  if (v4)
  {
    self->_underFirstLock = v4;
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    underFirstLock = self->_underFirstLock;
    self->_underFirstLock = v4;
    os_unfair_lock_unlock(p_ivarLock);
    if (underFirstLock)
      -[SKASystemMonitor _deliverNotificationSelectorToListeners:](self, "_deliverNotificationSelectorToListeners:", sel_systemDidLeaveFirstDataProtectionLock);
  }
}

- (void)_deliverNotificationSelectorToListeners:(SEL)a3
{
  os_unfair_lock_s *p_ivarLock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  -[NSHashTable allObjects](self->_listeners, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_ivarLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          +[SKASystemMonitor logger](SKASystemMonitor, "logger");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v20 = v14;
            v21 = 2112;
            v22 = v12;
            _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Delivering %@ to %@", buf, 0x16u);

          }
          objc_msgSend(v12, "performSelectorOnMainThread:withObject:waitUntilDone:", a3, 0, 1);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v9);
  }

}

+ (id)logger
{
  if (logger_onceToken_28 != -1)
    dispatch_once(&logger_onceToken_28, &__block_literal_global_6);
  return (id)logger__logger_28;
}

void __26__SKASystemMonitor_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKASystemMonitor");
  v1 = (void *)logger__logger_28;
  logger__logger_28 = (uint64_t)v0;

}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarLock = a3;
}

- (BOOL)underFirstLock
{
  return self->_underFirstLock;
}

- (void)setUnderFirstLock:(BOOL)a3
{
  self->_underFirstLock = a3;
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
