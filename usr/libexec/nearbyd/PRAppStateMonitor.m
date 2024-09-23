@implementation PRAppStateMonitor

- (PRAppStateMonitor)initWithPID:(int)a3
{
  PRAppStateMonitor *v4;
  NSMutableSet *v5;
  NSMutableSet *observers;
  NSString *processNameInternal;
  NSString *launchdJobLabelInternal;
  void *v9;
  uint64_t v10;
  id v11;
  RBSProcessHandle *processHandle;
  NSObject *v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *bundleIdentifierInternal;
  RBSProcessHandle *v23;
  void *v24;
  uint64_t v25;
  NSString *signingIdentityInternal;
  RBSProcessHandle *v27;
  id v28;
  uint64_t v29;
  RBSProcessMonitor *processMonitor;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _OWORD v37[2];
  id v38;
  id location;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)PRAppStateMonitor;
  v4 = -[PRAppStateMonitor init](&v40, "init");
  if (v4)
  {
    v5 = objc_opt_new(NSMutableSet);
    observers = v4->_observers;
    v4->_observers = v5;

    processNameInternal = v4->_processNameInternal;
    v4->_processNameInternal = 0;

    launchdJobLabelInternal = v4->_launchdJobLabelInternal;
    v4->_launchdJobLabelInternal = 0;

    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_monitoredPID = a3;
    objc_initWeak(&location, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", v4->_monitoredPID));
    v38 = 0;
    v10 = objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v9, &v38));
    v11 = v38;
    processHandle = v4->_processHandle;
    v4->_processHandle = (RBSProcessHandle *)v10;

    if (v11)
    {
      v13 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D786C((uint64_t)v11, v13);
    }
    v14 = objc_claimAutoreleasedReturnValue(-[RBSProcessHandle name](v4->_processHandle, "name"));
    v15 = v4->_processNameInternal;
    v4->_processNameInternal = (NSString *)v14;

    v16 = objc_claimAutoreleasedReturnValue(-[RBSProcessHandle daemonJobLabel](v4->_processHandle, "daemonJobLabel"));
    v17 = v4->_launchdJobLabelInternal;
    v4->_launchdJobLabelInternal = (NSString *)v16;

    v4->_isDaemonInternal = -[RBSProcessHandle isDaemon](v4->_processHandle, "isDaemon");
    v4->_isRunningBoardAppInternal = -[RBSProcessHandle isApplication](v4->_processHandle, "isApplication");
    v4->_isXPCServiceInternal = -[RBSProcessHandle isXPCService](v4->_processHandle, "isXPCService");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessHandle bundle](v4->_processHandle, "bundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleInfoValueForKey:", CFSTR("UIBackgroundModes")));
    v4->_isUIBackgroundModeEnabledInternal = objc_msgSend(v19, "containsObject:", CFSTR("nearby-interaction"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessHandle bundle](v4->_processHandle, "bundle"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
    bundleIdentifierInternal = v4->_bundleIdentifierInternal;
    v4->_bundleIdentifierInternal = (NSString *)v21;

    v4->_timeOfLatestAppState = sub_10000883C();
    memset(v37, 0, sizeof(v37));
    v23 = v4->_processHandle;
    if (v23)
      -[RBSProcessHandle auditToken](v23, "auditToken");
    v24 = (void *)xpc_copy_code_signing_identity_for_token(v37);
    if (v24)
    {
      v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v24));
      signingIdentityInternal = v4->_signingIdentityInternal;
      v4->_signingIdentityInternal = (NSString *)v25;

      free(v24);
    }
    v27 = v4->_processHandle;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1001BB33C;
    v35[3] = &unk_10080C390;
    objc_copyWeak(&v36, &location);
    -[RBSProcessHandle monitorForDeath:](v27, "monitorForDeath:", v35);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001BB3BC;
    v32[3] = &unk_10080C3E0;
    v28 = v9;
    v33 = v28;
    objc_copyWeak(&v34, &location);
    v29 = objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v32));
    processMonitor = v4->_processMonitor;
    v4->_processMonitor = (RBSProcessMonitor *)v29;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[PRAppStateMonitor invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRAppStateMonitor;
  -[PRAppStateMonitor dealloc](&v3, "dealloc");
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
}

- (NSString)monitoredProcessName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_processNameInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)launchdJobLabel
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_launchdJobLabelInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isDaemon
{
  PRAppStateMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isDaemonInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isRunningBoardApp
{
  PRAppStateMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isRunningBoardAppInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isXPCService
{
  PRAppStateMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isXPCServiceInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUIBackgroundModeEnabled
{
  PRAppStateMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isUIBackgroundModeEnabledInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int)currentAppState
{
  os_unfair_lock_s *p_lock;
  int appState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_latestState.__engaged_)
    appState = self->_latestState.var0.__val_.appState;
  else
    appState = 0;
  os_unfair_lock_unlock(p_lock);
  return appState;
}

- (NSArray)printableState
{
  NSMutableArray *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  unsigned int v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_opt_new(NSMutableArray);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = objc_autoreleasePoolPush();
  if (self->_isDaemonInternal)
  {
    v6 = CFSTR("Daemon");
  }
  else if (self->_isXPCServiceInternal)
  {
    v6 = CFSTR("XPC Service");
  }
  else if (self->_isRunningBoardAppInternal)
  {
    v6 = CFSTR("App");
  }
  else
  {
    v6 = CFSTR("Other");
  }
  v7 = v6;
  if (self->_latestState.__engaged_ && (v8 = self->_latestState.var0.__val_.appState - 1, v8 <= 2))
    v9 = off_10080C438[v8];
  else
    v9 = CFSTR("Unknown");
  if (self->_latestState.__engaged_)
  {
    v10 = -[RBSProcessState isRunning](self->_latestState.var0.__val_.processState, "isRunning");
    v11 = CFSTR("No");
    if (v10)
      v11 = CFSTR("Yes");
  }
  else
  {
    v11 = CFSTR("Unknown");
  }
  v12 = v11;
  if (self->_latestState.__engaged_)
    v13 = -[RBSProcessState taskState](self->_latestState.var0.__val_.processState, "taskState");
  else
    v13 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%d: %@]"), self->_monitoredPID, self->_processNameInternal));
  -[NSMutableArray addObject:](v3, "addObject:", v14);

  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Type: %@. State: running %@ [%d], app %@ [age: %.2f s]. Observers: %d"), v7, v12, v13, v9, sub_10000883C() - self->_timeOfLatestAppState, -[NSMutableSet count](self->_observers, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Label: %@. Signing ID: %@"), self->_launchdJobLabelInternal, self->_signingIdentityInternal));
  -[NSMutableArray addObject:](v3, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Bundle: ID %@, UIBackgroundModeNI %d"), self->_bundleIdentifierInternal, self->_isUIBackgroundModeEnabledInternal));
  -[NSMutableArray addObject:](v3, "addObject:", v18);

  objc_autoreleasePoolPop(v5);
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v3;
}

- (void)_process:(id)a3 didUpdateState:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int *p_monitoredPID;
  NSString *v15;
  NSString *processNameInternal;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  os_unfair_lock_t lock;
  id v25;
  id v26;
  id v27;
  NSMutableSet *obj;
  _QWORD block[5];
  id v30;
  int v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint64_t v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _BYTE v43[18];

  v26 = a3;
  v27 = a4;
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "name"));
    *(_DWORD *)buf = 138478339;
    v41 = (const char *)v26;
    v42 = 2113;
    *(_QWORD *)v43 = v7;
    *(_WORD *)&v43[8] = 2113;
    *(_QWORD *)&v43[10] = v27;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PRAppStateMonitor] _process: %{private}@, name: %{private}@, didUpdateState: %{private}@", buf, 0x20u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "state"));
  v37 = sub_1001BBFD0(v8);
  v38 = v9;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "previousState"));
  v25 = sub_1001BBFD0(v10);
  v12 = v11;

  v13 = objc_msgSend(v26, "pid");
  p_monitoredPID = &self->_monitoredPID;
  if (v13 != self->_monitoredPID)
  {
    v22 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D78E0(p_monitoredPID, v13, v22);
    v23 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/AppState/PRAppStateMonitor.mm";
      v42 = 1024;
      *(_DWORD *)v43 = 250;
      *(_WORD *)&v43[4] = 2080;
      *(_QWORD *)&v43[6] = "-[PRAppStateMonitor _process:didUpdateState:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_processNameInternal)
  {
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "name"));
    processNameInternal = self->_processNameInternal;
    self->_processNameInternal = v15;

  }
  sub_1001BC058((uint64_t)&self->_latestState, (uint64_t)&v37);
  os_unfair_lock_unlock(&self->_lock);
  if ((_DWORD)v38 != v12)
  {
    self->_timeOfLatestAppState = sub_10000883C();
    lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = self->_observers;
    v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "updatesQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3321888768;
          block[2] = sub_1001BC0BC;
          block[3] = &unk_10080C408;
          block[4] = v20;
          v32 = v13;
          v30 = v37;
          v31 = v38;
          dispatch_async(v21, block);

        }
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v17);
    }

    os_unfair_lock_unlock(lock);
  }

}

- (void)_process:(id)a3 didTerminate:(id)a4
{
  unsigned int v5;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSObject *v12;
  os_unfair_lock_s *lock;
  id v14;
  _QWORD block[5];
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v14 = a3;
  v5 = objc_msgSend(v14, "pid");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_observers;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  lock = p_lock;
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "updatesQueue", lock));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001BC2BC;
        block[3] = &unk_10080B978;
        block[4] = v11;
        v16 = v5;
        dispatch_async(v12, block);

      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(lock);
}

- (int)monitoredPID
{
  return self->_monitoredPID;
}

- (void).cxx_destruct
{
  if (self->_latestState.__engaged_)

  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_signingIdentityInternal, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierInternal, 0);
  objc_storeStrong((id *)&self->_launchdJobLabelInternal, 0);
  objc_storeStrong((id *)&self->_processNameInternal, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 80) = 0;
  *((_BYTE *)self + 96) = 0;
  return self;
}

@end
