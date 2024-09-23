@implementation KeyManagementLibrary

+ (id)sharedLibrary
{
  if (qword_1003548E8 != -1)
    dispatch_once(&qword_1003548E8, &stru_10030F1D8);
  return (id)qword_1003548E0;
}

- (KeyManagementLibrary)init
{
  KeyManagementLibrary *v2;
  KeyManagementLibrary *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *kmlMainQueue;
  uint64_t v8;
  NSMutableArray *sessions;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)KeyManagementLibrary;
  v2 = -[KeyManagementLibrary init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_isRunning = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.sesd.kml", v5);
    kmlMainQueue = v3->_kmlMainQueue;
    v3->_kmlMainQueue = (OS_dispatch_queue *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    sessions = v3->_sessions;
    v3->_sessions = (NSMutableArray *)v8;

    if (!v3->_kmlMainQueue || !v3->_sessions)
    {

      return 0;
    }
  }
  return v3;
}

- (void)startService
{
  -[KeyManagementLibrary startServiceWithMachName:](self, "startServiceWithMachName:", CFSTR("com.apple.seserviced.kmlXpcService"));
}

- (void)startServiceWithMachName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  OS_dispatch_queue *kmlMainQueue;
  NSXPCListener *v12;
  NSXPCListener *kmlListener;
  KmlClientAppStateObserver *v14;
  KmlClientAppStateObserver *appObserver;
  uint64_t v16;
  _QWORD v17[5];

  v4 = a3;
  if (-[KeyManagementLibrary isRunning](self, "isRunning"))
  {
    v9 = CFSTR("KML: service already running.");
    v10 = 77;
  }
  else
  {
    kmlMainQueue = self->_kmlMainQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100232D70;
    v17[3] = &unk_100302AC8;
    v17[4] = self;
    os_state_add_handler(kmlMainQueue, v17);
    v12 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", v4);
    kmlListener = self->_kmlListener;
    self->_kmlListener = v12;

    -[NSXPCListener setDelegate:](self->_kmlListener, "setDelegate:", self);
    v14 = (KmlClientAppStateObserver *)sub_10023FD8C([KmlClientAppStateObserver alloc], self);
    appObserver = self->_appObserver;
    self->_appObserver = v14;

    -[NSXPCListener resume](self->_kmlListener, "resume");
    self->_isRunning = 1;
    v16 = (uint64_t)v4;
    v9 = CFSTR("Service %@ running");
    v10 = 93;
  }
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary startServiceWithMachName:]", v10, v9, v5, v6, v7, v8, v16);

}

- (void)handleFirstUnlock
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  KmlSharingTransport *v8;
  KmlSharingTransport *idsListener;
  uint64_t v10;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary handleFirstUnlock]", 98, &stru_100316BD0, v2, v3, v4, v5, v10);
  v7 = sub_1002342C4((uint64_t)KmlSharingTransport);
  v8 = (KmlSharingTransport *)objc_claimAutoreleasedReturnValue(v7);
  idsListener = self->_idsListener;
  self->_idsListener = v8;

  sub_10025535C((uint64_t)KmlEndpointManager);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)stopService
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  KmlSharingTransport *idsListener;
  NSXPCListener *kmlListener;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_isRunning)
  {
    idsListener = self->_idsListener;
    self->_idsListener = 0;

    -[NSXPCListener invalidate](self->_kmlListener, "invalidate");
    -[NSXPCListener setDelegate:](self->_kmlListener, "setDelegate:", 0);
    kmlListener = self->_kmlListener;
    self->_kmlListener = 0;

    self->_isRunning = 0;
    v9 = CFSTR("XPC service stopped");
    v10 = 121;
  }
  else
  {
    v9 = CFSTR("KML: service is not running.");
    v10 = 111;
  }
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary stopService]", v10, v9, v2, v3, v4, v5, v11);
}

- (void)addNewSession:(id)a3 firstInQueue:(BOOL *)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *kmlMainQueue;
  _QWORD block[5];

  v6 = a3;
  v7 = self->_sessions;
  objc_sync_enter(v7);
  if (a4)
    *a4 = -[NSMutableArray count](self->_sessions, "count") == 0;
  -[NSMutableArray addObject:](self->_sessions, "addObject:", v6);
  v8 = -[NSMutableArray count](self->_sessions, "count");
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KeyManagementLibrary addNewSession:firstInQueue:]", 132, CFSTR("Add new seesion : #sessions = %u"), v9, v10, v11, v12, (uint64_t)v8);
  objc_sync_exit(v7);

  kmlMainQueue = self->_kmlMainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100233124;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(kmlMainQueue, block);

}

- (void)removeSession:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  KmlSession *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  KmlSession *currentSession;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *kmlMainQueue;
  uint64_t v29;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = (KmlSession *)v6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KeyManagementLibrary removeSession:withError:]", 143, CFSTR("%@"), v9, v10, v11, v12, (uint64_t)v8);
  -[KmlSession stopWithError:](v8, "stopWithError:", v7);
  v13 = sub_1002374D0((id *)&v8->super.isa);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
  objc_msgSend(v16, "removeObject:", v8);
  v17 = self->_sessions;
  objc_sync_enter(v17);
  -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v8);
  if (self->_currentSession == v8)
  {
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KeyManagementLibrary removeSession:withError:]", 155, CFSTR("clearing current session"), v18, v19, v20, v21, v29);
    currentSession = self->_currentSession;
    self->_currentSession = 0;

  }
  v23 = -[NSMutableArray count](self->_sessions, "count");
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary removeSession:withError:]", 159, CFSTR(" sessions = %u"), v24, v25, v26, v27, (uint64_t)v23);
  objc_sync_exit(v17);

  kmlMainQueue = self->_kmlMainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002332D4;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(kmlMainQueue, block);

}

- (void)startNextSession
{
  KmlSession *currentSession;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  KmlSession *v13;
  KmlSession *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *obj;

  obj = self->_sessions;
  objc_sync_enter(obj);
  currentSession = self->_currentSession;
  if (currentSession)
    goto LABEL_2;
  if (-[NSMutableArray count](self->_sessions, "count"))
  {
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KeyManagementLibrary startNextSession]", 171, CFSTR("Dequeuing next session"), v9, v10, v11, v12, v19);
    v13 = (KmlSession *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_sessions, "objectAtIndex:", 0));
    v14 = self->_currentSession;
    self->_currentSession = v13;

    -[NSMutableArray removeObjectAtIndex:](self->_sessions, "removeObjectAtIndex:", 0);
    -[KmlSession start](self->_currentSession, "start");
    goto LABEL_5;
  }
  currentSession = self->_currentSession;
  if (currentSession)
  {
LABEL_2:
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KmlSession clientName](currentSession, "clientName"));
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary startNextSession]", 177, CFSTR("Session (by %@) already in progress"), v5, v6, v7, v8, (uint64_t)v4);

  }
  else if (!-[NSMutableArray count](self->_sessions, "count"))
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary startNextSession]", 180, CFSTR("No Sessions queued"), v15, v16, v17, v18, v19);
  }
LABEL_5:
  objc_sync_exit(obj);

}

- (unsigned)numberOfPairingSessionsQueued
{
  NSMutableArray *v3;
  KmlSession *currentSession;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  NSMutableArray *v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = self->_sessions;
  objc_sync_enter(v3);
  currentSession = self->_currentSession;
  if (currentSession
    && (v5 = objc_opt_class(KmlOwnerPairingSession), (objc_opt_isKindOfClass(currentSession, v5) & 1) != 0))
  {
    v10 = 1;
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary numberOfPairingSessionsQueued]", 191, CFSTR("Current session is pairing session"), v6, v7, v8, v9, v26);
  }
  else
  {
    v10 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = self->_sessions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(KmlOwnerPairingSession);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary numberOfPairingSessionsQueued]", 198, CFSTR("A pairing session is already in queue"), v17, v18, v19, v20, v26);
          ++v10;
        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  objc_sync_exit(v3);
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary numberOfPairingSessionsQueued]", 204, CFSTR("Number of pairing sessions in queue : %u"), v21, v22, v23, v24, v10);
  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  KmlXpcService *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id from;
  id location;
  _OWORD buffer[16];

  v6 = a3;
  v7 = a4;
  memset(buffer, 0, 255);
  proc_name((int)objc_msgSend(v7, "processIdentifier"), buffer, 0xFEu);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer));
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 239, CFSTR("New Client: %s"), v9, v10, v11, v12, (uint64_t)buffer);
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 240, CFSTR("New client request from :%@"), v13, v14, v15, v16, (uint64_t)v8);
  v17 = sub_100237E20([KmlEntitlementChecker alloc], v7);
  if (!sub_10004C5C8((_BOOL8)v17))
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 245, CFSTR("Entitlement for XPC not found"), v18, v19, v20, v21, v45);
    goto LABEL_5;
  }
  if (!sub_1002408D0((uint64_t)self->_appObserver, v7))
  {
    v27 = sub_100240A48((uint64_t)self->_appObserver, v7);
    if (v27 == 4279897)
    {
      v36 = 1;
    }
    else
    {
      if (v27 != 1)
      {
        v36 = 0;
        v37 = 0;
        goto LABEL_13;
      }
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 256, CFSTR("Client (%s) is in background"), v28, v29, v30, v31, (uint64_t)buffer);
      if (!sub_10023801C((_BOOL8)v17))
      {
        KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 258, CFSTR("Can not allow this connection to resume"), v32, v33, v34, v35, v46);
        goto LABEL_5;
      }
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 261, CFSTR("But it has entitlement to continue."), v32, v33, v34, v35, v46);
      v36 = 0;
    }
    v37 = 1;
LABEL_13:
    v47 = objc_opt_new(KmlXpcService);
    sub_10021395C(v47, (char *)self->_kmlMainQueue);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[KmlManagerInterface interface](KmlManagerInterface, "interface"));
    objc_msgSend(v7, "setExportedInterface:", v38);

    objc_msgSend(v7, "setExportedObject:", v47);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___KmlManagerCallbacks));
    objc_msgSend(v7, "setRemoteObjectInterface:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v40, CFSTR("ProxyObjects")));

    objc_msgSend(v41, "setObject:forKeyedSubscript:", v8, CFSTR("ClientName"));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v17, CFSTR("Entitlements"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v37));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, CFSTR("BackGroundClient"));

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v36));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, CFSTR("ClientIsDaemon"));

    objc_msgSend(v7, "setUserInfo:", v41);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100233D1C;
    v51[3] = &unk_10030F220;
    objc_copyWeak(&v52, &from);
    objc_copyWeak(&v53, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v51);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100233D68;
    v48[3] = &unk_10030F220;
    objc_copyWeak(&v49, &from);
    objc_copyWeak(&v50, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v48);
    sub_100240430((uint64_t)self->_appObserver, v7);
    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v50);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&v53);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    v26 = 1;
    goto LABEL_14;
  }
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 250, CFSTR("Client (%s) is suspended. Reject connection"), v22, v23, v24, v25, (uint64_t)buffer);
LABEL_5:
  v26 = 0;
LABEL_14:

  return v26;
}

- (void)clientAppIsSuspended:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *kmlMainQueue;
  uint64_t v19;
  _QWORD block[4];
  id v21;
  _OWORD buffer[16];

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    memset(buffer, 0, 255);
    proc_name((int)objc_msgSend(v4, "processIdentifier"), buffer, 0xFEu);
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsSuspended:]", 347, &stru_100316BD0, v10, v11, v12, v13, v19);
    if (sub_1002408D0((uint64_t)self->_appObserver, v9))
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsSuspended:]", 351, CFSTR("Client (%s) is suspended"), v14, v15, v16, v17, (uint64_t)buffer);
      sub_1002406DC((uint64_t)self->_appObserver, v9);
      kmlMainQueue = self->_kmlMainQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100233F24;
      block[3] = &unk_100302AA0;
      v21 = v9;
      dispatch_async(kmlMainQueue, block);

    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsSuspended:]", 340, CFSTR("connection is nil"), v5, v6, v7, v8, v19);
  }

}

- (void)clientAppIsBackGrounded:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *kmlMainQueue;
  uint64_t v11[4];
  id v12;
  KeyManagementLibrary *v13;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    kmlMainQueue = self->_kmlMainQueue;
    v11[0] = (uint64_t)_NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = (uint64_t)sub_100233FD4;
    v11[3] = (uint64_t)&unk_100304370;
    v12 = v4;
    v13 = self;
    dispatch_async(kmlMainQueue, v11);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsBackGrounded:]", 367, CFSTR("connection is nil"), v5, v6, v7, v8, v11[0]);
  }

}

- (void)clientAppIsForeGrounded:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *kmlMainQueue;
  uint64_t v11[4];
  id v12;
  KeyManagementLibrary *v13;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    kmlMainQueue = self->_kmlMainQueue;
    v11[0] = (uint64_t)_NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = (uint64_t)sub_100234160;
    v11[3] = (uint64_t)&unk_100304370;
    v12 = v4;
    v13 = self;
    dispatch_async(kmlMainQueue, v11);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsForeGrounded:]", 392, CFSTR("connection is nil"), v5, v6, v7, v8, v11[0]);
  }

}

- (void)appletLockStateDidChange:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;
  id v9;

  v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary appletLockStateDidChange:]", 407, CFSTR("%d"), v3, v4, v5, v6, a3);
  v8 = sub_10023E06C((uint64_t)KmlSharingManager);
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setAppletLockState:", v7);

}

- (OS_dispatch_queue)kmlMainQueue
{
  return self->_kmlMainQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kmlMainQueue, 0);
  objc_storeStrong((id *)&self->_idsListener, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_appObserver, 0);
  objc_storeStrong((id *)&self->_kmlListener, 0);
}

@end
