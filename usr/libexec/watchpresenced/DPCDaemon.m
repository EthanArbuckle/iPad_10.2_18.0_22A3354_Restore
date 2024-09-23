@implementation DPCDaemon

+ (id)sharedInstance
{
  if (qword_100012ED8 != -1)
    dispatch_once(&qword_100012ED8, &stru_10000C580);
  return (id)qword_100012EE0;
}

- (DPCDaemon)init
{
  DPCDaemon *v2;
  NSLock *v3;
  NSLock *connectionLock;
  DPCWatchPresenceDetector *v5;
  DPCWatchPresenceDetector *detector;
  uint64_t v7;
  DPCTelemetry *telemetry;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DPCDaemon;
  v2 = -[DPCDaemon init](&v10, "init");
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = v3;

    v5 = objc_alloc_init(DPCWatchPresenceDetector);
    detector = v2->_detector;
    v2->_detector = v5;

    -[DPCDaemon _setupXPCListener](v2, "_setupXPCListener");
    v7 = objc_claimAutoreleasedReturnValue(+[DPCTelemetry sharedInstance](DPCTelemetry, "sharedInstance"));
    telemetry = v2->_telemetry;
    v2->_telemetry = (DPCTelemetry *)v7;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[DPCDaemon shutdownTheDetection](self, "shutdownTheDetection");
  v3.receiver = self;
  v3.super_class = (Class)DPCDaemon;
  -[DPCDaemon dealloc](&v3, "dealloc");
}

- (void)_setupXPCListener
{
  NSXPCListener *v3;
  NSXPCListener *listener;
  NSXPCListener *v5;
  id v6;
  NSObject *v7;
  NSMutableArray *v8;
  NSMutableArray *connections;
  uint8_t v10[16];

  v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.watchpresenced"));
  listener = self->_listener;
  self->_listener = v3;

  v5 = self->_listener;
  if (!v5)
  {
    v6 = sub_100002F3C((uint64_t)off_100012CB8);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "XPC Listener failed", v10, 2u);
    }

    v5 = self->_listener;
  }
  -[NSXPCListener setDelegate:](v5, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  connections = self->_connections;
  self->_connections = v8;

}

- (unint64_t)startTheDetection
{
  unint64_t v3;

  v3 = -[DPCWatchPresenceDetector prestartCheck](self->_detector, "prestartCheck");
  if (!v3)
  {
    self->_currentWatchPresenceType = 1;
    -[DPCWatchPresenceDetector start](self->_detector, "start");
  }
  return v3;
}

- (void)shutdownTheDetection
{
  id v3;
  NSObject *v4;
  OS_os_transaction *transaction;
  uint8_t v6[16];

  v3 = sub_100002F3C((uint64_t)off_100012CB8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Shutting down watchpresenced", v6, 2u);
  }

  -[DPCWatchPresenceDetector resetAll](self->_detector, "resetAll");
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (BOOL)checkIfShouldShutdown
{
  return -[NSMutableArray count](self->_connections, "count") == 0;
}

- (void)notifyNewEvents:(unint64_t)a3 probability:(float)a4
{
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  -[NSLock lock](self->_connectionLock, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_connections;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "remoteObjectProxy", (_QWORD)v14));
        *(float *)&v13 = a4;
        objc_msgSend(v12, "newWatchPresenceEvent:probability:", a3, v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[NSLock unlock](self->_connectionLock, "unlock");
}

- (void)notifyNewWatchStatusEvents:(unint64_t)a3
{
  NSMutableArray *v5;
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

  -[NSLock lock](self->_connectionLock, "lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_connections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "remoteObjectProxy", (_QWORD)v11));
        objc_msgSend(v10, "newWatchStatusEvent:", a3);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[NSLock unlock](self->_connectionLock, "unlock");
}

- (void)forceNotifyNewEvents:(unint64_t)a3 probability:(float)a4
{
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  -[NSLock lock](self->_connectionLock, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_connections;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "remoteObjectProxy", (_QWORD)v14));
        *(float *)&v13 = a4;
        objc_msgSend(v12, "newWatchPresenceEvent:probability:", a3, v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[NSLock unlock](self->_connectionLock, "unlock");
}

- (void)notifyConnection:(id)a3 withError:(unint64_t)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  unint64_t v11;

  v5 = a3;
  v6 = sub_100002F3C((uint64_t)off_100012CB8);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = objc_msgSend(v5, "processIdentifier");
    v10 = 2048;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notifying connection %d with Error %lu", (uint8_t *)v9, 0x12u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxy"));
  objc_msgSend(v8, "newErrorDetected:", a4);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  id buf;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = sub_100002F3C((uint64_t)off_100012CB8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = objc_msgSend(v7, "processIdentifier");
    v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Watchpresenced received a new connection request from %d, connection: %@", (uint8_t *)&buf, 0x12u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DPCXPCInterface));
  objc_msgSend(v7, "setExportedInterface:", v10);

  objc_msgSend(v7, "setExportedObject:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DPCXPCClientInterface));
  objc_msgSend(v7, "setRemoteObjectInterface:", v11);

  objc_initWeak(&buf, self);
  objc_initWeak(&location, v7);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000039F8;
  v16[3] = &unk_10000C5A8;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &buf);
  objc_msgSend(v7, "setInvalidationHandler:", v16);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003B10;
  v13[3] = &unk_10000C5A8;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &buf);
  objc_msgSend(v7, "setInterruptionHandler:", v13);
  -[NSLock lock](self->_connectionLock, "lock");
  -[NSMutableArray addObject:](self->_connections, "addObject:", v7);
  -[NSLock unlock](self->_connectionLock, "unlock");
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&buf);

  return 1;
}

- (void)getCurrentWatchPresenceStatus
{
  double v2;

  LODWORD(v2) = 1065185444;
  -[DPCDaemon notifyNewEvents:probability:](self, "notifyNewEvents:probability:", self->_currentWatchPresenceType, v2);
}

- (void)startWatchPresenceDetection
{
  DPCDaemon *v2;
  uint64_t v3;
  OS_os_transaction *transaction;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_transaction)
  {
    v3 = os_transaction_create("com.apple.watchpresenced");
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v3;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = sub_100002F3C((uint64_t)off_100012CB8);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[start] command received from connection %@, going to start...", (uint8_t *)&v9, 0xCu);
  }

  if (-[NSMutableArray count](v2->_connections, "count") == (id)1)
  {
    v8 = -[DPCDaemon startTheDetection](v2, "startTheDetection");
    if (v8)
    {
      if (v8 == (id)2)
        -[DPCDaemon notifyNewWatchStatusEvents:](v2, "notifyNewWatchStatusEvents:", 5);
      else
        -[DPCDaemon notifyConnection:withError:](v2, "notifyConnection:withError:", v5, v8);
    }
  }

  objc_sync_exit(v2);
}

- (void)stopWatchPresenceDetection
{
  DPCDaemon *v2;
  void *v3;
  id v4;
  NSObject *v5;
  int v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v4 = sub_100002F3C((uint64_t)off_100012CB8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[stop] command received from connection %@, going to stop...", (uint8_t *)&v6, 0xCu);
  }

  if (-[DPCDaemon checkIfShouldShutdown](v2, "checkIfShouldShutdown"))
    -[DPCDaemon shutdownTheDetection](v2, "shutdownTheDetection");

  objc_sync_exit(v2);
}

- (void)setupWatchPresenceDetection
{
  DPCDaemon *v2;
  _QWORD block[5];
  id v4;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  objc_initWeak(&location, v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003F74;
  block[3] = &unk_10000C5F8;
  block[4] = v2;
  objc_copyWeak(&v4, &location);
  if (qword_100012EE8 != -1)
    dispatch_once(&qword_100012EE8, block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  objc_sync_exit(v2);

}

- (void)setCurrentWatchPresenceStatus:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  double v8;
  int v9;
  const __CFString *v10;

  v5 = sub_100002F3C((uint64_t)off_100012CB8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("Unknown");
    if (a3 == 1)
      v7 = CFSTR("Presence");
    if (a3 == 2)
      v7 = CFSTR("Absence");
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "received a testtool set status command: going to set to type %@...", (uint8_t *)&v9, 0xCu);
  }

  self->_currentWatchPresenceType = a3;
  LODWORD(v8) = 1065185444;
  -[DPCDaemon forceNotifyNewEvents:probability:](self, "forceNotifyNewEvents:probability:", a3, v8);
}

- (void)setStreamingMode:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;

  v3 = a3;
  v5 = sub_100002F3C((uint64_t)off_100012CB8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("disable");
    if (v3)
      v7 = CFSTR("enable");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Going to %@ streaming mode", (uint8_t *)&v8, 0xCu);
  }

  -[DPCWatchPresenceDetector setEnabledStreamingMode:](self->_detector, "setEnabledStreamingMode:", v3);
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (unint64_t)currentWatchPresenceType
{
  return self->_currentWatchPresenceType;
}

- (void)setCurrentWatchPresenceType:(unint64_t)a3
{
  self->_currentWatchPresenceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_storeStrong((id *)&self->_detector, 0);
}

@end
