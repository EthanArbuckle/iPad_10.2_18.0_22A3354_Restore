@implementation CLAuthSyncManager

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
  if (qword_102305F68 != -1)
    dispatch_once(&qword_102305F68, &stru_102162C50);
  return (id)qword_102305F60;
}

+ (BOOL)isSupported
{
  if (qword_102305F78 != -1)
    dispatch_once(&qword_102305F78, &stru_102162C70);
  return byte_102305F70;
}

- (CLAuthSyncManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAuthSyncManager;
  return -[CLAuthSyncManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLAuthSyncManagerProtocol, &OBJC_PROTOCOL___CLAuthSyncManagerClientProtocol);
}

- (void)setSilo:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  objc_msgSend(a3, "suspend");
  v8.receiver = self;
  v8.super_class = (Class)CLAuthSyncManager;
  -[CLAuthSyncManager setSilo:](&v8, "setSilo:", a3);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009BBC4C;
  v7[3] = &unk_1021436B8;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:completion:](IDSService, "serviceWithIdentifier:completion:", CFSTR("com.apple.private.alloy.location.auth"), v7);
}

- (void)beginService
{
  NSDictionary *v3;
  NSNotificationCenter *v4;
  NSNotificationCenter *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;
  _UNKNOWN **v20;

  -[CLAuthSyncManager setClientManager:](self, "setClientManager:", objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLAuthSyncManager")));
  v19 = off_1022A6230[0]();
  v20 = &off_10221B9C0;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  self->_syncService = (SYService *)objc_msgSend(objc_alloc((Class)off_1022A6238[0]()), "initWithService:priority:asMasterStore:options:", CFSTR("com.apple.private.alloy.location.auth"), 20, 1, v3);
  -[SYService setDelegate:queue:](-[CLAuthSyncManager syncService](self, "syncService"), "setDelegate:queue:", self, objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "queue"));
  -[IDSService addDelegate:queue:](-[CLAuthSyncManager idsService](self, "idsService"), "addDelegate:queue:", self, objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "queue"));
  -[CLAuthSyncManager setFullSyncObjectsInCompanionQueue:](self, "setFullSyncObjectsInCompanionQueue:", +[NSMutableArray array](NSMutableArray, "array"));
  -[CLAuthSyncManager setFullSyncObjectsInGizmoQueue:](self, "setFullSyncObjectsInGizmoQueue:", +[NSMutableArray array](NSMutableArray, "array"));
  -[CLAuthSyncManager setDeltaSyncObjectsInCompanionQueue:](self, "setDeltaSyncObjectsInCompanionQueue:", +[NSMutableArray array](NSMutableArray, "array"));
  -[CLAuthSyncManager setDeltaSyncObjectsInGizmoQueue:](self, "setDeltaSyncObjectsInGizmoQueue:", +[NSMutableArray array](NSMutableArray, "array"));
  -[CLAuthSyncManager setNotificationsInCompanionQueue:](self, "setNotificationsInCompanionQueue:", +[NSMutableArray array](NSMutableArray, "array"));
  -[CLAuthSyncManager setNotificationsInGizmoQueue:](self, "setNotificationsInGizmoQueue:", +[NSMutableArray array](NSMutableArray, "array"));
  -[CLAuthSyncManager setPreDaytonaMapping:](self, "setPreDaytonaMapping:", sub_1007DA964());
  -[CLAuthSyncManager setShouldSendMoreDataInCurrentSyncSession:](self, "setShouldSendMoreDataInCurrentSyncSession:", 0);
  -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 0);
  -[CLAuthSyncManager setShouldConfirmHandlingQuickSwitchNotification:](self, "setShouldConfirmHandlingQuickSwitchNotification:", 0);
  -[CLAuthSyncManager setResetRecoveryMode:](self, "setResetRecoveryMode:", 0);
  -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 0);
  -[CLAuthSyncManager setIsThereAWatch:](self, "setIsThereAWatch:", 0);
  -[CLAuthSyncManager setIsDeviceNearbyAndConnected:](self, "setIsDeviceNearbyAndConnected:", 0);
  -[CLAuthSyncManager setIsQuickSwitchInProgress:](self, "setIsQuickSwitchInProgress:", 0);
  -[CLAuthSyncManager setIsConflictResolutionMode:](self, "setIsConflictResolutionMode:", 0);
  -[CLAuthSyncManager setCurrentSyncSessionCollidedWithResetSync:](self, "setCurrentSyncSessionCollidedWithResetSync:", 0);
  -[CLAuthSyncManager setShouldResetAuthDbOnFullSync:](self, "setShouldResetAuthDbOnFullSync:", 0);
  -[CLAuthSyncManager setWatchProductVersion:](self, "setWatchProductVersion:", 0xFFFFFFFFLL);
  -[CLAuthSyncManager setAuthSyncStoreState:](self, "setAuthSyncStoreState:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CLAuthSyncManager setSyncSessionRetryInterval:](self, "setSyncSessionRetryInterval:", 300.0);
  -[CLAuthSyncManager setNumberOfConsecutiveSyncSessionRetries:](self, "setNumberOfConsecutiveSyncSessionRetries:", 0);
  -[CLAuthSyncManager setReunionSyncLists:](self, "setReunionSyncLists:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CLAuthSyncManager setReunionSyncListPaths:](self, "setReunionSyncListPaths:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CLAuthSyncManager updateActivePairedDeviceInfo](self, "updateActivePairedDeviceInfo");
  -[CLAuthSyncManager setSettings:](self, "setSettings:", objc_msgSend(objc_alloc((Class)CLSettingsMirror), "initInUniverse:", -[CLAuthSyncManager universe](self, "universe")));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009BC41C;
  v12[3] = &unk_102153360;
  v12[4] = self;
  -[CLSettingsMirror setSettingsChangeHandler:](-[CLAuthSyncManager settings](self, "settings"), "setSettingsChangeHandler:", v12);
  v4 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v4, "addObserver:selector:name:object:", self, "deviceDidPairNotification:", off_1022A6240[0](), 0);
  v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "deviceDidUnpairNotification:", off_1022A6248[0](), 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v7 = (const __CFString *)off_1022A6250[0]();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1009BC424, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  -[CLAuthSyncManager setSyncCoordinator:](self, "setSyncCoordinator:", objc_msgSend((Class)off_1022A6258[0](), "syncCoordinatorWithServiceName:", CFSTR("com.apple.pairedsync.locationauth")));
  -[PSYSyncCoordinator setDelegate:](-[CLAuthSyncManager syncCoordinator](self, "syncCoordinator"), "setDelegate:", self);
  -[CLAuthSyncManager setSyncRestriction:](self, "setSyncRestriction:", -[PSYSyncCoordinator syncRestriction](-[CLAuthSyncManager syncCoordinator](self, "syncCoordinator"), "syncRestriction"));
  -[CLAuthSyncManager setActiveWatchSyncSession:](self, "setActiveWatchSyncSession:", 0);
  if (-[CLAuthSyncManager isThereAWatch](self, "isThereAWatch"))
  {
    v11 = 0;
    -[SYService resume:](-[CLAuthSyncManager syncService](self, "syncService"), "resume:", &v11);
    if (v11)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v8 = qword_1022A01D8;
      if (objc_msgSend(v11, "code") == (id)2002)
      {
        v9 = OS_LOG_TYPE_DEFAULT;
      }
      else if (objc_msgSend(v11, "code") == (id)2003)
      {
        v9 = OS_LOG_TYPE_DEFAULT;
      }
      else
      {
        v9 = OS_LOG_TYPE_FAULT;
      }
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 68289282;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2114;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "{\"msg%{public}.0s\":\"#authsync Resuming SYService failed\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v10 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync SYService resumed\"}", buf, 0x12u);
      }
      -[CLAuthSyncManager checkSyncStoreStateAfterBoot](self, "checkSyncStoreStateAfterBoot");
    }
  }
}

- (void)endService
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[CLAuthSyncManager setClientManager:](self, "setClientManager:", 0);
  -[CLAuthSyncManager setSyncService:](self, "setSyncService:", 0);
  -[CLAuthSyncManager setFullSyncObjectsInCompanionQueue:](self, "setFullSyncObjectsInCompanionQueue:", 0);
  -[CLAuthSyncManager setFullSyncObjectsInGizmoQueue:](self, "setFullSyncObjectsInGizmoQueue:", 0);
  -[CLAuthSyncManager setDeltaSyncObjectsInCompanionQueue:](self, "setDeltaSyncObjectsInCompanionQueue:", 0);
  -[CLAuthSyncManager setDeltaSyncObjectsInGizmoQueue:](self, "setDeltaSyncObjectsInGizmoQueue:", 0);
  -[CLAuthSyncManager setNotificationsInCompanionQueue:](self, "setNotificationsInCompanionQueue:", 0);
  -[CLAuthSyncManager setNotificationsInGizmoQueue:](self, "setNotificationsInGizmoQueue:", 0);
  -[CLAuthSyncManager setAuthSyncStoreState:](self, "setAuthSyncStoreState:", 0);
  -[CLSettingsMirror invalidate](-[CLAuthSyncManager settings](self, "settings"), "invalidate");

  -[CLAuthSyncManager setSettings:](self, "setSettings:", 0);
  -[PSYSyncCoordinator setDelegate:](-[CLAuthSyncManager syncCoordinator](self, "syncCoordinator"), "setDelegate:", 0);
  -[CLAuthSyncManager setSyncCoordinator:](self, "setSyncCoordinator:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)setFullPathForSyncState:(id)a3
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  v5 = a3;

  self->_fullPathForSyncState = (NSString *)a3;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2082;
    v11 = objc_msgSend(a3, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Setting sync state store path\", \"storePath\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
}

- (BOOL)isPairedSyncSessionActive
{
  return objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLPairedSyncSessionActive")), "BOOLValue");
}

- (void)setPairedSyncSessionActive:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CLAuthSyncManager isPairedSyncSessionActive](self, "isPairedSyncSessionActive") != a3)
  {
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3), CFSTR("kCLPairedSyncSessionActive"));
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("kCLPairedSyncSessionActive"));
  }
}

- (BOOL)isWatchBuildVersionPriorTo:(unsigned int)a3
{
  NSObject *v5;
  NSObject *v6;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  if (-[CLAuthSyncManager watchProductVersion](self, "watchProductVersion") == -1)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      v8 = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync Checking isWatchBuildVersionPriorTo when watchProductVersion is NRProductVersionNone\"}", (uint8_t *)&v8, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
    }
    v6 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v8 = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Checking isWatchBuildVersionPriorTo when watchProductVersion is NRProductVersionNone", "{\"msg%{public}.0s\":\"#authsync Checking isWatchBuildVersionPriorTo when watchProductVersion is NRProductVersionNone\"}", (uint8_t *)&v8, 0x12u);
    }
  }
  return -[CLAuthSyncManager watchProductVersion](self, "watchProductVersion") < a3;
}

- (void)deviceDidChangeCapabilitiesDarwinNotification
{
  NSObject *v3;
  unsigned int v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync NRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification\"}", (uint8_t *)v5, 0x12u);
  }
  v4 = -[CLAuthSyncManager watchProductVersion](self, "watchProductVersion");
  -[CLAuthSyncManager updateActivePairedDeviceInfo](self, "updateActivePairedDeviceInfo");
  if (-[CLAuthSyncManager isThereAWatch](self, "isThereAWatch"))
  {
    if (HIWORD(v4) <= 2u && -[CLAuthSyncManager watchProductVersion](self, "watchProductVersion") >= 0x30000)
      -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("GizmoUpdateToDaytona"));
    -[CLAuthSyncManager checkSyncStoreStateAfterBoot](self, "checkSyncStoreStateAfterBoot");
  }
}

- (void)watchMigrationDidStart
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Handling MigrationSync start\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLAuthSyncManager prepareToDoMigrationSync](self, "prepareToDoMigrationSync");
  -[CLAuthSyncManager resetSyncStateKeysRetainingResetKeys:](self, "resetSyncStateKeysRetainingResetKeys:", -[CLAuthSyncManager shouldSendResetNotificationDuringMigrationSyncIgnoringCache:](self, "shouldSendResetNotificationDuringMigrationSyncIgnoringCache:", 1));
  -[CLAuthSyncManager sendNotification:](self, "sendNotification:", 2);
}

- (void)watchMigrationDidEnd
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  __int16 v8;
  const char *v9;

  if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification")), "BOOLValue") & 1) != 0)
  {
    -[CLAuthSyncManager clearReunionSyncList](self, "clearReunionSyncList");
    -[NSMutableDictionary removeObjectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "removeObjectForKey:", CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification"));
    -[NSMutableDictionary removeObjectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "removeObjectForKey:", CFSTR("kCLMigrationSyncInProgress"));
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("MigrationSyncComplete"));
    byte_102305F80 = 0;
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Handling MigrationSync end\"}", (uint8_t *)&v6, 0x12u);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v4 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync kCLHandledMigrationSyncResetVersionNumbersNotification=NO when a full sync completed during migration sync\"}", (uint8_t *)&v6, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
    }
    v5 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync kCLHandledMigrationSyncResetVersionNumbersNotification=NO when a full sync completed during migration sync", "{\"msg%{public}.0s\":\"#authsync kCLHandledMigrationSyncResetVersionNumbersNotification=NO when a full sync completed during migration sync\"}", (uint8_t *)&v6, 0x12u);
    }
    -[CLAuthSyncManager sendNotification:](self, "sendNotification:", 2);
  }
}

- (void)handleQuickSwitch
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  -[CLAuthSyncManager setIsConflictResolutionMode:](self, "setIsConflictResolutionMode:", 0);
  -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 0);
  -[CLAuthSyncManager checkSyncStoreStateAfterQuickSwitch](self, "checkSyncStoreStateAfterQuickSwitch");
  if (-[NSMutableArray count](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "count"))
  {
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
    {
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLFullSyncInProgress"));
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLDeltaSyncInProgress"));
      -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("QuickSwitchDuringDeltaSyncInProgress"));
    }
    -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
    -[CLAuthSyncManager clearReunionSyncList](self, "clearReunionSyncList");
    -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("RecoveryDuringQS-DeltaSyncInProgress"));
  }
  else if (-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress"))
  {
    -[CLAuthSyncManager clearReunionSyncList](self, "clearReunionSyncList");
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      v5 = 2082;
      v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Quick switch, recovered from a pending sync\"}", (uint8_t *)v4, 0x12u);
    }
  }
  else
  {
    -[CLAuthSyncManager syncReunionSyncList](self, "syncReunionSyncList");
  }
}

- (void)updateQuickSwitchMode
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[7];
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t buf;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSMutableDictionary *v16;

  v3 = objc_msgSend(objc_msgSend((Class)off_1022A6260[0](), "sharedInstance"), "getPairedDevices");
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = sub_10020707C;
  v11[4] = sub_100207BF0;
  v11[5] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = sub_10020707C;
  v10[4] = sub_100207BF0;
  v10[5] = 0;
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Quick switch mode : OFF\"}", (uint8_t *)&buf, 0x12u);
    }
    -[CLAuthSyncManager setIsQuickSwitchModeOn:](self, "setIsQuickSwitchModeOn:", 0);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v4 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Quick switch mode : ON\"}", (uint8_t *)&buf, 0x12u);
    }
    -[CLAuthSyncManager setIsQuickSwitchModeOn:](self, "setIsQuickSwitchModeOn:", 1);
    -[NSMutableDictionary removeAllObjects](-[CLAuthSyncManager reunionSyncListPaths](self, "reunionSyncListPaths"), "removeAllObjects");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1009BD2C0;
    v9[3] = &unk_102162C98;
    v9[5] = v11;
    v9[6] = v10;
    v9[4] = self;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1009BD4A4;
    v8[3] = &unk_102162CC0;
    v8[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](-[CLAuthSyncManager reunionSyncListPaths](self, "reunionSyncListPaths"), "enumerateKeysAndObjectsUsingBlock:", v8);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[CLAuthSyncManager reunionSyncLists](self, "reunionSyncLists");
      buf = 68289282;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Client keys in reunionSyncLists\", \"reunionSyncLists\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
}

- (void)updateReunionSyncListsWithAuthSyncMessageKey:(id)a3
{
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  id v9;
  CLClientManagerPublicProtocol *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSMutableDictionary *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[8];
  _BYTE v37[32];
  uint64_t v38;
  _BYTE v39[128];

  if (-[CLAuthSyncManager isQuickSwitchModeOn](self, "isQuickSwitchModeOn"))
  {
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = -[NSMutableDictionary allKeys](-[CLAuthSyncManager reunionSyncLists](self, "reunionSyncLists"), "allKeys");
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v9 = -[NSMutableDictionary objectForKey:](-[CLAuthSyncManager reunionSyncLists](self, "reunionSyncLists"), "objectForKey:", v8);
          *(_QWORD *)buf = 0;
          *(_QWORD *)v37 = buf;
          *(_QWORD *)&v37[8] = 0x3052000000;
          *(_QWORD *)&v37[16] = sub_10020707C;
          *(_QWORD *)&v37[24] = sub_100207BF0;
          v38 = 0;
          v10 = -[CLAuthSyncManager clientManager](self, "clientManager");
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_1009BDC74;
          v30[3] = &unk_10215AB70;
          v30[4] = a3;
          v30[5] = buf;
          -[CLClientManagerPublicProtocol syncgetDoSync:](v10, "syncgetDoSync:", v30);
          objc_msgSend(v9, "addObject:", *(_QWORD *)(*(_QWORD *)v37 + 40));
          -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager reunionSyncLists](self, "reunionSyncLists"), "setObject:forKey:", v9, v8);
          _Block_object_dispose(buf, 8);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v5);
    }
    v24 = -[NSMutableDictionary allKeys](-[CLAuthSyncManager reunionSyncListPaths](self, "reunionSyncListPaths"), "allKeys");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v24);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13);
          v15 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager reunionSyncLists](self, "reunionSyncLists"), "objectForKey:", -[NSMutableDictionary objectForKey:](-[CLAuthSyncManager reunionSyncListPaths](self, "reunionSyncListPaths"), "objectForKey:", v14)), "allObjects"));
          if (-[NSArray writeToFile:atomically:](v15, "writeToFile:atomically:", v14, 1))
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102162F50);
            v16 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
            {
              v17 = objc_msgSend(v14, "UTF8String");
              *(_DWORD *)buf = 68289538;
              *(_DWORD *)&buf[4] = 0;
              *(_WORD *)v37 = 2082;
              *(_QWORD *)&v37[2] = "";
              *(_WORD *)&v37[10] = 2082;
              *(_QWORD *)&v37[12] = v17;
              *(_WORD *)&v37[20] = 2114;
              *(_QWORD *)&v37[22] = v15;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#authsync Updating ReunionSyncList succeeded\", \"reunionSyncListPath\":%{public, location:escape_only}s, \"reunionSyncList\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          else
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102162F50);
            v18 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
            {
              v19 = objc_msgSend(v14, "UTF8String");
              *(_DWORD *)buf = 68289538;
              *(_DWORD *)&buf[4] = 0;
              *(_WORD *)v37 = 2082;
              *(_QWORD *)&v37[2] = "";
              *(_WORD *)&v37[10] = 2082;
              *(_QWORD *)&v37[12] = v19;
              *(_WORD *)&v37[20] = 2114;
              *(_QWORD *)&v37[22] = v15;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Updating ReunionSyncList failed\", \"reunionSyncListPath\":%{public, location:escape_only}s, \"reunionSyncList\":%{public, location:escape_only}@}", buf, 0x26u);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102162F50);
            }
            v20 = qword_1022A01D8;
            if (os_signpost_enabled((os_log_t)qword_1022A01D8))
            {
              v21 = objc_msgSend(v14, "UTF8String");
              *(_DWORD *)buf = 68289538;
              *(_DWORD *)&buf[4] = 0;
              *(_WORD *)v37 = 2082;
              *(_QWORD *)&v37[2] = "";
              *(_WORD *)&v37[10] = 2082;
              *(_QWORD *)&v37[12] = v21;
              *(_WORD *)&v37[20] = 2114;
              *(_QWORD *)&v37[22] = v15;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Updating ReunionSyncList failed", "{\"msg%{public}.0s\":\"#authsync Updating ReunionSyncList failed\", \"reunionSyncListPath\":%{public, location:escape_only}s, \"reunionSyncList\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v11);
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v22 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v23 = -[CLAuthSyncManager reunionSyncLists](self, "reunionSyncLists");
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v37 = 2082;
      *(_QWORD *)&v37[2] = "";
      *(_WORD *)&v37[10] = 2114;
      *(_QWORD *)&v37[12] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Reunion sync lists on disk after update\", \"syncList\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

- (void)syncReunionSyncList
{
  NSString *v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[7];
  char v23;
  _BYTE v24[128];
  uint64_t buf;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  v3 = -[NSString stringByAppendingPathComponent:](-[NSString stringByDeletingLastPathComponent](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", CFSTR("ReunionSyncList"));
  v4 = +[NSMutableArray arrayWithContentsOfFile:](NSMutableArray, "arrayWithContentsOfFile:", v3);
  if (v4)
  {
    v5 = v4;
    if (-[NSMutableArray count](v4, "count"))
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = -[CLAuthSyncManager isWatchBuildVersionPriorTo:](self, "isWatchBuildVersionPriorTo:", 0x40000);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1009BE15C;
      v22[3] = &unk_102162CE8;
      v22[4] = v6;
      v22[5] = v5;
      v22[6] = self;
      v23 = v7 ^ 1;
      -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](self, "clientManager"), "syncgetDoSync:", v22);
      if ((v7 & 1) == 0)
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v19;
          while (2)
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v19 != v10)
                objc_enumerationMutation(v5);
              v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend(v12, "isEqualToString:", &stru_1021D8FB8) & 1) != 0
                || (objc_msgSend(v12, "isEqualToString:", CFSTR("TOGGLE")) & 1) != 0)
              {
                -[NSMutableArray addObject:](v6, "addObject:", -[CLAuthSyncManager locationServicesToggleAsNotification](self, "locationServicesToggleAsNotification"));
                goto LABEL_33;
              }
            }
            v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
            if (v9)
              continue;
            break;
          }
        }
      }
LABEL_33:
      -[CLAuthSyncManager clearReunionSyncList](self, "clearReunionSyncList");
      -[CLAuthSyncManager prepareToDoReunionSync](self, "prepareToDoReunionSync");
      -[CLAuthSyncManager translateCompanionSyncAuthObjectsInPlace:](self, "translateCompanionSyncAuthObjectsInPlace:", v6);
      -[NSMutableArray addObjectsFromArray:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "addObjectsFromArray:", v6);
      -[CLAuthSyncManager watchNeedsDeltaSync:](self, "watchNeedsDeltaSync:", CFSTR("Reunion"));

    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v14 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289026;
        v26 = 2082;
        v27 = "";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Reunion sync : no sync\"}", (uint8_t *)&buf, 0x12u);
      }
      -[CLAuthSyncManager reunionSyncDidComplete:](self, "reunionSyncDidComplete:", 0);
    }
  }
  else
  {
    if (objc_msgSend(+[NSMutableArray array](NSMutableArray, "array"), "writeToFile:atomically:", v3, 1))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v13 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289282;
        v26 = 2082;
        v27 = "";
        v28 = 2082;
        v29 = -[NSString UTF8String](v3, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync ReunionSyncList created\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v15 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        buf = 68289282;
        v26 = 2082;
        v27 = "";
        v28 = 2082;
        v29 = -[NSString UTF8String](v3, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync ReunionSyncList creation failed\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
      }
      v16 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        v17 = -[NSString UTF8String](v3, "UTF8String");
        buf = 68289282;
        v26 = 2082;
        v27 = "";
        v28 = 2082;
        v29 = v17;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync ReunionSyncList creation failed", "{\"msg%{public}.0s\":\"#authsync ReunionSyncList creation failed\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
    -[CLAuthSyncManager clearReunionSyncList](self, "clearReunionSyncList");
    -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("MissingReunionSyncList"));
  }
}

- (void)clearReunionSyncList
{
  NSString *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  v2 = -[NSString stringByAppendingPathComponent:](-[NSString stringByDeletingLastPathComponent](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", CFSTR("ReunionSyncList"));
  if (-[NSArray writeToFile:atomically:](+[NSArray array](NSArray, "array"), "writeToFile:atomically:", v2, 1))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289282;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = -[NSString UTF8String](v2, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync ReunionSyncList cleared\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v4 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v7 = 68289282;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = -[NSString UTF8String](v2, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync ReunionSyncList clear failed\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
    }
    v5 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v6 = -[NSString UTF8String](v2, "UTF8String");
      v7 = 68289282;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync ReunionSyncList clear failed", "{\"msg%{public}.0s\":\"#authsync ReunionSyncList clear failed\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)createSyncStoreState
{
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  uint64_t v7;
  uint64_t v8;
  NSNumber *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  NSNumber *v13;
  NSDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSFileManager *v19;
  NSString *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSFileAttributeKey v33;
  NSFileProtectionType v34;
  _QWORD v35[7];
  _QWORD v36[7];
  _QWORD v37[8];
  _QWORD v38[8];
  uint64_t buf;
  __int16 v40;
  const char *v41;
  __int16 v42;
  NSMutableDictionary *v43;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  if (-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"))
  {
    -[CLAuthSyncManager setAuthSyncStoreState:](self, "setAuthSyncStoreState:", +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", -[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState")));
    if (-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v3 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289282;
        v40 = 2082;
        v41 = "";
        v42 = 2114;
        v43 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
        v4 = "{\"msg%{public}.0s\":\"#authsync Sync store state exists already\", \"syncStoreState\":%{public, location:escape_only}@}";
        v5 = v3;
        v6 = 28;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&buf, v6);
      }
    }
    else
    {
      HIDWORD(v32) = 1;
      v8 = sub_1001FD94C();
      if (sub_1001E4B84(v8, (const char *)objc_msgSend(CFSTR("kCLResetNotification"), "UTF8String"), (_DWORD *)&v32 + 1))
      {
        v37[0] = CFSTR("kCLPairedSyncSessionActive");
        v37[1] = CFSTR("kCLHandledPairingNotification");
        v38[0] = &__kCFBooleanFalse;
        v38[1] = &__kCFBooleanFalse;
        v37[2] = CFSTR("kCLFullSyncInProgress");
        v37[3] = CFSTR("kCLDeltaSyncInProgress");
        v38[2] = &__kCFBooleanFalse;
        v38[3] = &__kCFBooleanFalse;
        v38[4] = &__kCFBooleanTrue;
        v37[4] = CFSTR("kCLHandledResetNotification");
        v37[5] = CFSTR("kCLSupportsPrecisionReduction");
        v38[5] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLAuthSyncManager isCorrectiveCompensationSupported](self, "isCorrectiveCompensationSupported"));
        v37[6] = CFSTR("kCLResetNotification");
        v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v32));
        v37[7] = CFSTR("kCLToggleNotificationOnGizmo");
        v38[6] = v9;
        v38[7] = &off_10221B9D8;
        v10 = v38;
        v11 = v37;
        v12 = 8;
      }
      else
      {
        v35[0] = CFSTR("kCLPairedSyncSessionActive");
        v35[1] = CFSTR("kCLHandledPairingNotification");
        v36[0] = &__kCFBooleanFalse;
        v36[1] = &__kCFBooleanFalse;
        v35[2] = CFSTR("kCLFullSyncInProgress");
        v35[3] = CFSTR("kCLDeltaSyncInProgress");
        v36[2] = &__kCFBooleanFalse;
        v36[3] = &__kCFBooleanFalse;
        v36[4] = &__kCFBooleanTrue;
        v35[4] = CFSTR("kCLHandledResetNotification");
        v35[5] = CFSTR("kCLSupportsPrecisionReduction");
        v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLAuthSyncManager isCorrectiveCompensationSupported](self, "isCorrectiveCompensationSupported"));
        v35[6] = CFSTR("kCLToggleNotificationOnGizmo");
        v36[5] = v13;
        v36[6] = &off_10221B9D8;
        v10 = v36;
        v11 = v35;
        v12 = 7;
      }
      v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v11, v12);
      LODWORD(v32) = 1;
      v15 = sub_1001FD94C();
      if ((sub_100526244(v15, (const char *)objc_msgSend(CFSTR("kCLToggleNotificationOnCompanion"), "UTF8String"), &v32) & 1) == 0)
      {
        v16 = sub_1001FD94C();
        sub_100019BD4(v16, (const char *)objc_msgSend(CFSTR("kCLToggleNotificationOnCompanion"), "UTF8String"), (unsigned int *)&v32);
        v17 = sub_1001FD94C();
        (*(void (**)(uint64_t))(*(_QWORD *)v17 + 944))(v17);
      }
      -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 1);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v18 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289282;
        v40 = 2082;
        v41 = "";
        v42 = 2114;
        v43 = (NSMutableDictionary *)v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Creating sync store state\", \"syncStoreState\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      }
      v19 = +[NSFileManager defaultManager](NSFileManager, "defaultManager", 0, v32);
      v20 = -[NSString stringByDeletingLastPathComponent](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "stringByDeletingLastPathComponent");
      v33 = NSFileProtectionKey;
      v34 = NSFileProtectionNone;
      -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1), &v31);
      if (v31)
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v21 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
        {
          v22 = -[NSString UTF8String](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "UTF8String");
          buf = 68289282;
          v40 = 2082;
          v41 = "";
          v42 = 2082;
          v43 = (NSMutableDictionary *)v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Directory creation failed\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102162F50);
        }
        v23 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          v24 = -[NSString UTF8String](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "UTF8String");
          buf = 68289282;
          v40 = 2082;
          v41 = "";
          v42 = 2082;
          v43 = (NSMutableDictionary *)v24;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Directory creation failed", "{\"msg%{public}.0s\":\"#authsync Directory creation failed\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
        }
      }
      else
      {
        if (-[NSDictionary writeToFile:atomically:](v14, "writeToFile:atomically:", -[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), 1))
        {
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102162F50);
          v25 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          {
            v26 = -[NSString UTF8String](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "UTF8String");
            buf = 68289282;
            v40 = 2082;
            v41 = "";
            v42 = 2082;
            v43 = (NSMutableDictionary *)v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Creating sync state\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
          }
        }
        else
        {
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102162F50);
          v27 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
          {
            v28 = -[NSString UTF8String](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "UTF8String");
            buf = 68289282;
            v40 = 2082;
            v41 = "";
            v42 = 2082;
            v43 = (NSMutableDictionary *)v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Creating sync state failed\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102162F50);
          }
          v29 = qword_1022A01D8;
          if (os_signpost_enabled((os_log_t)qword_1022A01D8))
          {
            v30 = -[NSString UTF8String](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "UTF8String");
            buf = 68289282;
            v40 = 2082;
            v41 = "";
            v42 = 2082;
            v43 = (NSMutableDictionary *)v30;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Creating sync state failed", "{\"msg%{public}.0s\":\"#authsync Creating sync state failed\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
          }
        }
        -[CLAuthSyncManager setAuthSyncStoreState:](self, "setAuthSyncStoreState:", +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v40 = 2082;
      v41 = "";
      v4 = "{\"msg%{public}.0s\":\"#authsync Empty sync store state path\"}";
      v5 = v7;
      v6 = 18;
      goto LABEL_11;
    }
  }
}

- (void)updateSyncStoreState:(id)a3
{
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  NSMutableDictionary *v20;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  if (-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"))
  {
    if (-[NSMutableDictionary writeToFile:atomically:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "writeToFile:atomically:", -[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), 1))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v5 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 68289538;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2114;
        v18 = a3;
        v19 = 2114;
        v20 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
        v6 = "{\"msg%{public}.0s\":\"#authsync SyncStoreState updated\", \"updateReason\":%{public, location:escape_only}"
             "@, \"newSyncState\":%{public, location:escape_only}@}";
        v7 = v5;
        v8 = 38;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v10 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        v13 = 68289538;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2114;
        v18 = a3;
        v19 = 2082;
        v20 = -[NSString UTF8String](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"updateReason\":%{public, location:escape_only}@, \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&v13, 0x26u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
      }
      v11 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        v12 = -[NSString UTF8String](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "UTF8String");
        v13 = 68289538;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2114;
        v18 = a3;
        v19 = 2082;
        v20 = (NSMutableDictionary *)v12;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Writing SyncStoreState failed", "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"updateReason\":%{public, location:escape_only}@, \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&v13, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v6 = "{\"msg%{public}.0s\":\"#authsync Empty SyncStoreState path\"}";
      v7 = v9;
      v8 = 18;
      goto LABEL_11;
    }
  }
}

- (void)updateSyncStoreStateForVersionedKey:(id)a3 withUpdateReason:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint64_t v11;
  uint32_t v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  NSMutableDictionary *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  unsigned int v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  unsigned int v35;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  if (!-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v9 = "{\"msg%{public}.0s\":\"#authsync Empty SyncStoreState path\"}";
      v10 = v11;
      v12 = 18;
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v12);
      return;
    }
    return;
  }
  v25 = 1;
  v7 = sub_1001FD94C();
  if (sub_1001E4B84(v7, (const char *)objc_msgSend(a3, "UTF8String"), &v25))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("kCLResetNotification"))
      && -[CLAuthSyncManager resetRecoveryMode](self, "resetRecoveryMode"))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v8 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289538;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v30 = 2082;
        v31 = "sending reset notification";
        v32 = 2082;
        v33 = "skipping increment";
        v9 = "{\"msg%{public}.0s\":\"#authsync Recovering\", \"action\":%{public, location:escape_only}s, \"versionNumber"
             "\":%{public, location:escape_only}s}";
        v10 = v8;
LABEL_30:
        v12 = 38;
        goto LABEL_31;
      }
      return;
    }
    v13 = v25;
    if (v25 == 0x7FFFFFFF)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v14 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Resetting the version number back to 1\"}", buf, 0x12u);
      }
      v13 = 1;
    }
    v25 = v13 + 1;
  }
  v15 = sub_1001FD94C();
  sub_10011B4E4(v15, (const char *)objc_msgSend(a3, "UTF8String"), &v25);
  v16 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v16 + 944))(v16);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v17 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (const char *)objc_msgSend(a3, "UTF8String");
    *(_DWORD *)buf = 68289794;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    v30 = 2114;
    v31 = (const char *)a4;
    v32 = 2082;
    v33 = v18;
    v34 = 1026;
    v35 = v25;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Updating daemon cache\", \"updateReason\":%{public, location:escape_only}@, \"key\":%{public, location:escape_only}s, \"value\":%{public}d}", buf, 0x2Cu);
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kCLToggleNotificationOnCompanion")) & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v25), a3);
    if (-[NSMutableDictionary writeToFile:atomically:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "writeToFile:atomically:", -[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), 1))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v19 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v20 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
        *(_DWORD *)buf = 68289538;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v30 = 2114;
        v31 = (const char *)a4;
        v32 = 2114;
        v33 = (const char *)v20;
        v9 = "{\"msg%{public}.0s\":\"#authsync SyncStoreState updated\", \"updateReason\":%{public, location:escape_only}"
             "@, \"newSyncState\":%{public, location:escape_only}@}";
        v10 = v19;
        goto LABEL_30;
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v21 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        v22 = -[NSString UTF8String](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "UTF8String");
        *(_DWORD *)buf = 68289538;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v30 = 2114;
        v31 = (const char *)a4;
        v32 = 2082;
        v33 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"updateReason\":%{public, location:escape_only}@, \"syncStorePath\":%{public, location:escape_only}s}", buf, 0x26u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
      }
      v23 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        v24 = -[NSString UTF8String](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "UTF8String");
        *(_DWORD *)buf = 68289538;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v30 = 2114;
        v31 = (const char *)a4;
        v32 = 2082;
        v33 = v24;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Writing SyncStoreState failed", "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"updateReason\":%{public, location:escape_only}@, \"syncStorePath\":%{public, location:escape_only}s}", buf, 0x26u);
      }
    }
  }
}

- (void)resetSyncStateKeysRetainingResetKeys:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  NSNumber *v12;
  const __CFString *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  _QWORD v16[7];
  _QWORD v17[7];

  v3 = a3;
  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  HIDWORD(v15) = 1;
  v5 = sub_1001FD94C();
  if ((sub_100526244(v5, (const char *)objc_msgSend(CFSTR("kCLToggleNotificationOnCompanion"), "UTF8String"), (_DWORD *)&v15 + 1) & 1) == 0)
  {
    v6 = sub_1001FD94C();
    sub_100019BD4(v6, (const char *)objc_msgSend(CFSTR("kCLToggleNotificationOnCompanion"), "UTF8String"), (unsigned int *)&v15 + 1);
    v7 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 944))(v7);
  }
  v16[0] = CFSTR("kCLPairedSyncSessionActive");
  v16[1] = CFSTR("kCLHandledPairingNotification");
  v17[0] = &__kCFBooleanTrue;
  v17[1] = &__kCFBooleanTrue;
  v16[2] = CFSTR("kCLFullSyncInProgress");
  v16[3] = CFSTR("kCLDeltaSyncInProgress");
  v17[2] = &__kCFBooleanFalse;
  v17[3] = &__kCFBooleanFalse;
  v16[4] = CFSTR("kCLMigrationSyncInProgress");
  v16[5] = CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification");
  v17[4] = &__kCFBooleanTrue;
  v17[5] = &__kCFBooleanFalse;
  v16[6] = CFSTR("kCLToggleNotificationOnGizmo");
  v17[6] = &off_10221B9D8;
  -[CLAuthSyncManager setAuthSyncStoreState:](self, "setAuthSyncStoreState:", +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 7)));
  if (v3)
  {
    LODWORD(v15) = 1;
    v8 = sub_1001FD94C();
    if ((sub_100526244(v8, (const char *)objc_msgSend(CFSTR("kCLResetNotification"), "UTF8String"), &v15) & 1) == 0)
    {
      v9 = sub_1001FD94C();
      sub_100019BD4(v9, (const char *)objc_msgSend(CFSTR("kCLResetNotification"), "UTF8String"), (unsigned int *)&v15);
      v10 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v10 + 944))(v10);
    }
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState", v15), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLHandledResetNotification"));
    v11 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
    v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v15);
    v13 = CFSTR("kCLResetNotification");
    v14 = v11;
  }
  else
  {
    v14 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
    v12 = (NSNumber *)&__kCFBooleanTrue;
    v13 = CFSTR("kCLHandledResetNotification");
  }
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v12, v13);
  -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("MigrationSync-ResetCompanionVersionNumbers"));
}

- (void)checkSyncStoreState
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  NSMutableDictionary *v10;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  if (-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"))
  {
    if (-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v3 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 68289282;
        v6 = 0;
        v7 = 2082;
        v8 = "";
        v9 = 2114;
        v10 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync store state updated from disk\", \"syncState\":%{public, location:escape_only}@}", (uint8_t *)&v5, 0x1Cu);
      }
      -[CLAuthSyncManager checkSyncStoreStateOnCompanion](self, "checkSyncStoreStateOnCompanion");
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v4 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 68289026;
        v6 = 0;
        v7 = 2082;
        v8 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync No sync store state on disk\"}", (uint8_t *)&v5, 0x12u);
      }
      -[CLAuthSyncManager createSyncStoreState](self, "createSyncStoreState");
      -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("MissingSyncStoreStateOnDisk"));
    }
  }
}

- (void)checkSyncStoreStateOnCompanion
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  NSMutableDictionary *v8;
  const __CFString *v9;
  unsigned int v10;
  CLAuthSyncManager *v11;
  unsigned int v12;
  unsigned int v13;
  NSMutableDictionary *v14;
  unsigned int v15;
  unsigned int v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;

  if (!-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLToggleNotificationOnGizmo")))
  {
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &off_10221B9D8, CFSTR("kCLToggleNotificationOnGizmo"));
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("CompanionUpdateToTigris"));
  }
  v16 = 1;
  v3 = sub_1001FD94C();
  if ((sub_100526244(v3, (const char *)objc_msgSend(CFSTR("kCLToggleNotificationOnCompanion"), "UTF8String"), &v16) & 1) == 0)
  {
    v4 = sub_1001FD94C();
    sub_100019BD4(v4, (const char *)objc_msgSend(CFSTR("kCLToggleNotificationOnCompanion"), "UTF8String"), &v16);
    v5 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 944))(v5);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Setting kCLToggleNotificationOnCompanion=1 on first update to Tigris\"}", buf, 0x12u);
    }
  }
  v7 = objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLMigrationSyncInProgress")), "BOOLValue");
  v8 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
  if (v7)
  {
    if (!objc_msgSend(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification")), "BOOLValue"))
    {
      -[CLAuthSyncManager watchMigrationDidStart](self, "watchMigrationDidStart");
      return;
    }
    v9 = CFSTR("Recovery-kCLMigrationSyncInProgress");
    goto LABEL_25;
  }
  if ((objc_msgSend(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", CFSTR("kCLHandledPairingNotification")), "BOOLValue") & 1) == 0)
  {
    if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledResetNotification")), "BOOLValue")|| (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
    {
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLHandledResetNotification"));
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLFullSyncInProgress"));
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLDeltaSyncInProgress"));
      -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("Recovery-kCLHandledPairingNotification"));
    }
    -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 1);
    -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
    v9 = CFSTR("Recovery-kCLHandledPairingNotification");
    goto LABEL_25;
  }
  if (!-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress"))
    -[CLAuthSyncManager checkAllNotificationStatuses](self, "checkAllNotificationStatuses");
  v10 = objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue");
  if (!-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress") && v10)
  {
    if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
    {
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLDeltaSyncInProgress"));
      -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("Recovery-kCLFullSyncInProgress"));
    }
    -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
    v9 = CFSTR("Recovery-kCLFullSyncInProgress");
    goto LABEL_25;
  }
  v12 = -[CLAuthSyncManager isCorrectiveCompensationSupported](self, "isCorrectiveCompensationSupported");
  v13 = objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLSupportsPrecisionReduction")), "BOOLValue");
  v14 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
  if (v12 != v13)
  {
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLAuthSyncManager isCorrectiveCompensationSupported](self, "isCorrectiveCompensationSupported")), CFSTR("kCLSupportsPrecisionReduction"));
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("Recovery-CapabilitiesChanged-kCLFullSyncInProgress"));
    -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
    v11 = self;
    v9 = CFSTR("Recovery-CapabilitiesChanged-kCLFullSyncInProgress");
    goto LABEL_26;
  }
  v15 = objc_msgSend(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue");
  if (!-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress") && v15)
  {
    -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
    v9 = CFSTR("Recovery-kCLDeltaSyncInProgress");
LABEL_25:
    v11 = self;
LABEL_26:
    -[CLAuthSyncManager watchNeedsFullSync:](v11, "watchNeedsFullSync:", v9);
  }
}

- (void)checkSyncStoreStateWhenDevicesConnectAfterDisconnection
{
  NSObject *v3;
  const __CFString *v4;
  unsigned int v5;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLMigrationSyncInProgress")), "BOOLValue"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 68289538;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "migration sync";
      v15 = 2082;
      v16 = "kCLMigrationSyncInProgress=1";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Syncing after devices connecting\", \"requestType\":%{public, location:escape_only}s, \"reason\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
    }
    if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification")), "BOOLValue"))
    {
      v4 = CFSTR("Recovery-NearbyDevice-kCLMigrationSyncInProgress");
LABEL_20:
      -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", v4);
      return;
    }
    -[CLAuthSyncManager watchMigrationDidStart](self, "watchMigrationDidStart");
  }
  else if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledPairingNotification")), "BOOLValue") & 1) != 0)
  {
    if (!-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress"))
      -[CLAuthSyncManager checkAllNotificationStatuses](self, "checkAllNotificationStatuses");
    v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue");
    if (!-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress") && v5)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v6 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 68289538;
        v10 = 0;
        v11 = 2082;
        v12 = "";
        v13 = 2082;
        v14 = "full sync";
        v15 = 2082;
        v16 = "kCLFullSyncInProgress is 1";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Syncing after devices connecting\", \"requestType\":%{public, location:escape_only}s, \"reason\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
      }
      if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
      {
        -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLDeltaSyncInProgress"));
        -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("Recovery-NearbyDevice-kCLFullSyncInProgress"));
      }
      v4 = CFSTR("Recovery-NearbyDevice-kCLFullSyncInProgress");
      goto LABEL_20;
    }
    v7 = objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue");
    if (!-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress") && v7)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v8 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 68289538;
        v10 = 0;
        v11 = 2082;
        v12 = "";
        v13 = 2082;
        v14 = "delta sync";
        v15 = 2082;
        v16 = "kCLDeltaSyncInProgress is 1";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Syncing after devices connecting\", \"requestType\":%{public, location:escape_only}s, \"reason\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
      }
      -[NSMutableArray addObjectsFromArray:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "addObjectsFromArray:", -[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue"));
      -[NSMutableArray addObjectsFromArray:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "addObjectsFromArray:", -[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"));
      -[CLAuthSyncManager watchNeedsDeltaSync:](self, "watchNeedsDeltaSync:", CFSTR("Recovery-NearbyDevice-kCLDeltaSyncInProgress"));
    }
  }
  else
  {
    if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledResetNotification")), "BOOLValue")|| (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
    {
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLHandledResetNotification"));
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLFullSyncInProgress"));
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLDeltaSyncInProgress"));
      -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("Recovery-NearbyDevice-kCLHandledPairingNotification"));
    }
    -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 1);
    -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("Recovery-NearbyDevice-kCLHandledPairingNotification"));
  }
}

- (void)checkSyncStoreStateAfterBoot
{
  uint64_t v3;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  -[CLAuthSyncManager checkSyncStoreState](self, "checkSyncStoreState");
  if (-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledQuickSwitchNotification")))
  {
    v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledQuickSwitchNotification")), "BOOLValue") ^ 1;
  }
  else
  {
    v3 = 0;
  }
  -[CLAuthSyncManager setShouldConfirmHandlingQuickSwitchNotification:](self, "setShouldConfirmHandlingQuickSwitchNotification:", v3);
  if (-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress")
    && -[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledQuickSwitchNotification")))
  {
    -[CLAuthSyncManager clearReunionSyncList](self, "clearReunionSyncList");
  }
  else if (-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledQuickSwitchNotification")))
  {
    -[CLAuthSyncManager syncReunionSyncList](self, "syncReunionSyncList");
  }
}

- (void)checkSyncStoreStateAfterQuickSwitch
{
  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  -[CLAuthSyncManager checkSyncStoreState](self, "checkSyncStoreState");
  if (-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress"))
    -[CLAuthSyncManager clearReunionSyncList](self, "clearReunionSyncList");
}

- (void)checkSyncStoreStateAftreRestrictionChange
{
  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  -[CLAuthSyncManager checkSyncStoreState](self, "checkSyncStoreState");
  if (!-[CLAuthSyncManager recoverySyncInProgress](self, "recoverySyncInProgress"))
  {
    if (-[CLAuthSyncManager isPairedSyncSessionActive](self, "isPairedSyncSessionActive"))
    {
      -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
      -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("ActivePairedSyncSession"));
    }
  }
}

- (void)checkAllNotificationStatuses
{
  -[CLAuthSyncManager checkResetNotificationStatus](self, "checkResetNotificationStatus");
}

- (void)checkResetNotificationStatus
{
  uint64_t v3;
  NSMutableDictionary *v4;
  id v5;
  NSMutableDictionary *v6;
  unsigned int v7;
  unsigned int v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  Block_layout *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  v15 = 0;
  v3 = sub_1001FD94C();
  LODWORD(v3) = sub_1001E4B84(v3, (const char *)objc_msgSend(CFSTR("kCLResetNotification"), "UTF8String"), &v15);
  v4 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
  if ((_DWORD)v3)
  {
    v5 = -[NSMutableDictionary objectForKey:](v4, "objectForKey:", CFSTR("kCLResetNotification"));
    v6 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
    if (v5)
    {
      v7 = objc_msgSend(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", CFSTR("kCLResetNotification")), "intValue");
      v8 = v15;
      v9 = -[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState");
      if (v8 == v7)
      {
        if ((objc_msgSend(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", CFSTR("kCLHandledResetNotification")), "BOOLValue") & 1) != 0)return;
        -[CLAuthSyncManager setResetRecoveryMode:](self, "setResetRecoveryMode:", 1);
        -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v10 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289538;
          v17 = 0;
          v18 = 2082;
          v19 = "";
          v20 = 2082;
          v21 = "reset notification";
          v22 = 2082;
          v23 = "matched but reset wasn't handled";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Recovered\", \"notification\":%{public, location:escape_only}s, \"watchResetNotificationVersion\":%{public, location:escape_only}s}", buf, 0x26u);
        }
        if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
        {
          -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLFullSyncInProgress"));
          -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLDeltaSyncInProgress"));
          -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("Recovery-ResetNotification"));
        }
        v11 = &stru_102162D28;
      }
      else
      {
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15), CFSTR("kCLResetNotification"));
        -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLFullSyncInProgress"));
        -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLDeltaSyncInProgress"));
        -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLHandledResetNotification"));
        -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("Recovery-ResetNotification"));
        -[CLAuthSyncManager setResetRecoveryMode:](self, "setResetRecoveryMode:", 1);
        -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v14 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289538;
          v17 = 0;
          v18 = 2082;
          v19 = "";
          v20 = 2082;
          v21 = "reset notification";
          v22 = 2082;
          v23 = "mismatched";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Recovered\", \"notification\":%{public, location:escape_only}s, \"watchResetNotificationVersion\":%{public, location:escape_only}s}", buf, 0x26u);
        }
        v11 = &stru_102162D48;
      }
    }
    else
    {
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15), CFSTR("kCLResetNotification"));
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLHandledResetNotification"));
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLFullSyncInProgress"));
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLDeltaSyncInProgress"));
      -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("Recovery-ResetNotification-MissingOnWatch"));
      -[CLAuthSyncManager setResetRecoveryMode:](self, "setResetRecoveryMode:", 1);
      -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v13 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289538;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2082;
        v21 = "reset notification";
        v22 = 2082;
        v23 = "missing";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Recovered\", \"notification\":%{public, location:escape_only}s, \"watchResetNotificationVersion\":%{public, location:escape_only}s}", buf, 0x26u);
      }
      v11 = &stru_102162D08;
    }
  }
  else
  {
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", CFSTR("kCLHandledResetNotification")), "BOOLValue") & 1) != 0)return;
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
    {
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLFullSyncInProgress"));
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLDeltaSyncInProgress"));
      -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("Recovery-ResetNotification-Mismatch"));
    }
    -[CLAuthSyncManager setResetRecoveryMode:](self, "setResetRecoveryMode:", 1);
    -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 1);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = "reset notification";
      v22 = 2082;
      v23 = "not present in cache";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Recovered\", \"notification\":%{public, location:escape_only}s, \"watchResetNotificationVersion\":%{public, location:escape_only}s}", buf, 0x26u);
    }
    v11 = &stru_102162D68;
  }
  -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](self, "clientManager"), "syncgetDoSync:", v11);
}

- (void)updateActivePairedDeviceInfo
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSUUID *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSUUID *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  v3 = objc_msgSend((Class)off_1022A6260[0](), "sharedInstance");
  v4 = objc_msgSend(v3, "getActivePairedDevice");
  if (v4)
  {
    v5 = v4;
    -[CLAuthSyncManager setPairedDeviceUUID:](self, "setPairedDeviceUUID:", objc_msgSend(v4, "valueForProperty:", off_1022A6278[0]()));
    v6 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v5, "valueForProperty:", off_1022A6268[0]()), "stringByAppendingPathComponent:", CFSTR("CoreLocation")), "stringByAppendingPathComponent:", CFSTR("AUTH")), "stringByAppendingPathComponent:", CFSTR("SyncState"));
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289794;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = -[CLAuthSyncManager pairedDeviceUUID](self, "pairedDeviceUUID");
      v17 = 2082;
      v18 = objc_msgSend(objc_msgSend(v5, "valueForProperty:", off_1022A6280[0]()), "UTF8String");
      v19 = 2082;
      v20 = objc_msgSend(objc_msgSend(v5, "valueForProperty:", off_1022A6288[0]()), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Device info updated\", \"deviceUUID\":%{public, location:escape_only}@, \"buildVersion\":%{public, location:escape_only}s, \"deviceName\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x30u);
    }
    -[CLAuthSyncManager setFullPathForSyncState:](self, "setFullPathForSyncState:", v6);
    -[CLAuthSyncManager setAuthSyncStoreState:](self, "setAuthSyncStoreState:", +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", -[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState")));
    v8 = (NSUUID *)objc_msgSend(v3, "deviceForNRDevice:fromIDSDevices:", v5, -[IDSService linkedDevicesWithRelationship:](-[CLAuthSyncManager idsService](self, "idsService"), "linkedDevicesWithRelationship:", 1));
    if (-[NSUUID isNearby](v8, "isNearby") && -[NSUUID isConnected](v8, "isConnected"))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v9 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 68289282;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2114;
        v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync device is nearby and connected\", \"idsDevice\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
      }
      -[CLAuthSyncManager setIsDeviceNearbyAndConnected:](self, "setIsDeviceNearbyAndConnected:", 1);
    }
    -[CLAuthSyncManager setIsThereAWatch:](self, "setIsThereAWatch:", 1);
    -[CLAuthSyncManager refreshSettings](self, "refreshSettings");
    -[CLAuthSyncManager setWatchProductVersion:](self, "setWatchProductVersion:", off_1022A6290((uint64_t)v5));
    -[CLAuthSyncManager updateQuickSwitchMode](self, "updateQuickSwitchMode");
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v10 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync No active watch\"}", (uint8_t *)&v11, 0x12u);
    }
    -[CLAuthSyncManager handleZeroActiveWatch](self, "handleZeroActiveWatch");
  }
}

- (void)handleZeroActiveWatch
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  -[CLAuthSyncManager setFullPathForSyncState:](self, "setFullPathForSyncState:", 0);
  -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 0);
  -[CLAuthSyncManager setShouldConfirmHandlingQuickSwitchNotification:](self, "setShouldConfirmHandlingQuickSwitchNotification:", 0);
  -[CLAuthSyncManager setIsThereAWatch:](self, "setIsThereAWatch:", 0);
  -[CLAuthSyncManager setIsDeviceNearbyAndConnected:](self, "setIsDeviceNearbyAndConnected:", 0);
  -[CLAuthSyncManager setIsQuickSwitchInProgress:](self, "setIsQuickSwitchInProgress:", 0);
  -[CLAuthSyncManager setIsConflictResolutionMode:](self, "setIsConflictResolutionMode:", 0);
  -[CLAuthSyncManager setWatchProductVersion:](self, "setWatchProductVersion:", 0xFFFFFFFFLL);
  -[CLAuthSyncManager setPairedDeviceUUID:](self, "setPairedDeviceUUID:", 0);
  -[CLAuthSyncManager setNumberOfConsecutiveSyncSessionRetries:](self, "setNumberOfConsecutiveSyncSessionRetries:", 0);
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInCompanionQueue](self, "fullSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInGizmoQueue](self, "fullSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"), "removeAllObjects");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Zero paired watches\"}", (uint8_t *)v4, 0x12u);
  }
}

- (void)handlePairing
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInCompanionQueue](self, "fullSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInGizmoQueue](self, "fullSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager gizmoDeltaSyncObjects](self, "gizmoDeltaSyncObjects"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager gizmoDeltaSyncObjectsWaitingForAck](self, "gizmoDeltaSyncObjectsWaitingForAck"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"), "removeAllObjects");
  -[CLAuthSyncManager setIsConflictResolutionMode:](self, "setIsConflictResolutionMode:", 0);
  -[CLAuthSyncManager updateActivePairedDeviceInfo](self, "updateActivePairedDeviceInfo");
  -[CLAuthSyncManager createSyncStoreState](self, "createSyncStoreState");
  -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 1);
  -[CLAuthSyncManager setIsQuickSwitchInProgress:](self, "setIsQuickSwitchInProgress:", 0);
  if (-[PSYSyncCoordinator syncRestriction](-[CLAuthSyncManager syncCoordinator](self, "syncCoordinator"), "syncRestriction"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      v5 = 2082;
      v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync restriction is up, waiting for PairedSync callback\"}", (uint8_t *)v4, 0x12u);
    }
  }
  else
  {
    -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("Pairing"));
  }
}

- (void)handleUnpairing
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  -[CLAuthSyncManager updateActivePairedDeviceInfo](self, "updateActivePairedDeviceInfo");
  if (-[CLAuthSyncManager isThereAWatch](self, "isThereAWatch"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      v5 = 2082;
      v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync An inactive watch has unpaired\"}", (uint8_t *)v4, 0x12u);
    }
  }
  else
  {
    -[CLAuthSyncManager handleZeroActiveWatch](self, "handleZeroActiveWatch");
  }
}

- (void)prepareToDoFullSync
{
  if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue")|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
  {
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLFullSyncInProgress"));
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLDeltaSyncInProgress"));
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("FullSyncPrep"));
  }
  -[CLAuthSyncManager setShouldSendMoreDataInCurrentSyncSession:](self, "setShouldSendMoreDataInCurrentSyncSession:", 0);
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInCompanionQueue](self, "fullSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInGizmoQueue](self, "fullSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "addObjectsFromArray:", -[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"));
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"), "removeAllObjects");
}

- (void)prepareToDoReunionSync
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  __int16 v7;
  unsigned int v8;

  if (-[SYService currentSession](-[CLAuthSyncManager syncService](self, "syncService"), "currentSession"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289282;
      v4[1] = 0;
      v5 = 2082;
      v6 = "";
      v7 = 1026;
      v8 = objc_msgSend(-[SYService currentSession](-[CLAuthSyncManager syncService](self, "syncService"), "currentSession"), "isResetSync");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync in progress already - dropping the queue\", \"syncSessionType\":%{public}hhd}", (uint8_t *)v4, 0x18u);
    }
  }
  -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLFullSyncInProgress"));
  -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLDeltaSyncInProgress"));
  -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLHandledQuickSwitchNotification"));
  -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("ReunionSyncPrep"));
  -[CLAuthSyncManager setShouldSendMoreDataInCurrentSyncSession:](self, "setShouldSendMoreDataInCurrentSyncSession:", 0);
  -[CLAuthSyncManager setShouldConfirmHandlingQuickSwitchNotification:](self, "setShouldConfirmHandlingQuickSwitchNotification:", 1);
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInCompanionQueue](self, "fullSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInGizmoQueue](self, "fullSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "addObjectsFromArray:", -[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"));
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"), "removeAllObjects");
}

- (void)prepareToDoMigrationSync
{
  -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLMigrationSyncInProgress"));
  -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification"));
  -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("MigrationSyncStart"));
  -[CLAuthSyncManager setShouldSendMoreDataInCurrentSyncSession:](self, "setShouldSendMoreDataInCurrentSyncSession:", 0);
  -[CLAuthSyncManager setShouldConfirmHandlingQuickSwitchNotification:](self, "setShouldConfirmHandlingQuickSwitchNotification:", 0);
  -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 0);
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInCompanionQueue](self, "fullSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInGizmoQueue](self, "fullSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"), "removeAllObjects");
  byte_102305F80 = 0;
}

- (BOOL)shouldSendResetNotificationDuringMigrationSyncIgnoringCache:(BOOL)a3
{
  uint64_t v4;
  int v6;

  if (a3 || (byte_102305F82 & 1) == 0)
  {
    v6 = 1;
    v4 = sub_1001FD94C();
    if (sub_1001E4B84(v4, (const char *)objc_msgSend(CFSTR("kCLResetNotification"), "UTF8String"), &v6))
      byte_102305F81 = 1;
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledResetNotification")), "BOOLValue") & 1) == 0)byte_102305F81 = 1;
    -[NSArray enumerateObjectsUsingBlock:](+[NSArray arrayWithContentsOfFile:](NSArray, "arrayWithContentsOfFile:", -[NSString stringByAppendingPathComponent:](-[NSString stringByDeletingLastPathComponent](-[CLAuthSyncManager fullPathForSyncState](self, "fullPathForSyncState"), "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", CFSTR("ReunionSyncList"))), "enumerateObjectsUsingBlock:", &stru_102162DA8);
    byte_102305F82 = 1;
  }
  return byte_102305F81;
}

- (id)getFullSyncObjects
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009C1A30;
  v12[3] = &unk_102155328;
  v12[4] = v3;
  -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](self, "clientManager"), "syncgetDoSync:", v12);
  v4 = objc_alloc_init((Class)NSMutableIndexSet);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009C1A5C;
  v11[3] = &unk_102162DD0;
  v11[4] = self;
  v11[5] = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Found more than one global auth state in the full sync queue\"}", buf, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
    }
    v6 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Found more than one global auth state in the full sync queue", "{\"msg%{public}.0s\":\"#authsync Found more than one global auth state in the full sync queue\"}", buf, 0x12u);
    }
  }
  objc_msgSend(v3, "removeObjectsAtIndexes:", v4);

  if (!-[CLAuthSyncManager isWatchBuildVersionPriorTo:](self, "isWatchBuildVersionPriorTo:", 0x40000))
  {
    objc_msgSend(v3, "addObject:", -[CLAuthSyncManager locationServicesToggleAsNotification](self, "locationServicesToggleAsNotification"));
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Adding LS-TOGGLE as a notification to the full sync queue\"}", buf, 0x12u);
    }
  }
  -[CLAuthSyncManager translateCompanionSyncAuthObjectsInPlace:](self, "translateCompanionSyncAuthObjectsInPlace:", v3);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v8 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v3, "description");
    *(_DWORD *)buf = 68289282;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2114;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync syncObjects\", \"syncObjects\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return v3;
}

- (id)locationServicesToggleAsNotification
{
  CLCompanionSyncAuthObject *v3;
  uint64_t v4;
  CLAuthSyncVectorClock *v5;
  CLAuthSyncVectorClock *v6;
  NSObject *v7;
  NSString *v8;
  unsigned int v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSString *v16;

  v3 = objc_alloc_init(CLCompanionSyncAuthObject);
  -[CLCompanionSyncAuthObject setClientKey:](v3, "setClientKey:", CFSTR("TOGGLE"));
  -[CLCompanionSyncAuthObject setAuthMask:](v3, "setAuthMask:", sub_1001A09FC());
  -[CLCompanionSyncAuthObject setClearClient:](v3, "setClearClient:", 0);
  -[CLCompanionSyncAuthObject setNotification:](v3, "setNotification:", 1);
  -[CLCompanionSyncAuthObject setOperationType:](v3, "setOperationType:", 1);
  v10 = 0;
  v4 = sub_1001FD94C();
  sub_100526244(v4, (const char *)objc_msgSend(CFSTR("kCLToggleNotificationOnCompanion"), "UTF8String"), &v10);
  v5 = objc_alloc_init(CLAuthSyncVectorClock);
  -[CLAuthSyncVectorClock setKey:](v5, "setKey:", CFSTR("kCLToggleNotificationOnCompanion"));
  -[CLAuthSyncVectorClock setValue:](v5, "setValue:", v10);
  v6 = objc_alloc_init(CLAuthSyncVectorClock);
  -[CLAuthSyncVectorClock setKey:](v6, "setKey:", CFSTR("kCLToggleNotificationOnGizmo"));
  -[CLAuthSyncVectorClock setValue:](v6, "setValue:", objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLToggleNotificationOnGizmo")), "unsignedIntValue"));
  -[CLCompanionSyncAuthObject addVectorClocks:](v3, "addVectorClocks:", v5);
  -[CLCompanionSyncAuthObject addVectorClocks:](v3, "addVectorClocks:", v6);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[CLCompanionSyncAuthObject description](v3, "description");
    *(_DWORD *)buf = 68289282;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync LS TOGGLE as a notification\", \"locationServicesAsNotification\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return v3;
}

- (id)resetAsNotifcation
{
  CLCompanionSyncAuthObject *v2;

  v2 = objc_alloc_init(CLCompanionSyncAuthObject);
  -[CLCompanionSyncAuthObject setClientKey:](v2, "setClientKey:", CFSTR("RESET"));
  -[CLCompanionSyncAuthObject setAuthMask:](v2, "setAuthMask:", sub_1001A09FC());
  -[CLCompanionSyncAuthObject setClearClient:](v2, "setClearClient:", 0);
  -[CLCompanionSyncAuthObject setNotification:](v2, "setNotification:", 0);
  -[CLCompanionSyncAuthObject setOperationType:](v2, "setOperationType:", 1);
  return v2;
}

- (id)migrationSyncResetVersionNumbersNotification
{
  CLCompanionSyncAuthObject *v2;

  v2 = objc_alloc_init(CLCompanionSyncAuthObject);
  -[CLCompanionSyncAuthObject setClientKey:](v2, "setClientKey:", CFSTR("MIGRATION_SYNC_RESET_VERSION_NUMBERS"));
  -[CLCompanionSyncAuthObject setAuthMask:](v2, "setAuthMask:", sub_1001A09FC());
  -[CLCompanionSyncAuthObject setClearClient:](v2, "setClearClient:", 0);
  -[CLCompanionSyncAuthObject setNotification:](v2, "setNotification:", 2);
  -[CLCompanionSyncAuthObject setOperationType:](v2, "setOperationType:", 1);
  return v2;
}

- (void)translateCompanionSyncAuthObjectsInPlace:(id)a3
{
  if (!-[CLAuthSyncManager isCorrectiveCompensationSupported](self, "isCorrectiveCompensationSupported"))
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", &stru_102162E10);
}

- (id)getTranslatedGizmoKeyForCompanionClient:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  if (!-[CLAuthSyncManager isWatchBuildVersionPriorTo:](self, "isWatchBuildVersionPriorTo:", 196608))
    return a3;
  v5 = -[NSDictionary objectForKey:](-[CLAuthSyncManager preDaytonaMapping](self, "preDaytonaMapping"), "objectForKey:", a3);
  if (!v5)
    return a3;
  v6 = v5;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289538;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = objc_msgSend(a3, "UTF8String");
    v14 = 2082;
    v15 = objc_msgSend(v6, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync translating client keys\", \"fromClient\":%{public, location:escape_only}s, \"toClient\":%{public, location:escape_only}s}", (uint8_t *)v9, 0x26u);
  }
  return v6;
}

- (BOOL)isResetNotificationQueued
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009C2338;
  v4[3] = &unk_102162E38;
  v4[4] = &v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "enumerateObjectsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)endPairedSyncSessionWithError:(id)a3
{
  PSYServiceSyncSession *v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;

  if (-[CLAuthSyncManager isPairedSyncSessionActive](self, "isPairedSyncSessionActive"))
  {
    v5 = -[CLAuthSyncManager activeWatchSyncSession](self, "activeWatchSyncSession");
    if (a3)
      -[PSYServiceSyncSession syncDidFailWithError:](v5, "syncDidFailWithError:", a3);
    else
      -[PSYServiceSyncSession syncDidComplete](v5, "syncDidComplete");
    -[CLAuthSyncManager setPairedSyncSessionActive:](self, "setPairedSyncSessionActive:", 0);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync session completion - PS - kCLPairedSyncSessionActive\"}", (uint8_t *)v7, 0x12u);
    }
  }
}

- (void)updateRetrySyncInterval:(id)a3
{
  id v5;
  BOOL v6;
  id v7;
  double v8;

  v5 = objc_msgSend(a3, "domain");
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.identityservices.error")))
  {
    v6 = objc_msgSend(a3, "code") == (id)23;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("SYErrorDomain")))
  {
    v7 = objc_msgSend(a3, "code");
    v8 = 305.0;
    if (v7 != (id)2005 && v7 != (id)2023)
    {
      if (v7 == (id)2007)
        v8 = 5.0;
      else
        v8 = 300.0;
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("NMSErrorDomain")))
  {
    v6 = objc_msgSend(a3, "code") == (id)2;
LABEL_10:
    v8 = 300.0;
    if (v6)
      v8 = 5.0;
LABEL_12:
    -[CLAuthSyncManager setSyncSessionRetryInterval:](self, "setSyncSessionRetryInterval:", v8);
  }
}

- (void)handleError:(id)a3 inSyncSession:(id)a4
{
  uint64_t *v7;
  uint64_t *v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  const char *v13;
  unsigned int v14;
  unsigned int v15;
  double v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  double v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[5];
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  unsigned int v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  unsigned int v64;

  v7 = &qword_1022A0000;
  v8 = &qword_1022A0000;
  if (objc_msgSend(a4, "isSending"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(a4, "identifier");
      v33 = objc_msgSend(a4, "reason");
      v31 = objc_msgSend(a4, "isResetSync");
      objc_msgSend(a4, "state");
      v29 = objc_msgSend(a4, "state");
      v10 = objc_msgSend(a4, "wasCancelled");
      v11 = objc_msgSend(objc_msgSend(a4, "service"), "targetIsInProximity");
      -[SYService sessionStalenessInterval](-[CLAuthSyncManager syncService](self, "syncService"), "sessionStalenessInterval");
      *(_DWORD *)buf = 68291842;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v43 = 2114;
      v44 = (uint64_t)v35;
      v45 = 2114;
      v46 = v33;
      v47 = 1026;
      v48 = v31;
      v49 = 2050;
      v50 = v29;
      v51 = 1026;
      v52 = v10;
      v53 = 1026;
      v54 = v11;
      v55 = 2050;
      v56 = (uint64_t)v12;
      v57 = 2114;
      v58 = objc_msgSend(a3, "domain");
      v59 = 2050;
      v60 = objc_msgSend(a3, "code");
      v8 = &qword_1022A0000;
      v61 = 2114;
      v62 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
      v7 = &qword_1022A0000;
      v63 = 1026;
      v64 = -[CLAuthSyncManager numberOfConsecutiveSyncSessionRetries](self, "numberOfConsecutiveSyncSessionRetries");
      v13 = "{\"msg%{public}.0s\":\"#authsync Error in sending sync session\", \"sessionIdentifier\":%{public, location:e"
            "scape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{public,"
            " location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"session"
            "StalenessInterval\":%{public}ld, \"errorDomain\":%{public, location:escape_only}@, \"errorCode\":%{public}ld"
            ", \"errorDesc\":%{public, location:escape_only}@, \"retryCount\":%{public}d}";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v13, buf, 0x70u);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_msgSend(a4, "identifier");
      v34 = objc_msgSend(a4, "reason");
      v32 = objc_msgSend(a4, "isResetSync");
      objc_msgSend(a4, "state");
      v30 = objc_msgSend(a4, "state");
      v14 = objc_msgSend(a4, "wasCancelled");
      v15 = objc_msgSend(objc_msgSend(a4, "service"), "targetIsInProximity");
      -[SYService sessionStalenessInterval](-[CLAuthSyncManager syncService](self, "syncService"), "sessionStalenessInterval");
      *(_DWORD *)buf = 68291842;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v43 = 2114;
      v44 = (uint64_t)v36;
      v45 = 2114;
      v46 = v34;
      v47 = 1026;
      v48 = v32;
      v49 = 2050;
      v50 = v30;
      v51 = 1026;
      v52 = v14;
      v53 = 1026;
      v54 = v15;
      v55 = 2050;
      v56 = (uint64_t)v16;
      v57 = 2114;
      v58 = objc_msgSend(a3, "domain");
      v59 = 2050;
      v60 = objc_msgSend(a3, "code");
      v8 = &qword_1022A0000;
      v61 = 2114;
      v62 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
      v7 = &qword_1022A0000;
      v63 = 1026;
      v64 = -[CLAuthSyncManager numberOfConsecutiveSyncSessionRetries](self, "numberOfConsecutiveSyncSessionRetries");
      v13 = "{\"msg%{public}.0s\":\"#authsync Error in receiving sync session\", \"sessionIdentifier\":%{public, location"
            ":escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{publi"
            "c, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"sessi"
            "onStalenessInterval\":%{public}ld, \"errorDomain\":%{public, location:escape_only}@, \"errorCode\":%{public}"
            "ld, \"errorDesc\":%{public, location:escape_only}@, \"retryCount\":%{public}d}";
      goto LABEL_10;
    }
  }
  if ((objc_msgSend(objc_msgSend(a4, "service"), "targetIsInProximity") & 1) != 0)
  {
    -[CLAuthSyncManager updateRetrySyncInterval:](self, "updateRetrySyncInterval:", a3);
    if (!objc_msgSend(a4, "isSending"))
      return;
    if (objc_msgSend(a4, "isResetSync"))
    {
      if (-[CLAuthSyncManager shouldConfirmHandlingPairingNotification](self, "shouldConfirmHandlingPairingNotification"))
      {
        if (v7[58] != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v17 = v8[59];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v40 = 0;
          v41 = 2082;
          v42 = "";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Pairing notification handled\"}", buf, 0x12u);
        }
        if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledPairingNotification")), "BOOLValue") & 1) == 0)-[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLHandledPairingNotification"));
        -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 0);
        -[CLAuthSyncManager endPairedSyncSessionWithError:](self, "endPairedSyncSessionWithError:", a3);
      }
      if (-[CLAuthSyncManager isQuickSwitchInProgress](self, "isQuickSwitchInProgress")
        || -[CLAuthSyncManager shouldConfirmHandlingQuickSwitchNotification](self, "shouldConfirmHandlingQuickSwitchNotification"))
      {
        -[CLAuthSyncManager reunionSyncDidComplete:](self, "reunionSyncDidComplete:", a3);
      }
      if (-[CLAuthSyncManager numberOfConsecutiveSyncSessionRetries](self, "numberOfConsecutiveSyncSessionRetries") <= 99)
      {
        -[CLAuthSyncManager setNumberOfConsecutiveSyncSessionRetries:](self, "setNumberOfConsecutiveSyncSessionRetries:", (char *)-[CLAuthSyncManager numberOfConsecutiveSyncSessionRetries](self, "numberOfConsecutiveSyncSessionRetries")+ 1);
        v18 = objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo");
        -[CLAuthSyncManager syncSessionRetryInterval](self, "syncSessionRetryInterval");
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_1009C2D60;
        v38[3] = &unk_10212BB58;
        v38[4] = self;
        objc_msgSend(v18, "afterInterval:async:", v38);
      }
      goto LABEL_42;
    }
    if (-[CLAuthSyncManager numberOfConsecutiveSyncSessionRetries](self, "numberOfConsecutiveSyncSessionRetries") > 99)
    {
      if (v7[58] != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v28 = v8[59];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      *(_DWORD *)buf = 68289026;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v25 = "{\"msg%{public}.0s\":\"#Warning #authsync Retry limit reached\"}";
      v26 = v28;
      v27 = 18;
    }
    else
    {
      -[CLAuthSyncManager setNumberOfConsecutiveSyncSessionRetries:](self, "setNumberOfConsecutiveSyncSessionRetries:", (char *)-[CLAuthSyncManager numberOfConsecutiveSyncSessionRetries](self, "numberOfConsecutiveSyncSessionRetries")+ 1);
      v20 = objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo");
      -[CLAuthSyncManager syncSessionRetryInterval](self, "syncSessionRetryInterval");
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1009C2E7C;
      v37[3] = &unk_10212BB58;
      v37[4] = self;
      objc_msgSend(v20, "afterInterval:async:", v37);
      if (v7[58] != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v21 = v8[59];
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      -[CLAuthSyncManager syncSessionRetryInterval](self, "syncSessionRetryInterval");
      v23 = (uint64_t)v22;
      v24 = -[CLAuthSyncManager numberOfConsecutiveSyncSessionRetries](self, "numberOfConsecutiveSyncSessionRetries");
      *(_DWORD *)buf = 68289538;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v43 = 2050;
      v44 = v23;
      v45 = 1026;
      LODWORD(v46) = v24;
      v25 = "{\"msg%{public}.0s\":\"#authsync Will retry another sync session\", \"retryInterval\":%{public}ld, \"retryCo"
            "unt\":%{public}d}";
      v26 = v21;
      v27 = 34;
    }
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
LABEL_41:
    -[NSMutableArray addObjectsFromArray:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "addObjectsFromArray:", -[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue"));
    -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue"), "removeAllObjects");
LABEL_42:
    -[NSMutableArray addObjectsFromArray:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "addObjectsFromArray:", -[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"));
    -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"), "removeAllObjects");
    return;
  }
  if (v7[58] != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v19 = v8[59];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync No devices in promixity. Not retrying.\"}", buf, 0x12u);
  }
}

- (void)fullSyncDidComplete
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unsigned int v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char v22;
  NSMutableArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = -[CLAuthSyncManager fullSyncObjectsInGizmoQueue](self, "fullSyncObjectsInGizmoQueue");
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v6);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v8 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289282;
          v34 = 0;
          v35 = 2082;
          v36 = "";
          v37 = 2114;
          v38 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Delivered\", \"fullSyncMessage\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v4);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = -[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue");
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (!v9)
  {
    v22 = 0;
    goto LABEL_41;
  }
  v10 = v9;
  v22 = 0;
  v11 = *(_QWORD *)v25;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v12);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v14 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v34 = 0;
        v35 = 2082;
        v36 = "";
        v37 = 2114;
        v38 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Delivered\", \"notificationMessage\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      v15 = objc_msgSend(v13, "notification");
      switch(v15)
      {
        case 2u:
          -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification"));
          if (-[CLAuthSyncManager shouldSendResetNotificationDuringMigrationSyncIgnoringCache:](self, "shouldSendResetNotificationDuringMigrationSyncIgnoringCache:", 0))
          {
            -[CLAuthSyncManager sendNotification:](self, "sendNotification:", 0);
          }
          else
          {
            -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("MigrationSync"));
          }
LABEL_36:
          v22 = 1;
          goto LABEL_37;
        case 1u:
          goto LABEL_37;
        case 0u:
          -[CLAuthSyncManager setResetRecoveryMode:](self, "setResetRecoveryMode:", 0);
          if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledResetNotification")), "BOOLValue") & 1) != 0)goto LABEL_37;
          -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLHandledResetNotification"));
          goto LABEL_36;
      }
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v16 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        v17 = objc_msgSend(objc_msgSend(v13, "clientKey"), "UTF8String");
        *(_DWORD *)buf = 68289282;
        v34 = 0;
        v35 = 2082;
        v36 = "";
        v37 = 2082;
        v38 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Unknown notification type\", \"notificationName\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
      }
      v18 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        v19 = objc_msgSend(objc_msgSend(v13, "clientKey"), "UTF8String");
        *(_DWORD *)buf = 68289282;
        v34 = 0;
        v35 = 2082;
        v36 = "";
        v37 = 2082;
        v38 = v19;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Unknown notification type", "{\"msg%{public}.0s\":\"#authsync Unknown notification type\", \"notificationName\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
LABEL_37:
      v12 = (char *)v12 + 1;
    }
    while (v10 != v12);
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  }
  while (v10);
LABEL_41:
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInGizmoQueue](self, "fullSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"), "removeAllObjects");
  if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLMigrationSyncInProgress")), "BOOLValue"))-[CLAuthSyncManager watchMigrationDidEnd](self, "watchMigrationDidEnd");
  if (-[CLAuthSyncManager shouldConfirmHandlingPairingNotification](self, "shouldConfirmHandlingPairingNotification"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v20 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v34 = 0;
      v35 = 2082;
      v36 = "";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Pairing notification handled\"}", buf, 0x12u);
    }
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledPairingNotification")), "BOOLValue") & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLHandledPairingNotification"));
      v22 = 1;
    }
    -[CLAuthSyncManager setShouldConfirmHandlingPairingNotification:](self, "setShouldConfirmHandlingPairingNotification:", 0);
    -[CLAuthSyncManager endPairedSyncSessionWithError:](self, "endPairedSyncSessionWithError:", 0);
  }
  if (-[CLAuthSyncManager isQuickSwitchInProgress](self, "isQuickSwitchInProgress")
    || -[CLAuthSyncManager shouldConfirmHandlingQuickSwitchNotification](self, "shouldConfirmHandlingQuickSwitchNotification"))
  {
    -[CLAuthSyncManager reunionSyncDidComplete:](self, "reunionSyncDidComplete:", 0);
  }
  if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue"))
  {
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLFullSyncInProgress"));
    goto LABEL_57;
  }
  if ((v22 & 1) != 0)
LABEL_57:
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("FullSyncCompletion"));
  -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 0);
}

- (void)deltaSyncDidComplete:(id)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  char v22;
  NSMutableArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = -[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue", a3);
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v10 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289282;
          v34 = 0;
          v35 = 2082;
          v36 = "";
          v37 = 2114;
          v38 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Delivered\", \"deltaSyncMessage\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v6);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = -[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue");
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v11)
  {
    v12 = v11;
    v22 = 0;
    v13 = *(_QWORD *)v25;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v16 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289282;
          v34 = 0;
          v35 = 2082;
          v36 = "";
          v37 = 2114;
          v38 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Delivered\", \"notificationMessage\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        v17 = objc_msgSend(v15, "notification");
        switch(v17)
        {
          case 2u:
            -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification"));
            if (-[CLAuthSyncManager shouldSendResetNotificationDuringMigrationSyncIgnoringCache:](self, "shouldSendResetNotificationDuringMigrationSyncIgnoringCache:", 0))
            {
              -[CLAuthSyncManager sendNotification:](self, "sendNotification:", 0);
            }
            else
            {
              -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("MigrationSync"));
            }
LABEL_36:
            v22 = 1;
            goto LABEL_37;
          case 1u:
            goto LABEL_37;
          case 0u:
            -[CLAuthSyncManager setResetRecoveryMode:](self, "setResetRecoveryMode:", 0);
            if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledResetNotification")), "BOOLValue") & 1) != 0)goto LABEL_37;
            -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLHandledResetNotification"));
            goto LABEL_36;
        }
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v18 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
        {
          v19 = objc_msgSend(objc_msgSend(v15, "clientKey"), "UTF8String");
          *(_DWORD *)buf = 68289282;
          v34 = 0;
          v35 = 2082;
          v36 = "";
          v37 = 2082;
          v38 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Unknown notification type\", \"notificationName\":%{public, location:escape_only}s}", buf, 0x1Cu);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102162F50);
        }
        v20 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          v21 = objc_msgSend(objc_msgSend(v15, "clientKey"), "UTF8String");
          *(_DWORD *)buf = 68289282;
          v34 = 0;
          v35 = 2082;
          v36 = "";
          v37 = 2082;
          v38 = v21;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Unknown notification type", "{\"msg%{public}.0s\":\"#authsync Unknown notification type\", \"notificationName\":%{public, location:escape_only}s}", buf, 0x1Cu);
        }
LABEL_37:
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (!v12)
        goto LABEL_41;
    }
  }
  v22 = 0;
LABEL_41:
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager deltaSyncObjectsInGizmoQueue](self, "deltaSyncObjectsInGizmoQueue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager notificationsInGizmoQueue](self, "notificationsInGizmoQueue"), "removeAllObjects");
  if (-[CLAuthSyncManager isQuickSwitchInProgress](self, "isQuickSwitchInProgress")
    || -[CLAuthSyncManager shouldConfirmHandlingQuickSwitchNotification](self, "shouldConfirmHandlingQuickSwitchNotification"))
  {
    -[CLAuthSyncManager reunionSyncDidComplete:](self, "reunionSyncDidComplete:", 0);
  }
  if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
  {
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLDeltaSyncInProgress"));
LABEL_47:
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("DeltaSyncCompletion"));
    goto LABEL_48;
  }
  if ((v22 & 1) != 0)
    goto LABEL_47;
LABEL_48:
  -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 0);
}

- (void)reunionSyncDidComplete:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync session completion - PS - reunion sync\"}", (uint8_t *)v6, 0x12u);
  }
  -[CLAuthSyncManager endPairedSyncSessionWithError:](self, "endPairedSyncSessionWithError:", a3);
  -[CLAuthSyncManager setIsQuickSwitchInProgress:](self, "setIsQuickSwitchInProgress:", 0);
  -[CLAuthSyncManager setShouldConfirmHandlingQuickSwitchNotification:](self, "setShouldConfirmHandlingQuickSwitchNotification:", 0);
  -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLHandledQuickSwitchNotification"));
  -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("ReunionSyncCompletion"));
}

- (id)translatedKeyForSimulator:(id)a3
{
  return a3;
}

- (void)applySyncMessage:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "changeType");
  if (v5 == (id)3)
  {
    -[CLAuthSyncManager applyDeleteMessage:](self, "applyDeleteMessage:", a3);
  }
  else if (v5 == (id)2)
  {
    -[CLAuthSyncManager applyUpdateMessage:](self, "applyUpdateMessage:", a3);
  }
  else if (v5 == (id)1)
  {
    -[CLAuthSyncManager applyAddMessage:](self, "applyAddMessage:", a3);
  }
}

- (void)applyAddMessage:(id)a3
{
  uint64_t *v5;
  NSObject *v6;
  unsigned int v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  const mach_header_64 *v12;
  unsigned __int8 v13;
  id v14;
  unsigned __int16 v15;
  __int16 v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  unsigned int v31;
  unsigned int v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  unsigned int v40;
  uint64_t v41;
  id v42;
  unsigned int v43;
  uint32_t v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  unsigned int v54;
  NSObject *v55;
  NSObject *v56;
  unsigned int v57;
  int v58;
  NSObject *v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  NSObject *v70;
  id v71;
  void *v72;
  CLAuthSyncManager *v73;
  CLAuthSyncManager *v74;
  uint64_t v75;
  unsigned int v76;
  _QWORD v77[6];
  unsigned int v78;
  unint64_t v79;
  unsigned __int8 v80;
  __int16 v81;
  _QWORD v82[5];
  unsigned int v83;
  unsigned int v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  int v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  _BYTE v94[10];
  _BYTE v95[6];
  __int16 v96;
  int v97;
  __int16 v98;
  _BOOL4 v99;
  __int16 v100;
  _BOOL4 v101;
  _BYTE v102[128];

  v5 = &qword_1022A0000;
  if (!objc_msgSend(a3, "hasNotification"))
  {
    v73 = self;
    v8 = objc_msgSend(-[CLAuthSyncManager translatedKeyForSimulator:](self, "translatedKeyForSimulator:", objc_msgSend(a3, "clientKey")), "UTF8String");
    v76 = objc_msgSend(a3, "authMask");
    if (objc_msgSend(a3, "hasCorrectiveCompensationMask"))
    {
      v9 = objc_msgSend(a3, "correctiveCompensationMask");
      v10 = v9 & 0xFFFFFF00;
      v11 = v9;
      v12 = &_mh_execute_header;
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v10 = 0;
    }
    v13 = objc_msgSend(a3, "clearClient");
    v14 = a3;
    if (objc_msgSend(a3, "hasSuppressShowingInSettings"))
    {
      v15 = (unsigned __int16)objc_msgSend(a3, "suppressShowingInSettings");
      v16 = 1;
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v17 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v90 = 0;
      v91 = 2082;
      v92 = "";
      v93 = 2114;
      *(_QWORD *)v94 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying auth add message\", \"message\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1009C4D68;
    v77[3] = &unk_102162EA0;
    v78 = v76;
    v79 = (unint64_t)v12 | v10 | v11;
    v80 = v13;
    v81 = v15 | (v16 << 8);
    v77[4] = v14;
    v77[5] = v8;
    -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](v73, "clientManager"), "syncgetDoSync:", v77);
    return;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a3, "notification");
    *(_DWORD *)buf = 68289282;
    v90 = 0;
    v91 = 2082;
    v92 = "";
    v93 = 2050;
    *(_QWORD *)v94 = (int)objc_msgSend(a3, "notification");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying notification message\", \"notification\":%{public, location:CLCompanionSyncAuthObject_CLCompanionSyncNotification}lld}", buf, 0x1Cu);
  }
  v7 = objc_msgSend(a3, "notification");
  if (v7 != 1)
  {
    if (!v7)
    {
      -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](self, "clientManager"), "syncgetDoSync:", &stru_102162E58);
      -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("ResetNotification"));
    }
    return;
  }
  v71 = a3;
  v74 = self;
  if (!objc_msgSend(a3, "vectorClocksCount")
    || (v87 = 0u,
        v88 = 0u,
        v85 = 0u,
        v86 = 0u,
        v18 = objc_msgSend(a3, "vectorClocks"),
        (v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v85, v102, 16)) == 0))
  {
    v75 = 0;
    goto LABEL_76;
  }
  v20 = v19;
  v75 = 0;
  v21 = *(_QWORD *)v86;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v86 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)v22);
      if ((objc_msgSend(v23, "hasKey", v71) & 1) != 0)
      {
        if (objc_msgSend(objc_msgSend(v23, "key"), "isEqualToString:", CFSTR("kCLToggleNotificationOnCompanion")))
        {
          if (objc_msgSend(v23, "hasValue"))
          {
            HIDWORD(v75) = objc_msgSend(v23, "value");
            goto LABEL_72;
          }
          if (v5[58] != -1)
            dispatch_once(&qword_1022A01D0, &stru_102162F50);
          v33 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
          {
            v34 = objc_msgSend(v23, "key");
            *(_DWORD *)buf = 68289282;
            v90 = 0;
            v91 = 2082;
            v92 = "";
            v93 = 2114;
            *(_QWORD *)v94 = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Missing vector clock value\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (v5[58] != -1)
              dispatch_once(&qword_1022A01D0, &stru_102162F50);
          }
          v35 = qword_1022A01D8;
          if (os_signpost_enabled((os_log_t)qword_1022A01D8))
          {
            v36 = objc_msgSend(v23, "key");
            *(_DWORD *)buf = 68289282;
            v90 = 0;
            v91 = 2082;
            v92 = "";
            v93 = 2114;
            *(_QWORD *)v94 = v36;
            v28 = v35;
            v29 = "#authsync Missing vector clock value";
            v30 = "{\"msg%{public}.0s\":\"#authsync Missing vector clock value\", \"key\":%{public, location:escape_only}@}";
            goto LABEL_70;
          }
        }
        else
        {
          v31 = objc_msgSend(objc_msgSend(v23, "key"), "isEqualToString:", CFSTR("kCLToggleNotificationOnGizmo"));
          v32 = objc_msgSend(v23, "hasValue");
          if (v31)
          {
            if (v32)
            {
              LODWORD(v75) = objc_msgSend(v23, "value");
              goto LABEL_72;
            }
            if (v5[58] != -1)
              dispatch_once(&qword_1022A01D0, &stru_102162F50);
            v45 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
            {
              v46 = objc_msgSend(v23, "key");
              *(_DWORD *)buf = 68289282;
              v90 = 0;
              v91 = 2082;
              v92 = "";
              v93 = 2114;
              *(_QWORD *)v94 = v46;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync Missing notificationValue\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
              if (v5[58] != -1)
                dispatch_once(&qword_1022A01D0, &stru_102162F50);
            }
            v47 = qword_1022A01D8;
            if (os_signpost_enabled((os_log_t)qword_1022A01D8))
            {
              v48 = objc_msgSend(v23, "key");
              *(_DWORD *)buf = 68289282;
              v90 = 0;
              v91 = 2082;
              v92 = "";
              v93 = 2114;
              *(_QWORD *)v94 = v48;
              v28 = v47;
              v29 = "#authsync Missing notificationValue";
              v30 = "{\"msg%{public}.0s\":\"#authsync Missing notificationValue\", \"key\":%{public, location:escape_only}@}";
              goto LABEL_70;
            }
          }
          else
          {
            v37 = v5[58];
            if (v32)
            {
              if (v37 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102162F50);
              v38 = qword_1022A01D8;
              if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
              {
                v39 = objc_msgSend(v23, "key");
                v40 = objc_msgSend(v23, "value");
                *(_DWORD *)buf = 68289538;
                v90 = 0;
                v91 = 2082;
                v92 = "";
                v93 = 2114;
                *(_QWORD *)v94 = v39;
                v5 = &qword_1022A0000;
                *(_WORD *)&v94[8] = 1026;
                *(_DWORD *)v95 = v40;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync Unknown vector lock\", \"key\":%{public, location:escape_only}@, \"value\":%{public}d}", buf, 0x22u);
                if (qword_1022A01D0 != -1)
                  dispatch_once(&qword_1022A01D0, &stru_102162F50);
              }
              v41 = qword_1022A01D8;
              if (os_signpost_enabled((os_log_t)qword_1022A01D8))
              {
                v42 = objc_msgSend(v23, "key");
                v43 = objc_msgSend(v23, "value");
                *(_DWORD *)buf = 68289538;
                v90 = 0;
                v91 = 2082;
                v92 = "";
                v93 = 2114;
                *(_QWORD *)v94 = v42;
                v5 = &qword_1022A0000;
                *(_WORD *)&v94[8] = 1026;
                *(_DWORD *)v95 = v43;
                v28 = v41;
                v29 = "#authsync Unknown vector lock";
                v30 = "{\"msg%{public}.0s\":\"#authsync Unknown vector lock\", \"key\":%{public, location:escape_only}@, "
                      "\"value\":%{public}d}";
                v44 = 34;
                goto LABEL_71;
              }
            }
            else
            {
              if (v37 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102162F50);
              v49 = qword_1022A01D8;
              if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
              {
                v50 = objc_msgSend(v23, "key");
                *(_DWORD *)buf = 68289282;
                v90 = 0;
                v91 = 2082;
                v92 = "";
                v93 = 2114;
                *(_QWORD *)v94 = v50;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync Unknown vector lock with no value\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
                if (v5[58] != -1)
                  dispatch_once(&qword_1022A01D0, &stru_102162F50);
              }
              v51 = qword_1022A01D8;
              if (os_signpost_enabled((os_log_t)qword_1022A01D8))
              {
                v52 = objc_msgSend(v23, "key");
                *(_DWORD *)buf = 68289282;
                v90 = 0;
                v91 = 2082;
                v92 = "";
                v93 = 2114;
                *(_QWORD *)v94 = v52;
                v28 = v51;
                v29 = "#authsync Unknown vector lock with no value";
                v30 = "{\"msg%{public}.0s\":\"#authsync Unknown vector lock with no value\", \"key\":%{public, location:escape_only}@}";
LABEL_70:
                v44 = 28;
LABEL_71:
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v29, v30, buf, v44);
              }
            }
          }
        }
      }
      else
      {
        if (v5[58] != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v24 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
        {
          v25 = objc_msgSend(v23, "key");
          *(_DWORD *)buf = 68289282;
          v90 = 0;
          v91 = 2082;
          v92 = "";
          v93 = 2114;
          *(_QWORD *)v94 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Missing vector clock key\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
          if (v5[58] != -1)
            dispatch_once(&qword_1022A01D0, &stru_102162F50);
        }
        v26 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          v27 = objc_msgSend(v23, "key");
          *(_DWORD *)buf = 68289282;
          v90 = 0;
          v91 = 2082;
          v92 = "";
          v93 = 2114;
          *(_QWORD *)v94 = v27;
          v28 = v26;
          v29 = "#authsync Missing vector clock key";
          v30 = "{\"msg%{public}.0s\":\"#authsync Missing vector clock key\", \"key\":%{public, location:escape_only}@}";
          goto LABEL_70;
        }
      }
LABEL_72:
      v22 = (char *)v22 + 1;
    }
    while (v20 != v22);
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
  }
  while (v20);
LABEL_76:
  v84 = 0;
  v53 = sub_1001FD94C();
  v54 = HIDWORD(v75);
  if ((sub_100526244(v53, (const char *)objc_msgSend(CFSTR("kCLToggleNotificationOnCompanion"), "UTF8String"), &v84) & 1) == 0)
  {
    if (v5[58] != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v55 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v90 = 0;
      v91 = 2082;
      v92 = "";
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Missing kCLToggleNotificationOnCompanion on disk\"}", buf, 0x12u);
      if (v5[58] != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
    }
    v56 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289026;
      v90 = 0;
      v91 = 2082;
      v92 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Missing kCLToggleNotificationOnCompanion on disk", "{\"msg%{public}.0s\":\"#authsync Missing kCLToggleNotificationOnCompanion on disk\"}", buf, 0x12u);
    }
  }
  v57 = objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState", v71), "objectForKey:", CFSTR("kCLToggleNotificationOnGizmo")), "unsignedIntValue");
  v58 = sub_1001A09FC();
  if (v5[58] != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v59 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v60 = v84;
    v61 = objc_msgSend(v72, "authMask");
    *(_DWORD *)buf = 68290562;
    v90 = 0;
    v91 = 2082;
    v92 = "";
    v93 = 1026;
    *(_DWORD *)v94 = v60;
    v54 = HIDWORD(v75);
    *(_WORD *)&v94[4] = 1026;
    *(_DWORD *)&v94[6] = HIDWORD(v75);
    *(_WORD *)v95 = 1026;
    *(_DWORD *)&v95[2] = v57;
    v96 = 1026;
    v97 = v75;
    v98 = 1026;
    v99 = v58 != 0;
    v100 = 1026;
    v101 = v61 != 0;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync TOGGLE vector clock\", \"onDiskCompanion\":%{public}d, \"onWireCompanion\":%{public}d, \"onDiskGizmo\":%{public}d, \"onWireGizmo\":%{public}d, \"onDiskLS\":%{public}hhd, \"onWireLS\":%{public}hhd}", buf, 0x36u);
  }
  v62 = v84;
  if (v84 <= v54)
  {
LABEL_91:
    if (v75 <= v57)
      v63 = v57;
    else
      v63 = v75;
    v64 = v62 >= v54;
    if (v62 <= v54)
      v62 = v54;
    v83 = v62;
    if (!v64)
    {
      v65 = sub_1001FD94C();
      sub_100019BD4(v65, (const char *)objc_msgSend(CFSTR("kCLToggleNotificationOnCompanion"), "UTF8String"), &v83);
    }
    if (v75 > v57)
    {
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v63), CFSTR("kCLToggleNotificationOnGizmo"));
      -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("ReceivedLSToggleNotification"));
    }
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1009C4D3C;
    v82[3] = &unk_102155328;
    v82[4] = v72;
    -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](self, "clientManager"), "syncgetDoSync:", v82);
    if (v84 > v54 || v57 > v75)
    {
      if (v57 <= v75)
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v70 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v90 = 0;
          v91 = 2082;
          v92 = "";
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Resolving vector clock conflict\"}", buf, 0x12u);
        }
      }
      else
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v66 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289026;
          v90 = 0;
          v91 = 2082;
          v92 = "";
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync onDiskToggleVersionNumberOnGizmo > onWireToggleVersionNumberOnGizmo\"}", buf, 0x12u);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102162F50);
        }
        v67 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          *(_DWORD *)buf = 68289026;
          v90 = 0;
          v91 = 2082;
          v92 = "";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync onDiskToggleVersionNumberOnGizmo > onWireToggleVersionNumberOnGizmo", "{\"msg%{public}.0s\":\"#authsync onDiskToggleVersionNumberOnGizmo > onWireToggleVersionNumberOnGizmo\"}", buf, 0x12u);
        }
      }
      goto LABEL_122;
    }
  }
  else
  {
    if (objc_msgSend(v72, "authMask") == (v58 != 0))
    {
      v62 = v84;
      goto LABEL_91;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v68 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v90 = 0;
      v91 = 2082;
      v92 = "";
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Resolving the conflict by turning off location services\"}", buf, 0x12u);
    }
    if (v75 <= v57)
      v69 = v57;
    else
      v69 = v75;
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](v74, "authSyncStoreState"), "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v69), CFSTR("kCLToggleNotificationOnGizmo"));
    -[CLAuthSyncManager updateSyncStoreState:](v74, "updateSyncStoreState:", CFSTR("LSToggleConflictResolutionDuringAdd"));
    -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](v74, "clientManager"), "syncgetDoSync:", &stru_102162E78);
    -[CLAuthSyncManager setIsConflictResolutionMode:](v74, "setIsConflictResolutionMode:", 1);
LABEL_122:
    -[CLAuthSyncManager sendNotification:](v74, "sendNotification:", 1);
  }
}

- (void)applyUpdateMessage:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  const mach_header_64 *v10;
  unsigned __int8 v11;
  unsigned __int16 v12;
  __int16 v13;
  NSObject *v14;
  unsigned int v15;
  _QWORD v16[6];
  unsigned int v17;
  unint64_t v18;
  unsigned __int8 v19;
  __int16 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;

  if (objc_msgSend(a3, "hasNotification"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a3, "notification");
      *(_DWORD *)buf = 68289282;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2050;
      v26 = (id)(int)objc_msgSend(a3, "notification");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying notification message\", \"notification\":%{public, location:CLCompanionSyncAuthObject_CLCompanionSyncNotification}lld}", buf, 0x1Cu);
    }
    if (!objc_msgSend(a3, "notification"))
    {
      -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](self, "clientManager"), "syncgetDoSync:", &stru_102162EC0);
      -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("ResetNotification"));
    }
  }
  else
  {
    v6 = objc_msgSend(-[CLAuthSyncManager translatedKeyForSimulator:](self, "translatedKeyForSimulator:", objc_msgSend(a3, "clientKey")), "UTF8String");
    v15 = objc_msgSend(a3, "authMask");
    if (objc_msgSend(a3, "hasCorrectiveCompensationMask"))
    {
      v7 = objc_msgSend(a3, "correctiveCompensationMask");
      v8 = v7 & 0xFFFFFF00;
      v9 = v7;
      v10 = &_mh_execute_header;
    }
    else
    {
      v10 = 0;
      v9 = 0;
      v8 = 0;
    }
    v11 = objc_msgSend(a3, "clearClient");
    if (objc_msgSend(a3, "hasSuppressShowingInSettings"))
    {
      v12 = (unsigned __int16)objc_msgSend(a3, "suppressShowingInSettings");
      v13 = 1;
    }
    else
    {
      v13 = 0;
      v12 = 0;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v14 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2114;
      v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying auth update message\", \"message\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1009C5108;
    v16[3] = &unk_102162EA0;
    v17 = v15;
    v18 = (unint64_t)v10 | v8 | v9;
    v19 = v11;
    v20 = v12 | (v13 << 8);
    v16[4] = a3;
    v16[5] = v6;
    -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](self, "clientManager"), "syncgetDoSync:", v16);
  }
}

- (void)applyDeleteMessage:(id)a3
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = objc_msgSend(-[CLAuthSyncManager translatedKeyForSimulator:](self, "translatedKeyForSimulator:", objc_msgSend(a3, "clientKey")), "UTF8String");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying auth delete message\", \"message\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009C5310;
  v7[3] = &unk_10214C498;
  v7[4] = v5;
  -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](self, "clientManager"), "syncgetDoSync:", v7);
}

- (void)sendGlobalAuthStatus:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  CLCompanionSyncAuthObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;

  v3 = *(_QWORD *)&a3;
  if (-[CLAuthSyncManager isThereAWatch](self, "isThereAWatch"))
  {
    if (-[CLAuthSyncManager isWatchBuildVersionPriorTo:](self, "isWatchBuildVersionPriorTo:", 0x40000))
    {
      -[CLAuthSyncManager updateReunionSyncListsWithAuthSyncMessageKey:](self, "updateReunionSyncListsWithAuthSyncMessageKey:", &stru_1021D8FB8);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v5 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v11 = 0;
        v12 = 2082;
        v13 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending LS toggle to watch running pre-Fortune\"}", buf, 0x12u);
      }
      v6 = objc_alloc_init(CLCompanionSyncAuthObject);
      -[CLCompanionSyncAuthObject setClientKey:](v6, "setClientKey:", &stru_1021D8FB8);
      -[CLCompanionSyncAuthObject setAuthMask:](v6, "setAuthMask:", v3);
      -[CLCompanionSyncAuthObject setOperationType:](v6, "setOperationType:", 1);
      v7 = objc_alloc_init((Class)NSMutableIndexSet);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1009C5648;
      v9[3] = &unk_102162DD0;
      v9[4] = v6;
      v9[5] = v7;
      -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "enumerateObjectsUsingBlock:", v9);
      -[NSMutableArray removeObjectsAtIndexes:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "removeObjectsAtIndexes:", v7);
      -[NSMutableArray addObject:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "addObject:", v6);
      if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue") & 1) == 0)
      {
        -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLDeltaSyncInProgress"));
        -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("GlobalAuthState"));
      }
      -[CLAuthSyncManager watchNeedsDeltaSync:](self, "watchNeedsDeltaSync:", CFSTR("GlobalAuthState"));
    }
    else
    {
      -[CLAuthSyncManager sendNotification:](self, "sendNotification:", 1);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping add global auth sync message in the absence of an active watch\"}", buf, 0x12u);
    }
  }
}

- (void)sendNotification:(int)a3
{
  const __CFString *v4;
  id v5;
  id v6;
  _QWORD v7[6];

  if (a3 == 2)
  {
    v5 = -[CLAuthSyncManager migrationSyncResetVersionNumbersNotification](self, "migrationSyncResetVersionNumbersNotification");
    v4 = CFSTR("MIGRATION_SYNC_RESET_VERSION_NUMBERS");
  }
  else if (a3 == 1)
  {
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLDeltaSyncInProgress"));
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("SendingLSToggleNotification"));
    -[CLAuthSyncManager updateReunionSyncListsWithAuthSyncMessageKey:](self, "updateReunionSyncListsWithAuthSyncMessageKey:", CFSTR("TOGGLE"));
    if (!-[CLAuthSyncManager isConflictResolutionMode](self, "isConflictResolutionMode"))
      -[CLAuthSyncManager updateSyncStoreStateForVersionedKey:withUpdateReason:](self, "updateSyncStoreStateForVersionedKey:withUpdateReason:", CFSTR("kCLToggleNotificationOnCompanion"), CFSTR("LSToggle"));
    v5 = -[CLAuthSyncManager locationServicesToggleAsNotification](self, "locationServicesToggleAsNotification");
    v4 = CFSTR("SendingLSToggleNotification");
  }
  else if (a3)
  {
    v5 = 0;
    v4 = &stru_1021D8FB8;
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLHandledResetNotification"));
    v4 = CFSTR("MigrationSync-RESET");
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("MigrationSync-RESET"));
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLMigrationSyncInProgress")), "BOOLValue") & 1) == 0)
    {
      -[CLAuthSyncManager updateSyncStoreStateForVersionedKey:withUpdateReason:](self, "updateSyncStoreStateForVersionedKey:withUpdateReason:", CFSTR("kCLResetNotification"), CFSTR("ResetNotification"));
      -[CLAuthSyncManager updateReunionSyncListsWithAuthSyncMessageKey:](self, "updateReunionSyncListsWithAuthSyncMessageKey:", CFSTR("RESET"));
      v4 = CFSTR("SendRESET");
    }
    v5 = -[CLAuthSyncManager resetAsNotifcation](self, "resetAsNotifcation");
  }
  v6 = objc_alloc_init((Class)NSMutableIndexSet);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009C5954;
  v7[3] = &unk_102162DD0;
  v7[4] = v5;
  v7[5] = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "enumerateObjectsUsingBlock:", v7);
  -[NSMutableArray removeObjectsAtIndexes:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "removeObjectsAtIndexes:", v6);
  -[NSMutableArray addObject:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "addObject:", v5);
  -[CLAuthSyncManager watchNeedsDeltaSync:](self, "watchNeedsDeltaSync:", v4);
}

- (void)addObject:(id)a3 withSyncSessionReason:(id)a4
{
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;

  -[CLAuthSyncManager updateReunionSyncListsWithAuthSyncMessageKey:](self, "updateReunionSyncListsWithAuthSyncMessageKey:", objc_msgSend(a3, "clientKey"));
  if (-[CLAuthSyncManager isThereAWatch](self, "isThereAWatch"))
  {
    objc_msgSend(a3, "setClientKey:", -[CLAuthSyncManager getTranslatedGizmoKeyForCompanionClient:](self, "getTranslatedGizmoKeyForCompanionClient:", objc_msgSend(a3, "clientKey")));
    v7 = objc_alloc_init((Class)NSMutableIndexSet);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1009C5CAC;
    v9[3] = &unk_102162DD0;
    v9[4] = a3;
    v9[5] = v7;
    -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "enumerateObjectsUsingBlock:", v9);
    -[NSMutableArray removeObjectsAtIndexes:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "removeObjectsAtIndexes:", v7);
    -[NSMutableArray addObject:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "addObject:", a3);
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue") & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLDeltaSyncInProgress"));
      -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("AuthorizationAdd"));
    }
    -[CLAuthSyncManager translateCompanionSyncAuthObjectsInPlace:](self, "translateCompanionSyncAuthObjectsInPlace:", -[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"));
    -[CLAuthSyncManager watchNeedsDeltaSync:](self, "watchNeedsDeltaSync:", a4);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping add auth sync message - no watch\"}", buf, 0x12u);
    }
  }
}

- (void)deleteObject:(id)a3 withSyncSessionReason:(id)a4
{
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;

  -[CLAuthSyncManager updateReunionSyncListsWithAuthSyncMessageKey:](self, "updateReunionSyncListsWithAuthSyncMessageKey:", objc_msgSend(a3, "clientKey"));
  if (-[CLAuthSyncManager isThereAWatch](self, "isThereAWatch"))
  {
    objc_msgSend(a3, "setClientKey:", -[CLAuthSyncManager getTranslatedGizmoKeyForCompanionClient:](self, "getTranslatedGizmoKeyForCompanionClient:", objc_msgSend(a3, "clientKey")));
    v7 = objc_alloc_init((Class)NSMutableIndexSet);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1009C5FF0;
    v9[3] = &unk_102162DD0;
    v9[4] = a3;
    v9[5] = v7;
    -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "enumerateObjectsUsingBlock:", v9);
    -[NSMutableArray removeObjectsAtIndexes:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "removeObjectsAtIndexes:", v7);
    -[NSMutableArray addObject:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "addObject:", a3);
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue") & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLDeltaSyncInProgress"));
      -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("AuthorizationDelete"));
    }
    -[CLAuthSyncManager watchNeedsDeltaSync:](self, "watchNeedsDeltaSync:", a4);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping delete auth sync request - no watch\"}", buf, 0x12u);
    }
  }
}

- (void)watchNeedsFullSync:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[32];

  if (!-[CLAuthSyncManager isThereAWatch](self, "isThereAWatch"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v6 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v12 = 68289026;
    *(_WORD *)v13 = 2082;
    *(_QWORD *)&v13[2] = "";
    v7 = "{\"msg%{public}.0s\":\"#authsync Dropping full auth sync request - no watch\"}";
    v8 = v6;
    v9 = 18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
LABEL_13:
    -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 0, v12, *(_OWORD *)v13, *(_OWORD *)&v13[16]);
    return;
  }
  if (-[CLAuthSyncManager syncRestriction](self, "syncRestriction"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 68289026;
      *(_WORD *)v13 = 2082;
      *(_QWORD *)&v13[2] = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping full auth sync request - sync is restricted\"}", (uint8_t *)&v12, 0x12u);
    }
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLFullSyncInProgress"));
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("DroppingFullSyncRequest-PairedSyncRestrict"));
    goto LABEL_13;
  }
  if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue")|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLDeltaSyncInProgress")), "BOOLValue"))
  {
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLFullSyncInProgress"));
    -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLDeltaSyncInProgress"));
    -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("FullSyncStart"));
  }
  if (!-[CLAuthSyncManager isDeviceNearbyAndConnected](self, "isDeviceNearbyAndConnected"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v11 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v12 = 68289538;
    *(_WORD *)v13 = 2082;
    *(_QWORD *)&v13[2] = "";
    *(_WORD *)&v13[10] = 2114;
    *(_QWORD *)&v13[12] = a3;
    *(_WORD *)&v13[20] = 2114;
    *(_QWORD *)&v13[22] = CFSTR("Device is disconnected");
    v7 = "{\"msg%{public}.0s\":\"#authsync Dropping the full sync request\", \"syncReason\":%{public, location:escape_onl"
         "y}@, \"denialReason\":%{public, location:escape_only}@}";
    v8 = v11;
    v9 = 38;
    goto LABEL_12;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v10 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 68289282;
    *(_WORD *)v13 = 2082;
    *(_QWORD *)&v13[2] = "";
    *(_WORD *)&v13[10] = 2114;
    *(_QWORD *)&v13[12] = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Requesting full sync\", \"syncReason\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
  }
  -[SYService setNeedsResetSync](-[CLAuthSyncManager syncService](self, "syncService"), "setNeedsResetSync");
}

- (void)watchNeedsDeltaSync:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  const __CFString *v14;

  if (-[CLAuthSyncManager isDeviceNearbyAndConnected](self, "isDeviceNearbyAndConnected"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289282;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2114;
      v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Requesting a delta sync session\", \"syncReason\":%{public, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
    }
    -[SYService setHasChangesAvailable](-[CLAuthSyncManager syncService](self, "syncService"), "setHasChangesAvailable");
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289538;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2114;
      v12 = a3;
      v13 = 2114;
      v14 = CFSTR("Device is disconnected");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping the delta sync request\", \"syncReason\":%{public, location:escape_only}@, \"denialReason\":%{public, location:escape_only}@}", (uint8_t *)&v7, 0x26u);
    }
  }
}

- (void)considerPerformingAForcedFullSync
{
  char v2;
  char v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSMutableDictionary *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[10];
  __int16 v28;
  _BYTE v29[10];
  NSMutableDictionary *v30;
  _BYTE v31[128];

  sub_100197040();
  if ((sub_100195F08() & 1) == 0)
  {
    sub_1001E4804(buf);
    v2 = sub_1001C1194(*(uint64_t *)buf, (uint64_t)CFSTR("kCLVersionOfLastFullSync"), &dword_102305F84);
    if (dword_102305F84 == 5)
      v3 = v2;
    else
      v3 = 0;
    v4 = *(std::__shared_weak_count **)v27;
    if (!*(_QWORD *)v27)
      goto LABEL_9;
    v5 = (unint64_t *)(*(_QWORD *)v27 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      if ((v3 & 1) != 0)
        return;
    }
    else
    {
LABEL_9:
      if ((v3 & 1) != 0)
        return;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v27 = 2082;
      *(_QWORD *)&v27[2] = "";
      v28 = 1026;
      *(_DWORD *)v29 = dword_102305F84;
      *(_WORD *)&v29[4] = 1026;
      *(_DWORD *)&v29[6] = 5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Forcing full auth sync due to version\", \"foundVersion\":%{public}d, \"requiredVersion\":%{public}d}", buf, 0x1Eu);
    }
    v8 = objc_msgSend(objc_msgSend((Class)off_1022A6260[0](), "sharedInstance"), "getPairedDevices");
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v23;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v8);
            v12 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v11);
            if (v12 != objc_msgSend(objc_msgSend((Class)off_1022A6260[0](), "sharedInstance"), "getActivePairedDevice"))
            {
              v13 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v12, "valueForProperty:", off_1022A6268[0]()), "stringByAppendingPathComponent:", CFSTR("CoreLocation")), "stringByAppendingPathComponent:", CFSTR("AUTH")), "stringByAppendingPathComponent:", CFSTR("SyncState"));
              v14 = +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v13);
              -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kCLFullSyncInProgress"));
              if (-[NSMutableDictionary writeToFile:atomically:](v14, "writeToFile:atomically:", v13, 1))
              {
                if (qword_1022A01D0 != -1)
                  dispatch_once(&qword_1022A01D0, &stru_102162F50);
                v15 = qword_1022A01D8;
                if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
                {
                  v16 = objc_msgSend(v13, "UTF8String");
                  *(_DWORD *)buf = 68289538;
                  *(_DWORD *)&buf[4] = 0;
                  *(_WORD *)v27 = 2082;
                  *(_QWORD *)&v27[2] = "";
                  v28 = 2082;
                  *(_QWORD *)v29 = v16;
                  *(_WORD *)&v29[8] = 2114;
                  v30 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync SyncStoreState updated\", \"syncStorePath\":%{public, location:escape_only}s, \"newSyncState\":%{public, location:escape_only}@}", buf, 0x26u);
                }
              }
              else
              {
                if (qword_1022A01D0 != -1)
                  dispatch_once(&qword_1022A01D0, &stru_102162F50);
                v17 = qword_1022A01D8;
                if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
                {
                  v18 = objc_msgSend(v13, "UTF8String");
                  *(_DWORD *)buf = 68289282;
                  *(_DWORD *)&buf[4] = 0;
                  *(_WORD *)v27 = 2082;
                  *(_QWORD *)&v27[2] = "";
                  v28 = 2082;
                  *(_QWORD *)v29 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"syncStorePath\":%{public, location:escape_only}s}", buf, 0x1Cu);
                  if (qword_1022A01D0 != -1)
                    dispatch_once(&qword_1022A01D0, &stru_102162F50);
                }
                v19 = qword_1022A01D8;
                if (os_signpost_enabled((os_log_t)qword_1022A01D8))
                {
                  v20 = objc_msgSend(v13, "UTF8String");
                  *(_DWORD *)buf = 68289282;
                  *(_DWORD *)&buf[4] = 0;
                  *(_WORD *)v27 = 2082;
                  *(_QWORD *)&v27[2] = "";
                  v28 = 2082;
                  *(_QWORD *)v29 = v20;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Writing SyncStoreState failed", "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"syncStorePath\":%{public, location:escape_only}s}", buf, 0x1Cu);
                }
              }
            }
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        }
        while (v9);
      }
    }
    -[CLAuthSyncManager watchNeedsFullSync:](self, "watchNeedsFullSync:", CFSTR("FullSyncVersionMismatch"));
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  _BYTE v21[128];

  if (objc_msgSend(a4, "count", a3))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(a4);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (-[NSString isEqualToString:](-[NSUUID UUIDString](-[CLAuthSyncManager pairedDeviceUUID](self, "pairedDeviceUUID"), "UUIDString"), "isEqualToString:", objc_msgSend(objc_msgSend(v10, "nsuuid"), "UUIDString"))&& objc_msgSend(v10, "isNearby")&& objc_msgSend(v10, "isConnected"))
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102162F50);
            v12 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289026;
              v18 = 0;
              v19 = 2082;
              v20 = "";
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Device established peer-to-peer connection\"}", buf, 0x12u);
            }
            -[CLAuthSyncManager setIsDeviceNearbyAndConnected:](self, "setIsDeviceNearbyAndConnected:", 1);
            -[CLAuthSyncManager checkSyncStoreStateWhenDevicesConnectAfterDisconnection](self, "checkSyncStoreStateWhenDevicesConnectAfterDisconnection");
            return;
          }
        }
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
  }
  -[CLAuthSyncManager setIsDeviceNearbyAndConnected:](self, "setIsDeviceNearbyAndConnected:", 0);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v11 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync No nearby devices with peer-to-peer connection\"}", buf, 0x12u);
  }
}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3, a4, a5), "silo"), "assertInside");
  -[SYService suspend](-[CLAuthSyncManager syncService](self, "syncService"), "suspend");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync SYService suspended\"}", (uint8_t *)v7, 0x12u);
  }
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3), "silo"), "assertInside");
  -[CLAuthSyncManager setActivePairingID:](self, "setActivePairingID:", a5);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v8 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    v30 = 2082;
    v31 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
    v32 = 2082;
    v33 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync SYService device switch\", \"oldPairingID\":%{public, location:escape_only}s, \"newPairingID\":%{public, location:escape_only}s}", buf, 0x26u);
  }
  v25 = 0;
  -[SYService resume:](-[CLAuthSyncManager syncService](self, "syncService"), "resume:", &v25);
  if (v25)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v9 = qword_1022A01D8;
    if (objc_msgSend(v25, "code") == (id)2002)
    {
      v10 = OS_LOG_TYPE_DEFAULT;
    }
    else if (objc_msgSend(v25, "code") == (id)2003)
    {
      v10 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      v10 = OS_LOG_TYPE_FAULT;
    }
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 68289282;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 2114;
      v31 = v25;
      v12 = "{\"msg%{public}.0s\":\"#authsync Resuming SYService failed\", \"error\":%{public, location:escape_only}@}";
      v13 = v9;
      v14 = v10;
      v15 = 28;
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v12 = "{\"msg%{public}.0s\":\"#authsync SYService resumed\"}";
      v13 = v11;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 18;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
    }
  }
  if (!a4)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v18 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    *(_DWORD *)buf = 68289026;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    v19 = "{\"msg%{public}.0s\":\"#authsync New/migrated device\"}";
    goto LABEL_33;
  }
  if (a5)
  {
    v16 = objc_msgSend(objc_msgSend((Class)off_1022A6260[0](), "sharedInstance"), "getActivePairedDevice");
    if (v16)
    {
      if (+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v16, "valueForProperty:", off_1022A6268[0]()), "stringByAppendingPathComponent:", CFSTR("CoreLocation")), "stringByAppendingPathComponent:", CFSTR("AUTH")), "stringByAppendingPathComponent:", CFSTR("SyncState"))))
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v17 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v27 = 0;
          v28 = 2082;
          v29 = "";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Quick switch - CS\"}", buf, 0x12u);
        }
        -[CLAuthSyncManager setIsQuickSwitchInProgress:](self, "setIsQuickSwitchInProgress:", 1);
        -[CLAuthSyncManager setShouldConfirmHandlingQuickSwitchNotification:](self, "setShouldConfirmHandlingQuickSwitchNotification:", 1);
        -[CLAuthSyncManager setIsThereAWatch:](self, "setIsThereAWatch:", 1);
        -[CLAuthSyncManager setIsDeviceNearbyAndConnected:](self, "setIsDeviceNearbyAndConnected:", 1);
        -[CLAuthSyncManager updateActivePairedDeviceInfo](self, "updateActivePairedDeviceInfo");
        -[NSMutableDictionary setObject:forKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("kCLHandledQuickSwitchNotification"));
        -[CLAuthSyncManager updateSyncStoreState:](self, "updateSyncStoreState:", CFSTR("QuickSwitch-CS"));
        return;
      }
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v18 = qword_1022A01D8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:
        -[CLAuthSyncManager handlePairing](self, "handlePairing");
        return;
      }
      *(_DWORD *)buf = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v19 = "{\"msg%{public}.0s\":\"#authsync Looks like a new paired device\"}";
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x12u);
      goto LABEL_34;
    }
    -[CLAuthSyncManager setFullPathForSyncState:](self, "setFullPathForSyncState:", 0);
    -[CLAuthSyncManager setIsThereAWatch:](self, "setIsThereAWatch:", 0);
    -[CLAuthSyncManager setIsDeviceNearbyAndConnected:](self, "setIsDeviceNearbyAndConnected:", 0);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v21 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v22 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 2082;
      v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync No watch for pairing ID\", \"CSPairingID\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
    }
    v23 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v24 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 2082;
      v31 = v24;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync No watch for pairing ID", "{\"msg%{public}.0s\":\"#authsync No watch for pairing ID\", \"CSPairingID\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v20 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Watch unpaired\"}", buf, 0x12u);
    }
    -[CLAuthSyncManager handleUnpairing](self, "handleUnpairing");
  }
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  NSObject *v7;
  _BOOL4 v8;
  BOOL result;
  id v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  double v16;
  const char *v17;
  NSObject *v18;
  id v19;
  id v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  double v25;
  const char *v26;
  const __CFString *v27;
  _BOOL4 v28;
  id v29;
  id v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  double v35;
  id v36;
  id v37;
  unsigned int v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  double v42;
  _QWORD v43[5];
  _QWORD v44[5];
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  unsigned int v58;
  __int16 v59;
  unsigned int v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  const char *v64;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3, a4, a5), "silo"), "assertInside");
  objc_msgSend(a4, "setSerializer:", objc_alloc_init(CLAuthSerializer));
  objc_msgSend(a4, "setTargetQueue:", objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "queue"));
  objc_msgSend(a4, "setDelegate:", self);
  -[CLAuthSyncManager setShouldSendMoreDataInCurrentSyncSession:](self, "setShouldSendMoreDataInCurrentSyncSession:", 0);
  if (objc_msgSend(a4, "isSending"))
  {
    if (objc_msgSend(a4, "isResetSync"))
    {
      if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLMigrationSyncInProgress")), "BOOLValue"))
      {
        objc_msgSend(a4, "setReason:", CFSTR("SYSessionReasonMigrationSync-FullSync-FromCompanion"));
        if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification")), "BOOLValue") & 1) == 0)
        {
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_1009C7C68;
          v44[3] = &unk_10212BB58;
          v44[4] = self;
          objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "afterInterval:async:", v44, 30.0);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102162F50);
          v7 = qword_1022A01D8;
          v8 = os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT);
          result = 0;
          if (v8)
          {
            v10 = objc_msgSend(a4, "identifier");
            v11 = objc_msgSend(a4, "reason");
            v12 = objc_msgSend(a4, "isResetSync");
            objc_msgSend(a4, "state");
            v13 = objc_msgSend(a4, "state");
            v14 = objc_msgSend(a4, "wasCancelled");
            v15 = objc_msgSend(objc_msgSend(a4, "service"), "targetIsInProximity");
            -[SYService sessionStalenessInterval](-[CLAuthSyncManager syncService](self, "syncService"), "sessionStalenessInterval");
            *(_DWORD *)buf = 68291074;
            v46 = 0;
            v47 = 2082;
            v48 = "";
            v49 = 2114;
            v50 = v10;
            v51 = 2114;
            v52 = v11;
            v53 = 1026;
            v54 = v12;
            v55 = 2050;
            v56 = v13;
            v57 = 1026;
            v58 = v14;
            v59 = 1026;
            v60 = v15;
            v61 = 2050;
            v62 = (uint64_t)v16;
            v63 = 2082;
            v64 = "MigrationSync-ResetVersionNumbersNotification needs to be handled";
            v17 = "{\"msg%{public}.0s\":\"#authsync Sending sync session rejected\", \"sessionIdentifier\":%{public, loca"
                  "tion:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state"
                  "\":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{pub"
                  "lic}hhd, \"sessionStalenessInterval\":%{public}ld, \"rejectionReason\":%{public, location:escape_only}s}";
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v17, buf, 0x56u);
            return 0;
          }
          return result;
        }
        goto LABEL_28;
      }
      v27 = CFSTR("SYSessionReasonFullSyncFromCompanion");
    }
    else if (-[CLAuthSyncManager isResetNotificationQueued](self, "isResetNotificationQueued"))
    {
      v27 = CFSTR("SYSessionReasonResetFromCompanion");
    }
    else
    {
      if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLMigrationSyncInProgress")), "BOOLValue")&& objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLHandledMigrationSyncResetVersionNumbersNotification")), "BOOLValue"))
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_1009C7CB4;
        v43[3] = &unk_102162EE8;
        v43[4] = a4;
        -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "enumerateObjectsUsingBlock:", v43);
LABEL_28:
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102162F50);
        v18 = qword_1022A01D8;
        if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          return 1;
        v36 = objc_msgSend(a4, "identifier");
        v37 = objc_msgSend(a4, "reason");
        v38 = objc_msgSend(a4, "isResetSync");
        objc_msgSend(a4, "state");
        v39 = objc_msgSend(a4, "state");
        v40 = objc_msgSend(a4, "wasCancelled");
        v41 = objc_msgSend(objc_msgSend(a4, "service"), "targetIsInProximity");
        -[SYService sessionStalenessInterval](-[CLAuthSyncManager syncService](self, "syncService"), "sessionStalenessInterval");
        *(_DWORD *)buf = 68290818;
        v46 = 0;
        v47 = 2082;
        v48 = "";
        v49 = 2114;
        v50 = v36;
        v51 = 2114;
        v52 = v37;
        v53 = 1026;
        v54 = v38;
        v55 = 2050;
        v56 = v39;
        v57 = 1026;
        v58 = v40;
        v59 = 1026;
        v60 = v41;
        v61 = 2050;
        v62 = (uint64_t)v42;
        v26 = "{\"msg%{public}.0s\":\"#authsync Sending sync session started\", \"sessionIdentifier\":%{public, location:"
              "escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{publ"
              "ic, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"se"
              "ssionStalenessInterval\":%{public}ld}";
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v26, buf, 0x4Cu);
        return 1;
      }
      v27 = CFSTR("SYSessionReasonDeltaSyncFromCompanion");
    }
    objc_msgSend(a4, "setReason:", v27);
    goto LABEL_28;
  }
  if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", CFSTR("kCLMigrationSyncInProgress")), "BOOLValue")|| objc_msgSend(a4, "reason") != CFSTR("StandAloneWatchAppAuthorization"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v18 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      return 1;
    v19 = objc_msgSend(a4, "identifier");
    v20 = objc_msgSend(a4, "reason");
    v21 = objc_msgSend(a4, "isResetSync");
    objc_msgSend(a4, "state");
    v22 = objc_msgSend(a4, "state");
    v23 = objc_msgSend(a4, "wasCancelled");
    v24 = objc_msgSend(objc_msgSend(a4, "service"), "targetIsInProximity");
    -[SYService sessionStalenessInterval](-[CLAuthSyncManager syncService](self, "syncService"), "sessionStalenessInterval");
    *(_DWORD *)buf = 68290818;
    v46 = 0;
    v47 = 2082;
    v48 = "";
    v49 = 2114;
    v50 = v19;
    v51 = 2114;
    v52 = v20;
    v53 = 1026;
    v54 = v21;
    v55 = 2050;
    v56 = v22;
    v57 = 1026;
    v58 = v23;
    v59 = 1026;
    v60 = v24;
    v61 = 2050;
    v62 = (uint64_t)v25;
    v26 = "{\"msg%{public}.0s\":\"#authsync Receiving sync session started\", \"sessionIdentifier\":%{public, location:es"
          "cape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{public, lo"
          "cation:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"sessionStale"
          "nessInterval\":%{public}ld}";
    goto LABEL_32;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v7 = qword_1022A01D8;
  v28 = os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v28)
  {
    v29 = objc_msgSend(a4, "identifier");
    v30 = objc_msgSend(a4, "reason");
    v31 = objc_msgSend(a4, "isResetSync");
    objc_msgSend(a4, "state");
    v32 = objc_msgSend(a4, "state");
    v33 = objc_msgSend(a4, "wasCancelled");
    v34 = objc_msgSend(objc_msgSend(a4, "service"), "targetIsInProximity");
    -[SYService sessionStalenessInterval](-[CLAuthSyncManager syncService](self, "syncService"), "sessionStalenessInterval");
    *(_DWORD *)buf = 68291074;
    v46 = 0;
    v47 = 2082;
    v48 = "";
    v49 = 2114;
    v50 = v29;
    v51 = 2114;
    v52 = v30;
    v53 = 1026;
    v54 = v31;
    v55 = 2050;
    v56 = v32;
    v57 = 1026;
    v58 = v33;
    v59 = 1026;
    v60 = v34;
    v61 = 2050;
    v62 = (uint64_t)v35;
    v63 = 2082;
    v64 = "MigrationSync is in progress";
    v17 = "{\"msg%{public}.0s\":\"#authsync Receiving sync session rejected\", \"sessionIdentifier\":%{public, location:e"
          "scape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{public, l"
          "ocation:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"sessionStal"
          "enessInterval\":%{public}ld, \"rejectionReason\":%{public, location:escape_only}s}";
    goto LABEL_25;
  }
  return result;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  id v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3), "silo"), "assertInside");
  -[CLAuthSyncManager setShouldSendMoreDataInCurrentSyncSession:](self, "setShouldSendMoreDataInCurrentSyncSession:", 0);
  if (a5)
  {
    v8 = objc_msgSend(objc_msgSend(a5, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
    if (v8 && objc_msgSend(v8, "code") == (id)32)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v9 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 68289026;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v10 = "{\"msg%{public}.0s\":\"#authsync Sync to/from standalone watch is not supported\"}";
        v11 = v9;
        v12 = OS_LOG_TYPE_DEFAULT;
        v13 = 18;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v16, v13);
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v14 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
      {
        v16 = 68289538;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2114;
        v21 = objc_msgSend(a4, "reason");
        v22 = 2114;
        v23 = a5;
        v10 = "{\"msg%{public}.0s\":\"#authsync Session ended with failure\", \"syncSessionReason\":%{public, location:es"
              "cape_only}@, \"error\":%{public, location:escape_only}@}";
        v11 = v14;
        v12 = OS_LOG_TYPE_DEBUG;
        v13 = 38;
        goto LABEL_16;
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v15 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      v16 = 68289282;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2114;
      v21 = objc_msgSend(a4, "reason");
      v10 = "{\"msg%{public}.0s\":\"#authsync Session ended successfully\", \"syncSessionReason\":%{public, location:escape_only}@}";
      v11 = v15;
      v12 = OS_LOG_TYPE_DEBUG;
      v13 = 28;
      goto LABEL_16;
    }
  }
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3), "silo"), "assertInside");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289538;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2114;
    v12 = a4;
    v13 = 2114;
    v14 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #authsync Error in service\", \"error\":%{public, location:escape_only}@, \"context\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  NSObject *v8;
  unsigned int v9;
  NSObject *v10;
  unsigned int v11;
  const char *v12;
  NSObject *v13;
  unsigned int v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  NSObject *v17;
  char *v18;
  id v19;
  unsigned int v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  NSObject *v23;
  char *v24;
  id v25;
  unsigned int v26;
  _QWORD v28[8];
  _QWORD v29[8];
  _QWORD v30[8];
  _QWORD v31[8];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  char *v46;
  uint8_t buf[8];
  _BYTE v48[24];
  void (*v49)(uint64_t);
  id v50;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3, a4, a5), "silo"), "assertInside");
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 2;
  if (objc_msgSend(a3, "isResetSync"))
  {
    if (-[CLAuthSyncManager shouldSendMoreDataInCurrentSyncSession](self, "shouldSendMoreDataInCurrentSyncSession"))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v8 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "state");
        v9 = objc_msgSend(a3, "state");
        *(_QWORD *)buf = 68289282;
        *(_WORD *)v48 = 2082;
        *(_QWORD *)&v48[2] = "";
        *(_WORD *)&v48[10] = 2050;
        *(_QWORD *)&v48[12] = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending full sync session continues enqueuing\", \"sessionState\":%{public, location:SYSessionState}lld}", buf, 0x1Cu);
      }
    }
    else
    {
      -[CLAuthSyncManager prepareToDoFullSync](self, "prepareToDoFullSync");
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v13 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "state");
        v14 = objc_msgSend(a3, "state");
        *(_QWORD *)buf = 68289282;
        *(_WORD *)v48 = 2082;
        *(_QWORD *)&v48[2] = "";
        *(_WORD *)&v48[10] = 2050;
        *(_QWORD *)&v48[12] = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending full sync session begins enqueuing\", \"sessionState\":%{public, location:SYSessionState}lld}", buf, 0x1Cu);
      }
      -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncObjectsInCompanionQueue](self, "fullSyncObjectsInCompanionQueue"), "removeAllObjects");
      -[NSMutableArray addObjectsFromArray:](-[CLAuthSyncManager fullSyncObjectsInCompanionQueue](self, "fullSyncObjectsInCompanionQueue"), "addObjectsFromArray:", -[CLAuthSyncManager getFullSyncObjects](self, "getFullSyncObjects"));
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)v48 = buf;
    *(_QWORD *)&v48[8] = 0x3052000000;
    *(_QWORD *)&v48[16] = sub_10020707C;
    v49 = sub_100207BF0;
    v50 = 0;
    v50 = objc_alloc_init((Class)NSMutableIndexSet);
    v32 = 0;
    v33 = &v32;
    v34 = 0x3052000000;
    v35 = sub_10020707C;
    v36 = sub_100207BF0;
    v37 = 0;
    v37 = objc_alloc_init((Class)NSMutableIndexSet);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1009C886C;
    v31[3] = &unk_102162F10;
    v31[4] = self;
    v31[5] = a4;
    v31[6] = buf;
    v31[7] = &v38;
    -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager fullSyncObjectsInCompanionQueue](self, "fullSyncObjectsInCompanionQueue"), "enumerateObjectsUsingBlock:", v31);
    v15 = -[CLAuthSyncManager fullSyncObjectsInCompanionQueue](self, "fullSyncObjectsInCompanionQueue");
    -[NSMutableArray removeObjectsAtIndexes:](v15, "removeObjectsAtIndexes:", *(_QWORD *)(*(_QWORD *)v48 + 40));
    if (*((_DWORD *)v39 + 6) == 2)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1009C8ACC;
      v30[3] = &unk_102162F10;
      v30[4] = self;
      v30[5] = a4;
      v30[6] = &v32;
      v30[7] = &v38;
      -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "enumerateObjectsUsingBlock:", v30);
      v16 = -[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue");
      -[NSMutableArray removeObjectsAtIndexes:](v16, "removeObjectsAtIndexes:", v33[5]);
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v17 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (char *)objc_msgSend(*(id *)(*(_QWORD *)v48 + 40), "count");
      v19 = objc_msgSend((id)v33[5], "count");
      v42 = 68289282;
      v43 = 2082;
      v44 = "";
      v45 = 2050;
      v46 = &v18[(_QWORD)v19];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending full sync session finishes enqueuing\", \"numberOfFullSyncMessages\":%{public}lu}", (uint8_t *)&v42, 0x1Cu);
    }
    if (*((_DWORD *)v39 + 6) == 2)
      -[CLAuthSyncManager setShouldSendMoreDataInCurrentSyncSession:](self, "setShouldSendMoreDataInCurrentSyncSession:", 0);
    goto LABEL_38;
  }
  if (-[CLAuthSyncManager shouldSendMoreDataInCurrentSyncSession](self, "shouldSendMoreDataInCurrentSyncSession"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v10 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    objc_msgSend(a3, "state");
    v11 = objc_msgSend(a3, "state");
    *(_QWORD *)buf = 68289282;
    *(_WORD *)v48 = 2082;
    *(_QWORD *)&v48[2] = "";
    *(_WORD *)&v48[10] = 2050;
    *(_QWORD *)&v48[12] = v11;
    v12 = "{\"msg%{public}.0s\":\"#authsync Sending delta sync session continues enqueuings\", \"syncSessionState\":%{pub"
          "lic, location:SYSessionState}lld}";
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v10 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    objc_msgSend(a3, "state");
    v20 = objc_msgSend(a3, "state");
    *(_QWORD *)buf = 68289282;
    *(_WORD *)v48 = 2082;
    *(_QWORD *)&v48[2] = "";
    *(_WORD *)&v48[10] = 2050;
    *(_QWORD *)&v48[12] = v20;
    v12 = "{\"msg%{public}.0s\":\"#authsync Sending delta sync session begins enqueuing\", \"syncSessionState\":%{public,"
          " location:SYSessionState}lld}";
  }
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0x1Cu);
LABEL_30:
  *(_QWORD *)buf = 0;
  *(_QWORD *)v48 = buf;
  *(_QWORD *)&v48[8] = 0x3052000000;
  *(_QWORD *)&v48[16] = sub_10020707C;
  v49 = sub_100207BF0;
  v50 = 0;
  v50 = objc_alloc_init((Class)NSMutableIndexSet);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = sub_10020707C;
  v36 = sub_100207BF0;
  v37 = 0;
  v37 = objc_alloc_init((Class)NSMutableIndexSet);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1009C8D2C;
  v29[3] = &unk_102162F10;
  v29[4] = self;
  v29[5] = a4;
  v29[6] = buf;
  v29[7] = &v38;
  -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue"), "enumerateObjectsUsingBlock:", v29);
  v21 = -[CLAuthSyncManager deltaSyncObjectsInCompanionQueue](self, "deltaSyncObjectsInCompanionQueue");
  -[NSMutableArray removeObjectsAtIndexes:](v21, "removeObjectsAtIndexes:", *(_QWORD *)(*(_QWORD *)v48 + 40));
  if (*((_DWORD *)v39 + 6) == 2)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1009C8F98;
    v28[3] = &unk_102162F10;
    v28[4] = self;
    v28[5] = a4;
    v28[6] = &v32;
    v28[7] = &v38;
    -[NSMutableArray enumerateObjectsUsingBlock:](-[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue"), "enumerateObjectsUsingBlock:", v28);
    v22 = -[CLAuthSyncManager notificationsInCompanionQueue](self, "notificationsInCompanionQueue");
    -[NSMutableArray removeObjectsAtIndexes:](v22, "removeObjectsAtIndexes:", v33[5]);
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v23 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (char *)objc_msgSend(*(id *)(*(_QWORD *)v48 + 40), "count");
    v25 = objc_msgSend((id)v33[5], "count");
    v42 = 68289282;
    v43 = 2082;
    v44 = "";
    v45 = 2050;
    v46 = &v24[(_QWORD)v25];
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending delta sync session finishes enqueuing\", \"numberOfDeltaSyncMessages\":%{public}lu}", (uint8_t *)&v42, 0x1Cu);
  }
  if (*((_DWORD *)v39 + 6) == 2)
    -[CLAuthSyncManager setShouldSendMoreDataInCurrentSyncSession:](self, "setShouldSendMoreDataInCurrentSyncSession:", 0);
LABEL_38:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(buf, 8);
  v26 = *((_DWORD *)v39 + 6);
  _Block_object_dispose(&v38, 8);
  return v26;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  unsigned int v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  unsigned int v53;
  _BYTE v54[128];

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  sub_100197040();
  if (sub_10019DF90() && objc_msgSend(a3, "isResetSync"))
    sub_101911644();
  sub_100197040();
  if (sub_100195F08())
    v9 = objc_msgSend(a3, "isResetSync");
  else
    v9 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(a4);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        -[CLAuthSyncManager updateReunionSyncListsWithAuthSyncMessageKey:](self, "updateReunionSyncListsWithAuthSyncMessageKey:", objc_msgSend(v14, "clientKey"));
        if (v9 && (objc_msgSend(v14, "hasNotification") & 1) == 0)
          -[NSMutableArray addObject:](-[CLAuthSyncManager fullSyncClientsList](self, "fullSyncClientsList"), "addObject:", v14);
        else
          -[CLAuthSyncManager applySyncMessage:](self, "applySyncMessage:", v14);
      }
      v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v54, 16);
    }
    while (v11);
  }
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v15 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(a3, "service");
    v17 = objc_msgSend(a3, "identifier");
    v18 = objc_msgSend(a3, "reason");
    v19 = objc_msgSend(a3, "isSending");
    v20 = objc_msgSend(a3, "isResetSync");
    objc_msgSend(a3, "state");
    v21 = objc_msgSend(a3, "state");
    v22 = objc_msgSend(a3, "wasCancelled");
    v23 = objc_msgSend(objc_msgSend(a3, "service"), "targetIsInProximity");
    *(_DWORD *)buf = 68291842;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 1026;
    v33 = v9;
    v34 = 1026;
    v35 = v9 ^ 1;
    v36 = 2114;
    v37 = v16;
    v38 = 2114;
    v39 = a3;
    v40 = 2114;
    v41 = v17;
    v42 = 2114;
    v43 = v18;
    v44 = 1026;
    v45 = v19;
    v46 = 1026;
    v47 = v20;
    v48 = 2050;
    v49 = v21;
    v50 = 1026;
    v51 = v22;
    v52 = 1026;
    v53 = v23;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Receiving sync session changes\", \"queued\":%{public}hhd, \"applied\":%{public}hhd, \"service\":%{public, location:escape_only}@, \"session\":%{public, location:escape_only}@, \"sessionIdentifier\":%{public, location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isSending\":%{public}hhd, \"isResetSync\":%{public}hhd, \"state\":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd}", buf, 0x68u);
  }
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  unsigned int v7;
  _BOOL4 v8;
  NSObject *v9;
  id v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  double v33;
  const char *v34;
  id v35;
  id v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  double v41;
  id v42;
  _QWORD v43[5];
  uint8_t buf[8];
  _BYTE v45[10];
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  _BYTE v51[20];
  _BYTE v52[6];
  _BYTE v53[14];
  __int16 v54;
  unsigned int v55;
  __int16 v56;
  unsigned int v57;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "assertInside");
  sub_100197040();
  if ((sub_100195F08() & 1) != 0)
  {
    v7 = objc_msgSend(a3, "isResetSync");
    v8 = a4 != 0;
    if (!a4 && v7)
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1009C9C20;
      v43[3] = &unk_102155328;
      v43[4] = self;
      -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLAuthSyncManager clientManager](self, "clientManager"), "syncgetDoSync:", v43);
      -[CLAuthSyncManager setShouldResetAuthDbOnFullSync:](self, "setShouldResetAuthDbOnFullSync:", 0);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v9 = qword_1022A01D8;
      v8 = 0;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v42 = objc_msgSend(a3, "service");
        v10 = objc_msgSend(a3, "identifier");
        v11 = objc_msgSend(a3, "reason");
        v12 = objc_msgSend(a3, "isSending");
        v13 = objc_msgSend(a3, "isResetSync");
        objc_msgSend(a3, "state");
        v14 = objc_msgSend(a3, "state");
        v15 = objc_msgSend(a3, "wasCancelled");
        v16 = objc_msgSend(objc_msgSend(a3, "service"), "targetIsInProximity");
        *(_DWORD *)buf = 68291330;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v45 = 2082;
        *(_QWORD *)&v45[2] = "";
        v46 = 2114;
        v47 = v42;
        v48 = 2114;
        v49 = a3;
        v50 = 2114;
        *(_QWORD *)v51 = v10;
        *(_WORD *)&v51[8] = 2114;
        *(_QWORD *)&v51[10] = v11;
        *(_WORD *)&v51[18] = 1026;
        *(_DWORD *)v52 = v12;
        *(_WORD *)&v52[4] = 1026;
        *(_DWORD *)v53 = v13;
        *(_WORD *)&v53[4] = 2050;
        *(_QWORD *)&v53[6] = v14;
        v54 = 1026;
        v55 = v15;
        v56 = 1026;
        v57 = v16;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Queued sync session changes applied\", \"service\":%{public, location:escape_only}@, \"session\":%{public, location:escape_only}@, \"sessionIdentifier\":%{public, location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isSending\":%{public}hhd, \"isResetSync\":%{public}hhd, \"state\":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd}", buf, 0x5Cu);
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = a4 != 0;
  }
  -[NSMutableArray removeAllObjects](-[CLAuthSyncManager fullSyncClientsList](self, "fullSyncClientsList"), "removeAllObjects");
  -[CLAuthSyncManager setIsConflictResolutionMode:](self, "setIsConflictResolutionMode:", 0);
  -[CLAuthSyncManager setShouldSendMoreDataInCurrentSyncSession:](self, "setShouldSendMoreDataInCurrentSyncSession:", 0);
  v17 = objc_msgSend(a3, "isResetSync");
  if (dword_102305F84 == 5)
    v18 = 0;
  else
    v18 = v17;
  if (v18 == 1)
  {
    sub_1001E4804(buf);
    sub_10011B5B8(*(uint64_t *)buf, CFSTR("kCLVersionOfLastFullSync"), &unk_101BEA420);
    v19 = *(std::__shared_weak_count **)v45;
    if (*(_QWORD *)v45)
    {
      v20 = (unint64_t *)(*(_QWORD *)v45 + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    sub_1001E4804(buf);
    sub_100569514(*(uint64_t *)buf);
    v22 = *(std::__shared_weak_count **)v45;
    if (*(_QWORD *)v45)
    {
      v23 = (unint64_t *)(*(_QWORD *)v45 + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    dword_102305F84 = 5;
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v25 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v45 = 2082;
      *(_QWORD *)&v45[2] = "";
      v46 = 1026;
      LODWORD(v47) = 5;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Updated the kCLVersionOfLastFullAuthSync to currentVersion\", \"kCLCurrentAuthSyncVersion\":%{public}d}", buf, 0x18u);
    }
  }
  -[CLAuthSyncManager endPairedSyncSessionWithError:](self, "endPairedSyncSessionWithError:", a4);
  if (v8)
  {
    -[CLAuthSyncManager handleError:inSyncSession:](self, "handleError:inSyncSession:", a4, a3);
    return;
  }
  -[CLAuthSyncManager setNumberOfConsecutiveSyncSessionRetries:](self, "setNumberOfConsecutiveSyncSessionRetries:", 0);
  if (objc_msgSend(a3, "isResetSync"))
    -[CLAuthSyncManager fullSyncDidComplete](self, "fullSyncDidComplete");
  else
    -[CLAuthSyncManager deltaSyncDidComplete:](self, "deltaSyncDidComplete:", a3);
  if (objc_msgSend(a3, "isSending"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v26 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(a3, "identifier");
      v28 = objc_msgSend(a3, "reason");
      v29 = objc_msgSend(a3, "isResetSync");
      objc_msgSend(a3, "state");
      v30 = objc_msgSend(a3, "state");
      v31 = objc_msgSend(a3, "wasCancelled");
      v32 = objc_msgSend(objc_msgSend(a3, "service"), "targetIsInProximity");
      -[SYService sessionStalenessInterval](-[CLAuthSyncManager syncService](self, "syncService"), "sessionStalenessInterval");
      *(_DWORD *)buf = 68290818;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v45 = 2082;
      *(_QWORD *)&v45[2] = "";
      v46 = 2114;
      v47 = v27;
      v48 = 2114;
      v49 = v28;
      v50 = 1026;
      *(_DWORD *)v51 = v29;
      *(_WORD *)&v51[4] = 2050;
      *(_QWORD *)&v51[6] = v30;
      *(_WORD *)&v51[14] = 1026;
      *(_DWORD *)&v51[16] = v31;
      *(_WORD *)v52 = 1026;
      *(_DWORD *)&v52[2] = v32;
      *(_WORD *)v53 = 2050;
      *(_QWORD *)&v53[2] = (uint64_t)v33;
      v34 = "{\"msg%{public}.0s\":\"#authsync Sending sync session ended successfully\", \"sessionIdentifier\":%{public, "
            "location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\"
            ":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd,"
            " \"sessionStalenessInterval\":%{public}ld}";
LABEL_41:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v34, buf, 0x4Cu);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v26 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(a3, "identifier");
      v36 = objc_msgSend(a3, "reason");
      v37 = objc_msgSend(a3, "isResetSync");
      objc_msgSend(a3, "state");
      v38 = objc_msgSend(a3, "state");
      v39 = objc_msgSend(a3, "wasCancelled");
      v40 = objc_msgSend(objc_msgSend(a3, "service"), "targetIsInProximity");
      -[SYService sessionStalenessInterval](-[CLAuthSyncManager syncService](self, "syncService"), "sessionStalenessInterval");
      *(_DWORD *)buf = 68290818;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v45 = 2082;
      *(_QWORD *)&v45[2] = "";
      v46 = 2114;
      v47 = v35;
      v48 = 2114;
      v49 = v36;
      v50 = 1026;
      *(_DWORD *)v51 = v37;
      *(_WORD *)&v51[4] = 2050;
      *(_QWORD *)&v51[6] = v38;
      *(_WORD *)&v51[14] = 1026;
      *(_DWORD *)&v51[16] = v39;
      *(_WORD *)v52 = 1026;
      *(_DWORD *)&v52[2] = v40;
      *(_WORD *)v53 = 2050;
      *(_QWORD *)&v53[2] = (uint64_t)v41;
      v34 = "{\"msg%{public}.0s\":\"#authsync Receiving sync session ended successfully\", \"sessionIdentifier\":%{public"
            ", location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state"
            "\":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hh"
            "d, \"sessionStalenessInterval\":%{public}ld}";
      goto LABEL_41;
    }
  }
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3, a4), "silo"), "assertInside");
  return 1;
}

- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5
{
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unsigned int v16;
  int v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;

  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3), "silo"), "assertInside");
  -[CLAuthSyncManager setCurrentSyncSessionCollidedWithResetSync:](self, "setCurrentSyncSessionCollidedWithResetSync:", 0);
  if (objc_msgSend(objc_msgSend(a5, "reason"), "isEqualToString:", CFSTR("SYSessionReasonResetFromCompanion")))
  {
    -[CLAuthSyncManager setCurrentSyncSessionCollidedWithResetSync:](self, "setCurrentSyncSessionCollidedWithResetSync:", 1);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v8 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      v9 = a5;
      goto LABEL_10;
    }
    v18 = 68289026;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#authsync RESET from companion and delta sync from gizmo collided\"}", (uint8_t *)&v18, 0x12u);
    v9 = a5;
  }
  else
  {
    v9 = a4;
    a4 = a5;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
LABEL_10:
  v10 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v9, "identifier");
    v12 = objc_msgSend(v9, "reason");
    v13 = objc_msgSend(a4, "identifier");
    v14 = objc_msgSend(a4, "reason");
    objc_msgSend(v9, "state");
    v15 = objc_msgSend(v9, "state");
    objc_msgSend(a4, "state");
    v16 = objc_msgSend(a4, "state");
    v18 = 68290562;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    v28 = 2114;
    v29 = v14;
    v30 = 2050;
    v31 = v15;
    v32 = 2050;
    v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sessions collided\", \"P-identifier\":%{public, location:escape_only}@, \"P-SyncReason\":%{public, location:escape_only}@, \"R-Identifier\":%{public, location:escape_only}@, \"R-SyncReason\":%{public, location:escape_only}@, \"P-syncState\":%{public, location:SYSessionState}lld, \"R-syncState\":%{public, location:SYSessionState}lld}", (uint8_t *)&v18, 0x4Eu);
  }
  return v9;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[7];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a4, "syncSessionType");
    v8 = objc_msgSend(a4, "syncSessionType");
    v9 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "sessionIdentifier"), "UUIDString"), "UTF8String");
    objc_msgSend(a3, "syncRestriction");
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2050;
    v16 = v8;
    v17 = 2082;
    v18 = v9;
    v19 = 2050;
    v20 = objc_msgSend(a3, "syncRestriction");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync coordinator start session\", \"syncSessionType\":%{public, location:PSYSyncSessionType}lld, \"syncSessionIdentifier\":%{public, location:escape_only}s, \"syncRestriction\":%{public, location:PSYSyncRestriction}lld}", buf, 0x30u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009CA078;
  v10[3] = &unk_10212BBA8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "sync:", v10);
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[6];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102162F50);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a4, "syncSessionType");
    v8 = objc_msgSend(a4, "syncSessionType");
    v9 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "sessionIdentifier"), "UUIDString"), "UTF8String");
    objc_msgSend(a3, "syncRestriction");
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2050;
    v16 = v8;
    v17 = 2082;
    v18 = v9;
    v19 = 2050;
    v20 = objc_msgSend(a3, "syncRestriction");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync coordinator invalidated session\", \"syncType\":%{public, location:PSYSyncSessionType}lld, \"sessionUUID\":%{public, location:escape_only}s, \"syncRestriction\":%{public, location:PSYSyncRestriction}lld}", buf, 0x30u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009CA434;
  v10[3] = &unk_10212BB30;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "sync:", v10);
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1009CA4E0;
  v3[3] = &unk_10212BB30;
  v3[4] = a3;
  v3[5] = self;
  objc_msgSend(objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo"), "sync:", v3);
}

- (void)refreshSettings
{
  NSObject *v3;
  const char *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  __int128 v8;

  if (!-[CLAuthSyncManager isThereAWatch](self, "isThereAWatch"))
    return;
  if (-[CLSettingsMirror hasValueForKey:](-[CLAuthSyncManager settings](self, "settings"), "hasValueForKey:", CFSTR("AuthSync-SupportsPrecisionReduction")))
  {
    -[CLAuthSyncManager setIsCorrectiveCompensationSupported:](self, "setIsCorrectiveCompensationSupported:", -[CLSettingsMirror BOOLForKey:defaultValue:](-[CLAuthSyncManager settings](self, "settings"), "BOOLForKey:defaultValue:", CFSTR("AuthSync-SupportsPrecisionReduction"), 0));
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v3 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v7 = 68289282;
    LOWORD(v8) = 2082;
    *(_QWORD *)((char *)&v8 + 2) = "";
    WORD5(v8) = 1026;
    HIDWORD(v8) = -[CLAuthSyncManager isCorrectiveCompensationSupported](self, "isCorrectiveCompensationSupported");
    v4 = "{\"msg%{public}.0s\":\"#authsync overrides set\", \"isCorrectiveCompensationSupported\":%{public}hhd}";
  }
  else
  {
    v5 = objc_msgSend(objc_msgSend((Class)off_1022A6260[0](), "sharedInstance"), "getActivePairedDevice");
    if (v5)
    {
      -[CLAuthSyncManager setIsCorrectiveCompensationSupported:](self, "setIsCorrectiveCompensationSupported:", objc_msgSend(v5, "supportsCapability:", objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("54B99808-A820-45A2-8FF1-51C9DD7328F6"))));
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v3 = qword_1022A01D8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v7 = 68289282;
      LOWORD(v8) = 2082;
      *(_QWORD *)((char *)&v8 + 2) = "";
      WORD5(v8) = 1026;
      HIDWORD(v8) = -[CLAuthSyncManager isCorrectiveCompensationSupported](self, "isCorrectiveCompensationSupported");
      v4 = "{\"msg%{public}.0s\":\"#authsync nanoregistry read\", \"isCorrectiveCompensationSupported\":%{public}hhd}";
    }
    else
    {
      -[CLAuthSyncManager setIsCorrectiveCompensationSupported:](self, "setIsCorrectiveCompensationSupported:", 0);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102162F50);
      v3 = qword_1022A01D8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v7 = 68289282;
      LOWORD(v8) = 2082;
      *(_QWORD *)((char *)&v8 + 2) = "";
      WORD5(v8) = 1026;
      HIDWORD(v8) = -[CLAuthSyncManager isCorrectiveCompensationSupported](self, "isCorrectiveCompensationSupported");
      v4 = "{\"msg%{public}.0s\":\"#authsync default value\", \"isCorrectiveCompensationSupported\":%{public}hhd}";
    }
  }
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v7, 0x18u);
LABEL_17:
  if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState", v7, v8), "objectForKey:", CFSTR("kCLFullSyncInProgress")), "BOOLValue") & 1) == 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102162F50);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289026;
      LOWORD(v8) = 2082;
      *(_QWORD *)((char *)&v8 + 2) = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync refreshSettings check sync store state for full sync\"}", (uint8_t *)&v7, 0x12u);
    }
    -[CLAuthSyncManager checkSyncStoreState](self, "checkSyncStoreState");
  }
}

- (CLClientManagerPublicProtocol)clientManager
{
  return self->_clientManager;
}

- (void)setClientManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)fullPathForSyncState
{
  return self->_fullPathForSyncState;
}

- (SYService)syncService
{
  return self->_syncService;
}

- (void)setSyncService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdsService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)fullSyncObjectsInCompanionQueue
{
  return self->_fullSyncObjectsInCompanionQueue;
}

- (void)setFullSyncObjectsInCompanionQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableArray)fullSyncObjectsInGizmoQueue
{
  return self->_fullSyncObjectsInGizmoQueue;
}

- (void)setFullSyncObjectsInGizmoQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableArray)deltaSyncObjectsInCompanionQueue
{
  return self->_deltaSyncObjectsInCompanionQueue;
}

- (void)setDeltaSyncObjectsInCompanionQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableArray)deltaSyncObjectsInGizmoQueue
{
  return self->_deltaSyncObjectsInGizmoQueue;
}

- (void)setDeltaSyncObjectsInGizmoQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)gizmoDeltaSyncObjects
{
  return self->_gizmoDeltaSyncObjects;
}

- (void)setGizmoDeltaSyncObjects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSMutableArray)gizmoDeltaSyncObjectsWaitingForAck
{
  return self->_gizmoDeltaSyncObjectsWaitingForAck;
}

- (void)setGizmoDeltaSyncObjectsWaitingForAck:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSMutableArray)notificationsInCompanionQueue
{
  return self->_notificationsInCompanionQueue;
}

- (void)setNotificationsInCompanionQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSMutableArray)notificationsInGizmoQueue
{
  return self->_notificationsInGizmoQueue;
}

- (void)setNotificationsInGizmoQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSDictionary)preDaytonaMapping
{
  return self->_preDaytonaMapping;
}

- (void)setPreDaytonaMapping:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (BOOL)shouldConfirmHandlingPairingNotification
{
  return self->_shouldConfirmHandlingPairingNotification;
}

- (void)setShouldConfirmHandlingPairingNotification:(BOOL)a3
{
  self->_shouldConfirmHandlingPairingNotification = a3;
}

- (BOOL)shouldConfirmHandlingQuickSwitchNotification
{
  return self->_shouldConfirmHandlingQuickSwitchNotification;
}

- (void)setShouldConfirmHandlingQuickSwitchNotification:(BOOL)a3
{
  self->_shouldConfirmHandlingQuickSwitchNotification = a3;
}

- (BOOL)shouldSendMoreDataInCurrentSyncSession
{
  return self->_shouldSendMoreDataInCurrentSyncSession;
}

- (void)setShouldSendMoreDataInCurrentSyncSession:(BOOL)a3
{
  self->_shouldSendMoreDataInCurrentSyncSession = a3;
}

- (BOOL)resetRecoveryMode
{
  return self->_resetRecoveryMode;
}

- (void)setResetRecoveryMode:(BOOL)a3
{
  self->_resetRecoveryMode = a3;
}

- (BOOL)recoverySyncInProgress
{
  return self->_recoverySyncInProgress;
}

- (void)setRecoverySyncInProgress:(BOOL)a3
{
  self->_recoverySyncInProgress = a3;
}

- (BOOL)isThereAWatch
{
  return self->_isThereAWatch;
}

- (void)setIsThereAWatch:(BOOL)a3
{
  self->_isThereAWatch = a3;
}

- (BOOL)isCorrectiveCompensationSupported
{
  return self->_isCorrectiveCompensationSupported;
}

- (void)setIsCorrectiveCompensationSupported:(BOOL)a3
{
  self->_isCorrectiveCompensationSupported = a3;
}

- (BOOL)isDeviceNearbyAndConnected
{
  return self->_isDeviceNearbyAndConnected;
}

- (void)setIsDeviceNearbyAndConnected:(BOOL)a3
{
  self->_isDeviceNearbyAndConnected = a3;
}

- (BOOL)isQuickSwitchModeOn
{
  return self->_isQuickSwitchModeOn;
}

- (void)setIsQuickSwitchModeOn:(BOOL)a3
{
  self->_isQuickSwitchModeOn = a3;
}

- (BOOL)isConflictResolutionMode
{
  return self->_isConflictResolutionMode;
}

- (void)setIsConflictResolutionMode:(BOOL)a3
{
  self->_isConflictResolutionMode = a3;
}

- (BOOL)currentSyncSessionCollidedWithResetSync
{
  return self->_currentSyncSessionCollidedWithResetSync;
}

- (void)setCurrentSyncSessionCollidedWithResetSync:(BOOL)a3
{
  self->_currentSyncSessionCollidedWithResetSync = a3;
}

- (NSUUID)activePairingID
{
  return self->_activePairingID;
}

- (void)setActivePairingID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSUUID)pairedDeviceUUID
{
  return self->_pairedDeviceUUID;
}

- (void)setPairedDeviceUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (unsigned)watchProductVersion
{
  return self->_watchProductVersion;
}

- (void)setWatchProductVersion:(unsigned int)a3
{
  self->_watchProductVersion = a3;
}

- (NSMutableDictionary)authSyncStoreState
{
  return self->_authSyncStoreState;
}

- (void)setAuthSyncStoreState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSMutableArray)fullSyncClientsList
{
  return self->_fullSyncClientsList;
}

- (void)setFullSyncClientsList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSMutableDictionary)reunionSyncListPaths
{
  return self->_reunionSyncListPaths;
}

- (void)setReunionSyncListPaths:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSMutableDictionary)reunionSyncLists
{
  return self->_reunionSyncLists;
}

- (void)setReunionSyncLists:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (BOOL)isQuickSwitchInProgress
{
  return self->_isQuickSwitchInProgress;
}

- (void)setIsQuickSwitchInProgress:(BOOL)a3
{
  self->_isQuickSwitchInProgress = a3;
}

- (double)syncSessionRetryInterval
{
  return self->_syncSessionRetryInterval;
}

- (void)setSyncSessionRetryInterval:(double)a3
{
  self->_syncSessionRetryInterval = a3;
}

- (int64_t)numberOfConsecutiveSyncSessionRetries
{
  return self->_numberOfConsecutiveSyncSessionRetries;
}

- (void)setNumberOfConsecutiveSyncSessionRetries:(int64_t)a3
{
  self->_numberOfConsecutiveSyncSessionRetries = a3;
}

- (BOOL)shouldResetAuthDbOnFullSync
{
  return self->_shouldResetAuthDbOnFullSync;
}

- (void)setShouldResetAuthDbOnFullSync:(BOOL)a3
{
  self->_shouldResetAuthDbOnFullSync = a3;
}

- (PSYServiceSyncSession)activeWatchSyncSession
{
  return self->_activeWatchSyncSession;
}

- (void)setActiveWatchSyncSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (PSYSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (CLSettingsMirror)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (unint64_t)syncRestriction
{
  return self->_syncRestriction;
}

- (void)setSyncRestriction:(unint64_t)a3
{
  self->_syncRestriction = a3;
}

@end
