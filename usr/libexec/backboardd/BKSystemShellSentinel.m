@implementation BKSystemShellSentinel

- (id)_collectivePingSystemShellSet
{
  os_unfair_lock_s *p_collectivePingDataLock;
  id v4;

  p_collectivePingDataLock = &self->_collectivePingDataLock;
  os_unfair_lock_lock(&self->_collectivePingDataLock);
  v4 = -[NSMutableSet copy](self->_collectivePingDataLock_collectivePingShells, "copy");
  os_unfair_lock_unlock(p_collectivePingDataLock);
  return v4;
}

- (BOOL)collectiveWatchdogPing
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel _collectivePingSystemShellSet](self, "_collectivePingSystemShellSet"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = BKLogSystemShell();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "watchdog ping: %{public}@", buf, 0xCu);
        }

        if (!-[BKSystemShellSentinel _pingSystemShellForCollectiveWatchdog:](self, "_pingSystemShellForCollectiveWatchdog:", v8))
        {
          v12 = BKLogSystemShell();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v20 = v8;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ reported not alive, which is fairly unusual", buf, 0xCu);
          }

          v11 = 0;
          goto LABEL_15;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_15:

  return v11;
}

- (BOOL)auditTokenRepresentsSystemApp:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_pidToClient;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = BSPIDForAuditToken(a3);
  if ((int)v4 < 1)
    return 0;
  v5 = v4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pidToClient = self->_lock_pidToClient;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_pidToClient, "objectForKey:", v8));
  v10 = v9 != 0;

  os_unfair_lock_unlock(p_lock);
  return v10;
}

+ (BKSystemShellSentinel)sharedInstance
{
  if (qword_100117510 != -1)
    dispatch_once(&qword_100117510, &stru_1000EBF18);
  return (BKSystemShellSentinel *)(id)qword_100117508;
}

- (BKSystemShellSentinel)init
{
  BKSystemShellSentinel *v2;
  BKSystemShellServiceListener *v3;
  BKSystemShellControlServiceListener *v4;
  BKSystemShellServiceListener *v5;
  BKSystemShellControlServiceListener *v6;
  BKSystemShellSentinel *v7;
  BKSystemShellClient *lock_systemApp;
  uint64_t v9;
  NSMapTable *lock_checkinCompletionsBySystemApp;
  NSMutableOrderedSet *v11;
  NSMutableOrderedSet *lock_connectedSystemApps;
  NSMutableSet *v13;
  NSMutableSet *lock_shellsFinishedStartup;
  BKSystemAppHeartbeat *v15;
  BKSystemAppHeartbeat *heartbeat;
  NSMutableDictionary *v17;
  NSMutableDictionary *lock_pidToClient;
  uint64_t v19;
  BSCompoundAssertion *observers;
  objc_super v22;

  v2 = self;
  v3 = -[BKSystemShellServiceListener initWithSentinel:]([BKSystemShellServiceListener alloc], "initWithSentinel:", self);
  v4 = -[BKSystemShellControlServiceListener initWithSentinel:]([BKSystemShellControlServiceListener alloc], "initWithSentinel:", v2);
  v5 = v3;
  v6 = v4;
  if (v2)
  {
    v22.receiver = v2;
    v22.super_class = (Class)BKSystemShellSentinel;
    v7 = -[BKSystemShellSentinel init](&v22, "init");
    v2 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_shellListener, v3);
      objc_storeStrong((id *)&v2->_controlListener, v4);
      v2->_lock._os_unfair_lock_opaque = 0;
      v2->_collectivePingDataLock._os_unfair_lock_opaque = 0;
      lock_systemApp = v2->_lock_systemApp;
      v2->_lock_systemApp = 0;

      v9 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
      lock_checkinCompletionsBySystemApp = v2->_lock_checkinCompletionsBySystemApp;
      v2->_lock_checkinCompletionsBySystemApp = (NSMapTable *)v9;

      v11 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      lock_connectedSystemApps = v2->_lock_connectedSystemApps;
      v2->_lock_connectedSystemApps = v11;

      v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      lock_shellsFinishedStartup = v2->_lock_shellsFinishedStartup;
      v2->_lock_shellsFinishedStartup = v13;

      v15 = objc_alloc_init(BKSystemAppHeartbeat);
      heartbeat = v2->_heartbeat;
      v2->_heartbeat = v15;

      v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lock_pidToClient = v2->_lock_pidToClient;
      v2->_lock_pidToClient = v17;

      v19 = objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:](BSCompoundAssertion, "assertionWithIdentifier:", CFSTR("BKSystemShellSentinelObservers")));
      observers = v2->_observers;
      v2->_observers = (BSCompoundAssertion *)v19;

    }
  }

  return v2;
}

- (void)invalidate
{
  BSCompoundAssertion *observers;

  -[BSCompoundAssertion invalidate](self->_observers, "invalidate");
  observers = self->_observers;
  self->_observers = 0;

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  BKSystemShellSentinel *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendBool:withName:", self->_lock_systemAppBlocked, CFSTR("systemAppBlocked"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100077AE4;
  v11 = &unk_1000ECD80;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "build", v8, v9, v10, v11));

  return (NSString *)v6;
}

- (id)addSystemShellObserver:(id)a3 reason:(id)a4
{
  return -[BSCompoundAssertion acquireForReason:withContext:](self->_observers, "acquireForReason:withContext:", a4, a3);
}

- (void)setActiveAlternateSystemAppBundleIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSString *v6;
  NSString *lock_activeAlternateSystemAppBundleIdentifier;
  NSString *lock_activeAlternateSystemAppJobLabel;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");

  lock_activeAlternateSystemAppBundleIdentifier = self->_lock_activeAlternateSystemAppBundleIdentifier;
  self->_lock_activeAlternateSystemAppBundleIdentifier = v6;

  lock_activeAlternateSystemAppJobLabel = self->_lock_activeAlternateSystemAppJobLabel;
  self->_lock_activeAlternateSystemAppJobLabel = 0;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)activeAlternateSystemAppBundleIdentifier
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSString copy](self->_lock_activeAlternateSystemAppBundleIdentifier, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (BKSystemShellDescriptor)primarySystemShell
{
  os_unfair_lock_s *p_lock;
  BKSystemShellClient *lock_systemApp;
  BKSystemShellClient *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_systemApp = self->_lock_systemApp;
  if (lock_systemApp)
    lock_systemApp = (BKSystemShellClient *)lock_systemApp->_descriptor;
  v5 = lock_systemApp;
  os_unfair_lock_unlock(p_lock);
  return (BKSystemShellDescriptor *)v5;
}

- (NSArray)systemShells
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_lock_connectedSystemApps, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", &stru_1000EBF78));

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSSet)shellsFinishedStartup
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet bs_map:](self->_lock_shellsFinishedStartup, "bs_map:", &stru_1000EBF98));
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (id)systemShellState
{
  os_unfair_lock_s *p_lock;
  BKSystemShellSentinelState *v4;
  BKSystemShellClient *lock_systemApp;
  const char *v6;
  BKSystemShellClient *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc_init(BKSystemShellSentinelState);
  lock_systemApp = self->_lock_systemApp;
  if (lock_systemApp)
    lock_systemApp = (BKSystemShellClient *)lock_systemApp->_descriptor;
  v7 = lock_systemApp;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v6, v7, 16);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_lock_connectedSystemApps, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_map:", &stru_1000EBFB8));
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v9, v10, 24);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet bs_map:](self->_lock_shellsFinishedStartup, "bs_map:", &stru_1000EBFD8));
  v13 = v11;
  if (v4)
  {
    objc_setProperty_nonatomic_copy(v4, v12, v11, 32);

    v4->_waitingForAlternateShellsToFinish = self->_lock_systemAppBlocked;
  }
  else
  {

  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)startServerWithoutDataMigration
{
  -[BKSystemShellServiceListener activate](self->_shellListener, "activate");
  -[BKSystemShellControlServiceListener activate](self->_controlListener, "activate");
}

- (void)startServerWithDataMigration
{
  -[BKSystemShellServiceListener activateForDataMigration](self->_shellListener, "activateForDataMigration");
}

- (void)dataMigratorDidComplete
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion context](self->_observers, "context"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "systemShellWillBootstrap") & 1) != 0)
          objc_msgSend(v8, "systemShellWillBootstrap");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  os_unfair_lock_lock(&self->_lock);
  -[BKSystemShellSentinel _lock_bootstrapSystemApp](self, "_lock_bootstrapSystemApp");
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)blockSystemApp
{
  BKSystemShellSentinel *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BKSystemShellSentinel _lock_blockSystemApp](v2, "_lock_blockSystemApp");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)unblockSystemApp
{
  BKSystemShellSentinel *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BKSystemShellSentinel _lock_unblockSystemApp](v2, "_lock_unblockSystemApp");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)systemShellDidConnect:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  BKSystemShellClient *v9;
  id v10;
  id v11;
  BKSystemShellSentinel *v12;
  NSDate *v13;
  NSDate *connectDate;
  void *v15;
  unsigned int v16;
  NSString *v17;
  NSString *lock_activeAlternateSystemAppJobLabel;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSMutableDictionary *lock_pidToClient;
  void *v25;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  v9 = [BKSystemShellClient alloc];
  v10 = v7;
  v11 = v8;
  if (v9)
  {
    v26.receiver = v9;
    v26.super_class = (Class)BKSystemShellClient;
    v12 = -[BKSystemShellSentinel init](&v26, "init");
    v9 = (BKSystemShellClient *)v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_heartbeat, a4);
      objc_storeStrong((id *)&v9->_descriptor, a3);
      v13 = (NSDate *)objc_alloc_init((Class)NSDate);
      connectDate = v9->_connectDate;
      v9->_connectDate = v13;

    }
  }

  if (v9)
    v9->_pendingCheckIn = 1;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
  v16 = objc_msgSend(v15, "isEqualToString:", self->_lock_activeAlternateSystemAppBundleIdentifier);

  if (v16)
  {
    if (v9)
      v9->_isAlternateShell = 1;
    v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "jobLabel"));
    lock_activeAlternateSystemAppJobLabel = self->_lock_activeAlternateSystemAppJobLabel;
    self->_lock_activeAlternateSystemAppJobLabel = v17;

    v19 = BKLogSystemShell();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKSystemShellClient description](v9, "description"));
      LODWORD(v26.receiver) = 138543362;
      *(id *)((char *)&v26.receiver + 4) = v21;
      v22 = "Alternate system shell connected: %{public}@";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v26, 0xCu);

    }
  }
  else
  {
    v23 = BKLogSystemShell();
    v20 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKSystemShellClient description](v9, "description"));
      LODWORD(v26.receiver) = 138543362;
      *(id *)((char *)&v26.receiver + 4) = v21;
      v22 = "System shell connected: %{public}@";
      goto LABEL_13;
    }
  }

  lock_pidToClient = self->_lock_pidToClient;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "pid")));
  -[NSMutableDictionary setObject:forKey:](lock_pidToClient, "setObject:forKey:", v9, v25);

  -[NSMutableOrderedSet addObject:](self->_lock_connectedSystemApps, "addObject:", v9);
  -[BKSystemShellSentinel _lock_updatePrimarySystemApp](self, "_lock_updatePrimarySystemApp");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)systemShellDidTerminate:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_pidToClient;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  void *v16;

  v3 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pidToClient = self->_lock_pidToClient;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_pidToClient, "objectForKey:", v7));

  if (v8)
  {
    v9 = BKLogSystemShell();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "System app disconnected: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    -[NSMutableOrderedSet removeObject:](self->_lock_connectedSystemApps, "removeObject:", v8);
    -[NSMapTable removeObjectForKey:](self->_lock_checkinCompletionsBySystemApp, "removeObjectForKey:", v8);
    v11 = self->_lock_pidToClient;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

    -[NSMutableSet removeObject:](self->_lock_shellsFinishedStartup, "removeObject:", v8);
    -[BKSystemShellSentinel _removeSystemShellFromCollectivePingSet:](self, "_removeSystemShellFromCollectivePingSet:", v8);
    -[BKSystemShellSentinel _lock_updatePrimarySystemApp](self, "_lock_updatePrimarySystemApp");
    if (!-[NSMutableOrderedSet count](self->_lock_connectedSystemApps, "count"))
    {
      v13 = BKLogSystemShell();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No more system apps", (uint8_t *)&v15, 2u);
      }

    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)_addSystemShellToCollectivePingSet:(id)a3
{
  NSMutableSet *collectivePingDataLock_collectivePingShells;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_collectivePingDataLock);
  collectivePingDataLock_collectivePingShells = self->_collectivePingDataLock_collectivePingShells;
  if (!collectivePingDataLock_collectivePingShells)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v6 = self->_collectivePingDataLock_collectivePingShells;
    self->_collectivePingDataLock_collectivePingShells = v5;

    collectivePingDataLock_collectivePingShells = self->_collectivePingDataLock_collectivePingShells;
  }
  -[NSMutableSet addObject:](collectivePingDataLock_collectivePingShells, "addObject:", v7);
  os_unfair_lock_unlock(&self->_collectivePingDataLock);

}

- (void)_removeSystemShellFromCollectivePingSet:(id)a3
{
  os_unfair_lock_s *p_collectivePingDataLock;
  id v5;

  p_collectivePingDataLock = &self->_collectivePingDataLock;
  v5 = a3;
  os_unfair_lock_lock(p_collectivePingDataLock);
  -[NSMutableSet removeObject:](self->_collectivePingDataLock_collectivePingShells, "removeObject:", v5);

  os_unfair_lock_unlock(p_collectivePingDataLock);
}

- (BOOL)_pingSystemShellForCollectiveWatchdog:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v20;
  __int16 v21[8];
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = (void *)v3[2];
  else
    v5 = 0;
  v6 = v5;
  v7 = objc_msgSend(v6, "watchdogType");

  if (v7 != (id)1)
  {
    v8 = v4 ? (void *)v4[2] : 0;
    v9 = v8;
    v10 = BSPIDIsBeingDebugged(objc_msgSend(v9, "pid"));

    if ((v10 & 1) == 0)
    {
      if (v4)
        v12 = (void *)v4[3];
      else
        v12 = 0;
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remoteTarget"));

      v15 = objc_msgSend(v14, "collectiveWatchdogPing");
      v11 = v15;
      if (v4)
      {
        if (v15 == (*((_BYTE *)v4 + 12) != 0))
        {
LABEL_21:

          goto LABEL_22;
        }
        v16 = BKLogSystemShell();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        v18 = v17;
        if (!v11)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "watchdogPing: system app claims it's no longer alive", buf, 2u);
          }

LABEL_20:
          *((_BYTE *)v4 + 12) = v11;
          goto LABEL_21;
        }
      }
      else
      {
        if (!v15)
          goto LABEL_21;
        v20 = BKLogSystemShell();
        v18 = objc_claimAutoreleasedReturnValue(v20);
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v21[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "watchdogPing: system app is now alive", (uint8_t *)v21, 2u);
      }

      if (!v4)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  v11 = 1;
LABEL_22:

  return v11;
}

- (id)_lock_currentConnectionShell
{
  void *v3;
  void *v4;
  id v5;
  NSMutableDictionary *lock_pidToClient;
  void *v7;
  void *v8;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteProcess"));
  v5 = objc_msgSend(v4, "pid");

  lock_pidToClient = self->_lock_pidToClient;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](lock_pidToClient, "objectForKeyedSubscript:", v7));

  return v8;
}

- (void)_lock_bootstrapSystemApp
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_systemAppBlocked && -[NSMapTable count](self->_lock_checkinCompletionsBySystemApp, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_lock_checkinCompletionsBySystemApp, "objectEnumerator", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[NSMapTable removeAllObjects](self->_lock_checkinCompletionsBySystemApp, "removeAllObjects");
  }
  -[BKSystemShellSentinel _lock_updatePrimarySystemApp](self, "_lock_updatePrimarySystemApp");
}

- (void)_lock_updatePrimarySystemApp
{
  NSMutableOrderedSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BKSystemShellClient *v8;
  NSMutableOrderedSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  BKSystemShellClient *v22;
  uint64_t v23;
  NSObject *v24;
  BKSystemShellClient *lock_systemApp;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  BKSystemShellClient **p_lock_systemApp;
  BKSystemShellClient *v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  BKSystemShellClient *v35;
  BKSystemShellClient *v36;
  BKSystemShellClient *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  BKSystemShellDescriptor *descriptor;
  BKSystemShellDescriptor *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  BKSystemShellClient *v64;
  _BYTE v65[128];

  os_unfair_lock_assert_owner(&self->_lock);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v3 = self->_lock_connectedSystemApps;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v58;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v6)
          objc_enumerationMutation(v3);
        v8 = *(BKSystemShellClient **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        if (v8 && !v8->_pendingCheckIn && v8->_checkedIn)
        {
          v20 = BKLogSystemShell();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v64 = v8;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Updating primary system app to: %{public}@", buf, 0xCu);
          }

          v22 = v8;
          goto LABEL_43;
        }
      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (self->_lock_systemAppBlocked)
  {
    v3 = self->_lock_activeAlternateSystemAppBundleIdentifier;
    if (v3)
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v9 = self->_lock_connectedSystemApps;
      v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v54;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v54 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v13);
            if (v14)
              v15 = (void *)v14[2];
            else
              v15 = 0;
            v16 = v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleIdentifier"));
            v18 = objc_msgSend(v17, "isEqualToString:", v3);

            if ((v18 & 1) != 0)
            {
              v22 = v14;

              if (!v14)
                goto LABEL_39;
              v27 = BKLogSystemShell();
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v64 = v22;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Updating primary system the alternate system app: %{public}@", buf, 0xCu);
              }
              goto LABEL_42;
            }
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v19 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          v11 = v19;
          if (v19)
            continue;
          break;
        }
      }

    }
LABEL_39:
    v29 = BKLogSystemShell();
    v28 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Updating primary system to nil because we are waiting for the alternate system app to launch", buf, 2u);
    }
    v22 = 0;
LABEL_42:

    goto LABEL_43;
  }
  if (!self->_lock_systemApp
    || !-[NSMutableOrderedSet containsObject:](self->_lock_connectedSystemApps, "containsObject:"))
  {
    v22 = (BKSystemShellClient *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](self->_lock_connectedSystemApps, "firstObject"));
    v26 = BKLogSystemShell();
    v3 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v64 = v22;
      _os_log_impl((void *)&_mh_execute_header, &v3->super.super, OS_LOG_TYPE_DEFAULT, "Updating primary system first app: %{public}@", buf, 0xCu);
    }
LABEL_43:

    goto LABEL_44;
  }
  v23 = BKLogSystemShell();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    lock_systemApp = self->_lock_systemApp;
    *(_DWORD *)buf = 138543362;
    v64 = lock_systemApp;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updating primary system app to the old _systemApp: %{public}@", buf, 0xCu);
  }

  v22 = self->_lock_systemApp;
LABEL_44:
  p_lock_systemApp = &self->_lock_systemApp;
  if (self->_lock_systemApp != v22)
  {
    objc_storeStrong((id *)&self->_lock_systemApp, v22);
    v31 = *p_lock_systemApp;
    v32 = BKLogSystemShell();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v34)
      {
        v35 = *p_lock_systemApp;
        if (*p_lock_systemApp)
          v35 = (BKSystemShellClient *)v35->_descriptor;
        v36 = v35;
        v37 = (BKSystemShellClient *)objc_claimAutoreleasedReturnValue(-[BKSystemShellClient bundleIdentifier](v36, "bundleIdentifier"));
        *(_DWORD *)buf = 138543362;
        v64 = v37;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Now monitoring \"%{public}@\", buf, 0xCu);

      }
    }
    else
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No system apps remain. Waiting for one to spawn...", buf, 2u);
      }

      if (self->_enableIdleSleepAssertionID)
      {
        v38 = BKLogSystemShell();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Telling IOKit that idle sleep is now disabled.", buf, 2u);
        }

        IOPMAssertionRelease(self->_enableIdleSleepAssertionID);
        self->_enableIdleSleepAssertionID = 0;
      }
    }
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion context](self->_observers, "context"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v50;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v50 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v44);
        if ((objc_opt_respondsToSelector(v45, "systemShellChangedWithPrimary:") & 1) != 0)
        {
          if (v22)
            descriptor = v22->_descriptor;
          else
            descriptor = 0;
          v47 = descriptor;
          objc_msgSend(v45, "systemShellChangedWithPrimary:", v47);

        }
        v44 = (char *)v44 + 1;
      }
      while (v42 != v44);
      v48 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      v42 = v48;
    }
    while (v48);
  }

}

- (void)_lock_handleRelaunchRequestFromSystemApp:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v7 = BKLogSystemShell();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = BKSRestartActionOptionsDescription(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling exit request from %{public}@ with options: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  if ((a4 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    objc_msgSend(v11, "setHideAppleLogoOnLaunch:", 1);

  }
  sub_100036058();
  exit(0);
}

- (BOOL)_lock_blockSystemApp
{
  _BOOL4 lock_systemAppBlocked;
  uint64_t v4;
  NSObject *v5;
  NSMutableOrderedSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSMutableOrderedSet *lock_connectedSystemApps;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];
  _BYTE v34[128];

  os_unfair_lock_assert_owner(&self->_lock);
  lock_systemAppBlocked = self->_lock_systemAppBlocked;
  if (!self->_lock_systemAppBlocked)
  {
    self->_lock_systemAppBlocked = 1;
    v4 = BKLogSystemShell();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Blocking system apps.", buf, 2u);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = self->_lock_connectedSystemApps;
    v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          sub_100074328(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), 0);
        }
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      }
      while (v8);
    }

    lock_connectedSystemApps = self->_lock_connectedSystemApps;
    if (self->_shellListener)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100077908;
      block[3] = &unk_1000ECDA8;
      v26 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet bs_map:](lock_connectedSystemApps, "bs_map:", &stru_1000EC018));
      v12 = v26;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
    else
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet bs_map:](lock_connectedSystemApps, "bs_map:", &stru_1000EC038));
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
            v18 = BKLogSystemShell();
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v32 = v17;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Killing %{public}@.", buf, 0xCu);
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
        }
        while (v14);
      }
    }

  }
  return !lock_systemAppBlocked;
}

- (BOOL)_lock_unblockSystemApp
{
  _BOOL4 lock_systemAppBlocked;
  void *lock_activeAlternateSystemAppJobLabel;
  uint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  os_unfair_lock_assert_owner(&self->_lock);
  lock_systemAppBlocked = self->_lock_systemAppBlocked;
  if (self->_lock_systemAppBlocked)
  {
    lock_activeAlternateSystemAppJobLabel = self->_lock_activeAlternateSystemAppJobLabel;
    if (lock_activeAlternateSystemAppJobLabel)
      lock_activeAlternateSystemAppJobLabel = (void *)sub_100038254((uint64_t)objc_msgSend(lock_activeAlternateSystemAppJobLabel, "UTF8String"), 0);
    self->_lock_systemAppBlocked = 0;
    v5 = BKLogSystemShell(lock_activeAlternateSystemAppJobLabel);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unblocking system apps.", v8, 2u);
    }

    -[BKSystemShellSentinel _lock_bootstrapSystemApp](self, "_lock_bootstrapSystemApp");
  }
  return lock_systemAppBlocked;
}

- (void)_lock_completeCheckInForShell:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  void (*v18)(uint64_t);
  void *v19;
  void *v20;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v6 = BKLogSystemShell(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v17) = 138543362;
    *(_QWORD *)((char *)&v17 + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "completeCheckInForShell: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  v8 = sub_10001A7F4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)v9;
  if (v9)
  {
    v11 = *(NSObject **)(v9 + 8);
    *(_QWORD *)&v17 = _NSConcreteStackBlock;
    *((_QWORD *)&v17 + 1) = 3221225472;
    v18 = sub_10008BB80;
    v19 = &unk_1000ECDA8;
    v20 = v10;
    dispatch_async(v11, &v17);
  }

  if (v4)
    *((_WORD *)v4 + 4) = 256;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = v12;
  if (v4)
  {
    objc_storeStrong((id *)v4 + 4, v12);

    v14 = (void *)*((_QWORD *)v4 + 2);
  }
  else
  {

    v14 = 0;
  }
  v15 = v14;
  v16 = objc_msgSend(v15, "watchdogType");

  if (v16)
    sub_100074328((uint64_t)v4, 1);
  else
    -[BKSystemShellSentinel _addSystemShellToCollectivePingSet:](self, "_addSystemShellToCollectivePingSet:", v4);

}

- (void)_lock_completeCheckInForShell:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _BYTE *v8;
  id v9;
  _QWORD *v10;
  void (**v11)(_QWORD);
  int v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  _BOOL4 lock_systemAppBlocked;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  NSMapTable *lock_checkinCompletionsBySystemApp;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;

  v6 = a3;
  v7 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000778D4;
  v25[3] = &unk_1000EC060;
  v25[4] = self;
  v8 = v6;
  v26 = v8;
  v9 = v7;
  v27 = v9;
  v10 = objc_retainBlock(v25);
  v11 = (void (**)(_QWORD))v10;
  if (v8 && v8[11])
  {
    v12 = 1;
LABEL_4:
    v13 = BKLogSystemShell(v10);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = sub_1000742C4(v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      lock_systemAppBlocked = self->_lock_systemAppBlocked;
      *(_DWORD *)buf = 138543874;
      v29 = v16;
      v30 = 1024;
      v31 = v12;
      v32 = 1024;
      v33 = lock_systemAppBlocked;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "checkInAndWaitForDataMigration: Telling %{public}@ it can start immediately (alternate:%{BOOL}u blocked:%{BOOL}u)", buf, 0x18u);

    }
    v11[2](v11);
    goto LABEL_11;
  }
  if (!self->_lock_systemAppBlocked)
  {
    v12 = 0;
    goto LABEL_4;
  }
  v18 = BKLogSystemShell(v10);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = sub_1000742C4(v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = self->_lock_systemAppBlocked;
    *(_DWORD *)buf = 138543618;
    v29 = v21;
    v30 = 1024;
    v31 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Pending %{public}@ completion because systemAppBlocked:%{BOOL}u", buf, 0x12u);

  }
  lock_checkinCompletionsBySystemApp = self->_lock_checkinCompletionsBySystemApp;
  v24 = objc_msgSend(v11, "copy");
  -[NSMapTable setObject:forKey:](lock_checkinCompletionsBySystemApp, "setObject:forKey:", v24, v8);

LABEL_11:
  -[BKSystemShellSentinel _lock_updatePrimarySystemApp](self, "_lock_updatePrimarySystemApp");

}

- (void)_lock_checkInWithRemoteCompletionBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(id, uint64_t);
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;

  p_lock = &self->_lock;
  v5 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_assert_owner(p_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel _lock_currentConnectionShell](self, "_lock_currentConnectionShell"));
  v7 = BKLogSystemShell(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "checkIn: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    -[BKSystemShellSentinel _lock_completeCheckInForShell:completionBlock:](self, "_lock_completeCheckInForShell:completionBlock:", v6, v5);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "checkIn: shell not found for current connection", (uint8_t *)&v11, 2u);
    }

    v10 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    v5[2](v5, v10);

    v5 = (void (**)(id, uint64_t))v10;
  }

}

- (void)checkInAfterDataMigrationUsingCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel dataMigrationQueue](BKSystemShellSentinel, "dataMigrationQueue"));
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock(&self->_lock);
  -[BKSystemShellSentinel _lock_checkInWithRemoteCompletionBlock:](self, "_lock_checkInWithRemoteCompletionBlock:", v4);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)checkInBypassingDataMigrationUsingCompletionBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BKSystemShellSentinel _lock_checkInWithRemoteCompletionBlock:](self, "_lock_checkInWithRemoteCompletionBlock:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)finishedLaunching
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  BKSystemShellClient *lock_systemApp;
  io_registry_entry_t v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  int v19;
  CFNumberRef v20;
  int v21;
  CFNumberRef v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD block[5];
  int v42;
  int valuePtr;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  double v48;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel _lock_currentConnectionShell](self, "_lock_currentConnectionShell"));
  v5 = BKLogSystemShell(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v7 = *(void **)(v4 + 16);
    else
      v7 = 0;
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    if (v4)
      v10 = *(void **)(v4 + 32);
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend(v11, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138543618;
    v46 = v9;
    v47 = 2048;
    v48 = -v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "System shell \"%{public}@\" finished startup after %.2fs.", buf, 0x16u);

  }
  if (v4)
    *(_BYTE *)(v4 + 10) = 1;
  -[NSMutableSet addObject:](self->_lock_shellsFinishedStartup, "addObject:", v4);
  lock_systemApp = self->_lock_systemApp;
  if (lock_systemApp == (BKSystemShellClient *)v4)
  {
    v14 = IORegistryEntryFromPath(kIOMainPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
    IORegistryEntrySetCFProperty(v14, CFSTR("System Boot Complete"), kCFBooleanTrue);
    if (v4)
      v15 = *(void **)(v4 + 16);
    else
      v15 = 0;
    v16 = v15;
    objc_msgSend(v16, "systemIdleSleepInterval");
    v18 = v17;

    v19 = (int)v18;
    if ((int)v18 <= 1)
      v19 = 1;
    valuePtr = v19;
    v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    IORegistryEntrySetCFProperty(v14, CFSTR("System Idle Seconds"), v20);
    CFRelease(v20);
    v21 = (int)(v18 * 1000.0);
    if (v21 <= 1)
      v21 = 1;
    v42 = v21;
    v22 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v42);
    IORegistryEntrySetCFProperty(v14, CFSTR("System Idle Milliseconds"), v22);
    CFRelease(v22);
    v24 = BKLogSystemShell(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v46) = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Setting system idle interval to %d.", buf, 8u);
    }

    if (!self->_enableIdleSleepAssertionID)
    {
      v27 = BKLogSystemShell(v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Telling IOKit that idle sleep is now enabled.", buf, 2u);
      }

      IOPMAssertionCreateWithName(CFSTR("EnableIdleSleep"), 0xFFu, CFSTR("com.apple.backboardd.enable-idle-sleep"), &self->_enableIdleSleepAssertionID);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000778C8;
    block[3] = &unk_1000ECDA8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (v4)
    v29 = *(void **)(v4 + 16);
  else
    v29 = 0;
  v30 = v29;
  os_unfair_lock_unlock(p_lock);
  if (lock_systemApp == (BKSystemShellClient *)v4)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion context](self->_observers, "context"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "systemShellDidFinishLaunching:", v30);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v33);
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    objc_msgSend(v36, "setHideAppleLogoOnLaunch:", 0);

  }
}

- (void)restartWithOptions:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  unsigned int v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel _lock_currentConnectionShell](self, "_lock_currentConnectionShell"));
  v6 = objc_msgSend(v5, "unsignedIntValue");

  -[BKSystemShellSentinel _lock_handleRelaunchRequestFromSystemApp:withOptions:](self, "_lock_handleRelaunchRequestFromSystemApp:withOptions:", v7, v6);
  os_unfair_lock_unlock(p_lock);

}

- (void)setWatchdogMonitoringEnabled:(id)a3
{
  BKSystemShellSentinel *v3;
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  v3 = self;
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel _lock_currentConnectionShell](v3, "_lock_currentConnectionShell"));
  LODWORD(v3) = objc_msgSend(v5, "BOOLValue");

  sub_100074328((uint64_t)v6, (int)v3);
  os_unfair_lock_unlock(p_lock);

}

- (void)terminateShellWithJobLabel:(id)a3
{
  id *v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id *v36;

  v4 = (id *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = BKLogSystemShell(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Disable watchdog for job label: %{public}@", buf, 0xCu);
  }

  v9 = objc_retainAutorelease(v4);
  sub_100038254((uint64_t)objc_msgSend(v9, "UTF8String"), 0);
  v10 = -[NSMutableOrderedSet copy](self->_lock_connectedSystemApps, "copy");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v13 = (id *)v11;
  if (!v12)
    goto LABEL_20;
  v14 = v12;
  v15 = *(_QWORD *)v31;
LABEL_5:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v31 != v15)
      objc_enumerationMutation(v11);
    v17 = *(_QWORD **)(*((_QWORD *)&v30 + 1) + 8 * v16);
    v18 = v17 ? (void *)v17[2] : 0;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "jobLabel"));
    v21 = objc_msgSend(v9, "isEqualToString:", v20);

    if ((v21 & 1) != 0)
      break;
    if (v14 == (id)++v16)
    {
      v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v14 = v22;
      if (!v22)
      {
        v13 = (id *)v11;
        goto LABEL_20;
      }
      goto LABEL_5;
    }
  }
  v13 = v17;

  if (v17)
  {
    v24 = BKLogSystemShell(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Shell exists; will terminate %{public}@",
        buf,
        0xCu);
    }

    v26 = v13[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100077814;
    block[3] = &unk_1000ECDA8;
    v29 = v26;
    v27 = v26;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_20:
  }
  os_unfair_lock_unlock(p_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_collectivePingDataLock_collectivePingShells, 0);
  objc_storeStrong((id *)&self->_lock_activeAlternateSystemAppJobLabel, 0);
  objc_storeStrong((id *)&self->_lock_activeAlternateSystemAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_checkinCompletionsBySystemApp, 0);
  objc_storeStrong((id *)&self->_lock_shellsFinishedStartup, 0);
  objc_storeStrong((id *)&self->_lock_connectedSystemApps, 0);
  objc_storeStrong((id *)&self->_lock_pidToClient, 0);
  objc_storeStrong((id *)&self->_lock_systemApp, 0);
  objc_storeStrong((id *)&self->_heartbeat, 0);
  objc_storeStrong((id *)&self->_controlListener, 0);
  objc_storeStrong((id *)&self->_shellListener, 0);
}

+ (id)dataMigrationQueue
{
  if (qword_100117518 != -1)
    dispatch_once(&qword_100117518, &stru_1000EBF38);
  return (id)qword_100117520;
}

@end
