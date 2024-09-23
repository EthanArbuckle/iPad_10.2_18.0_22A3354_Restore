@implementation SDRemoteInteractionAgent

+ (id)sharedAgent
{
  if (qword_1007C6910 != -1)
    dispatch_once(&qword_1007C6910, &stru_100717568);
  return (id)qword_1007C6918;
}

- (SDRemoteInteractionAgent)init
{
  SDRemoteInteractionAgent *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDRemoteInteractionAgent;
  v2 = -[SDRemoteInteractionAgent init](&v7, "init");
  if (v2)
  {
    v3 = SFMainQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)description
{
  id v3;
  SFService *controlService;
  id v5;
  SFDeviceDiscovery *deviceDiscovery;
  id v7;
  id v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _BYTE v28[128];

  v27 = 0;
  NSAppendPrintF(&v27, "-- SDRemoteInteractionAgent --\n");
  v3 = v27;
  v26 = v3;
  controlService = self->_controlService;
  if (!controlService)
    controlService = (SFService *)CFSTR("off");
  NSAppendPrintF(&v26, "Server: %@\n", controlService);
  v5 = v26;

  v25 = v5;
  if (self->_deviceDiscovery)
    deviceDiscovery = self->_deviceDiscovery;
  else
    deviceDiscovery = (SFDeviceDiscovery *)CFSTR("off");
  NSAppendPrintF(&v25, "Client: %@, %ld NeedsKeyboard, %ld RSSI threshold\n", deviceDiscovery, -[NSMutableDictionary count](self->_devices, "count"), self->_rssiThreshold);
  v7 = v25;

  v24 = v7;
  NSAppendPrintF(&v24, "Sessions: %ld\n", -[NSMutableSet count](self->_sessions, "count"));
  v8 = v24;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_devices;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13);
        v19 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
        NSAppendPrintF(&v19, "    Found device: %@\n", v17);
        v8 = v19;

        v13 = (char *)v13 + 1;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE5A0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE734;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)prefsChanged
{
  uint64_t Int64;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  const char *v7;
  const char *v8;
  int v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  const char *v15;
  const char *v16;
  void *v17;
  id v18;
  int64_t rssiThreshold;
  int v20;

  v20 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("riClientEnabled"), &v20);
  v4 = Int64 != 0;
  if (v20)
  {
    v5 = Int64;
    v6 = SFIsDeviceAudioAccessory(Int64) ^ 1;
    if (v5)
      v4 = 1;
    else
      v4 = v6;
  }
  if (self->_clientEnabled != v4)
  {
    if (dword_1007B1C28 <= 40
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 40)))
    {
      v7 = "yes";
      if (v4)
        v8 = "no";
      else
        v8 = "yes";
      if (!v4)
        v7 = "no";
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent prefsChanged]", 40, "Client enabled: %s -> %s\n", v8, v7);
    }
    self->_clientEnabled = v4;
  }
  v9 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("riCloudPairedOnly"), &v20) != 0;
  if (v20)
    v9 = _os_feature_enabled_impl("Sharing", "muck") ^ 1;
  if (self->_cloudPairedOnly != v9)
  {
    if (dword_1007B1C28 <= 40
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 40)))
    {
      v10 = "yes";
      if (v9)
        v11 = "no";
      else
        v11 = "yes";
      if (!v9)
        v10 = "no";
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent prefsChanged]", 40, "Cloud paired only: %s -> %s\n", v11, v10);
    }
    self->_cloudPairedOnly = v9;
  }
  v12 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("riServerEnabled"), &v20);
  if (v20)
    v13 = 1;
  else
    v13 = v12 == 0;
  v14 = !v13;
  if (self->_serverEnabled != v14)
  {
    if (dword_1007B1C28 <= 40
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 40)))
    {
      v15 = "yes";
      if (v14)
        v16 = "no";
      else
        v16 = "yes";
      if (!v14)
        v15 = "no";
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent prefsChanged]", 40, "Server enabled: %s -> %s\n", v16, v15);
    }
    self->_serverEnabled = v14;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v18 = objc_msgSend(v17, "bleProximityRSSIThreshold:", CFSTR("kb"));

  rssiThreshold = self->_rssiThreshold;
  if (v18 != (id)rssiThreshold)
  {
    if (dword_1007B1C28 <= 40)
    {
      if (dword_1007B1C28 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B1C28, 40))
          goto LABEL_51;
        rssiThreshold = self->_rssiThreshold;
      }
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent prefsChanged]", 40, "RSSI threshold: %ld -> %ld\n", rssiThreshold, v18);
    }
LABEL_51:
    self->_rssiThreshold = (int64_t)v18;
  }
  -[SDRemoteInteractionAgent _update](self, "_update");
}

- (void)setPreventNotifications:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EEB18;
  v4[3] = &unk_100715BB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDRemoteInteractionAgent _commonEnsureStarted](self, "_commonEnsureStarted");
  if (self->_serverEnabled)
    -[SDRemoteInteractionAgent _serverEnsureStarted](self, "_serverEnsureStarted");
  else
    -[SDRemoteInteractionAgent _serverEnsureStopped](self, "_serverEnsureStopped");
  if (-[SDRemoteInteractionAgent _clientShouldStart](self, "_clientShouldStart"))
    -[SDRemoteInteractionAgent _clientEnsureStarted](self, "_clientEnsureStarted");
  else
    -[SDRemoteInteractionAgent _clientEnsureStopped](self, "_clientEnsureStopped");
}

- (void)_commonEnsureStarted
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)v3;
  if (!self->_idsMonitorInstalled)
  {
    v6 = (void *)v3;
    if (dword_1007B1C28 <= 30)
    {
      if (dword_1007B1C28 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B1C28, 30), v4 = v6, v5))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _commonEnsureStarted]", 30, "Subscribing to IDS notifications\n");
        v4 = v6;
      }
    }
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_commonIDSChanged:", CFSTR("SDNotificationNameIDSAccountsChanged"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_commonIDSChanged:", CFSTR("SDNotificationNameIDSDevicesChanged"), 0);
    v4 = v6;
    self->_idsMonitorInstalled = 1;
  }
  if (!self->_rapportMonitorInstalled)
  {
    v7 = v4;
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_commonRapportChanged:", off_1007B39B0, 0);
    v4 = v7;
    self->_rapportMonitorInstalled = 1;
  }

}

- (void)_commonEnsureStopped
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = v3;
  if (self->_idsMonitorInstalled)
  {
    if (dword_1007B1C28 <= 30)
    {
      if (dword_1007B1C28 != -1 || (v4 = _LogCategory_Initialize(&dword_1007B1C28, 30), v3 = v5, v4))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _commonEnsureStopped]", 30, "Unsubscribing to IDS notifications\n");
        v3 = v5;
      }
    }
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SDNotificationNameIDSAccountsChanged"), 0);
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SDNotificationNameIDSDevicesChanged"), 0);
    v3 = v5;
    self->_idsMonitorInstalled = 0;
  }
  if (self->_rapportMonitorInstalled)
  {
    objc_msgSend(v3, "removeObserver:name:object:", self, off_1007B39B0, 0);
    v3 = v5;
    self->_rapportMonitorInstalled = 0;
  }

}

- (void)_commonIDSChanged:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  if (dword_1007B1C28 <= 30 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _commonIDSChanged:]", 30, "IDS changed\n");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEF20;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

- (void)_commonRapportChanged:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  if (dword_1007B1C28 <= 30 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _commonRapportChanged:]", 30, "Rapport changed\n");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEFE4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

- (void)_serverEnsureStarted
{
  void *v3;
  WPNearby *v4;
  WPNearby *bleWPNearby;
  SFService *v6;
  SFService *controlService;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleWPNearby)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SFBLEClient sharedClient](SFBLEClient, "sharedClient"));
    v4 = (WPNearby *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addNearbyDelegate:", self));
    bleWPNearby = self->_bleWPNearby;
    self->_bleWPNearby = v4;

  }
  if (!self->_controlService)
  {
    if (dword_1007B1C28 <= 30
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _serverEnsureStarted]", 30, "Control service activate\n");
    }
    v6 = (SFService *)objc_alloc_init((Class)SFService);
    controlService = self->_controlService;
    self->_controlService = v6;

    -[SFService setIdentifier:](self->_controlService, "setIdentifier:", SFServiceIdentifierControl);
    -[SFService setSessionFlags:](self->_controlService, "setSessionFlags:", -[SFService sessionFlags](self->_controlService, "sessionFlags") | 0x100);
    -[SFService setReceivedObjectHandler:](self->_controlService, "setReceivedObjectHandler:", &stru_1007175A8);
    -[SFService setReceivedRequestHandler:](self->_controlService, "setReceivedRequestHandler:", &stru_1007175E8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000EF248;
    v10[3] = &unk_100717610;
    v10[4] = self;
    -[SFService setEventMessageHandler:](self->_controlService, "setEventMessageHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000EF254;
    v9[3] = &unk_100715238;
    v9[4] = self;
    -[SFService setRequestMessageHandler:](self->_controlService, "setRequestMessageHandler:", v9);
    -[SFService activateWithCompletion:](self->_controlService, "activateWithCompletion:", &stru_100717630);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDSharedRemoteTextInputClient sharedClient](SDSharedRemoteTextInputClient, "sharedClient"));
  objc_msgSend(v8, "addDelegate:", self);

}

- (void)_serverEnsureStopped
{
  OS_dispatch_source *aggressiveTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *rtiTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  void *v9;
  WPNearby *bleWPNearby;
  NSUUID *currentSessionID;
  NSString *currentText;
  SFService *controlService;
  id v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  aggressiveTimer = self->_aggressiveTimer;
  if (aggressiveTimer)
  {
    v4 = aggressiveTimer;
    dispatch_source_cancel(v4);
    v5 = self->_aggressiveTimer;
    self->_aggressiveTimer = 0;

  }
  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    v7 = rtiTimer;
    dispatch_source_cancel(v7);
    v8 = self->_rtiTimer;
    self->_rtiTimer = 0;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SFBLEClient sharedClient](SFBLEClient, "sharedClient"));
  objc_msgSend(v9, "removeNearbyDelegate:", self);

  bleWPNearby = self->_bleWPNearby;
  self->_bleWPNearby = 0;

  currentSessionID = self->_currentSessionID;
  self->_currentSessionID = 0;

  currentText = self->_currentText;
  self->_currentText = 0;

  -[SFService invalidate](self->_controlService, "invalidate");
  controlService = self->_controlService;
  self->_controlService = 0;

  v14 = (id)objc_claimAutoreleasedReturnValue(+[SDSharedRemoteTextInputClient sharedClient](SDSharedRemoteTextInputClient, "sharedClient"));
  objc_msgSend(v14, "removeDelegate:", self);

}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v6;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[NSMutableSet containsObject:](self->_legacy_sessionDeviceIDs, "containsObject:", v6))
  {
    if (dword_1007B1C28 <= 30
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent nearby:didDisconnectFromPeer:error:]", 30, "Remove %@ on disconnect\n", v6);
    }
    -[NSMutableSet removeObject:](self->_legacy_sessionDeviceIDs, "removeObject:", v6);
  }

}

- (void)_legacy_serverHandleEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v15;
  void *v16;
  uint64_t Int64Ranged;
  uint64_t v18;
  void *v19;
  NSMutableSet *legacy_sessionDeviceIDs;
  NSMutableSet *v21;
  NSMutableSet *v22;
  unint64_t v23;
  unsigned int v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v24 = 0;
  if (!v6)
  {
    v24 = -6708;
    if (dword_1007B1C28 > 50 || dword_1007B1C28 == -1 && !_LogCategory_Initialize(&dword_1007B1C28, 50))
      goto LABEL_25;
    v10 = "### Ignoring event from peer with no identifier\n";
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsBluetoothDeviceIDsForSharing"));
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) == 0 && (self->_cloudPairedOnly || objc_msgSend(v5, "systemPairState") <= 0x13))
  {
    v24 = -6708;
    if (dword_1007B1C28 > 50 || dword_1007B1C28 == -1 && !_LogCategory_Initialize(&dword_1007B1C28, 50))
      goto LABEL_25;
    v23 = (unint64_t)v5;
    v10 = "### Ignoring event from unpaired peer %@\n";
LABEL_7:
    v11 = 50;
    goto LABEL_21;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerFields"));
  TypeID = CFDictionaryGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v12, CFSTR("rp"), TypeID, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v15)
  {
    if (dword_1007B1C28 <= 30
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _legacy_serverHandleEvent:]", 30, "Received event has RTI payload");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDSharedRemoteTextInputClient sharedClient](SDSharedRemoteTextInputClient, "sharedClient"));
    objc_msgSend(v19, "handleTextInputData:", v15);

    goto LABEL_25;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerFields"));
  Int64Ranged = CFDictionaryGetInt64Ranged(v16, CFSTR("o"), 0, 255, &v24);

  v18 = v24;
  if (!v24)
  {
    if (Int64Ranged == 10)
    {
      if (dword_1007B1C28 <= 30
        && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _legacy_serverHandleEvent:]", 30, "Received start session %@ from %@\n", self->_currentSessionID, v6);
      }
      if (self->_currentSessionID)
      {
        legacy_sessionDeviceIDs = self->_legacy_sessionDeviceIDs;
        if (!legacy_sessionDeviceIDs)
        {
          v21 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          v22 = self->_legacy_sessionDeviceIDs;
          self->_legacy_sessionDeviceIDs = v21;

          legacy_sessionDeviceIDs = self->_legacy_sessionDeviceIDs;
        }
        -[NSMutableSet addObject:](legacy_sessionDeviceIDs, "addObject:", v6);
        -[SDRemoteInteractionAgent _serverSendTextSessionDidBegin:](self, "_serverSendTextSessionDidBegin:", v6);
      }
      goto LABEL_25;
    }
    if (dword_1007B1C28 > 40 || dword_1007B1C28 == -1 && !_LogCategory_Initialize(&dword_1007B1C28, 40))
      goto LABEL_25;
    v23 = Int64Ranged;
    v10 = "### Unknown event opcode: %d\n";
    v11 = 40;
LABEL_21:
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _legacy_serverHandleEvent:]", v11, v10, v23);
    goto LABEL_25;
  }
  if (dword_1007B1C28 <= 60)
  {
    if (dword_1007B1C28 == -1)
    {
      if (!_LogCategory_Initialize(&dword_1007B1C28, 60))
        goto LABEL_25;
      v18 = v24;
    }
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _legacy_serverHandleEvent:]", 60, "### Bad event opcode: %#m\n", v18);
  }
LABEL_25:

}

- (void)_legacy_serverHandleRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  char Int64Ranged;
  int v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsBluetoothDeviceIDsForSharing"));
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) == 0 && (self->_cloudPairedOnly || objc_msgSend(v5, "systemPairState") <= 0x13))
  {
    if (dword_1007B1C28 <= 50
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 50)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _legacy_serverHandleRequest:]", 50, "### Ignoring request from unpaired peer %@\n", v5);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerFields"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v10, CFSTR("o"), 0, 255, &v12);

    if (v12)
    {
      if (dword_1007B1C28 <= 60
        && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _legacy_serverHandleRequest:]", 60, "### Bad request opcode: %#m\n");
      }
    }
    else if (Int64Ranged == 1)
    {
      -[SDRemoteInteractionAgent _legacy_serverRespondInfo:](self, "_legacy_serverRespondInfo:", v4);
    }
    else if (dword_1007B1C28 <= 40
           && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 40)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _legacy_serverHandleRequest:]", 40, "### Unknown request opcode: %d\n");
    }
  }

}

- (void)_legacy_serverRespondInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("?");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("name"));
  v8 = objc_msgSend(objc_alloc((Class)SFResponseMessage), "initWithRequestMessage:", v4);

  objc_msgSend(v8, "setHeaderFields:", v9);
  -[SFService sendResponse:](self->_controlService, "sendResponse:", v8);

}

- (void)_sendRTIPayload:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v18)
  {
    v5 = SFRTIDataPayloadForData();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("rp"));
      v8 = SFFullTextFromRTIDataPayload(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)v9;
      if (v9)
        v11 = (__CFString *)v9;
      else
        v11 = &stru_10072FE60;
      v12 = v11;

      objc_storeStrong((id *)&self->_currentText, v11);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_10074B7A8, CFSTR("o"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("t"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("rp"));
      v13 = objc_msgSend(objc_alloc((Class)SFRemoteTextSessionInfo), "initWithRTIPayload:", v7);
      v14 = v13;
      if (v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionaryRepresentation"));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("tsi"));

      }
      if (dword_1007B1C28 <= 30
        && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _sendRTIPayload:]", 30, "Sending RTI payloads to peers (%u)\n", -[NSMutableSet count](self->_legacy_sessionDeviceIDs, "count"));
      }
      v16 = objc_alloc_init((Class)SFEventMessage);
      objc_msgSend(v16, "setDeviceIDs:", self->_legacy_sessionDeviceIDs);
      objc_msgSend(v16, "setHeaderFields:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      objc_msgSend(v16, "setIdentifier:", v17);

      -[SFService sendEvent:](self->_controlService, "sendEvent:", v16);
    }
    else if (dword_1007B1C28 <= 60
           && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _sendRTIPayload:]", 60, "### Failed to deserialize payload?");
    }
  }
  else if (dword_1007B1C28 <= 60
         && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
  {
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _sendRTIPayload:]", 60, "### Send payload without data?");
  }

}

- (void)handleEventWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (dword_1007B1C28 <= 30)
  {
    if (dword_1007B1C28 != -1 || (v7 = _LogCategory_Initialize(&dword_1007B1C28, 30), v4 = v8, v7))
    {
      v5 = SFTextInputDataLogString(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent handleEventWithData:]", 30, "RTI Client event fired (%@)\n", v6);

      v4 = v8;
    }
  }
  -[SDRemoteInteractionAgent _sendRTIPayload:](self, "_sendRTIPayload:", v4);

}

- (void)advertisingTimerFired
{
  OS_dispatch_source *rtiTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    v4 = rtiTimer;
    dispatch_source_cancel(v4);
    v5 = self->_rtiTimer;
    self->_rtiTimer = 0;

  }
  if (dword_1007B1C28 <= 30 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent advertisingTimerFired]", 30, "Advertising timer fired, simulating end event\n");
  -[SDRemoteInteractionAgent handleInputDidEndWithFlags:sessionInfo:](self, "handleInputDidEndWithFlags:sessionInfo:", 0, 0);
  SFMetricsLog(CFSTR("com.apple.sharing.ContinuityKeyboardRTI"), &off_10074E418);
}

- (void)advertisingTimerStart
{
  OS_dispatch_source *rtiTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD handler[5];

  if (dword_1007B1C28 <= 30 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent advertisingTimerStart]", 30, "Starting advertising timer\n");
  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    v4 = rtiTimer;
    dispatch_source_cancel(v4);
    v5 = self->_rtiTimer;
    self->_rtiTimer = 0;

  }
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v7 = self->_rtiTimer;
  self->_rtiTimer = v6;

  v8 = self->_rtiTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000F0080;
  handler[3] = &unk_1007146D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  v9 = self->_rtiTimer;
  v10 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)self->_rtiTimer);
}

- (int)sessionStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSMutableSet *sessions;
  NSMutableSet *v11;
  NSMutableSet *v12;
  int v13;
  _QWORD v15[4];
  id v16;
  SDRemoteInteractionAgent *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  id (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1000F0274;
  v23 = sub_1000F029C;
  v24 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1C28 <= 30 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent sessionStart:]", 30, "Session start\n");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerDevice"));

  if (v5)
  {
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v4, "setAgent:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteTextEventHandler"));

    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteTextEventHandler"));
      v8 = (void *)v20[5];
      v20[5] = v7;

    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000F02A4;
    v15[3] = &unk_100717658;
    v18 = &v19;
    v9 = v4;
    v16 = v9;
    v17 = self;
    objc_msgSend(v9, "setRemoteTextEventHandler:", v15);

    sessions = self->_sessions;
    if (!sessions)
    {
      v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v12 = self->_sessions;
      self->_sessions = v11;

      sessions = self->_sessions;
    }
    -[NSMutableSet addObject:](sessions, "addObject:", v9);
    objc_msgSend(v9, "activateWithCompletion:", 0);
    -[SDRemoteInteractionAgent _update](self, "_update");
    v13 = 0;
  }
  else
  {
    v13 = -6705;
  }
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)sessionStop:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1C28 <= 30 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent sessionStop:]", 30, "Session stop\n");
  -[NSMutableSet removeObject:](self->_sessions, "removeObject:", v4);
  -[SDRemoteInteractionAgent _update](self, "_update");

}

- (void)_clientEnsureStarted
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  SFDeviceDiscovery *v9;
  SFDeviceDiscovery *deviceDiscovery;
  _BOOL4 cloudPairedOnly;
  void *v12;
  void *v13;
  void *v14;
  SDNotificationManager *v15;
  SDNotificationManager *notificationManager;
  RPCompanionLinkClient *v17;
  RPCompanionLinkClient *clinkClient;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];

  if (self->_deviceDiscovery)
  {
    if (self->_cloudPairedOnly)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsBluetoothDeviceIDsForSharing"));

    }
    else
    {
      v4 = 0;
    }
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_deviceDiscovery, "deviceFilter"));
    v6 = v4;
    v7 = v6;
    if (v5 == v6)
    {

    }
    else
    {
      if ((v6 != 0) != (v5 == 0))
      {
        v8 = objc_msgSend(v5, "isEqual:", v6);

        if ((v8 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      -[SFDeviceDiscovery setDeviceFilter:](self->_deviceDiscovery, "setDeviceFilter:", v7);
    }
LABEL_15:
    -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", objc_msgSend(v7, "count") != 0);

    goto LABEL_21;
  }
  if (dword_1007B1C28 <= 30 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientEnsureStarted]", 30, "Discovery start\n");
  v9 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = v9;

  -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 5);
  cloudPairedOnly = self->_cloudPairedOnly;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v13 = v12;
  if (cloudPairedOnly)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsBluetoothDeviceIDsForSharing"));

    -[SFDeviceDiscovery setDeviceFilter:](self->_deviceDiscovery, "setDeviceFilter:", v14);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDeviceIDsForRIServers"));

  }
  -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", objc_msgSend(v14, "count") != 0);

  -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", 64);
  -[SFDeviceDiscovery setPurpose:](self->_deviceDiscovery, "setPurpose:", CFSTR("RIA"));
  -[SFDeviceDiscovery setRssiThreshold:](self->_deviceDiscovery, "setRssiThreshold:", self->_rssiThreshold);
  -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 10);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000F0858;
  v24[3] = &unk_100714FD8;
  v24[4] = self;
  -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000F0904;
  v23[3] = &unk_100714FD8;
  v23[4] = self;
  -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000F09B0;
  v22[3] = &unk_100715000;
  v22[4] = self;
  -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v22);
  -[SFDeviceDiscovery activateWithCompletion:](self->_deviceDiscovery, "activateWithCompletion:", &stru_100717678);
LABEL_21:
  if (!self->_notificationManager)
  {
    v15 = (SDNotificationManager *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](SDNotificationManager, "sharedManager"));
    notificationManager = self->_notificationManager;
    self->_notificationManager = v15;

    -[SDNotificationManager activate](self->_notificationManager, "activate");
  }
  if (!self->_clinkClient)
  {
    if (dword_1007B1C28 <= 30
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientEnsureStarted]", 30, "CompanionLink start\n");
    }
    v17 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    clinkClient = self->_clinkClient;
    self->_clinkClient = v17;

    -[RPCompanionLinkClient setControlFlags:](self->_clinkClient, "setControlFlags:", (unint64_t)-[RPCompanionLinkClient controlFlags](self->_clinkClient, "controlFlags") | 0x2004);
    -[RPCompanionLinkClient setDispatchQueue:](self->_clinkClient, "setDispatchQueue:", self->_dispatchQueue);
    -[RPCompanionLinkClient setInterruptionHandler:](self->_clinkClient, "setInterruptionHandler:", &stru_100717698);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_clinkClient, "setInvalidationHandler:", &stru_1007176B8);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000F0C00;
    v21[3] = &unk_100714A48;
    v21[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_clinkClient, "setDeviceFoundHandler:", v21);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000F0C0C;
    v20[3] = &unk_100714A48;
    v20[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_clinkClient, "setDeviceLostHandler:", v20);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000F0C18;
    v19[3] = &unk_100714A70;
    v19[4] = self;
    -[RPCompanionLinkClient setDeviceChangedHandler:](self->_clinkClient, "setDeviceChangedHandler:", v19);
    -[RPCompanionLinkClient activateWithCompletion:](self->_clinkClient, "activateWithCompletion:", &stru_1007176D8);
  }
}

- (void)_clientEnsureStopped
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSObject *v8;
  NSMutableDictionary *notificationTimers;
  NSMutableSet *sessions;
  SFDeviceDiscovery *deviceDiscovery;
  NSMutableDictionary *devices;
  RPCompanionLinkClient *clinkClient;
  RPCompanionLinkClient *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_notificationTimers;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_notificationTimers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15));
        dispatch_source_cancel(v8);

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_notificationTimers, "removeAllObjects");
  notificationTimers = self->_notificationTimers;
  self->_notificationTimers = 0;

  -[NSMutableSet removeAllObjects](self->_sessions, "removeAllObjects");
  sessions = self->_sessions;
  self->_sessions = 0;

  if (self->_deviceDiscovery)
  {
    if (dword_1007B1C28 <= 30
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientEnsureStopped]", 30, "Discovery stop\n", (_QWORD)v15);
    }
    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate", (_QWORD)v15);
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

    -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
    devices = self->_devices;
    self->_devices = 0;

  }
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    -[RPCompanionLinkClient invalidate](clinkClient, "invalidate");
    v14 = self->_clinkClient;
    self->_clinkClient = 0;

  }
}

- (void)_clientClinkDeviceFound:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B1C28 <= 30
    && ((v6 = v3, dword_1007B1C28 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B1C28, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientClinkDeviceFound:]", 30, "Clink Found: %@\n", v4);

  }
  else
  {

  }
}

- (void)_clientClinkDeviceLost:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B1C28 <= 30
    && ((v6 = v3, dword_1007B1C28 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B1C28, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientClinkDeviceLost:]", 30, "Clink Lost: %@\n", v4);

  }
  else
  {

  }
}

- (void)_clientClinkDeviceChanged:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B1C28 <= 30
    && ((v6 = v3, dword_1007B1C28 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B1C28, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientClinkDeviceChanged:]", 30, "Clink Changed: %@\n", v4);

  }
  else
  {

  }
}

- (void)_clientDeviceFound:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  id v16;
  unint64_t rssiThreshold;
  unint64_t v18;
  NSMutableDictionary *devices;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  id v22;

  v22 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bleDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "idsIdentifier"));
  v7 = (void *)v6;
  if (self->_deviceDiscovery)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (v8)
    goto LABEL_35;
  if (self->_cloudPairedOnly)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsBluetoothDeviceIDsForSharing"));
    v11 = v10;
    v12 = v5;
  }
  else
  {
    if (!v6)
      goto LABEL_15;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDeviceIDsForRIServers"));
    v11 = v10;
    v12 = v7;
  }
  v13 = objc_msgSend(v10, "containsObject:", v12);

  if ((v13 & 1) != 0)
    goto LABEL_16;
  if (self->_cloudPairedOnly)
  {
LABEL_11:
    if (dword_1007B1C28 <= 9 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 9)))
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientDeviceFound:]", 9, "### Ignoring unpaired device %@\n", v4);
    goto LABEL_35;
  }
LABEL_15:
  if (objc_msgSend(v22, "systemPairState") <= 0x13)
    goto LABEL_11;
LABEL_16:
  v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v5));
  if (v14)
  {
    v15 = (void *)v14;
    -[SDRemoteInteractionAgent _clientUpdateCoalesceTimerForDevice:identifier:](self, "_clientUpdateCoalesceTimerForDevice:identifier:", v22, v5);

  }
  else if (!self->_preventNotifications && objc_msgSend(v22, "needsKeyboardOnly"))
  {
    v16 = objc_msgSend(v4, "smoothedRSSI");
    rssiThreshold = 0x8000000000000000;
    if ((unint64_t)v16 <= 0x8000000000000000)
      v18 = 0x8000000000000000;
    else
      v18 = (unint64_t)v16;
    if (self->_rssiThreshold > 0x8000000000000000)
      rssiThreshold = self->_rssiThreshold;
    if (v18 < rssiThreshold)
    {
      if (dword_1007B1C28 <= 9
        && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 9)))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientDeviceFound:]", 9, "Ignoring far away NeedsKeyboard: %@\n", v4);
      }
    }
    else
    {
      if (dword_1007B1C28 <= 50
        && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 50)))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientDeviceFound:]", 50, "Device NeedsKeyboard new: %@\n", v4);
      }
      devices = self->_devices;
      if (!devices)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v21 = self->_devices;
        self->_devices = v20;

        devices = self->_devices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v22, v5);
      -[SDRemoteInteractionAgent clientNotificationPostIfNeededForDevice:](self, "clientNotificationPostIfNeededForDevice:", v22);
    }
  }
LABEL_35:

}

- (void)_clientDeviceLost:(id)a3
{
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;

  v10 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v5 = (void *)v4;
  if (self->_deviceDiscovery)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v7)
    {
      if (dword_1007B1C28 <= 50
        && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 50)))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientDeviceLost:]", 50, "Device NeedsKeyboard lost: %@\n", v10);
      }
      v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_notificationTimers, "objectForKeyedSubscript:", v5));
      v9 = v8;
      if (v8)
      {
        dispatch_source_cancel(v8);
        -[NSMutableDictionary removeObjectForKey:](self->_notificationTimers, "removeObjectForKey:", v5);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v5);
      -[SDRemoteInteractionAgent clientNotificationRemoveForDevice:](self, "clientNotificationRemoveForDevice:", v10);

    }
  }

}

- (void)_clientDeviceLockStatusChanged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F145C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_clientShouldStart
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsDeviceIDsForRIServers"));
    v6 = (unint64_t)objc_msgSend(v5, "count");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsBluetoothDeviceIDsForWatches"));
    v8 = (unint64_t)objc_msgSend(v7, "count");

    v9 = self->_clientEnabled || -[NSMutableSet count](self->_sessions, "count") != 0;
    if (v6 | v8)
      v10 = v9;
    else
      v10 = 0;
    if (dword_1007B1C28 <= 30
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
    {
      v11 = "no";
      if (v10)
        v12 = "yes";
      else
        v12 = "no";
      if (v6)
        v13 = "yes";
      else
        v13 = "no";
      if (v8)
        v14 = "yes";
      else
        v14 = "no";
      if (v9)
        v11 = "yes";
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientShouldStart]", 30, "Client should start %s: tvs: %s, watches: %s, enabled: %s\n", v12, v13, v14, v11);
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaRouteID"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    v22 = v4;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDeviceIdentifier"));
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if ((v14 & 1) != 0)
          goto LABEL_20;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mediaRouteIdentifier"));
        v16 = objc_msgSend(v15, "isEqualToString:", v7);

        if ((v16 & 1) != 0)
          goto LABEL_20;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
        if ((objc_msgSend(v17, "isEqualToString:", v5) & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "model"));
          v19 = objc_msgSend(v18, "isEqualToString:", v23);

          if (v19)
          {
            if (dword_1007B1C28 <= 90
              && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 90)))
            {
              LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _rpCompanionLinkDeviceForSFDevice:]", 90, "### No IDS or route identifier match between %@ and %@ \n", v22, v12);
            }
LABEL_20:
            v20 = v12;
            v4 = v22;
            goto LABEL_21;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v20 = 0;
      v4 = v22;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_21:

  return v20;
}

- (void)clientNotificationPostIfNeededForDevice:(id)a3
{
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;

  v23 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "model"));
  v5 = v4;
  if (v4)
  {
    if (!objc_msgSend(v4, "hasPrefix:", CFSTR("AppleTV")))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      v8 = objc_msgSend(v7, "isDeviceValidRIServer:", v5);

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
        v10 = SFDeviceToRPCompanionLinkDevice(v23, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = v11 != 0;

        -[SDNotificationManager riServerPostIfNeeded:backgroundAction:](self->_notificationManager, "riServerPostIfNeeded:backgroundAction:", v23, v12);
      }
      else if (objc_msgSend(v5, "hasPrefix:", CFSTR("Watch")))
      {
        -[SDNotificationManager watchKeyboardPostIfNeeded:](self->_notificationManager, "watchKeyboardPostIfNeeded:", v23);
      }
      else if (dword_1007B1C28 <= 60
             && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientNotificationPostIfNeededForDevice:]", 60, "### Unrecognized device model: %@\n", v5);
      }
      goto LABEL_40;
    }
    if (objc_msgSend(v23, "deviceActionType") == 19)
    {
      if (dword_1007B1C28 <= 90
        && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 90)))
      {
        v6 = "### Ignoring remote auto fill action type\n";
LABEL_10:
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientNotificationPostIfNeededForDevice:]", 90, v6);
        goto LABEL_40;
      }
      goto LABEL_40;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
    v14 = SFDeviceToRPCompanionLinkDevice(v23, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v15
      || (v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDRemoteInteractionAgent _rpCompanionLinkDeviceForSFDevice:](self, "_rpCompanionLinkDeviceForSFDevice:", v23))) != 0)
    {
      if ((objc_opt_respondsToSelector(v15, "activeUserAltDSID") & 1) == 0)
      {
LABEL_39:

        goto LABEL_40;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeUserAltDSID"));
      v17 = objc_alloc_init((Class)off_1007B1C98[0]());
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "aa_primaryAppleAccount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "aa_altDSID"));
      if (objc_msgSend(v19, "isEqualToString:", v16))
      {
        -[SDNotificationManager riServerPostIfNeeded:backgroundAction:](self->_notificationManager, "riServerPostIfNeeded:backgroundAction:", v23, 1);
      }
      else if (dword_1007B1C28 <= 30
             && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientNotificationPostIfNeededForDevice:]", 30, "### Ignoring posting the notification since active user profiles do not match \n");
      }

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "idsBluetoothDeviceIDsForSharing"));
      v22 = objc_msgSend(v21, "containsObject:", v16);

      if (v22)
        -[SDNotificationManager riServerPostIfNeeded:backgroundAction:](self->_notificationManager, "riServerPostIfNeeded:backgroundAction:", v23, 0);
      v15 = 0;
    }

    goto LABEL_39;
  }
  if (dword_1007B1C28 <= 90 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 90)))
  {
    v6 = "### Cannot post notification without device model\n";
    goto LABEL_10;
  }
LABEL_40:

}

- (void)clientNotificationRemoveForDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("AppleTV")) & 1) != 0
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent")),
          v7 = objc_msgSend(v6, "isDeviceValidRIServer:", v5),
          v6,
          v7))
    {
      -[SDNotificationManager riServerRemove:](self->_notificationManager, "riServerRemove:", v8);
    }
    else if (objc_msgSend(v5, "hasPrefix:", CFSTR("Watch")))
    {
      -[SDNotificationManager watchKeyboardRemove:](self->_notificationManager, "watchKeyboardRemove:", v8);
    }
    else if (dword_1007B1C28 <= 60
           && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientNotificationRemoveForDevice:]", 60, "### Unrecognized device model: %@\n", v5);
    }
  }
  else if (dword_1007B1C28 <= 60
         && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
  {
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientNotificationRemoveForDevice:]", 60, "### Cannot remove notification without device model\n");
  }

}

- (void)clientNotificationUpdateForDevice:(id)a3 rtiData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("AppleTV")) & 1) != 0
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent")),
          v10 = objc_msgSend(v9, "isDeviceValidRIServer:", v8),
          v9,
          v10))
    {
      -[SDNotificationManager riServerUpdate:rtiData:](self->_notificationManager, "riServerUpdate:rtiData:", v11, v6);
    }
    else if (objc_msgSend(v8, "hasPrefix:", CFSTR("Watch")))
    {
      -[SDNotificationManager watchKeyboardUpdate:rtiData:](self->_notificationManager, "watchKeyboardUpdate:rtiData:", v11, v6);
    }
    else if (dword_1007B1C28 <= 60
           && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientNotificationUpdateForDevice:rtiData:]", 60, "### Unrecognized device model: %@\n", v8);
    }
  }
  else if (dword_1007B1C28 <= 60
         && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
  {
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientNotificationUpdateForDevice:rtiData:]", 60, "### Cannot update notification without device model\n");
  }

}

- (void)clientNotificationUpdateForDevice:(id)a3 info:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("AppleTV")) & 1) != 0
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent")),
          v10 = objc_msgSend(v9, "isDeviceValidRIServer:", v8),
          v9,
          v10))
    {
      -[SDNotificationManager riServerUpdate:info:](self->_notificationManager, "riServerUpdate:info:", v11, v6);
    }
    else if (objc_msgSend(v8, "hasPrefix:", CFSTR("Watch")))
    {
      -[SDNotificationManager watchKeyboardUpdate:info:](self->_notificationManager, "watchKeyboardUpdate:info:", v11, v6);
    }
    else if (dword_1007B1C28 <= 60
           && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientNotificationUpdateForDevice:info:]", 60, "### Unrecognized device model: %@\n", v8);
    }
  }
  else if (dword_1007B1C28 <= 60
         && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 60)))
  {
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientNotificationUpdateForDevice:info:]", 60, "### Cannot update notification without device model\n");
  }

}

- (void)clientTextSessionDidBegin:(id)a3 device:(id)a4
{
  -[SDRemoteInteractionAgent clientNotificationUpdateForDevice:info:](self, "clientNotificationUpdateForDevice:info:", a4, a3);
}

- (void)_clientUpdateCoalesceTimerForDevice:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  dispatch_source_t v11;
  id v12;
  NSMutableDictionary *notificationTimers;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  _QWORD handler[4];
  id v17;
  NSObject *v18;
  SDRemoteInteractionAgent *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_notificationTimers, "objectForKeyedSubscript:", v7));
  if ((objc_msgSend(v6, "needsKeyboardOnly") & 1) != 0)
  {
    if (v8)
    {
      if (dword_1007B1C28 <= 50
        && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 50)))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientUpdateCoalesceTimerForDevice:identifier:]", 50, "Device NeedsKeyboard again: %@\n", v9);

      }
      dispatch_source_cancel(v8);
      -[NSMutableDictionary removeObjectForKey:](self->_notificationTimers, "removeObjectForKey:", v7);
    }
  }
  else if (!v8)
  {
    if (dword_1007B1C28 <= 50
      && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 50)))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent _clientUpdateCoalesceTimerForDevice:identifier:]", 50, "Device NeedsKeyboard end: %@\n", v10);

    }
    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    SFDispatchTimerSet(v11, 1.0, -1.0, -4.0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000F22E0;
    handler[3] = &unk_100714990;
    v17 = v6;
    v8 = v11;
    v18 = v8;
    v19 = self;
    v12 = v7;
    v20 = v12;
    dispatch_source_set_event_handler(v8, handler);
    notificationTimers = self->_notificationTimers;
    if (!notificationTimers)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v15 = self->_notificationTimers;
      self->_notificationTimers = v14;

      notificationTimers = self->_notificationTimers;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](notificationTimers, "setObject:forKeyedSubscript:", v8, v12);
    dispatch_resume(v8);

  }
}

- (void)clientUserDidTapNotification:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  objc_class *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (dword_1007B1C28 <= 30)
  {
    if (dword_1007B1C28 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B1C28, 30), v4 = v15, v5))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientUserDidTapNotification:]", 30, "User did tap notification %@\n", v4);
      v4 = v15;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
    v8 = SFDeviceToRPCompanionLinkDevice(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDRemoteInteractionAgent _rpCompanionLinkDeviceForSFDevice:](self, "_rpCompanionLinkDeviceForSFDevice:", v6))) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      if (v10)
      {
        v11 = objc_alloc((Class)off_1007B1CA0[0]());
        v12 = objc_msgSend(v11, "initWithDeviceIdentifier:identifierType:deviceType:launchContext:", v10, off_1007B1CA8[0](), 1, 10);
        v13 = -[objc_class sharedInstance](off_1007B1CB0(), "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (dword_1007B1C28 <= 30
          && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 30)))
        {
          LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientUserDidTapNotification:]", 30, "Launching TV Remote module with %@\n", v10);
        }
        objc_msgSend(v14, "presentWithContext:", v12);

      }
      else if (dword_1007B1C28 <= 90
             && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 90)))
      {
        LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientUserDidTapNotification:]", 90, "### No identifier for device? %@\n", v9);
      }

    }
    else if (dword_1007B1C28 <= 90
           && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 90)))
    {
      LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientUserDidTapNotification:]", 90, "### No clinkDevice for SFDevice? %@\n", v6);
    }
  }
  else if (dword_1007B1C28 <= 90
         && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 90)))
  {
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent clientUserDidTapNotification:]", 90, "### No SFDevice for ID? %@\n", v15);
  }

}

- (void)testKeyboardPost:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  if (dword_1007B1C28 <= 50 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 50)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent testKeyboardPost:]", 50, "Testing keyboard post\n");
  v4 = objc_alloc_init((Class)SFDevice);
  v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v5);

  if (objc_msgSend(v6, "isEqual:", CFSTR("-autofill")))
    objc_msgSend(v4, "setDeviceActionType:", 19);
  -[SDNotificationManager riServerPostIfNeeded:backgroundAction:](self->_notificationManager, "riServerPostIfNeeded:backgroundAction:", v4, 0);

}

- (void)testKeyboardPostThenUpdate
{
  id v3;
  id v4;

  if (dword_1007B1C28 <= 50 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 50)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent testKeyboardPostThenUpdate]", 50, "Testing keyboard post then update\n");
  v4 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v3);

  objc_msgSend(v4, "setName:", CFSTR("postAndUpdate"));
  -[SDNotificationManager riServerPostIfNeeded:backgroundAction:](self->_notificationManager, "riServerPostIfNeeded:backgroundAction:", v4, 0);

}

- (void)testKeyboardPostWithDelay
{
  -[SDRemoteInteractionAgent performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "testKeyboardPost:", 0, 4.0);
}

- (void)testKeyboardRemove
{
  id v3;
  id v4;

  if (dword_1007B1C28 <= 50 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 50)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent testKeyboardRemove]", 50, "Testing keyboard remove\n");
  v4 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v3);

  -[SDNotificationManager riServerRemove:](self->_notificationManager, "riServerRemove:", v4);
}

- (void)testKeyboardRemoveWithDelay
{
  -[SDRemoteInteractionAgent performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "testKeyboardRemove", 0, 4.0);
}

- (void)testKeyboardUpdate
{
  id v3;
  id v4;
  id v5;

  if (dword_1007B1C28 <= 50 && (dword_1007B1C28 != -1 || _LogCategory_Initialize(&dword_1007B1C28, 50)))
    LogPrintF(&dword_1007B1C28, "-[SDRemoteInteractionAgent testKeyboardUpdate]", 50, "Testing keyboard update\n");
  v5 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v5, "setIdentifier:", v3);

  v4 = objc_alloc_init((Class)SFRemoteTextSessionInfo);
  objc_msgSend(v4, "setTitle:", CFSTR("Continuity Keyboard"));
  -[SDNotificationManager riServerUpdate:info:](self->_notificationManager, "riServerUpdate:info:", v5, v4);

}

- (void)testKeyboardUpdateWithDelay
{
  -[SDRemoteInteractionAgent performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "testKeyboardUpdate", 0, 4.0);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)preventNotifications
{
  return self->_preventNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_sessionDeviceIDs, 0);
  objc_storeStrong((id *)&self->_rtiTimer, 0);
  objc_storeStrong((id *)&self->_notificationTimers, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_legacy_sessionDeviceIDs, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_currentText, 0);
  objc_storeStrong((id *)&self->_currentSessionID, 0);
  objc_storeStrong((id *)&self->_controlService, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong((id *)&self->_bleWPNearby, 0);
  objc_storeStrong((id *)&self->_aggressiveTimer, 0);
}

@end
