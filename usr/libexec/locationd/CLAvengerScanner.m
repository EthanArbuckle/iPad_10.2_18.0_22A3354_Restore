@implementation CLAvengerScanner

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_102308ED8 != -1)
    dispatch_once(&qword_102308ED8, &stru_102190AE8);
  return (id)qword_102308ED0;
}

+ (BOOL)isSupported
{
  return os_variant_is_darwinos("com.apple.locationd", a2) ^ 1;
}

- (CLAvengerScanner)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAvengerScanner;
  return -[CLAvengerScanner initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLAvengerScannerServiceProtocol, &OBJC_PROTOCOL___CLAvengerScannerClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  self->_queue = (OS_dispatch_queue *)objc_msgSend(objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"), "queue");
  self->_objectDiscoveryManager = (WPObjectDiscovery *)objc_msgSend(objc_alloc((Class)WPObjectDiscovery), "initWithDelegate:queue:", self, objc_msgSend(objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"), "queue"));
  self->_clients = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  self->_clientToNameMap = +[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable");
  self->_clientToLongAggressiveScanTimeout = +[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable");
  self->_stateContext = objc_alloc_init(CLAvengerScannerStateContext);
  self->_policy = -[CLAvengerScannerPolicy initWithDelegate:platformType:supportsPerTypeDuplicateFilter:]([CLAvengerScannerPolicy alloc], "initWithDelegate:platformType:supportsPerTypeDuplicateFilter:", self, -[CLAvengerScanner getCLAvengerScannerPolicyPlatformType](self, "getCLAvengerScannerPolicyPlatformType"), sub_10075FF30());
  self->_centralManager = (CBCentralManager *)objc_msgSend(objc_alloc((Class)CBCentralManager), "initWithDelegate:queue:", self, objc_msgSend(objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"), "queue"));
  self->_hasQueriedNumberOfBuffers = 0;
  self->_systemMonitor = -[CLDurianSystemMonitor initWithUniverse:]([CLDurianSystemMonitor alloc], "initWithUniverse:", -[CLAvengerScanner universe](self, "universe"));
  self->_avengerScannerSettings = -[CLAvengerScannerSettings initWithUniverse:]([CLAvengerScannerSettings alloc], "initWithUniverse:", -[CLAvengerScanner universe](self, "universe"));
  -[CLDurianSystemMonitor setDelegate:](self->_systemMonitor, "setDelegate:", self);
  -[CLAvengerScanner initializeScanTypeChangeViewsWithZeroValues](self, "initializeScanTypeChangeViewsWithZeroValues");
  -[CLAvengerScanner initAnalyticsCache](self, "initAnalyticsCache");
  -[CLAvengerScanner initAnalyticsTimer](self, "initAnalyticsTimer");
  self->_reconciler = -[CLAvengerReconciler initWithQueue:]([CLAvengerReconciler alloc], "initWithQueue:", self->_queue);
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLAvengerScanner: begin service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0208, 0, "CLAvengerScanner: begin service", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLAvengerScanner beginService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v4 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLAvengerScannerSettings settingsDictionary](self->_avengerScannerSettings, "settingsDictionary");
    *(_DWORD *)buf = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: settings\", \"settings\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
}

- (void)endService
{
  NSEnumerator *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  self->_objectDiscoveryManager = 0;
  self->_centralManager = 0;
  self->_hasQueriedNumberOfBuffers = 0;

  self->_policy = 0;
  self->_clients = 0;

  self->_clientToNameMap = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSMapTable objectEnumerator](self->_clientToLongAggressiveScanTimeout, "objectEnumerator", 0);
  v4 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        dispatch_block_cancel(*(dispatch_block_t *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->_clientToLongAggressiveScanTimeout = 0;
  self->_reconciler = 0;
}

- (id)nameForClient:(id)a3
{
  if (-[NSMapTable objectForKey:](self->_clientToNameMap, "objectForKey:"))
    return -[NSMapTable objectForKey:](self->_clientToNameMap, "objectForKey:", a3);
  else
    return CFSTR("Unknown");
}

- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 clientName:(id)a4
{
  -[CLAvengerScanner startMonitoringAvengerAdvertisementsForClient:optedIn:clientName:](self, "startMonitoringAvengerAdvertisementsForClient:optedIn:clientName:", a3, -[CLAvengerScannerPolicy optedIn](self->_policy, "optedIn"), a4);
}

- (void)clearLongAggressiveTimeoutBlockForClient:(id)a3
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;

  v5 = -[NSMapTable objectForKey:](self->_clientToLongAggressiveScanTimeout, "objectForKey:");
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v6 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289538;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2114;
    v11 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v12 = 1026;
    v13 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner clearing LongAggressive timeout block\", \"client\":%{public, location:escape_only}@, \"block\":%{public}hhd}", (uint8_t *)v7, 0x22u);
  }
  if (v5)
  {
    dispatch_block_cancel(v5);
    -[NSMapTable removeObjectForKey:](self->_clientToLongAggressiveScanTimeout, "removeObjectForKey:", a3);
  }
}

- (void)createLongAggressiveTimeoutBlockForClient:(id)a3 seconds:(int64_t)a4 withBlock:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  dispatch_block_t v14;
  dispatch_time_t v15;
  int v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int64_t v23;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v9 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 68289538;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2114;
    v21 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v22 = 2050;
    v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner creating LongAggressive timeout block\", \"client\":%{public, location:escape_only}@, \"seconds\":%{public}lld}", (uint8_t *)&v16, 0x26u);
  }
  if (-[NSMapTable objectForKey:](self->_clientToLongAggressiveScanTimeout, "objectForKey:", a3))
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v10 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      v11 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      v16 = 68289282;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2114;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner a LongAggressive timeout block already exists for client\", \"client\":%{public, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
    }
    v12 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v13 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      v16 = 68289282;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2114;
      v21 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner a LongAggressive timeout block already exists for client", "{\"msg%{public}.0s\":\"CLAvengerScanner a LongAggressive timeout block already exists for client\", \"client\":%{public, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
    }
  }
  else
  {
    v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, a5);
    v15 = dispatch_time(0, 1000000000 * a4);
    dispatch_after(v15, (dispatch_queue_t)self->_queue, v14);
    -[NSMapTable setObject:forKey:](self->_clientToLongAggressiveScanTimeout, "setObject:forKey:", v14, a3);
    _Block_release(v14);
  }
}

- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 optedIn:(BOOL)a4 clientName:(id)a5
{
  NSMutableSet *clients;
  _BOOL8 v8;
  NSObject *v10;
  id v11;
  unsigned int v12;
  int64_t state;
  unsigned int v14;
  unsigned int v15;
  _DWORD v16[2];
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;

  if (a5)
  {
    clients = self->_clients;
    if (clients)
    {
      v8 = a4;
      -[NSMutableSet addObject:](clients, "addObject:");
      -[NSMapTable setObject:forKey:](self->_clientToNameMap, "setObject:forKey:", a5, a3);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
      v10 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
      {
        v11 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
        v12 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
        state = self->_state;
        v14 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
        v15 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
        v16[0] = 68290562;
        v16[1] = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2114;
        v20 = v11;
        v21 = 1026;
        v22 = v8;
        v23 = 1026;
        v24 = v12;
        v25 = 1026;
        v26 = state;
        v27 = 1026;
        v28 = v14;
        v29 = 1026;
        v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: startMonitoringAvengerAdvertisementsForClient\", \"client\":%{public, location:escape_only}@, \"optedIn\":%{public}hhd, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v16, 0x3Au);
      }
      if (-[CLAvengerScannerPolicy optedIn](self->_policy, "optedIn") != v8)
        -[CLAvengerScannerPolicy setOptedIn:](self->_policy, "setOptedIn:", v8);
      if (self->_state <= 1uLL)
      {
        self->_state = 2;
        -[CLAvengerScanner start](self, "start");
      }
      -[CLAvengerScanner initializeClientRequestsViewsWithZeroValues:](self, "initializeClientRequestsViewsWithZeroValues:", a5);
      -[CLAvengerScanner submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221C2C0, a5, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StartMonitor"));
    }
  }
}

- (void)stopMonitoringAvengerAdvertisementsForClient:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  unsigned int v8;
  int64_t state;
  unsigned int v10;
  unsigned int v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;

  if (-[NSMutableSet containsObject:](self->_clients, "containsObject:"))
  {
    -[CLAvengerScanner submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221C2C0, -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopMonitor"));
    -[NSMutableSet removeObject:](self->_clients, "removeObject:", a3);
    -[NSMapTable removeObjectForKey:](self->_clientToNameMap, "removeObjectForKey:", a3);
    if (!-[NSMutableSet count](self->_clients, "count") && (self->_state & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      self->_state = 1;
      -[CLAvengerScanner stop](self, "stop");
    }
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
    {
      v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      v7 = -[NSMutableSet count](self->_clients, "count");
      v8 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      state = self->_state;
      v10 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
      v11 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
      v12[0] = 68290562;
      v12[1] = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v6;
      v17 = 2050;
      v18 = v7;
      v19 = 1026;
      v20 = v8;
      v21 = 1026;
      v22 = state;
      v23 = 1026;
      v24 = v10;
      v25 = 1026;
      v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScanner: stopMonitoringAvengerAdvertisementsForClient\", \"client\":%{public, location:escape_only}@, \"clientCount\":%{public}lu, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v12, 0x3Eu);
    }
  }
}

- (id)convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:(CLAvengerScannerScanParameters *)a3
{
  _QWORD v5[6];
  _QWORD v6[6];

  v5[0] = WPObjectDiscoveryScanKeyAdvBuffer;
  v6[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var5);
  v5[1] = WPObjectDiscoveryScanKeyAdvBufferRate;
  v6[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var4);
  v5[2] = WPObjectDiscoveryScanKeyAllowDuplicates;
  v6[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3->var0);
  v5[3] = WPObjectDiscoveryScanKeyScanWhenLocked;
  v6[3] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3->var1);
  v5[4] = WPObjectDiscoveryScanKeyScreenOffRate;
  v6[4] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var3);
  v5[5] = WPObjectDiscoveryScanKeyScreenOnRate;
  v6[5] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var2);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
}

- (void)start
{
  NSObject *v3;
  unsigned int v4;
  int64_t state;
  unsigned int v6;
  unsigned int v7;
  CLAvengerScannerPolicy *policy;
  id v9;
  NSObject *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  _BYTE v20[10];
  id v21;
  unsigned int v22;

  if (self->_state != 3)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v3 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      v4 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      state = self->_state;
      v6 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
      v7 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
      *(_DWORD *)buf = 68290050;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 1026;
      *(_DWORD *)v20 = v4;
      *(_WORD *)&v20[4] = 1026;
      *(_DWORD *)&v20[6] = state;
      LOWORD(v21) = 1026;
      *(_DWORD *)((char *)&v21 + 2) = v6;
      HIWORD(v21) = 1026;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: attempting to start\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x2Au);
    }
    if (!-[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse")&& (id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
    {
      -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:](self->_stateContext, "setStartScanningAwaitingResponse:", 1);
      -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:](self->_stateContext, "setStopScanningAwaitingResponse:", 0);
      -[CLAvengerScannerStateContext setRequestedScanType:](self->_stateContext, "setRequestedScanType:", -[CLAvengerScannerPolicy currentScanType](self->_policy, "currentScanType"));
      policy = self->_policy;
      if (policy)
      {
        -[CLAvengerScannerPolicy currentScanParameters](policy, "currentScanParameters");
      }
      else
      {
        v14 = 0;
        v12 = 0u;
        v13 = 0u;
      }
      v9 = -[CLAvengerScanner convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:](self, "convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:", &v12);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
      v10 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
      {
        v11 = +[CLAvengerScannerPolicy convertCLAvengerScannerPolicyScanTypeToString:](CLAvengerScannerPolicy, "convertCLAvengerScannerPolicyScanTypeToString:", -[CLAvengerScannerPolicy currentScanType](self->_policy, "currentScanType"));
        *(_DWORD *)buf = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2114;
        *(_QWORD *)v20 = v11;
        *(_WORD *)&v20[8] = 2113;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: startScanning requested\", \"ScanType\":%{public, location:escape_only}@, \"ScanParameters\":%{private, location:escape_only}@}", buf, 0x26u);
      }
      -[WPObjectDiscovery startScanningWithOptions:](self->_objectDiscoveryManager, "startScanningWithOptions:", v9, v12, v13, v14);
    }
  }
}

- (void)stop
{
  NSObject *v3;
  unsigned int v4;
  int64_t state;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;

  if (self->_state
    && !-[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse"))
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v3 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      v4 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      state = self->_state;
      v6 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
      v7 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
      v9 = 68290050;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 1026;
      v14 = v4;
      v15 = 1026;
      v16 = state;
      v17 = 1026;
      v18 = v6;
      v19 = 1026;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: attempting to stop\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v9, 0x2Au);
    }
    if ((id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
      v8 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
      {
        v9 = 68289026;
        v10 = 0;
        v11 = 2082;
        v12 = "";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScanner: stopScanning requested\"}", (uint8_t *)&v9, 0x12u);
      }
      -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:](self->_stateContext, "setStopScanningAwaitingResponse:", 1);
      -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:](self->_stateContext, "setStartScanningAwaitingResponse:", 0);
      -[WPObjectDiscovery stopScanning](self->_objectDiscoveryManager, "stopScanning");
    }
  }
}

- (void)onObjectDiscoveryUpdatedState:(int64_t)a3
{
  NSObject *v5;
  unsigned int v6;
  int64_t state;
  unsigned int v8;
  unsigned int v9;
  int64_t v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  if (-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") != a3)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
    {
      v6 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      state = self->_state;
      v8 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
      v9 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
      v11[0] = 68290306;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 1026;
      v15 = a3;
      v16 = 1026;
      v17 = v6;
      v18 = 1026;
      v19 = state;
      v20 = 1026;
      v21 = v8;
      v22 = 1026;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScanner: objectDiscovery state changed\", \"nextWPState\":%{public}d, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x30u);
    }
    -[CLAvengerScannerStateContext setCurrentWPState:](self->_stateContext, "setCurrentWPState:", a3);
    if ((unint64_t)(a3 - 1) <= 1)
    {
      -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:](self->_stateContext, "setStartScanningAwaitingResponse:", 0);
      -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:](self->_stateContext, "setStopScanningAwaitingResponse:", 0);
      if (-[CLAvengerScannerPolicy hasActiveAggressiveScan](self->_policy, "hasActiveAggressiveScan"))
        -[CLAvengerScanner notifyClientsAggressiveScanEnded](self, "notifyClientsAggressiveScanEnded");
    }
    v10 = self->_state;
    if (v10 == 3)
    {
      self->_state = 2;
    }
    else if (v10 == 2)
    {
      if ((id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
        -[CLAvengerScanner start](self, "start");
    }
    else if (v10 == 1
           && (id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
    {
      -[CLAvengerScanner stop](self, "stop");
    }
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  CBCentralManager *centralManager;
  _QWORD v7[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;

  v4 = objc_msgSend(a3, "state");
  if ((v4 == (id)10 || v4 == (id)5) && !self->_hasQueriedNumberOfBuffers)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: requesting num adv buffers\"}", buf, 0x12u);
    }
    centralManager = self->_centralManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100ECAA54;
    v7[3] = &unk_102190B10;
    v7[4] = self;
    -[CBCentralManager retrieveSupportedResources:subKey:completion:](centralManager, "retrieveSupportedResources:subKey:completion:", CBManagerResourceADVBufferCount, &stru_1021D8FB8, v7);
  }
}

- (void)objectDiscoveryUpdatedState:(id)a3
{
  -[CLAvengerScanner onObjectDiscoveryUpdatedState:](self, "onObjectDiscoveryUpdatedState:", objc_msgSend(a3, "state"));
}

- (void)objectDiscoveryStartedScanning:(id)a3
{
  NSObject *v5;
  unsigned int v6;
  int64_t state;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v6 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v8 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v9 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    v16 = 68290050;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 1026;
    v21 = v6;
    v22 = 1026;
    v23 = state;
    v24 = 1026;
    v25 = v8;
    v26 = 1026;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: objectDiscoveryStartedScanning\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v16, 0x2Au);
  }
  -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:](self->_stateContext, "setStartScanningAwaitingResponse:", 0);
  v10 = self->_state;
  if (v10 < 2)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v12 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      v16 = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected\"}", (uint8_t *)&v16, 0x12u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
    }
    v13 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v16 = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected", "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected\"}", (uint8_t *)&v16, 0x12u);
    }
  }
  else if (v10 == 2)
  {
    self->_state = 3;
  }
  else if (v10 == 3)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v11 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
    {
      v16 = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerScanning - overwrite parameters\"}", (uint8_t *)&v16, 0x12u);
    }
  }
  -[CLAvengerScanner onObjectDiscoveryUpdatedState:](self, "onObjectDiscoveryUpdatedState:", objc_msgSend(a3, "state"));
  -[CLAvengerScanner submitScanTypeChangeEvent:type:](self, "submitScanTypeChangeEvent:type:", &off_10221C2C0, +[CLAvengerScannerPolicy convertCLAvengerScannerPolicyScanTypeToString:](CLAvengerScannerPolicy, "convertCLAvengerScannerPolicyScanTypeToString:", -[CLAvengerScannerStateContext requestedScanType](self->_stateContext, "requestedScanType")));
  v14 = -[CLAvengerScannerPolicy currentScanType](self->_policy, "currentScanType");
  if (v14 != (void *)-[CLAvengerScannerStateContext requestedScanType](self->_stateContext, "requestedScanType"))
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v15 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: objectDiscoveryStartedScanning achieved scan and current desired scan dont match, restarting\"}", (uint8_t *)&v16, 0x12u);
    }
    self->_state = 2;
    -[CLAvengerScanner start](self, "start");
  }
}

- (void)objectDiscoveryStoppedScanning:(id)a3
{
  NSObject *v4;
  unsigned int v5;
  int64_t state;
  unsigned int v7;
  unsigned int v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v4 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v5 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v7 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v8 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    v12 = 68290050;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 1026;
    v17 = v5;
    v18 = 1026;
    v19 = state;
    v20 = 1026;
    v21 = v7;
    v22 = 1026;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: objectDiscoveryStoppedScanning\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v12, 0x2Au);
  }
  -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:](self->_stateContext, "setStopScanningAwaitingResponse:", 0);
  if (-[CLAvengerScannerPolicy hasActiveAggressiveScan](self->_policy, "hasActiveAggressiveScan"))
    -[CLAvengerScanner notifyClientsAggressiveScanEnded](self, "notifyClientsAggressiveScanEnded");
  v9 = self->_state;
  switch(v9)
  {
    case 3:
      self->_state = 2;
      -[CLAvengerScanner start](self, "start");
      break;
    case 1:
      self->_state = 0;
      break;
    case 0:
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
      v10 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
      {
        v12 = 68289026;
        v13 = 0;
        v14 = 2082;
        v15 = "";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected\"}", (uint8_t *)&v12, 0x12u);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_102190B80);
      }
      v11 = qword_1022A0208;
      if (os_signpost_enabled((os_log_t)qword_1022A0208))
      {
        v12 = 68289026;
        v13 = 0;
        v14 = 2082;
        v15 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected", "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected\"}", (uint8_t *)&v12, 0x12u);
      }
      break;
  }
}

- (void)objectDiscovery:(id)a3 failedToStartScanningWithError:(id)a4
{
  NSObject *v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t *v20;
  int64_t v21;
  _WORD v22[8];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v6 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
  {
    v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    *(_DWORD *)buf = 68290307;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2113;
    v28 = a4;
    v29 = 1026;
    v30 = v7;
    v31 = 1026;
    v32 = state;
    v33 = 1026;
    v34 = v9;
    v35 = 1026;
    v36 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: failedToStartScanning\", \"error\":%{private, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
  }
  v11 = qword_1022A0208;
  if (os_signpost_enabled((os_log_t)qword_1022A0208))
  {
    v12 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    v21 = self->_state;
    v13 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v14 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    *(_DWORD *)buf = 68290307;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2113;
    v28 = a4;
    v29 = 1026;
    v30 = v12;
    v31 = 1026;
    v32 = v21;
    v33 = 1026;
    v34 = v13;
    v35 = 1026;
    v36 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: failedToStartScanning", "{\"msg%{public}.0s\":\"CLAvengerScanner: failedToStartScanning\", \"error\":%{private, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
  }
  -[CLAvengerScannerStateContext setStartScanningAwaitingResponse:](self->_stateContext, "setStartScanningAwaitingResponse:", 0);
  -[CLAvengerScannerStateContext setStopScanningAwaitingResponse:](self->_stateContext, "setStopScanningAwaitingResponse:", 0);
  v15 = self->_state;
  switch(v15)
  {
    case 3:
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
      v18 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerScanning state", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_102190B80);
        v22[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0208, 16, "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerScanning state", v22, 2);
        goto LABEL_36;
      }
      break;
    case 1:
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
      v19 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopPending state", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_102190B80);
        v22[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0208, 16, "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopPending state", v22, 2);
        goto LABEL_36;
      }
      break;
    case 0:
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
      v16 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopped state", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_102190B80);
        v22[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0208, 16, "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopped state", v22, 2);
LABEL_36:
        v20 = (uint8_t *)v17;
        sub_100512490("Generic", 1, 0, 0, "-[CLAvengerScanner objectDiscovery:failedToStartScanningWithError:]", "%s\n", v17);
        if (v20 != buf)
          free(v20);
      }
      break;
  }
}

- (void)objectDiscovery:(id)a3 foundDevice:(id)a4
{
  -[CLAvengerScanner handleFoundDevice:](self, "handleFoundDevice:", a4);
  -[CLAvengerScanner onObjectDiscoveryUpdatedState:](self, "onObjectDiscoveryUpdatedState:", objc_msgSend(a3, "state"));
}

- (void)objectDiscovery:(id)a3 foundDevices:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSObject *v11;
  NSMutableSet *clients;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t buf;
  __int16 v27;
  const char *v28;
  _BYTE v29[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(a4);
        -[CLAvengerScanner handleFoundDevice:](self, "handleFoundDevice:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
      }
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);
  }
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v11 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v27 = 2082;
    v28 = "";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: buffer emptied\"}", (uint8_t *)&buf, 0x12u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  clients = self->_clients;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(clients);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), "onAdvertisementBufferEmptied");
      }
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }
  -[CLAvengerScanner onObjectDiscoveryUpdatedState:](self, "onObjectDiscoveryUpdatedState:", objc_msgSend(a3, "state"));
}

- (void)handleFoundDevice:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  CLAvengerScannerClientObjectDiscoveryData *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  CLAvengerScannerClientObjectDiscoveryData *v15;
  CLAvengerReconciler *reconciler;
  id v17;
  NSMutableSet *clients;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  unsigned int v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t buf;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_102190BA0);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
  {
    buf = 68289283;
    v31 = 2082;
    v32 = "";
    v33 = 2113;
    v34 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner Depricated function handleFoundDevice called with data\", \"device\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_102190BA0);
  }
  v5 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    buf = 68289283;
    v31 = 2082;
    v32 = "";
    v33 = 2113;
    v34 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner Depricated function handleFoundDevice called with data", "{\"msg%{public}.0s\":\"CLAvengerScanner Depricated function handleFoundDevice called with data\", \"device\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
  v6 = [CLAvengerScannerClientObjectDiscoveryData alloc];
  v7 = WPObjectDiscoveryKeyAddress;
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyAddress);
  v9 = WPObjectDiscoveryKeyData;
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyData);
  v11 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyStatus), "unsignedCharValue");
  v12 = objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyOptional);
  v13 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyRSSI), "integerValue");
  v14 = objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyTime);
  LOBYTE(v23) = 0;
  v15 = -[CLAvengerScannerClientObjectDiscoveryData initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:](v6, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:", v8, v10, v11, v12, v13, v14, objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyChannel), v23, 0);
  reconciler = self->_reconciler;
  if (reconciler)
    v17 = -[CLAvengerReconciler attemptReconciliationWithAddress:advertisementData:](reconciler, "attemptReconciliationWithAddress:advertisementData:", objc_msgSend(a3, "objectForKeyedSubscript:", v7), objc_msgSend(a3, "objectForKeyedSubscript:", v9));
  else
    v17 = 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  clients = self->_clients;
  v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(clients);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "onAvengerAdvertisement:reconciledInformation:", v15, v17);
      }
      v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }
}

- (void)notifyClientsAggressiveScanStarted
{
  NSObject *v3;
  unsigned int v4;
  int64_t state;
  unsigned int v6;
  unsigned int v7;
  NSMutableSet *clients;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t buf;
  __int16 v19;
  const char *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v4 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v6 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v7 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    buf = 68290050;
    v19 = 2082;
    v20 = "";
    v21 = 1026;
    v22 = v4;
    v23 = 1026;
    v24 = state;
    v25 = 1026;
    v26 = v6;
    v27 = 1026;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: notifyClientsAggressiveScanStarted\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&buf, 0x2Au);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  clients = self->_clients;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(clients);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "onAggressiveScanStarted");
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
}

- (void)notifyClientsAggressiveScanEnded
{
  NSObject *v3;
  unsigned int v4;
  int64_t state;
  unsigned int v6;
  unsigned int v7;
  NSMutableSet *clients;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t buf;
  __int16 v19;
  const char *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v4 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v6 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v7 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    buf = 68290050;
    v19 = 2082;
    v20 = "";
    v21 = 1026;
    v22 = v4;
    v23 = 1026;
    v24 = state;
    v25 = 1026;
    v26 = v6;
    v27 = 1026;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: notifyClientsAggressiveScanEnded\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&buf, 0x2Au);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  clients = self->_clients;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(clients);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "onAggressiveScanEnded");
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
}

- (BOOL)syncgetIsScanning
{
  return self->_state == 3;
}

- (BOOL)shouldStartSpecialScan
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  int v7;
  __int16 v8;
  const char *v9;

  v2 = -[NSMutableSet count](self->_clients, "count");
  if (!v2)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v3 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: special scan requested, but currently no clients, not starting\"}", (uint8_t *)&v6, 0x12u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
    }
    v4 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: special scan requested, but currently no clients, not starting", "{\"msg%{public}.0s\":\"CLAvengerScanner: special scan requested, but currently no clients, not starting\"}", (uint8_t *)&v6, 0x12u);
    }
  }
  return v2 != 0;
}

- (void)performTemporaryAggressiveScan:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  uint8_t buf[8];
  _BYTE v12[32];
  uint64_t v13;
  uint64_t v14;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    *(_DWORD *)buf = 68290306;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v12 = 2082;
    *(_QWORD *)&v12[2] = "";
    *(_WORD *)&v12[10] = 2114;
    *(_QWORD *)&v12[12] = v6;
    *(_WORD *)&v12[20] = 1026;
    *(_DWORD *)&v12[22] = v7;
    *(_WORD *)&v12[26] = 1026;
    *(_DWORD *)&v12[28] = state;
    LOWORD(v13) = 1026;
    *(_DWORD *)((char *)&v13 + 2) = v9;
    HIWORD(v13) = 1026;
    LODWORD(v14) = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryAggressiveScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
  }
  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)v12 = buf;
    *(_QWORD *)&v12[8] = 0x3812000000;
    *(_QWORD *)&v12[16] = sub_1002071E4;
    *(_QWORD *)&v12[24] = sub_100207D60;
    v13 = 0;
    operator new();
  }
}

- (void)performTemporaryAggressiveScanForFindMyAccessoryManager:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  if (-[CLAvengerScannerPolicy hasActiveBTFindingScan](self->_policy, "hasActiveBTFindingScan"))
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      state = self->_state;
      v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
      v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
      v11[0] = 68290306;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2114;
      v15 = v6;
      v16 = 1026;
      v17 = v7;
      v18 = 1026;
      v19 = state;
      v20 = 1026;
      v21 = v9;
      v22 = 1026;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: requested AggressiveScan but RSSI Finding scan active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
    }
  }
  else
  {
    -[CLAvengerScanner performTemporaryAggressiveScan:](self, "performTemporaryAggressiveScan:", a3);
  }
}

- (void)performTemporaryLongAggressiveScan:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  NSObject *v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  id v17;
  CLAvengerScannerStateContext **p_stateContext;
  unsigned int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  double v23;
  double v24;
  int v25;
  double v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  id v31;
  uint8_t buf[8];
  _BYTE v33[40];
  uint64_t v34;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    *(_DWORD *)buf = 68290306;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v33 = 2082;
    *(_QWORD *)&v33[2] = "";
    *(_WORD *)&v33[10] = 2114;
    *(_QWORD *)&v33[12] = v6;
    *(_WORD *)&v33[20] = 1026;
    *(_DWORD *)&v33[22] = v7;
    *(_WORD *)&v33[26] = 1026;
    *(_DWORD *)&v33[28] = state;
    *(_WORD *)&v33[32] = 1026;
    *(_DWORD *)&v33[34] = v9;
    *(_WORD *)&v33[38] = 1026;
    LODWORD(v34) = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryLongAggressiveScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
  }
  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    if (!-[NSMapTable objectForKey:](self->_clientToLongAggressiveScanTimeout, "objectForKey:", a3))
    {
      if (-[CLAvengerScannerPolicy associatedTo2GHzWiFi](self->_policy, "associatedTo2GHzWiFi")
        && -[CLAvengerScannerPolicy wifi2GHzCriticalState](self->_policy, "wifi2GHzCriticalState")
        || -[CLAvengerScannerPolicy bluetoothAudioActive](self->_policy, "bluetoothAudioActive"))
      {
        -[CLAvengerScannerSettings longAggressiveScanCoexImpactedDuration](self->_avengerScannerSettings, "longAggressiveScanCoexImpactedDuration");
        v24 = v23;
        v25 = 1;
      }
      else
      {
        -[CLAvengerScannerSettings longAggressiveScanNonCoexImpactedDuration](self->_avengerScannerSettings, "longAggressiveScanNonCoexImpactedDuration");
        v24 = v26;
        v25 = 0;
      }
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
      v27 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
      {
        v28 = -[CLAvengerScannerPolicy associatedTo2GHzWiFi](self->_policy, "associatedTo2GHzWiFi");
        v29 = -[CLAvengerScannerPolicy wifi2GHzCriticalState](self->_policy, "wifi2GHzCriticalState");
        v30 = -[CLAvengerScannerPolicy bluetoothAudioActive](self->_policy, "bluetoothAudioActive");
        *(_DWORD *)buf = 68290306;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v33 = 2082;
        *(_QWORD *)&v33[2] = "";
        *(_WORD *)&v33[10] = 1026;
        *(_DWORD *)&v33[12] = (int)v24;
        *(_WORD *)&v33[16] = 1026;
        *(_DWORD *)&v33[18] = v25;
        *(_WORD *)&v33[22] = 1026;
        *(_DWORD *)&v33[24] = v28;
        *(_WORD *)&v33[28] = 1026;
        *(_DWORD *)&v33[30] = v29;
        *(_WORD *)&v33[34] = 1026;
        *(_DWORD *)&v33[36] = v30;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryLongAggressiveScan scanning\", \"duration\":%{public}d, \"coexImpacted\":%{public}hhd, \"associatedTo2GHzWiFi\":%{public}hhd, \"wifi2GHzCriticalState\":%{public}hhd, \"bluetoothAudioActive\":%{public}hhd}", buf, 0x30u);
      }
      if (v25)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)v33 = buf;
        *(_QWORD *)&v33[8] = 0x3812000000;
        *(_QWORD *)&v33[16] = sub_1002071E4;
        *(_QWORD *)&v33[24] = sub_100207D60;
        *(_QWORD *)&v33[32] = 0;
        operator new();
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)v33 = buf;
      *(_QWORD *)&v33[8] = 0x3812000000;
      *(_QWORD *)&v33[16] = sub_1002071E4;
      *(_QWORD *)&v33[24] = sub_100207D60;
      *(_QWORD *)&v33[32] = 0;
      operator new();
    }
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v11 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      v31 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      v12 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      v13 = self->_state;
      v14 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
      v15 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
      *(_DWORD *)buf = 68290306;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v33 = 2082;
      *(_QWORD *)&v33[2] = "";
      *(_WORD *)&v33[10] = 2114;
      *(_QWORD *)&v33[12] = v31;
      *(_WORD *)&v33[20] = 1026;
      *(_DWORD *)&v33[22] = v12;
      *(_WORD *)&v33[26] = 1026;
      *(_DWORD *)&v33[28] = v13;
      *(_WORD *)&v33[32] = 1026;
      *(_DWORD *)&v33[34] = v14;
      *(_WORD *)&v33[38] = 1026;
      LODWORD(v34) = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryLongAggressiveScan requested but one is already active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
    }
    v16 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v17 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      p_stateContext = &self->_stateContext;
      v19 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      v20 = self->_state;
      v21 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
      v22 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](*p_stateContext, "stopScanningAwaitingResponse");
      *(_DWORD *)buf = 68290306;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v33 = 2082;
      *(_QWORD *)&v33[2] = "";
      *(_WORD *)&v33[10] = 2114;
      *(_QWORD *)&v33[12] = v17;
      *(_WORD *)&v33[20] = 1026;
      *(_DWORD *)&v33[22] = v19;
      *(_WORD *)&v33[26] = 1026;
      *(_DWORD *)&v33[28] = v20;
      *(_WORD *)&v33[32] = 1026;
      *(_DWORD *)&v33[34] = v21;
      *(_WORD *)&v33[38] = 1026;
      LODWORD(v34) = v22;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: performTemporaryLongAggressiveScan requested but one is already active", "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryLongAggressiveScan requested but one is already active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
    }
  }
}

- (void)terminateTemporaryLongAggressiveScan:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  id v13;
  unsigned int v14;
  int64_t v15;
  unsigned int v16;
  unsigned int v17;
  NSObject *v18;
  id v19;
  unsigned int v20;
  int64_t v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    v24 = 68290306;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2114;
    v29 = v6;
    v30 = 1026;
    v31 = v7;
    v32 = 1026;
    v33 = state;
    v34 = 1026;
    v35 = v9;
    v36 = 1026;
    v37 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: terminateTemporaryLongAggressiveScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v24, 0x34u);
  }
  v11 = -[NSMapTable objectForKey:](self->_clientToLongAggressiveScanTimeout, "objectForKey:", a3);
  if (v11)
  {
    dispatch_async((dispatch_queue_t)self->_queue, v11);
  }
  else
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v12 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      v13 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      v14 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      v15 = self->_state;
      v16 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
      v17 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
      v24 = 68290306;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2114;
      v29 = v13;
      v30 = 1026;
      v31 = v14;
      v32 = 1026;
      v33 = v15;
      v34 = 1026;
      v35 = v16;
      v36 = 1026;
      v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: terminateTemporaryLongAggressiveScan requested but none is active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v24, 0x34u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
    }
    v18 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v19 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
      v20 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
      v21 = self->_state;
      v22 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
      v23 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
      v24 = 68290306;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2114;
      v29 = v19;
      v30 = 1026;
      v31 = v20;
      v32 = 1026;
      v33 = v21;
      v34 = 1026;
      v35 = v22;
      v36 = 1026;
      v37 = v23;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: terminateTemporaryLongAggressiveScan requested but none is active", "{\"msg%{public}.0s\":\"CLAvengerScanner: terminateTemporaryLongAggressiveScan requested but none is active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v24, 0x34u);
    }
  }
}

- (void)performTemporaryHawkeyeLowEnergyScan:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  dispatch_time_t v11;
  _QWORD block[5];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    *(_DWORD *)buf = 68290306;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2114;
    v18 = v6;
    v19 = 1026;
    v20 = v7;
    v21 = 1026;
    v22 = state;
    v23 = 1026;
    v24 = v9;
    v25 = 1026;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryHawkeyeLowEnergyScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
  }
  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    -[CLAvengerScannerPolicy startHawkeyeLowEnergyScan](self->_policy, "startHawkeyeLowEnergyScan");
    v11 = dispatch_time(0, 60000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100ECDA7C;
    block[3] = &unk_10212BB58;
    block[4] = self;
    dispatch_after(v11, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"), "queue"), block);
    -[CLAvengerScanner submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221C2C0, -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "HELE"));
  }
}

- (void)startBTFindingScan:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    v11[0] = 68290306;
    v11[1] = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2114;
    v15 = v6;
    v16 = 1026;
    v17 = v7;
    v18 = 1026;
    v19 = state;
    v20 = 1026;
    v21 = v9;
    v22 = 1026;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: startBTFindingScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
  }
  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    -[CLAvengerScannerPolicy startBTFindingScan](self->_policy, "startBTFindingScan");
    -[CLAvengerScanner submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221C2C0, -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StartBTFinding"));
  }
}

- (void)stopBTFindingScan:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    v11[0] = 68290306;
    v11[1] = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2114;
    v15 = v6;
    v16 = 1026;
    v17 = v7;
    v18 = 1026;
    v19 = state;
    v20 = 1026;
    v21 = v9;
    v22 = 1026;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: stopBTFindingScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
  }
  -[CLAvengerScannerPolicy stopBTFindingScan](self->_policy, "stopBTFindingScan");
  -[CLAvengerScanner submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221C2C0, -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopBTFinding"));
}

- (void)startWatchAdvertisementBufferScan:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    v11[0] = 68290306;
    v11[1] = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2114;
    v15 = v6;
    v16 = 1026;
    v17 = v7;
    v18 = 1026;
    v19 = state;
    v20 = 1026;
    v21 = v9;
    v22 = 1026;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: startWatchAdvertisementBufferScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
  }
  if (-[CLAvengerScanner shouldStartSpecialScan](self, "shouldStartSpecialScan"))
  {
    -[CLAvengerScannerPolicy startWatchAdvertisementBufferScan](self->_policy, "startWatchAdvertisementBufferScan");
    -[CLAvengerScanner submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221C2C0, -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StartWatchADVBuffer"));
  }
}

- (void)stopWatchAdvertisementBufferScan:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  int64_t state;
  unsigned int v9;
  unsigned int v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3);
    v7 = -[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState");
    state = self->_state;
    v9 = -[CLAvengerScannerStateContext startScanningAwaitingResponse](self->_stateContext, "startScanningAwaitingResponse");
    v10 = -[CLAvengerScannerStateContext stopScanningAwaitingResponse](self->_stateContext, "stopScanningAwaitingResponse");
    v11[0] = 68290306;
    v11[1] = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2114;
    v15 = v6;
    v16 = 1026;
    v17 = v7;
    v18 = 1026;
    v19 = state;
    v20 = 1026;
    v21 = v9;
    v22 = 1026;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: stopWatchAdvertisementBufferScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
  }
  -[CLAvengerScannerPolicy stopWatchAdvertisementBufferScan](self->_policy, "stopWatchAdvertisementBufferScan");
  -[CLAvengerScanner submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221C2C0, -[CLAvengerScanner nameForClient:](self, "nameForClient:", a3), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopWatchADVBuffer"));
}

- (void)submitScanTypeChangeEvent:(id)a3 type:(id)a4
{
  NSMutableDictionary *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  NSMutableDictionary *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v15[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "scanCount");
  v16[0] = a3;
  v15[1] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "scanType");
  v16[1] = a4;
  v6 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v7 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: submitScanTypeChangeEvent\", \"analyticsEvent\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100ECE314;
  v8[3] = &unk_10215F370;
  v8[4] = v6;
  AnalyticsSendEventLazy(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.avengerscanner.scantypechange"), v8);
}

- (void)initializeScanTypeChangeViewsWithZeroValues
{
  uint64_t i;

  for (i = 0; i != 13; ++i)
    -[CLAvengerScanner submitScanTypeChangeEvent:type:](self, "submitScanTypeChangeEvent:type:", &off_10221C2D8, +[CLAvengerScannerPolicy convertCLAvengerScannerPolicyScanTypeToString:](CLAvengerScannerPolicy, "convertCLAvengerScannerPolicyScanTypeToString:", i));
}

- (void)submitClientRequestsEvent:(id)a3 client:(id)a4 scanType:(id)a5
{
  NSMutableDictionary *v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSMutableDictionary *v16;
  _QWORD v17[3];
  _QWORD v18[3];

  v17[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "requestCount");
  v18[0] = a3;
  v17[1] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "client");
  v18[1] = a4;
  v17[2] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "scanType");
  v18[2] = a5;
  v8 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102190B80);
  v9 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: submitClientRequestsEvent\", \"analyticsEvent\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100ECE538;
  v10[3] = &unk_10215F370;
  v10[4] = v8;
  AnalyticsSendEventLazy(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.avengerscanner.clientrequests"), v10);
}

- (void)initializeClientRequestsViewsWithZeroValues:(id)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[9];

  v15[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Aggressive");
  v15[1] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StartBTFinding");
  v15[2] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopBTFinding");
  v15[3] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AggressiveLong");
  v15[4] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "HELE");
  v15[5] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StartWatchADVBuffer");
  v15[6] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopWatchADVBuffer");
  v15[7] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StartMonitor");
  v15[8] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopMonitor");
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 9);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CLAvengerScanner submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221C2D8, a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)onAnalyticsTimerFired:(id)a3
{
  CLAvengerScannerAnalytics *p_fAnalytics;
  _QWORD v5[5];
  _QWORD v6[2];
  _QWORD v7[2];

  if (self->fAnalyticsTimer == a3)
  {
    p_fAnalytics = &self->fAnalytics;
    self->fAnalytics.count_submission = 1;
    v6[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "numSwitchToAgressiveScan");
    v7[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", p_fAnalytics->numSwitchToAggressiveScan);
    v6[1] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "count_submission");
    v7[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", p_fAnalytics->count_submission);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100ECE864;
    v5[3] = &unk_10215F370;
    v5[4] = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
    AnalyticsSendEventLazy(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.avengerscanner.aggressivescan"), v5);
    -[CLAvengerScanner resetAnalyticsCache](self, "resetAnalyticsCache");
  }
}

- (void)initAnalyticsCache
{
  uint64_t v3;
  CLAvengerScannerAnalytics *p_fAnalytics;
  _QWORD v5[2];

  sub_100119F3C(v5);
  v3 = sub_1001FD94C();
  if (sub_100006BB4(v3, "AvengerScannerAnalyticsTimer", v5))
  {
    p_fAnalytics = &self->fAnalytics;
    sub_1001FD98C((uint64_t)v5, "lastRequestTime", &p_fAnalytics->lastRequestTime);
    sub_100526244((uint64_t)v5, "numSwitchToAgressiveScan", &p_fAnalytics->numSwitchToAggressiveScan);
    sub_100526244((uint64_t)v5, "count_submission", p_fAnalytics);
  }
  else
  {
    -[CLAvengerScanner persistAnalyticsCache](self, "persistAnalyticsCache");
  }
  sub_10011A5A8(v5);
}

- (void)persistAnalyticsCache
{
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[16];

  sub_100119F3C(v5);
  self = (CLAvengerScanner *)((char *)self + 96);
  sub_10018A4CC((uint64_t)v5, "lastRequestTime", &self->_objectDiscoveryManager);
  sub_100019BD4((uint64_t)v5, "count_submission", (unsigned int *)self->CLIntersiloService_opaque);
  sub_100019BD4((uint64_t)v5, "numSwitchToAgressiveScan", (unsigned int *)&self->CLIntersiloService_opaque[4]);
  v3 = sub_1001FD94C();
  sub_1000CADE4(v3, "AvengerScannerAnalyticsTimer", (uint64_t)v5);
  v4 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 944))(v4);
  sub_10011A5A8(v5);
}

- (void)resetAnalyticsCache
{
  *(_QWORD *)&self->fAnalytics.count_submission = 0;
  self->fAnalytics.lastRequestTime = CFAbsoluteTimeGetCurrent();
  -[CLAvengerScanner persistAnalyticsCache](self, "persistAnalyticsCache");
}

- (void)initAnalyticsTimer
{
  CLTimer *v3;
  double v4;
  double v5;
  _QWORD v6[5];

  v3 = (CLTimer *)objc_msgSend(objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo"), "newTimer");
  self->fAnalyticsTimer = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100ECEAC4;
  v6[3] = &unk_10212BB58;
  v6[4] = self;
  -[CLTimer setHandler:](v3, "setHandler:", v6);
  v4 = CFAbsoluteTimeGetCurrent() - self->fAnalytics.lastRequestTime;
  if (v4 >= 86400.0)
    v5 = 86400.0;
  else
    v5 = 86400.0 - v4;
  -[CLTimer setNextFireDelay:interval:](self->fAnalyticsTimer, "setNextFireDelay:interval:", v5);
}

- (void)scanTypeUpdated:(int64_t)a3
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  if (self->_state == 3)
  {
    self->_state = 2;
    -[CLAvengerScanner start](self, "start", a3);
  }
  else
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102190B80);
    v3 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#CLAvengerScanner: attempted to update scan but not yet scanning\"}", (uint8_t *)&v5, 0x12u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102190B80);
    }
    v4 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLAvengerScanner: attempted to update scan but not yet scanning", "{\"msg%{public}.0s\":\"#CLAvengerScanner: attempted to update scan but not yet scanning\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)startedAggressiveDiscoveryScan
{
  if ((id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
  {
    ++self->fAnalytics.numSwitchToAggressiveScan;
    -[CLAvengerScanner persistAnalyticsCache](self, "persistAnalyticsCache");
    -[CLAvengerScanner notifyClientsAggressiveScanStarted](self, "notifyClientsAggressiveScanStarted");
  }
}

- (void)stoppedAggressiveDiscoveryScan
{
  if ((id)-[CLAvengerScannerStateContext currentWPState](self->_stateContext, "currentWPState") == (id)3)
    -[CLAvengerScanner notifyClientsAggressiveScanEnded](self, "notifyClientsAggressiveScanEnded");
}

- (int64_t)getCLAvengerScannerPolicyPlatformType
{
  if ((sub_1000C4240() & 1) != 0 || (sub_100081BD0() & 1) != 0)
    return 1;
  if ((sub_100195F08() & 1) != 0)
    return 2;
  if (sub_10011E0F0())
    return 3;
  return 0;
}

- (void)systemCoexImpact:(id)a3 toState:(int)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = (a4 >> 1) & 1;
  v6 = a4 & 1;
  -[CLAvengerScannerPolicy setAssociatedTo2GHzWiFi:](self->_policy, "setAssociatedTo2GHzWiFi:", (a4 >> 2) & 1);
  -[CLAvengerScannerPolicy setWifi2GHzCriticalState:](self->_policy, "setWifi2GHzCriticalState:", v5);
  -[CLAvengerScannerPolicy setBluetoothAudioActive:](self->_policy, "setBluetoothAudioActive:", v6);
}

- (id).cxx_construct
{
  *(_QWORD *)&self->fAnalytics.count_submission = 0;
  self->fAnalytics.lastRequestTime = CFAbsoluteTimeGetCurrent();
  return self;
}

@end
