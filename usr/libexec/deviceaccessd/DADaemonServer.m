@implementation DADaemonServer

- (DADaemonServer)init
{
  char *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DADaemonServer;
  v2 = -[DADaemonServer init](&v13, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("DADaemon", v4);
    v6 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v5;

    *((_DWORD *)v2 + 24) = -1;
    *(_QWORD *)(v2 + 180) = -1;
    objc_storeStrong(&gDADaemonServer, v2);
    v2[296] = 0;
    v7 = (void *)*((_QWORD *)v2 + 33);
    *((_QWORD *)v2 + 33) = 0;

    v8 = (void *)*((_QWORD *)v2 + 35);
    *((_QWORD *)v2 + 35) = 0;

    v9 = (void *)*((_QWORD *)v2 + 38);
    *((_QWORD *)v2 + 38) = 0;

    v10 = (void *)*((_QWORD *)v2 + 32);
    *((_QWORD *)v2 + 32) = 0;

    v11 = v2;
  }

  return (DADaemonServer *)v2;
}

- (void)dealloc
{
  int necpFD;
  OS_os_transaction *expiredDeviceChecktransaction;
  objc_super v5;

  necpFD = self->_necpFD;
  if ((necpFD & 0x80000000) == 0)
  {
    if (close(necpFD) && *__error())
      __error();
    self->_necpFD = -1;
  }
  expiredDeviceChecktransaction = self->_expiredDeviceChecktransaction;
  self->_expiredDeviceChecktransaction = 0;

  v5.receiver = self;
  v5.super_class = (Class)DADaemonServer;
  -[DADaemonServer dealloc](&v5, "dealloc");
}

- (NSString)description
{
  return (NSString *)-[DADaemonServer descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id *v14;
  id *v15;
  unsigned int v16;
  id v17;
  BOOL v18;
  id *v19;
  id *v20;
  id *v21;
  id v22;
  id *v23;
  id *v24;
  NSMutableDictionary *discoveryMap;
  id *v26;
  id v27;
  id *v28;
  id *v29;
  NSMutableSet *v30;
  id v31;
  uint64_t v32;
  void *i;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  void *v37;
  id *v38;
  id *v39;
  void *v40;
  uint64_t v41;
  id v42;
  int v43;
  uint64_t v44;
  void *j;
  uint64_t v46;
  uint64_t v47;
  id *v48;
  void *v49;
  id *v50;
  uint64_t v51;
  void *v52;
  uint64_t *v53;
  id v54;
  id v55;
  void *v57;
  unsigned int v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[5];
  id v77;
  id v78;
  id v79;
  _QWORD v80[5];
  int v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id obj;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];

  v58 = a3;
  v87 = 0;
  v88 = &v87;
  v90 = sub_100001CEC;
  v91 = sub_100001CFC;
  v89 = 0x3032000000;
  if (a3 >= 0xBu)
    v5 = 30;
  else
    v5 = 20;
  v92 = 0;
  obj = 0;
  v6 = mach_continuous_time();
  v7 = UpTicksToSeconds(v6 - self->_startTicksFull);
  v8 = CUPrintDuration64(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = mach_absolute_time();
  v11 = UpTicksToSeconds(v10 - self->_startTicksAwake);
  v12 = CUPrintDuration64(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  NSAppendPrintF(&obj, "Up %@ (awake %@)", v9, v13);
  objc_storeStrong(&v92, obj);

  if (self->_deviceStateTimer)
  {
    v14 = (id *)(v88 + 5);
    v85 = (id)v88[5];
    NSAppendPrintF(&v85, ", DeviceStateTimer yes");
    objc_storeStrong(v14, v85);
  }
  v15 = (id *)(v88 + 5);
  v84 = (id)v88[5];
  NSAppendPrintF(&v84, "\n");
  objc_storeStrong(v15, v84);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0));
  v16 = objc_msgSend(v57, "count");
  v17 = objc_msgSend(v57, "count");
  v18 = v17 != 0;
  if (v17)
  {
    v19 = (id *)(v88 + 5);
    v83 = (id)v88[5];
    NSAppendPrintF(&v83, "\n");
    objc_storeStrong(v19, v83);
    v20 = (id *)(v88 + 5);
    v82 = (id)v88[5];
    NSAppendPrintF(&v82, "== Accessories: %d ==\n", v16);
    objc_storeStrong(v20, v82);
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_100001D04;
    v80[3] = &unk_100038900;
    v80[4] = &v87;
    v81 = a3;
    objc_msgSend(v57, "enumerateObjectsUsingBlock:", v80);
    v21 = (id *)(v88 + 5);
    v79 = (id)v88[5];
    NSAppendPrintF(&v79, "\n");
    objc_storeStrong(v21, v79);
  }
  v22 = -[NSMutableDictionary count](self->_discoveryMap, "count");
  if (v22)
  {
    if (!v17)
    {
      v23 = (id *)(v88 + 5);
      v78 = (id)v88[5];
      NSAppendPrintF(&v78, "\n");
      objc_storeStrong(v23, v78);
    }
    v24 = (id *)(v88 + 5);
    v77 = (id)v88[5];
    NSAppendPrintF(&v77, "== Discovery: %d ==\n", (_DWORD)v22);
    objc_storeStrong(v24, v77);
    discoveryMap = self->_discoveryMap;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_100001D70;
    v76[3] = &unk_100038928;
    v76[4] = &v87;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveryMap, "enumerateKeysAndObjectsUsingBlock:", v76);
    v26 = (id *)(v88 + 5);
    v75 = (id)v88[5];
    NSAppendPrintF(&v75, "\n");
    objc_storeStrong(v26, v75);
    v18 = 1;
  }
  v27 = -[NSMutableSet count](self->_xpcConnections, "count");
  if (v27)
  {
    if (!v18)
    {
      v28 = (id *)(v88 + 5);
      v74 = (id)v88[5];
      NSAppendPrintF(&v74, "\n");
      objc_storeStrong(v28, v74);
    }
    v29 = (id *)(v88 + 5);
    v73 = (id)v88[5];
    NSAppendPrintF(&v73, "== XPC Cnx: %d ==\n", (_DWORD)v27);
    objc_storeStrong(v29, v73);
    v71 = 0u;
    v72 = 0u;
    v70 = 0u;
    v69 = 0u;
    v30 = self->_xpcConnections;
    v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v32)
            objc_enumerationMutation(v30);
          v34 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          v35 = (id *)(v88 + 5);
          v68 = (id)v88[5];
          v36 = CUDescriptionWithLevel(v34, v5);
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          NSAppendPrintF(&v68, "%@", v37);
          objc_storeStrong(v35, v68);

          if (v58 >= 0xB)
          {
            v38 = (id *)(v88 + 5);
            v67 = (id)v88[5];
            NSAppendPrintF(&v67, "\n");
            objc_storeStrong(v38, v67);
          }
        }
        v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
      }
      while (v31);
    }

    v39 = (id *)(v88 + 5);
    v66 = (id)v88[5];
    NSAppendPrintF(&v66, "\n");
    objc_storeStrong(v39, v66);
    v18 = 1;
  }
  if (v58 <= 0x14)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v40 = (void *)CFPrefs_CopyKeys(CFSTR("com.apple.DeviceAccess"), 0);
    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v93, 16);
    if (!v42)
    {
LABEL_39:

      goto LABEL_40;
    }
    v43 = 0;
    v44 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v42; j = (char *)j + 1)
      {
        if (*(_QWORD *)v63 != v44)
          objc_enumerationMutation(v40);
        v46 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j);
        v47 = objc_opt_class(NSString, v41);
        if ((objc_opt_isKindOfClass(v46, v47) & 1) != 0)
        {
          if (!v18)
          {
            v48 = (id *)(v88 + 5);
            v61 = (id)v88[5];
            NSAppendPrintF(&v61, "\n");
            objc_storeStrong(v48, v61);
          }
          v49 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.DeviceAccess"), v46, 0, 0);
          v50 = (id *)(v88 + 5);
          v60 = (id)v88[5];
          v51 = CUPrintNSObjectOneLine();
          v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          NSAppendPrintF(&v60, "Pref: '%@' = '%@'\n", v46, v52);
          objc_storeStrong(v50, v60);

          ++v43;
          v18 = 1;
        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v93, 16);
    }
    while (v42);

    if (v43 >= 1)
    {
      v53 = v88;
      v59 = (id)v88[5];
      NSAppendPrintF(&v59, "\n");
      v54 = v59;
      v40 = (void *)v53[5];
      v53[5] = (uint64_t)v54;
      goto LABEL_39;
    }
  }
LABEL_40:
  v55 = (id)v88[5];

  _Block_object_dispose(&v87, 8);
  return v55;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001E78;
  block[3] = &unk_100038950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  OS_xpc_object *mach_service;
  OS_xpc_object *xpcListener;
  OS_xpc_object *v5;
  NSObject *dispatchQueue;
  NSObject *v7;
  OS_dispatch_queue *v8;
  CUSystemMonitor *v9;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v11;
  void *v12;
  CBCentralManager *v13;
  CBCentralManager *cbCentralManager;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD handler[5];

  self->_startTicksAwake = mach_absolute_time();
  self->_startTicksFull = mach_continuous_time();
  LogSetAppID(CFSTR("com.apple.DeviceAccess"));
  LogControl("?.*:level=chatty,.*:flags=public");
  if (!self->_xpcListener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", (dispatch_queue_t)self->_dispatchQueue, 1uLL);
    xpcListener = self->_xpcListener;
    self->_xpcListener = mach_service;

    v5 = self->_xpcListener;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000021EC;
    handler[3] = &unk_100038978;
    handler[4] = self;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_activate(self->_xpcListener);
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000021F8;
    v19[3] = &unk_1000389A0;
    v19[4] = self;
    notify_register_dispatch("com.apple.DeviceAccess.prefsChanged", &self->_prefsChangedNotifyToken, dispatchQueue, v19);
  }
  if (self->_resetPrivacySettingsToken == -1)
  {
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _activate]", 50, "Listen for Privacy Reset");
    }
    v7 = self->_dispatchQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100002268;
    v18[3] = &unk_1000389A0;
    v18[4] = self;
    notify_register_dispatch("com.apple.Preferences.ResetPrivacyWarningsNotification", &self->_resetPrivacySettingsToken, v7, v18);
  }
  if (!self->_stateHandler)
  {
    v8 = self->_dispatchQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000022D8;
    v17[3] = &unk_1000389C8;
    v17[4] = self;
    self->_stateHandler = os_state_add_handler(v8, v17);
  }
  if (!self->_systemMonitor)
  {
    v9 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v9;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000022F4;
    v16[3] = &unk_100038950;
    v16[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v16);
    v11 = self->_systemMonitor;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000022FC;
    v15[3] = &unk_100038950;
    v15[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v11, "activateWithCompletion:", v15);
  }
  -[DADaemonServer _prefsChanged](self, "_prefsChanged");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v12, "addObserver:", self);

  -[DADaemonServer updateDADevicesWithInstalledApps](self, "updateDADevicesWithInstalledApps");
  if (!self->_cbCentralManager)
  {
    v13 = (CBCentralManager *)objc_msgSend(objc_alloc((Class)CBCentralManager), "initWithDelegate:queue:options:", self, self->_dispatchQueue, 0);
    cbCentralManager = self->_cbCentralManager;
    self->_cbCentralManager = v13;

  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_dispatchQueue, &stru_100038A08);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000023E8;
  block[3] = &unk_100038950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSMutableSet *v3;
  NSMutableSet *xpcConnections;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  OS_dispatch_source *checkDevicesTimer;
  NSObject *v12;
  OS_dispatch_source *v13;
  OS_dispatch_source *deviceStateTimer;
  NSObject *v15;
  OS_dispatch_source *v16;
  int prefsChangedNotifyToken;
  int resetPrivacySettingsToken;
  OS_xpc_object *xpcListener;
  _xpc_connection_s *v20;
  OS_xpc_object *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = self->_xpcConnections;
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "invalidate", (_QWORD)v22);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  -[NSMutableSet removeAllObjects](v5, "removeAllObjects");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_discoveryMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100038A48);
  -[NSMutableDictionary removeAllObjects](self->_discoveryMap, "removeAllObjects");
  -[DADaemonServer _necpCleanupIfNeeded](self, "_necpCleanupIfNeeded");
  -[CBCentralManager stopScan](self->_cbCentralManager, "stopScan");
  -[DADaemonServer _cleanupWiFiDiscovery](self, "_cleanupWiFiDiscovery");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v10, "removeObserver:", self);

  checkDevicesTimer = self->_checkDevicesTimer;
  if (checkDevicesTimer)
  {
    v12 = checkDevicesTimer;
    dispatch_source_cancel(v12);
    v13 = self->_checkDevicesTimer;
    self->_checkDevicesTimer = 0;

  }
  deviceStateTimer = self->_deviceStateTimer;
  if (deviceStateTimer)
  {
    v15 = deviceStateTimer;
    dispatch_source_cancel(v15);
    v16 = self->_deviceStateTimer;
    self->_deviceStateTimer = 0;

  }
  prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_prefsChangedNotifyToken = -1;
  }
  resetPrivacySettingsToken = self->_resetPrivacySettingsToken;
  if (resetPrivacySettingsToken != -1)
  {
    notify_cancel(resetPrivacySettingsToken);
    self->_resetPrivacySettingsToken = -1;
  }
  if (self->_stateHandler)
  {
    os_state_remove_handler();
    self->_stateHandler = 0;
  }
  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    v20 = xpcListener;
    xpc_connection_cancel(v20);
    v21 = self->_xpcListener;
    self->_xpcListener = 0;

  }
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _invalidate]", 30, "Invalidated", (_QWORD)v22);

}

- (void)_prefsChanged
{
  uint64_t Int64;
  BOOL v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  double Double;
  double v10;
  double prefCheckAppAccessInfoSeconds;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t prefsBTRSSIThreshold;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double prefsBluetoothTransportBridgingTimeoutSeconds;
  double v26;
  double v28;
  double prefBTScanRefreshSeconds;
  double v30;
  double v32;
  double prefsBTTaskTimeoutSeconds;
  double v34;
  double v36;
  double prefCheckDevicesSeconds;
  double v38;
  double v40;
  double prefDeviceApprovedSeconds;
  double v42;
  double v44;
  double prefDeviceStateTimeoutSeconds;
  double v46;
  double prefAppPartialIPUpdateMinCadenceSeconds;
  uint64_t v49;
  BOOL v50;
  _BOOL4 v51;
  const char *v52;
  const char *v53;
  _BOOL4 v54;
  _BOOL4 v55;
  const char *v56;
  const char *v57;
  int v58;

  v58 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.DeviceAccess"), CFSTR("alwaysRequireRemovalConfirm"), &v58);
  if (v58)
    v4 = 1;
  else
    v4 = Int64 == 0;
  v5 = !v4;
  if (self->_prefAlwaysRequireAccessoryRemovalUserConfirmation != v5)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v6 = "yes";
      if (v5)
        v7 = "no";
      else
        v7 = "yes";
      if (!v5)
        v6 = "no";
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "AlwaysRequireAccessoryRemovalUserConfirmation: %s -> %s", v7, v6);
    }
    self->_prefAlwaysRequireAccessoryRemovalUserConfirmation = v5;
  }
  Double = CFPrefs_GetDouble(CFSTR("com.apple.DeviceAccess"), CFSTR("checkAppAccessInfoSeconds"), &v58);
  if (Double > 0.0 && v58 == 0)
    v10 = Double;
  else
    v10 = 60.0;
  prefCheckAppAccessInfoSeconds = self->_prefCheckAppAccessInfoSeconds;
  if (v10 != prefCheckAppAccessInfoSeconds)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F400, 30))
          goto LABEL_29;
        prefCheckAppAccessInfoSeconds = self->_prefCheckAppAccessInfoSeconds;
      }
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "CheckAppAccessInfoSeconds: %f -> %f", prefCheckAppAccessInfoSeconds, v10);
    }
LABEL_29:
    self->_prefCheckAppAccessInfoSeconds = v10;
    -[DADaemonServer _scheduleCheckAppAccessInfo](self, "_scheduleCheckAppAccessInfo");
  }
  v12 = CFPrefs_GetInt64(CFSTR("com.apple.DeviceAccess"), CFSTR("bluetoothPairingWithMITM"), &v58);
  if (v58)
    v13 = 0;
  else
    v13 = v12 == 0;
  v14 = !v13;
  if (self->_prefBTPairingWithMITM != v14)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v15 = "yes";
      if (v14)
        v16 = "no";
      else
        v16 = "yes";
      if (!v14)
        v15 = "no";
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "BluetoothPairingWithMITM: %s -> %s", v16, v15);
    }
    self->_prefBTPairingWithMITM = v14;
  }
  v17 = CFPrefs_GetInt64(CFSTR("com.apple.DeviceAccess"), CFSTR("bluetoothRSSIThreshold"), &v58);
  if (v17 >= 1 && v58 == 0)
    v19 = v17;
  else
    v19 = -45;
  prefsBTRSSIThreshold = self->_prefsBTRSSIThreshold;
  if (v19 != prefsBTRSSIThreshold)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F400, 30))
          goto LABEL_58;
        LODWORD(prefsBTRSSIThreshold) = self->_prefsBTRSSIThreshold;
      }
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "BluetoothDiscoveryRSSIThreshold: %d -> %lld", prefsBTRSSIThreshold, v19);
    }
LABEL_58:
    self->_prefsBTRSSIThreshold = (__int16)v19;
  }
  v21 = CFPrefs_GetDouble(CFSTR("com.apple.DeviceAccess"), CFSTR("bluetoothTransportBridgingTimeoutSeconds"), &v58);
  v22 = v21 > 0.0 && v58 == 0;
  v23 = 86400.0;
  if (v22)
    v24 = v21;
  else
    v24 = 86400.0;
  prefsBluetoothTransportBridgingTimeoutSeconds = self->_prefsBluetoothTransportBridgingTimeoutSeconds;
  if (v24 != prefsBluetoothTransportBridgingTimeoutSeconds)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F400, 30))
          goto LABEL_70;
        prefsBluetoothTransportBridgingTimeoutSeconds = self->_prefsBluetoothTransportBridgingTimeoutSeconds;
      }
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "BluetoothTransportBridgingTimeoutSeconds: %f -> %f", prefsBluetoothTransportBridgingTimeoutSeconds, v24);
    }
LABEL_70:
    self->_prefsBluetoothTransportBridgingTimeoutSeconds = v24;
  }
  v26 = CFPrefs_GetDouble(CFSTR("com.apple.DeviceAccess"), CFSTR("bluetoothScanRefreshSeconds"), &v58);
  if (v26 > 0.0 && v58 == 0)
    v28 = v26;
  else
    v28 = 10.0;
  prefBTScanRefreshSeconds = self->_prefBTScanRefreshSeconds;
  if (v28 != prefBTScanRefreshSeconds)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F400, 30))
          goto LABEL_82;
        prefBTScanRefreshSeconds = self->_prefBTScanRefreshSeconds;
      }
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "BluetoothScanRefreshSeconds: %f -> %f", prefBTScanRefreshSeconds, v28);
    }
LABEL_82:
    self->_prefBTScanRefreshSeconds = v28;
  }
  v30 = CFPrefs_GetDouble(CFSTR("com.apple.DeviceAccess"), CFSTR("bluetoothTaskTimeoutSeconds"), &v58);
  if (v30 > 0.0 && v58 == 0)
    v32 = v30;
  else
    v32 = 30.0;
  prefsBTTaskTimeoutSeconds = self->_prefsBTTaskTimeoutSeconds;
  if (v32 != prefsBTTaskTimeoutSeconds)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F400, 30))
          goto LABEL_94;
        prefsBTTaskTimeoutSeconds = self->_prefsBTTaskTimeoutSeconds;
      }
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "BluetoothTaskTimeoutSeconds: %f -> %f", prefsBTTaskTimeoutSeconds, v32);
    }
LABEL_94:
    self->_prefsBTTaskTimeoutSeconds = v32;
  }
  v34 = CFPrefs_GetDouble(CFSTR("com.apple.DeviceAccess"), CFSTR("checkDevicesSeconds"), &v58);
  if (v34 > 0.0 && v58 == 0)
    v36 = v34;
  else
    v36 = 1800.0;
  prefCheckDevicesSeconds = self->_prefCheckDevicesSeconds;
  if (v36 != prefCheckDevicesSeconds)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F400, 30))
          goto LABEL_106;
        prefCheckDevicesSeconds = self->_prefCheckDevicesSeconds;
      }
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "CheckDevicesSeconds: %f -> %f", prefCheckDevicesSeconds, v36);
    }
LABEL_106:
    self->_prefCheckDevicesSeconds = v36;
    -[DADaemonServer _scheduleCheckDevices](self, "_scheduleCheckDevices");
  }
  v38 = CFPrefs_GetDouble(CFSTR("com.apple.DeviceAccess"), CFSTR("deviceApprovedSeconds"), &v58);
  if (v38 > 0.0 && v58 == 0)
    v40 = v38;
  else
    v40 = 86400.0;
  prefDeviceApprovedSeconds = self->_prefDeviceApprovedSeconds;
  if (v40 != prefDeviceApprovedSeconds)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F400, 30))
          goto LABEL_118;
        prefDeviceApprovedSeconds = self->_prefDeviceApprovedSeconds;
      }
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "DeviceApprovedSeconds: %f -> %f", prefDeviceApprovedSeconds, v40);
    }
LABEL_118:
    self->_prefDeviceApprovedSeconds = v40;
    -[DADaemonServer _scheduleCheckDevices](self, "_scheduleCheckDevices");
  }
  v42 = CFPrefs_GetDouble(CFSTR("com.apple.DeviceAccess"), CFSTR("deviceStateTimeoutSeconds"), &v58);
  if (v42 > 0.0 && v58 == 0)
    v44 = v42;
  else
    v44 = 30.0;
  prefDeviceStateTimeoutSeconds = self->_prefDeviceStateTimeoutSeconds;
  if (v44 != prefDeviceStateTimeoutSeconds)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F400, 30))
          goto LABEL_130;
        prefDeviceStateTimeoutSeconds = self->_prefDeviceStateTimeoutSeconds;
      }
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "DeviceStateTimeoutSeconds: %f -> %f", prefDeviceStateTimeoutSeconds, v44);
    }
LABEL_130:
    self->_prefDeviceStateTimeoutSeconds = v44;
    -[DADaemonServer _scheduleCheckDevices](self, "_scheduleCheckDevices");
  }
  v46 = CFPrefs_GetDouble(CFSTR("com.apple.DeviceAccess"), CFSTR("partialIPsSeconds"), &v58);
  if (v46 > 0.0 && v58 == 0)
    v23 = v46;
  prefAppPartialIPUpdateMinCadenceSeconds = self->_prefAppPartialIPUpdateMinCadenceSeconds;
  if (v23 != prefAppPartialIPUpdateMinCadenceSeconds)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F400, 30))
          goto LABEL_142;
        prefAppPartialIPUpdateMinCadenceSeconds = self->_prefAppPartialIPUpdateMinCadenceSeconds;
      }
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "DAAppPartialIPUpdateMinCadenceSeconds: %f -> %f", prefAppPartialIPUpdateMinCadenceSeconds, v23);
    }
LABEL_142:
    self->_prefAppPartialIPUpdateMinCadenceSeconds = v23;
  }
  v49 = CFPrefs_GetInt64(CFSTR("com.apple.DeviceAccess"), CFSTR("enabled"), &v58);
  if (v58)
    v50 = 0;
  else
    v50 = v49 == 0;
  v51 = !v50;
  if (self->_prefEnabled != v51)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v52 = "yes";
      if (v51)
        v53 = "no";
      else
        v53 = "yes";
      if (!v51)
        v52 = "no";
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "Enabled: %s -> %s", v53, v52);
    }
    self->_prefEnabled = v51;
  }
  if (CFPrefs_GetInt64(CFSTR("com.apple.DeviceAccess"), CFSTR("keyChainDisabled"), &v58))
    v54 = IsAppleInternalBuild() != 0;
  else
    v54 = 0;
  if (v58)
    v55 = 0;
  else
    v55 = v54;
  if (self->_prefKeychainDisabled != v55)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v56 = "yes";
      if (v55)
        v57 = "no";
      else
        v57 = "yes";
      if (!v55)
        v56 = "no";
      LogPrintF(&dword_10003F400, "-[DADaemonServer _prefsChanged]", 30, "Keychain Disabled: %s -> %s", v57, v56);
    }
    self->_prefKeychainDisabled = v55;
  }
}

- (BOOL)alwaysConfirmBeforeAccessoryRemoval
{
  DADaemonServer *v2;
  BOOL prefAlwaysRequireAccessoryRemovalUserConfirmation;

  v2 = self;
  objc_sync_enter(v2);
  prefAlwaysRequireAccessoryRemovalUserConfirmation = v2->_prefAlwaysRequireAccessoryRemovalUserConfirmation;
  objc_sync_exit(v2);

  return prefAlwaysRequireAccessoryRemovalUserConfirmation;
}

- (unint64_t)appBundleInfoAccessoryOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoDictionary"));
  v7 = objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("NSAccessorySetupKitSupports"), objc_opt_class(NSArray, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 |= objc_msgSend(v15, "isEqualToString:", CFSTR("Bluetooth"));
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("WiFi")))
          v12 |= 2uLL;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
  {
    v16 = DADeviceAccessorySetupOptionsToString(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    LogPrintF(&dword_10003F400, "-[DADaemonServer appBundleInfoAccessoryOptions:]", 50, "### appBundleHasASKEnabled %@ supports %@", v3, v17, (_QWORD)v19);

  }
  return v12;
}

- (id)appBundleInfoAccessoryDiscoveryOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (-[DADaemonServer appBundleInfoAccessoryOptions:](self, "appBundleInfoAccessoryOptions:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0));
    v7 = objc_msgSend(v5, "copy");

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000032AC;
  v7[3] = &unk_100038A70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_applicationsDidInstall:(id)a3
{
  id v4;
  int v5;
  id v6;
  _QWORD v7[5];

  v4 = a3;
  v6 = v4;
  if (dword_10003F400 <= 50)
  {
    if (dword_10003F400 != -1 || (v5 = _LogCategory_Initialize(&dword_10003F400, 50), v4 = v6, v5))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _applicationsDidInstall:]", 50, "### applicationsDidInstall %@", v4);
      v4 = v6;
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003384;
  v7[3] = &unk_100038A98;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000034E4;
  v7[3] = &unk_100038A70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_applicationsDidUninstall:(id)a3
{
  NSMutableArray *v4;
  id v5;
  _QWORD v6[4];
  NSMutableArray *v7;

  v5 = a3;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _applicationsDidUninstall:]", 50, "### applicationsDidUninstall %@", v5);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000035E0;
  v6[3] = &unk_100038AC0;
  v7 = objc_opt_new(NSMutableArray);
  v4 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  -[DADaemonServer removeAppsAccess:](self, "removeAppsAccess:", v4);

}

- (void)_keychainMarkDeviceForRestoreOnSameDevice
{
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  id *v7;
  id obj;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100001CEC;
  v14 = sub_100001CFC;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000389C;
  v9[3] = &unk_100038AE8;
  v9[4] = &v10;
  v3 = objc_retainBlock(v9);
  if (self->_prefKeychainDisabled)
  {
    if (dword_10003F400 <= 90
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _keychainMarkDeviceForRestoreOnSameDevice]", 90, "### Keychain disabled, skipping marking keychain");
    }
  }
  else
  {
    v4 = objc_alloc_init((Class)CUKeychainItem);
    objc_msgSend(v4, "setAccessGroup:", CFSTR("com.apple.DeviceAccess"));
    objc_msgSend(v4, "setAccessibleType:", 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.DeviceAccess"), CFSTR("DADaemon-SameDevice")));
    objc_msgSend(v4, "setIdentifier:", v5);

    objc_msgSend(v4, "setInvisible:", 1);
    objc_msgSend(v4, "setSyncType:", 1);
    objc_msgSend(v4, "setType:", CFSTR("DADaemon-SameDevice"));
    if (dword_10003F400 <= 40
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 40)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _keychainMarkDeviceForRestoreOnSameDevice]", 40, "### Saving restore marker in keychain");
    }
    v6 = objc_alloc_init((Class)CUKeychainManager);
    v7 = (id *)(v11 + 5);
    obj = (id)v11[5];
    objc_msgSend(v6, "addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:", v4, 1, &dword_10003F400, CFSTR("DAKeychain"), &obj);
    objc_storeStrong(v7, obj);

  }
  ((void (*)(_QWORD *))v3[2])(v3);

  _Block_object_dispose(&v10, 8);
}

- (void)_keychainVerificationDevicesRestoredOnSameDevice
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  if (self->_prefKeychainDisabled)
  {
    if (dword_10003F400 <= 90
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _keychainVerificationDevicesRestoredOnSameDevice]", 90, "### Keychain disabled, skipping verifying with keychain");
    }
  }
  else if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v2 = objc_alloc_init((Class)CUKeychainItem);
    objc_msgSend(v2, "setAccessGroup:", CFSTR("com.apple.DeviceAccess"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.DeviceAccess"), CFSTR("DADaemon-SameDevice")));
    objc_msgSend(v2, "setIdentifier:", v3);

    objc_msgSend(v2, "setSyncType:", 1);
    objc_msgSend(v2, "setType:", CFSTR("DADaemon-SameDevice"));
    v4 = objc_alloc_init((Class)CUKeychainManager);
    v20 = 0;
    v5 = objc_msgSend(v4, "copyItemsMatchingItem:flags:error:", v2, 1, &v20);
    v6 = v20;
    v7 = v6;
    if (v5 || objc_msgSend(v6, "code") != (id)-25300)
    {
      if (dword_10003F400 <= 40
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 40)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _keychainVerificationDevicesRestoredOnSameDevice]", 40, "### Keychain items %@", v5);
      }
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v19 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 1, &v19));
      v11 = v19;

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("AccessorySetup"), 1));
      v18 = 0;
      v14 = objc_msgSend(v8, "removeItemAtURL:error:", v13, &v18);
      v15 = v18;
      if ((v14 & 1) == 0
        && dword_10003F400 <= 90
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
      {
        v16 = CUPrintNSError(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        LogPrintF(&dword_10003F400, "-[DADaemonServer _keychainVerificationDevicesRestoredOnSameDevice]", 90, "### Unable to drop accessory cache %@", v17);

      }
      v7 = v11;
    }

  }
  else if (dword_10003F400 <= 90
         && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    LogPrintF(&dword_10003F400, "-[DADaemonServer _keychainVerificationDevicesRestoredOnSameDevice]", 90, "### Keychain item verification unavailable before first unlock");
  }
}

- (void)updateDADevicesWithInstalledApps
{
  int v3;
  const char *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableArray *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSMutableSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  NSMutableSet *v30;
  _BYTE v31[128];
  _BYTE v32[128];

  if (dword_10003F400 <= 90 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v3 = off_10003F5F0();
    v4 = "no";
    if (v3)
      v4 = "yes";
    LogPrintF(&dword_10003F400, "-[DADaemonServer updateDADevicesWithInstalledApps]", 90, "### Buddy - %s", v4);
  }
  if (off_10003F5F0())
  {
    if (dword_10003F400 <= 90
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer updateDADevicesWithInstalledApps]", 90, "### Cannot validate cache yet, device in buddy");
    }
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0));
    v6 = objc_opt_new(NSMutableSet);
    v7 = objc_opt_new(NSMutableArray);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100004084;
    v29[3] = &unk_100038B10;
    v8 = v6;
    v30 = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v29);
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer updateDADevicesWithInstalledApps]", 50, "### Current ASK apps count = %lu", -[NSMutableSet count](v8, "count"));
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 192));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "bundleIdentifier"));
          if (v14)
          {
            -[NSMutableArray addObject:](v7, "addObject:", v14);
            if (-[NSMutableSet containsObject:](v8, "containsObject:", v14))
              -[DADaemonServer updateAppInfo:](self, "updateAppInfo:", v14);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      }
      while (v11);
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v8;
    v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
          if ((-[NSMutableArray containsObject:](v7, "containsObject:", v20) & 1) == 0)
            -[DADaemonServer removeAppsAccessForBundleID:appRemoval:](self, "removeAppsAccessForBundleID:appRemoval:", v20, 1);
        }
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      }
      while (v17);
    }

  }
}

- (void)_removeAllDevicesAndAppAccess
{
  void *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _removeAllDevicesAndAppAccess]", 50, "### Remove all devices and AppAccess");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000042F8;
  v11[3] = &unk_100038B10;
  v11[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
  v10 = 1;
  v4 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.accessorysetupkit", &v10);
  if (v4)
  {
    v5 = (char *)v4;
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 8388638)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _removeAllDevicesAndAppAccess]", 8388638, "### Remove all devices and AppAccess directory, using containerized path %s", v5);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v5, 1, 0));
    free(v5);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v9 = 0;
      objc_msgSend(v8, "removeItemAtURL:error:", v7, &v9);

    }
    else if (dword_10003F400 <= 90
           && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _removeAllDevicesAndAppAccess]", 90, "Reset All: Library folder not found");
    }
  }

}

- (void)removeAppsAccess:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[6];

  v5 = a3;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer removeAppsAccess:]", 50, "### removeAppsAccess %@", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000045A8;
  v6[3] = &unk_100038B88;
  v6[4] = v4;
  v6[5] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (void)removeAppsAccessForBundleID:(id)a3 appRemoval:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  DADaemonServer *v12;
  BOOL v13;

  v4 = a4;
  v6 = a3;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
  {
    v7 = "no";
    if (v4)
      v7 = "yes";
    LogPrintF(&dword_10003F400, "-[DADaemonServer removeAppsAccessForBundleID:appRemoval:]", 50, "### removeAppsAccess for bundle %@, uninstall: %s", v6, v7);
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000048E8;
  v10[3] = &unk_100038BB0;
  v13 = v4;
  v11 = v6;
  v12 = self;
  v8 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

- (void)updateAppInfo:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004A00;
  v7[3] = &unk_100038A70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_updateAppInfo:(id)a3 options:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DADaemonServer *v11;
  unint64_t v12;

  v6 = a3;
  if (dword_10003F400 <= 50)
  {
    if (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50))
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateAppInfo:options:]", 50, "### updateAppsAccess %@", v6);
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateAppInfo:options:]", 50, "### updateAppsAccess %@", v6);
    }
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, v6));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004B7C;
  v9[3] = &unk_100038BD8;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

- (BOOL)updateAppAccessInfo:(id)a3 accessoryDevice:(id)a4 removalType:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  void *v27;
  void *v28;
  NSNumber *v29;
  void *v30;
  NSObject *dispatchQueue;
  id v32;
  BOOL v33;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  id v38;
  _QWORD block[4];
  id v40;
  id v41;
  id v42;
  id v43;
  DADaemonServer *v44;
  id v45;
  int64_t v46;
  id obj;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  id *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v10 = a3;
  v51 = 0;
  v52 = (id *)&v51;
  v53 = 0x3032000000;
  v54 = sub_100001CEC;
  v55 = sub_100001CFC;
  v56 = 0;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10000522C;
  v48[3] = &unk_100038C00;
  v50 = &v51;
  v11 = a4;
  v49 = v11;
  v12 = objc_retainBlock(v48);
  v37 = v12;
  v38 = objc_msgSend(v11, "copy");
  v13 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
  if (objc_msgSend(v14, "length"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdentifier"));
    if (!objc_msgSend(v15, "length"))
    {
      if (a6)
      {
        v36 = DAErrorF(350001, "No device ID");
        v33 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(v36);
      }
      else
      {
        v33 = 0;
      }
      goto LABEL_24;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appAccessInfoDeviceMap"));

    if (!v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v13, "setAppAccessInfoDeviceMap:", v17);

    }
    v18 = v52;
    obj = v52[5];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer _saveDeviceAppAccessInfo:device:error:](self, "_saveDeviceAppAccessInfo:device:error:", v10, v13, &obj));
    objc_storeStrong(v18 + 5, obj);
    v20 = v52[5];
    if (v20)
    {
      if (a6)
      {
        v33 = 0;
        *a6 = objc_retainAutorelease(v20);
LABEL_23:

        v12 = v37;
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appAccessInfoDeviceMap"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, v14);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer generateImageURLForDevice:](self, "generateImageURLForDevice:", v13));
      objc_msgSend(v13, "setDisplayImageFileURL:", v22);

      if (-[DADaemonServer _saveAccessoryDevice:bundleID:existingOptions:removalType:error:](self, "_saveAccessoryDevice:bundleID:existingOptions:removalType:error:", v13, v14, objc_msgSend(v10, "accessoryOptions"), a5, a6))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveryMap, "objectForKeyedSubscript:", v14));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "discoveryObj"));
        v25 = objc_msgSend(v24, "flags");

        if ((v25 & 8) == 0)
        {
          v26 = objc_msgSend(v19, "state");
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer _updateStateForDiscoveryDeviceID:state:appID:](self, "_updateStateForDiscoveryDeviceID:state:appID:", v15, v26, v14));
          if (v26)
          {
            if (dword_10003F400 <= 50
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer updateAppAccessInfo:accessoryDevice:removalType:error:]", 50, "### UpdateAppAccessInfo report change: %@", v13);
            }
            -[DADaemonServer _reportDeviceChanged:appID:discovery:](self, "_reportDeviceChanged:appID:discovery:", v13, v14, v27 != 0);
          }
          else
          {
            if (dword_10003F400 <= 50
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer updateAppAccessInfo:accessoryDevice:removalType:error:]", 50, "### UpdateAppAccessInfo report lost: %@", v38);
            }
            -[DADaemonServer _reportRemovedDevice:appID:discovery:](self, "_reportRemovedDevice:appID:discovery:", v38, v14, v27 != 0);
          }
          -[DADaemonServer _scheduleCheckAppAccessInfo](self, "_scheduleCheckAppAccessInfo");

        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "SSID"));

        if (v28)
          -[DADaemonServer _updateWiFiDevice:bundleID:](self, "_updateWiFiDevice:bundleID:", v13, v14);
        v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        dispatchQueue = self->_dispatchQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000052E4;
        block[3] = &unk_100038C28;
        v40 = v14;
        v41 = v13;
        v46 = a5;
        v42 = v19;
        v43 = v41;
        v44 = self;
        v32 = v30;
        v45 = v32;
        dispatch_async(dispatchQueue, block);
        -[DADaemonServer _keychainMarkDeviceForRestoreOnSameDevice](self, "_keychainMarkDeviceForRestoreOnSameDevice");

        v33 = 1;
        goto LABEL_23;
      }
    }
    v33 = 0;
    goto LABEL_23;
  }
  if (a6)
  {
    v35 = DAErrorF(350001, "No bundle ID");
    v33 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v35);
  }
  else
  {
    v33 = 0;
  }
LABEL_25:

  ((void (*)(_QWORD *))v12[2])(v12);
  _Block_object_dispose(&v51, 8);

  return v33;
}

- (void)_checkAppAccessInfo
{
  double prefCheckAppAccessInfoSeconds;
  OS_dispatch_source *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  OS_dispatch_source *checkAppAccessInfoTimer;
  dispatch_source_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  OS_dispatch_source *v13;
  NSObject *v14;
  _QWORD handler[4];
  NSObject *v16;
  DADaemonServer *v17;

  if (-[DADaemonServer _checkAppAccessInfoExpired](self, "_checkAppAccessInfoExpired"))
  {
    if (self->_prefCheckAppAccessInfoSeconds >= 10.0)
      prefCheckAppAccessInfoSeconds = self->_prefCheckAppAccessInfoSeconds;
    else
      prefCheckAppAccessInfoSeconds = 10.0;
    v4 = self->_checkAppAccessInfoTimer;
    if (v4)
    {
      v5 = v4;
      if (dword_10003F400 <= 30
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        v6 = CUPrintDurationDouble(prefCheckAppAccessInfoSeconds);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        LogPrintF(&dword_10003F400, "-[DADaemonServer _checkAppAccessInfo]", 30, "CheckAppAccessInfo timer update: %@", v7);

      }
      CUDispatchTimerSet(v5, prefCheckAppAccessInfoSeconds, -1.0, 10.0);
    }
    else
    {
      v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)&self->_checkAppAccessInfoTimer, v9);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100005688;
      handler[3] = &unk_100038A70;
      v5 = v9;
      v16 = v5;
      v17 = self;
      dispatch_source_set_event_handler(v5, handler);
      if (dword_10003F400 <= 30
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        v10 = CUPrintDurationDouble(prefCheckAppAccessInfoSeconds);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        LogPrintF(&dword_10003F400, "-[DADaemonServer _checkAppAccessInfo]", 30, "CheckAppAccessInfo timer start: %@", v11);

      }
      CUDispatchTimerSet(v5, prefCheckAppAccessInfoSeconds, -1.0, 10.0);
      dispatch_activate(v5);

    }
    return;
  }
  checkAppAccessInfoTimer = self->_checkAppAccessInfoTimer;
  if (!checkAppAccessInfoTimer)
    return;
  if (dword_10003F400 >= 31)
  {
    v12 = checkAppAccessInfoTimer;
LABEL_21:
    v14 = v12;
    dispatch_source_cancel(v12);
    v13 = self->_checkAppAccessInfoTimer;
    self->_checkAppAccessInfoTimer = 0;

    return;
  }
  if (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _checkAppAccessInfo]", 30, "CheckAppAccessInfo timer stop");
  v12 = self->_checkAppAccessInfoTimer;
  if (v12)
    goto LABEL_21;
}

- (BOOL)_checkAppAccessInfoExpired
{
  CFAbsoluteTime Current;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  OS_os_transaction *expiredDeviceChecktransaction;
  BOOL v10;
  OS_os_transaction *v11;
  BOOL v12;
  id obj;
  _QWORD v15[8];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE v24[128];

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appAccessInfoMap"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000058BC;
        v15[3] = &unk_100038C50;
        v15[4] = v7;
        v15[5] = self;
        *(CFAbsoluteTime *)&v15[7] = Current;
        v15[6] = &v20;
        objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v4);
  }

  expiredDeviceChecktransaction = self->_expiredDeviceChecktransaction;
  if (*((_BYTE *)v21 + 24))
    v10 = expiredDeviceChecktransaction == 0;
  else
    v10 = 0;
  if (v10)
  {
    v11 = (OS_os_transaction *)os_transaction_create("com.apple.accessorysetupkit.expireddevicecheck");
    expiredDeviceChecktransaction = self->_expiredDeviceChecktransaction;
  }
  else
  {
    v11 = 0;
  }
  self->_expiredDeviceChecktransaction = v11;

  v12 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);
  return v12;
}

- (void)_checkDevices
{
  NSMutableSet *deviceNECPValueStrings;
  NSMutableSet *v4;

  self->_deviceStateHasTransient = 0;
  deviceNECPValueStrings = self->_deviceNECPValueStrings;
  self->_deviceNECPValueStrings = 0;

  -[DADaemonServer _checkDevicesForAllApps](self, "_checkDevicesForAllApps");
  -[DADaemonServer _updateDeviceStateTimer](self, "_updateDeviceStateTimer");
  -[DADaemonServer _necpUpdateValueStrings:](self, "_necpUpdateValueStrings:", self->_deviceNECPValueStrings);
  v4 = self->_deviceNECPValueStrings;
  self->_deviceNECPValueStrings = 0;

}

- (void)_checkDevicesForAllApps
{
  _QWORD *v2;
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  void *i;
  _QWORD *v13;
  void *v14;
  void *v15;
  BOOL v16;
  double prefCheckDevicesSeconds;
  OS_dispatch_source *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  OS_dispatch_source *checkDevicesTimer;
  dispatch_source_t v23;
  uint64_t v24;
  void *v25;
  OS_dispatch_source *v26;
  void *v27;
  void *v28;
  _QWORD handler[4];
  NSObject *v31;
  DADaemonServer *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id obj;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_100001CEC;
  v43 = sub_100001CFC;
  v44 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10000611C;
  v38[3] = &unk_100038AE8;
  v38[4] = &v39;
  v2 = objc_retainBlock(v38);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
  v7 = (id *)(v40 + 5);
  obj = (id)v40[5];
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 4, &obj));
  v27 = v3;
  objc_storeStrong(v7, obj);

  if (v28)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v28;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          v13 = v2;
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathExtension"));
          v16 = objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("daappdata")) == 0;

          v2 = v13;
          if (v16)
            v10 |= !-[DADaemonServer _checkDevicesForAppDataURL:](self, "_checkDevicesForAppDataURL:", v14);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v9);

      if ((v10 & 1) != 0)
      {
        if (self->_prefCheckDevicesSeconds >= 10.0)
          prefCheckDevicesSeconds = self->_prefCheckDevicesSeconds;
        else
          prefCheckDevicesSeconds = 10.0;
        v18 = self->_checkDevicesTimer;
        if (v18)
        {
          v19 = v18;
          if (dword_10003F400 <= 30
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            v20 = CUPrintDurationDouble(prefCheckDevicesSeconds);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAllApps]", 30, "CheckDevices timer update: %@", v21, v27);

          }
          CUDispatchTimerSet(v19, prefCheckDevicesSeconds, -1.0, 10.0);
          goto LABEL_36;
        }
        v23 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        objc_storeStrong((id *)&self->_checkDevicesTimer, v23);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000061CC;
        handler[3] = &unk_100038A70;
        v19 = v23;
        v31 = v19;
        v32 = self;
        dispatch_source_set_event_handler(v19, handler);
        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          v24 = CUPrintDurationDouble(prefCheckDevicesSeconds);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAllApps]", 30, "CheckDevices timer start: %@", v25, v27);

        }
        CUDispatchTimerSet(v19, prefCheckDevicesSeconds, -1.0, 10.0);
        dispatch_activate(v19);
        v26 = (OS_dispatch_source *)v31;
LABEL_35:

LABEL_36:
        goto LABEL_37;
      }
    }
    else
    {

    }
    checkDevicesTimer = self->_checkDevicesTimer;
    if (checkDevicesTimer)
    {
      if (dword_10003F400 >= 31)
      {
        v19 = checkDevicesTimer;
LABEL_30:
        dispatch_source_cancel(v19);
        v26 = self->_checkDevicesTimer;
        self->_checkDevicesTimer = 0;
        goto LABEL_35;
      }
      if (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30))
        LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAllApps]", 30, "CheckDevices timer stop");
      v19 = self->_checkDevicesTimer;
      if (v19)
        goto LABEL_30;
    }
  }
LABEL_37:

  ((void (*)(_QWORD *))v2[2])(v2);
  _Block_object_dispose(&v39, 8);

}

- (BOOL)_checkDevicesForAppDataURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double Current;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v13;
  id v14;
  id v15;
  int *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char isKindOfClass;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t Int64Ranged;
  uint64_t v25;
  double v26;
  void *v28;
  id v29;
  int v30;
  __CFString *v31;
  id v32;
  id v33;
  id v36;
  uint64_t v37;
  void *v38;
  NSMutableSet *deviceNECPValueStrings;
  NSMutableSet *v40;
  NSMutableSet *v41;
  id v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  BOOL v50;
  id v51;
  CFTypeID v52;
  uint64_t v53;
  void *v54;
  id v55;
  int v56;
  void *v57;
  int *v58;
  unsigned int v59;
  int v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id obj;
  uint64_t v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  _BYTE v84[128];

  v4 = a3;
  v83 = 0;
  v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v4, &v83);
  v6 = v83;
  v7 = v6;
  if (v5)
  {
    v66 = v4;
    v67 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByDeletingPathExtension"));

    Current = CFAbsoluteTimeGetCurrent();
    TypeID = CFDictionaryGetTypeID();
    v72 = v5;
    TypedValue = CFDictionaryGetTypedValue(v5, CFSTR("devices"), TypeID, 0);
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v77 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "allKeys"));
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    v14 = 0;
    v15 = 0;
    if (v76)
    {
      v74 = *(_QWORD *)v80;
      v16 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
      while (1)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v80 != v74)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)v17);
          v19 = objc_opt_class(NSString, v13);
          isKindOfClass = objc_opt_isKindOfClass(v18, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", v18));
          if ((isKindOfClass & 1) == 0)
          {
            v31 = CFSTR("bad deviceID class");
            goto LABEL_51;
          }
          v23 = objc_opt_class(NSDictionary, v21);
          if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
          {
            v31 = CFSTR("bad device info class");
            goto LABEL_51;
          }
          Int64Ranged = CFDictionaryGetInt64Ranged(v22, CFSTR("deviceState"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
          if (!(Int64Ranged << 32))
          {
            v31 = CFSTR("state unapproved");
            goto LABEL_51;
          }
          v25 = (int)Int64Ranged;
          v26 = 0.0;
          if ((int)Int64Ranged != 10 && (int)Int64Ranged != 30)
          {
            v26 = self->_prefDeviceApprovedSeconds - (Current - CFDictionaryGetDouble(v22, CFSTR("approveTime"), 0));
            if (v26 <= 0.0)
            {
              v70 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer _statefulDevicesForAppID:](self, "_statefulDevicesForAppID:", v9));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", v18));
              v29 = v28;
              if (v28)
                objc_msgSend(v28, "setState:", 30);
              v71 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer _updateStateForDiscoveryDeviceID:state:appID:](self, "_updateStateForDiscoveryDeviceID:state:appID:", v18, 30, v9));
              if (!v29)
              {
                v29 = objc_alloc_init((Class)DADevice);
                objc_msgSend(v29, "setIdentifier:", v18);
              }
              v30 = v16[256];
              if (v30 <= 30 && (v30 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
                LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAppDataURL:]", 30, "Invalidating expired device: app %@, device %@", v9, v29);
              v69 = v29;
              -[DADaemonServer _reportDeviceChanged:appID:discovery:](self, "_reportDeviceChanged:appID:discovery:", v29, v9, v71 != 0);
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", v18));
              v32 = objc_msgSend(v68, "mutableCopy");
              objc_msgSend(v32, "setObject:forKeyedSubscript:", &off_10003A4F0, CFSTR("deviceState"));
              if (!v14)
                v14 = objc_msgSend(v77, "mutableCopy");
              v33 = objc_msgSend(v32, "copy");
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, v18);

              if (!v15)
                v15 = objc_msgSend(v72, "mutableCopy");
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("devices"));
              self->_deviceStateHasTransient = 1;

              v16 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
            }
          }
          if (v25 == 30 || v25 == 10)
          {
            v26 = self->_prefDeviceApprovedSeconds - (Current - CFDictionaryGetDouble(v22, CFSTR("approveTime"), 0));
            if (v26 <= 0.0)
            {
              v31 = CFSTR("expired");
LABEL_51:
              v45 = v16[256];
              if (v45 <= 30 && (v45 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
                LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAppDataURL:]", 30, "Remove device: app %@, device %@, reason %@", v9, v18, v31);
              if (!v14)
                v14 = objc_msgSend(v77, "mutableCopy");
              objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v18);
              if (!v15)
                v15 = objc_msgSend(v72, "mutableCopy");
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("devices"));
              -[DADaemonServer _necpRemoveUUIDsForAppID:deviceID:](self, "_necpRemoveUUIDsForAppID:deviceID:", v9, v18);
              v46 = objc_claimAutoreleasedReturnValue(-[DADaemonServer _updateStateForDiscoveryDeviceID:state:appID:](self, "_updateStateForDiscoveryDeviceID:state:appID:", v18, 0, v9));
              v47 = (id)v46;
              if (!v46)
              {
                v47 = objc_alloc_init((Class)DADevice);
                objc_msgSend(v47, "setIdentifier:", v18);
              }
              -[DADaemonServer _reportRemovedDevice:appID:discovery:](self, "_reportRemovedDevice:appID:discovery:", v47, v9, v46 != 0);

              v16 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
              goto LABEL_62;
            }
          }
          if (v25 == 30 || v25 == 10)
          {
            if (Current - CFDictionaryGetDouble(v22, CFSTR("deviceStateStartTime"), 0) >= self->_prefDeviceStateTimeoutSeconds
                                                                                           + -1.0)
            {
              v36 = objc_alloc((Class)NSString);
              v37 = DADeviceStateToString(v25);
              v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
              v31 = (__CFString *)objc_msgSend(v36, "initWithFormat:", CFSTR("state timeout: %@"), v38);

              v16 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
              if (v31)
                goto LABEL_51;
            }
            self->_deviceStateHasTransient = 1;
          }
          deviceNECPValueStrings = self->_deviceNECPValueStrings;
          if (!deviceNECPValueStrings)
          {
            v40 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
            v41 = self->_deviceNECPValueStrings;
            self->_deviceNECPValueStrings = v40;

            deviceNECPValueStrings = self->_deviceNECPValueStrings;
          }
          v42 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@:%@"), v9, v18);
          -[NSMutableSet addObject:](deviceNECPValueStrings, "addObject:", v42);

          v43 = v16[256];
          if (v43 <= 30 && (v43 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            v44 = CUPrintDurationDouble(v26);
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue(v44);
            LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAppDataURL:]", 30, "Keeping device: app %@, device %@, expire %@", v9, v18, v31);
LABEL_62:

          }
          v17 = (char *)v17 + 1;
        }
        while (v76 != v17);
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
        v76 = v48;
        if (!v48)
          goto LABEL_73;
      }
    }
    v16 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
LABEL_73:

    v5 = v72;
    if (v15)
      v51 = v15;
    else
      v51 = v72;
    v52 = CFDictionaryGetTypeID();
    v53 = CFDictionaryGetTypedValue(v51, CFSTR("devices"), v52, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = objc_msgSend(v54, "count");
    v50 = v55 == 0;
    if (v55)
    {
      v56 = v16[256];
      v4 = v66;
      if (v56 <= 30 && (v56 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAppDataURL:]", 30, "Keeping app %@, devices %d", v9, objc_msgSend(v54, "count"));
      v63 = v15;
      v64 = v63;
      if (v15 && (objc_msgSend(v63, "isEqual:", v72) & 1) == 0)
        -[DADaemonServer _saveAppDataDict:fileURL:](self, "_saveAppDataDict:fileURL:", v64, v66);

      goto LABEL_99;
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v78 = v67;
    v58 = v16;
    v4 = v66;
    v59 = objc_msgSend(v57, "removeItemAtURL:error:", v66, &v78);
    v75 = v78;

    v60 = v58[256];
    if (v59)
    {
      if (v60 <= 30)
      {
        v50 = 1;
        if (v60 != -1 || _LogCategory_Initialize(&dword_10003F400, 30))
          LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAppDataURL:]", 30, "Remove app: %@", v9);
        v67 = v75;
        goto LABEL_99;
      }
    }
    else if (v60 <= 90 && (v60 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    {
      v61 = CUPrintNSError(v75);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAppDataURL:]", 90, "### Remove app failed: %@, %@", v9, v62);

      v67 = v75;
LABEL_98:
      v50 = 1;
LABEL_99:

      v7 = v67;
      goto LABEL_100;
    }
    v67 = v75;
    goto LABEL_98;
  }
  if (dword_10003F400 <= 90 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v49 = CUPrintNSError(v7);
    v15 = (id)objc_claimAutoreleasedReturnValue(v49);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAppDataURL:]", 90, "### CheckDevicesForApp read failed: %@, %@", v4, v15);
    v50 = 1;
LABEL_100:

    goto LABEL_101;
  }
  v50 = 1;
LABEL_101:

  return v50;
}

- (BOOL)devicesPresentWithAppID:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveryMap, "objectForKeyedSubscript:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceMap"));
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (id)getAuthorizedDevices:(id)a3
{
  id v3;
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v3, CFSTR("daappdata"));
  v5 = NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v4, 0));

  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer getAuthorizedDevices:]", 50, "appDataFileURL %@, appDataFilename %@", v8, v4);
  v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v8, 0);
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer getAuthorizedDevices:]", 30, "appDataDict %@, appID %@", v9, v3);
  if (v9)
  {
    TypeID = CFDictionaryGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v9, CFSTR("devices"), TypeID, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v12)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100006DA4;
      v17[3] = &unk_100038C78;
      v18 = objc_alloc_init((Class)NSMutableArray);
      v13 = v18;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
      v14 = &__NSArray0__struct;
      if (v13)
        v14 = v13;
      v15 = v14;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)modifyDeviceIdentifier:(id)a3 session:(id)a4 settings:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  BOOL v21;
  id *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v23 = a6;
    v24 = v11;
    v16 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
        v20 = objc_msgSend(v19, "isEqualToString:", v10);

        if (v20)
        {
          if (dword_10003F400 <= 30
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            LogPrintF(&dword_10003F400, "-[DADaemonServer modifyDeviceIdentifier:session:settings:error:]", 30, "Modify %@, device %@", v12, v18);
          }
          v11 = v24;
          v21 = -[DADaemonServer modifyAccessoryDevice:session:settings:error:](self, "modifyAccessoryDevice:session:settings:error:", v18, v24, v12, v23);
          goto LABEL_16;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v15)
        continue;
      break;
    }
    v21 = 1;
    v11 = v24;
  }
  else
  {
    v21 = 1;
  }
LABEL_16:

  return v21;
}

- (id)generateImageURLForDevice:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  id obj;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100001CEC;
  v37 = sub_100001CFC;
  v38 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000073E8;
  v30[3] = &unk_100038C00;
  v32 = &v33;
  v3 = a3;
  v31 = v3;
  v4 = objc_retainBlock(v30);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  if (!objc_msgSend(v5, "length"))
  {
    v20 = DAErrorF(350001, "No device ID");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)v34[5];
    v34[5] = v21;

LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  v29 = 1;
  v6 = (char *)container_system_group_path_for_identifier(0, "systemgroup.com.apple.accessorysetupkit", &v29);
  if (!v6)
    goto LABEL_15;
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer generateImageURLForDevice:]", 30, "Using container path %s", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v6, 1, 0));
  free(v6);
  if (!v7)
    goto LABEL_15;
  v27 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("AccessorySetup"), 1));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  v11 = (void *)v10;
  if (v9 && v10)
  {
    v26 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("DADevices"), 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = (id *)(v34 + 5);
    obj = (id)v34[5];
    v15 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &obj);
    objc_storeStrong(v14, obj);

    if ((v15 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
      v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-Image.%@"), v5, CFSTR("dadeviceimagedata"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v17, 0));

    }
    else
    {
      v19 = 0;
    }
    v8 = v26;
    v4 = v27;
  }
  else
  {
    v24 = DAErrorF(350001, "Bad file path");
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v19 = 0;
    v12 = (void *)v34[5];
    v34[5] = v25;
  }

LABEL_16:
  ((void (*)(_QWORD *))v4[2])(v4);

  _Block_object_dispose(&v33, 8);
  return v19;
}

- (id)appAccessInfoForDeviceID:(id)a3 appID:(id)a4
{
  id v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;

  v5 = a3;
  v6 = a4;
  v45 = 1;
  v7 = (char *)container_system_group_path_for_identifier(0, "systemgroup.com.apple.accessorysetupkit", &v45);
  if (v7)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer appAccessInfoForDeviceID:appID:]", 30, "Using container path %s", v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v7, 1, 0));
    free(v7);
    if (!v8)
    {
      v7 = 0;
      goto LABEL_17;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("AccessorySetup"), 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppAccessInfos"), 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
    v13 = CBGenerateObfuscatedSHA256HashedString(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v14, CFSTR("daappInfodata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v12));
    v42 = v15;
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", v15, 0));

    v44 = 0;
    v41 = (void *)v17;
    v18 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v17, &v44);
    v19 = v44;
    v39 = v14;
    v40 = v18;
    if (v18)
    {
      TypeID = CFDictionaryGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v18, CFSTR("devices"), TypeID, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
      v23 = v22;
      v38 = v12;
      if (v22)
      {
        v37 = v11;
        v24 = v10;
        v25 = v8;
        v26 = v9;
        v27 = v6;
        v28 = v5;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v5));
        v43 = v19;
        v7 = (char *)objc_msgSend(objc_alloc((Class)DADeviceAppAccessInfo), "initWithPersistentDictionaryRepresentation:error:", v29, &v43);
        v30 = v43;

        if (v7)
        {
          v31 = v7;
        }
        else if (dword_10003F400 <= 90
               && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
        {
          v35 = CUPrintNSError(v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          LogPrintF(&dword_10003F400, "-[DADaemonServer appAccessInfoForDeviceID:appID:]", 90, "### Unable to decode app info: %@, %@", v28, v36);

        }
        v19 = v30;
        v5 = v28;
        v6 = v27;
        v9 = v26;
        v8 = v25;
        v10 = v24;
        v11 = v37;
        goto LABEL_12;
      }
      if (dword_10003F400 <= 90)
      {
        if (dword_10003F400 == -1 && !_LogCategory_Initialize(&dword_10003F400, 90))
        {
          v7 = 0;
          goto LABEL_13;
        }
        v34 = CUPrintNSError(v19);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v34);
        LogPrintF(&dword_10003F400, "-[DADaemonServer appAccessInfoForDeviceID:appID:]", 90, "### Devices within app info not found: %@", v29);
        v7 = 0;
LABEL_12:

LABEL_13:
        v12 = v38;
LABEL_14:

LABEL_15:
        v14 = v39;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      if (dword_10003F400 > 90)
      {
        v7 = 0;
        goto LABEL_16;
      }
      if (dword_10003F400 == -1 && !_LogCategory_Initialize(&dword_10003F400, 90))
      {
        v7 = 0;
        goto LABEL_15;
      }
      v33 = CUPrintNSError(v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v33);
      LogPrintF(&dword_10003F400, "-[DADaemonServer appAccessInfoForDeviceID:appID:]", 90, "### Device app info not found: %@", v23);
    }
    v7 = 0;
    goto LABEL_14;
  }
LABEL_17:

  return v7;
}

- (id)getDevicesWithFlags:(unint64_t)a3 appID:(id)a4
{
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id *v13;
  id v14;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  id v28;
  CFTypeID v29;
  uint64_t v30;
  void *v31;
  CFTypeID v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  id *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  uint64_t *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  _QWORD v90[4];
  id v91;
  uint64_t *v92;
  id obj;
  uint64_t v94;
  _QWORD v95[5];
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  _BYTE v102[128];
  _BYTE v103[128];

  v66 = a4;
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = sub_100001CEC;
  v100 = sub_100001CFC;
  v101 = 0;
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_1000082E8;
  v95[3] = &unk_100038AE8;
  v95[4] = &v96;
  v64 = objc_retainBlock(v95);
  v94 = 1;
  v4 = (char *)container_system_group_path_for_identifier(0, "systemgroup.com.apple.accessorysetupkit", &v94);
  if (v4)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer getDevicesWithFlags:appID:]", 30, "Using container path %s", v4);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v4, 1, 0));
    free(v4);
    if (v5)
    {
      v58 = v5;
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "URLByAppendingPathComponent:isDirectory:", CFSTR("AccessorySetup"), 1));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppAccessInfos"), 1));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "path"));
      if (v66)
      {
        v6 = v66;
        v7 = CBGenerateObfuscatedSHA256HashedString(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v8, CFSTR("daappInfodata"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v62));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v9, 0));

        v12 = objc_alloc((Class)NSDictionary);
        v13 = (id *)(v97 + 5);
        obj = (id)v97[5];
        v14 = objc_msgSend(v12, "initWithContentsOfURL:error:", v11, &obj);
        objc_storeStrong(v13, obj);
        if (v14)
        {
          TypeID = CFDictionaryGetTypeID();
          TypedValue = CFDictionaryGetTypedValue(v14, CFSTR("devices"), TypeID, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          v90[0] = _NSConcreteStackBlock;
          v90[1] = 3221225472;
          v90[2] = sub_100008398;
          v90[3] = &unk_100038CA0;
          v91 = v70;
          v92 = &v96;
          objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v90);

        }
        else
        {
          v54 = DANestedErrorF(v97[5], 350006, "Decoding failed");
          v55 = objc_claimAutoreleasedReturnValue(v54);
          v17 = (void *)v97[5];
          v97[5] = v55;
        }

        if (!v14)
        {
          v67 = 0;
LABEL_46:

          v20 = v58;
          goto LABEL_47;
        }
      }
      else
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v62));
        v22 = (id *)(v97 + 5);
        v89 = (id)v97[5];
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v21, 0, 4, &v89));
        objc_storeStrong(v22, v89);

        if (!v23)
        {
          v67 = 0;
LABEL_45:

          goto LABEL_46;
        }
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v86;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(_QWORD *)v86 != v26)
                objc_enumerationMutation(v24);
              v28 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i));
              if (v28)
              {
                v29 = CFStringGetTypeID();
                v30 = CFDictionaryGetTypedValue(v28, CFSTR("bundleID"), v29, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                if (v31)
                {
                  v32 = CFDictionaryGetTypeID();
                  v33 = CFDictionaryGetTypedValue(v28, CFSTR("devices"), v32, 0);
                  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                  v81[0] = _NSConcreteStackBlock;
                  v81[1] = 3221225472;
                  v81[2] = sub_1000084AC;
                  v81[3] = &unk_100038CC8;
                  v82 = v70;
                  v84 = &v96;
                  v35 = v31;
                  v83 = v35;
                  objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v81);

                }
              }

            }
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
          }
          while (v25);
        }

      }
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "URLByAppendingPathComponent:isDirectory:", CFSTR("DADevices"), 1));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "path"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v60));
      v37 = (id *)(v97 + 5);
      v80 = (id)v97[5];
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v36, 0, 4, &v80));
      objc_storeStrong(v37, v80);

      if (v63)
      {
        v67 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v68 = v63;
        v38 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v76, v102, 16);
        if (v38)
        {
          v71 = *(_QWORD *)v77;
          do
          {
            v39 = 0;
            v72 = v38;
            do
            {
              if (*(_QWORD *)v77 != v71)
                objc_enumerationMutation(v68);
              v40 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v39);
              v41 = objc_autoreleasePoolPush();
              v75 = 0;
              objc_msgSend(v40, "getResourceValue:forKey:error:", &v75, NSURLNameKey, 0);
              v42 = v75;
              v74 = 0;
              objc_msgSend(v40, "getResourceValue:forKey:error:", &v74, NSURLIsDirectoryKey, 0);
              v43 = v74;
              if ((objc_msgSend(v43, "BOOLValue") & 1) == 0)
              {
                v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "lastPathComponent"));
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v44, "stringByDeletingPathExtension"));

                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", v45));
                LOBYTE(v44) = v46 == 0;

                if ((v44 & 1) == 0)
                {
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "path"));
                  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v47));
                  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v48));
                  v50 = objc_alloc((Class)DADevice);
                  v73 = 0;
                  v51 = objc_msgSend(v50, "initWithPersistentDictionaryRepresentation:error:", v49, &v73);
                  v69 = v73;
                  if (v51)
                  {
                    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", v45));
                    objc_msgSend(v51, "setAppAccessInfoDeviceMap:", v52);

                    objc_msgSend(v67, "addObject:", v51);
                  }
                  else if (dword_10003F400 <= 90
                         && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
                  {
                    LogPrintF(&dword_10003F400, "-[DADaemonServer getDevicesWithFlags:appID:]", 90, "[Decoding Error] %@", v69);
                  }

                }
              }

              objc_autoreleasePoolPop(v41);
              v39 = (char *)v39 + 1;
            }
            while (v72 != v39);
            v38 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v76, v102, 16);
          }
          while (v38);
        }

      }
      else
      {
        v67 = 0;
      }

      goto LABEL_45;
    }
  }
  v18 = DANestedErrorF(v97[5], 350006, "Get Library dir failed");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v67 = 0;
  v20 = (void *)v97[5];
  v97[5] = v19;
LABEL_47:

  ((void (*)(_QWORD *))v64[2])(v64);
  _Block_object_dispose(&v96, 8);

  return v67;
}

- (void)reportAuthorizedDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getAuthorizedDevices:](self, "getAuthorizedDevices:", v4));
  v6 = v5;
  if (v5)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "identifier"));
          if (v11)
            v12 = -[DADaemonServer _updateStateForDiscoveryDeviceID:state:appID:](self, "_updateStateForDiscoveryDeviceID:state:appID:", v11, 25, v4);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v18, "setState:", 25);
          -[DADaemonServer _reportDeviceChanged:appID:discovery:](self, "_reportDeviceChanged:appID:discovery:", v18, v4, 0);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }

  }
  else if (dword_10003F400 <= 30
         && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
  {
    LogPrintF(&dword_10003F400, "-[DADaemonServer reportAuthorizedDevices:]", 30, "No authorized devices for appID: %@", v4);
  }

}

- (void)_reportDeviceChanged:(id)a3 appID:(id)a4 discovery:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = self->_xpcConnections;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14), "reportDeviceChanged:appID:discovery:", v8, v9, v5, (_QWORD)v24);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveryMap, "objectForKeyedSubscript:", v9));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "discoveryObj"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleID"));
  v19 = objc_msgSend(v18, "isEqualToString:", v9);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "discoveryObj"));
  v21 = v20;
  if ((v19 & 1) != 0)
    goto LABEL_11;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleID"));
  v23 = objc_msgSend(v22, "isEqualToString:", v9);

  if (v23)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "discoveryObj"));
LABEL_11:
    objc_msgSend(v21, "reportDeviceChanged:appID:", v8, v9, (_QWORD)v24);

  }
}

- (void)_reportDevicesPresentChanged:(BOOL)a3 appID:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_xpcConnections;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "reportDevicesPresentChanged:appID:", v4, v6, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_reportDevicesPresentChanged:(BOOL)a3 migrated:(BOOL)a4 appID:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "reportDevicesPresentChanged:appID:", v5, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_reportRemovedDevice:(id)a3 appID:(id)a4 discovery:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_xpcConnections;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "reportRemovedDevice:appID:discovery:", v8, v9, v5, (_QWORD)v15);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (BOOL)revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];

  v6 = a3;
  v7 = a4;
  v8 = self->_discoveryMap;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9));
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:device:]", 50, "### revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo inDevice %@ ", v7);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_100001CEC;
  v33 = sub_100001CFC;
  v34 = 0;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "discoverySet"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000090C0;
    v25[3] = &unk_100038D18;
    v12 = v6;
    v26 = v12;
    v27 = v7;
    v28 = &v29;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v25);

    v13 = (void *)v30[5];
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bluetoothIdentifier"));
      v15 = v14 == 0;

      if (!v15 || objc_msgSend(v12, "state") == (id)25 || objc_msgSend(v12, "state") == (id)10)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
        v17 = (id)-[DADaemonServer _applicationHasBluetoothGlobalTCC:](self, "_applicationHasBluetoothGlobalTCC:", v16) == (id)1;

        if (!v17)
        {
          if (dword_10003F400 <= 50
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
            LogPrintF(&dword_10003F400, "-[DADaemonServer revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:device:]", 50, "### revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo for bundleIdentifier %@ ", v20);

          }
          v21 = kTCCServiceBluetoothAlways;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
          v35[0] = kTCCSetNoKill;
          v35[1] = kTCCResetSyncAuth;
          v36[0] = &__kCFBooleanTrue;
          v36[1] = &__kCFBooleanTrue;
          v23 = TCCAccessResetForBundleIdWithOptions(v21, v22, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));

          if (v23)
          {
            v18 = 1;
            goto LABEL_12;
          }
          if (dword_10003F400 <= 90
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30[5], "bundleID"));
            LogPrintF(&dword_10003F400, "-[DADaemonServer revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:device:]", 90, "Error revoking Bluetooth TCC for bundle %@", v24);

          }
        }
      }
    }
  }
  v18 = 0;
LABEL_12:
  _Block_object_dispose(&v29, 8);

  return v18;
}

- (void)_scheduleCheckAppAccessInfo
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (!self->_checkAppAccessInfoScheduled)
  {
    self->_checkAppAccessInfoScheduled = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000093AC;
    block[3] = &unk_100038950;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_scheduleCheckDevices
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (!self->_checkDevicesScheduled)
  {
    self->_checkDevicesScheduled = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009424;
    block[3] = &unk_100038950;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_saveAppDataDict:(id)a3 fileURL:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  id v13;

  v5 = a4;
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 200, 0, &v13));
  v7 = v13;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByDeletingPathExtension"));

  if (v6)
  {
    v12 = v7;
    v10 = objc_msgSend(v6, "writeToURL:options:error:", v5, 1073741825, &v12);
    v11 = v12;

    if ((v10 & 1) != 0)
    {
      if (dword_10003F400 <= 30
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAppDataDict:fileURL:]", 30, "SaveAppData: %@", v9);
      }
    }
    else if (dword_10003F400 <= 90
           && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAppDataDict:fileURL:]", 90, "### Write app data failed: %@", v9);
    }
    v7 = v11;
  }
  else if (dword_10003F400 <= 90
         && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAppDataDict:fileURL:]", 90, "### Serialize app data failed: %@", v9);
  }

}

- (BOOL)saveDevice:(id)a3 session:(id)a4 allowCreate:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  CFTypeID TypeID;
  uint64_t TypedValue;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t NSNumber;
  void *v23;
  double Current;
  double v25;
  void *v26;
  int has_signature;
  const char *v28;
  void *v29;
  void *v30;
  id v31;
  CFTypeID v32;
  uint64_t v33;
  CFTypeID v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *i;
  void *v42;
  void *v43;
  CFTypeID v44;
  uint64_t v45;
  void *v46;
  uint64_t Int64;
  int Int64Ranged;
  int v49;
  void *v50;
  void *v51;
  unsigned int v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  unsigned __int8 v57;
  id v58;
  const char *v59;
  BOOL v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  unsigned int v70;
  id v71;
  id v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v90;
  id v91;
  void *v92;
  _QWORD *v93;
  id v94;
  void *v95;
  DADaemonServer *v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  id obj;
  id v107;
  void *v108;
  id v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  _QWORD v116[7];
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  int v124;
  _BYTE v125[128];

  v6 = a5;
  v105 = a3;
  v97 = a4;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v124 = 0;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v120 = 0;
  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472;
  v116[2] = sub_10000A4EC;
  v116[3] = &unk_100038D68;
  v116[5] = &v121;
  v116[6] = &v117;
  v96 = self;
  v116[4] = self;
  v93 = objc_retainBlock(v116);
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "bundleID"));
  if (objc_msgSend(v101, "length"))
  {
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "identifier"));
    if (!objc_msgSend(v108, "length"))
    {
      if (a6)
      {
        v75 = DAErrorF(350001, "No device ID");
        v60 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(v75);
      }
      else
      {
        v60 = 0;
      }
      goto LABEL_105;
    }
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v101, CFSTR("daappdata"));
    v10 = NSTemporaryDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v9, 0));
    v92 = v9;

    v115 = 0;
    v13 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v99, &v115);
    v94 = v115;
    v100 = v13;
    if (!v13 && !v6)
    {
      if (a6)
      {
        v76 = DANestedErrorF(v94, 350006, "Read app data failed");
        v60 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(v76);
      }
      else
      {
        v60 = 0;
      }
      goto LABEL_104;
    }
    v14 = objc_msgSend(v13, "mutableCopy");
    v15 = v14;
    if (v14)
      v103 = v14;
    else
      v103 = objc_alloc_init((Class)NSMutableDictionary);

    TypeID = CFDictionaryGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v103, CFSTR("devices"), TypeID, 0);
    v95 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (!v95 && !v6)
    {
      if (a6)
      {
        v77 = DAErrorF(350006, "No devices");
        v60 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(v77);
      }
      else
      {
        v60 = 0;
      }
      goto LABEL_103;
    }
    v18 = objc_msgSend(v95, "mutableCopy");
    v19 = v18;
    if (v18)
      v107 = v18;
    else
      v107 = objc_alloc_init((Class)NSMutableDictionary);

    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", v108));
    if (!v102 && !v6)
    {
      if (a6)
      {
        v78 = DAErrorF(350006, "Device not found");
        v60 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(v78);
      }
      else
      {
        v60 = 0;
      }
      goto LABEL_102;
    }
    v20 = objc_msgSend(v102, "mutableCopy");
    v21 = v20;
    if (v20)
      v104 = v20;
    else
      v104 = objc_alloc_init((Class)NSMutableDictionary);

    NSNumber = NSDictionaryGetNSNumber(v102, CFSTR("deviceState"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v91 = objc_msgSend(v23, "integerValue");

    v98 = objc_msgSend(v105, "state");
    Current = CFAbsoluteTimeGetCurrent();
    v25 = Current;
    if (v6)
    {
      if (v98)
      {
        objc_msgSend(v105, "setApproveTime:", Current);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "networkEndpoint"));
        if (v26
          && dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          has_signature = nw_endpoint_has_signature(v26);
          v28 = "no";
          if (has_signature)
            v28 = "yes";
          LogPrintF(&dword_10003F400, "-[DADaemonServer saveDevice:session:allowCreate:error:]", 30, "nw_endpoint signed: %s for device: %@ for app: %@", v28, v105, v101);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "persistentDictionaryRepresentation"));
        v31 = objc_msgSend(v30, "mutableCopy");

        v104 = v31;
LABEL_35:

        if (!v104)
        {
          v104 = 0;
          v90 = 1;
          objc_msgSend(v107, "setObject:forKeyedSubscript:", 0, v108);
LABEL_47:
          if (objc_msgSend(v105, "state") == (id)20 && objc_msgSend(v105, "supportsGrouping"))
          {
            ++*((_DWORD *)v122 + 6);
            ++*((_DWORD *)v118 + 6);
            v113 = 0u;
            v114 = 0u;
            v111 = 0u;
            v112 = 0u;
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "allKeys"));
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
            if (v39)
            {
              v40 = *(_QWORD *)v112;
              obj = v38;
              do
              {
                for (i = 0; i != v39; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v112 != v40)
                    objc_enumerationMutation(obj);
                  v42 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)i);
                  if ((objc_msgSend(v42, "isEqualToString:", v108) & 1) == 0)
                  {
                    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", v42));
                    v44 = CFStringGetTypeID();
                    v45 = CFDictionaryGetTypedValue(v43, CFSTR("protocolType"), v44, 0);
                    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
                    Int64 = CFDictionaryGetInt64(v43, CFSTR("deviceSupportsGrouping"), 0);
                    Int64Ranged = CFDictionaryGetInt64Ranged(v43, CFSTR("deviceState"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
                    if (Int64)
                    {
                      v49 = Int64Ranged;
                      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "protocolType"));
                      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "identifier"));
                      v52 = objc_msgSend(v46, "isEqualToString:", v51);

                      if (v52)
                      {
                        ++*((_DWORD *)v122 + 6);
                        if (v49 == 20)
                        {
                          v53 = objc_msgSend(v43, "mutableCopy");
                          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25));
                          objc_msgSend(v53, "setObject:forKeyedSubscript:", v54, CFSTR("approveTime"));

                          objc_msgSend(v107, "setObject:forKeyedSubscript:", v53, v42);
                          ++*((_DWORD *)v118 + 6);

                        }
                      }
                    }

                  }
                }
                v38 = obj;
                v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
              }
              while (v39);
            }

          }
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v107, CFSTR("devices"));
          if (objc_msgSend(v103, "isEqual:", v100))
          {
            if (dword_10003F400 <= 30
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer saveDevice:session:allowCreate:error:]", 30, "SaveDevice: no changes, %@, %@", v97, v105);
            }
            v60 = 1;
            goto LABEL_101;
          }
          v110 = 0;
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v103, 200, 0, &v110));
          v56 = v110;

          if (!v55)
          {
            if (a6)
            {
              v86 = DANestedErrorF(v56, 350004, "Serialize app data failed");
              v60 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue(v86);
            }
            else
            {
              v60 = 0;
            }
            goto LABEL_100;
          }
          v109 = v56;
          v57 = objc_msgSend(v55, "writeToURL:options:error:", v99, 1073741825, &v109);
          v58 = v109;

          if ((v57 & 1) == 0)
          {
            if (a6)
            {
              v87 = DANestedErrorF(v58, 350004, "Write app data failed");
              v60 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue(v87);
            }
            else
            {
              v60 = 0;
            }
LABEL_99:
            v56 = v58;
LABEL_100:

            v94 = v56;
LABEL_101:

LABEL_102:
LABEL_103:

LABEL_104:
LABEL_105:

            goto LABEL_106;
          }
          if ((v90 & 1) != 0)
          {
            if (dword_10003F400 <= 30
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
            {
              v59 = "SaveDevice: remove, %@, %@";
LABEL_76:
              LogPrintF(&dword_10003F400, "-[DADaemonServer saveDevice:session:allowCreate:error:]", 30, v59, v97, v105);
            }
          }
          else if (dword_10003F400 <= 30
                 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            v59 = "SaveDevice: changed, %@, %@";
            goto LABEL_76;
          }
          -[DADaemonServer _necpUpdateUUIDForAppID:device:](v96, "_necpUpdateUUIDForAppID:device:", v101, v105);
          -[DADaemonServer _scheduleCheckDevices](v96, "_scheduleCheckDevices");
          v61 = objc_claimAutoreleasedReturnValue(-[DADaemonServer _updateStateForDiscoveryDeviceID:state:appID:](v96, "_updateStateForDiscoveryDeviceID:state:appID:", v108, v98, v101));
          v62 = (void *)v61;
          if (v61)
            v63 = (id)v61;
          else
            v63 = v105;
          -[DADaemonServer _reportDeviceChanged:appID:discovery:](v96, "_reportDeviceChanged:appID:discovery:", v63, v101, v61 != 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v96->_discoveryMap, "objectForKeyedSubscript:", v101));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "deviceMap"));
          v66 = v65;
          if (v65)
          {
            v67 = objc_msgSend(v65, "count");
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", v108));
            if (v91 == (id)20 && v98 != (id)20)
            {
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", v108));
              v70 = objc_msgSend(v69, "pendingRemoval");

              if (v70)
              {
                if (dword_10003F400 <= 30
                  && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
                {
                  LogPrintF(&dword_10003F400, "-[DADaemonServer saveDevice:session:allowCreate:error:]", 30, "Device is pending removal and not activated anymore: %@", v68);
                }
                v71 = objc_msgSend(objc_alloc((Class)DADeviceEvent), "initWithEventType:device:", 41, v68);
                -[DADaemonServer _reportDiscoveryEvent:appID:](v96, "_reportDiscoveryEvent:appID:", v71, v101);
                objc_msgSend(v66, "setObject:forKeyedSubscript:", 0, v108);

              }
            }
            v72 = objc_msgSend(v66, "count");
            if (v67 && !v72)
              -[DADaemonServer _reportDevicesPresentChanged:appID:](v96, "_reportDevicesPresentChanged:appID:", 0, v101);

          }
          v60 = 1;
          goto LABEL_99;
        }
        if (v98 == (id)30 || v98 == (id)10)
        {
          if (CFDictionaryGetDouble(v104, CFSTR("deviceStateStartTime"), 0) == 0.0)
            CFDictionarySetDouble(v104, CFSTR("deviceStateStartTime"), v25);
        }
        else
        {
          objc_msgSend(v104, "setObject:forKeyedSubscript:", 0, CFSTR("deviceStateStartTime"));
        }
        v32 = CFStringGetTypeID();
        v33 = CFDictionaryGetTypedValue(v102, CFSTR("bluetoothIdentifier"), v32, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v34 = CFStringGetTypeID();
        v35 = CFDictionaryGetTypedValue(v104, CFSTR("bluetoothIdentifier"), v34, 0);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        v37 = (void *)v36;
        if (!v29 || !v36 || (objc_msgSend(v29, "isEqualToString:", v36) & 1) != 0)
        {

          v90 = 0;
          goto LABEL_46;
        }
        if (a6)
        {
          v88 = DANestedErrorF(v94, 350004, "Rejecting mismatched Bluetooth UUID");
          *a6 = (id)objc_claimAutoreleasedReturnValue(v88);
        }

LABEL_137:
        v60 = 0;
        goto LABEL_101;
      }
    }
    else
    {
      if (v96->_prefDeviceApprovedSeconds - (Current - CFDictionaryGetDouble(v102, CFSTR("approveTime"), 0)) <= 0.0
        && v98)
      {
        if (a6)
        {
          v79 = DAErrorF(350006, "Expired");
          v60 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue(v79);
          goto LABEL_101;
        }
        goto LABEL_137;
      }
      if (!v91)
      {
        if (a6)
        {
          v80 = DADeviceStateToString(0);
          v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
          v82 = DAErrorF(350006, "Not in approved state: %@", v81);
          *a6 = (id)objc_claimAutoreleasedReturnValue(v82);

        }
        goto LABEL_137;
      }
      if (v98)
      {
        if (v98 == (id)10)
        {
          if (a6)
          {
            v83 = DADeviceStateToString(10);
            v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
            v85 = DAErrorF(350006, "State not allowed: %@", v84);
            *a6 = (id)objc_claimAutoreleasedReturnValue(v85);

          }
          goto LABEL_137;
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
        objc_msgSend(v104, "setObject:forKeyedSubscript:", v26, CFSTR("deviceState"));
        goto LABEL_35;
      }
    }
    v90 = 1;
    v29 = v104;
    v104 = 0;
LABEL_46:

    objc_msgSend(v107, "setObject:forKeyedSubscript:", v104, v108);
    goto LABEL_47;
  }
  if (a6)
  {
    v74 = DAErrorF(350001, "No app bundle ID");
    v60 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v74);
  }
  else
  {
    v60 = 0;
  }
LABEL_106:

  ((void (*)(_QWORD *))v93[2])(v93);
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v121, 8);

  return v60;
}

- (id)_saveDeviceAppAccessInfo:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  id v14;
  const __CFURL *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const __CFURL *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  CFTypeID TypeID;
  uint64_t TypedValue;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  double Current;
  id v49;
  uint64_t NSNumber;
  void *v51;
  id v52;
  void *v53;
  id v54;
  unsigned __int8 v55;
  void *v56;
  void *v57;
  unsigned int v58;
  unsigned int v59;
  const char *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  CBCentralManager *cbCentralManager;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  unsigned __int8 v73;
  id v74;
  const __CFURL *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  const __CFURL *v88;
  void *v89;
  id *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  CFErrorRef error;
  uint64_t v104;
  void *v105;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  if (objc_msgSend(v10, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
    if (objc_msgSend(v11, "length"))
    {
      v93 = -[DADaemonServer appBundleInfoAccessoryOptions:](self, "appBundleInfoAccessoryOptions:", v10);
      v104 = 1;
      v12 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.accessorysetupkit", &v104);
      if (v12)
      {
        v13 = (char *)v12;
        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 8388638)))
        {
          LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 8388638, "### SaveDeviceAppAccessInfo, using containerized path %s", v13);
        }
        v90 = a5;
        v14 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v13, 1, 0));
        free(v13);
        if (!v14)
          goto LABEL_99;
        v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1));
        if (dword_10003F400 <= 50
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
        {
          LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 50, "SaveDeviceAppAccessInfo: backup parent error %@", 0);
        }
        error = 0;
        if (!CFURLSetResourcePropertyForKey(v15, _kCFURLIsExcludedFromUnencryptedBackupKey, kCFBooleanTrue, &error)
          && dword_10003F400 <= 90
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
        {
          v16 = CUPrintNSError(error);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 90, "SaveDeviceAppAccessInfo: iTunes backup resource %@, error %{public}@", v15, v17);

        }
        v102 = 0;
        -[__CFURL setResourceValue:forKey:error:](v15, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, &v102);
        v18 = v102;
        v19 = v15;
        v20 = v18;
        v88 = v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL URLByAppendingPathComponent:isDirectory:](v19, "URLByAppendingPathComponent:isDirectory:", CFSTR("AccessorySetup"), 1));
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppAccessInfos"), 1));
        v101 = v20;
        objc_msgSend(v21, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, &v101);
        v22 = v101;

        v100 = 0;
        v99 = 0;
        v87 = v21;
        objc_msgSend(v21, "getResourceValue:forKey:error:", &v100, NSURLIsExcludedFromBackupKey, &v99);
        v23 = v100;
        v24 = v99;

        if (dword_10003F400 <= 50
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
        {
          LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 50, "SaveDeviceAppAccessInfo: backup resource %@, error %@", v23, v24);
        }
        v86 = v23;
        v25 = v96;
        objc_msgSend(v96, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v27 = objc_msgSend(v26, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v96, 1, 0, v90);

        v89 = v14;
        if (!v27)
        {
          v14 = 0;
          v68 = v87;
          v75 = v88;
          goto LABEL_93;
        }
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "path"));
        v29 = CBGenerateObfuscatedSHA256HashedString(v10);
        v83 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v30 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v83, CFSTR("daappInfodata"));
        v84 = (void *)v28;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v28));
        v82 = v30;
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "URLByAppendingPathComponent:isDirectory:", v30, 0));

        v91 = (void *)v32;
        v95 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v32, 0);
        v33 = objc_msgSend(v95, "mutableCopy");
        v34 = v33;
        if (v33)
          v35 = v33;
        else
          v35 = objc_alloc_init((Class)NSMutableDictionary);
        v36 = v35;

        TypeID = CFDictionaryGetTypeID();
        TypedValue = CFDictionaryGetTypedValue(v36, CFSTR("devices"), TypeID, 0);
        v81 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
        v39 = objc_msgSend(v81, "mutableCopy");
        v40 = v39;
        if (v39)
          v41 = v39;
        else
          v41 = objc_alloc_init((Class)NSMutableDictionary);
        v42 = v41;
        v85 = v24;

        v92 = v11;
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v11));
        v43 = objc_msgSend(v94, "mutableCopy");
        v44 = v43;
        v45 = v9;
        if (v43)
          v46 = v43;
        else
          v46 = objc_alloc_init((Class)NSMutableDictionary);
        v47 = v46;

        Current = CFAbsoluteTimeGetCurrent();
        v49 = objc_msgSend(v8, "state");
        NSNumber = NSDictionaryGetNSNumber(v94, CFSTR("deviceState"), 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
        v52 = objc_msgSend(v51, "integerValue");

        if (v49 && v93)
        {
          if (v49 != (id)10 || v52 == (id)10)
          {
            v55 = objc_msgSend(v8, "accessoryOptions");
            if ((v55 & 1) != 0 && (v93 & 1) == 0)
            {
              objc_msgSend(v8, "setAccessoryOptions:", (unint64_t)objc_msgSend(v8, "accessoryOptions") & 0xFFFFFFFFFFFFFFFELL);
              if (dword_10003F400 <= 50
                && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
              {
                LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 50, "SaveDeviceAppAccessInfo: remove Bluetooth Access %@", v8);
              }
            }
            if ((v55 & 2) == 0 || (v93 & 2) != 0)
            {
              v53 = v45;
            }
            else
            {
              objc_msgSend(v8, "setAccessoryOptions:", (unint64_t)objc_msgSend(v8, "accessoryOptions") & 0xFFFFFFFFFFFFFFFDLL);
              v53 = v45;
              if (dword_10003F400 <= 50
                && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
              {
                LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 50, "SaveDeviceAppAccessInfo: remove WiFi Access %@", v8);
              }
            }
          }
          else
          {
            objc_msgSend(v8, "setAccessoryOptions:", v93);
            v53 = v45;
            v49 = -[DADaemonServer _updateDeviceStateForWifi:currentState:](self, "_updateDeviceStateForWifi:currentState:", v45, -[DADaemonServer _updateDeviceStateForBluetooth:device:](self, "_updateDeviceStateForBluetooth:device:", v8, v45));
          }
          objc_msgSend(v8, "setApproveTime:", Current);
          objc_msgSend(v8, "setState:", v49);
          v45 = v53;
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "discoveryConfiguration"));
          if (v56)
            objc_msgSend(v8, "setAppDiscoveryConfiguration:", v56);

          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentDictionaryRepresentation"));
          v54 = objc_msgSend(v57, "mutableCopy");

          v58 = -[DADaemonServer revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:device:](self, "revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:device:", v8, v45);
          if (dword_10003F400 <= 50)
          {
            v59 = v58;
            v11 = v92;
            if (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50))
            {
              v60 = "no";
              if (v59)
                v60 = "yes";
              LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 50, "revokeBluetoothTCC %@ Device %@ returned %s", v8, v45, v60);
            }
LABEL_58:
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v54, v11);
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v42, CFSTR("devices"));
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v10, CFSTR("bundleID"));
            if (objc_msgSend(v36, "isEqual:", v95))
            {
              if (dword_10003F400 <= 30
                && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
              {
                LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 30, "SaveDeviceAppAccessInfo: no changes, %@", v8);
              }
              v14 = v8;
              v68 = v87;
              goto LABEL_92;
            }
            if (v54)
            {
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "discoveryConfiguration"));
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bluetoothIdentifier"));

              if (v62)
              {
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "discoveryConfiguration"));
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bluetoothIdentifier"));

                cbCentralManager = self->_cbCentralManager;
                v105 = v64;
                v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v105, 1));
                v67 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager retrievePeripheralsWithIdentifiers:](cbCentralManager, "retrievePeripheralsWithIdentifiers:", v66));

                if (v67 && objc_msgSend(v67, "count"))
                {
                  if (dword_10003F400 <= 30
                    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
                  {
                    LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 30, "SaveDeviceAppAccessInfo: found CBPeripheral, %@", v67);
                  }
                  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "firstObject"));
                  objc_msgSend(v69, "tag:", CFSTR("DA_ASK_RETAIN_DEVICE"));

                }
              }
            }
            v98 = 0;
            v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v36, 200, 0, &v98));
            v71 = v98;
            v72 = v71;
            if (v70)
            {
              v97 = v71;
              v73 = objc_msgSend(v70, "writeToURL:options:error:", v91, 1073741825, &v97);
              v74 = v97;

              if ((v73 & 1) != 0)
              {
                if (v54)
                {
                  v68 = v87;
                  if (dword_10003F400 <= 30
                    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
                  {
                    LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 30, "SaveDeviceAppAccessInfo: changed, %@", v8);
                  }
                  v14 = objc_msgSend(objc_alloc((Class)DADeviceAppAccessInfo), "initWithPersistentDictionaryRepresentation:error:", v54, v90);
                }
                else
                {
                  v68 = v87;
                  if (dword_10003F400 <= 30
                    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
                  {
                    LogPrintF(&dword_10003F400, "-[DADaemonServer _saveDeviceAppAccessInfo:device:error:]", 30, "SaveDeviceAppAccessInfo: remove, %@", v8);
                  }
                  v14 = 0;
                }
                goto LABEL_91;
              }
              if (v90)
              {
                v80 = DANestedErrorF(v74, 350004, "Write app access info data failed");
                v14 = 0;
                *v90 = (id)objc_claimAutoreleasedReturnValue(v80);
              }
              else
              {
                v14 = 0;
              }
            }
            else
            {
              if (v90)
              {
                v79 = DANestedErrorF(v71, 350004, "Serialize app access info data failed");
                v14 = 0;
                *v90 = (id)objc_claimAutoreleasedReturnValue(v79);
              }
              else
              {
                v14 = 0;
              }
              v74 = v72;
            }
            v68 = v87;
LABEL_91:

            v11 = v92;
LABEL_92:

            v9 = v45;
            v75 = v88;
            v25 = v96;
            v24 = v85;
LABEL_93:

LABEL_99:
            goto LABEL_100;
          }
        }
        else
        {

          v54 = 0;
        }
        v11 = v92;
        goto LABEL_58;
      }
    }
    else if (a5)
    {
      v77 = DAErrorF(350001, "No device ID");
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v77);
      goto LABEL_99;
    }
    v14 = 0;
    goto LABEL_99;
  }
  if (a5)
  {
    v76 = DAErrorF(350001, "No bundle ID");
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v76);
  }
  else
  {
    v14 = 0;
  }
LABEL_100:

  return v14;
}

- (BOOL)modifyAccessoryDevice:(id)a3 session:(id)a4 settings:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unsigned int v37;
  void *v38;
  unsigned __int8 v39;
  int v40;
  void *v41;
  char v42;
  id v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  id v51;
  unsigned __int8 *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  CBCentralManager *cbCentralManager;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  char v66;
  DABluetoothPairingManager *btPairingManager;
  void *v68;
  void *v69;
  unsigned int v70;
  id v71;
  void *v72;
  uint64_t v74;
  id *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id *v80;
  unsigned __int8 v81;
  void *v82;
  id v83;
  char v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (!objc_msgSend(v13, "length"))
  {
    if (a6)
    {
      v74 = DAErrorF(350001, "No device ID");
      LOBYTE(v14) = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(v74);
      goto LABEL_99;
    }
    goto LABEL_109;
  }
  v105 = 1;
  v14 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.accessorysetupkit", &v105);
  if (v14)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 8388638)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer modifyAccessoryDevice:session:settings:error:]", 8388638, "### ModifyAccessoryDevice, Using containerized path %s", (const char *)v14);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v14, 1, 0));
    free((void *)v14);
    if (v15)
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "URLByAppendingPathComponent:isDirectory:", CFSTR("AccessorySetup"), 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
      v93 = v16;
      if (!v16 || !v17)
      {
        if (a6)
        {
          v75 = a6;
          v76 = v17;
          v77 = DAErrorF(350001, "Bad file path");
          LOBYTE(v14) = 0;
          *v75 = (id)objc_claimAutoreleasedReturnValue(v77);
          v17 = v76;
        }
        else
        {
          LOBYTE(v14) = 0;
        }
        goto LABEL_98;
      }
      v95 = v10;
      v92 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("DADevices"), 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v80 = a6;
      v20 = objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, a6);

      if (!v20)
      {
        LOBYTE(v14) = 0;
        goto LABEL_97;
      }
      v102 = v18;
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
      v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v13, CFSTR("dadevicedata"));
      v90 = (void *)v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v21));
      v89 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URLByAppendingPathComponent:isDirectory:", v22, 0));

      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "path"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appAccessInfoMap"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v12));

      v103 = v27;
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "appDiscoveryConfiguration"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v87 = (void *)v25;
      LODWORD(v25) = objc_msgSend(v28, "fileExistsAtPath:", v25);

      v91 = v15;
      if ((_DWORD)v25)
      {
        v29 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v24, 0);

      }
      else
      {
        v29 = 0;
      }
      v88 = v24;
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appAccessInfoMap"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v14, "objectForKeyedSubscript:", v12));
      v31 = objc_msgSend(v30, "state");

      LOBYTE(v14) = 1;
      if (!v29)
      {
        v18 = v102;
        goto LABEL_96;
      }
      v18 = v102;
      if (!v31)
      {
LABEL_96:

        v15 = v91;
LABEL_97:

        v17 = v92;
        v10 = v95;
LABEL_98:

        goto LABEL_99;
      }
      if (v31 == (id)10)
      {
        if (v80)
        {
          v78 = DAErrorF(350006, "Permission denied for current operation");
          LOBYTE(v14) = 0;
          *v80 = (id)objc_claimAutoreleasedReturnValue(v78);
        }
        else
        {
          LOBYTE(v14) = 0;
        }
        goto LABEL_96;
      }
      v83 = v31;
      v32 = v13;
      v33 = v12;
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothClassicAddress"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "SSID"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "SSID"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bridgingIdentifier"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "iconType"));
      v37 = objc_msgSend(v11, "userInitiated");
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "discoveryConfiguration"));
      v81 = objc_msgSend(v38, "flags");

      v39 = objc_msgSend(v9, "flags");
      objc_msgSend(v100, "flags");
      v85 = v35;
      v86 = v34;
      if (v37)
      {
        v79 = v33;
        if (v36 && (objc_msgSend(v35, "isEqualToString:", v36) & 1) == 0)
        {
          objc_msgSend(v9, "setSSID:", v36);
          v40 = 1;
        }
        else
        {
          v40 = 0;
        }
        v82 = v32;
        if (v97)
        {
          v43 = v83;
          v44 = v40;
          if ((objc_msgSend(v34, "isEqualToString:") & 1) == 0)
          {
            objc_msgSend(v9, "setName:", v97);
            v44 = 1;
          }
        }
        else
        {
          v43 = v83;
          v44 = v40;
        }
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "identifier"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "protocolType"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "identifier"));
        v48 = objc_msgSend(v45, "isEqualToString:", v47);

        if (v48)
        {
          objc_msgSend(v9, "setProtocolType:", v98);
          v44 = 1;
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothIdentifier"));

        v42 = 0;
        if (!v49 || (v39 & 0x40) != 0)
        {
          v41 = (void *)v36;
          v12 = v79;
          v18 = v102;
        }
        else
        {
          v41 = (void *)v36;
          v12 = v79;
          v18 = v102;
          if ((v81 & 2) != 0)
          {
            if (dword_10003F400 <= 90
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer modifyAccessoryDevice:session:settings:error:]", 90, "Device supports pairing but was not paired");
            }
            v42 = 1;
          }
        }
        if (v43 == (id)20)
          goto LABEL_40;
        v13 = v82;
        if (v44)
        {
          v50 = 0;
LABEL_89:
          v104 = 0;
          LOBYTE(v14) = -[DADaemonServer updateAppAccessInfo:accessoryDevice:removalType:error:](self, "updateAppAccessInfo:accessoryDevice:removalType:error:", v103, v9, 0, &v104);
          v71 = v104;
          v72 = v71;
          if ((v14 & 1) != 0)
          {
            if (dword_10003F400 <= 30
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer modifyAccessoryDevice:session:settings:error:]", 30, "SaveDeviceSettings: changed, %@, %@", v95, v9);
            }
          }
          else if (v80)
          {
            *v80 = objc_retainAutorelease(v71);
          }

LABEL_95:
          goto LABEL_96;
        }
      }
      else
      {
        v18 = v102;
        v41 = (void *)v36;
        v12 = v33;
        v13 = v32;
        if (v83 == (id)20)
        {
          v82 = v32;
          v42 = 0;
LABEL_40:
          objc_msgSend(v103, "setState:", 25);
          objc_msgSend(v9, "setState:", 25);
          v50 = 0;
          if (v101)
          {
            if (!v96)
            {
              v50 = 0;
              if ((objc_msgSend(0, "isEqualToData:", v101) & 1) == 0)
              {
                v51 = objc_retainAutorelease(v101);
                v52 = (unsigned __int8 *)objc_msgSend(v51, "bytes");
                v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02X:%02X:%02X:%02X:%02X:%02X"), *v52, v52[1], v52[2], v52[3], v52[4], v52[5]));
                if (v50)
                  objc_msgSend(v9, "setBluetoothClassicAddress:", v51);
              }
            }
          }
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothClassicAddress"));

          if (v53)
          {
            v84 = v42;
            v54 = v12;
            v55 = v41;
            objc_msgSend(v9, "setBluetoothClassicAddress:", v101);
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothIdentifier"));
            cbCentralManager = self->_cbCentralManager;
            v106 = v56;
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v106, 1));
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager retrievePeripheralsWithIdentifiers:](cbCentralManager, "retrievePeripheralsWithIdentifiers:", v58));

            if (objc_msgSend(v59, "count"))
            {
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectAtIndexedSubscript:", 0));
              if (dword_10003F400 <= 40
                && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 40)))
              {
                LogPrintF(&dword_10003F400, "-[DADaemonServer modifyAccessoryDevice:session:settings:error:]", 40, "### modifyAccessoryDevice CBPeripheral %@", v59);
              }
              if (v60)
              {
                if (dword_10003F400 <= 40
                  && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 40)))
                {
                  LogPrintF(&dword_10003F400, "-[DADaemonServer modifyAccessoryDevice:session:settings:error:]", 40, "### modifyAccessoryDevice CBPeripheral %@ setting bridging property %@", v59, v50);
                }
                objc_msgSend(v60, "setCustomProperty:value:", CFSTR("ASK_RELATED_RADIO_ADDRESS"), v50);
              }

            }
            v18 = v102;
            v41 = v55;
            v12 = v54;
            v42 = v84;
          }
          if (v41)
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "discoveryConfiguration"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "hotspotSSIDPrefixes"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "firstObject"));

            if (v63 && (objc_msgSend(v41, "hasPrefix:", v63) & 1) == 0)
            {
              if (v80)
              {
                v64 = DAErrorF(350001, "SSID did not match discovery configuration's SSID prefix.");
                *v80 = (id)objc_claimAutoreleasedReturnValue(v64);
              }
              if (dword_10003F400 <= 90
                && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
              {
                LogPrintF(&dword_10003F400, "-[DADaemonServer modifyAccessoryDevice:session:settings:error:]", 90, "SSID %@ did not match discovery config's prefix %@ for %@", v41, v63, v9);
              }
              objc_msgSend(v103, "setState:", 0);
              objc_msgSend(v9, "setState:", 0);
            }
            else
            {
              objc_msgSend(v9, "setSSID:", v41);
            }

          }
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothIdentifier"));

          v66 = v42 ^ 1;
          if (!v65)
            v66 = 1;
          if ((v66 & 1) != 0)
          {
            v13 = v82;
          }
          else
          {
            v13 = v82;
            if (dword_10003F400 <= 90
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer modifyAccessoryDevice:session:settings:error:]", 90, "Device supports pairing but was not paired");
            }
            objc_msgSend(v103, "setState:", 0);
            objc_msgSend(v9, "setState:", 0);
            btPairingManager = self->_btPairingManager;
            if (btPairingManager)
            {
              v68 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothPairingManager getCurrentTaskBluetoothIdentifier](btPairingManager, "getCurrentTaskBluetoothIdentifier"));
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothIdentifier"));
              v70 = objc_msgSend(v68, "isEqual:", v69);

              if (v70)
                -[DABluetoothPairingManager cancelCurrentTask](self->_btPairingManager, "cancelCurrentTask");
            }
          }
          goto LABEL_89;
        }
      }
      if (dword_10003F400 <= 30
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer modifyAccessoryDevice:session:settings:error:]", 30, "SaveDeviceSettings: no changes, %@", v9);
      }
      LOBYTE(v14) = 1;
      goto LABEL_95;
    }
LABEL_109:
    LOBYTE(v14) = 0;
  }
LABEL_99:

  return v14;
}

- (BOOL)_saveAccessoryDevice:(id)a3 bundleID:(id)a4 existingOptions:(unint64_t)a5 removalType:(int64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  const __CFURL *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  CFTypeID TypeID;
  uint64_t TypedValue;
  CFTypeID v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  unsigned __int8 v48;
  id v49;
  void *v50;
  unsigned int v51;
  void *v52;
  unsigned __int8 v53;
  void *v54;
  unsigned int v55;
  void *v56;
  unsigned __int8 v57;
  id v58;
  BOOL v59;
  const char *v60;
  const char *v61;
  id v62;
  uint64_t v63;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  DADaemonServer *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  const __CFURL *v78;
  id *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  unint64_t v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  _QWORD v90[5];
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  CFErrorRef error;
  uint64_t v96;

  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  if (!objc_msgSend(v13, "length"))
  {
    if (a7)
    {
      v63 = DAErrorF(350001, "No device ID");
      v59 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue(v63);
      goto LABEL_85;
    }
LABEL_84:
    v59 = 0;
    goto LABEL_85;
  }
  v96 = 1;
  v14 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.accessorysetupkit", &v96);
  if (!v14)
    goto LABEL_84;
  v15 = (char *)v14;
  if (dword_10003F400 <= 30
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 8388638)))
  {
    LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAccessoryDevice:bundleID:existingOptions:removalType:error:]", 8388638, "### SaveAccessoryDevice, Using containerized path %s", v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v15, 1, 0));
  free(v15);
  if (!v16)
    goto LABEL_84;
  v84 = a6;
  v73 = self;
  v79 = a7;
  v17 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1));
  error = 0;
  if (!CFURLSetResourcePropertyForKey(v17, _kCFURLIsExcludedFromUnencryptedBackupKey, kCFBooleanTrue, &error)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v18 = CUPrintNSError(error);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAccessoryDevice:bundleID:existingOptions:removalType:error:]", 90, "_saveAccessoryDevice: iTunes backup resource %@, error %{public}@", v17, v19);

  }
  -[__CFURL setResourceValue:forKey:error:](v17, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, 0);
  v78 = v17;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL URLByAppendingPathComponent:isDirectory:](v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("AccessorySetup"), 1));
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path"));
  v22 = (void *)v21;
  if (!v20 || !v21)
  {
    v65 = (id)DAErrorF(350001, "Bad file path");
    v59 = 0;
    goto LABEL_81;
  }
  v76 = (void *)v21;
  v77 = v16;
  v83 = v12;
  objc_msgSend(v20, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", CFSTR("DADevices"), 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v25 = objc_msgSend(v24, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v23, 1, 0, v79);

  if (!v25)
  {
    v59 = 0;
    goto LABEL_80;
  }
  objc_msgSend(v23, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, 0);
  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
  v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v13, CFSTR("dadevicedata"));
  v75 = (void *)v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v26));
  v74 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "URLByAppendingPathComponent:isDirectory:", v27, 0));

  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "path"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v82 = (void *)v30;
  v32 = objc_msgSend(v31, "fileExistsAtPath:", v30);
  v33 = 0;
  if (v32)
    v33 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v29, 0);

  v34 = objc_msgSend(v33, "mutableCopy");
  v35 = v34;
  v85 = v29;
  if (v34)
    v36 = v34;
  else
    v36 = objc_alloc_init((Class)NSMutableDictionary);
  v37 = v36;

  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v33, CFSTR("bluetoothIdentifier"), TypeID, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v40 = CFStringGetTypeID();
  v41 = CFDictionaryGetTypedValue(v33, CFSTR("deviceSSID"), v40, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appAccessInfoMap"));
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_10000CB2C;
  v90[3] = &unk_100038D90;
  v90[4] = &v91;
  objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v90);

  if (a6 == 2 || !v92[3])
  {
    v44 = 0;
  }
  else
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentDictionaryRepresentation"));
    v44 = objc_msgSend(v43, "mutableCopy");

    v37 = v43;
  }

  if (objc_msgSend(v44, "isEqual:", v33))
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAccessoryDevice:bundleID:existingOptions:removalType:error:]", 30, "SaveDevice: no changes, %@, %@", v83, v11);
    }
    v59 = 1;
    goto LABEL_79;
  }
  if (v44)
  {
    v89 = 0;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v44, 200, 0, &v89));
    v46 = v89;
    v47 = v46;
    if (v45)
    {
      v88 = v46;
      v48 = objc_msgSend(v45, "writeToURL:options:error:", v85, 1073741825, &v88);
      v49 = v88;

      if (dword_10003F400 <= 30
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAccessoryDevice:bundleID:existingOptions:removalType:error:]", 30, "SaveDevice: changes, %@, %@", v11, v49);
      }
      if ((v48 & 1) != 0)
      {

        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAccessoryDevice:bundleID:existingOptions:removalType:error:]", 30, "SaveDevice: changed, %@, %@", v83, v11);
        }
        goto LABEL_77;
      }
      if (!v79)
        goto LABEL_94;
      v68 = DANestedErrorF(v49, 350004, "Write device data failed");
      v67 = (void *)objc_claimAutoreleasedReturnValue(v68);
    }
    else
    {
      if (!v79)
      {
        v49 = v46;
        goto LABEL_94;
      }
      v66 = DANestedErrorF(v46, 350004, "Serialize device data failed");
      v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      v49 = v47;
    }
    *v79 = v67;
LABEL_94:

LABEL_95:
    v59 = 0;
    goto LABEL_78;
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v51 = objc_msgSend(v50, "fileExistsAtPath:", v82);

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v87 = 0;
    v53 = objc_msgSend(v52, "removeItemAtURL:error:", v85, &v87);
    v49 = v87;

    if ((v53 & 1) == 0)
    {
      if (v79)
      {
        v69 = DANestedErrorF(v49, 350004, "Removing device data failed");
        v59 = 0;
        *v79 = (id)objc_claimAutoreleasedReturnValue(v69);
        goto LABEL_78;
      }
      goto LABEL_95;
    }
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayImageFileURL"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "path"));
    if (v72)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v55 = objc_msgSend(v54, "fileExistsAtPath:", v72);

      if (v55)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v86 = v49;
        v57 = objc_msgSend(v56, "removeItemAtURL:error:", v71, &v86);
        v58 = v86;

        if ((v57 & 1) == 0)
        {
          if (v79)
          {
            v70 = DANestedErrorF(v58, 350004, "Removing device image data failed");
            *v79 = (id)objc_claimAutoreleasedReturnValue(v70);
          }

          v59 = 0;
          v49 = v58;
          goto LABEL_78;
        }
        v49 = v58;
      }
    }

  }
  else
  {
    v49 = 0;
  }
  if (!v84)
  {
    if (dword_10003F400 > 30 || dword_10003F400 == -1 && !_LogCategory_Initialize(&dword_10003F400, 30))
      goto LABEL_77;
    v61 = "SaveDevice: unlinking accessory, %@, %@";
    goto LABEL_73;
  }
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
  {
    if (v84 > 3)
      v60 = "None";
    else
      v60 = off_1000393B0[v84 - 1];
    LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAccessoryDevice:bundleID:existingOptions:removalType:error:]", 30, "SaveDevice: remove (%s) accessory, %@, %@", v60, v83, v11);
  }
  if (v84 == 2 || (v84 & 0xFFFFFFFFFFFFFFFDLL) == 1 && !v92[3])
  {
    if (v81)
    {
      v62 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v81);
      -[DADaemonServer _forgetBluetoothDevice:](v73, "_forgetBluetoothDevice:", v62);

    }
    if (v80)
      -[DADaemonServer _forgetWiFiDevice:](v73, "_forgetWiFiDevice:");
    goto LABEL_77;
  }
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
  {
    v61 = "SaveDevice: unlinked accessory, %@, %@";
LABEL_73:
    LogPrintF(&dword_10003F400, "-[DADaemonServer _saveAccessoryDevice:bundleID:existingOptions:removalType:error:]", 30, v61, v83, v11);
  }
LABEL_77:
  v59 = 1;
LABEL_78:

LABEL_79:
  _Block_object_dispose(&v91, 8);

LABEL_80:
  v12 = v83;
  v22 = v76;
  v16 = v77;
LABEL_81:

LABEL_85:
  return v59;
}

- (id)_statefulDevicesForAppID:(id)a3
{
  id v3;
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v12;
  id v13;
  _QWORD v15[5];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v3, CFSTR("daappdata"));

  v5 = NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v4, 0));

  v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v8, 0);
  if (v9)
  {
    TypeID = CFDictionaryGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v9, CFSTR("devices"), TypeID, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v12)
    {
      v13 = objc_alloc_init((Class)NSMutableDictionary);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000CD00;
      v15[3] = &unk_100038C78;
      v15[4] = v13;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v15);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_updateDeviceStateTimer
{
  OS_dispatch_source *deviceStateTimer;
  OS_dispatch_source **p_deviceStateTimer;
  dispatch_source_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  _QWORD handler[6];

  p_deviceStateTimer = &self->_deviceStateTimer;
  deviceStateTimer = self->_deviceStateTimer;
  if (self->_deviceStateHasTransient)
  {
    if (!deviceStateTimer)
    {
      v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)p_deviceStateTimer, v5);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000CF58;
      handler[3] = &unk_100038A70;
      handler[4] = v5;
      handler[5] = self;
      dispatch_source_set_event_handler(v5, handler);
      if (dword_10003F400 <= 30
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        v6 = CUPrintDurationDouble(self->_prefDeviceStateTimeoutSeconds);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        LogPrintF(&dword_10003F400, "-[DADaemonServer _updateDeviceStateTimer]", 30, "DeviceState timer start: %@", v7);

      }
      CUDispatchTimerSet(v5, self->_prefDeviceStateTimeoutSeconds, -1.0, 1.0);
      dispatch_activate(v5);

    }
    return;
  }
  if (!deviceStateTimer)
    return;
  if (dword_10003F400 >= 31)
  {
    v8 = deviceStateTimer;
LABEL_13:
    v10 = v8;
    dispatch_source_cancel(v8);
    v9 = *p_deviceStateTimer;
    *p_deviceStateTimer = 0;

    return;
  }
  if (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateDeviceStateTimer]", 30, "DeviceState timer stop");
  v8 = *p_deviceStateTimer;
  if (v8)
    goto LABEL_13;
}

- (id)addDiscovery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  DADaemonDiscovery *v13;
  NSMutableDictionary *discoveryMap;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  CBCentralManager *v21;
  CBCentralManager *cbCentralManager;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  DADaemonDiscovery *v32;
  DADaemonServer *v33;
  id v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurations"));
  v12 = objc_msgSend(v4, "flags");
  if (self->_cbCentralManager)
  {
    if (v9)
    {
LABEL_6:
      v13 = (DADaemonDiscovery *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveryMap, "objectForKeyedSubscript:", v9));
      if (!v13)
      {
        v13 = objc_alloc_init(DADaemonDiscovery);
        discoveryMap = self->_discoveryMap;
        if (!discoveryMap)
        {
          v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v16 = self->_discoveryMap;
          self->_discoveryMap = v15;

          discoveryMap = self->_discoveryMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](discoveryMap, "setObject:forKeyedSubscript:", v13, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer _statefulDevicesForAppID:](self, "_statefulDevicesForAppID:", v9));
        -[DADaemonDiscovery setStatefulDeviceMap:](v13, "setStatefulDeviceMap:", v17);

      }
      v18 = (id)objc_claimAutoreleasedReturnValue(-[DADaemonDiscovery discoverySet](v13, "discoverySet"));
      if (!v18)
      {
        v18 = objc_alloc_init((Class)NSMutableSet);
        -[DADaemonDiscovery setDiscoverySet:](v13, "setDiscoverySet:", v18);
      }
      objc_msgSend(v18, "addObject:", v4);
      v19 = objc_claimAutoreleasedReturnValue(-[DADaemonDiscovery discoveryObj](v13, "discoveryObj"));
      if (v19)
      {
        v20 = (id)v19;
        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          LogPrintF(&dword_10003F400, "-[DADaemonServer addDiscovery:]", 30, "Discovery add reuse: %@, total %d", v20, objc_msgSend(v18, "count"));
        }
      }
      else
      {
        v23 = objc_alloc_init((Class)DADiscovery);
        -[DADaemonDiscovery setDiscoveryObj:](v13, "setDiscoveryObj:", v23);
        objc_msgSend(v23, "setBundleID:", v9);
        objc_msgSend(v23, "setConfiguration:", v10);
        objc_msgSend(v23, "setConfigurations:", v11);
        objc_msgSend(v23, "setFlags:", v12);
        objc_msgSend(v23, "setDirect:", 1);
        objc_msgSend(v23, "setDispatchQueue:", self->_dispatchQueue);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10000D3E0;
        v30[3] = &unk_100038DB8;
        v20 = v23;
        v31 = v20;
        v32 = v13;
        v33 = self;
        v34 = v9;
        objc_msgSend(v20, "setEventHandler:", v30);
        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          LogPrintF(&dword_10003F400, "-[DADaemonServer addDiscovery:]", 30, "Discovery add start: %@", v20);
        }
        objc_msgSend(v20, "activate");

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonDiscovery deviceMap](v13, "deviceMap"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allValues"));
      v27 = (void *)v26;
      v28 = &__NSArray0__struct;
      if (v26)
        v28 = (void *)v26;
      v24 = v28;

      goto LABEL_32;
    }
  }
  else
  {
    v21 = (CBCentralManager *)objc_msgSend(objc_alloc((Class)CBCentralManager), "initWithDelegate:queue:options:", self, self->_dispatchQueue, 0);
    cbCentralManager = self->_cbCentralManager;
    self->_cbCentralManager = v21;

    if (v9)
      goto LABEL_6;
  }
  if (dword_10003F400 <= 90 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer addDiscovery:]", 90, "### AddDiscovery failed: no bundleID, %@", v4);
  v24 = 0;
LABEL_32:

  return v24;
}

- (void)removeDiscovery:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  if (v5)
  {
    v6 = (void *)v5;

LABEL_4:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveryMap, "objectForKeyedSubscript:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryObj"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoverySet"));
    objc_msgSend(v9, "removeObject:", v13);
    if (objc_msgSend(v9, "count"))
    {
      if (dword_10003F400 <= 30
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer removeDiscovery:]", 30, "Discovery remove reuse: %@, total %d", v8, objc_msgSend(v9, "count"));
      }
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceMap"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000D6F8;
      v14[3] = &unk_100038E08;
      v14[4] = self;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);
      if (dword_10003F400 <= 30
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer removeDiscovery:]", 30, "Discovery remove stop: %@", v8);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceMap"));
      v12 = objc_msgSend(v11, "count");

      objc_msgSend(v7, "setDeviceMap:", 0);
      objc_msgSend(v7, "setDiscoveryObj:", 0);
      objc_msgSend(v7, "setDiscoverySet:", 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_discoveryMap, "setObject:forKeyedSubscript:", 0, v6);
      objc_msgSend(v8, "invalidate");
      if (v12)
        -[DADaemonServer _reportDevicesPresentChanged:appID:](self, "_reportDevicesPresentChanged:appID:", 0, v6);
      -[DADaemonServer _necpCleanupIfNeeded](self, "_necpCleanupIfNeeded");
      -[DADaemonServer _cleanupWiFiDiscovery](self, "_cleanupWiFiDiscovery");
      -[DADaemonServer _cleanupBTDiscovery](self, "_cleanupBTDiscovery");

    }
    goto LABEL_18;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));

  if (v6)
    goto LABEL_4;
  if (dword_10003F400 <= 90 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer removeDiscovery:]", 90, "### RemoveDiscovery failed: no bundleID, %@", v13);
LABEL_18:

}

- (void)_discoveryEvent:(id)a3 appID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CBCentralManager *cbCentralManager;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  NSNumber *v41;
  void *v42;
  NSObject *dispatchQueue;
  id v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD block[4];
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveryMap, "objectForKeyedSubscript:", v7));
  if (v8)
  {
    v9 = (unint64_t)objc_msgSend(v6, "eventType");
    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 0x28)
    {
      v11 = objc_opt_class(DADeviceEvent, v10);
      if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0
        || (v13 = objc_opt_class(DAEventDevice, v12), (objc_opt_isKindOfClass(v6, v13) & 1) != 0))
      {
        v14 = v6;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "device"));
        v16 = v15;
        if (v15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          if (!v17)
          {
LABEL_41:

            goto LABEL_42;
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bluetoothIdentifier"));
          v46 = v18;
          if (objc_msgSend(v16, "discoveredInExtension") && v18)
          {
            cbCentralManager = self->_cbCentralManager;
            v53 = v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager retrievePeripheralsWithIdentifiers:](cbCentralManager, "retrievePeripheralsWithIdentifiers:", v20));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));

            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "name"));
            objc_msgSend(v16, "setBluetoothOTAName:", v23);

            if (dword_10003F400 <= 50
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer _discoveryEvent:appID:]", 50, "### _discoveryEvent peripheral %@", v22);
            }

            v18 = v46;
          }
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statefulDeviceMap"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v17));

          v45 = v37;
          objc_msgSend(v16, "setState:", objc_msgSend(v37, "state"));
          -[DADaemonServer _addTXTRecordToNWEndpoint:appID:](self, "_addTXTRecordToNWEndpoint:appID:", v16, v7);
          -[DADaemonServer _addSSDPDatatoNWEndpoint:appID:](self, "_addSSDPDatatoNWEndpoint:appID:", v16, v7);
          v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "url"));
          if (v38
            && (+[DADevice deviceMetadataURLValid:](DADevice, "deviceMetadataURLValid:", v38) & 1) == 0)
          {
            if (dword_10003F400 > 30)
              goto LABEL_40;
            v40 = v14;
            if (dword_10003F400 == -1 && !_LogCategory_Initialize(&dword_10003F400, 30))
            {
LABEL_39:
              v14 = v40;
              v18 = v46;
LABEL_40:

              goto LABEL_41;
            }
            v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
            LogPrintF(&dword_10003F400, "-[DADaemonServer _discoveryEvent:appID:]", 30, "Invalid URL for appID %@, deviceID %@, URL %@", v7, v44, v38);
          }
          else
          {

            v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceMap"));
            v39 = objc_msgSend(v38, "count");
            if (!v38)
            {
              v38 = objc_alloc_init((Class)NSMutableDictionary);
              objc_msgSend(v8, "setDeviceMap:", v38);
            }
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v16, v17);
            -[DADaemonServer _necpSignEndpointForDevice:appID:](self, "_necpSignEndpointForDevice:appID:", v16, v7);
            v40 = v14;
            -[DADaemonServer _reportDiscoveryEvent:appID:](self, "_reportDiscoveryEvent:appID:", v14, v7);
            if (!v39)
              -[DADaemonServer _reportDevicesPresentChanged:appID:](self, "_reportDevicesPresentChanged:appID:", 1, v7);
            v41 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
            v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
            dispatchQueue = self->_dispatchQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000DE9C;
            block[3] = &unk_100038E30;
            v49 = v7;
            v50 = v16;
            v51 = v8;
            v52 = v42;
            v44 = v42;
            dispatch_async(dispatchQueue, block);

          }
          goto LABEL_39;
        }
LABEL_42:

      }
    }
    else if (v9 == 55)
    {
      v34 = objc_opt_class(DAEventDeviceBluetoothPairingRequest, v10);
      if ((objc_opt_isKindOfClass(v6, v34) & 1) != 0)
        -[DADaemonServer _reportDiscoveryEvent:appID:](self, "_reportDiscoveryEvent:appID:", v6, v7);
    }
    else if (v9 == 41)
    {
      v24 = objc_opt_class(DADeviceEvent, v10);
      if ((objc_opt_isKindOfClass(v6, v24) & 1) != 0
        || (v26 = objc_opt_class(DAEventDevice, v25), (objc_opt_isKindOfClass(v6, v26) & 1) != 0))
      {
        v14 = v6;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "device"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "device"));
          if (v17)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statefulDeviceMap"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v16));

            if (v29)
              objc_msgSend(v17, "setState:", objc_msgSend(v29, "state"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceMap"));
            v31 = objc_msgSend(v30, "count");
            if (objc_msgSend(v17, "state") == (id)20)
            {
              v47 = v31;
              v32 = v14;
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v16));
              objc_msgSend(v33, "setPendingRemoval:", 1);

              v14 = v32;
              v31 = v47;
            }
            else
            {
              -[DADaemonServer _reportDiscoveryEvent:appID:](self, "_reportDiscoveryEvent:appID:", v14, v7);
              objc_msgSend(v30, "setObject:forKeyedSubscript:", 0, v16);
            }
            v35 = objc_msgSend(v30, "count");
            if (v31 && !v35)
              -[DADaemonServer _reportDevicesPresentChanged:appID:](self, "_reportDevicesPresentChanged:appID:", 0, v7);

          }
          goto LABEL_41;
        }
        goto LABEL_42;
      }
    }
  }
  else if (dword_10003F400 <= 90
         && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    LogPrintF(&dword_10003F400, "-[DADaemonServer _discoveryEvent:appID:]", 90, "### Discovery event for appID: %@", v7);
  }

}

- (void)_reportDevicesMigratedEvent:(id)a3 appID:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "reportDevicesMigrated:appID:", v6, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_reportDiscoveryEvent:(id)a3 appID:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "reportDiscoveryEvent:appID:", v6, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)_updateStateForDiscoveryDeviceID:(id)a3 state:(int64_t)a4 appID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSNumber *v17;
  void *v18;
  NSObject *dispatchQueue;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  int64_t v30;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveryMap, "objectForKeyedSubscript:", v9));
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceMap"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));

    if (v13)
    {
      if ((objc_msgSend(v13, "flags") & 8) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appAccessInfoDeviceMap"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v9));
        objc_msgSend(v15, "setState:", a4);

      }
      objc_msgSend(v13, "setState:", a4);
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "statefulDeviceMap"));
      if (!v16)
      {
        v16 = objc_alloc_init((Class)NSMutableDictionary);
        objc_msgSend(v11, "setStatefulDeviceMap:", v16);
      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, v8);
      v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      dispatchQueue = self->_dispatchQueue;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000E384;
      v24[3] = &unk_100038E58;
      v25 = v9;
      v30 = a4;
      v26 = v8;
      v20 = v13;
      v27 = v20;
      v28 = v11;
      v29 = v18;
      v21 = v18;
      dispatch_async(dispatchQueue, v24);
      v22 = v20;

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)runMigrationWithDiscovery:(id)a3
{
  id v4;
  void *v5;
  CBCentralManager *v6;
  CBCentralManager *cbCentralManager;
  void *v8;
  CBCentralManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CBCentralManager *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  CBCentralManager *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id obj;
  id v79;
  uint64_t v80;
  void *v81;
  DADaemonServer *v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  void **v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, unsigned int);
  void *v95;
  id v96;
  _BYTE v97[128];
  void *v98;
  _BYTE v99[128];
  id v100;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  if (v5)
  {
    if (!self->_cbCentralManager)
    {
      v6 = (CBCentralManager *)objc_msgSend(objc_alloc((Class)CBCentralManager), "initWithDelegate:queue:options:", self, self->_dispatchQueue, 0);
      cbCentralManager = self->_cbCentralManager;
      self->_cbCentralManager = v6;

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, v5));
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 50, "### runMigrationWithDiscovery authorizedDevicesForApp count %lu", objc_msgSend(v8, "count"));
    }
    v9 = self->_cbCentralManager;
    v92 = _NSConcreteStackBlock;
    v93 = 3221225472;
    v94 = sub_10000F0A8;
    v95 = &unk_100038E80;
    v96 = v5;
    v79 = v96;
    -[CBCentralManager retrieveBundle:sessionCountWithCompletion:](v9, "retrieveBundle:sessionCountWithCompletion:");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    v81 = v4;
    v82 = self;
    v76 = v8;
    v77 = v5;
    v75 = v11;
    if (v11)
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothIdentifier"));
      if (v13)
      {

LABEL_12:
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bluetoothIdentifier"));
        v15 = objc_claimAutoreleasedReturnValue(-[DADaemonServer _findDADeviceWithBTIdentifier:](self, "_findDADeviceWithBTIdentifier:"));
        if (v15)
        {
          v16 = (id)v15;
          if (dword_10003F400 <= 50
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
          {
            LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 50, "### runMigrationWithDiscovery found %@", v16);
          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
          objc_msgSend(v16, "setDiscoveryConfiguration:", v49);

        }
        else
        {
          v16 = objc_alloc_init((Class)DADevice);
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "UUIDString"));
          objc_msgSend(v16, "setIdentifier:", v44);

          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bluetoothIdentifier"));
          objc_msgSend(v16, "setBluetoothIdentifier:", v45);

          if (-[CBCentralManager state](self->_cbCentralManager, "state") == (id)5)
          {
            v46 = self->_cbCentralManager;
            v100 = obj;
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1));
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager retrievePeripheralsWithIdentifiers:](v46, "retrievePeripheralsWithIdentifiers:", v47));

            if (dword_10003F400 <= 50
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 50, "### runMigrationWithDiscovery CBPeripheral to migrate:  %@", v48);
            }
            if (objc_msgSend(v48, "count"))
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndex:", 0));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "name"));

              if (v51)
              {
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "name"));
                objc_msgSend(v16, "setBluetoothOTAName:", v52);

              }
            }

          }
          else if (dword_10003F400 <= 90
                 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
          {
            LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 90, "### runMigrationWithDiscovery single centralManager Off to migrate: %ld", -[CBCentralManager state](self->_cbCentralManager, "state"));
          }
          objc_msgSend(v16, "setDiscoveryConfiguration:", v12);
          objc_msgSend(v16, "setFlags:", 8);
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
          objc_msgSend(v16, "setName:", v53);

          if (dword_10003F400 <= 50
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
          {
            LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 50, "### runMigrationWithDiscovery created %@", v16);
          }
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "networkHotspotSSID"));

        if (v54)
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "networkHotspotSSID"));
          objc_msgSend(v16, "setSSID:", v55);

        }
        objc_msgSend(v10, "addObject:", v16);

        goto LABEL_77;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "networkHotspotSSID"));

      if (v14)
        goto LABEL_12;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurations"));
    v18 = objc_msgSend(v17, "count");

    if (!v18)
    {
LABEL_78:
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v56 = v10;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
      if (v57)
      {
        v58 = v57;
        v59 = *(_QWORD *)v85;
        do
        {
          v60 = 0;
          do
          {
            if (*(_QWORD *)v85 != v59)
              objc_enumerationMutation(v56);
            v61 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)v60);
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "identifier"));
            if (v62)
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
              if (v63)
              {
                v64 = -[DADaemonServer appBundleInfoAccessoryOptions:](v82, "appBundleInfoAccessoryOptions:", v63) & 3;
                if (v64)
                {
                  v65 = objc_msgSend(objc_alloc((Class)DADeviceAppAccessInfo), "initWithBundleIdentifier:deviceIdentifier:state:", v79, v62, 25);
                  objc_msgSend(v65, "setAccessoryOptions:", v64);
                  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "appAccessInfoDeviceMap"));
                  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", v63));

                  if (!v67)
                  {
                    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                    objc_msgSend(v61, "setAppAccessInfoDeviceMap:", v68);

                  }
                  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "appAccessInfoDeviceMap"));
                  objc_msgSend(v69, "setObject:forKeyedSubscript:", v65, v63);

                  objc_msgSend(v61, "setFlags:", (unint64_t)objc_msgSend(v61, "flags") | 0x100);
                  v83 = 0;
                  -[DADaemonServer updateAppAccessInfo:accessoryDevice:removalType:error:](v82, "updateAppAccessInfo:accessoryDevice:removalType:error:", v65, v61, 0, &v83);
                  v70 = v83;
                  if (v70
                    && dword_10003F400 <= 90
                    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
                  {
                    v71 = CUPrintNSError(v70);
                    v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
                    LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 90, "Error migrating device %@, %@", v72, v61);

                  }
                  v4 = v81;
                }
                else if (dword_10003F400 <= 90
                       && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
                {
                  LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 90, "Error migrating device with no accessory flags %@", v61);
                }
              }

            }
            v60 = (char *)v60 + 1;
          }
          while (v58 != v60);
          v73 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
          v58 = v73;
        }
        while (v73);
      }

      v74 = objc_msgSend(objc_alloc((Class)DAEventDevicesPresent), "initWithMigration:", 1);
      objc_msgSend(v74, "setDevices:", v56);
      -[DADaemonServer _reportDevicesMigratedEvent:appID:](v82, "_reportDevicesMigratedEvent:appID:", v74, v79);

      v5 = v77;
      goto LABEL_104;
    }
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurations"));
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    if (v19)
    {
      v20 = v19;
      v80 = *(_QWORD *)v89;
      v21 = obj;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v89 != v80)
            objc_enumerationMutation(v21);
          v23 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bluetoothIdentifier"));
          if (v24
            && (v25 = objc_claimAutoreleasedReturnValue(-[DADaemonServer _findDADeviceWithBTIdentifier:](self, "_findDADeviceWithBTIdentifier:", v24))) != 0)
          {
            v26 = (id)v25;
            if (dword_10003F400 <= 50
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 50, "### runMigrationWithDiscovery found %@", v26);
            }
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "configuration"));
            objc_msgSend(v26, "setDiscoveryConfiguration:", v35);

          }
          else
          {
            v26 = objc_alloc_init((Class)DADevice);
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
            objc_msgSend(v26, "setIdentifier:", v28);

            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bluetoothIdentifier"));
            if (v29)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bluetoothIdentifier"));
              objc_msgSend(v26, "setBluetoothIdentifier:", v30);

              if (-[CBCentralManager state](self->_cbCentralManager, "state") == (id)5)
              {
                v31 = v10;
                v32 = self->_cbCentralManager;
                v98 = v24;
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v98, 1));
                v34 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager retrievePeripheralsWithIdentifiers:](v32, "retrievePeripheralsWithIdentifiers:", v33));

                if (dword_10003F400 <= 50
                  && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
                {
                  LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 50, "### runMigrationWithDiscovery CBPeripheral to migrate:  %@", v34);
                }
                if (objc_msgSend(v34, "count"))
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndex:", 0));
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));

                  if (v37)
                  {
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));
                    objc_msgSend(v26, "setBluetoothOTAName:", v38);

                  }
                }

                v10 = v31;
                v21 = obj;
              }
              else if (dword_10003F400 <= 90
                     && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
              {
                LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 90, "### runMigrationWithDiscovery centralManager Off to migrate: %ld for %@", -[CBCentralManager state](self->_cbCentralManager, "state"), v26);
              }
            }
            objc_msgSend(v26, "setDiscoveryConfiguration:", v23);
            objc_msgSend(v26, "setFlags:", 8);
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "displayName"));
            objc_msgSend(v26, "setName:", v39);

            if (dword_10003F400 <= 50
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 50, "### runMigrationWithDiscovery created %@", v26);
            }
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "networkHotspotSSID"));

          if (v40)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "networkHotspotSSID"));
            objc_msgSend(v26, "setSSID:", v41);

          }
          objc_msgSend(v10, "addObject:", v26);

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v42 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
        v20 = v42;
      }
      while (v42);
      v4 = v81;
    }
LABEL_77:

    goto LABEL_78;
  }
  if (dword_10003F400 <= 90 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]", 90, "### runMigrationWithDiscovery skip migration appID missing");
LABEL_104:

}

- (void)runSystemDiscovery
{
  -[DADaemonServer _updateBluetoothScannerIfNeeded](self, "_updateBluetoothScannerIfNeeded");
  -[DADaemonServer _updateWiFiManagerIfNeeded](self, "_updateWiFiManagerIfNeeded");
}

- (int64_t)applicationHasBluetoothGlobalTCC:(id)a3
{
  id v4;
  DADaemonServer *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[DADaemonServer _applicationHasBluetoothGlobalTCC:](v5, "_applicationHasBluetoothGlobalTCC:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)_applicationHasBluetoothGlobalTCC:(id)a3
{
  id v3;
  void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  int64_t v10;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  const __CFBoolean *v13;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = (const __CFArray *)TCCAccessCopyInformationForBundleId(v3)) != 0)
  {
    v6 = v5;
    Count = CFArrayGetCount(v5);
    if (Count < 1)
      goto LABEL_13;
    v8 = Count;
    v9 = 0;
    v10 = 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v9);
      Value = CFDictionaryGetValue(ValueAtIndex, kTCCInfoService);
      if (CFEqual(Value, kTCCServiceBluetoothAlways))
        break;
      ++v9;
    }
    while (v8 != v9);
    v13 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, kTCCInfoGranted);
    if (v13)
    {
      if (CFBooleanGetValue(v13))
        v10 = 2;
      else
        v10 = 3;
    }
    else
    {
LABEL_13:
      v10 = 1;
    }
    CFRelease(v6);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (int64_t)_updateDeviceStateForBluetooth:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_100001CEC;
  v33 = sub_100001CFC;
  v34 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000F5D4;
  v28[3] = &unk_100038AE8;
  v28[4] = &v29;
  v8 = objc_retainBlock(v28);
  v9 = objc_msgSend(v6, "state");
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
  {
    v10 = DADeviceStateToString(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryConfiguration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "associationIdentifier"));
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateDeviceStateForBluetooth:device:]", 50, "### _updateDeviceStateForBluetooth device %@ state %@ asID %@ deviceAccessMap %@", v7, v11, v13, v6);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothIdentifier"));

  if (!v14)
  {
    v26 = DANestedErrorF(v30[5], 350001, "Not a Bluetooth device");
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v22 = (void *)v30[5];
    v30[5] = v27;
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "state") == (id)10 || objc_msgSend(v6, "state") == (id)20)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryConfiguration"));
    v16 = objc_msgSend(v15, "allowsBluetoothPairing");

    if ((v16 & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryConfiguration"));
      v17 = ((unint64_t)objc_msgSend(v18, "flags") >> 1) & 1;

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryConfiguration"));
    v20 = (unint64_t)objc_msgSend(v19, "flags");

    -[DADaemonServer _persistBluetoothDevice:device:requirePairing:pairWithCTKD:](self, "_persistBluetoothDevice:device:requirePairing:pairWithCTKD:", v6, v7, v17, (v20 >> 2) & 1);
  }
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
  {
    v21 = DADeviceStateToString(objc_msgSend(v6, "state"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = DADeviceStateToString(v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateDeviceStateForBluetooth:device:]", 50, "### _updateDeviceStateForBluetooth device %@ state %@->%@", v7, v22, v24);

LABEL_15:
  }
  ((void (*)(_QWORD *))v8[2])(v8);

  _Block_object_dispose(&v29, 8);
  return (int64_t)v9;
}

- (id)_parseDADiscoveryConfiguration:(id)a3
{
  id v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  NSMutableDictionary *v35;
  void *v36;
  NSMutableArray *v37;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothIdentifier"));

  if (v4)
  {
    v37 = 0;
  }
  else
  {
    v5 = objc_opt_new(NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "associationIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothServices"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = objc_opt_new(NSMutableDictionary);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothServices"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 0));

      if (v11)
      {
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, CBCentralManagerScanOptionMatchingRuleServiceUUID);
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v6, CBCentralManagerScanOptionFilterIdentifierString);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothServicePayload"));
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothServicePayload"));
          -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v14, CBCentralManagerScanOptionMatchingRulePayloadKey);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothServicePayloadMask"));
        v16 = objc_msgSend(v15, "length");

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothServicePayloadMask"));
          -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v17, CBCentralManagerScanOptionMatchingRuleMaskKey);

        }
        -[NSMutableArray addObject:](v5, "addObject:", v9);
      }

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothCompanyIdentifiers"));
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = objc_opt_new(NSMutableDictionary);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothCompanyIdentifiers"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndex:", 0));
      v23 = objc_msgSend(v22, "unsignedIntValue");

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v23));
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v24, CBCentralManagerScanOptionMatchingRuleManufacturerID);

      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v6, CBCentralManagerScanOptionFilterIdentifierString);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothCompanyPayload"));
      v26 = objc_msgSend(v25, "length");

      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothCompanyPayload"));
        -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v27, CBCentralManagerScanOptionMatchingRulePayloadKey);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothCompanyPayloadMask"));
      v29 = objc_msgSend(v28, "length");

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothCompanyPayloadMask"));
        -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v30, CBCentralManagerScanOptionMatchingRuleMaskKey);

      }
      -[NSMutableArray addObject:](v5, "addObject:", v20);

    }
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothNameSubstring"));
    if (v31)
    {
      v32 = (void *)v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothNameSubstring"));
      v34 = objc_msgSend(v33, "length");

      if (v34)
      {
        v35 = objc_opt_new(NSMutableDictionary);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothNameSubstring"));
        -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", v36, CBCentralManagerScanOptionMatchingRuleNameMatchString);
        -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", CBCentralManagerScanOptionMatchingRuleNameMatchOptionContains, CBCentralManagerScanOptionMatchingRuleNameMatchOption);
        -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", v6, CBCentralManagerScanOptionFilterIdentifierString);
        -[NSMutableArray addObject:](v5, "addObject:", v35);

      }
    }
    if (-[NSMutableArray count](v5, "count"))
      v37 = v5;
    else
      v37 = 0;

  }
  return v37;
}

- (void)_cleanupBTDiscovery
{
  OS_dispatch_source *btScanRefreshTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  CBCentralManager *cbCentralManager;
  NSString *cbScanClient;
  NSMutableDictionary *v8;
  NSMutableDictionary *cbDADeviceMap;
  NSMutableArray *v10;
  NSMutableArray *cbScanFilterArray;

  btScanRefreshTimer = self->_btScanRefreshTimer;
  if (btScanRefreshTimer)
  {
    v4 = btScanRefreshTimer;
    dispatch_source_cancel(v4);
    v5 = self->_btScanRefreshTimer;
    self->_btScanRefreshTimer = 0;

  }
  cbCentralManager = self->_cbCentralManager;
  if (cbCentralManager)
    -[CBCentralManager stopScan](cbCentralManager, "stopScan");
  cbScanClient = self->_cbScanClient;
  self->_cbScanClient = 0;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_cbDADeviceMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100038EC0);
  v8 = objc_opt_new(NSMutableDictionary);
  cbDADeviceMap = self->_cbDADeviceMap;
  self->_cbDADeviceMap = v8;

  v10 = objc_opt_new(NSMutableArray);
  cbScanFilterArray = self->_cbScanFilterArray;
  self->_cbScanFilterArray = v10;

}

- (void)_setupBTPairingManager
{
  DABluetoothPairingManager *v3;
  DABluetoothPairingManager *btPairingManager;

  if (!self->_btPairingManager)
  {
    v3 = objc_alloc_init(DABluetoothPairingManager);
    btPairingManager = self->_btPairingManager;
    self->_btPairingManager = v3;

    -[DABluetoothPairingManager setMitmPairing:](self->_btPairingManager, "setMitmPairing:", self->_prefBTPairingWithMITM);
    -[DABluetoothPairingManager setTaskTimeoutSeconds:](self->_btPairingManager, "setTaskTimeoutSeconds:", self->_prefBTScanRefreshSeconds);
    -[DABluetoothPairingManager setDispatchQueue:](self->_btPairingManager, "setDispatchQueue:", self->_dispatchQueue);
  }
}

- (void)_persistBluetoothDevice:(id)a3 device:(id)a4 requirePairing:(BOOL)a5 pairWithCTKD:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  DABluetoothPairingManager *btPairingManager;
  void *v22;
  id v23;
  _BOOL4 v24;
  _BOOL4 v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void *v29;
  id v30;
  DADaemonServer *v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[3];
  id v37;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _persistBluetoothDevice:device:requirePairing:pairWithCTKD:]", 50, "### _persistBluetoothDevice app %@ device %@ inRequirePairing:%d inPairCTKD:%d", v10, v11, v7, v6);
  v24 = v7;
  v25 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appDiscoveryConfiguration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "discoveryConfiguration"));
  v16 = (unint64_t)objc_msgSend(v15, "flags");
  v36[0] = 0;
  v36[1] = v36;
  if ((v16 & 0x10) != 0)
    v17 = 60;
  else
    v17 = 30;
  v36[2] = 0x2020000000;
  v37 = 0;
  v37 = objc_msgSend(v10, "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothIdentifier"));

  if (v18)
  {
    -[DADaemonServer _cleanupBTDiscovery](self, "_cleanupBTDiscovery");
    -[DADaemonServer _cleanupWiFiDiscovery](self, "_cleanupWiFiDiscovery");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothIdentifier"));
    v20 = objc_msgSend(v19, "copy");

    -[DADaemonServer _setupBTPairingManager](self, "_setupBTPairingManager");
    btPairingManager = self->_btPairingManager;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000FF34;
    v27[3] = &unk_100038EE8;
    v28 = v10;
    v29 = v15;
    v35 = v36;
    v30 = v11;
    v31 = self;
    v23 = v20;
    v32 = v23;
    v33 = v12;
    v34 = v26;
    -[DABluetoothPairingManager persistBluetoothDevice:pairingRequired:pairWithCTKD:displayName:taskTimeout:appConfirmsAuth:completion:](btPairingManager, "persistBluetoothDevice:pairingRequired:pairWithCTKD:displayName:taskTimeout:appConfirmsAuth:completion:", v23, v24, v25, v14, v22, (v16 >> 4) & 1, v27);

  }
  _Block_object_dispose(v36, 8);

}

- (void)_forgetBluetoothDevice:(id)a3
{
  id v4;
  id v5;
  DABluetoothPairingManager *btPairingManager;
  _QWORD v7[4];
  id v8;
  DADaemonServer *v9;

  v4 = a3;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _forgetBluetoothDevice:]", 50, "### _forgetBluetoothDevice device %@", v4);
  if (v4)
  {
    v5 = objc_msgSend(v4, "copy");
    -[DADaemonServer _setupBTPairingManager](self, "_setupBTPairingManager");
    btPairingManager = self->_btPairingManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100010484;
    v7[3] = &unk_100038F10;
    v8 = v4;
    v9 = self;
    -[DABluetoothPairingManager forgetBluetoothDevice:completion:](btPairingManager, "forgetBluetoothDevice:completion:", v5, v7);

  }
}

- (void)_updateBluetoothScannerIfNeeded
{
  NSMutableDictionary *v3;
  CBCentralManager *v4;
  CBCentralManager *cbCentralManager;
  DABluetoothPairingManager *btPairingManager;
  NSMutableDictionary *v7;
  _QWORD v8[5];

  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateBluetoothScannerIfNeeded]", 50, "### _updateBluetoothScannerIfNeeded");
  -[DADaemonServer _cleanupBTDiscovery](self, "_cleanupBTDiscovery");
  v3 = self->_discoveryMap;
  v8[1] = 3221225472;
  v8[2] = sub_100010664;
  v8[3] = &unk_100038F88;
  v8[4] = self;
  v7 = v3;
  v8[0] = _NSConcreteStackBlock;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (-[NSMutableArray count](self->_cbScanFilterArray, "count"))
  {
    v4 = (CBCentralManager *)objc_msgSend(objc_alloc((Class)CBCentralManager), "initWithDelegate:queue:options:", self, self->_dispatchQueue, 0);
    cbCentralManager = self->_cbCentralManager;
    self->_cbCentralManager = v4;

  }
  else
  {
    btPairingManager = self->_btPairingManager;
    if (btPairingManager)
      -[DABluetoothPairingManager cancelAll](btPairingManager, "cancelAll");
  }

}

- (void)_startBTScan
{
  NSMutableDictionary *v3;
  void *v4;
  NSMutableArray *cbScanFilterArray;
  _QWORD v6[5];
  NSString *cbScanClient;

  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _startBTScan]", 50, "### _startBTScan");
  v3 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", self->_cbScanFilterArray, CBCentralManagerScanOptionMatchingRuleKey);
  cbScanClient = self->_cbScanClient;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &cbScanClient, 1));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v4, CBManagerListOfClients);

  cbScanFilterArray = self->_cbScanFilterArray;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010B54;
  v6[3] = &unk_100038FD8;
  v6[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](cbScanFilterArray, "enumerateObjectsUsingBlock:", v6);
  -[CBCentralManager scanForPeripheralsWithServices:options:completion:](self->_cbCentralManager, "scanForPeripheralsWithServices:options:completion:", 0, v3, &stru_100039018);

}

- (void)_stopBTScan
{
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _stopBTScan]", 50, "### _stopBTScan");
  -[CBCentralManager stopScan](self->_cbCentralManager, "stopScan");
}

- (void)_checkAndReportLostBTDevices
{
  CFAbsoluteTime Current;
  NSMutableArray *v4;
  NSMutableDictionary *cbDADeviceMap;
  NSMutableArray *v6;
  _QWORD v7[6];
  _QWORD v8[5];
  NSMutableArray *v9;
  CFAbsoluteTime v10;

  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _checkAndReportLostBTDevices]", 50, "### _checkAndReportLostBTDevices");
  Current = CFAbsoluteTimeGetCurrent();
  v4 = objc_opt_new(NSMutableArray);
  cbDADeviceMap = self->_cbDADeviceMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010F48;
  v8[3] = &unk_100039040;
  v10 = Current;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cbDADeviceMap, "enumerateKeysAndObjectsUsingBlock:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000110B0;
  v7[3] = &unk_100039068;
  v7[4] = self;
  *(CFAbsoluteTime *)&v7[5] = Current;
  -[NSMutableArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v7);

}

- (void)_armBTScanTimer
{
  OS_dispatch_source **p_btScanRefreshTimer;
  dispatch_source_t v4;
  uint64_t v5;
  void *v6;
  _QWORD handler[6];

  if (!self->_btScanRefreshTimer)
  {
    p_btScanRefreshTimer = &self->_btScanRefreshTimer;
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_btScanRefreshTimer, v4);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001131C;
    handler[3] = &unk_100038A70;
    handler[4] = v4;
    handler[5] = self;
    dispatch_source_set_event_handler(v4, handler);
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v5 = CUPrintDurationDouble(self->_prefBTScanRefreshSeconds);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF(&dword_10003F400, "-[DADaemonServer _armBTScanTimer]", 30, "BT Scan refresh timer start: %@", v6);

    }
    CUDispatchTimerSet(v4, self->_prefBTScanRefreshSeconds, -1.0, 1.0);
    dispatch_activate(v4);

  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  _BOOL4 BTPoweredOn;
  NSMutableDictionary *cbDADeviceMap;
  CBCentralManager *v6;
  _QWORD v7[5];

  v6 = self->_cbCentralManager;
  BTPoweredOn = -[CBCentralManager state](v6, "state") == (id)5;
  self->_BTPoweredOn = BTPoweredOn;
  if (dword_10003F400 <= 50)
  {
    if (dword_10003F400 == -1)
    {
      if (!_LogCategory_Initialize(&dword_10003F400, 50))
        goto LABEL_5;
      BTPoweredOn = self->_BTPoweredOn;
    }
    LogPrintF(&dword_10003F400, "-[DADaemonServer centralManagerDidUpdateState:]", 50, "### centralManagerDidUpdateState powerState: %d", BTPoweredOn);
LABEL_5:
    BTPoweredOn = self->_BTPoweredOn;
  }
  if (BTPoweredOn)
  {
    -[DADaemonServer _checkAppAccessInfo](self, "_checkAppAccessInfo");
    if (-[NSMutableArray count](self->_cbScanFilterArray, "count"))
    {
      -[DADaemonServer _startBTScan](self, "_startBTScan");
      -[DADaemonServer _armBTScanTimer](self, "_armBTScanTimer");
      if (dword_10003F400 <= 50
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer centralManagerDidUpdateState:]", 50, "### centralManagerDidUpdateState powerState:%d Scan Started");
      }
    }
    else if (dword_10003F400 <= 50
           && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer centralManagerDidUpdateState:]", 50, "### centralManagerDidUpdateState no _cbScanFilterArray so dont scan");
    }
  }
  else
  {
    cbDADeviceMap = self->_cbDADeviceMap;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100011594;
    v7[3] = &unk_100039090;
    v7[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cbDADeviceMap, "enumerateKeysAndObjectsUsingBlock:", v7);
    if (-[CBCentralManager state](v6, "state") != (id)1)
      -[DADaemonServer _cleanupBTDiscovery](self, "_cleanupBTDiscovery");
  }

}

- (id)_findDADeviceWithBTPeripheral:(id)a3
{
  id v4;
  NSMutableDictionary *cbDADeviceMap;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _findDADeviceWithBTPeripheral:]", 50, "### _findDADeviceWithBTPeripheral looking for DADevice for  %@", v4);
  cbDADeviceMap = self->_cbDADeviceMap;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cbDADeviceMap, "objectForKey:", v6));

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100001CEC;
  v22 = sub_100001CFC;
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DADevice")));
  v8 = v19[5];
  if (v8)
  {
    if (dword_10003F400 > 50)
      goto LABEL_15;
    if (dword_10003F400 == -1)
    {
      if (!_LogCategory_Initialize(&dword_10003F400, 50))
        goto LABEL_11;
      v8 = v19[5];
    }
    LogPrintF(&dword_10003F400, "-[DADaemonServer _findDADeviceWithBTPeripheral:]", 50, "### _findDADeviceWithBTPeripheral local cache DADevice %@ for %@", v8, v4);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0));
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_1000118A8;
    v15 = &unk_1000390B8;
    v16 = v4;
    v17 = &v18;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v12);

  }
LABEL_11:
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _findDADeviceWithBTPeripheral:]", 50, "### _findDADeviceWithBTPeripheral DADevice %@ for %@", v19[5], v4, v12, v13, v14, v15);
LABEL_15:
  v10 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (id)_findDADeviceWithBTIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _findDADeviceWithBTIdentifier:]", 50, "### _findDADeviceWithBTIdentifier looking for DADevice for  %@", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cbDADeviceMap, "objectForKey:", v4));
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100001CEC;
  v20 = sub_100001CFC;
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DADevice")));
  v6 = v17[5];
  if (v6)
  {
    if (dword_10003F400 > 50)
      goto LABEL_15;
    if (dword_10003F400 == -1)
    {
      if (!_LogCategory_Initialize(&dword_10003F400, 50))
        goto LABEL_11;
      v6 = v17[5];
    }
    LogPrintF(&dword_10003F400, "-[DADaemonServer _findDADeviceWithBTIdentifier:]", 50, "### _findDADeviceWithBTIdentifier local cache DADevice %@ for %@", v6, v4);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100011BF4;
    v13 = &unk_1000390B8;
    v14 = v4;
    v15 = &v16;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v10);

  }
LABEL_11:
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _findDADeviceWithBTIdentifier:]", 50, "### _findDADeviceWithBTIdentifier DADevice %@ for %@", v17[5], v4, v10, v11, v12, v13);
LABEL_15:
  v8 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (void)_reportDiscoveredBTDevice:(id)a3 advertisementData:(id)a4 RSSI:(id)a5 AppID:(id)a6 DADaemonDiscovery:(id)a7 DADiscovery:(id)a8 config:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  int v23;
  uint64_t prefsBTRSSIThreshold;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  NSMutableDictionary *v47;
  void *v48;
  DADaemonServer *v49;
  void *v50;
  void *v51;
  NSMutableDictionary *cbDADeviceMap;
  void *v53;
  DADaemonServer *v54;
  id v55;
  id v56;
  id v57;
  id v58;

  v58 = a3;
  v57 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleID"));
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:]", 50, "### _reportDiscoveredBTDevice app %@ appID: %@ rssi: %@ advData: %@ inDaemonDiscovery %@ inDiscoveryObject %@ config %@", v20, v16, v15, v57, v17, v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(-[DADaemonServer _findDADeviceWithBTPeripheral:](self, "_findDADeviceWithBTPeripheral:", v58));
  v55 = v17;
  v56 = v18;
  if (v21)
  {
    v22 = (id)v21;
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:]", 50, "### _reportDiscoveredBTDevice found %@", v22);
    }
    v34 = v16;
    objc_msgSend(v22, "setDiscoveryConfiguration:", v19);
LABEL_20:
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "appAccessInfoMap"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v20));
    v37 = objc_msgSend(v36, "accessoryOptions");

    v38 = -[DADaemonServer appBundleInfoAccessoryOptions:](self, "appBundleInfoAccessoryOptions:", v20);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "appAccessInfoMap"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v20));
    if (objc_msgSend(v40, "state"))
      v41 = v38 & ((v37 & 1) == 0);
    else
      v41 = 1;

    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "name"));
    if (v42
      && (v43 = (void *)v42,
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "name")),
          v45 = objc_msgSend(v44, "length"),
          v44,
          v43,
          v45))
    {
      if (v41)
      {
        v46 = objc_msgSend(objc_alloc((Class)DADeviceEvent), "initWithEventType:device:", 40, v22);
        -[DADaemonServer _discoveryEvent:appID:](self, "_discoveryEvent:appID:", v46, v34);

      }
    }
    else if (dword_10003F400 <= 50
           && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:]", 50, "### _reportDiscoveredBTDevice %@ %@ has no bluetooth name", v22, v58);
    }
    v47 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v47, "setObject:forKey:", v22, CFSTR("DADevice"));
    -[NSMutableDictionary setObject:forKey:](v47, "setObject:forKey:", v58, CFSTR("CBPeripheral"));
    v48 = v57;
    -[NSMutableDictionary setObject:forKey:](v47, "setObject:forKey:", v57, CFSTR("ADVData"));
    -[NSMutableDictionary setObject:forKey:](v47, "setObject:forKey:", v15, CFSTR("RSSI"));
    v49 = self;
    v50 = v15;
    v51 = v56;
    -[NSMutableDictionary setObject:forKey:](v47, "setObject:forKey:", v56, CFSTR("DiscoveryObj"));
    cbDADeviceMap = v49->_cbDADeviceMap;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "identifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](cbDADeviceMap, "setObject:forKeyedSubscript:", v47, v53);

    v16 = v34;
    goto LABEL_32;
  }
  if (objc_msgSend(v19, "bluetoothRange") != (id)10
    || (v23 = objc_msgSend(v15, "intValue"),
        prefsBTRSSIThreshold = self->_prefsBTRSSIThreshold,
        v23 >= (int)prefsBTRSSIThreshold))
  {
    v22 = objc_alloc_init((Class)DADevice);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
    objc_msgSend(v22, "setIdentifier:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "identifier"));
    objc_msgSend(v22, "setBluetoothIdentifier:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "name"));
    objc_msgSend(v22, "setBluetoothOTAName:", v28);

    objc_msgSend(v22, "setDiscoveryConfiguration:", v19);
    objc_msgSend(v22, "setFlags:", 8);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "displayName"));
    objc_msgSend(v22, "setName:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "hotspotSSIDs"));
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "hotspotSSIDs"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firstObject"));
      objc_msgSend(v22, "setSSID:", v33);

    }
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      v34 = v16;
      LogPrintF(&dword_10003F400, "-[DADaemonServer _reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:]", 50, "### _reportDiscoveredBTDevice created %@", v22);
    }
    else
    {
      v34 = v16;
    }
    goto LABEL_20;
  }
  v54 = self;
  v50 = v15;
  v51 = v18;
  v48 = v57;
  if (dword_10003F400 > 50)
    goto LABEL_33;
  if (dword_10003F400 == -1)
  {
    v51 = v18;
    v48 = v57;
    if (!_LogCategory_Initialize(&dword_10003F400, 50))
      goto LABEL_33;
    prefsBTRSSIThreshold = v54->_prefsBTRSSIThreshold;
  }
  LogPrintF(&dword_10003F400, "-[DADaemonServer _reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:]", 50, "### _reportDiscoveredBTDevice rssi: %@ lower than threshold %d, ignoring", v50, prefsBTRSSIThreshold);
  v51 = v18;
  v48 = v57;
LABEL_32:
  v17 = v55;
LABEL_33:

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *discoveryMap;
  id v14;
  id v15;
  id v16;
  NSMutableDictionary *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  DADaemonServer *v21;
  id v22;
  id v23;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer centralManager:didDiscoverPeripheral:advertisementData:RSSI:]", 50, "### didDiscoverPeripheral %@ rssi: %d data: %@", v10, objc_msgSend(v12, "intValue"), v11, v18);
  discoveryMap = self->_discoveryMap;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000123EC;
  v19[3] = &unk_100039130;
  v20 = v11;
  v21 = self;
  v22 = v10;
  v23 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  v17 = discoveryMap;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v19);

}

- (int64_t)_updateDeviceStateForWifi:(id)a3 currentState:(int64_t)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "discoveryConfiguration"));
  v8 = objc_msgSend(v7, "flags");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "SSID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hotspotSSIDs"));
  if (objc_msgSend(v10, "count"))
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hotspotSSIDPrefixes"));
    v11 = objc_msgSend(v12, "count") != 0;

  }
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
  {
    v13 = DADeviceStateToString(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateDeviceStateForWifi:currentState:]", 50, "### _updateDeviceStateForWifi device %@ state %@", v6, v14);

  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bluetoothIdentifier"));
  if (v15)
    v16 = 0;
  else
    v16 = v11;
  if (!v16)
  {
    v25 = (void *)v15;
LABEL_32:

    goto LABEL_35;
  }
  if (a4 == 20 || a4 == 10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothCompanyIdentifiers"));
    if (!objc_msgSend(v17, "count"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothCompanyPayload"));
      if (!objc_msgSend(v18, "length"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothCompanyPayloadMask"));
        if (objc_msgSend(v19, "length"))
        {

        }
        else
        {
          v33 = v19;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothNameSubstring"));
          if (objc_msgSend(v20, "length"))
          {

          }
          else
          {
            v32 = v20;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothServicePayload"));
            if (objc_msgSend(v21, "length"))
            {

            }
            else
            {
              v31 = v21;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothServicePayloadMask"));
              if (!objc_msgSend(v22, "length"))
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothServices"));
                v30 = objc_msgSend(v29, "count");

                -[DADaemonServer _cleanupBTDiscovery](self, "_cleanupBTDiscovery");
                -[DADaemonServer _cleanupWiFiDiscovery](self, "_cleanupWiFiDiscovery");
                if (!v30)
                {
                  v23 = a4;
                  if (v9)
                  {
                    if ((v8 & 0x10) != 0)
                      v23 = 20;
                    else
                      v23 = 25;
                  }
                  goto LABEL_29;
                }
LABEL_28:
                v23 = 20;
LABEL_29:
                if (dword_10003F400 > 50
                  || dword_10003F400 == -1 && !_LogCategory_Initialize(&dword_10003F400, 50))
                {
                  a4 = v23;
                  goto LABEL_35;
                }
                v24 = DADeviceStateToString(a4);
                v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                v26 = DADeviceStateToString(v23);
                v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
                LogPrintF(&dword_10003F400, "-[DADaemonServer _updateDeviceStateForWifi:currentState:]", 50, "### _updateDeviceStateForWifi device %@ state %@->%@", v6, v25, v27);

                a4 = v23;
                goto LABEL_32;
              }

            }
          }

        }
      }

    }
    -[DADaemonServer _cleanupBTDiscovery](self, "_cleanupBTDiscovery");
    -[DADaemonServer _cleanupWiFiDiscovery](self, "_cleanupWiFiDiscovery");
    goto LABEL_28;
  }
LABEL_35:

  return a4;
}

- (void)_updateWiFiManagerIfNeeded
{
  void *v3;
  NSMutableDictionary *v4;
  id v5;
  DAWiFiScanner *v6;
  DAWiFiScanner *wifiScanner;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;

  -[DADaemonServer _cleanupWiFiDiscovery](self, "_cleanupWiFiDiscovery");
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]", 50, "[WIFI] _updateWiFiManagerIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = self->_discoveryMap;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012E7C;
  v9[3] = &unk_100038F88;
  v5 = v3;
  v10 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]", 30, "[WIFI] scan descriptors='%@'", v5);
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(DAWiFiScanner);
    wifiScanner = self->_wifiScanner;
    self->_wifiScanner = v6;

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000137CC;
    v8[3] = &unk_100039180;
    v8[4] = self;
    -[DAWiFiScanner setResultsHandler:](self->_wifiScanner, "setResultsHandler:", v8);
    -[DAWiFiScanner startScanningWithDescriptors:](self->_wifiScanner, "startScanningWithDescriptors:", v5);
  }
  else if (dword_10003F400 <= 30
         && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
  {
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]", 30, "[WIFI] invalid scan descriptors");
  }

}

- (void)_cleanupWiFiDiscovery
{
  DAWiFiScanner *wifiScanner;
  DAWiFiScanner *v4;

  wifiScanner = self->_wifiScanner;
  if (wifiScanner)
  {
    -[DAWiFiScanner stopScanning](wifiScanner, "stopScanning");
    v4 = self->_wifiScanner;
    self->_wifiScanner = 0;

  }
}

- (void)_forgetWiFiDevice:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)CWFInterface), "initWithServiceType:", 2);
  objc_msgSend(v4, "activate");
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "knownNetworkProfilesWithProperties:", 0));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013F64;
  v8[3] = &unk_1000391A8;
  v9 = v3;
  v10 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (void)_updateWiFiDevice:(id)a3 bundleID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v11 = a3;
  v5 = a4;
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiDevice:bundleID:]", 30, "[WiFi] updating WiFi device = '%@ for bundleID = '%@'", v11, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "SSID"));
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc((Class)CWFInterface), "initWithServiceType:", 2);
      objc_msgSend(v8, "activate");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "knownNetworkProfilesWithProperties:", 0));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100014300;
      v12[3] = &unk_1000391D0;
      v13 = v6;
      v14 = v7;
      v15 = v8;
      v16 = v5;
      v17 = v11;
      v10 = v8;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

    }
  }

}

- (void)_addTXTRecordToNWEndpoint:(id)a3 appID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  const uint8_t *signature;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD access_bytes[4];
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  unsigned int v28;
  size_t out_signature_length;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;

  v5 = a3;
  v6 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_100001CEC;
  v34[4] = sub_100001CFC;
  v35 = 0;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "networkEndpoint"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100014C48;
  v30[3] = &unk_1000391F8;
  v33 = v34;
  v8 = v5;
  v31 = v8;
  v9 = v6;
  v32 = v9;
  v10 = objc_retainBlock(v30);
  if (!v7)
  {
    v21 = (id)NSErrorF_safe(NSOSStatusErrorDomain, 4294960591, "No networkEndpoint");
    goto LABEL_22;
  }
  if (nw_endpoint_get_type(v7) == nw_endpoint_type_bonjour_service)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      LogPrintF(&dword_10003F400, "-[DADaemonServer _addTXTRecordToNWEndpoint:appID:]", 30, "Processing Bonjour TXT Record for networkEndpoint: NEP %@, deviceID %@, appID %@, TXT Record ??", v7, v11, v9);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "txtRecordData"));
    v12 = v13;
    if (v13)
    {
      v14 = objc_retainAutorelease(v13);
      v15 = nw_txt_record_create_with_bytes((const uint8_t *)objc_msgSend(v14, "bytes"), (size_t)objc_msgSend(v14, "length"));
      if (v15)
      {
        out_signature_length = 0;
        signature = nw_endpoint_get_signature(v7, &out_signature_length);
        v28 = 0;
        v17 = off_10003F5F8((uint64_t)signature, out_signature_length, (uint64_t)&v28);
        v18 = (void *)v17;
        if (v17)
        {
          access_bytes[0] = _NSConcreteStackBlock;
          access_bytes[1] = 3221225472;
          access_bytes[2] = sub_100014D14;
          access_bytes[3] = &unk_100039220;
          v27 = v17;
          v23 = v9;
          v24 = v8;
          v25 = v7;
          v26 = v15;
          nw_txt_record_access_bytes(v15, access_bytes);

          off_10003F608(v18);
        }
        else if (dword_10003F400 <= 30
               && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          v19 = CUPrintErrorCode(v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          LogPrintF(&dword_10003F400, "-[DADaemonServer _addTXTRecordToNWEndpoint:appID:]", 30, "Failed to get mDNS result: %@", v20);

        }
      }

    }
    goto LABEL_21;
  }
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    LogPrintF(&dword_10003F400, "-[DADaemonServer _addTXTRecordToNWEndpoint:appID:]", 30, "Skipping Bonjour processing for networkEndpoint: NEP %@, deviceID %@, appID %@", v7, v12, v9);
LABEL_21:

  }
LABEL_22:
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(v34, 8);
}

- (void)_addSSDPDatatoNWEndpoint:(id)a3 appID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD *v10;
  nw_endpoint_type_t type;
  nw_txt_record_t dictionary;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *secure_tcp;
  NSObject *v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  dispatch_queue_attr_t v26;
  NSObject *v27;
  NSObject *v28;
  dispatch_time_t v29;
  id v30;
  const char *v31;
  size_t v32;
  const char *v33;
  size_t v34;
  id v35;
  id v36;
  id v37;
  dispatch_semaphore_t v38;
  NSObject *queue;
  NSObject *host;
  NSObject *txt_record;
  _QWORD handler[4];
  NSObject *v43;
  id v44;
  id v45;
  NSObject *v46;
  uint64_t *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD *v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[3];
  _QWORD v61[3];

  v5 = a3;
  v6 = a4;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = sub_100001CEC;
  v58[4] = sub_100001CFC;
  v59 = 0;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "networkEndpoint"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100015790;
  v54[3] = &unk_1000391F8;
  v57 = v58;
  v8 = v5;
  v55 = v8;
  v9 = v6;
  v56 = v9;
  v10 = objc_retainBlock(v54);
  if (!v7)
  {
    v35 = (id)NSErrorF_safe(NSOSStatusErrorDomain, 4294960591, "No networkEndpoint");
    goto LABEL_50;
  }
  type = nw_endpoint_get_type(v7);
  if (type && type != nw_endpoint_type_bonjour_service)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]", 30, "Processing non-Bonjour networkEndpoint: NEP %@, deviceID %@, appID %@", v7, v13, v9);

    }
    dictionary = nw_txt_record_create_dictionary();
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
    txt_record = dictionary;
    if (!v14)
      goto LABEL_46;
    if (+[DADevice deviceMetadataURLValid:](DADevice, "deviceMetadataURLValid:", v14))
    {
      if (dword_10003F400 <= 30)
      {
        if (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
          LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]", 30, "Valid URL for appID %@, deviceID %@, URL %@", v9, v15, v14);

        }
        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
          LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]", 30, "Resolving Host for URL for appID %@, deviceID %@, URL %@", v9, v17, v14);

        }
      }
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "host")));
      v21 = (const char *)objc_msgSend(v20, "UTF8String");

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "port"));
        v23 = (const char *)objc_msgSend(v22, "utf8ValueSafe");

        if (v23)
        {
          secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
          v24 = v14;
          host = nw_endpoint_create_host(v21, v23);
          v25 = nw_connection_create(host, secure_tcp);
          v38 = dispatch_semaphore_create(0);
          v50 = 0;
          v51 = &v50;
          v52 = 0x2020000000;
          v53 = 0;
          v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          queue = dispatch_queue_create("DAConnectionQueue", v27);

          v14 = v24;
          nw_connection_set_queue(v25, queue);
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_10001585C;
          handler[3] = &unk_100039248;
          v48 = v21;
          v49 = v23;
          v19 = v25;
          v43 = v19;
          v44 = v9;
          v45 = v8;
          v47 = &v50;
          v28 = v38;
          v46 = v28;
          nw_connection_set_state_changed_handler(v19, handler);
          nw_connection_start(v19);
          v29 = dispatch_time(0, 3000000000);
          if (dispatch_semaphore_wait(v28, v29)
            && dword_10003F400 <= 30
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]", 30, "nw_connection ready did timeout");
          }
          if (*((_BYTE *)v51 + 24))
          {
            if (dword_10003F400 <= 30
              && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
            {
              LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]", 30, "nw_connection start succeeded");
            }
            v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "absoluteString")));
            v31 = (const char *)objc_msgSend(v30, "UTF8String");

            v32 = strlen(v31);
            nw_txt_record_set_key(txt_record, "DDDeviceURL", (const uint8_t *)v31, v32);
          }
          else if (dword_10003F400 <= 30
                 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]", 30, "nw_connection start failed");
          }
          nw_connection_cancel(v19);

          _Block_object_dispose(&v50, 8);
LABEL_45:

LABEL_46:
          dictionary = txt_record;
          if (objc_msgSend(v8, "protocol") == (id)1)
          {
            v33 = (const char *)objc_msgSend(DADeviceProtocolDIAL, "UTF8String");
            v34 = strlen(v33);
            nw_txt_record_set_key(txt_record, "DDDeviceProtocolType", (const uint8_t *)v33, v34);
          }
          nw_endpoint_set_txt_record(v7, txt_record);
          goto LABEL_49;
        }
        v37 = (id)NSErrorF_safe(NSOSStatusErrorDomain, 4294960591, "No port");
      }
      else
      {
        v36 = (id)NSErrorF_safe(NSOSStatusErrorDomain, 4294960591, "No hostname");
      }

      goto LABEL_49;
    }
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]", 30, "Invalid URL for appID %@, deviceID %@, URL %@", v9, v16, v14);

    }
    v60[0] = CFSTR("BundleID");
    v60[1] = CFSTR("SupportsSSDP");
    v61[0] = v9;
    v61[1] = &off_10003A520;
    v60[2] = CFSTR("SSDPProtocol");
    secure_tcp = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "protocol")));
    v61[2] = secure_tcp;
    host = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 3));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    +[DADeviceAccessAnalytics sendAnalyticsInfo:forEvent:withDeviceIdentifier:](DADeviceAccessAnalytics, "sendAnalyticsInfo:forEvent:withDeviceIdentifier:", host, CFSTR("com.apple.DeviceAccess.SSDPMetadataInvalidURL"), v19);
    goto LABEL_45;
  }
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
  {
    dictionary = (nw_txt_record_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]", 30, "Skip SSDP processing for networkEndpoint: NEP %@, deviceID %@, appID %@", v7, dictionary, v9);
LABEL_49:

  }
LABEL_50:
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(v58, 8);
}

- (void)_necpCleanupIfNeeded
{
  int necpFD;

  if (-[NSMutableDictionary count](self->_discoveryMap, "count"))
    return;
  necpFD = self->_necpFD;
  if (necpFD < 0)
    return;
  if (dword_10003F400 <= 30)
  {
    if (dword_10003F400 == -1)
    {
      if (!_LogCategory_Initialize(&dword_10003F400, 30))
      {
LABEL_7:
        necpFD = self->_necpFD;
        if (necpFD < 0)
          return;
        goto LABEL_8;
      }
      necpFD = self->_necpFD;
    }
    LogPrintF(&dword_10003F400, "-[DADaemonServer _necpCleanupIfNeeded]", 30, "NECP close: FD %d", necpFD);
    goto LABEL_7;
  }
LABEL_8:
  if (close(necpFD))
  {
    if (*__error())
      __error();
  }
  self->_necpFD = -1;
}

- (void)_necpSignEndpointForDevice:(id)a3 appID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  nw_endpoint_type_t type;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id obj;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_100001CEC;
  v34 = sub_100001CFC;
  v35 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100015FD8;
  v25[3] = &unk_100039270;
  v29 = &v30;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkEndpoint"));
  v26 = v8;
  v9 = v6;
  v27 = v9;
  v10 = v7;
  v28 = v10;
  v11 = objc_retainBlock(v25);
  if (!v8)
  {
    v21 = (id)NSErrorF_safe(NSOSStatusErrorDomain, 4294960591, "No networkEndpoint");
    goto LABEL_24;
  }
  if (!nw_endpoint_has_signature(v8))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    if (v12)
    {
      type = nw_endpoint_get_type(v8);
      if (type == nw_endpoint_type_host)
      {
        v36 = 0;
        v37 = 0;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer _necpUUIDForAppID:deviceID:uuidBytes:](self, "_necpUUIDForAppID:deviceID:uuidBytes:", v10, v12, &v36));
        v18 = (id *)(v31 + 5);
        v23 = (id)v31[5];
        -[DADaemonServer _necpSignHostnameEndpoint:uuidBytes:error:](self, "_necpSignHostnameEndpoint:uuidBytes:error:", v8, &v36, &v23);
        objc_storeStrong(v18, v23);
        if (!v31[5]
          && dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          LogPrintF(&dword_10003F400, "-[DADaemonServer _necpSignEndpointForDevice:appID:]", 30, "Signed networkEndpoint: hostname, %@, deviceID %@, appID %@, UUID %@", v8, v19, v10, v17);

        }
      }
      else if (type == nw_endpoint_type_address)
      {
        v36 = 0;
        v37 = 0;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer _necpUUIDForAppID:deviceID:uuidBytes:](self, "_necpUUIDForAppID:deviceID:uuidBytes:", v10, v12, &v36));
        v15 = (id *)(v31 + 5);
        obj = (id)v31[5];
        -[DADaemonServer _necpSignAddressEndpoint:uuidBytes:error:](self, "_necpSignAddressEndpoint:uuidBytes:error:", v8, &v36, &obj);
        objc_storeStrong(v15, obj);
        if (!v31[5]
          && dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          LogPrintF(&dword_10003F400, "-[DADaemonServer _necpSignEndpointForDevice:appID:]", 30, "Signed networkEndpoint: address, %@, deviceID %@, appID %@, UUID %@", v8, v16, v10, v14);

        }
      }
      else if (dword_10003F400 <= 30
             && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        LogPrintF(&dword_10003F400, "-[DADaemonServer _necpSignEndpointForDevice:appID:]", 30, "Skip sign networkEndpoint: NEP %@, deviceID %@, appID %@", v8, v20, v10);

      }
    }
    else
    {
      v22 = (id)NSErrorF_safe(NSOSStatusErrorDomain, 4294960591, "No deviceID");
    }
    goto LABEL_23;
  }
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    LogPrintF(&dword_10003F400, "-[DADaemonServer _necpSignEndpointForDevice:appID:]", 30, "networkEndpoint already signed for deviceID: %@, appID: %@", v12, v10);
LABEL_23:

  }
LABEL_24:
  ((void (*)(_QWORD *))v11[2])(v11);

  _Block_object_dispose(&v30, 8);
}

- (BOOL)_necpSignAddressEndpoint:(id)a3 uuidBytes:(unsigned __int8)a4[16] error:(id *)a5
{
  NSObject *v8;
  const sockaddr *address;
  const sockaddr *v10;
  _OWORD *v11;
  _OWORD *v12;
  _QWORD *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSErrorDomain v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];

  v8 = a3;
  address = nw_endpoint_get_address(v8);
  if (!address)
  {
    if (!a5)
      goto LABEL_29;
    v23 = NSOSStatusErrorDomain;
    v24 = "Get NW address failed";
    v25 = 4294960591;
LABEL_34:
    v26 = NSErrorF_safe(v23, v25, v24);
    *a5 = (id)objc_claimAutoreleasedReturnValue(v26);
    goto LABEL_29;
  }
  v10 = address;
  v11 = malloc_type_calloc(1uLL, 0x58uLL, 0x514DB673uLL);
  if (!v11)
  {
    if (!a5)
      goto LABEL_29;
    v23 = NSOSStatusErrorDomain;
    v24 = "malloc NECP content failed";
    v25 = 4294960568;
    goto LABEL_34;
  }
  v12 = v11;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000163A4;
  v27[3] = &unk_100039290;
  v27[4] = v11;
  v13 = objc_retainBlock(v27);
  v12[2] = *(_OWORD *)a4;
  *((_QWORD *)v12 + 6) = 4;
  SockAddrCopy(v10, (char *)v12 + 56);
  *((_DWORD *)v12 + 21) = 0;
  if ((self->_necpFD & 0x80000000) == 0)
    goto LABEL_11;
  v14 = necp_open(0);
  self->_necpFD = v14;
  if (v14 < 0)
  {
    if (*__error())
    {
      v15 = *__error();
      if (!(_DWORD)v15)
        goto LABEL_7;
    }
    else
    {
      v15 = 4294960596;
    }
    if (!a5)
      goto LABEL_28;
    v21 = NSErrorF_safe(NSOSStatusErrorDomain, v15, "NECP open failed");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_27;
  }
LABEL_7:
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _necpSignAddressEndpoint:uuidBytes:error:]", 30, "NECP opened: FD %d", self->_necpFD);
LABEL_11:
  if (!necp_client_action(self->_necpFD, 20, v12 + 2, 56, v12, 32))
    goto LABEL_14;
  if (!*__error())
  {
    v16 = 4294960596;
    goto LABEL_19;
  }
  v16 = *__error();
  if ((_DWORD)v16)
  {
LABEL_19:
    if (!a5)
      goto LABEL_28;
    v18 = NSErrorF_safe(NSOSStatusErrorDomain, v16, "NECP sign failed");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_27;
  }
LABEL_14:
  if (necp_client_action(self->_necpFD, 23, v12, 88, 0, 0))
  {
    if (*__error())
    {
      v17 = *__error();
      if (!(_DWORD)v17)
        goto LABEL_17;
    }
    else
    {
      v17 = 4294960596;
    }
    if (!a5)
      goto LABEL_28;
    v20 = NSErrorF_safe(NSOSStatusErrorDomain, v17, "NECP validate failed");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v20);
LABEL_27:
    *a5 = v19;
    goto LABEL_28;
  }
LABEL_17:
  nw_endpoint_set_signature(v8, v12, 88);
LABEL_28:
  ((void (*)(_QWORD *))v13[2])(v13);

LABEL_29:
  return 0;
}

- (BOOL)_necpSignHostnameEndpoint:(id)a3 uuidBytes:(unsigned __int8)a4[16] error:(id *)a5
{
  NSObject *v8;
  const char *hostname;
  const char *v10;
  size_t v11;
  size_t v12;
  uint16_t port;
  _OWORD *v14;
  _OWORD *v15;
  _QWORD *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSErrorDomain v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];

  v8 = a3;
  hostname = nw_endpoint_get_hostname(v8);
  if (!hostname)
  {
    if (!a5)
      goto LABEL_31;
    v26 = NSOSStatusErrorDomain;
    v27 = "Get NW hostname failed";
    goto LABEL_36;
  }
  v10 = hostname;
  v11 = strlen(hostname);
  if (v11 >= 0x10000)
  {
    if (!a5)
      goto LABEL_31;
    v26 = NSOSStatusErrorDomain;
    v27 = "hostname too long";
LABEL_36:
    v28 = 4294960591;
    goto LABEL_39;
  }
  v12 = v11;
  port = nw_endpoint_get_port(v8);
  v14 = malloc_type_calloc(1uLL, v12 + 62, 0x93CA2093uLL);
  if (!v14)
  {
    if (!a5)
      goto LABEL_31;
    v26 = NSOSStatusErrorDomain;
    v27 = "malloc NECP content failed";
    v28 = 4294960568;
LABEL_39:
    v29 = NSErrorF_safe(v26, v28, v27);
    *a5 = (id)objc_claimAutoreleasedReturnValue(v29);
    goto LABEL_31;
  }
  v15 = v14;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100016730;
  v31[3] = &unk_100039290;
  v31[4] = v14;
  v16 = objc_retainBlock(v31);
  v15[2] = *(_OWORD *)a4;
  *((_QWORD *)v15 + 6) = 6;
  *((_WORD *)v15 + 28) = 0;
  *((_WORD *)v15 + 29) = port;
  *((_WORD *)v15 + 30) = v12;
  memcpy((char *)v15 + 62, v10, v12);
  if ((char *)v15 + v12 + 62 != (char *)v15 + v12 + 62)
  {
    if (!a5)
      goto LABEL_30;
    v30 = NSErrorF_safe(NSOSStatusErrorDomain, 4294960534, "Sign data length mismatch");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v30);
    goto LABEL_29;
  }
  if (self->_necpFD < 0)
  {
    v17 = necp_open(0);
    self->_necpFD = v17;
    if (v17 < 0)
    {
      if (*__error())
      {
        v18 = *__error();
        if (!(_DWORD)v18)
          goto LABEL_9;
      }
      else
      {
        v18 = 4294960596;
      }
      if (!a5)
        goto LABEL_30;
      v24 = NSErrorF_safe(NSOSStatusErrorDomain, v18, "NECP open failed");
      v22 = (void *)objc_claimAutoreleasedReturnValue(v24);
      goto LABEL_29;
    }
LABEL_9:
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _necpSignHostnameEndpoint:uuidBytes:error:]", 30, "NECP opened: FD %d", self->_necpFD);
    }
  }
  if (!necp_client_action(self->_necpFD, 20, v15 + 2, v12 + 30, v15, 32))
    goto LABEL_16;
  if (!*__error())
  {
    v19 = 4294960596;
    goto LABEL_21;
  }
  v19 = *__error();
  if ((_DWORD)v19)
  {
LABEL_21:
    if (!a5)
      goto LABEL_30;
    v21 = NSErrorF_safe(NSOSStatusErrorDomain, v19, "NECP sign failed");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_29;
  }
LABEL_16:
  if (necp_client_action(self->_necpFD, 23, v15, v12 + 62, 0, 0))
  {
    if (*__error())
    {
      v20 = *__error();
      if (!(_DWORD)v20)
        goto LABEL_19;
    }
    else
    {
      v20 = 4294960596;
    }
    if (!a5)
      goto LABEL_30;
    v23 = NSErrorF_safe(NSOSStatusErrorDomain, v20, "NECP validate failed");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v23);
LABEL_29:
    *a5 = v22;
    goto LABEL_30;
  }
LABEL_19:
  nw_endpoint_set_signature(v8, v15, v12 + 62);
LABEL_30:
  ((void (*)(_QWORD *))v16[2])(v16);

LABEL_31:
  return 0;
}

- (void)_necpRemoveUUIDsForAppID:(id)a3 deviceID:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@:%@"), v7, v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000167E4;
  v9[3] = &unk_1000392E0;
  v9[4] = v8;
  -[DADaemonServer _necpUpdateUUIDsWithBlock:](self, "_necpUpdateUUIDsWithBlock:", v9);

}

- (void)_necpUpdateValueStrings:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100016A90;
  v5[3] = &unk_1000392E0;
  v6 = a3;
  v4 = v6;
  -[DADaemonServer _necpUpdateUUIDsWithBlock:](self, "_necpUpdateUUIDsWithBlock:", v5);

}

- (void)_necpUpdateUUIDForAppID:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  const uint8_t *signature;
  size_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[6];
  size_t out_signature_length;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "networkEndpoint"));
    if (v9
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveryMap, "objectForKeyedSubscript:", v6)), v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceMap")), v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8)), v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "networkEndpoint")), v12, v11, v10, v9))
    {
      out_signature_length = 0;
      signature = nw_endpoint_get_signature(v9, &out_signature_length);
      if (!signature)
      {
        if (dword_10003F400 <= 90
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
        {
          LogPrintF(&dword_10003F400, "-[DADaemonServer _necpUpdateUUIDForAppID:device:]", 90, "### NECP update UUID failed: no NECP signature, appID %@, deviceID %@", v6, v8);
        }
        goto LABEL_11;
      }
      v14 = out_signature_length;
      if (out_signature_length > 0x2F)
      {
        v15 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", signature + 32);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));

        v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@:%@"), v6, v8);
        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          LogPrintF(&dword_10003F400, "-[DADaemonServer _necpUpdateUUIDForAppID:device:]", 30, "NECP update UUID: appID %@, deviceID %@, UUID %@", v6, v8, v16);
        }
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10001700C;
        v18[3] = &unk_100039308;
        v18[4] = v16;
        v18[5] = v17;
        -[DADaemonServer _necpUpdateUUIDsWithBlock:](self, "_necpUpdateUUIDsWithBlock:", v18);

        goto LABEL_11;
      }
      if (dword_10003F400 <= 90)
      {
        if (dword_10003F400 != -1)
        {
LABEL_21:
          LogPrintF(&dword_10003F400, "-[DADaemonServer _necpUpdateUUIDForAppID:device:]", 90, "### NECP update UUID failed: no NECP clientID (%zu < %zu), appID %@, deviceID %@", v14, 48, v6, v8);
          goto LABEL_11;
        }
        if (_LogCategory_Initialize(&dword_10003F400, 90))
        {
          v14 = out_signature_length;
          goto LABEL_21;
        }
      }
LABEL_11:

      goto LABEL_12;
    }
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _necpUpdateUUIDForAppID:device:]", 30, "NECP update UUID skipped: no NW endpoint, appID %@, deviceID %@", v6, v8);
    }
  }
  else if (dword_10003F400 <= 90
         && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    LogPrintF(&dword_10003F400, "-[DADaemonServer _necpUpdateUUIDForAppID:device:]", 90, "### NECP update UUID failed: no deviceID, appID %@", v6);
  }
LABEL_12:

}

- (void)_necpUpdateUUIDsWithBlock:(id)a3
{
  void (**v4)(id, void *);
  _QWORD *v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSString *v21;
  void *v22;
  id *v23;
  void *v24;
  id *v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id obj;
  _QWORD v37[5];
  uint64_t v38;
  id *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[2];
  _QWORD v45[2];

  v4 = (void (**)(id, void *))a3;
  v38 = 0;
  v39 = (id *)&v38;
  v40 = 0x3032000000;
  v41 = sub_100001CEC;
  v42 = sub_100001CFC;
  v43 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100017538;
  v37[3] = &unk_100038AE8;
  v37[4] = &v38;
  v5 = objc_retainBlock(v37);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = v39 + 5;
  obj = v39[5];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 1, &obj));
  objc_storeStrong(v7, obj);

  if (!v8)
  {
    v27 = DANestedErrorF(v39[5], 350006, "Get Library dir failed");
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v9 = v39[5];
    v39[5] = (id)v28;
    goto LABEL_21;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = v39 + 5;
  v35 = v39[5];
  v12 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v35);
  objc_storeStrong(v11, v35);

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("DANetworkUUIDs.plist"), 0));
    v14 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v13, 0);
    v15 = objc_msgSend(v14, "mutableCopy");
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = objc_alloc_init((Class)NSMutableDictionary);
    v22 = v17;

    v4[2](v4, v22);
    if (objc_msgSend(v22, "isEqual:", v14))
    {
      if (dword_10003F400 <= 20
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 20)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _necpUpdateUUIDsWithBlock:]", 20, "NECP update UUIDs: unchanged, total %d", objc_msgSend(v14, "count"));
      }
      goto LABEL_20;
    }
    v23 = v39;
    v34 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v22, 200, 0, &v34));
    objc_storeStrong(v23 + 5, v34);
    v25 = v39 + 5;
    if (v24)
    {
      v33 = v39[5];
      v26 = objc_msgSend(v24, "writeToURL:options:error:", v13, 1073741825, &v33);
      objc_storeStrong(v25, v33);
      if ((v26 & 1) != 0)
      {
        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          LogPrintF(&dword_10003F400, "-[DADaemonServer _necpUpdateUUIDsWithBlock:]", 30, "NECP update UUIDs: changed, total %d", objc_msgSend(v22, "count"));
        }
        goto LABEL_19;
      }
      v31 = DANestedErrorF(v39[5], 350004, "Write data failed");
      v30 = objc_claimAutoreleasedReturnValue(v31);
    }
    else
    {
      v29 = DANestedErrorF(v39[5], 350004, "Serialize data failed");
      v30 = objc_claimAutoreleasedReturnValue(v29);
    }
    v32 = v39[5];
    v39[5] = (id)v30;

LABEL_19:
    goto LABEL_20;
  }
  v18 = DANestedErrorF(v39[5], 350006, "Get DeviceAccess dir failed");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v39[5];
  v39[5] = (id)v19;

  v44[0] = CFSTR("Method");
  v21 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v45[0] = v13;
  v44[1] = CFSTR("Error");
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 350006));
  v45[1] = v14;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
  +[DADeviceAccessAnalytics sendAnalytics:forEvent:](DADeviceAccessAnalytics, "sendAnalytics:forEvent:", v22, CFSTR("com.apple.DeviceAccess.Error"));
LABEL_20:

LABEL_21:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v38, 8);
}

- (id)_necpUUIDForAppID:(id)a3 deviceID:(id)a4 uuidBytes:(unsigned __int8)a5[16]
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  CC_LONG v11;
  id v12;
  const char *v13;
  CC_LONG v14;
  id v15;
  void *v16;
  CC_SHA256_CTX v18;
  char out[40];
  unsigned __int8 md[32];

  memset(&v18, 0, sizeof(v18));
  v7 = a4;
  v8 = a3;
  CC_SHA256_Init(&v18);
  v9 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v9, "UTF8String", *(_OWORD *)v18.count, *(_OWORD *)&v18.hash[2], *(_OWORD *)&v18.hash[6], *(_OWORD *)&v18.wbuf[2], *(_OWORD *)&v18.wbuf[6], *(_OWORD *)&v18.wbuf[10], *(_QWORD *)&v18.wbuf[14]);

  v11 = strlen(v10);
  CC_SHA256_Update(&v18, v10, v11);
  v12 = objc_retainAutorelease(v7);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");

  v14 = strlen(v13);
  CC_SHA256_Update(&v18, v13, v14);
  CC_SHA256_Final(md, &v18);
  memset(out, 0, 37);
  uuid_unparse_upper(md, out);
  uuid_parse(out, a5);
  v15 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));

  return v16;
}

- (BOOL)setPartialIPsForAppBundleID:(id)a3 partialIPs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double Current;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  BOOL v37;
  id *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v8, CFSTR("daappdata"));
  v11 = NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v10, 0));

  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer setPartialIPsForAppBundleID:partialIPs:error:]", 30, "setPartialIPs: %@", v14);
  v15 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v14, 0);
  Current = CFAbsoluteTimeGetCurrent();
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ipfragtime")));

  if (!v17
    || Current - CFDictionaryGetDouble(v15, CFSTR("ipfragtime"), 0) >= self->_prefAppPartialIPUpdateMinCadenceSeconds)
  {
    v18 = objc_msgSend(v15, "mutableCopy");
    v19 = v18;
    v49 = v8;
    v46 = v14;
    v47 = v10;
    v44 = a5;
    v45 = v15;
    if (v18)
      v20 = v18;
    else
      v20 = objc_alloc_init((Class)NSMutableDictionary);
    v50 = v20;

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v48 = v9;
    v21 = v9;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "address"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("ipfragaddr"));

          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mask"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("ipfragmask"));

          objc_msgSend(v51, "addObject:", v27);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v23);
    }

    v30 = v50;
    objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, CFSTR("ipfrag"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
    objc_msgSend(v50, "setObject:forKeyedSubscript:", v31, CFSTR("ipfragtime"));

    v53 = 0;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v50, 200, 0, &v53));
    v33 = v53;
    v34 = v33;
    if (v32)
    {
      v52 = v33;
      v14 = v46;
      v35 = objc_msgSend(v32, "writeToURL:options:error:", v46, 1073741825, &v52);
      v36 = v52;

      v10 = v47;
      v9 = v48;
      if ((v35 & 1) != 0)
      {
        v37 = 1;
LABEL_20:
        v34 = v36;
        v8 = v49;
        v15 = v45;
LABEL_21:

        goto LABEL_22;
      }
      if (!v44)
      {
        v37 = 0;
        goto LABEL_20;
      }
      v42 = DANestedErrorF(v36, 350004, "Write app data failed");
      v41 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v34 = v36;
      v8 = v49;
      v39 = v44;
    }
    else
    {
      v10 = v47;
      v9 = v48;
      v14 = v46;
      v39 = v44;
      if (!v44)
      {
        v37 = 0;
        v8 = v49;
        goto LABEL_31;
      }
      v40 = DANestedErrorF(v33, 350004, "Serialize app data failed");
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v8 = v49;
    }
    v15 = v45;
    v37 = 0;
    *v39 = v41;
LABEL_31:
    v30 = v50;
    goto LABEL_21;
  }
  if (a5)
  {
    v43 = DAErrorF(350001, "setPartialIPs rejected: too soon");
    v37 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v43);
  }
  else
  {
    v37 = 0;
  }
LABEL_22:

  return v37;
}

- (id)getPartialIPsWithAppBundleID:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  int *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  DAPartialIP *v22;
  int v23;
  void *v24;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v5, CFSTR("daappdata"));
  v7 = NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v6, 0));

  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer getPartialIPsWithAppBundleID:error:]", 30, "getPartialIPsWithAppBundleID: %@", v10);
  v37 = 0;
  v11 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v10, &v37);
  v12 = v37;
  v13 = v12;
  if (v12)
  {
    v26 = DANestedErrorF(v12, 350004, "Read app data failed");
    *a4 = (id)objc_claimAutoreleasedReturnValue(v26);
    v32 = &__NSArray0__struct;
  }
  else
  {
    v28 = v10;
    v29 = v6;
    v30 = v5;
    v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v11;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ipfrag")));
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    v15 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ipfragaddr")));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ipfragmask")));
          v22 = -[DAPartialIP initWithAddress:mask:]([DAPartialIP alloc], "initWithAddress:mask:", v20, v21);
          v23 = v15[256];
          if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[DAPartialIP description](v22, "description"));
            LogPrintF(&dword_10003F400, "-[DADaemonServer getPartialIPsWithAppBundleID:error:]", 30, "IP: %@", v24);

            v15 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
          }
          if (v22)
            objc_msgSend(v32, "addObject:", v22);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v16);
    }

    v6 = v29;
    v5 = v30;
    v11 = v27;
    v10 = v28;
    v13 = 0;
  }

  return v32;
}

- (void)respondToBluetoothPairingRequest:(id)a3 accept:(BOOL)a4 pairingType:(int64_t)a5 passkey:(id)a6
{
  id v10;
  id v11;
  NSObject *dispatchQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001800C;
  block[3] = &unk_100039330;
  block[4] = self;
  v16 = v10;
  v19 = a4;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(dispatchQueue, block);

}

- (id)xpcListenerEndpoint
{
  DADaemonServer *v2;
  OS_xpc_object *v3;
  _xpc_endpoint_s *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  xpc_endpoint_t v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcListenerEndpoint;
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v5 = v2->_xpcListener;
    v6 = v5;
    if (v5)
    {
      v7 = xpc_endpoint_create(v5);
      objc_storeStrong((id *)&v2->_xpcListenerEndpoint, v7);
      v4 = v7;
    }
    else
    {
      v4 = 0;
    }

  }
  objc_sync_exit(v2);

  return v4;
}

- (void)_xpcListenerEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  id v9;

  v9 = a3;
  if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_connection)
  {
    -[DADaemonServer _xpcConnectionAccept:](self, "_xpcConnectionAccept:", v9);
    goto LABEL_7;
  }
  v4 = v9;
  if (v9 == &_xpc_error_connection_invalid)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 != -1 || (v8 = _LogCategory_Initialize(&dword_10003F400, 30), v4 = v9, v8))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _xpcListenerEvent:]", 30, "XPC listener invalidated");
        goto LABEL_7;
      }
    }
  }
  else if (dword_10003F400 <= 90)
  {
    if (dword_10003F400 != -1 || (v7 = _LogCategory_Initialize(&dword_10003F400, 90), v4 = v9, v7))
    {
      v5 = CUPrintXPC(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF(&dword_10003F400, "-[DADaemonServer _xpcListenerEvent:]", 90, "### XPC listener error: %@", v6);

LABEL_7:
      v4 = v9;
    }
  }

}

- (void)_xpcConnectionAccept:(id)a3
{
  _xpc_connection_s *v4;
  DADaemonXPCConnection *v5;
  NSMutableSet *xpcConnections;
  NSMutableSet *v7;
  NSMutableSet *v8;
  _QWORD handler[5];

  v4 = (_xpc_connection_s *)a3;
  v5 = objc_alloc_init(DADaemonXPCConnection);
  -[DADaemonXPCConnection setDaemon:](v5, "setDaemon:", self);
  -[DADaemonXPCConnection setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[DADaemonXPCConnection setPid:](v5, "setPid:", xpc_connection_get_pid(v4));
  -[DADaemonXPCConnection setXpcCnx:](v5, "setXpcCnx:", v4);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000182FC;
  handler[3] = &unk_100038978;
  handler[4] = v5;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_dispatchQueue);
  xpc_connection_activate(v4);

  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v8 = self->_xpcConnections;
    self->_xpcConnections = v7;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v5);
  -[DADaemonXPCConnection activate](v5, "activate");

}

- (void)xpcConnectionInvalidated:(id)a3
{
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiScanner, 0);
  objc_storeStrong((id *)&self->_btScanRefreshTimer, 0);
  objc_storeStrong((id *)&self->_btPairingManager, 0);
  objc_storeStrong((id *)&self->_cbDADeviceMap, 0);
  objc_storeStrong((id *)&self->_cbScanFilterArray, 0);
  objc_storeStrong((id *)&self->_cbMigrationCentralManager, 0);
  objc_storeStrong((id *)&self->_cbCentralManager, 0);
  objc_storeStrong((id *)&self->_cbScanClient, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_expiredDeviceChecktransaction, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryMap, 0);
  objc_storeStrong((id *)&self->_deviceStateTimer, 0);
  objc_storeStrong((id *)&self->_deviceNECPValueStrings, 0);
  objc_storeStrong((id *)&self->_checkDevicesTimer, 0);
  objc_storeStrong((id *)&self->_checkAppAccessInfoTimer, 0);
  objc_storeStrong((id *)&self->_appSessionMap, 0);
  objc_storeStrong((id *)&self->_deviceAppAccessInfoMap, 0);
}

@end
