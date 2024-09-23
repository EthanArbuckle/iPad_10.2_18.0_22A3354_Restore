@implementation AAServicesDaemon

+ (id)sharedAAServicesDaemon
{
  if (qword_100212598 != -1)
    dispatch_once(&qword_100212598, &stru_1001E2918);
  return (id)qword_100212590;
}

- (AAServicesDaemon)init
{
  AAServicesDaemon *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *connectedHeadphones;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dispatchQueue;
  TUCallCenter *tuSharedInst;
  AAServicesDaemon *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AAServicesDaemon;
  v2 = -[AAServicesDaemon init](&v12, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectedHeadphones = v2->_connectedHeadphones;
    v2->_connectedHeadphones = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("AAServicesDaemon", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    *(_QWORD *)&v2->_muteStateChangedToken = -1;
    tuSharedInst = v2->_tuSharedInst;
    v2->_tuSharedInst = 0;

    objc_storeStrong((id *)&qword_100218BD0, v2);
    v10 = v2;
  }

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  id v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  AAAudioSessionControl *currentAudioSessionControl;
  AAAudioSessionControl *v15;
  id v16;
  id v17;
  NSMutableSet *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  CUUserNotificationSession *uiNotificationSessionMuteControl;
  CUUserNotificationSession *v27;
  id v28;
  const char *v29;
  const char *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  int v35;
  uint64_t v36;
  void *i;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  NSMutableSet *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *j;
  void *v49;
  void *v50;
  id v51;
  unsigned int v52;
  const char *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  AAServicesDaemon *v61;
  id v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  id v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  id v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  id v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];

  v95 = 0;
  NSAppendPrintF_safe(&v95, "-- AAServicesDaemon --\n");
  v4 = v95;
  v94 = v4;
  NSAppendPrintF(&v94, "Active AudioSesionControl clients count: %d\n", -[NSMutableSet count](self->_activatedAudioSessionControlSet, "count"));
  v5 = v94;

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v6 = self->_activatedAudioSessionControlSet;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v91;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v91 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)v10);
        v89 = v11;
        NSAppendPrintF(&v89, "    %@\n", v12);
        v5 = v89;

        v10 = (char *)v10 + 1;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    }
    while (v8);
  }

  v88 = v5;
  NSAppendPrintF(&v88, "\n");
  v13 = v88;

  currentAudioSessionControl = self->_currentAudioSessionControl;
  if (currentAudioSessionControl)
  {
    v87 = v13;
    v15 = currentAudioSessionControl;
    NSAppendPrintF(&v87, "Current AudioSessionControl: %@\n", v15);
    v16 = v87;

    v13 = v16;
  }
  v86 = v13;
  NSAppendPrintF(&v86, "Active AADeviceManager clients count: %d\n", -[NSMutableSet count](self->_activatedDeviceManagerSet, "count"));
  v17 = v86;

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v18 = self->_activatedDeviceManagerSet;
  v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v83;
    do
    {
      v22 = 0;
      v23 = v17;
      do
      {
        if (*(_QWORD *)v83 != v21)
          objc_enumerationMutation(v18);
        v24 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v22);
        v81 = v23;
        NSAppendPrintF(&v81, "    %@\n", v24);
        v17 = v81;

        v22 = (char *)v22 + 1;
        v23 = v17;
      }
      while (v20 != v22);
      v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
    }
    while (v20);
  }

  v80 = v17;
  NSAppendPrintF(&v80, "\n");
  v25 = v80;

  uiNotificationSessionMuteControl = self->_uiNotificationSessionMuteControl;
  if (uiNotificationSessionMuteControl)
  {
    v79 = v25;
    v27 = uiNotificationSessionMuteControl;
    NSAppendPrintF(&v79, "UINotification Mute Control: %@\n", v27);
    v28 = v79;

    v25 = v28;
  }
  v78 = v25;
  if (self->_isCallActive)
    v29 = "yes";
  else
    v29 = "no";
  if (self->_isCallHighPriority)
    v30 = "yes";
  else
    v30 = "no";
  NSAppendPrintF_safe(&v78, "_isCallActive %s, _isCallHighPriority %s\n", v29, v30);
  v31 = v78;

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v32 = (void *)CFPrefs_CopyKeys(CFSTR("com.apple.AudioAccessory"), 0);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v97, 16);
  if (!v33)
    goto LABEL_36;
  v34 = v33;
  v61 = self;
  v35 = 0;
  v36 = *(_QWORD *)v75;
  do
  {
    for (i = 0; i != v34; i = (char *)i + 1)
    {
      if (*(_QWORD *)v75 != v36)
        objc_enumerationMutation(v32);
      v38 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
      v39 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
      {
        v40 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.AudioAccessory"), v38, 0, 0);
        v73 = v31;
        NSAppendPrintF(&v73, "Pref: '%@' = '%##@'\n", v38, v40);
        v41 = v73;

        ++v35;
        v31 = v41;
      }
    }
    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v97, 16);
  }
  while (v34);

  if (v35 >= 1)
  {
    v72 = v31;
    NSAppendPrintF(&v72, "\n");
    v32 = v31;
    v31 = v72;
    self = v61;
LABEL_36:

    goto LABEL_38;
  }
  self = v61;
LABEL_38:
  v42 = -[NSMutableSet count](self->_xpcConnections, "count");
  if (v42)
  {
    v71 = v31;
    NSAppendPrintF(&v71, "XPC Cnx: %d\n", (_DWORD)v42);
    v43 = v71;

    v31 = v43;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v44 = self->_xpcConnections;
  v45 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v67, v96, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(_QWORD *)v68 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)j);
        v66 = v31;
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "xpcCnx"));
        v51 = objc_msgSend(v50, "processIdentifier");
        v52 = objc_msgSend(v49, "entitled");
        v53 = "yes";
        if (!v52)
          v53 = "no";
        NSAppendPrintF(&v66, "    %#{pid}, entitled %s", v51, v53);
        v54 = v66;

        v65 = v54;
        NSAppendPrintF(&v65, "\n");
        v31 = v65;

      }
      v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v67, v96, 16);
    }
    while (v46);
  }

  v64 = v31;
  NSAppendPrintF(&v64, "\n");
  v55 = v64;

  v63 = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceManagerDaemon sharedAADeviceManagerDaemon](AADeviceManagerDaemon, "sharedAADeviceManagerDaemon"));
  v57 = CUDescriptionWithLevel(v56, a3);
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  NSAppendPrintF(&v63, "%@", v58);
  v59 = v63;

  return v59;
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015D10;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  void *v3;
  void *v4;
  void *v5;
  NSXPCListener *v6;
  NSXPCListener *xpcListener;
  OS_dispatch_queue *dispatchQueue;
  TUCallCenter *v9;
  TUCallCenter *tuSharedInst;
  TUCallCenter *v11;
  TUCallCenter *tuBargeCallCenter;
  void *v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *v15;
  CBDiscovery *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  CBDiscovery *v23;
  AAServicesDaemon *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  AAServicesDaemon *v29;
  _QWORD v30[4];
  id v31;
  AAServicesDaemon *v32;
  _QWORD v33[4];
  id v34;
  AAServicesDaemon *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD handler[5];

  if (_os_feature_enabled_impl("BluetoothFeatures", "ConversationDetect"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AAConversationDetectSessionManager sharedCDSessionManager](AAConversationDetectSessionManager, "sharedCDSessionManager"));
    objc_msgSend(v3, "activate");

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceManagerDaemon sharedAADeviceManagerDaemon](AADeviceManagerDaemon, "sharedAADeviceManagerDaemon"));
  objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceManagerDaemon sharedAADeviceManagerDaemon](AADeviceManagerDaemon, "sharedAADeviceManagerDaemon"));
  objc_msgSend(v5, "activate");

  if (!self->_xpcListener)
  {
    v6 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.AudioAccessoryServices"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v6;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  if (self->_muteStateChangedToken == -1
    && _os_feature_enabled_impl("BluetoothFeatures", "CallManagementMuteControl"))
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _activate]", 30, "Registering for Mute State Change Notifications");
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100016244;
    handler[3] = &unk_1001E2398;
    handler[4] = self;
    notify_register_dispatch("com.apple.audioaccessoryd.MuteState", &self->_muteStateChangedToken, (dispatch_queue_t)dispatchQueue, handler);
  }
  -[AAServicesDaemon _registerForAVSystemControllerDeathNotifications](self, "_registerForAVSystemControllerDeathNotifications");
  -[AAServicesDaemon _registerForAVSystemControllerStateNotifications](self, "_registerForAVSystemControllerStateNotifications");
  -[AAServicesDaemon _updateBannerChimeSuppressionState](self, "_updateBannerChimeSuppressionState");
  v9 = (TUCallCenter *)objc_claimAutoreleasedReturnValue(+[TUCallCenter callCenterWithQueue:](TUCallCenter, "callCenterWithQueue:", self->_dispatchQueue));
  tuSharedInst = self->_tuSharedInst;
  self->_tuSharedInst = v9;

  v11 = (TUCallCenter *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  tuBargeCallCenter = self->_tuBargeCallCenter;
  self->_tuBargeCallCenter = v11;

  if (!self->_tuBargeCallStatusChangedNotificationRegistered)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _activate]", 30, "Registering for TUBargeCall Notifications");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", self, "_handlePTTCallStatusChangedNotification:", TUBargeCallStatusChangedNotification, 0);

    self->_tuBargeCallStatusChangedNotificationRegistered = 1;
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    v14 = self->_dispatchQueue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000162DC;
    v37[3] = &unk_1001E2398;
    v37[4] = self;
    notify_register_dispatch("com.apple.AudioAccessory.prefsChanged", &self->_prefsChangedNotifyToken, (dispatch_queue_t)v14, v37);
  }
  if (!self->_stateHandle)
  {
    v15 = self->_dispatchQueue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001634C;
    v36[3] = &unk_1001E2940;
    v36[4] = self;
    self->_stateHandle = os_state_add_handler(v15, v36);
  }
  v16 = self->_connectedDeviceDiscovery;
  if (!v16)
  {
    v17 = objc_alloc_init((Class)CBDiscovery);
    objc_msgSend(v17, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_connectedDeviceDiscovery, v17);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100016368;
    v33[3] = &unk_1001E23C0;
    v18 = v17;
    v34 = v18;
    v35 = self;
    objc_msgSend(v18, "setDeviceFoundHandler:", v33);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100016384;
    v30[3] = &unk_1001E23C0;
    v19 = v18;
    v31 = v19;
    v32 = self;
    objc_msgSend(v19, "setDeviceLostHandler:", v30);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000163A0;
    v27[3] = &unk_1001E23E8;
    v20 = v19;
    v28 = v20;
    v29 = self;
    objc_msgSend(v20, "setInterruptionHandler:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100016430;
    v25[3] = &unk_1001E20E8;
    v21 = v20;
    v26 = v21;
    objc_msgSend(v21, "setInvalidationHandler:", v25);
    objc_msgSend(v21, "setDiscoveryFlags:", (unint64_t)objc_msgSend(v21, "discoveryFlags") | 0x80000200000);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000164AC;
    v22[3] = &unk_1001E2410;
    v16 = (CBDiscovery *)v21;
    v23 = v16;
    v24 = self;
    -[CBDiscovery activateWithCompletion:](v16, "activateWithCompletion:", v22);

  }
  notify_post("com.apple.AudioAccessory.daemonStarted");
  -[AAServicesDaemon _prefsChanged](self, "_prefsChanged");

}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016630;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  AAServicesXPCConnection *v6;
  NSMutableSet *xpcConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  v5 = a4;
  v6 = objc_alloc_init(AAServicesXPCConnection);
  -[AAServicesXPCConnection setDaemon:](v6, "setDaemon:", self);
  -[AAServicesXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[AAServicesXPCConnection setXpcCnx:](v6, "setXpcCnx:", v5);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___AAServicesXPCClientInterface));
  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___AAServicesXPCDaemonInterface));
  objc_msgSend(v5, "setExportedInterface:", v11);

  objc_msgSend(v5, "setExportedObject:", v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000169BC;
  v13[3] = &unk_1001E23E8;
  v13[4] = self;
  v13[5] = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v13);
  objc_msgSend(v5, "setRemoteObjectInterface:", v10);
  objc_msgSend(v5, "resume");
  if (dword_10020F980 <= 20 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 20)))
    LogPrintF(&dword_10020F980, "-[AAServicesDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started: %#{pid}", objc_msgSend(v5, "processIdentifier"));

  return 1;
}

- (void)_scheduleUpdate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016A34;
    block[3] = &unk_1001E20E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);
  }
}

- (void)_update
{
  self->_updatePending = 0;
  if (-[AAServicesDaemon _shouldRunHeadGesture](self, "_shouldRunHeadGesture"))
    -[AAServicesDaemon _ensureHeadGestureDetectionStarted](self, "_ensureHeadGestureDetectionStarted");
  else
    -[AAServicesDaemon _ensureHeadGestureDetectionStopped](self, "_ensureHeadGestureDetectionStopped");
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (dword_10020F980 <= 20)
  {
    if (dword_10020F980 != -1 || (v6 = _LogCategory_Initialize(&dword_10020F980, 20), v4 = v7, v6))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "xpcCnx"));
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _xpcConnectionInvalidated:]", 20, "XPC connection ended: %#{pid}", objc_msgSend(v5, "processIdentifier"));

      v4 = v7;
    }
  }
  objc_msgSend(v4, "xpcConnectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);
  -[AAServicesDaemon _update](self, "_update");

}

- (void)activateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016BE4;
  block[3] = &unk_1001E22B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);

}

- (void)_activateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  NSMutableSet *activatedAudioRoutingControlSet;
  NSMutableSet *v19;
  NSMutableSet *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  obj = a3;
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self->_activatedAudioRoutingControlSet;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = v6;
        v15 = v13;
        if (v15 == v14)
        {

LABEL_17:
          if (dword_10020F980 <= 30
            && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
          {
            LogPrintF(&dword_10020F980, "-[AAServicesDaemon _activateAudioRoutingControl:completion:]", 30, "Direct update: %@", v14, obj, (_QWORD)v22);
          }
          goto LABEL_26;
        }
        v16 = v15;
        if ((v6 == 0) != (v15 != 0))
        {
          v17 = objc_msgSend(v14, "isEqual:", v15);

          if ((v17 & 1) != 0)
            goto LABEL_17;
        }
        else
        {

        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (dword_10020F980 < 31 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    LogPrintF(&dword_10020F980, "-[AAServicesDaemon _activateAudioRoutingControl:completion:]", 30, "Direct activate: %@", v6, obj, (_QWORD)v22);
  activatedAudioRoutingControlSet = self->_activatedAudioRoutingControlSet;
  if (!activatedAudioRoutingControlSet)
  {
    v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v20 = self->_activatedAudioRoutingControlSet;
    self->_activatedAudioRoutingControlSet = v19;

    activatedAudioRoutingControlSet = self->_activatedAudioRoutingControlSet;
  }
  -[NSMutableSet addObject:](activatedAudioRoutingControlSet, "addObject:", v6);
  objc_storeStrong((id *)&self->_currentAudioRoutingControl, obj);
LABEL_26:
  -[AAServicesDaemon _update](self, "_update");
  v7[2](v7, 0);

}

- (void)invalidateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016F14;
  block[3] = &unk_1001E22B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);

}

- (void)_invalidateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  AAAudioRoutingControl *currentAudioRoutingControl;
  AAAudioRoutingControl *v19;
  AAAudioRoutingControl *v20;
  AAAudioRoutingControl *v21;
  unsigned int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_activatedAudioRoutingControlSet;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v9)
    goto LABEL_27;
  v10 = v9;
  v11 = *(_QWORD *)v24;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v24 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
      v14 = v6;
      v15 = v13;
      if (v15 == v14)
      {

        v16 = v14;
LABEL_15:
        if (dword_10020F980 <= 30
          && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
        {
          LogPrintF(&dword_10020F980, "-[AAServicesDaemon _invalidateAudioRoutingControl:completion:]", 30, "Direct invalidate: %@", v14);
        }
        -[NSMutableSet removeObject:](self->_activatedAudioRoutingControlSet, "removeObject:", v14);
        currentAudioRoutingControl = self->_currentAudioRoutingControl;
        v19 = v16;
        v20 = currentAudioRoutingControl;
        if (v19 == v20)
        {

        }
        else
        {
          v21 = v20;
          if ((v19 == 0) == (v20 != 0))
          {

            goto LABEL_26;
          }
          v22 = -[AAAudioRoutingControl isEqual:](v19, "isEqual:", v20);

          if (!v22)
            goto LABEL_27;
        }
        v19 = self->_currentAudioRoutingControl;
        self->_currentAudioRoutingControl = 0;
LABEL_26:

        goto LABEL_27;
      }
      v16 = v15;
      if ((v6 == 0) != (v15 != 0))
      {
        v17 = objc_msgSend(v14, "isEqual:", v15);

        if (v17)
          goto LABEL_15;
      }
      else
      {

      }
    }
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
      continue;
    break;
  }
LABEL_27:

  -[AAServicesDaemon _update](self, "_update");
  v7[2](v7, 0);

}

- (void)activateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017230;
  block[3] = &unk_1001E22B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);

}

- (void)_activateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  NSMutableSet *activatedAudioSessionControlSet;
  NSMutableSet *v19;
  NSMutableSet *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  obj = a3;
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self->_activatedAudioSessionControlSet;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = v6;
        v15 = v13;
        if (v15 == v14)
        {

LABEL_17:
          if (dword_10020F980 <= 30
            && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
          {
            LogPrintF(&dword_10020F980, "-[AAServicesDaemon _activateAudioSessionControl:completion:]", 30, "Direct update: %@", v14, obj, (_QWORD)v22);
          }
          goto LABEL_26;
        }
        v16 = v15;
        if ((v6 == 0) != (v15 != 0))
        {
          v17 = objc_msgSend(v14, "isEqual:", v15);

          if ((v17 & 1) != 0)
            goto LABEL_17;
        }
        else
        {

        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (dword_10020F980 < 31 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    LogPrintF(&dword_10020F980, "-[AAServicesDaemon _activateAudioSessionControl:completion:]", 30, "Direct activate: %@", v6, obj, (_QWORD)v22);
  activatedAudioSessionControlSet = self->_activatedAudioSessionControlSet;
  if (!activatedAudioSessionControlSet)
  {
    v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v20 = self->_activatedAudioSessionControlSet;
    self->_activatedAudioSessionControlSet = v19;

    activatedAudioSessionControlSet = self->_activatedAudioSessionControlSet;
  }
  -[NSMutableSet addObject:](activatedAudioSessionControlSet, "addObject:", v6);
  objc_storeStrong((id *)&self->_currentAudioSessionControl, obj);
LABEL_26:
  -[AAServicesDaemon _update](self, "_update");
  v7[2](v7, 0);

}

- (void)updateAudioSessionControl:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017534;
  v7[3] = &unk_1001E23E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_updateAudioSessionControl:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_activatedAudioSessionControlSet;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = v4;
        v12 = v10;
        if (v12 == v11)
        {

LABEL_15:
          if (dword_10020F980 <= 30
            && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
          {
            LogPrintF(&dword_10020F980, "-[AAServicesDaemon _updateAudioSessionControl:]", 30, "Direct update: %@", v11);
          }

          -[AAServicesDaemon _update](self, "_update");
          goto LABEL_20;
        }
        v13 = v12;
        if ((v4 == 0) != (v12 != 0))
        {
          v14 = objc_msgSend(v11, "isEqual:", v12);

          if (v14)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

LABEL_20:
}

- (void)invalidateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000177B0;
  block[3] = &unk_1001E22B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);

}

- (void)_invalidateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  AAAudioSessionControl *currentAudioSessionControl;
  AAAudioSessionControl *v19;
  AAAudioSessionControl *v20;
  AAAudioSessionControl *v21;
  unsigned int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_activatedAudioSessionControlSet;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v9)
    goto LABEL_27;
  v10 = v9;
  v11 = *(_QWORD *)v24;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v24 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
      v14 = v6;
      v15 = v13;
      if (v15 == v14)
      {

        v16 = v14;
LABEL_15:
        if (dword_10020F980 <= 30
          && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
        {
          LogPrintF(&dword_10020F980, "-[AAServicesDaemon _invalidateAudioSessionControl:completion:]", 30, "Direct invalidate: %@", v14);
        }
        -[NSMutableSet removeObject:](self->_activatedAudioSessionControlSet, "removeObject:", v14);
        currentAudioSessionControl = self->_currentAudioSessionControl;
        v19 = v16;
        v20 = currentAudioSessionControl;
        if (v19 == v20)
        {

        }
        else
        {
          v21 = v20;
          if ((v19 == 0) == (v20 != 0))
          {

            goto LABEL_26;
          }
          v22 = -[AAAudioSessionControl isEqual:](v19, "isEqual:", v20);

          if (!v22)
            goto LABEL_27;
        }
        v19 = self->_currentAudioSessionControl;
        self->_currentAudioSessionControl = 0;
LABEL_26:

        goto LABEL_27;
      }
      v16 = v15;
      if ((v6 == 0) != (v15 != 0))
      {
        v17 = objc_msgSend(v14, "isEqual:", v15);

        if (v17)
          goto LABEL_15;
      }
      else
      {

      }
    }
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
      continue;
    break;
  }
LABEL_27:

  -[AAServicesDaemon _update](self, "_update");
  v7[2](v7, 0);

}

- (void)_deviceFound:(id)a3
{
  void *v5;
  CBDevice **p_currentAudioOwnerDevice;
  void *v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  CBDevice *v13;
  unsigned int v14;
  NSMutableDictionary *connectedHeadphones;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;

  v19 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
  p_currentAudioOwnerDevice = &self->_currentAudioOwnerDevice;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_currentAudioOwnerDevice, "identifier"));
  v8 = v5;
  v9 = v7;
  if (v8 == v9)
  {

    v12 = v19;
  }
  else
  {
    v10 = v9;
    if ((v8 == 0) == (v9 != 0))
    {

      v12 = v19;
      goto LABEL_13;
    }
    v11 = objc_msgSend(v8, "isEqual:", v9);

    v12 = v19;
    if ((v11 & 1) == 0)
    {
LABEL_13:
      if ((objc_msgSend(v12, "deviceFlags") & 0x40) != 0
        && objc_msgSend(v19, "audioStreamState") == 3)
      {
        if (dword_10020F980 <= 30
          && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
        {
          LogPrintF(&dword_10020F980, "-[AAServicesDaemon _deviceFound:]", 30, "Found AudioOwner device: %@", v19);
        }
        objc_storeStrong((id *)&self->_currentAudioOwnerDevice, a3);
      }
      v14 = objc_msgSend(v19, "productID") - 8194;
      if (v14 <= 0x24 && ((1 << v14) & 0x1C7BB7FF9BLL) != 0)
      {
        connectedHeadphones = self->_connectedHeadphones;
        if (!connectedHeadphones)
        {
          v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v17 = self->_connectedHeadphones;
          self->_connectedHeadphones = v16;

          connectedHeadphones = self->_connectedHeadphones;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](connectedHeadphones, "setObject:forKeyedSubscript:", v19, v18);

      }
      -[AAServicesDaemon _update](self, "_update");
      goto LABEL_28;
    }
  }
  if ((objc_msgSend(v12, "deviceFlags") & 0x40) != 0
    && objc_msgSend(v19, "audioStreamState") == 3)
  {
    objc_storeStrong((id *)&self->_currentAudioOwnerDevice, a3);
  }
  else
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _deviceFound:]", 30, "Lost AudioOwner device: %@", v19);
    }
    v13 = *p_currentAudioOwnerDevice;
    *p_currentAudioOwnerDevice = 0;

  }
LABEL_28:

}

- (void)_deviceLost:(id)a3
{
  void *v4;
  void *v5;
  CBDevice *currentAudioOwnerDevice;
  CBDevice *v7;
  CBDevice *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_currentAudioOwnerDevice, "identifier"));
  currentAudioOwnerDevice = v4;
  v7 = v5;
  if (currentAudioOwnerDevice == v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  if ((currentAudioOwnerDevice == 0) == (v7 != 0))
  {

LABEL_12:
    goto LABEL_13;
  }
  v9 = -[CBDevice isEqual:](currentAudioOwnerDevice, "isEqual:", v7);

  if ((v9 & 1) != 0)
  {
LABEL_6:
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _deviceLost:]", 30, "Lost AudioOwner device: %@", v12);
    }
    currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
    self->_currentAudioOwnerDevice = 0;
    goto LABEL_12;
  }
LABEL_13:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedHeadphones, "objectForKeyedSubscript:", v10));
  if (v11)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectedHeadphones, "setObject:forKeyedSubscript:", 0, v10);
    -[AAServicesDaemon _update](self, "_update");
  }

}

- (BOOL)_shouldRunHeadGesture
{
  NSMutableSet *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_activatedDeviceManagerSet;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "headGestureUpdateFlags"))
        {
          if (dword_10020F980 <= 30
            && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
          {
            v7 = objc_msgSend(v6, "headGestureUpdateFlags");
            LogPrintF(&dword_10020F980, "-[AAServicesDaemon _shouldRunHeadGesture]", 30, "headGestureUpdateFlags %d set for DeviceManager %@", v7, v6, (_QWORD)v9);
          }
          LOBYTE(v3) = 1;
          goto LABEL_15;
        }
      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_15:

  return (char)v3;
}

- (void)_ensureHeadGestureDetectionStarted
{
  NSMutableSet *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_activatedDeviceManagerSet;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "headGestureUpdateFlags", (_QWORD)v9))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceManagerDaemon sharedAADeviceManagerDaemon](AADeviceManagerDaemon, "sharedAADeviceManagerDaemon"));
          objc_msgSend(v8, "startHeadGestureManagerWithFlags:", objc_msgSend(v7, "headGestureUpdateFlags"));

        }
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)_ensureHeadGestureDetectionStopped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[AADeviceManagerDaemon sharedAADeviceManagerDaemon](AADeviceManagerDaemon, "sharedAADeviceManagerDaemon"));
  objc_msgSend(v2, "stopHeadGestureManager");

}

- (void)_updateDetectedHeadGesture:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceManager", (_QWORD)v13));
        v12 = objc_msgSend(v11, "headGestureUpdateFlags");

        if (v12)
          objc_msgSend(v10, "deviceManagerHeadGestureDetected:", v4);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)reportHeadGestureDetected:(id)a3
{
  OS_dispatch_queue *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  -[AAServicesDaemon _updateDetectedHeadGesture:](self, "_updateDetectedHeadGesture:", v5);

}

- (void)reportDeviceFound:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000182C0;
  v7[3] = &unk_1001E23E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_reportDeviceFound:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceManager", (_QWORD)v12));
        if (v11)
          objc_msgSend(v10, "deviceManagerReportDeviceFound:", v4);

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)reportDeviceLost:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018468;
  v7[3] = &unk_1001E23E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_reportDeviceLost:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "deviceManagerReportDeviceLost:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_handleCallIsActiveDidChangeNotification:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AAServicesDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000185EC;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_handlePTTCallStatusChangedNotification:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AAServicesDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018854;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_updateBannerChimeSuppressionState
{
  int isPTTCallActive;
  BOOL *p_shouldSuppressMuteBanner;
  _BOOL4 isCallHighPriority;
  const char *v6;
  const char *v7;
  int v8;

  if (self->_isCallActive)
  {
    isPTTCallActive = self->_isPTTCallActive;
    self->_shouldSuppressMuteBanner = isPTTCallActive;
    p_shouldSuppressMuteBanner = &self->_shouldSuppressMuteBanner;
    isCallHighPriority = self->_isCallHighPriority;
  }
  else
  {
    isPTTCallActive = 1;
    self->_shouldSuppressMuteBanner = 1;
    p_shouldSuppressMuteBanner = &self->_shouldSuppressMuteBanner;
    isCallHighPriority = 1;
  }
  self->_shouldSuppressMuteChime = isCallHighPriority;
  if (dword_10020F980 <= 30)
  {
    if (dword_10020F980 == -1)
    {
      v8 = _LogCategory_Initialize(&dword_10020F980, 30);
      isPTTCallActive = *p_shouldSuppressMuteBanner;
      if (!v8)
        goto LABEL_14;
      isCallHighPriority = self->_shouldSuppressMuteChime;
    }
    if (isPTTCallActive)
      v6 = "yes";
    else
      v6 = "no";
    if (isCallHighPriority)
      v7 = "yes";
    else
      v7 = "no";
    LogPrintF(&dword_10020F980, "-[AAServicesDaemon _updateBannerChimeSuppressionState]", 30, "Mute Control: shouldSuppressBanner: %s, shouldSuppressChime: %s", v6, v7);
    isPTTCallActive = *p_shouldSuppressMuteBanner;
  }
LABEL_14:
  if (isPTTCallActive && self->_muteBanner)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _updateBannerChimeSuppressionState]", 30, "Mute Control: invalidating mute banner");
    }
    -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
  }
}

- (void)_createBannerSessionMuteActionForIOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  CBDevice *currentAudioOwnerDevice;
  void *v14;
  unsigned int v15;
  __int128 v16;
  _QWORD v17[6];
  int v18;
  __int128 v19;
  __int128 v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a5;
  v11 = a6;
  if (self->_muteBanner)
    -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100018DDC;
  v26 = sub_100018DEC;
  v27 = objc_alloc_init((Class)BTBannerUISession);
  objc_storeStrong((id *)&self->_muteBanner, (id)v23[5]);
  objc_msgSend((id)v23[5], "setBannerAppID:", v11);
  objc_msgSend((id)v23[5], "setBannerType:", 2);
  objc_msgSend((id)v23[5], "setCenterContentText:", v10);
  if (a3 == 1)
  {
    v12 = CFSTR("mute");
    goto LABEL_12;
  }
  if (a3 == 2)
  {
    v12 = CFSTR("unmute");
LABEL_12:
    objc_msgSend((id)v23[5], "setCenterContentItemsText:", v12);
    objc_msgSend((id)v23[5], "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend((id)v23[5], "setTimeoutSeconds:", 4.0);
    v17[1] = 3221225472;
    v16 = *(_OWORD *)&a4->var0[4];
    v19 = *(_OWORD *)a4->var0;
    v17[0] = _NSConcreteStackBlock;
    v17[2] = sub_100018DF4;
    v17[3] = &unk_1001E2968;
    v17[4] = self;
    v17[5] = &v22;
    v18 = a3;
    v20 = v16;
    v21 = a3 == 2;
    objc_msgSend((id)v23[5], "setActionHandler:", v17);
    objc_msgSend((id)v23[5], "activate");

    goto LABEL_19;
  }
  currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
  if (currentAudioOwnerDevice)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice productName](currentAudioOwnerDevice, "productName"));
    if (v14)
    {
      v15 = -[CBDevice productID](self->_currentAudioOwnerDevice, "productID") - 8194;
      if (v15 <= 0x24 && ((1 << v15) & 0x1C7BB7FF9BLL) != 0)
      {

        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CBDevice productName](self->_currentAudioOwnerDevice, "productName"));
        goto LABEL_12;
      }

    }
  }
  if (dword_10020F980 <= 30 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    LogPrintF(&dword_10020F980, "-[AAServicesDaemon _createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:]", 30, "Mute Control: Cannot show reject banner, invalid audio owner device: %@", self->_currentAudioOwnerDevice);
  -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
LABEL_19:
  _Block_object_dispose(&v22, 8);

}

- (void)_createBannerSessionMuteActionForMacOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char **__ptr32 *v15;
  uint64_t v16;
  void *v17;
  char v18;
  const __CFString *v19;
  void **v20;
  CBDevice *currentAudioOwnerDevice;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  void *v33;
  _QWORD v34[6];
  _QWORD v35[6];
  __int128 v36;
  __int128 v37;
  char v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;

  v9 = a6;
  if ((_os_feature_enabled_impl("BluetoothFeatures", "CallManagementMuteControlMac") & 1) != 0)
  {
    if (self->_uiNotificationSessionMuteControl)
      -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.MuteControlUserNotifications.bundle")));
    v11 = objc_alloc_init((Class)CUUserNotificationSession);
    objc_storeStrong((id *)&self->_uiNotificationSessionMuteControl, v11);
    objc_msgSend(v11, "setBundleID:", CFSTR("com.apple.MuteControlUserNotifications"));
    objc_msgSend(v11, "setCategoryID:", CFSTR("MuteControlUserNotifications"));
    objc_msgSend(v11, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v11, "setFlags:", 81);
    objc_msgSend(v11, "setIconAppIdentifier:", v9);
    objc_msgSend(v11, "setLabel:", CFSTR("MuteControl"));
    objc_msgSend(v11, "setSubtitleKey:", CFSTR("TITLE_FORMAT"));
    objc_msgSend(v11, "setTimeoutSeconds:", 20.0);
    objc_msgSend(v11, "setTitleKey:", CFSTR("TITLE_FORMAT"));
    v12 = CULocalizedStringEx(v10, CFSTR("Localizable"), CFSTR("MUTE_CONTROL_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v42 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
    objc_msgSend(v11, "setTitleArguments:", v14);

    objc_msgSend(v11, "removeAllActions");
    v15 = &off_100184000;
    switch(a3)
    {
      case 3:
        currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
        if (currentAudioOwnerDevice)
        {
          v22 = objc_claimAutoreleasedReturnValue(-[CBDevice productName](currentAudioOwnerDevice, "productName"));
          if (v22)
          {
            v23 = (void *)v22;
            v24 = -[CBDevice productID](self->_currentAudioOwnerDevice, "productID") - 8194;
            if (v24 <= 0x24 && ((1 << v24) & 0x1C7BB7FF9BLL) != 0)
            {

              v25 = CULocalizedStringEx(v10, CFSTR("Localizable"), CFSTR("REJECTED_WITH_DEVICE_FORMAT"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              if (v26)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice productName](self->_currentAudioOwnerDevice, "productName"));
                v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v27));

              }
              else
              {
                v28 = &stru_1001ED4C0;
              }
              v39 = v28;
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
              objc_msgSend(v11, "setSubtitleArguments:", v33);

              goto LABEL_23;
            }

          }
        }
        if (dword_10020F980 <= 30
          && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
        {
          LogPrintF(&dword_10020F980, "-[AAServicesDaemon _createBannerSessionMuteActionForMacOS:auditToken:appName:appBundleID:]", 30, "Mute Control: Cannot show reject banner, invalid audio owner device: %@", self->_currentAudioOwnerDevice);
        }
        break;
      case 2:
        if ((objc_opt_respondsToSelector(v11, "setUserInfo:") & 1) != 0)
          objc_msgSend(v11, "setUserInfo:", &off_1001F4048);
        v29 = CULocalizedStringEx(v10, CFSTR("Localizable"), CFSTR("UNMUTED"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v40 = v17;
        v18 = 1;
        v19 = CFSTR("MUTE_ACTION");
        v20 = &v40;
        goto LABEL_22;
      case 1:
        if ((objc_opt_respondsToSelector(v11, "setUserInfo:") & 1) != 0)
          objc_msgSend(v11, "setUserInfo:", &off_1001F4020);
        v16 = CULocalizedStringEx(v10, CFSTR("Localizable"), CFSTR("MUTED"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = 0;
        v41 = v17;
        v19 = CFSTR("UNMUTE_ACTION");
        v20 = &v41;
LABEL_22:
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 1));
        objc_msgSend(v11, "setSubtitleArguments:", v30);

        v31 = CULocalizedStringEx(v10, CFSTR("Localizable"), v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v35[0] = _NSConcreteStackBlock;
        v15 = &off_100184000;
        v35[1] = 3221225472;
        v35[2] = sub_100019650;
        v35[3] = &unk_1001E2990;
        v35[4] = v11;
        v35[5] = self;
        v32 = *(_OWORD *)&a4->var0[4];
        v36 = *(_OWORD *)a4->var0;
        v37 = v32;
        v38 = v18;
        objc_msgSend(v11, "addActionWithIdentifier:title:flags:handler:", CFSTR("ReverseMuteAction"), v26, 0, v35);
LABEL_23:

        v34[0] = _NSConcreteStackBlock;
        v34[1] = *((_QWORD *)v15 + 168);
        v34[2] = sub_100019704;
        v34[3] = &unk_1001E29B8;
        v34[4] = v11;
        v34[5] = self;
        objc_msgSend(v11, "setActionHandler:", v34);
        objc_msgSend(v11, "activate");
LABEL_38:

        goto LABEL_39;
      default:
        if (dword_10020F980 <= 30
          && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
        {
          LogPrintF(&dword_10020F980, "-[AAServicesDaemon _createBannerSessionMuteActionForMacOS:auditToken:appName:appBundleID:]", 30, "Mute Control: Invalid Mute Action %s, Don't show banner");
        }
        break;
    }
    -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
    goto LABEL_38;
  }
  if (dword_10020F980 <= 90 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
    LogPrintF(&dword_10020F980, "-[AAServicesDaemon _createBannerSessionMuteActionForMacOS:auditToken:appName:appBundleID:]", 90, "Mute Control: CallManagementMuteControlMac feature flag not enabled");
LABEL_39:

}

- (void)_invalidateMuteBanner
{
  BTBannerUISession *muteBanner;
  BTBannerUISession *v4;

  muteBanner = self->_muteBanner;
  if (muteBanner)
  {
    -[BTBannerUISession invalidate](muteBanner, "invalidate");
    v4 = self->_muteBanner;
    self->_muteBanner = 0;

  }
}

- (void)_muteStateChanged
{
  -[AAServicesDaemon _toggleInputMuteState](self, "_toggleInputMuteState");
}

- (void)_toggleInputMuteState
{
  id v3;
  NSString *muteActionTrigger;
  id v5;

  if (_os_feature_enabled_impl("MediaExperience", "SessionBasedMuting"))
  {
    v5 = 0;
    +[AVAudioApplication toggleInputMute:](AVAudioApplication, "toggleInputMute:", &v5);
    v3 = v5;
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _toggleInputMuteState]", 30, "Mute Control: toggleInputMute returned with error: %@", v3);
    }
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    objc_msgSend(v3, "toggleInputMute");
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _toggleInputMuteState]", 30, "Mute Control: toggleInputMute returned with %d");
    }
  }

  muteActionTrigger = self->_muteActionTrigger;
  self->_muteActionTrigger = (NSString *)CFSTR("stemClick");

}

- (void)_playChime:(int)a3
{
  int v4;
  char **v5;
  uint64_t v6;
  const char *v7;
  const char *v8;

  if (a3 > 6)
    goto LABEL_17;
  if (((1 << a3) & 0x18) != 0)
  {
    v6 = 1366;
    goto LABEL_22;
  }
  if (((1 << a3) & 0x22) == 0)
  {
    if (((1 << a3) & 0x44) != 0)
    {
      if (self->_shouldSuppressMuteChime)
      {
        if (dword_10020F980 <= 30
          && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
        {
          v4 = a3 - 2;
          if ((a3 - 2) <= 4)
          {
            v5 = &off_1001E2B08;
LABEL_16:
            v7 = v5[v4];
LABEL_32:
            LogPrintF(&dword_10020F980, "-[AAServicesDaemon _playChime:]", 30, "Mute Control: suppressing %s", v7);
            return;
          }
          goto LABEL_31;
        }
        return;
      }
      v6 = 1365;
LABEL_22:
      if (dword_10020F980 <= 30
        && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
      {
        if ((a3 - 1) > 5)
          v8 = "?";
        else
          v8 = (&off_1001E2B30)[a3 - 1];
        LogPrintF(&dword_10020F980, "-[AAServicesDaemon _playChime:]", 30, "Mute Control: playing %s", v8);
      }
      AudioServicesPlaySystemSoundWithOptions(v6, 0, 0);
      return;
    }
LABEL_17:
    if (dword_10020F980 <= 90
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _playChime:]", 90, "Mute Control: Wrong chime detected");
    }
    return;
  }
  if (!self->_shouldSuppressMuteChime)
  {
    v6 = 1364;
    goto LABEL_22;
  }
  if (dword_10020F980 <= 30 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
  {
    v4 = a3 - 1;
    if ((a3 - 1) <= 4)
    {
      v5 = &off_1001E2AE0;
      goto LABEL_16;
    }
LABEL_31:
    v7 = "?";
    goto LABEL_32;
  }
}

- (void)_processFirstPartyBannerRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t currentMuteControlAction;
  NSString *currentMuteControlAppName;
  NSString *currentMuteControlBundleIdentifier;
  __int128 v10;
  _OWORD v11[2];
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter uiDataSource](self->_tuSharedInst, "uiDataSource"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter uiDataSource](self->_tuSharedInst, "uiDataSource"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100019C7C;
    v12[3] = &unk_1001E2A08;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v6, "fetchInCallUIState:", v12);

  }
  else
  {
    currentMuteControlAction = self->_currentMuteControlAction;
    currentMuteControlAppName = self->_currentMuteControlAppName;
    currentMuteControlBundleIdentifier = self->_currentMuteControlBundleIdentifier;
    v10 = *(_OWORD *)&self->_currentMuteControlAuditToken.val[4];
    v11[0] = *(_OWORD *)self->_currentMuteControlAuditToken.val;
    v11[1] = v10;
    -[AAServicesDaemon _createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:](self, "_createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:", currentMuteControlAction, v11, currentMuteControlAppName, currentMuteControlBundleIdentifier);
    if (v4)
      (*((void (**)(id, NSString *, NSString *, NSString *, _QWORD))v4 + 2))(v4, self->_currentMuteControlAuditTokenBundleIdentifier, self->_currentMuteControlAppName, self->_currentMuteControlBundleIdentifier, 0);
  }

}

- (void)_processBannerRequestForMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  const char *v22;
  const char *v23;
  NSErrorDomain v24;
  const char *v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  const __CFString *muteActionTrigger;
  uint64_t v30;
  AAServicesDaemon *v31;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;

  v10 = a5;
  v11 = a6;
  v31 = self;
  if (v10)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]", 30, "Mute Control: app bundle identifier set for mute action: %@", v10);
    }
    v36 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v10, 0, &v36));
    v12 = v36;
    if (!v12)
    {
      v14 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedName"));

      v16 = 0;
      if (v15)
        goto LABEL_21;
      goto LABEL_16;
    }
    if (dword_10020F980 <= 90
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]", 90, "Mute Control: Failed to get bundle record from bundleID %@ with error: %@", v10, v12);
    }

  }
  else
  {
    v12 = 0;
  }
  v14 = 0;
LABEL_16:
  v35 = v12;
  v17 = *(_OWORD *)&a4->var0[4];
  v33 = *(_OWORD *)a4->var0;
  v34 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", &v33, &v35));
  v19 = v35;

  if (v19)
  {
    if (dword_10020F980 <= 90
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]", 90, "Mute Control: Failed to get bundle record with error: %@", v19);
    }
    if (v11)
      (*((void (**)(id, _QWORD, _QWORD, id, id))v11 + 2))(v11, 0, 0, v14, v19);

    v16 = 0;
    v15 = 0;
    goto LABEL_70;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleIdentifier"));

  v14 = v20;
  v16 = v14;
  if (!v15)
    goto LABEL_27;
LABEL_21:
  if (!v14)
  {
LABEL_27:
    if (dword_10020F980 <= 90
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]", 90, "Mute Control: Invalid data received from bundle record, app name: %@, appBundleID: %@", v15, v14);
    }
    v24 = NSOSStatusErrorDomain;
    v25 = "invalid application parameters";
    goto LABEL_68;
  }
  v21 = a3 - 4;
  if ((a3 - 4) <= 2)
  {
    if (dword_10020F980 <= 90
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
    {
      if (v21 > 2)
        v22 = "?";
      else
        v22 = (&off_1001E2B60)[v21];
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]", 90, "Mute Control: Invalid Mute Action %s, Don't show banner", v22);
    }
    v24 = NSOSStatusErrorDomain;
    v25 = "invalid mute action input";
LABEL_68:
    v30 = NSErrorF(v24, 4294960591, v25);
    v19 = (id)objc_claimAutoreleasedReturnValue(v30);
    if (v11)
      (*((void (**)(id, void *, void *, id, id))v11 + 2))(v11, v16, v15, v14, v19);
    goto LABEL_70;
  }
  if (!-[NSString isEqualToString:](v31->_muteActionTrigger, "isEqualToString:", CFSTR("stemClick"))
    && !-[NSString isEqualToString:](v31->_muteActionTrigger, "isEqualToString:", CFSTR("bannerAction")))
  {
    if (dword_10020F980 <= 90
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
    {
      if (a3 > 3)
        v26 = "?";
      else
        v26 = (&off_1001E2B78)[a3];
      muteActionTrigger = (const __CFString *)v31->_muteActionTrigger;
      if (!muteActionTrigger)
        muteActionTrigger = CFSTR("nil");
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]", 90, "Mute Control: Returning without showing banner for app name: %@, appBundleID: %@, mute action: %s, invalid mute action trigger: %@", v15, v14, v26, muteActionTrigger);
    }
    -[AAServicesDaemon _invalidateMuteBanner](v31, "_invalidateMuteBanner");
    v24 = NSOSStatusErrorDomain;
    v25 = "invalid mute action trigger";
    goto LABEL_68;
  }
  if (dword_10020F980 <= 30 && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
  {
    if (a3 > 3)
      v23 = "?";
    else
      v23 = (&off_1001E2B78)[a3];
    LogPrintF(&dword_10020F980, "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]", 30, "Mute Control: Show Banner for app name: %@, appBundleID: %@, mute action: %s", v15, v14, v23);
  }
  v31->_currentMuteControlAction = a3;
  objc_storeStrong((id *)&v31->_currentMuteControlAppName, v15);
  v27 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v31->_currentMuteControlAuditToken.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v31->_currentMuteControlAuditToken.val[4] = v27;
  objc_storeStrong((id *)&v31->_currentMuteControlAuditTokenBundleIdentifier, v16);
  objc_storeStrong((id *)&v31->_currentMuteControlBundleIdentifier, a5);
  if (objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("com.apple.facetime"))
    && objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("com.apple.mobilephone")))
  {
    v28 = *(_OWORD *)&a4->var0[4];
    v33 = *(_OWORD *)a4->var0;
    v34 = v28;
    -[AAServicesDaemon _createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:](v31, "_createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:", a3, &v33, v15, v14);
    if (v11)
      (*((void (**)(id, void *, void *, id, _QWORD))v11 + 2))(v11, v16, v15, v14, 0);
  }
  else
  {
    -[AAServicesDaemon _processFirstPartyBannerRequestWithCompletion:](v31, "_processFirstPartyBannerRequestWithCompletion:", v11);
  }
  v19 = 0;
LABEL_70:

}

- (void)_reverseMuteActionForToken:(id *)a3 shouldMute:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  __int128 v8;
  id v9;
  void *v10;
  id v11;
  NSString *muteActionTrigger;
  id v13;
  _OWORD v14[2];

  v4 = a4;
  v7 = objc_alloc((Class)AVAudioApplication);
  v8 = *(_OWORD *)&a3->var0[4];
  v14[0] = *(_OWORD *)a3->var0;
  v14[1] = v8;
  v9 = objc_msgSend(v7, "initProxyForProcess:", v14);
  v10 = v9;
  if (v9)
  {
    v13 = 0;
    objc_msgSend(v9, "setInputMuted:error:", v4, &v13);
    v11 = v13;
    if (v11)
    {
      if (dword_10020F980 <= 90
        && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
      {
        LogPrintF(&dword_10020F980, "-[AAServicesDaemon _reverseMuteActionForToken:shouldMute:]", 90, "Mute Control: failed to reverse mute action with error: %@", v11);
      }
    }
    else if (dword_10020F980 <= 30
           && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _reverseMuteActionForToken:shouldMute:]", 30, "Mute Control: setInputMuted: %s succeeded");
    }
    muteActionTrigger = self->_muteActionTrigger;
    self->_muteActionTrigger = (NSString *)CFSTR("bannerAction");

  }
  else if (dword_10020F980 <= 90
         && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 90)))
  {
    LogPrintF(&dword_10020F980, "-[AAServicesDaemon _reverseMuteActionForToken:shouldMute:]", 90, "Mute Control: failed to find AVAudioApplication");
  }

}

- (void)_submitMetricsForMuteAction:(int)a3 auditTokenBundleID:(id)a4 appName:(id)a5 appBundleID:(id)a6
{
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *muteActionTrigger;
  CBDevice *currentAudioOwnerDevice;
  _UNKNOWN **v22;
  unsigned int v23;
  int v24;
  const char *v25;
  void *v26;
  _QWORD v27[7];
  _QWORD v28[7];

  v10 = (__CFString *)a4;
  v11 = (__CFString *)a5;
  v12 = (__CFString *)a6;
  if (a3 > 6)
    v13 = "?";
  else
    v13 = (&off_1001E2C30)[a3];
  v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
  v15 = (void *)v14;
  v27[0] = CFSTR("action");
  v27[1] = CFSTR("attributionAppName");
  v16 = CFSTR("unknown");
  if (v11)
    v17 = v11;
  else
    v17 = CFSTR("unknown");
  v28[0] = v14;
  v28[1] = v17;
  if (v12)
    v18 = v12;
  else
    v18 = CFSTR("unknown");
  v27[2] = CFSTR("attributionBundleID");
  v27[3] = CFSTR("bundleID");
  if (v10)
    v19 = v10;
  else
    v19 = CFSTR("unknown");
  v28[2] = v18;
  v28[3] = v19;
  muteActionTrigger = (const __CFString *)self->_muteActionTrigger;
  if (!muteActionTrigger)
    muteActionTrigger = CFSTR("appUITapAction");
  v27[4] = CFSTR("trigger");
  v27[5] = CFSTR("isSupportedAccessoryRouted");
  currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
  v22 = &off_1001F44D0;
  if (!currentAudioOwnerDevice)
    v22 = &off_1001F44E8;
  v28[4] = muteActionTrigger;
  v28[5] = v22;
  v27[6] = CFSTR("accessoryProductID");
  v23 = -[CBDevice productID](currentAudioOwnerDevice, "productID");
  if (v23)
  {
    v24 = -[CBDevice productID](self->_currentAudioOwnerDevice, "productID");
    if (v24 <= 21759)
    {
      if (v24 > 8193)
      {
        switch(v24)
        {
          case 8194:
            v25 = "AirPods1,1";
            break;
          case 8195:
            v25 = "PowerBeats3,1";
            break;
          case 8197:
            v25 = "BeatsX1,1";
            break;
          case 8198:
            v25 = "BeatsSolo3,1";
            break;
          case 8201:
            v25 = "BeatsStudio3,2";
            break;
          case 8202:
            v25 = "Device1,8202";
            break;
          case 8203:
            v25 = "PowerbeatsPro1,1";
            break;
          case 8204:
            v25 = "BeatsSoloPro1,1";
            break;
          case 8205:
            v25 = "Powerbeats4,1";
            break;
          case 8206:
            v25 = "AirPodsPro1,1";
            break;
          case 8207:
            v25 = "AirPods1,3";
            break;
          case 8208:
            v25 = "Device1,8208";
            break;
          case 8209:
            v25 = "BeatsStudioBuds1,1";
            break;
          case 8210:
            v25 = "Device1,8210";
            break;
          case 8211:
            v25 = "Device1,8211";
            break;
          case 8212:
            v25 = "Device1,8212";
            break;
          case 8213:
            v25 = "Device1,8213";
            break;
          case 8214:
            v25 = "BeatsStudioBuds1,2";
            break;
          case 8215:
            v25 = "BeatsStudioPro1,1";
            break;
          case 8216:
            v25 = "Device1,8216";
            break;
          case 8217:
            v25 = "Device1,8217";
            break;
          case 8218:
            v25 = "Device1,8218";
            break;
          case 8219:
            v25 = "Device1,8219";
            break;
          case 8220:
            v25 = "Device1,8220";
            break;
          case 8221:
            v25 = "Device1,8221";
            break;
          case 8222:
            v25 = "Device1,8222";
            break;
          case 8223:
            v25 = "Device1,8223";
            break;
          case 8224:
            v25 = "Device1,8224";
            break;
          case 8228:
            v25 = "Device1,8228";
            break;
          case 8229:
            v25 = "Device1,8229";
            break;
          case 8230:
            v25 = "Device1,8230";
            break;
          default:
            goto LABEL_79;
        }
        goto LABEL_80;
      }
      switch(v24)
      {
        case 0:
          v25 = "Invalid";
          goto LABEL_80;
        case 614:
          v25 = "ATVRemote1,1";
          goto LABEL_80;
        case 621:
          v25 = "ATVRemote1,2";
          goto LABEL_80;
      }
LABEL_79:
      v25 = "?";
      goto LABEL_80;
    }
    if (v24 <= 28943)
    {
      if (v24 > 28935)
      {
        if (v24 == 28936)
        {
          v25 = "AppleTV6,2";
          goto LABEL_80;
        }
        if (v24 == 28943)
        {
          v25 = "AudioAccessory1,1";
          goto LABEL_80;
        }
        goto LABEL_79;
      }
      if (v24 == 21760)
      {
        v25 = "Device1,21760";
        goto LABEL_80;
      }
      if (v24 != 28420)
        goto LABEL_79;
      v25 = "AppleTV5,3";
    }
    else
    {
      if (v24 <= 29714)
      {
        if (v24 == 28944)
        {
          v25 = "AudioAccessory1,2";
          goto LABEL_80;
        }
        if (v24 == 29455)
        {
          v25 = "AppleTV11,2";
          goto LABEL_80;
        }
        goto LABEL_79;
      }
      if (v24 == 29715)
      {
        v25 = "AudioAccessory5,1";
        goto LABEL_80;
      }
      if (v24 == 65533)
      {
        v25 = "HeGn";
        goto LABEL_80;
      }
      if (v24 != 65534)
        goto LABEL_79;
      v25 = "ApGn";
    }
LABEL_80:
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v25));
  }
  v28[6] = v16;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 7));
  CUMetricsLog(CFSTR("com.apple.AudioAccessory.MuteControlMetrics"), v26);

  if (v23)
}

- (void)_updateMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  uint64_t v6;
  id v8;
  __int128 v9;
  _OWORD v10[2];
  _QWORD v11[5];
  int v12;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  -[AAServicesDaemon _playChime:](self, "_playChime:", v6);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001ABD8;
  v11[3] = &unk_1001E2A30;
  v11[4] = self;
  v12 = v6;
  v9 = *(_OWORD *)&a4->var0[4];
  v10[0] = *(_OWORD *)a4->var0;
  v10[1] = v9;
  -[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:](self, "_processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:", v6, v10, v8, v11);

}

- (void)_avSystemControllerServerReset
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ADA4;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_deregisterFromAVSystemControllerDeathNotifications
{
  void *v3;

  if (self->_avSystemControllerServerDeathNotificationRegistered)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _deregisterFromAVSystemControllerDeathNotifications]", 30, "Deregistering from AVSystemController_ServerConnectionDiedNotification");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_ServerConnectionDiedNotification, 0);

    self->_avSystemControllerServerDeathNotificationRegistered = 0;
  }
}

- (void)_deregisterFromAVSystemControllerStateNotifications
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (self->_avSystemControllerStateNotificationRegistered)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _deregisterFromAVSystemControllerStateNotifications]", 30, "Deregistering from AVSystemController_CallIsActiveDidChangeNotification");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = AVSystemController_CallIsActiveDidChangeNotification;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

    self->_avSystemControllerStateNotificationRegistered = 0;
  }
}

- (void)_registerForAVSystemControllerDeathNotifications
{
  void *v3;

  if (!self->_avSystemControllerServerDeathNotificationRegistered)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _registerForAVSystemControllerDeathNotifications]", 30, "Registering for AVSystemController_ServerConnectionDiedNotification");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "_avSystemControllerServerReset", AVSystemController_ServerConnectionDiedNotification, 0);

    self->_avSystemControllerServerDeathNotificationRegistered = 1;
  }
}

- (void)_registerForAVSystemControllerStateNotifications
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (!self->_avSystemControllerStateNotificationRegistered)
  {
    if (dword_10020F980 <= 30
      && (dword_10020F980 != -1 || _LogCategory_Initialize(&dword_10020F980, 30)))
    {
      LogPrintF(&dword_10020F980, "-[AAServicesDaemon _registerForAVSystemControllerStateNotifications]", 30, "Registering for AVSystemController_CallIsActiveDidChangeNotification");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    v8 = AVSystemController_CallIsActiveDidChangeNotification;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    objc_msgSend(v3, "setAttribute:forKey:error:", v4, AVSystemController_SubscribeToNotificationsAttribute, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = AVSystemController_CallIsActiveDidChangeNotification;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_handleCallIsActiveDidChangeNotification:", v6, v7);

    self->_avSystemControllerStateNotificationRegistered = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_uiNotificationSessionMuteControl, 0);
  objc_storeStrong((id *)&self->_tuSharedInst, 0);
  objc_storeStrong((id *)&self->_tuBargeCallCenter, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_muteBanner, 0);
  objc_storeStrong((id *)&self->_muteActionTrigger, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentMuteControlBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentMuteControlAuditTokenBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentMuteControlAppName, 0);
  objc_storeStrong((id *)&self->_currentAudioSessionControl, 0);
  objc_storeStrong((id *)&self->_currentAudioRoutingControl, 0);
  objc_storeStrong((id *)&self->_currentAudioOwnerDevice, 0);
  objc_storeStrong((id *)&self->_connectedHeadphones, 0);
  objc_storeStrong((id *)&self->_connectedDeviceDiscovery, 0);
  objc_storeStrong((id *)&self->_activatedDeviceManagerSet, 0);
  objc_storeStrong((id *)&self->_activatedAudioSessionControlSet, 0);
  objc_storeStrong((id *)&self->_activatedAudioRoutingControlSet, 0);
  objc_storeStrong((id *)&self->_aaController, 0);
}

@end
