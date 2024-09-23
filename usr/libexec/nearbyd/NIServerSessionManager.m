@implementation NIServerSessionManager

- (NIServerSessionManager)initWithQueue:(id)a3
{
  id v5;
  NIServerSessionManager *v6;
  NIServerSessionManager *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *sessions;
  NSMutableDictionary *v10;
  NSMutableDictionary *observerSessions;
  NSMutableDictionary *v12;
  NSMutableDictionary *processMonitors;
  NIPrivacyAuthorizationManager *v14;
  NIPrivacyAuthorizationManager *authManager;
  void *v16;
  unsigned int v17;
  _QWORD v19[4];
  NIServerSessionManager *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NIServerSessionManager;
  v6 = -[NIServerSessionManager init](&v21, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_sessionsLock._os_unfair_lock_opaque = 0;
    v8 = objc_opt_new(NSMutableDictionary);
    sessions = v7->_sessions;
    v7->_sessions = v8;

    v10 = objc_opt_new(NSMutableDictionary);
    observerSessions = v7->_observerSessions;
    v7->_observerSessions = v10;

    v12 = objc_opt_new(NSMutableDictionary);
    processMonitors = v7->_processMonitors;
    v7->_processMonitors = v12;

    v14 = objc_opt_new(NIPrivacyAuthorizationManager);
    authManager = v7->_authManager;
    v7->_authManager = v14;

    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
          v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("EnableStateDump")),
          v16,
          v17))
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100192AA4;
      v19[3] = &unk_10080A8A0;
      v20 = v7;
      os_state_add_handler(&_dispatch_main_q, v19);

    }
  }

  return v7;
}

- (void)enableInternalObserverSession
{
  os_unfair_lock_s *p_sessionsLock;
  NSObject *v4;
  NIRecentlyObservedObjectsCache *v5;
  NIRecentlyObservedObjectsCache *recentlyObservedObjectsCache;
  uint8_t v7[16];

  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#nisessmgr,Enabling internal observer session.", v7, 2u);
  }
  if (!self->_recentlyObservedObjectsCache)
  {
    v5 = objc_alloc_init(NIRecentlyObservedObjectsCache);
    recentlyObservedObjectsCache = self->_recentlyObservedObjectsCache;
    self->_recentlyObservedObjectsCache = v5;

  }
  os_unfair_lock_unlock(p_sessionsLock);
}

- (BOOL)registerSessionWithConnection:(id)a3 observerSession:(BOOL)a4
{
  id v6;
  os_unfair_lock_s *p_sessionsLock;
  unsigned __int8 v8;
  BOOL v9;

  v6 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (a4)
    v8 = -[NIServerSessionManager _registerObserverSessionWithConnection:](self, "_registerObserverSessionWithConnection:", v6);
  else
    v8 = -[NIServerSessionManager _registerSessionWithConnection:](self, "_registerSessionWithConnection:", v6);
  v9 = v8;
  os_unfair_lock_unlock(p_sessionsLock);

  return v9;
}

- (BOOL)_registerSessionWithConnection:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSMutableArray *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  PRAppStateMonitor *v21;
  NSMutableDictionary *processMonitors;
  void *v23;
  NSObject *v24;
  PRAppStateMonitor *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  int v39;
  _QWORD v40[5];
  id v41;
  int v42;
  _QWORD v43[4];
  PRAppStateMonitor *v44;
  NIServerSessionManager *v45;
  uint64_t *v46;
  _QWORD block[4];
  id v48;
  NIServerSessionManager *v49;
  uint64_t *v50;
  id v51;
  int v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _OWORD v59[2];
  uint8_t buf[4];
  const __CFString *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  id v67;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  v5 = objc_msgSend(v4, "processIdentifier");
  v6 = sub_1002D7274();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "setRemoteObjectInterface:", v7);

  v8 = sub_1002D6474();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v4, "setExportedInterface:", v9);

  memset(v59, 0, sizeof(v59));
  if (v4)
    objc_msgSend(v4, "auditToken");
  v10 = (void *)xpc_copy_code_signing_identity_for_token(v59);
  if (v10)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
    free(v10);
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = sub_10019325C;
    v57 = sub_10019326C;
    v58 = 0;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3321888768;
    block[2] = sub_100193274;
    block[3] = &unk_10080AC60;
    v50 = &v53;
    v12 = v4;
    v48 = v12;
    v52 = (int)v5;
    v34 = v36;
    v51 = v34;
    v49 = self;
    dispatch_sync(v11, block);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v13));
    v15 = v14 == 0;

    if (v15)
    {
      v16 = objc_opt_new(NSMutableArray);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessions, "setObject:forKeyedSubscript:", v16, v13, v34);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v13, v34));
    objc_msgSend(v17, "addObject:", v54[5]);

    v18 = (id)qword_10085F520;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v13));
      v20 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 138478595;
      v61 = CFSTR("Adding session to ");
      v62 = 1025;
      v63 = (int)v5;
      v64 = 2113;
      v65 = CFSTR("pid dict. Current count:");
      v66 = 2048;
      v67 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#nisessmgr,%{private}@ %{private}d %{private}@ %lu", buf, 0x26u);

    }
    v21 = (PRAppStateMonitor *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_processMonitors, "objectForKey:", v13));
    if (!v21)
    {
      v21 = -[PRAppStateMonitor initWithPID:]([PRAppStateMonitor alloc], "initWithPID:", v5);
      processMonitors = self->_processMonitors;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
      -[NSMutableDictionary setObject:forKey:](processMonitors, "setObject:forKey:", v21, v23);

      -[PRAppStateMonitor addObserver:](v21, "addObserver:", self);
    }
    objc_initWeak((id *)buf, self);
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_queue"));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100193340;
    v43[3] = &unk_10080AC98;
    v46 = &v53;
    v25 = v21;
    v44 = v25;
    v45 = self;
    dispatch_sync(v24, v43);

    objc_msgSend(v12, "setExportedObject:", v54[5]);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1001933B0;
    v40[3] = &unk_10080ACC0;
    v42 = (int)v5;
    objc_copyWeak(&v41, (id *)buf);
    v40[4] = &v53;
    objc_msgSend(v12, "setInterruptionHandler:", v40);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10019348C;
    v37[3] = &unk_10080ACC0;
    v39 = (int)v5;
    objc_copyWeak(&v38, (id *)buf);
    v37[4] = &v53;
    objc_msgSend(v12, "setInvalidationHandler:", v37);
    objc_msgSend(v12, "resume");
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v41);

    objc_destroyWeak((id *)buf);
    _Block_object_dispose(&v53, 8);

  }
  else
  {
    v26 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D40BC((uint64_t)v5, v26, v27, v28, v29, v30, v31, v32);
  }

  return v10 != 0;
}

- (BOOL)_registerObserverSessionWithConnection:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NIServerObservationSession *v11;
  BOOL v12;
  void *v13;
  _BOOL4 v14;
  NSMutableArray *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  PRAppStateMonitor *v20;
  NSMutableDictionary *processMonitors;
  void *v22;
  NIServerObservationSession *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v33;
  _QWORD v34[4];
  NIServerObservationSession *v35;
  id v36;
  int v37;
  _QWORD v38[4];
  NIServerObservationSession *v39;
  id v40;
  int v41;
  id v42;
  int v43;
  _OWORD v44[2];
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  id v52;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  v5 = objc_msgSend(v4, "processIdentifier");
  v6 = sub_1002D7274();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "setRemoteObjectInterface:", v7);

  v8 = sub_1002D6474();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v4, "setExportedInterface:", v9);

  memset(v44, 0, sizeof(v44));
  if (v4)
    objc_msgSend(v4, "auditToken");
  v10 = (void *)xpc_copy_code_signing_identity_for_token(v44);
  if (v10)
  {
    v42 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
    v43 = (int)v5;
    free(v10);
    v11 = -[NIServerObservationSession initWithClientInfo:connection:]([NIServerObservationSession alloc], "initWithClientInfo:connection:", &v42, v4);
    objc_msgSend(v4, "setExportedObject:", v11);
    v12 = v11 != 0;
    if (v11)
    {
      -[NIServerSessionManager _startObserving:](self, "_startObserving:", v11);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_observerSessions, "objectForKeyedSubscript:"));
      v14 = v13 == 0;

      if (v14)
      {
        v15 = objc_opt_new(NSMutableArray);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observerSessions, "setObject:forKeyedSubscript:", v15, v33);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_observerSessions, "objectForKeyedSubscript:", v33));
      objc_msgSend(v16, "addObject:", v11);

      v17 = (id)qword_10085F520;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_observerSessions, "objectForKeyedSubscript:", v33));
        v19 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 138478595;
        v46 = CFSTR("Adding observer session to ");
        v47 = 1025;
        v48 = (int)v5;
        v49 = 2113;
        v50 = CFSTR("pid dict. Current count:");
        v51 = 2048;
        v52 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#nisessmgr,%{private}@ %{private}d %{private}@ %lu", buf, 0x26u);

      }
      v20 = (PRAppStateMonitor *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_processMonitors, "objectForKey:", v33));
      if (!v20)
      {
        v20 = -[PRAppStateMonitor initWithPID:]([PRAppStateMonitor alloc], "initWithPID:", v5);
        processMonitors = self->_processMonitors;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
        -[NSMutableDictionary setObject:forKey:](processMonitors, "setObject:forKey:", v20, v22);

        -[PRAppStateMonitor addObserver:](v20, "addObserver:", self);
      }
      objc_initWeak((id *)buf, self);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100193AA4;
      v38[3] = &unk_1007FA8E8;
      v41 = (int)v5;
      objc_copyWeak(&v40, (id *)buf);
      v23 = v11;
      v39 = v23;
      objc_msgSend(v4, "setInterruptionHandler:", v38);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100193B78;
      v34[3] = &unk_1007FA8E8;
      v37 = (int)v5;
      objc_copyWeak(&v36, (id *)buf);
      v35 = v23;
      objc_msgSend(v4, "setInvalidationHandler:", v34);
      objc_msgSend(v4, "resume");

      objc_destroyWeak(&v36);
      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v31 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D4120(v31);
    }

  }
  else
  {
    v24 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D40BC((uint64_t)v5, v24, v25, v26, v27, v28, v29, v30);
    v12 = 0;
  }

  return v12;
}

- (void)_handleXPCDisconnection:(id)a3
{
  id v5;
  os_unfair_lock_s *p_sessionsLock;
  NSObject *v7;
  id v8;
  NSMutableDictionary *sessions;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSMutableDictionary *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  id v21;

  v5 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (!v5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionManager.mm"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  }
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nisessmgr,disconnection for session %{private}@.", buf, 0xCu);
  }
  v8 = objc_msgSend(v5, "pid");
  objc_msgSend(v5, "invalidate");
  sessions = self->_sessions;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v10));
  objc_msgSend(v11, "removeObject:", v5);

  v12 = self->_sessions;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
  v15 = objc_msgSend(v14, "count") == 0;

  if (v15)
  {
    v16 = self->_sessions;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

  }
  v18 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#nisessmgr,removed session object from retained sessions.", buf, 2u);
  }
  os_unfair_lock_unlock(p_sessionsLock);

}

- (void)_handleObserverSessionXPCDisconnection:(id)a3
{
  id v5;
  os_unfair_lock_s *p_sessionsLock;
  NSObject *v7;
  id v8;
  NSMutableDictionary *observerSessions;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSMutableDictionary *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  id v21;

  v5 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (!v5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionManager.mm"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observationSession"));

  }
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nisessmgr,disconnection for observer session %{private}@.", buf, 0xCu);
  }
  -[NIServerSessionManager _stopObserving:](self, "_stopObserving:", v5);
  v8 = objc_msgSend(v5, "pid");
  objc_msgSend(v5, "invalidate");
  observerSessions = self->_observerSessions;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](observerSessions, "objectForKeyedSubscript:", v10));
  objc_msgSend(v11, "removeObject:", v5);

  v12 = self->_observerSessions;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
  v15 = objc_msgSend(v14, "count") == 0;

  if (v15)
  {
    v16 = self->_observerSessions;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

  }
  v18 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#nisessmgr,removed observer session object from retained sessions.", buf, 2u);
  }
  os_unfair_lock_unlock(p_sessionsLock);

}

- (void)monitoredApp:(int)a3 didChangeState:(int)a4
{
  uint64_t v5;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  NSMutableDictionary *processMonitors;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v15;
  int v16;
  int v17;
  __int16 v18;
  void *v19;

  v5 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_sessionsLock);
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_1001BBB88(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v16 = 67109378;
    v17 = v5;
    v18 = 2112;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nisessmgr,SessionManager got update for pid: %d state: %@", (uint8_t *)&v16, 0x12u);

  }
  if (a4 == 1)
  {
    processMonitors = self->_processMonitors;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](processMonitors, "objectForKey:", v11));

    objc_msgSend(v12, "invalidate");
    v13 = self->_processMonitors;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

    v15 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 67109120;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#nisessmgr,pid %d is gone. Clearing auth manager state.", (uint8_t *)&v16, 8u);
    }
    -[NIPrivacyAuthorizationManager clearStateForPid:](self->_authManager, "clearStateForPid:", v5);

  }
  os_unfair_lock_unlock(&self->_sessionsLock);
}

- (id)updatesQueue
{
  return self->_queue;
}

- (BOOL)isSessionAllowedToActivate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_sessionsLock;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (v4)
  {
    v6 = objc_msgSend(v4, "pid");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v7));
    v9 = objc_msgSend(v8, "count");

    v10 = qword_10085F520;
    v11 = (unint64_t)v9 < 0x15;
    if ((unint64_t)v9 >= 0x15)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D41DC((int)v6, v10);
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138478595;
      v15 = CFSTR("Session for pid is allowed to activate");
      v16 = 1025;
      v17 = (int)v6;
      v18 = 2113;
      v19 = CFSTR("current count: ");
      v20 = 2048;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#nisessmgr,%{private}@ %{private}d %{private}@ %lu", (uint8_t *)&v14, 0x26u);
    }

  }
  else
  {
    v12 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D415C(v12);
    v11 = 0;
  }
  os_unfair_lock_unlock(p_sessionsLock);

  return v11;
}

- (id)allSessionsPrintableState
{
  NSMutableArray *v3;
  void *v4;
  NSMutableDictionary *v5;
  os_unfair_lock_s *p_sessionsLock;
  NSMutableDictionary *processMonitors;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v24;
  NSMutableArray *v25;
  _QWORD v26[4];
  NSMutableArray *v27;
  NSMutableDictionary *v28;
  _QWORD v29[4];
  NSMutableArray *v30;
  _QWORD v31[4];
  NSMutableArray *v32;
  NSMutableDictionary *v33;
  _QWORD v34[4];
  NSMutableArray *v35;
  NSMutableDictionary *v36;
  _QWORD v37[4];
  NSMutableDictionary *v38;
  NSMutableDictionary *v39;
  _QWORD v40[2];
  _QWORD v41[2];

  v3 = objc_opt_new(NSMutableArray);
  v25 = objc_opt_new(NSMutableArray);
  v4 = objc_autoreleasePoolPush();
  v24 = objc_opt_new(NSMutableDictionary);
  v5 = objc_opt_new(NSMutableDictionary);
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  processMonitors = self->_processMonitors;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100194A38;
  v37[3] = &unk_10080ACE8;
  v8 = v24;
  v38 = v8;
  v9 = v5;
  v39 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](processMonitors, "enumerateKeysAndObjectsUsingBlock:", v37);
  v10 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", self->_sessions, 1);
  v11 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", self->_observerSessions, 1);

  os_unfair_lock_unlock(p_sessionsLock);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d clients with sessions"), objc_msgSend(v10, "count"), v3, v24));
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100194B38;
  v34[3] = &unk_10080AD10;
  v13 = v3;
  v35 = v13;
  v14 = v8;
  v36 = v14;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d clients with observers"), objc_msgSend(v11, "count")));
  -[NSMutableArray addObject:](v13, "addObject:", v15);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100194C50;
  v31[3] = &unk_10080AD10;
  v16 = v13;
  v32 = v16;
  v17 = v14;
  v33 = v17;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d processes being tracked"), -[NSMutableDictionary count](v9, "count")));
  -[NSMutableArray addObject:](v16, "addObject:", v18);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100194D68;
  v29[3] = &unk_10080AD60;
  v19 = v16;
  v30 = v19;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v29);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100194E50;
  v26[3] = &unk_10080AD10;
  v20 = v25;
  v27 = v20;
  v21 = v17;
  v28 = v21;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v26);

  objc_autoreleasePoolPop(v4);
  v40[0] = CFSTR("NI Server Summary");
  v40[1] = CFSTR("NI Server Details");
  v41[0] = v19;
  v41[1] = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));

  return v22;
}

- (void)registerObserversForSession:(id)a3
{
  id v4;
  os_unfair_lock_s *p_sessionsLock;
  void *v6;
  NSMutableDictionary *observerSessions;
  id v8;
  _QWORD v9[4];
  id v10;
  NIRecentlyObservedObjectsCache *recentlyObservedObjectsCache;

  v4 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (self->_recentlyObservedObjectsCache)
  {
    recentlyObservedObjectsCache = self->_recentlyObservedObjectsCache;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &recentlyObservedObjectsCache, 1));
    objc_msgSend(v4, "addObservers:", v6);

  }
  observerSessions = self->_observerSessions;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100195374;
  v9[3] = &unk_10080ADB0;
  v8 = v4;
  v10 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](observerSessions, "enumerateKeysAndObjectsUsingBlock:", v9);

  os_unfair_lock_unlock(p_sessionsLock);
}

- (void)_startObserving:(id)a3
{
  id v4;
  NSMutableDictionary *sessions;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  sessions = self->_sessions;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100195420;
  v7[3] = &unk_10080ADB0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)_stopObserving:(id)a3
{
  id v4;
  NSMutableDictionary *sessions;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  sessions = self->_sessions;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100195630;
  v7[3] = &unk_10080ADB0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyObservedObjectsCache, 0);
  objc_storeStrong((id *)&self->_observerSessions, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_processMonitors, 0);
  objc_storeStrong((id *)&self->_authManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
