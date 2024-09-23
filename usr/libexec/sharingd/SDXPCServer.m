@implementation SDXPCServer

- (SDXPCServer)init
{
  SDXPCServer *v2;
  uint64_t v3;
  SDXPCServer *v4;
  uint64_t v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDXPCServer;
  v2 = -[SDXPCServer init](&v9, "init");
  v4 = v2;
  if (v2)
  {
    v5 = SFMainQueue(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v6;

    v4->_prefNotifyToken = -1;
  }
  return v4;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136FFC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  id v3;
  NSXPCListener *v4;
  NSXPCListener *xpcListener;
  uint64_t Int64;
  SDAppleIDAgent *v7;
  SDAppleIDAgent *appleIDAgent;
  SDSubCredentialAgent *v9;
  SDSubCredentialAgent *subCredentialAgent;
  SDHotspotAgent *v11;
  SDHotspotAgent *hotspotAgent;
  SDNearbyAgent *v13;
  SDNearbyAgent *nearbyAgent;
  void *v15;
  id v16;
  SDRemoteInteractionAgent *v17;
  SDRemoteInteractionAgent *riAgent;
  SDSharedRemoteTextInputClient *v19;
  SDSharedRemoteTextInputClient *rtiClient;
  SDProximityPairingAgent *v21;
  SDProximityPairingAgent *ppAgent;
  SDSetupAgent *v23;
  SDSetupAgent *setupAgent;
  SDAutoFillAgent *v25;
  SDAutoFillAgent *autoFillAgent;
  SDProxHandoffAgent *v27;
  SDProxHandoffAgent *proxHandoffAgent;
  uint64_t v29;
  uint64_t v30;
  SFShareAudioService *v31;
  SFShareAudioService *shareAudioService;
  dispatch_queue_t v33;
  void *v34;
  int *p_prefNotifyToken;
  NSObject *dispatchQueue;
  OS_dispatch_queue *v37;
  _QWORD v38[5];
  _QWORD handler[5];
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  LogSetAppID(CFSTR("com.apple.Sharing"));
  v3 = (id)LogControl("?.*:level=chatty,.*:flags=public");
  if (dword_1007B21C0 <= 30)
  {
    if (dword_1007B21C0 != -1 || (v3 = (id)_LogCategory_Initialize(&dword_1007B21C0, 30), (_DWORD)v3))
      v3 = (id)LogPrintF(&dword_1007B21C0, "-[SDXPCServer _activate]", 30, "Activate\n");
  }
  if (!self->_xpcListener)
  {
    v4 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.SharingServices"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v4;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    v3 = -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  Int64 = SFAWDEnsureInitialized(v3);
  if (!self->_appleIDAgent)
  {
    v7 = (SDAppleIDAgent *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
    appleIDAgent = self->_appleIDAgent;
    self->_appleIDAgent = v7;

  }
  if (!self->_subCredentialAgent)
  {
    v9 = (SDSubCredentialAgent *)objc_claimAutoreleasedReturnValue(+[SDSubCredentialAgent sharedAgent](SDSubCredentialAgent, "sharedAgent"));
    subCredentialAgent = self->_subCredentialAgent;
    self->_subCredentialAgent = v9;

  }
  if (!self->_hotspotAgent)
  {
    v11 = (SDHotspotAgent *)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"));
    hotspotAgent = self->_hotspotAgent;
    self->_hotspotAgent = v11;

  }
  if (!self->_nearbyAgent)
  {
    v13 = (SDNearbyAgent *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    nearbyAgent = self->_nearbyAgent;
    self->_nearbyAgent = v13;

    -[SDNearbyAgent setDispatchQueue:](self->_nearbyAgent, "setDispatchQueue:", self->_dispatchQueue);
    Int64 = (uint64_t)-[SDNearbyAgent activate](self->_nearbyAgent, "activate");
  }
  if (!self->_riAgent)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2050000000;
    v15 = (void *)qword_1007C6A38;
    v44 = qword_1007C6A38;
    if (!qword_1007C6A38)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10014522C;
      v40[3] = &unk_100714258;
      v40[4] = &v41;
      sub_10014522C((uint64_t)v40);
      v15 = (void *)v42[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v41, 8);
    Int64 = (uint64_t)objc_msgSend(v16, "supportsContentExtensions");
    if ((_DWORD)Int64)
    {
      v17 = (SDRemoteInteractionAgent *)objc_claimAutoreleasedReturnValue(+[SDRemoteInteractionAgent sharedAgent](SDRemoteInteractionAgent, "sharedAgent"));
      riAgent = self->_riAgent;
      self->_riAgent = v17;

      -[SDRemoteInteractionAgent setDispatchQueue:](self->_riAgent, "setDispatchQueue:", self->_dispatchQueue);
      Int64 = (uint64_t)-[SDRemoteInteractionAgent activate](self->_riAgent, "activate");
    }
  }
  if (!self->_rtiClient)
  {
    v19 = (SDSharedRemoteTextInputClient *)objc_claimAutoreleasedReturnValue(+[SDSharedRemoteTextInputClient sharedClient](SDSharedRemoteTextInputClient, "sharedClient"));
    rtiClient = self->_rtiClient;
    self->_rtiClient = v19;

    -[SDSharedRemoteTextInputClient setDispatchQueue:](self->_rtiClient, "setDispatchQueue:", self->_dispatchQueue);
    Int64 = (uint64_t)-[SDSharedRemoteTextInputClient activate](self->_rtiClient, "activate");
  }
  if (!self->_ppAgent)
  {
    Int64 = SFIsDeviceAudioAccessory(Int64);
    if ((Int64 & 1) == 0)
    {
      v21 = (SDProximityPairingAgent *)objc_claimAutoreleasedReturnValue(+[SDProximityPairingAgent sharedProximityPairingAgent](SDProximityPairingAgent, "sharedProximityPairingAgent"));
      ppAgent = self->_ppAgent;
      self->_ppAgent = v21;

      -[SDProximityPairingAgent setDispatchQueue:](self->_ppAgent, "setDispatchQueue:", self->_dispatchQueue);
      Int64 = (uint64_t)-[SDProximityPairingAgent activate](self->_ppAgent, "activate");
    }
  }
  if (!self->_setupAgent)
  {
    v23 = (SDSetupAgent *)objc_claimAutoreleasedReturnValue(+[SDSetupAgent sharedSetupAgent](SDSetupAgent, "sharedSetupAgent"));
    setupAgent = self->_setupAgent;
    self->_setupAgent = v23;

    -[SDSetupAgent setDispatchQueue:](self->_setupAgent, "setDispatchQueue:", self->_dispatchQueue);
    Int64 = (uint64_t)-[SDSetupAgent activate](self->_setupAgent, "activate");
  }
  if (!self->_autoFillAgent)
  {
    v25 = objc_alloc_init(SDAutoFillAgent);
    autoFillAgent = self->_autoFillAgent;
    self->_autoFillAgent = v25;

    -[SDAutoFillAgent setDispatchQueue:](self->_autoFillAgent, "setDispatchQueue:", self->_dispatchQueue);
    Int64 = (uint64_t)-[SDAutoFillAgent activate](self->_autoFillAgent, "activate");
  }
  if (!self->_proxHandoffAgent)
  {
    v27 = (SDProxHandoffAgent *)objc_claimAutoreleasedReturnValue(+[SDProxHandoffAgent sharedAgent](SDProxHandoffAgent, "sharedAgent"));
    proxHandoffAgent = self->_proxHandoffAgent;
    self->_proxHandoffAgent = v27;

    -[SDProxHandoffAgent setDispatchQueue:](self->_proxHandoffAgent, "setDispatchQueue:", self->_dispatchQueue);
    Int64 = (uint64_t)-[SDProxHandoffAgent activate](self->_proxHandoffAgent, "activate");
  }
  if (!self->_shareAudioService)
  {
    if ((LODWORD(v40[0]) = 0,
          Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("shaEnabled"), v40),
          v30 = Int64,
          LODWORD(v40[0]))
      && (Int64 = GestaltGetDeviceClass(Int64, v29), (Int64 - 1) < 3)
      || v30)
    {
      v31 = (SFShareAudioService *)objc_alloc_init((Class)SFShareAudioService);
      shareAudioService = self->_shareAudioService;
      self->_shareAudioService = v31;

      v33 = dispatch_queue_create("ShareAudioService", 0);
      -[SFShareAudioService setDispatchQueue:](self->_shareAudioService, "setDispatchQueue:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      -[SFShareAudioService setStatusMonitor:](self->_shareAudioService, "setStatusMonitor:", v34);

      Int64 = (uint64_t)-[SFShareAudioService activate](self->_shareAudioService, "activate");
    }
  }
  p_prefNotifyToken = &self->_prefNotifyToken;
  if (self->_prefNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001374D0;
    handler[3] = &unk_100714EC8;
    handler[4] = self;
    Int64 = notify_register_dispatch("com.apple.Sharing.prefsChanged", p_prefNotifyToken, dispatchQueue, handler);
  }
  if (!self->_stateHandle)
  {
    if (IsAppleInternalBuild(Int64, p_prefNotifyToken))
    {
      v37 = self->_dispatchQueue;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1001375B0;
      v38[3] = &unk_100714CC0;
      v38[4] = self;
      self->_stateHandle = os_state_add_handler(v37, v38);
    }
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100137610;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v3;
  unint64_t stateHandle;
  int prefNotifyToken;
  NSXPCListener *xpcListener;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSMutableSet *xpcConnections;
  SDAppleIDAgent *appleIDAgent;
  SDNearbyAgent *nearbyAgent;
  SDRemoteInteractionAgent *riAgent;
  SDSharedRemoteTextInputClient *rtiClient;
  SDProximityPairingAgent *ppAgent;
  SDSetupAgent *setupAgent;
  SDAutoFillAgent *autoFillAgent;
  SDProxHandoffAgent *proxHandoffAgent;
  SFShareAudioService *shareAudioService;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  stateHandle = self->_stateHandle;
  if (stateHandle)
  {
    os_state_remove_handler(stateHandle, v3);
    self->_stateHandle = 0;
  }
  prefNotifyToken = self->_prefNotifyToken;
  if (prefNotifyToken != -1)
  {
    notify_cancel(prefNotifyToken);
    self->_prefNotifyToken = -1;
  }
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self->_xpcConnections;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i) + 136), "invalidate", (_QWORD)v22);
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  -[NSMutableSet removeAllObjects](self->_xpcConnections, "removeAllObjects");
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  appleIDAgent = self->_appleIDAgent;
  self->_appleIDAgent = 0;

  -[SDNearbyAgent invalidate](self->_nearbyAgent, "invalidate");
  nearbyAgent = self->_nearbyAgent;
  self->_nearbyAgent = 0;

  -[SDRemoteInteractionAgent invalidate](self->_riAgent, "invalidate");
  riAgent = self->_riAgent;
  self->_riAgent = 0;

  -[SDSharedRemoteTextInputClient invalidate](self->_rtiClient, "invalidate");
  rtiClient = self->_rtiClient;
  self->_rtiClient = 0;

  -[SDProximityPairingAgent invalidate](self->_ppAgent, "invalidate");
  ppAgent = self->_ppAgent;
  self->_ppAgent = 0;

  -[SDSetupAgent invalidate](self->_setupAgent, "invalidate");
  setupAgent = self->_setupAgent;
  self->_setupAgent = 0;

  -[SDAutoFillAgent invalidate](self->_autoFillAgent, "invalidate");
  autoFillAgent = self->_autoFillAgent;
  self->_autoFillAgent = 0;

  -[SDProxHandoffAgent invalidate](self->_proxHandoffAgent, "invalidate");
  proxHandoffAgent = self->_proxHandoffAgent;
  self->_proxHandoffAgent = 0;

  -[SFShareAudioService invalidate](self->_shareAudioService, "invalidate");
  shareAudioService = self->_shareAudioService;
  self->_shareAudioService = 0;

  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCServer _invalidate]", 30, "Stopped\n", (_QWORD)v22);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  NSXPCListener *v8;
  SDXPCConnection *v9;
  NSMutableSet *xpcConnections;
  NSMutableSet *v11;
  NSMutableSet *v12;
  NSXPCListener *xpcListener;
  NSXPCInterface *v14;
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
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSXPCInterface *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _QWORD v41[5];
  SDXPCConnection *v42;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8 = (NSXPCListener *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v9 = -[SDXPCConnection initWithServer:xpcConnection:]([SDXPCConnection alloc], "initWithServer:xpcConnection:", self, v6);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v12 = self->_xpcConnections;
    self->_xpcConnections = v11;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v9);
  xpcListener = self->_xpcListener;

  if (xpcListener == v8)
  {
    v14 = self->_xpcInterfaceClient;
    if (!v14)
    {
      v14 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFXPCInterface));
      v40 = objc_alloc((Class)NSSet);
      v39 = objc_opt_class(NSArray, v15);
      v38 = objc_opt_class(NSDictionary, v16);
      v37 = objc_opt_class(NSData, v17);
      v36 = objc_opt_class(NSDate, v18);
      v35 = objc_opt_class(NSError, v19);
      v21 = objc_opt_class(NSNull, v20);
      v23 = objc_opt_class(NSNumber, v22);
      v25 = objc_opt_class(NSString, v24);
      v27 = objc_msgSend(v40, "initWithObjects:", v39, v38, v37, v36, v35, v21, v23, v25, objc_opt_class(NSUUID, v26), 0);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v14, "setClasses:forSelector:argumentIndex:ofReply:", v27, "shareAudioProgressEvent:info:", 1, 0);
      objc_storeStrong((id *)&self->_xpcInterfaceClient, v14);

    }
    v28 = self->_xpcInterfaceServer;
    if (!v28)
    {
      v28 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SDXPCInterface));
      v29 = objc_alloc((Class)NSSet);
      v31 = objc_opt_class(NSArray, v30);
      v33 = objc_msgSend(v29, "initWithObjects:", v31, objc_opt_class(SFPeopleSuggesterResult, v32), 0);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v28, "setClasses:forSelector:argumentIndex:ofReply:", v33, "getPeopleSuggestions:completion:", 0, 1);

      objc_storeStrong((id *)&self->_xpcInterfaceServer, v28);
    }
    objc_msgSend(v6, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(v6, "setExportedInterface:", v28);
    objc_msgSend(v6, "setExportedObject:", v9);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100137C38;
    v41[3] = &unk_100714860;
    v41[4] = self;
    v42 = v9;
    objc_msgSend(v6, "setInvalidationHandler:", v41);
    objc_msgSend(v6, "setRemoteObjectInterface:", v14);
    objc_msgSend(v6, "resume");
    if (dword_1007B21C0 <= 20
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 20)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCServer listener:shouldAcceptNewConnection:]", 20, "XPC connection started from %#{pid}\n", objc_msgSend(v6, "processIdentifier"));
    }

  }
  else
  {
    if (dword_1007B21C0 <= 60
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCServer listener:shouldAcceptNewConnection:]", 60, "### Unknown XPC listener\n");
    }
    -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v9);
  }

  return xpcListener == v8;
}

- (void)_connectionInvalidated:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  objc_msgSend(v5, "connectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);

}

- (void)stateAppendXPCConnections:(id *)a3
{
  void *i;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  void *j;
  const char *v13;
  NSMutableSet *obj;
  uint64_t v15;
  id v16;
  uint64_t v17;
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

  NSAppendPrintF(a3, "-- XPC connections --\n");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_xpcConnections;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        NSAppendPrintF(a3, "%#{pid}", objc_msgSend(*(id *)(v6 + 136), "processIdentifier"));
        if (objc_msgSend(*(id *)(v6 + 16), "count"))
        {
          v18 = i;
          NSAppendPrintF(a3, ", Assertions: ");
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v17 = v6;
          v7 = *(id *)(v6 + 16);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v8)
          {
            v9 = v8;
            v10 = 0;
            v11 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(_QWORD *)v20 != v11)
                  objc_enumerationMutation(v7);
                if (v10 + (_DWORD)j)
                  v13 = ", ";
                else
                  v13 = "";
                NSAppendPrintF(a3, "%s%@ (%ld total)", v13, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), -[NSCountedSet countForObject:](self->_assertions, "countForObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j)));
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
              v10 += (int)j;
            }
            while (v9);
          }

          v6 = v17;
          i = v18;
        }
        if (*(_BYTE *)(v6 + 25))
          NSAppendPrintF(a3, ", BTUser");
        if (*(_QWORD *)(v6 + 32))
          NSAppendPrintF(a3, ", %@", *(_QWORD *)(v6 + 32));
        if (*(_QWORD *)(v6 + 40))
          NSAppendPrintF(a3, ", %@", *(_QWORD *)(v6 + 40));
        if (*(_QWORD *)(v6 + 64))
          NSAppendPrintF(a3, ", Note: %@", *(_QWORD *)(v6 + 64));
        if (*(_QWORD *)(v6 + 72))
          NSAppendPrintF(a3, ", PreventExit: '%@'", *(_QWORD *)(v6 + 72));
        if (*(_QWORD *)(v6 + 88))
          NSAppendPrintF(a3, ", %@", *(_QWORD *)(v6 + 88));
        if (*(_QWORD *)(v6 + 96))
          NSAppendPrintF(a3, ", %@", *(_QWORD *)(v6 + 96));
        if (*(_QWORD *)(v6 + 104))
          NSAppendPrintF(a3, ", %@", *(_QWORD *)(v6 + 104));
        NSAppendPrintF(a3, "\n");
      }
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v16);
  }

}

- (os_state_data_s)_stateDump
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  os_state_data_s *v7;
  os_state_data_s *v8;

  if (dword_1007B21C0 <= 50 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 50)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCServer _stateDump]", 50, "State dump: SharingServices\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCServer _stateDumpString](self, "_stateDumpString"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v3, 200, 0, 0));
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "length");
      v7 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v6 + 200, 0x73A242A3uLL);
      v8 = v7;
      if (v7)
      {
        v7->var0 = 1;
        v7->var1.var1 = v6;
        __strlcpy_chk(v7->var3, "SharingServices State", 64, 64);
        v5 = objc_retainAutorelease(v5);
        memcpy(v8->var4, objc_msgSend(v5, "bytes"), (size_t)v6);
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
    v5 = 0;
  }

  return v8;
}

- (id)_stateDumpString
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v38 = 0;
  NSAppendPrintF(&v38, "\n");
  v3 = v38;
  v4 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent description](self->_nearbyAgent, "description"));
  v5 = (void *)v4;
  if (v4)
  {
    v37 = v3;
    NSAppendPrintF(&v37, "%@\n", v4);
    v6 = v37;

    v3 = v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDRemoteInteractionAgent description](self->_riAgent, "description"));

  if (v7)
  {
    v36 = v3;
    NSAppendPrintF(&v36, "%@\n", v7);
    v8 = v36;

    v3 = v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent description](self->_ppAgent, "description"));

  if (v9)
  {
    v35 = v3;
    NSAppendPrintF(&v35, "%@\n", v9);
    v10 = v35;

    v3 = v10;
  }
  v11 = CUDescriptionWithLevel(self->_setupAgent, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v34 = v3;
    NSAppendPrintF(&v34, "%@\n", v12);
    v13 = v34;

    v3 = v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoFillAgent description](self->_autoFillAgent, "description"));

  if (v14)
  {
    v33 = v3;
    NSAppendPrintF(&v33, "%@\n", v14);
    v15 = v33;

    v3 = v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent description](self->_proxHandoffAgent, "description"));

  if (v16)
  {
    v32 = v3;
    NSAppendPrintF(&v32, "%@\n", v16);
    v17 = v32;

    v3 = v17;
  }
  v31 = v3;
  -[SDXPCServer stateAppendXPCConnections:](self, "stateAppendXPCConnections:", &v31);
  v18 = v31;

  v30 = v18;
  NSAppendPrintF(&v30, "\n");
  v19 = v30;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent detailedDescription](self->_appleIDAgent, "detailedDescription"));
  if (v20)
  {
    v29 = v19;
    NSAppendPrintF(&v29, "%@\n", v20);
    v21 = v29;

    v19 = v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));

  if (v23)
  {
    v28 = v19;
    NSAppendPrintF(&v28, "%@\n", v23);
    v24 = v28;

    v19 = v24;
  }
  v27 = v19;
  NSAppendPrintF(&v27, "SharingServices State End\n");
  v25 = v27;

  return v25;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcInterfaceServer, 0);
  objc_storeStrong((id *)&self->_xpcInterfaceClient, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_shareAudioService, 0);
  objc_storeStrong((id *)&self->_setupAgent, 0);
  objc_storeStrong((id *)&self->_proxHandoffAgent, 0);
  objc_storeStrong((id *)&self->_ppAgent, 0);
  objc_storeStrong((id *)&self->_rtiClient, 0);
  objc_storeStrong((id *)&self->_riAgent, 0);
  objc_storeStrong((id *)&self->_nearbyAgent, 0);
  objc_storeStrong((id *)&self->_hotspotAgent, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_contactsQueue, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_subCredentialAgent, 0);
  objc_storeStrong((id *)&self->_autoFillAgent, 0);
  objc_storeStrong((id *)&self->_appleIDAgent, 0);
}

@end
