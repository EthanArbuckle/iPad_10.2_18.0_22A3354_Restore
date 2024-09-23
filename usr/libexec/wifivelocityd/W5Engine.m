@implementation W5Engine

- (W5Engine)init
{
  W5Engine *v2;
  NSObject *v3;
  NSMutableArray *v4;
  W5StatusManager *v5;
  W5PeerDiagnosticsManager *v6;
  W5DiagnosticsManager *v7;
  W5UserNotificationManager *v8;
  W5BGTaskManager *v9;
  W5WiFiSniffManager *v10;
  W5FileTransferManager *v11;
  W5NetUsageManager *v12;
  W5PeerManager *v13;
  W5LogManager *v14;
  W5DiagnosticsModeManager *v15;
  W5DebugManager *v16;
  W5WiFiConnectionMonitor *v17;
  W5WiFiPerfLoggingManager *v18;
  W5FaultEventManager *v19;
  W5DatabaseManager *v20;
  NSXPCListener *v21;
  NSObject *v23;
  const char *v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v25.receiver = self;
  v25.super_class = (Class)W5Engine;
  v2 = -[W5Engine init](&v25, "init");
  if (!v2)
    goto LABEL_72;
  v3 = dispatch_queue_create("com.apple.wifivelocity.engine", 0);
  v2->_queue = (OS_dispatch_queue *)v3;
  if (!v3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil disaptch_queue";
LABEL_71:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
    goto LABEL_72;
  }
  dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0);
  v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v2->_xpcConnections = v4;
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil XPC Connections List";
    goto LABEL_71;
  }
  v5 = objc_alloc_init(W5StatusManager);
  v2->_status = v5;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5StatusManager";
    goto LABEL_71;
  }
  if ((_os_feature_enabled_impl("WiFiVelocity", "PeerDiagnostics") & 1) != 0
    || _os_feature_enabled_impl("WiFiVelocity", "PeerTypes"))
  {
    v6 = -[W5PeerDiagnosticsManager initWithStatusManager:]([W5PeerDiagnosticsManager alloc], "initWithStatusManager:", v2->_status);
    v2->_peerDiagnostics = v6;
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "nil W5StatusManager";
        goto LABEL_71;
      }
      goto LABEL_72;
    }
  }
  else
  {
    v23 = sub_10008F56C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[W5Engine init]";
      v28 = 2080;
      v29 = "W5Engine.m";
      v30 = 1024;
      v31 = 134;
      LODWORD(v24) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v23, 0, "[wifivelocity] %s (%s:%u) PeerDiagnostics disabled via feature flags", (const char *)buf, v24, LODWORD(v25.receiver));
    }
  }
  v7 = -[W5DiagnosticsManager initWithStatusManager:peerDiagnosticsManager:]([W5DiagnosticsManager alloc], "initWithStatusManager:peerDiagnosticsManager:", v2->_status, v2->_peerDiagnostics);
  v2->_diagnostics = v7;
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5DiagnosticsManager";
    goto LABEL_71;
  }
  v8 = objc_alloc_init(W5UserNotificationManager);
  v2->_notificationManager = v8;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5UserNotificationManager";
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
  }
  if (+[W5FeatureAvailability diagnosticsModeEnabled](W5FeatureAvailability, "diagnosticsModeEnabled"))
  {
    v9 = objc_alloc_init(W5BGTaskManager);
    v2->_bgTaskManager = v9;
    if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "nil W5BGTaskManager";
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
    }
  }
  v10 = -[W5WiFiSniffManager initWithStatusManager:andUserNotificationManager:]([W5WiFiSniffManager alloc], "initWithStatusManager:andUserNotificationManager:", v2->_status, v2->_notificationManager);
  v2->_sniff = v10;
  if (!v10)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5StatusManager";
    goto LABEL_71;
  }
  v11 = objc_alloc_init(W5FileTransferManager);
  v2->_transferManager = v11;
  if (!v11)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5FileTransferManager";
    goto LABEL_71;
  }
  v12 = objc_alloc_init(W5NetUsageManager);
  v2->_netUsageManager = v12;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5NetUsageManager";
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
  }
  v13 = objc_alloc_init(W5PeerManager);
  v2->_peerManager = v13;
  if (!v13)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5PeerManager";
    goto LABEL_71;
  }
  v14 = -[W5LogManager initWithStatusManager:diagnosticsManager:peerDiagnosticsManager:]([W5LogManager alloc], "initWithStatusManager:diagnosticsManager:peerDiagnosticsManager:", v2->_status, v2->_diagnostics, v2->_peerDiagnostics);
  v2->_log = v14;
  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5LogManager";
    goto LABEL_71;
  }
  v15 = -[W5DiagnosticsModeManager initWithNetUsageManager:peerManager:userNotificationManager:snifferManager:statusManager:logManager:]([W5DiagnosticsModeManager alloc], "initWithNetUsageManager:peerManager:userNotificationManager:snifferManager:statusManager:logManager:", v2->_netUsageManager, v2->_peerManager, v2->_notificationManager, v2->_sniff, v2->_status, v2->_log);
  v2->_diagnosticsModeManager = v15;
  if (!v15)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5DiagnosticsModeManager";
    goto LABEL_71;
  }
  v16 = -[W5DebugManager initWithDiagnosticsModeManager:statusManager:]([W5DebugManager alloc], "initWithDiagnosticsModeManager:statusManager:", v2->_diagnosticsModeManager, v2->_status);
  v2->_debug = v16;
  if (!v16)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5DebugManager";
    goto LABEL_71;
  }
  v17 = -[W5WiFiConnectionMonitor initWithStatusManager:diagnosticsManager:]([W5WiFiConnectionMonitor alloc], "initWithStatusManager:diagnosticsManager:", v2->_status, v2->_diagnostics);
  v2->_monitor = v17;
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5WiFiConnectionMonitor";
    goto LABEL_71;
  }
  v18 = -[W5WiFiPerfLoggingManager initWithStatusManager:]([W5WiFiPerfLoggingManager alloc], "initWithStatusManager:", v2->_status);
  v2->_wifiperf = v18;
  if (!v18)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5WiFiPerfLoggingManager";
    goto LABEL_71;
  }
  v19 = -[W5FaultEventManager initWithPeerManager:diagnosticsModeManager:]([W5FaultEventManager alloc], "initWithPeerManager:diagnosticsModeManager:", v2->_peerManager, v2->_diagnosticsModeManager);
  v2->_faultEventManager = v19;
  if (!v19)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5FaultEventManager";
    goto LABEL_71;
  }
  -[W5FaultEventManager setLocalPeer:](v2->_faultEventManager, "setLocalPeer:", -[W5Engine __localPeer](v2, "__localPeer"));
  -[W5DiagnosticsModeManager setLocalPeer:](v2->_diagnosticsModeManager, "setLocalPeer:", -[W5Engine __localPeer](v2, "__localPeer"));
  -[W5DiagnosticsModeManager setFaultEventManager:](v2->_diagnosticsModeManager, "setFaultEventManager:", v2->_faultEventManager);
  -[W5StatusManager setDiagnosticsModeManager:](v2->_status, "setDiagnosticsModeManager:", v2->_diagnosticsModeManager);
  if (+[W5FeatureAvailability diagnosticsModeEnabled](W5FeatureAvailability, "diagnosticsModeEnabled"))
  {
    v20 = +[W5DatabaseManager sharedObject](W5DatabaseManager, "sharedObject");
    v2->_databaseManager = v20;
    if (!v20)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "nil _databaseManager";
        goto LABEL_71;
      }
      goto LABEL_72;
    }
  }
  v21 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.wifivelocityd"));
  v2->_listener = v21;
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "nil NSXPCListener";
      goto LABEL_71;
    }
LABEL_72:

    return 0;
  }
  if (!-[W5PeerManager registerPeerListeners:](v2->_peerManager, "registerPeerListeners:", -[W5Engine _peerListeners](v2, "_peerListeners"))&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "Failed to register peer listeners";
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
  }
  -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
  if (v2->_bgTaskManager)
    -[W5Engine _scheduleRepeatingCleanupTasks](v2, "_scheduleRepeatingCleanupTasks");
  return v2;
}

- (void)dealloc
{
  W5UserNotificationManager *notificationManager;
  NSObject *queue;
  OS_os_transaction *isMonitoringTransaction;
  OS_os_transaction *isMonitoringConnectionTransaction;
  W5BGTaskManager *bgTaskManager;
  objc_super v8;

  notificationManager = self->_notificationManager;
  if (notificationManager)

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  isMonitoringTransaction = self->_isMonitoringTransaction;
  if (isMonitoringTransaction)
  {

    self->_isMonitoringTransaction = 0;
  }
  isMonitoringConnectionTransaction = self->_isMonitoringConnectionTransaction;
  if (isMonitoringConnectionTransaction)
  {

    self->_isMonitoringConnectionTransaction = 0;
  }

  bgTaskManager = self->_bgTaskManager;
  if (bgTaskManager)

  v8.receiver = self;
  v8.super_class = (Class)W5Engine;
  -[W5Engine dealloc](&v8, "dealloc");
}

- (void)run
{
  void *v3;
  NSObject *queue;
  _QWORD block[5];

  v3 = objc_autoreleasePoolPush();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000276F4;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
  objc_autoreleasePoolPop(v3);
  -[NSRunLoop run](+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"), "run");
}

- (void)terminateAndNotify:(id)a3
{
  NSObject *v5;
  W5WiFiSniffManager *sniff;
  W5LogManager *log;
  W5DiagnosticsManager *diagnostics;
  W5WiFiPerfLoggingManager *wifiperf;
  W5BGTaskManager *bgTaskManager;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v5 = dispatch_semaphore_create(0);
  sniff = self->_sniff;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100027944;
  v14[3] = &unk_1000D5C98;
  v14[4] = v5;
  -[W5WiFiSniffManager teardownAndNotify:](sniff, "teardownAndNotify:", v14);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  log = self->_log;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002794C;
  v13[3] = &unk_1000D5C98;
  v13[4] = v5;
  -[W5LogManager teardownAndNotify:](log, "teardownAndNotify:", v13);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  -[W5LogManager setCollectedItemCallback:](self->_log, "setCollectedItemCallback:", 0);
  -[W5LogManager setPingCallback:](self->_log, "setPingCallback:", 0);
  diagnostics = self->_diagnostics;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027954;
  v12[3] = &unk_1000D5C98;
  v12[4] = v5;
  -[W5DiagnosticsManager teardownAndNotify:](diagnostics, "teardownAndNotify:", v12);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  -[W5DiagnosticsManager setPingCallback:](self->_diagnostics, "setPingCallback:", 0);
  -[W5DiagnosticsManager setCompletedTestCallback:](self->_diagnostics, "setCompletedTestCallback:", 0);
  wifiperf = self->_wifiperf;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002795C;
  v11[3] = &unk_1000D5C98;
  v11[4] = v5;
  -[W5WiFiPerfLoggingManager teardownAndNotify:](wifiperf, "teardownAndNotify:", v11);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  -[W5StatusManager stopEventMonitoring](self->_status, "stopEventMonitoring");
  -[W5StatusManager setUpdatedWiFiCallback:](self->_status, "setUpdatedWiFiCallback:", 0);
  -[W5StatusManager setUpdatedBluetoothCallback:](self->_status, "setUpdatedBluetoothCallback:", 0);
  -[W5StatusManager setUpdatedAWDLStatusCallback:](self->_status, "setUpdatedAWDLStatusCallback:", 0);
  -[W5StatusManager setUpdatedWiFiStatusCallback:](self->_status, "setUpdatedWiFiStatusCallback:", 0);
  -[W5StatusManager setUpdatedBluetoothStatusCallback:](self->_status, "setUpdatedBluetoothStatusCallback:", 0);
  -[W5StatusManager setUpdatedPowerSourceCallback:](self->_status, "setUpdatedPowerSourceCallback:", 0);
  -[W5StatusManager setUpdatedNetworkStatusCallback:](self->_status, "setUpdatedNetworkStatusCallback:", 0);
  -[W5StatusManager setUpdatedPowerManagementCallback:](self->_status, "setUpdatedPowerManagementCallback:", 0);
  -[W5StatusManager setUpdatedPowerStatusCallback:](self->_status, "setUpdatedPowerStatusCallback:", 0);
  -[W5StatusManager setLowBatteryCallback:](self->_status, "setLowBatteryCallback:", 0);
  -[W5WiFiConnectionMonitor stopMonitoring](self->_monitor, "stopMonitoring");
  -[W5WiFiConnectionMonitor setDroppedWiFiConnectionCallback:](self->_monitor, "setDroppedWiFiConnectionCallback:", 0);
  -[W5FaultEventManager invalidate](self->_faultEventManager, "invalidate");
  bgTaskManager = self->_bgTaskManager;
  if (bgTaskManager)
    -[W5BGTaskManager stopAllRepeatingTasks](bgTaskManager, "stopAllRepeatingTasks");
  if (v5)
    dispatch_release(v5);
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)__model
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  const __CFData *CFProperty;
  const __CFData *v6;
  id v7;

  v2 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!MatchingService)
    return 0;
  v4 = MatchingService;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("model"), kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", CFDataGetBytePtr(CFProperty), 4));
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  IOObjectRelease(v4);
  return v7;
}

- (id)__localPeer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027AC8;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  if (qword_1000FB6B8 != -1)
    dispatch_once(&qword_1000FB6B8, block);
  return -[W5Peer copy](self->_localPeer, "copy");
}

- (void)__updateStatusMonitoring
{
  NSMutableArray *xpcConnections;
  id v4;
  id v5;
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL *p_isMonitoring;
  BOOL *p_isMonitoringWiFiConnection;
  OS_os_transaction *isMonitoringTransaction;
  OS_os_transaction *v14;
  OS_os_transaction *v15;
  OS_os_transaction *isMonitoringConnectionTransaction;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  xpcConnections = self->_xpcConnections;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](xpcConnections, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(xpcConnections);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      v7 |= objc_msgSend(objc_msgSend(v10, "eventIDs"), "count") != 0;
      v6 |= objc_msgSend(objc_msgSend(v10, "eventIDs"), "containsObject:", &off_1000E2E68);
      if ((v7 & 1) != 0 && (v6 & 1) != 0)
        break;
      if (v5 == (id)++v9)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](xpcConnections, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          goto LABEL_3;
        p_isMonitoring = &self->_isMonitoring;
        if (self->_isMonitoring != (v7 & 1))
        {
          if ((v7 & 1) == 0)
            goto LABEL_18;
          goto LABEL_21;
        }
        goto LABEL_23;
      }
    }
    p_isMonitoring = &self->_isMonitoring;
    if (!self->_isMonitoring)
    {
      LOBYTE(v6) = 1;
LABEL_21:
      -[W5StatusManager startEventMonitoring](self->_status, "startEventMonitoring");
      v14 = (OS_os_transaction *)os_transaction_create("com.apple.wifivelocity.monitoring");
      objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.monitoring", v14);
      self->_isMonitoringTransaction = v14;
      LOBYTE(isMonitoringTransaction) = 1;
      goto LABEL_22;
    }
    p_isMonitoringWiFiConnection = &self->_isMonitoringWiFiConnection;
    if (self->_isMonitoringWiFiConnection)
      return;
    goto LABEL_25;
  }
  p_isMonitoring = &self->_isMonitoring;
  if (!self->_isMonitoring)
  {
    p_isMonitoringWiFiConnection = &self->_isMonitoringWiFiConnection;
    if (!self->_isMonitoringWiFiConnection)
      return;
    goto LABEL_27;
  }
  LOBYTE(v6) = 0;
LABEL_18:
  -[W5StatusManager stopEventMonitoring](self->_status, "stopEventMonitoring");
  isMonitoringTransaction = self->_isMonitoringTransaction;
  if (isMonitoringTransaction)
  {
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", self->_isMonitoringTransaction);

    LOBYTE(isMonitoringTransaction) = 0;
    self->_isMonitoringTransaction = 0;
  }
LABEL_22:
  *p_isMonitoring = (char)isMonitoringTransaction;
LABEL_23:
  p_isMonitoringWiFiConnection = &self->_isMonitoringWiFiConnection;
  if (self->_isMonitoringWiFiConnection != (v6 & 1))
  {
    if ((v6 & 1) != 0)
    {
LABEL_25:
      -[W5WiFiConnectionMonitor startMonitoring](self->_monitor, "startMonitoring");
      v15 = (OS_os_transaction *)os_transaction_create("com.apple.wifivelocity.monitoring_connection");
      objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.monitoring_connection", v15);
      self->_isMonitoringConnectionTransaction = v15;
      LOBYTE(isMonitoringConnectionTransaction) = 1;
LABEL_29:
      *p_isMonitoringWiFiConnection = (char)isMonitoringConnectionTransaction;
      return;
    }
LABEL_27:
    -[W5WiFiConnectionMonitor stopMonitoring](self->_monitor, "stopMonitoring");
    isMonitoringConnectionTransaction = self->_isMonitoringConnectionTransaction;
    if (isMonitoringConnectionTransaction)
    {
      objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", self->_isMonitoringConnectionTransaction);

      LOBYTE(isMonitoringConnectionTransaction) = 0;
      self->_isMonitoringConnectionTransaction = 0;
    }
    goto LABEL_29;
  }
}

- (void)__queryStatusAndReply:(id)a3
{
  -[W5StatusManager queryStatusAndReply:](self->_status, "queryStatusAndReply:", a3);
}

- (void)__queryDebugConfigurationAndReply:(id)a3
{
  -[W5DebugManager queryDebugConfigurationAndReply:](self->_debug, "queryDebugConfigurationAndReply:", a3);
}

- (void)__setDebugConfiguration:(id)a3 reply:(id)a4
{
  -[W5DebugManager setDebugConfiguration:reply:](self->_debug, "setDebugConfiguration:reply:", a3, a4);
}

- (void)__runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  W5DiagnosticsTestRequestInternal *v11;

  v11 = objc_alloc_init(W5DiagnosticsTestRequestInternal);
  -[W5DiagnosticsTestRequestInternal setUuid:](v11, "setUuid:", a5);
  -[W5DiagnosticsTestRequestInternal setTestRequests:](v11, "setTestRequests:", a3);
  -[W5DiagnosticsTestRequestInternal setConfiguration:](v11, "setConfiguration:", a4);
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:](v11, "setIncludeEvents:", objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("IncludeEvents")), "BOOLValue"));
  -[W5DiagnosticsTestRequestInternal setReply:](v11, "setReply:", a6);
  -[W5DiagnosticsManager addRequest:](self->_diagnostics, "addRequest:", v11);
}

- (void)__cancelDiagnosticsWithUUID:(id)a3 reply:(id)a4
{
  -[W5DiagnosticsManager cancelRequestWithUUID:reply:](self->_diagnostics, "cancelRequestWithUUID:reply:", a3, a4);
}

- (void)__collectLogs:(id)a3 configuration:(id)a4 additionalLog:(id)a5 filename:(id)a6 uid:(unsigned int)a7 gid:(unsigned int)a8 uuid:(id)a9 reply:(id)a10
{
  uint64_t v10;
  uint64_t v11;
  id v17;
  W5LogItemRequestInternal *v18;
  _QWORD v19[7];

  v10 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a7;
  v17 = objc_msgSend(a4, "mutableCopy");
  if (objc_msgSend(-[W5DebugManager queryDebugConfigurationAndReturnError:](self->_debug, "queryDebugConfigurationAndReturnError:", 0), "megaWiFiProfile") == (id)1)objc_msgSend(v17, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseMegaWiFiProfileLimits"));
  v18 = objc_alloc_init(W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v18, "setUuid:", a9);
  -[W5LogItemRequestInternal setItemRequests:](v18, "setItemRequests:", a3);
  -[W5LogItemRequestInternal setConfiguration:](v18, "setConfiguration:", v17);
  -[W5LogItemRequestInternal setFilename:](v18, "setFilename:", a6);
  -[W5LogItemRequestInternal setAdditionalLog:](v18, "setAdditionalLog:", a5);
  -[W5LogItemRequestInternal setUid:](v18, "setUid:", v11);
  -[W5LogItemRequestInternal setGid:](v18, "setGid:", v10);
  -[W5LogItemRequestInternal setIncludeEvents:](v18, "setIncludeEvents:", objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("IncludeEvents")), "BOOLValue"));
  -[W5LogItemRequestInternal setAddedAt:](v18, "setAddedAt:", +[NSDate date](NSDate, "date"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100028100;
  v19[3] = &unk_1000D5D70;
  v19[5] = self;
  v19[6] = a10;
  v19[4] = a4;
  -[W5LogItemRequestInternal setReply:](v18, "setReply:", v19);
  -[W5LogManager addRequest:](self->_log, "addRequest:", v18);
}

- (void)__collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 uid:(unsigned int)a5 gid:(unsigned int)a6 uuid:(id)a7 reply:(id)a8
{
  id v12;
  W5DiagnosticsModeManager *diagnosticsModeManager;
  _QWORD v14[5];

  v12 = objc_msgSend(a3, "mutableCopy");
  if (objc_msgSend(-[W5DebugManager queryDebugConfigurationAndReturnError:](self->_debug, "queryDebugConfigurationAndReturnError:", 0), "megaWiFiProfile") == (id)1)objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseMegaWiFiProfileLimits"));
  diagnosticsModeManager = self->_diagnosticsModeManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100028478;
  v14[3] = &unk_1000D5D98;
  v14[4] = a8;
  -[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:](diagnosticsModeManager, "collectLogsDiagnosticMode:outputName:reply:", a3, a4, v14);
}

- (void)__cancelCollectLogsWithUUID:(id)a3 reply:(id)a4
{
  -[W5LogManager cancelRequestWithUUID:reply:](self->_log, "cancelRequestWithUUID:reply:", a3, a4);
}

- (void)__runWiFiSnifferOnPeer:(id)a3 channels:(id)a4 duration:(double)a5 uuid:(id)a6 reply:(id)a7
{
  id v8;
  _QWORD v9[5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028564;
  v9[3] = &unk_1000D5DC0;
  v9[4] = a7;
  v8 = -[W5PeerManager runSnifferAtPeerWithRequest:](self->_peerManager, "runSnifferAtPeerWithRequest:", -[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:]([W5PeerSnifferRequest alloc], "initWithPeer:requestType:duration:uuid:channels:config:reply:", a3, 1, 0, a4, 0, v9, a5));
  if (a7)
  {
    if (v8)
      (*((void (**)(id, id, _QWORD, _QWORD, _QWORD))a7 + 2))(a7, v8, 0, 0, 0);
  }
}

- (void)__runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 uuid:(id)a5 tcpDump:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v8;
  id v13;
  NSURL *v14;
  W5WiFiSnifferRequest *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[6];
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  NSURL *v26;

  v8 = a6;
  v13 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v13, "setDateFormat:", CFSTR("yyyy-MM-dd_HH.mm.ss.SSS"));
  v14 = -[NSURL URLByAppendingPathComponent:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")), "URLByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_ch%li_%@.pcap"), objc_msgSend(-[W5Engine __localPeer](self, "__localPeer"), "name"), objc_msgSend(a3, "channel"), objc_msgSend(v13, "stringFromDate:", +[NSDate date](NSDate, "date"))));
  v15 = objc_alloc_init(W5WiFiSnifferRequest);
  -[W5WiFiSnifferRequest setUuid:](v15, "setUuid:", a5);
  -[W5WiFiSnifferRequest setChannel:](v15, "setChannel:", a3);
  -[W5WiFiSnifferRequest setDuration:](v15, "setDuration:", a4);
  -[W5WiFiSnifferRequest setOutputFile:](v15, "setOutputFile:", v14);
  -[W5WiFiSnifferRequest setMonitorMode:](v15, "setMonitorMode:", a3 != 0);
  -[W5WiFiSnifferRequest setTcpDump:](v15, "setTcpDump:", v8);
  -[W5WiFiSnifferRequest setNoAutoStop:](v15, "setNoAutoStop:", 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000287C8;
  v18[3] = &unk_1000D5DE8;
  v18[4] = v14;
  v18[5] = a7;
  -[W5WiFiSnifferRequest setReply:](v15, "setReply:", v18);
  -[W5WiFiSniffManager addRequest:](self->_sniff, "addRequest:", v15);
  v16 = sub_10008F56C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138544130;
    v20 = a5;
    v21 = 2114;
    v22 = a3;
    v23 = 2048;
    v24 = (uint64_t)a4;
    v25 = 2114;
    v26 = v14;
    LODWORD(v17) = 42;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] Sniffer Request added to queue with UUID: %{public}@, channel: %{public}@, duration: %ld, outputFile: %{public}@", &v19, v17);
  }
}

- (void)__cancelWiFiSnifferWithUUID:(id)a3 reply:(id)a4
{
  -[W5WiFiSniffManager cancelRequestWithUUID:reply:](self->_sniff, "cancelRequestWithUUID:reply:", a3, a4);
}

- (void)__cancelWiFiSnifferWithUUID:(id)a3 peer:(id)a4 reply:(id)a5
{
  id v6;
  _QWORD v7[5];

  if (a4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000288D4;
    v7[3] = &unk_1000D5DC0;
    v7[4] = a5;
    v6 = -[W5PeerManager runSnifferAtPeerWithRequest:](self->_peerManager, "runSnifferAtPeerWithRequest:", -[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:]([W5PeerSnifferRequest alloc], "initWithPeer:requestType:duration:uuid:channels:config:reply:", a4, 2, a3, 0, 0, v7, 0.0));
    if (a5)
    {
      if (v6)
        (*((void (**)(id, id))a5 + 2))(a5, v6);
    }
  }
  else
  {
    -[W5Engine __cancelWiFiSnifferWithUUID:reply:](self, "__cancelWiFiSnifferWithUUID:reply:", a3, a5);
  }
}

- (void)__runWiFiPerfLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5
{
  W5WiFiPerfLoggingRequest *v9;

  v9 = objc_alloc_init(W5WiFiPerfLoggingRequest);
  -[W5WiFiPerfLoggingRequest setUuid:](v9, "setUuid:", a4);
  -[W5WiFiPerfLoggingRequest setConfiguration:](v9, "setConfiguration:", a3);
  -[W5WiFiPerfLoggingRequest setReply:](v9, "setReply:", a5);
  -[W5WiFiPerfLoggingManager addRequest:](self->_wifiperf, "addRequest:", v9);
}

- (void)__cancelWiFiPerfLoggingWithUUID:(id)a3 reply:(id)a4
{
  -[W5WiFiPerfLoggingManager cancelRequestWithUUID:reply:](self->_wifiperf, "cancelRequestWithUUID:reply:", a3, a4);
}

- (void)__queryDatabaseAndReply:(id)a3 reply:(id)a4
{
  -[W5DatabaseManager performFetchAndReply:reply:](self->_databaseManager, "performFetchAndReply:reply:", a3, a4);
}

- (void)__updatedStatusWithEvent:(id)a3
{
  NSMutableArray *xpcConnections;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  xpcConnections = self->_xpcConnections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](xpcConnections, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(xpcConnections);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v9, "eventIDs"), "containsObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "eventID"))))objc_msgSend(objc_msgSend(objc_msgSend(v9, "connection"), "remoteObjectProxy"), "receivedEvent:", a3);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](xpcConnections, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (void)__completedDiagnosticsTest:(id)a3
{
  id v4;
  NSMutableArray *xpcConnections;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = objc_msgSend(objc_msgSend(a3, "info"), "objectForKeyedSubscript:", CFSTR("UUID"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  xpcConnections = self->_xpcConnections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](xpcConnections, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(xpcConnections);
        if ((v8 & 1) != 0)
        {
LABEL_17:
          v8 = 1;
        }
        else
        {
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10);
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v12 = objc_msgSend(v11, "activeRequests");
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v20 != v15)
                  objc_enumerationMutation(v12);
                if (objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "uuid"), "isEqual:", v4))
                {
                  objc_msgSend(objc_msgSend(objc_msgSend(v11, "connection"), "remoteObjectProxy"), "receivedEvent:", a3);
                  goto LABEL_17;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
              v8 = 0;
              if (v14)
                continue;
              break;
            }
          }
          else
          {
            v8 = 0;
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](xpcConnections, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v7 = v17;
    }
    while (v17);
  }
}

- (void)__collectedLogItem:(id)a3
{
  id v4;
  NSMutableArray *xpcConnections;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = objc_msgSend(objc_msgSend(a3, "info"), "objectForKeyedSubscript:", CFSTR("UUID"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  xpcConnections = self->_xpcConnections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](xpcConnections, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(xpcConnections);
        if ((v8 & 1) != 0)
        {
LABEL_17:
          v8 = 1;
        }
        else
        {
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10);
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v12 = objc_msgSend(v11, "activeRequests");
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v20 != v15)
                  objc_enumerationMutation(v12);
                if (objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "uuid"), "isEqual:", v4))
                {
                  objc_msgSend(objc_msgSend(objc_msgSend(v11, "connection"), "remoteObjectProxy"), "receivedEvent:", a3);
                  goto LABEL_17;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
              v8 = 0;
              if (v14)
                continue;
              break;
            }
          }
          else
          {
            v8 = 0;
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](xpcConnections, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v7 = v17;
    }
    while (v17);
  }
}

- (void)__collectLogItem:(id)a3 reply:(id)a4
{
  NSObject *global_queue;
  _QWORD v7[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028EBC;
  v7[3] = &unk_1000D5C20;
  v7[4] = a3;
  v7[5] = a4;
  dispatch_async(global_queue, v7);
}

- (void)__setupCallbacks
{
  W5StatusManager *status;
  OS_dispatch_queue *queue;
  _QWORD v5[6];
  _QWORD v6[7];
  _QWORD v7[7];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[7];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[8];
  _QWORD v18[6];
  _QWORD v19[8];
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[6];

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3052000000;
  v28[3] = sub_100028258;
  v28[4] = sub_100028268;
  v28[5] = self;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3052000000;
  v27[3] = sub_100028258;
  v27[4] = sub_100028268;
  queue = self->_queue;
  status = self->_status;
  v27[5] = queue;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3052000000;
  v26[3] = sub_100028258;
  v26[4] = sub_100028268;
  v26[5] = status;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3052000000;
  v25[3] = sub_100028258;
  v25[4] = sub_100028268;
  v25[5] = self->_monitor;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000294BC;
  v24[3] = &unk_1000D5E10;
  v24[4] = v27;
  v24[5] = v28;
  -[W5StatusManager setUpdatedWiFiStatusCallback:](status, "setUpdatedWiFiStatusCallback:", v24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100029550;
  v23[3] = &unk_1000D5E10;
  v23[4] = v27;
  v23[5] = v28;
  -[W5StatusManager setUpdatedAWDLStatusCallback:](self->_status, "setUpdatedAWDLStatusCallback:", v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000295E4;
  v22[3] = &unk_1000D5E10;
  v22[4] = v27;
  v22[5] = v28;
  -[W5StatusManager setUpdatedBluetoothStatusCallback:](self->_status, "setUpdatedBluetoothStatusCallback:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100029678;
  v21[3] = &unk_1000D5E10;
  v21[4] = v27;
  v21[5] = v28;
  -[W5StatusManager setUpdatedNetworkStatusCallback:](self->_status, "setUpdatedNetworkStatusCallback:", v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002970C;
  v20[3] = &unk_1000D5E10;
  v20[4] = v27;
  v20[5] = v28;
  -[W5StatusManager setUpdatedPowerStatusCallback:](self->_status, "setUpdatedPowerStatusCallback:", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000297A0;
  v19[3] = &unk_1000D5E38;
  v19[4] = v27;
  v19[5] = v26;
  v19[6] = v25;
  v19[7] = v28;
  -[W5StatusManager setUpdatedWiFiCallback:](self->_status, "setUpdatedWiFiCallback:", v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000298C0;
  v18[3] = &unk_1000D5E10;
  v18[4] = v27;
  v18[5] = v28;
  -[W5StatusManager setUpdatedBluetoothCallback:](self->_status, "setUpdatedBluetoothCallback:", v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100029954;
  v17[3] = &unk_1000D5E38;
  v17[4] = v27;
  v17[5] = v26;
  v17[6] = v25;
  v17[7] = v28;
  -[W5StatusManager setUpdatedPowerManagementCallback:](self->_status, "setUpdatedPowerManagementCallback:", v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100029A64;
  v16[3] = &unk_1000D5E10;
  v16[4] = v27;
  v16[5] = v28;
  -[W5StatusManager setUpdatedPowerSourceCallback:](self->_status, "setUpdatedPowerSourceCallback:", v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100029AF8;
  v15[3] = &unk_1000D5E10;
  v15[4] = v27;
  v15[5] = v28;
  -[W5StatusManager setLowBatteryCallback:](self->_status, "setLowBatteryCallback:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100029B8C;
  v14[3] = &unk_1000D5E10;
  v14[4] = v27;
  v14[5] = v28;
  -[W5StatusManager setUpdatedFaultsCallback:](self->_status, "setUpdatedFaultsCallback:", v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100029C20;
  v13[3] = &unk_1000D5E10;
  v13[4] = v27;
  v13[5] = v28;
  -[W5StatusManager setUpdatedLinkTestsCallback:](self->_status, "setUpdatedLinkTestsCallback:", v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100029CB4;
  v12[3] = &unk_1000D5E10;
  v12[4] = v27;
  v12[5] = v28;
  -[W5StatusManager setUpdatedRecoveriesCallback:](self->_status, "setUpdatedRecoveriesCallback:", v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029D48;
  v11[3] = &unk_1000D5E88;
  v11[4] = v27;
  v11[5] = v28;
  -[W5DiagnosticsManager setCompletedTestCallback:](self->_diagnostics, "setCompletedTestCallback:", v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029E98;
  v10[3] = &unk_1000D5ED8;
  v10[4] = v27;
  v10[5] = v26;
  v10[6] = v28;
  -[W5DiagnosticsManager setPingCallback:](self->_diagnostics, "setPingCallback:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100029F4C;
  v9[3] = &unk_1000D5F00;
  v9[4] = v27;
  v9[5] = v28;
  -[W5LogManager setCollectedItemCallback:](self->_log, "setCollectedItemCallback:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002A09C;
  v8[3] = &unk_1000D5F50;
  v8[4] = v27;
  v8[5] = v28;
  -[W5LogManager setCollectLogItemCallback:](self->_log, "setCollectLogItemCallback:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A138;
  v7[3] = &unk_1000D5ED8;
  v7[4] = v27;
  v7[5] = v26;
  v7[6] = v28;
  -[W5LogManager setPingCallback:](self->_log, "setPingCallback:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002A1EC;
  v6[3] = &unk_1000D5ED8;
  v6[4] = v27;
  v6[5] = v26;
  v6[6] = v28;
  -[W5WiFiConnectionMonitor setDroppedWiFiConnectionCallback:](self->_monitor, "setDroppedWiFiConnectionCallback:", v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002A2A0;
  v5[3] = &unk_1000D5F78;
  v5[4] = self;
  v5[5] = v27;
  -[W5FaultEventManager setFaultEventHandler:](self->_faultEventManager, "setFaultEventHandler:", v5);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
}

- (void)xpcConnection:(id)a3 startMonitoringEvents:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[6];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002A494;
  v6[3] = &unk_1000D5C20;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)xpcConnection:(id)a3 stopMonitoringEvents:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[6];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002A530;
  v6[3] = &unk_1000D5C20;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)xpcConnection:(id)a3 queryLocalPeerAndReply:(id)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002A5CC;
  v5[3] = &unk_1000D5C20;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)xpcConnection:(id)a3 queryStatusForPeer:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A6A8;
  block[3] = &unk_1000D60B8;
  block[5] = self;
  block[6] = a5;
  block[4] = a4;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 queryDatabaseForPeer:(id)a4 fetch:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD v7[8];

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A8C0;
  v7[3] = &unk_1000D6068;
  v7[4] = a4;
  v7[5] = self;
  v7[6] = a5;
  v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 requestFileFromPeer:(id)a4 remoteFilePath:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD v7[8];

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002AC68;
  v7[3] = &unk_1000D6068;
  v7[4] = a4;
  v7[5] = a5;
  v7[6] = self;
  v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 listFilesFromPeer:(id)a4 remoteDirPath:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD v7[8];

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002ADD8;
  v7[3] = &unk_1000D6068;
  v7[4] = a4;
  v7[5] = a5;
  v7[6] = self;
  v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 queryDebugConfigurationForPeer:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AF14;
  block[3] = &unk_1000D60B8;
  block[5] = self;
  block[6] = a5;
  block[4] = a4;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 setDebugConfiguration:(id)a4 peer:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD v7[8];

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B134;
  v7[3] = &unk_1000D6130;
  v7[4] = a5;
  v7[5] = a4;
  v7[6] = self;
  v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 runDiagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  NSObject *queue;
  _QWORD v8[10];

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B350;
  v8[3] = &unk_1000D6180;
  v8[4] = a6;
  v8[5] = a3;
  v8[6] = a5;
  v8[7] = a4;
  v8[8] = self;
  v8[9] = a7;
  dispatch_async(queue, v8);
}

- (void)xpcConnection:(id)a3 runDiagnosticsForPeer:(id)a4 diagnostics:(id)a5 configuration:(id)a6 uuid:(id)a7 reply:(id)a8
{
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  W5PeerDiagnosticsRequest *v20;
  id v21;
  uint64_t v22;
  int v23;
  id v25;
  id v26;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  id v49;

  v11 = sub_10008F56C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 136316674;
    v37 = "-[W5Engine xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:]";
    v38 = 2080;
    v39 = "W5Engine.m";
    v40 = 1024;
    v41 = 1202;
    v42 = 2114;
    v43 = objc_msgSend(objc_msgSend(a7, "UUIDString"), "substringToIndex:", 5);
    v44 = 2114;
    v45 = objc_msgSend(a3, "processName");
    v46 = 1024;
    v47 = objc_msgSend(objc_msgSend(a3, "connection"), "processIdentifier");
    v48 = 2114;
    v49 = a6;
    v23 = 64;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) RECEIVED DIAGNOSTICS REQUEST (uuid=%{public}@) from %{public}@ (%d) with configuration %{public}@ and items:", &v36, v23);
  }
  v25 = a6;
  v26 = a7;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(a5);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v17 = sub_10008F56C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = W5DescriptionForDiagnosticsTestID(objc_msgSend(v16, "testID"));
          v19 = objc_msgSend(v16, "testID");
          v36 = 136316162;
          v37 = "-[W5Engine xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:]";
          v38 = 2080;
          v39 = "W5Engine.m";
          v40 = 1024;
          v41 = 1204;
          v42 = 2114;
          v43 = (id)v18;
          v44 = 2048;
          v45 = v19;
          LODWORD(v22) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) TEST: %{public}@ (%ld)", &v36, v22);
        }
      }
      v13 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v13);
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002BB94;
  v30[3] = &unk_1000D6018;
  v30[4] = a8;
  v20 = -[W5PeerDiagnosticsRequest initWithPeer:diagnostics:configuration:uuid:reply:]([W5PeerDiagnosticsRequest alloc], "initWithPeer:diagnostics:configuration:uuid:reply:", a4, a5, v25, v26, v30);
  v21 = -[W5PeerManager runDiagnosticsOnPeerWithRequest:](self->_peerManager, "runDiagnosticsOnPeerWithRequest:", v20);
  if (a8 && v21)
    (*((void (**)(id, id, _QWORD))a8 + 2))(a8, v21, 0);
  if (v20)
    CFRelease(v20);
}

- (void)xpcConnection:(id)a3 registerRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6
{
  NSObject *v8;
  int v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;

  v10 = 0;
  if (!-[W5DiagnosticsModeManager registerPeer:role:configuration:error:](self->_diagnosticsModeManager, "registerPeer:role:configuration:error:", a4, 16, a5, &v10))
  {
    v8 = sub_10008F56C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136316162;
      v12 = "-[W5Engine xpcConnection:registerRemoteDiagnosticEventsForPeer:configuration:reply:]";
      v13 = 2080;
      v14 = "W5Engine.m";
      v15 = 1024;
      v16 = 1224;
      v17 = 2114;
      v18 = a4;
      v19 = 2114;
      v20 = v10;
      v9 = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) failed to register peer='%{public}@' error='%{public}@'", &v11, v9);
    }
  }
  if (a6)
    (*((void (**)(id, uint64_t))a6 + 2))(a6, v10);
}

- (void)xpcConnection:(id)a3 unregisterRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6
{
  NSObject *v8;
  int v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;

  v10 = 0;
  if (!-[W5DiagnosticsModeManager unregisterPeer:role:error:](self->_diagnosticsModeManager, "unregisterPeer:role:error:", a4, 16, &v10))
  {
    v8 = sub_10008F56C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136316162;
      v12 = "-[W5Engine xpcConnection:unregisterRemoteDiagnosticEventsForPeer:configuration:reply:]";
      v13 = 2080;
      v14 = "W5Engine.m";
      v15 = 1024;
      v16 = 1234;
      v17 = 2114;
      v18 = a4;
      v19 = 2114;
      v20 = v10;
      v9 = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) failed to unregisterPeer peer='%{public}@' error='%{public}@'", &v11, v9);
    }
  }
  if (a6)
    (*((void (**)(id, uint64_t))a6 + 2))(a6, v10);
}

- (void)xpcConnection:(id)a3 queryRegisteredDiagnosticsPeersWithReply:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, id))a4 + 2))(a4, 0, -[W5DiagnosticsModeManager registeredPeersForFaultType:](self->_diagnosticsModeManager, "registeredPeersForFaultType:", 0x7FFFFFFFFFFFFFFFLL));
}

- (void)xpcConnection:(id)a3 startDiagnosticsModeWithConfiguration:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002BEA4;
  v6[3] = &unk_1000D6068;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)xpcConnection:(id)a3 stopDiagnosticsModeWithUUID:(id)a4 info:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C138;
  block[3] = &unk_1000D61D0;
  block[4] = a4;
  block[5] = a3;
  block[6] = a5;
  block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 queryDiagnosticsModeForPeer:(id)a4 info:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C3C8;
  block[3] = &unk_1000D61D0;
  block[4] = a3;
  block[5] = a5;
  block[6] = a4;
  block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 collectLogs:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  NSObject *queue;
  _QWORD v8[10];

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002C768;
  v8[3] = &unk_1000D6180;
  v8[4] = a6;
  v8[5] = a3;
  v8[6] = a5;
  v8[7] = a4;
  v8[8] = self;
  v8[9] = a7;
  dispatch_async(queue, v8);
}

- (void)xpcConnection:(id)a3 collectLogsDiagnosticMode:(id)a4 uuid:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CE24;
  block[3] = &unk_1000D61D0;
  block[4] = a5;
  block[5] = a3;
  block[6] = a4;
  block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 runWiFiSnifferOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8
{
  NSObject *queue;
  _QWORD v9[10];

  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D448;
  v9[3] = &unk_1000D6338;
  v9[4] = a6;
  v9[5] = self;
  *(double *)&v9[9] = a5;
  v9[7] = a7;
  v9[8] = a8;
  v9[6] = a4;
  dispatch_async(queue, v9);
}

- (void)xpcConnection:(id)a3 runWiFiSnifferWithTCPDumpOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8
{
  NSObject *queue;
  _QWORD v9[10];

  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D854;
  v9[3] = &unk_1000D6338;
  v9[4] = a6;
  v9[5] = self;
  *(double *)&v9[9] = a5;
  v9[7] = a7;
  v9[8] = a8;
  v9[6] = a4;
  dispatch_async(queue, v9);
}

- (void)xpcConnection:(id)a3 startPeerDiscoveryWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DB4C;
  block[3] = &unk_1000D61D0;
  block[4] = a4;
  block[5] = a5;
  block[6] = a3;
  block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 stopPeerDiscoveryWithUUID:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DDB4;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)__cancelPeerDiscoveryWithUUID:(id)a3
{
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;

  if (-[W5PeerManager stopPeerDiscoveryWithRequestUUID:](self->_peerManager, "stopPeerDiscoveryWithRequestUUID:"))
  {
    v4 = sub_10008F56C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = "-[W5Engine __cancelPeerDiscoveryWithUUID:]";
      v8 = 2080;
      v9 = "W5Engine.m";
      v10 = 1024;
      v11 = 1515;
      v12 = 2114;
      v13 = a3;
      v5 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) failed to stop peer discovery for UUID='%{public}@'", &v6, v5);
    }
  }
}

- (void)xpcConnection:(id)a3 runWiFiPerformanceLoggingWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD v7[8];

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002DF48;
  v7[3] = &unk_1000D6068;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a5;
  v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 cancelDiagnosticsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E0AC;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a4;
  block[6] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 cancelCollectLogsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E210;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a4;
  block[6] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD v7[8];

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E374;
  v7[3] = &unk_1000D6068;
  v7[4] = a5;
  v7[5] = self;
  v7[6] = a4;
  v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peer:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD v7[8];

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E5F4;
  v7[3] = &unk_1000D6068;
  v7[4] = a5;
  v7[5] = self;
  v7[6] = a4;
  v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 cancelWiFiPerformanceLoggingWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E82C;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a4;
  block[6] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 startMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E990;
  block[3] = &unk_1000D5C70;
  block[4] = a4;
  block[5] = self;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 stopMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EA40;
  block[3] = &unk_1000D5C70;
  block[4] = a4;
  block[5] = self;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 submitFaultEvent:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EAF0;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 queryFaultEventCacheForPeer:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EB94;
  block[3] = &unk_1000D5C70;
  block[4] = a4;
  block[5] = self;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  W5XPCConnection *v6;
  W5XPCConnection *v7;
  NSObject *queue;
  uint64_t v9;
  NSObject *v10;
  NSString *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  BOOL v15;
  NSObject *v17;
  unsigned int v18;
  NSObject *v19;
  NSString *v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  _QWORD v25[8];
  _QWORD v26[6];
  _QWORD block[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  uint64_t v39;
  _QWORD v40[6];
  int v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  _BYTE v52[10];

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3052000000;
  v40[3] = sub_100028258;
  v40[4] = sub_100028268;
  v40[5] = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3052000000;
  v37 = sub_100028258;
  v38 = sub_100028268;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = sub_100028258;
  v32 = sub_100028268;
  v33 = 0;
  v6 = -[W5XPCConnection initWithXPCConnection:]([W5XPCConnection alloc], "initWithXPCConnection:", a4);
  v7 = v6;
  if (!v6)
  {
    v17 = sub_10008F56C();
    v15 = 0;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v18 = objc_msgSend(a4, "processIdentifier");
    v41 = 136315906;
    v42 = "-[W5Engine listener:shouldAcceptNewConnection:]";
    v43 = 2080;
    v44 = "W5Engine.m";
    v45 = 1024;
    v46 = 1712;
    v47 = 1024;
    LODWORD(v48) = v18;
    v23 = 34;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) FAILED to create W5XPCConnection object for pid=%d, will not accept new XPC connection", &v41, v23);
LABEL_12:
    v15 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(-[NSXPCConnection valueForEntitlement:](-[W5XPCConnection connection](v6, "connection"), "valueForEntitlement:", CFSTR("com.apple.private.wifivelocity")), "BOOLValue") & 1) == 0&& (objc_msgSend(-[NSXPCConnection valueForEntitlement:](-[W5XPCConnection connection](v7, "connection"), "valueForEntitlement:", CFSTR("com.apple.private.network-performance-tester")), "BOOLValue") & 1) == 0&& (objc_msgSend(-[NSXPCConnection valueForEntitlement:](-[W5XPCConnection connection](v7, "connection"), "valueForEntitlement:", CFSTR("com.apple.wifivelocity")), "BOOLValue") & 1) == 0&& (objc_msgSend(-[NSXPCConnection valueForEntitlement:](
                          -[W5XPCConnection connection](v7, "connection"),
                          "valueForEntitlement:",
                          CFSTR("com.apple.wireless-diagnostics")),
                        "BOOLValue") & 1) == 0)
  {
    v19 = sub_10008F56C();
    v15 = 0;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v20 = -[W5XPCConnection processName](v7, "processName");
    v21 = -[NSXPCConnection processIdentifier](-[W5XPCConnection connection](v7, "connection"), "processIdentifier");
    v41 = 136316418;
    v42 = "-[W5Engine listener:shouldAcceptNewConnection:]";
    v43 = 2080;
    v44 = "W5Engine.m";
    v45 = 1024;
    v46 = 1719;
    v47 = 2114;
    v48 = v20;
    v49 = 1024;
    v50 = v21;
    v51 = 2114;
    *(_QWORD *)v52 = CFSTR("com.apple.private.wifivelocity");
    v24 = 54;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) ERROR: %{public}@ (%d) is not entitled for %{public}@, rejecting connection!!!", &v41, v24);
    goto LABEL_12;
  }
  -[W5XPCConnection setDelegate:](v7, "setDelegate:", self);
  objc_msgSend(a4, "setExportedInterface:", sub_100030C0C());
  objc_msgSend(a4, "setExportedObject:", v7);
  objc_msgSend(a4, "setRemoteObjectInterface:", sub_100032924());
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F154;
  block[3] = &unk_1000D5C48;
  block[4] = self;
  block[5] = v7;
  dispatch_sync(queue, block);
  v9 = os_transaction_create(-[NSString utf8ValueSafe](-[W5XPCConnection processName](v7, "processName"), "utf8ValueSafe"));
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", -[NSString utf8ValueSafe](-[W5XPCConnection processName](v7, "processName"), "utf8ValueSafe"), v9);
  v29[5] = v9;
  v35[5] = (uint64_t)v7;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002F188;
  v26[3] = &unk_1000D63B0;
  v26[4] = &v34;
  v26[5] = v40;
  objc_msgSend(a4, "setInterruptionHandler:", v26);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002F2E8;
  v25[3] = &unk_1000D63D8;
  v25[4] = self;
  v25[5] = &v34;
  v25[6] = v40;
  v25[7] = &v28;
  objc_msgSend(a4, "setInvalidationHandler:", v25);
  v10 = sub_10008F56C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[W5XPCConnection processName](v7, "processName");
    v12 = objc_msgSend(a4, "processIdentifier");
    v13 = objc_msgSend(a4, "effectiveUserIdentifier");
    v14 = objc_msgSend(a4, "effectiveGroupIdentifier");
    v41 = 136316674;
    v42 = "-[W5Engine listener:shouldAcceptNewConnection:]";
    v43 = 2080;
    v44 = "W5Engine.m";
    v45 = 1024;
    v46 = 1823;
    v47 = 2114;
    v48 = v11;
    v49 = 1024;
    v50 = v12;
    v51 = 1024;
    *(_DWORD *)v52 = v13;
    *(_WORD *)&v52[4] = 1024;
    *(_DWORD *)&v52[6] = v14;
    v22 = 56;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) ADDED XPC CONNECTION %{public}@ [pid=%d, euid=%d, egid=%d]", &v41, v22);
  }
  objc_msgSend(a4, "resume");
  v15 = 1;
LABEL_9:
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v40, 8);
  return v15;
}

- (id)_peerListeners
{
  id v3;
  W5PeerSensingListener *v4;
  W5PeerStatusListener *v5;
  W5PeerSnifferListener *v6;
  W5PeerDebugListener *v7;
  W5PeerDiagnosticsListener *v8;
  W5PeerFileTransferListener *v9;
  W5PeerDatabaseListener *v10;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _BYTE v19[22];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = -[W5PeerSensingListener initWithInterface:]([W5PeerSensingListener alloc], "initWithInterface:", -[W5StatusManager corewifi](self->_status, "corewifi"));
  if (v4)
  {
    objc_msgSend(v3, "addObject:", v4);
    v5 = -[W5PeerStatusListener initWithInterface:statusManager:]([W5PeerStatusListener alloc], "initWithInterface:statusManager:", -[W5StatusManager corewifi](self->_status, "corewifi"), self->_status);
    if (v5)
    {
      objc_msgSend(v3, "addObject:", v5);
      v6 = -[W5PeerSnifferListener initWithInterface:snifferManager:]([W5PeerSnifferListener alloc], "initWithInterface:snifferManager:", -[W5StatusManager corewifi](self->_status, "corewifi"), self->_sniff);
      if (v6)
      {
        objc_msgSend(v3, "addObject:", v6);
        v7 = -[W5PeerDebugListener initWithDebugManager:]([W5PeerDebugListener alloc], "initWithDebugManager:", self->_debug);
        if (v7)
        {
          objc_msgSend(v3, "addObject:", v7);
          v8 = -[W5PeerDiagnosticsListener initWithDiagnosticsManager:]([W5PeerDiagnosticsListener alloc], "initWithDiagnosticsManager:", self->_diagnostics);
          if (v8)
          {
            objc_msgSend(v3, "addObject:", v8);
            v9 = -[W5PeerFileTransferListener initWithTransferManager:]([W5PeerFileTransferListener alloc], "initWithTransferManager:", self->_transferManager);
            if (v9)
            {
              objc_msgSend(v3, "addObject:", v9);
              v10 = -[W5PeerDatabaseListener initWithDatabaseAccessManager:]([W5PeerDatabaseListener alloc], "initWithDatabaseAccessManager:", self->_databaseManager);
              if (v10)
              {
                objc_msgSend(v3, "addObject:", v10);
                objc_msgSend(v3, "addObject:", -[W5FaultEventManager listener](self->_faultEventManager, "listener"));
              }
              else
              {
                v18 = sub_10008F56C();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v19 = 136315650;
                  *(_QWORD *)&v19[4] = "-[W5Engine _peerListeners]";
                  *(_WORD *)&v19[12] = 2080;
                  *(_QWORD *)&v19[14] = "W5Engine.m";
                  _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) failed to create databaseListener", v19, 28, *(_OWORD *)v19);
                }
              }
            }
            else
            {
              v17 = sub_10008F56C();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v19 = 136315650;
                *(_QWORD *)&v19[4] = "-[W5Engine _peerListeners]";
                *(_WORD *)&v19[12] = 2080;
                *(_QWORD *)&v19[14] = "W5Engine.m";
                _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) failed to create file transfer listener", v19, 28, *(_OWORD *)v19);
              }
            }
          }
          else
          {
            v16 = sub_10008F56C();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v19 = 136315650;
              *(_QWORD *)&v19[4] = "-[W5Engine _peerListeners]";
              *(_WORD *)&v19[12] = 2080;
              *(_QWORD *)&v19[14] = "W5Engine.m";
              _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) failed to create diagnostics listener", v19, 28, *(_OWORD *)v19);
            }
          }
        }
        else
        {
          v15 = sub_10008F56C();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v19 = 136315650;
            *(_QWORD *)&v19[4] = "-[W5Engine _peerListeners]";
            *(_WORD *)&v19[12] = 2080;
            *(_QWORD *)&v19[14] = "W5Engine.m";
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) failed to create debug listener", v19, 28, *(_OWORD *)v19);
          }
        }
      }
      else
      {
        v14 = sub_10008F56C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v19 = 136315650;
          *(_QWORD *)&v19[4] = "-[W5Engine _peerListeners]";
          *(_WORD *)&v19[12] = 2080;
          *(_QWORD *)&v19[14] = "W5Engine.m";
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) failed to create sniffer listener", v19, 28, *(_OWORD *)v19);
        }
      }
    }
    else
    {
      v13 = sub_10008F56C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v19 = 136315650;
        *(_QWORD *)&v19[4] = "-[W5Engine _peerListeners]";
        *(_WORD *)&v19[12] = 2080;
        *(_QWORD *)&v19[14] = "W5Engine.m";
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) failed to create connection listener", v19, 28, *(_OWORD *)v19);
      }
    }
  }
  else
  {
    v12 = sub_10008F56C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 136315650;
      *(_QWORD *)&v19[4] = "-[W5Engine _peerListeners]";
      *(_WORD *)&v19[12] = 2080;
      *(_QWORD *)&v19[14] = "W5Engine.m";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) failed to create sensing listener", v19, 28, *(_OWORD *)v19);
    }
  }
  return v3;
}

- (void)_scheduleRepeatingCleanupTasks
{
  NSObject *v3;
  NSPredicate *v4;
  NSPredicate *v5;
  W5BGTaskManager *bgTaskManager;
  NSObject *v7;
  const char *v8;
  _QWORD v9[6];
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  if (!-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:](self->_bgTaskManager, "scheduleRepeatingTask:interval:repeatingTask:", CFSTR("com.apple.wifivelocity.sniffer_cleanup"), &stru_1000D6418, 86400.0))
  {
    v3 = sub_10008F56C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = "-[W5Engine _scheduleRepeatingCleanupTasks]";
      v12 = 2080;
      v13 = "W5Engine.m";
      v14 = 1024;
      v15 = 1922;
      LODWORD(v8) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) Failed to setup Sniffer Cleanup Periodic Task", (const char *)&v10, v8, LODWORD(v9[0]));
    }
  }
  v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.absoluteString CONTAINS %@"), CFSTR("WiFiNetworkDiagnostics"));
  v5 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("pathExtension='tgz'"));
  bgTaskManager = self->_bgTaskManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100030258;
  v9[3] = &unk_1000D6440;
  v9[4] = v4;
  v9[5] = v5;
  if (!-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:](bgTaskManager, "scheduleRepeatingTask:interval:repeatingTask:", CFSTR("com.apple.wifivelocity.de_cleanup"), v9, 86400.0))
  {
    v7 = sub_10008F56C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = "-[W5Engine _scheduleRepeatingCleanupTasks]";
      v12 = 2080;
      v13 = "W5Engine.m";
      v14 = 1024;
      v15 = 1951;
      LODWORD(v8) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) Failed to setup DE Cleanup Periodic Task", (const char *)&v10, v8, LODWORD(v9[0]));
    }
  }
}

@end
