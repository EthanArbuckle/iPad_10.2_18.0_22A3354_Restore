@implementation _SESSessionAppStateObserver

+ (id)observerWithDelegate:(id)a3
{
  id v3;
  _SESSessionAppStateObserver *v4;

  v3 = a3;
  v4 = -[_SESSessionAppStateObserver initWithDelegate:]([_SESSessionAppStateObserver alloc], "initWithDelegate:", v3);

  return v4;
}

- (_SESSessionAppStateObserver)initWithDelegate:(id)a3
{
  id v4;
  _SESSessionAppStateObserver *v5;
  _SESSessionAppStateObserver *v6;
  NSMutableSet *v7;
  NSMutableSet *connections;
  NSMutableArray *v9;
  NSMutableArray *predicates;
  RBSProcessMonitor *monitor;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SESSessionAppStateObserver;
  v5 = -[_SESSessionAppStateObserver init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_opt_new(NSMutableSet);
    connections = v6->_connections;
    v6->_connections = v7;

    v9 = objc_opt_new(NSMutableArray);
    predicates = v6->_predicates;
    v6->_predicates = v9;

    monitor = v6->_monitor;
    v6->_monitor = 0;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SESSessionAppStateObserver;
  -[_SESSessionAppStateObserver dealloc](&v3, "dealloc");
}

- (void)registerForAppStateChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableSet *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  RBSProcessMonitor *v16;
  RBSProcessMonitor *monitor;
  void *v18;
  void *v19;
  RBSProcessMonitor *v20;
  id v21;
  NSMutableArray *predicates;
  void *v23;
  void *v24;
  RBSProcessMonitor *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSMutableArray *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  _SESSessionAppStateObserver *v34;
  uint64_t v35;
  uint8_t buf[4];
  _BYTE v37[14];
  __int16 v38;
  id v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_100322F50));

  v7 = objc_msgSend(v4, "processIdentifier");
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v37 = (_DWORD)v7;
    *(_WORD *)&v37[4] = 2112;
    *(_QWORD *)&v37[6] = v6;
    v38 = 2112;
    v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Register for application state changes PID %d (%@) %@", buf, 0x1Cu);
  }

  v11 = self->_connections;
  objc_sync_enter(v11);
  v12 = -[NSMutableSet containsObject:](self->_connections, "containsObject:", v4);
  if ((_DWORD)v12)
  {
    v14 = SESDefaultLogObject(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Connection already registered", buf, 2u);
    }

  }
  else
  {
    if (!-[NSMutableSet count](self->_connections, "count"))
    {
      v16 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitor](RBSProcessMonitor, "monitor"));
      monitor = self->_monitor;
      self->_monitor = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
      objc_msgSend(v18, "setValues:", 1);
      v35 = FBSSceneVisibilityEndowmentNamespace;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
      objc_msgSend(v18, "setEndowmentNamespaces:", v19);

      v20 = self->_monitor;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10005D5C8;
      v32[3] = &unk_1003050F0;
      v21 = v18;
      v33 = v21;
      v34 = self;
      -[RBSProcessMonitor updateConfiguration:](v20, "updateConfiguration:", v32);

    }
    predicates = self->_predicates;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", v7));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", v23));
    -[NSMutableArray addObject:](predicates, "addObject:", v24);

    v25 = self->_monitor;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10005D654;
    v31[3] = &unk_100305118;
    v31[4] = self;
    v26 = -[RBSProcessMonitor updateConfiguration:](v25, "updateConfiguration:", v31);
    v28 = SESDefaultLogObject(v26, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = self->_predicates;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v37 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Current predicates %@", buf, 0xCu);
    }

    -[NSMutableSet addObject:](self->_connections, "addObject:", v4);
  }
  objc_sync_exit(v11);

}

- (void)unregisterForAppStateChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableSet *v11;
  id v12;
  uint64_t v13;
  NSMutableArray *predicates;
  void *v15;
  void *v16;
  RBSProcessMonitor *monitor;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSMutableArray *v22;
  RBSProcessMonitor *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  _BYTE v28[14];
  __int16 v29;
  id v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_100322F50));

  v7 = objc_msgSend(v4, "processIdentifier");
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = (_DWORD)v7;
    *(_WORD *)&v28[4] = 2112;
    *(_QWORD *)&v28[6] = v6;
    v29 = 2112;
    v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Unregister for application state changes PID %d (%@) %@", buf, 0x1Cu);
  }

  v11 = self->_connections;
  objc_sync_enter(v11);
  v12 = -[NSMutableSet containsObject:](self->_connections, "containsObject:", v4);
  if ((v12 & 1) != 0)
  {
    predicates = self->_predicates;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", v7));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", v15));
    -[NSMutableArray removeObject:](predicates, "removeObject:", v16);

    monitor = self->_monitor;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10005D910;
    v26[3] = &unk_100305118;
    v26[4] = self;
    v18 = -[RBSProcessMonitor updateConfiguration:](monitor, "updateConfiguration:", v26);
    v20 = SESDefaultLogObject(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = self->_predicates;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Current predicates %@", buf, 0xCu);
    }

    -[NSMutableSet removeObject:](self->_connections, "removeObject:", v4);
    if (!-[NSMutableSet count](self->_connections, "count"))
    {
      -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
      v23 = self->_monitor;
      self->_monitor = 0;

    }
  }
  else
  {
    v24 = SESDefaultLogObject(v12, v13);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Connection not registered", buf, 2u);
    }

  }
  objc_sync_exit(v11);

}

- (void)applicationStateChanged:(id)a3 stateUpdate:(id)a4
{
  NSMutableSet *v6;
  NSMutableSet *connections;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  SESSessionAppStateObserverDelegate **p_delegate;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id WeakRetained;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  id v34;
  char v35;
  id v36;
  id v37;
  int v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  int v45;
  uint8_t v46[128];
  uint8_t buf[4];
  int v48;
  __int16 v49;
  void *v50;

  v36 = a3;
  v37 = a4;
  LODWORD(a4) = objc_msgSend(v36, "pid");
  v6 = self->_connections;
  objc_sync_enter(v6);
  connections = self->_connections;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10005DCEC;
  v44[3] = &unk_100305138;
  v38 = (int)a4;
  v45 = (int)a4;
  v8 = Filter(connections, v44);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_sync_exit(v6);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "state"));
  v10 = objc_msgSend(v39, "taskState");
  v11 = (int)v10;
  v13 = SESDefaultLogObject(v10, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v48 = v11;
    v49 = 2112;
    v50 = v39;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "applicationStateChanged currentTaskState %d state \n%@ ", buf, 0x12u);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  v18 = v16;
  if (v16)
  {
    v19 = *(_QWORD *)v41;
    v20 = FBSSceneVisibilityEndowmentNamespace;
    p_delegate = &self->_delegate;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v15);
        v23 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v22);
        if (v11 != 4)
        {
          if (v11 != 3)
            goto LABEL_22;
          v24 = SESDefaultLogObject(v16, v17);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            v48 = v38;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "The application with PID %d has been suspended", buf, 8u);
          }

          WeakRetained = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend(WeakRetained, "didAppGetSuspended:", v23);
          goto LABEL_21;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "endowmentNamespaces"));
        v28 = objc_msgSend(v27, "containsObject:", v20);

        v31 = SESDefaultLogObject(v29, v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
        if (!v28)
        {
          if (v33)
          {
            *(_DWORD *)buf = 67109120;
            v48 = v38;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "The application with PID %d has entered the background", buf, 8u);
          }

          WeakRetained = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend(WeakRetained, "didAppEnterBackground:", v23);
          goto LABEL_21;
        }
        if (v33)
        {
          *(_DWORD *)buf = 67109120;
          v48 = v38;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "The application with PID %d has entered the foreground", buf, 8u);
        }

        v34 = objc_loadWeakRetained((id *)p_delegate);
        v35 = objc_opt_respondsToSelector(v34, "didAppEnterForeground:");

        if ((v35 & 1) != 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend(WeakRetained, "didAppEnterForeground:", v23);
LABEL_21:

        }
LABEL_22:
        v22 = (char *)v22 + 1;
      }
      while (v18 != v22);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      v18 = v16;
    }
    while (v16);
  }

}

- (BOOL)isAppBackgroundedOrSuspended:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  id v36;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", &off_100322F50));

  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v5;
    v35 = 2112;
    v36 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Checking if client is backgrounded or suspended (%@) %@", buf, 0x16u);
  }

  if (v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "processIdentifier")));
    v32 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v12, &v32));
    v14 = v32;

    if (v14 || !v13)
    {
      v27 = SESDefaultLogObject(v15, v16);
      v17 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to get process handle %@", buf, 0xCu);
      }
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentState"));
      if (-[NSObject taskState](v17, "taskState") == 4)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject endowmentNamespaces](v17, "endowmentNamespaces"));
        v19 = objc_msgSend(v18, "containsObject:", FBSSceneVisibilityEndowmentNamespace);

        if ((v19 & 1) == 0)
        {
          v22 = SESDefaultLogObject(v20, v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v24 = "Client is backgrounded";
LABEL_18:
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, buf, 2u);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else
      {
        v28 = -[NSObject taskState](v17, "taskState");
        if ((_DWORD)v28 == 3)
        {
          v30 = SESDefaultLogObject(v28, v29);
          v23 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v24 = "Client is suspended";
            goto LABEL_18;
          }
LABEL_19:

          v26 = 1;
LABEL_21:

          goto LABEL_22;
        }
      }
    }
    v26 = 0;
    goto LABEL_21;
  }
  v25 = SESDefaultLogObject(v10, v11);
  v14 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Connection is nil", buf, 2u);
  }
  v26 = 0;
LABEL_22:

  return v26;
}

- (id)dumpState
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableSet *v13;
  NSMutableSet *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  NSMutableArray *v20;
  _BYTE v21[128];

  v3 = objc_opt_new(NSMutableArray);
  v13 = self->_connections;
  objc_sync_enter(v13);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_connections;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", &off_100322F50));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connection %p client %@"), v7, v9));
        -[NSMutableArray addObject:](v3, "addObject:", v10);

      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v4);
  }

  objc_sync_exit(v13);
  v19 = CFSTR("observedConnections");
  v20 = v3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  return v11;
}

- (SESSessionAppStateObserverDelegate)delegate
{
  return (SESSessionAppStateObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RBSProcessMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (NSMutableArray)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_predicates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
