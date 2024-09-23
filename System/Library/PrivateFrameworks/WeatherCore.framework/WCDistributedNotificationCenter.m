@implementation WCDistributedNotificationCenter

- (void)postWeatherLocationAuthorizationDidUpdateNotification
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("WeatherPrefAppToPrefsDidUpdateNotification"), v3, 0, 1);

}

+ (WCDistributedNotificationCenter)defaultCenter
{
  if (defaultCenter_onceToken != -1)
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global);
  return (WCDistributedNotificationCenter *)(id)defaultCenter_sSharedInstance;
}

void __48__WCDistributedNotificationCenter_defaultCenter__block_invoke()
{
  WCDistributedNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(WCDistributedNotificationCenter);
  v1 = (void *)defaultCenter_sSharedInstance;
  defaultCenter_sSharedInstance = (uint64_t)v0;

}

- (WCDistributedNotificationCenter)init
{
  WCDistributedNotificationCenter *v2;
  WCDistributedNotificationCenter *v3;
  uint64_t v4;
  NSHashTable *observers;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WCDistributedNotificationCenter;
  v2 = -[WCDistributedNotificationCenter init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:suspensionBehavior:", v3, sel_weatherPrefsDidGetUpdated_, CFSTR("WeatherPrefPrefsToAppDidUpdateNotification"), 0, 2);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:suspensionBehavior:", v3, sel_weatherPrefsDidGetUpdated_, CFSTR("WeatherGroupPrefsDidUpdateNotification"), 0, 2);

  }
  return v3;
}

- (void)postWeatherSavedLocationsDidUpdateNotification
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("WeatherGroupPrefsDidUpdateNotification"), v3, 0, 1);

}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_dataSynchronizationLock;
  id v5;
  void *v6;

  if (a3)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    v5 = a3;
    os_unfair_lock_lock_with_options();
    -[WCDistributedNotificationCenter observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    v9 = v4;
    os_unfair_lock_lock_with_options();
    -[WCDistributedNotificationCenter observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v9);

    if (v7)
    {
      -[WCDistributedNotificationCenter observers](self, "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v9);

    }
    os_unfair_lock_unlock(p_dataSynchronizationLock);
    v4 = v9;
  }

}

- (void)weatherPrefsDidGetUpdated:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3898];
  v5 = a3;
  objc_msgSend(v4, "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "isEqualToString:", v8);
  if ((v5 & 1) == 0)
    -[WCDistributedNotificationCenter _notifyObserversOfPreferencesChange](self, "_notifyObserversOfPreferencesChange");
}

- (void)_notifyObserversOfPreferencesChange
{
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  -[WCDistributedNotificationCenter observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_dataSynchronizationLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "sharedPreferencesChangedExternally", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
