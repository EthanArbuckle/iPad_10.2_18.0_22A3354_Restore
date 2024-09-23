@implementation FMFXPCSessionManager

- (NSSet)clientSessions
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  FMFXPCSessionManager *v12;
  id v13;

  v3 = objc_alloc_init((Class)NSMutableSet);
  v4 = objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager queue](self, "queue"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10000AA0C;
  v11 = &unk_100099348;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(v4, &v8);

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return (NSSet *)v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)addClientSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AB14;
  block[3] = &unk_100099348;
  block[4] = self;
  v11 = v4;
  v13 = v11;
  dispatch_sync(v5, block);

  if (v11)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v11));
    objc_msgSend(v6, "updateSessionCaches:forSessions:pushAllData:", 0, v7, 1);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v9 = objc_msgSend(v8, "hasModelInitialized");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientProxy"));
    objc_msgSend(v10, "modelDidLoad");

  }
}

- (NSMapTable)internalClientSessions
{
  return self->_internalClientSessions;
}

- (id)_internalClientSessionPIDsString
{
  NSMutableString *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _UNKNOWN **v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *i;
  void *v14;
  void *v15;
  signed int v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  NSMutableString *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = objc_opt_new(NSMutableString);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager internalClientSessions](self, "internalClientSessions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyEnumerator"));

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    v9 = *(_QWORD *)v30;
    v10 = CFSTR("%ld");
    v11 = CFSTR(",");
    v12 = &stru_10009B948;
    v27 = v3;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "connection"));
        if (objc_msgSend(v15, "processIdentifier"))
        {
          v16 = objc_msgSend(v15, "processIdentifier");
        }
        else
        {
          v17 = v7;
          v18 = v9;
          v19 = v12;
          v20 = v11;
          v21 = v10;
          v22 = v8;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientPid"));
          v16 = objc_msgSend(v23, "intValue");

          v8 = v22;
          v10 = v21;
          v11 = v20;
          v12 = v19;
          v9 = v18;
          v7 = v17;
          v3 = v27;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[379], "stringWithFormat:", v10, v16));
        if (-[NSMutableString length](v3, "length"))
          v25 = v11;
        else
          v25 = v12;
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%@%@"), v25, v24);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)setRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_refreshTimer, a3);
}

- (void)scheduleRefreshBefore:(double)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000090C4;
  v3[3] = &unk_1000994A0;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)resetRefreshTimer
{
  -[FMFXPCSessionManager scheduleRefreshBefore:](self, "scheduleRefreshBefore:", 2147483650.0);
}

- (NSTimer)refreshTimer
{
  return self->_refreshTimer;
}

+ (id)sharedInstance
{
  if (qword_1000B3838 != -1)
    dispatch_once(&qword_1000B3838, &stru_10009AA78);
  return (id)qword_1000B3830;
}

- (FMFXPCSessionManager)init
{
  FMFXPCSessionManager *v2;
  void *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMFXPCSessionManager;
  v2 = -[FMFXPCSessionManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    -[FMFXPCSessionManager setInternalClientSessions:](v2, "setInternalClientSessions:", v3);

    v4 = dispatch_queue_create("com.apple.icloud.fmfd.xpcsessionmanager", 0);
    -[FMFXPCSessionManager setQueue:](v2, "setQueue:", v4);

    -[FMFXPCSessionManager startListeningForNotifications](v2, "startListeningForNotifications");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[FMFXPCSessionManager stopListeningForNotifications](self, "stopListeningForNotifications");
  v4.receiver = self;
  v4.super_class = (Class)FMFXPCSessionManager;
  -[FMFXPCSessionManager dealloc](&v4, "dealloc");
}

- (void)invalidateMaxCallbackTimer
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received notification FMFAccountWasRemovedNotification, invalidating timer", v5, 2u);
  }

  -[FMFXPCSessionManager stopTimer](self, "stopTimer");
}

- (void)removeClientSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EA20;
  block[3] = &unk_100099348;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)updateTrackingTimestampForHandle:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager clientSessions](self, "clientSessions"));
  v9 = objc_msgSend(v8, "copy");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v24;
    *(_QWORD *)&v12 = 138412546;
    v22 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "handles", v22, (_QWORD)v23));
        v18 = objc_msgSend(v17, "copy");

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "member:", v6));
        if (v19)
        {
          v20 = sub_100011D0C();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            v28 = v19;
            v29 = 2112;
            v30 = v16;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "updating tracking timestamp for handle: %@ in session: %@", buf, 0x16u);
          }

          objc_msgSend(v19, "setTrackingTimestamp:", v7);
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v13);
  }

}

- (void)refreshLocationsForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  -[FMFXPCSessionManager resetRefreshTimer](self, "resetRefreshTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handles"));
  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Quickly refreshing handles: %@, for session: %@", buf, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003EEA0;
  v10[3] = &unk_1000995E8;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "fetchLocationForHandles:forSession:callerId:priority:completionBlock:", v9, v4, 0, 1, v10);

}

- (void)stopTimer
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager refreshTimer](self, "refreshTimer"));

  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopping refresh timer...", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager refreshTimer](self, "refreshTimer"));
    objc_msgSend(v6, "invalidate");

    -[FMFXPCSessionManager setRefreshTimer:](self, "setRefreshTimer:", 0);
  }
}

- (id)handlesToLocate
{
  void *v3;
  id v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager clientSessions](self, "clientSessions"));
  v4 = objc_alloc_init((Class)NSMutableSet);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    *(_QWORD *)&v7 = 138412802;
    v18 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (-[FMFXPCSessionManager _isApplicationForClientSessionInForeground:](self, "_isApplicationForClientSessionInForeground:", v11, v18, (_QWORD)v19))
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "handles"));
          objc_msgSend(v4, "unionSet:", v12);
        }
        else
        {
          v13 = sub_100011D0C();
          v12 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientPid"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientBundleId"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "handles"));
            *(_DWORD *)buf = v18;
            v24 = v14;
            v25 = 2112;
            v26 = v15;
            v27 = 2112;
            v28 = v16;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not refreshing session as app pid %@ bundleID: %@ is not in the foreground for handles: %@", buf, 0x20u);

          }
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)refreshLocations
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  id v26;
  NSObject *v27;
  const char *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  NSObject *v35;
  FMFXPCSessionManager *v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Refreshing location.", buf, 2u);
  }

  -[FMFXPCSessionManager stopTimer](self, "stopTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v6 = objc_msgSend(v5, "hasModelInitialized");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager clientSessions](self, "clientSessions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager handlesToLocate](self, "handlesToLocate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFNetworkObserver sharedInstance](FMFNetworkObserver, "sharedInstance"));
    v10 = objc_msgSend(v9, "isNetworkReachable");

    v11 = objc_msgSend(v8, "count");
    v12 = sub_100011D0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11 && v10)
    {
      if (v14)
      {
        v15 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 134218242;
        v39 = v15;
        v40 = 2112;
        v41 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Refreshing due to tracking handles for %lu sessions: %@", buf, 0x16u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10003F62C;
      v34[3] = &unk_10009AAA0;
      v35 = v7;
      v36 = self;
      objc_msgSend(v16, "getLocationForHandles:forSession:callerId:priority:completionBlock:", v8, 0, 0, 0, v34);

      v13 = v35;
    }
    else
    {
      if ((v10 & 1) != 0)
      {
        if (!v14)
          goto LABEL_17;
        *(_WORD *)buf = 0;
        v19 = "No handles to refresh.";
      }
      else
      {
        if (!v14)
          goto LABEL_17;
        *(_WORD *)buf = 0;
        v19 = "Not refreshing due to no network.";
      }
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    }
LABEL_17:

    v20 = objc_alloc_init((Class)NSMutableSet);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v7;
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "handles", (_QWORD)v30));
          objc_msgSend(v20, "unionSet:", v25);

        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v22);
    }

    if (objc_msgSend(v20, "count"))
    {
      if (objc_msgSend(v8, "count"))
      {
        -[FMFXPCSessionManager scheduleRefreshBefore:](self, "scheduleRefreshBefore:", 2147483650.0);
LABEL_33:

        goto LABEL_34;
      }
      v29 = sub_100011D0C();
      v27 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v28 = "Not rescheduling refresh due no application with valid session is active";
        goto LABEL_31;
      }
    }
    else
    {
      v26 = sub_100011D0C();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v28 = "Not rescheduling refresh due to no handles in all sessions.";
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
      }
    }

    goto LABEL_33;
  }
  v17 = sub_100011D0C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Model not initialized, not scheduling refresh", buf, 2u);
  }
LABEL_34:

}

- (BOOL)_isApplicationForClientSessionInForeground:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "clientPid"));
  v4 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationInfoForPID:", objc_msgSend(v3, "intValue")));
  objc_msgSend(v4, "invalidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BKSApplicationStateAppIsFrontmostKey));
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)_modelDataDidLoad
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "hasModelInitialized");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager clientSessions](self, "clientSessions"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "clientProxy"));
          objc_msgSend(v10, "modelDidLoad");

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)startListeningForNotifications
{
  -[FMFXPCSessionManager startListeningForModelChangeNotifications](self, "startListeningForModelChangeNotifications");
}

- (void)stopListeningForNotifications
{
  -[FMFXPCSessionManager stopListeningForModelLoadNotifications](self, "stopListeningForModelLoadNotifications");
}

- (void)startListeningForModelChangeNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_modelDataDidLoad", off_1000B2FE0, 0);

}

- (void)stopListeningForModelLoadNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, off_1000B2FE0, 0);

}

- (void)networkReachabilityUpdated:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status")));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFXPCSessionManager clientSessions](self, "clientSessions"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), "clientProxy"));
        objc_msgSend(v12, "networkReachabilityUpdated:", v6);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)setInternalClientSessions:(id)a3
{
  objc_storeStrong((id *)&self->_internalClientSessions, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_internalClientSessions, 0);
}

@end
