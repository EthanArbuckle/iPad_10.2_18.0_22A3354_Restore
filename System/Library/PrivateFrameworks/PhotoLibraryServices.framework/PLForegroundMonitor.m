@implementation PLForegroundMonitor

- (void)_locked_applicationDidMoveToForeground:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[NSMutableSet containsObject:](self->_foregroundBundleIDs, "containsObject:", v4) & 1) == 0)
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%@ moved to foreground", buf, 0xCu);
    }

    -[NSMutableSet addObject:](self->_foregroundBundleIDs, "addObject:", v4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_clients;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "bundleIdentifiers", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v4);

          if (v14)
          {
            ++v9;
            objc_msgSend(v12, "block");
            v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id, uint64_t))v15)[2](v15, v4, 1);

          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v22 = v9;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Notified %lu clients that %@ is in foreground", buf, 0x16u);
    }

  }
}

- (PLForegroundMonitor)init
{
  PLForegroundMonitor *v2;
  NSMutableSet *v3;
  NSMutableSet *foregroundBundleIDs;
  uint64_t v5;
  OS_dispatch_queue *queue;
  NSMutableArray *v7;
  NSMutableArray *clients;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLForegroundMonitor;
  v2 = -[PLForegroundMonitor init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    foregroundBundleIDs = v2->_foregroundBundleIDs;
    v2->_foregroundBundleIDs = v3;

    pl_dispatch_queue_create_with_fallback_qos();
    v5 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    clients = v2->_clients;
    v2->_clients = v7;

  }
  return v2;
}

- (void)_stopMonitoring
{
  BKSApplicationStateMonitor *applicationStateMonitor;
  BKSApplicationStateMonitor *v4;
  NSUUID *applicationStateMonitorUUID;
  NSSet *monitoredBundleIdentifiers;

  applicationStateMonitor = self->_applicationStateMonitor;
  if (applicationStateMonitor)
  {
    -[BKSApplicationStateMonitor invalidate](applicationStateMonitor, "invalidate");
    v4 = self->_applicationStateMonitor;
    self->_applicationStateMonitor = 0;

    applicationStateMonitorUUID = self->_applicationStateMonitorUUID;
    self->_applicationStateMonitorUUID = 0;

  }
  monitoredBundleIdentifiers = self->_monitoredBundleIdentifiers;
  self->_monitoredBundleIdentifiers = 0;

}

- (void)_startMonitoringBundleIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BKSApplicationStateMonitor *v7;
  BKSApplicationStateMonitor *applicationStateMonitor;
  void *v9;
  id v10;
  NSSet *v11;
  NSSet *monitoredBundleIdentifiers;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  -[PLForegroundMonitor _stopMonitoring](self, "_stopMonitoring");
  v5 = objc_alloc(MEMORY[0x1E0CFE2F0]);
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (BKSApplicationStateMonitor *)objc_msgSend(v5, "initWithBundleIDs:states:", v6, *MEMORY[0x1E0CFE290]);
  applicationStateMonitor = self->_applicationStateMonitor;
  self->_applicationStateMonitor = v7;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_applicationStateMonitorUUID, v9);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__PLForegroundMonitor__startMonitoringBundleIdentifiers___block_invoke;
  v13[3] = &unk_1E36646D0;
  objc_copyWeak(&v15, &location);
  v10 = v9;
  v14 = v10;
  -[BKSApplicationStateMonitor setHandler:](self->_applicationStateMonitor, "setHandler:", v13);
  v11 = (NSSet *)objc_msgSend(v4, "copy");
  monitoredBundleIdentifiers = self->_monitoredBundleIdentifiers;
  self->_monitoredBundleIdentifiers = v11;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_updateMonitoring
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_clients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "bundleIdentifiers", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  if (!self->_monitoredBundleIdentifiers || (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    if (objc_msgSend(v3, "count", (_QWORD)v10))
      -[PLForegroundMonitor _startMonitoringBundleIdentifiers:](self, "_startMonitoringBundleIdentifiers:", v3);
    else
      -[PLForegroundMonitor _stopMonitoring](self, "_stopMonitoring");
  }

}

- (id)startMonitoringBundleIdentifiers:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  _PLForegroundMonitorClient *v7;
  void *v8;
  _PLForegroundMonitorClient *v9;
  _PLForegroundMonitorClient *v10;
  _PLForegroundMonitorClient *v12;

  v5 = a4;
  v6 = a3;
  v7 = [_PLForegroundMonitorClient alloc];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);

  v9 = -[_PLForegroundMonitorClient initWithBundleIdentifiers:block:](v7, "initWithBundleIdentifiers:block:", v8, v5);
  v12 = v9;
  pl_dispatch_async();
  v10 = v12;

  return v10;
}

- (void)stopMonitoring:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  pl_dispatch_async();

}

- (void)_locked_applicationDidMoveToBackground:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableSet containsObject:](self->_foregroundBundleIDs, "containsObject:", v4))
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%@ moved to background", buf, 0xCu);
    }

    -[NSMutableSet removeObject:](self->_foregroundBundleIDs, "removeObject:", v4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_clients;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "bundleIdentifiers", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v4);

          if (v14)
          {
            ++v9;
            objc_msgSend(v12, "block");
            v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id, _QWORD))v15)[2](v15, v4, 0);

          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v22 = v9;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Notified %lu clients that %@ is in background", buf, 0x16u);
    }

  }
}

- (void)_handleApplicationStateMonitorNotificationWithUserInfo:(id)a3 applicationStateMonitorUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  v8 = v7;
  v9 = v6;
  pl_dispatch_async();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStateMonitorUUID, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIDs, 0);
}

void __106__PLForegroundMonitor__handleApplicationStateMonitorNotificationWithUserInfo_applicationStateMonitorUUID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained
    && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48)
    && objc_msgSend(*(id *)(a1 + 40), "isEqual:"))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x1E0CFE2A8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x1E0CFE2C0]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "intValue");

      if (v5 == 8)
        objc_msgSend(WeakRetained, "_locked_applicationDidMoveToForeground:", v3);
      else
        objc_msgSend(WeakRetained, "_locked_applicationDidMoveToBackground:", v3);
    }
    else
    {
      PLBackendGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Monitor sent a notification with a nil bundle identifier", v7, 2u);
      }

    }
  }

}

uint64_t __38__PLForegroundMonitor_stopMonitoring___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateMonitoring");
}

void __62__PLForegroundMonitor_startMonitoringBundleIdentifiers_block___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateMonitoring");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "bundleIdentifiers", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", v7);

        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 40), "block");
          v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v10[2](v10, v7, 1);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __57__PLForegroundMonitor__startMonitoringBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleApplicationStateMonitorNotificationWithUserInfo:applicationStateMonitorUUID:", v4, *(_QWORD *)(a1 + 32));

}

+ (PLForegroundMonitor)sharedInstance
{
  if (sharedInstance_onceToken_17002 != -1)
    dispatch_once(&sharedInstance_onceToken_17002, &__block_literal_global_17003);
  return (PLForegroundMonitor *)(id)sharedInstance_sharedInstance;
}

+ (NSArray)bundleIdentifiersToMonitorForSystemLibrary
{
  return (NSArray *)&unk_1E37634E8;
}

void __37__PLForegroundMonitor_sharedInstance__block_invoke()
{
  PLForegroundMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(PLForegroundMonitor);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

@end
