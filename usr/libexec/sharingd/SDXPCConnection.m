@implementation SDXPCConnection

- (void)deviceDiscoveryUpdate:(id)a3
{
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  unsigned int v13;
  id v14;
  id v15;
  id v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  id v24;

  v24 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection deviceDiscoveryUpdate:]", 30, "%@: %@\n", CFSTR("DeviceDiscoveryUpdate"), v24);
  if (self->_ddRequest)
  {
    v4 = objc_msgSend(v24, "changeFlags");
    if (v4 != -[SFDeviceDiscovery changeFlags](self->_ddRequest, "changeFlags"))
      -[SFDeviceDiscovery setChangeFlags:](self->_ddRequest, "setChangeFlags:", objc_msgSend(v24, "changeFlags"));
    v5 = objc_msgSend(v24, "discoveryFlags");
    if (v5 != -[SFDeviceDiscovery discoveryFlags](self->_ddRequest, "discoveryFlags"))
      -[SFDeviceDiscovery setDiscoveryFlags:](self->_ddRequest, "setDiscoveryFlags:", objc_msgSend(v24, "discoveryFlags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_ddRequest, "deviceFilter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceFilter"));
    v8 = v6;
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0))
      {

      }
      else
      {
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if ((v11 & 1) != 0)
        {
LABEL_18:
          v12 = objc_msgSend(v24, "fastScanMode");
          if (v12 != -[SFDeviceDiscovery fastScanMode](self->_ddRequest, "fastScanMode"))
            -[SFDeviceDiscovery setFastScanMode:](self->_ddRequest, "setFastScanMode:", objc_msgSend(v24, "fastScanMode"));
          v13 = objc_msgSend(v24, "overrideScreenOff");
          if (v13 != -[SFDeviceDiscovery overrideScreenOff](self->_ddRequest, "overrideScreenOff"))
            -[SFDeviceDiscovery setOverrideScreenOff:](self->_ddRequest, "setOverrideScreenOff:", objc_msgSend(v24, "overrideScreenOff"));
          v14 = objc_msgSend(v24, "overrideScreenOffRescanInterval");
          if (v14 != -[SFDeviceDiscovery overrideScreenOffRescanInterval](self->_ddRequest, "overrideScreenOffRescanInterval"))-[SFDeviceDiscovery setOverrideScreenOffRescanInterval:](self->_ddRequest, "setOverrideScreenOffRescanInterval:", objc_msgSend(v24, "overrideScreenOffRescanInterval"));
          v15 = objc_msgSend(v24, "rssiThreshold");
          if (v15 != -[SFDeviceDiscovery rssiThreshold](self->_ddRequest, "rssiThreshold"))
            -[SFDeviceDiscovery setRssiThreshold:](self->_ddRequest, "setRssiThreshold:", objc_msgSend(v24, "rssiThreshold"));
          v16 = objc_msgSend(v24, "scanRate");
          if (v16 != -[SFDeviceDiscovery scanRate](self->_ddRequest, "scanRate"))
            -[SFDeviceDiscovery setScanRate:](self->_ddRequest, "setScanRate:", objc_msgSend(v24, "scanRate"));
          v17 = objc_msgSend(v24, "trackPeers");
          if (v17 != -[SFDeviceDiscovery trackPeers](self->_ddRequest, "trackPeers"))
            -[SFDeviceDiscovery setTrackPeers:](self->_ddRequest, "setTrackPeers:", objc_msgSend(v24, "trackPeers"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery useCases](self->_ddRequest, "useCases"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "useCases"));
          v20 = v18;
          v21 = v19;
          if (v20 == v21)
          {

          }
          else
          {
            v22 = v21;
            if ((v20 == 0) == (v21 != 0))
            {

            }
            else
            {
              v23 = objc_msgSend(v20, "isEqual:", v21);

              if ((v23 & 1) != 0)
                goto LABEL_38;
            }
            v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "useCases"));
            -[SFDeviceDiscovery setUseCases:](self->_ddRequest, "setUseCases:", v20);
          }

LABEL_38:
          -[SDNearbyAgent deviceDiscoveryRequestUpdate:](self->_server->_nearbyAgent, "deviceDiscoveryRequestUpdate:", self->_ddRequest);
          goto LABEL_39;
        }
      }
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceFilter"));
      -[SFDeviceDiscovery setDeviceFilter:](self->_ddRequest, "setDeviceFilter:", v8);
    }

    goto LABEL_18;
  }
  if (dword_1007B21C0 <= 60 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection deviceDiscoveryUpdate:]", 60, "### %@ failed: %#m\n", CFSTR("DeviceDiscoveryUpdate"), 4294960576);
LABEL_39:

}

- (SDXPCConnection)initWithServer:(id)a3 xpcConnection:(id)a4
{
  id v7;
  id v8;
  SDXPCConnection *v9;
  SDXPCConnection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SDXPCConnection;
  v9 = -[SDXPCConnection init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_server, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
  }

  return v10;
}

- (void)connectionInvalidated
{
  SFCoordinatedAlertRequest *caRequest;
  SFDeviceDiscovery *ddRequest;
  SFUserAlert *notification;
  SFUserAlert *v6;
  void *v7;
  NSString *preventExitForLocaleReason;
  SFProximityClient *proxClient;
  SFRemoteInteractionSession *riSession;
  SFService *service;
  void *v12;
  unsigned int v13;
  void *v14;
  SFService *v15;
  SFSession *session;
  SFShareAudioSessionDaemon *shareAudioSession;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 20 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 20)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection connectionInvalidated]", 20, "XPC connection invalidated from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  -[SDXPCConnection _invalidateAssertions](self, "_invalidateAssertions");
  if (self->_bluetoothUserInteraction)
  {
    -[SDProximityPairingAgent bluetoothUserInteractionStop:](self->_server->_ppAgent, "bluetoothUserInteractionStop:", self);
    self->_bluetoothUserInteraction = 0;
  }
  if (self->_caRequest)
  {
    -[SDNearbyAgent coordinatedAlertRequestCancel:](self->_server->_nearbyAgent, "coordinatedAlertRequestCancel:");
    -[SFCoordinatedAlertRequest invalidate](self->_caRequest, "invalidate");
    caRequest = self->_caRequest;
    self->_caRequest = 0;

  }
  if (self->_diagnosticBLEModeStarted)
  {
    -[SDNearbyAgent diagnosticBLEModeStop:](self->_server->_nearbyAgent, "diagnosticBLEModeStop:", self);
    self->_diagnosticBLEModeStarted = 0;
  }
  if (self->_ddRequest)
  {
    -[SDNearbyAgent deviceDiscoveryRequestStop:](self->_server->_nearbyAgent, "deviceDiscoveryRequestStop:");
    -[SFDeviceDiscovery invalidate](self->_ddRequest, "invalidate");
    ddRequest = self->_ddRequest;
    self->_ddRequest = 0;

  }
  notification = self->_notification;
  if (notification)
  {
    -[SFUserAlert invalidate](notification, "invalidate");
    v6 = self->_notification;
    self->_notification = 0;

  }
  if (self->_preventExitForLocaleReason)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    objc_msgSend(v7, "removePreventExitForLocaleReason:", self->_preventExitForLocaleReason);

    preventExitForLocaleReason = self->_preventExitForLocaleReason;
    self->_preventExitForLocaleReason = 0;

  }
  if (self->_proxClient)
  {
    -[SDProxHandoffAgent proximityClientStop:](self->_server->_proxHandoffAgent, "proximityClientStop:");
    -[SFProximityClient invalidate](self->_proxClient, "invalidate");
    proxClient = self->_proxClient;
    self->_proxClient = 0;

  }
  if (self->_riSession)
  {
    -[SDRemoteInteractionAgent sessionStop:](self->_server->_riAgent, "sessionStop:");
    -[SFRemoteInteractionSession invalidate](self->_riSession, "invalidate");
    riSession = self->_riSession;
    self->_riSession = 0;

  }
  service = self->_service;
  if (service)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SFService identifier](service, "identifier"));
    v13 = objc_msgSend(v12, "isEqualToString:", SFServiceIdentifierPasswordSharing);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v14, "postNotificationName:object:", SFWiFiPasswordSharingAdvertisingEnded, 0);

    }
    -[SDNearbyAgent serviceStop:](self->_server->_nearbyAgent, "serviceStop:", self->_service);
    -[SFService invalidate](self->_service, "invalidate");
    v15 = self->_service;
    self->_service = 0;

  }
  if (self->_session)
  {
    -[SDNearbyAgent sessionStop:](self->_server->_nearbyAgent, "sessionStop:");
    -[SFSession invalidate](self->_session, "invalidate");
    session = self->_session;
    self->_session = 0;

  }
  -[SFShareAudioSessionDaemon invalidate](self->_shareAudioSession, "invalidate");
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;

  if (self->_unlockTestClientStarted)
  {
    -[SDNearbyAgent unlockStopTestClient](self->_server->_nearbyAgent, "unlockStopTestClient");
    self->_unlockTestClientStarted = 0;
  }
}

- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;

  v8 = a3;
  v9 = a5;
  if (*a4
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", v8)), *a4 = objc_msgSend(v10, "isEqual:", &__kCFBooleanTrue), v10, *a4))
  {
    v11 = 0;
  }
  else
  {
    if (dword_1007B21C0 <= 60
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _entitled:state:label:]", 60, "### %#{pid} lacks %''@ entitlement to use %@\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v8, v9);
    }
    v11 = -6768;
  }

  return v11;
}

- (int)_entitledService:(id)a3 state:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v6 = a3;
  if (*a4)
  {
    v10 = 0;
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.sharing.Services")));
    v9 = objc_opt_class(NSArray, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0 || CFGetInt64(v7, 0))
    {
      v10 = 0;
    }
    else
    {
      if (dword_1007B21C0 <= 60
        && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
      {
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _entitledService:state:]", 60, "### %#{pid} lacks %''@ entitlement for service %''@\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.sharing.Services"), v6);
      }
      v10 = -6768;
    }
  }

  return v10;
}

- (void)autoFillHelperActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection autoFillHelperActivate:completion:]", 30, "%@\n", CFSTR("AutoFillHelperActivate"));
  v9 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.RemoteInteractionSession"), &self->_entitledRemoteInteractionSession, CFSTR("AutoFillHelperActivate"));
  if (!(_DWORD)v9)
  {
    if (!self->_afsHelper)
    {
      objc_msgSend(v7, "setDispatchQueue:", self->_server->_dispatchQueue);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100138CE4;
      v19[3] = &unk_1007146D8;
      v19[4] = self;
      objc_msgSend(v7, "setDismissUserNotificationHandler:", v19);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100138D34;
      v18[3] = &unk_1007183F8;
      v18[4] = self;
      objc_msgSend(v7, "setPairingResponseHandler:", v18);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100138DA8;
      v17[3] = &unk_100716388;
      v17[4] = self;
      objc_msgSend(v7, "setPromptForPINHandler:", v17);
      v9 = -[SDAutoFillAgent helperStart:](self->_server->_autoFillAgent, "helperStart:", v7);
      if ((_DWORD)v9)
        goto LABEL_10;
      objc_storeStrong((id *)&self->_afsHelper, a3);
    }
    v9 = 0;
  }
LABEL_10:
  if (v8)
  {
    if ((_DWORD)v9)
    {
      v10 = (int)v9;
      v20 = NSLocalizedDescriptionKey;
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v9, 0, 0));
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      v14 = CFSTR("?");
      if (v12)
        v14 = (const __CFString *)v12;
      v21 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v10, v15));
      v8[2](v8, v16);

    }
    else
    {
      v8[2](v8, 0);
    }
  }

}

- (void)autoFillHelperDidPickUsername:(id)a3 password:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  SFRemoteAutoFillSessionHelper *afsHelper;
  uint64_t v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection autoFillHelperDidPickUsername:password:error:]", 30, "%@\n", CFSTR("AutoFillHelperTryPIN"));
  afsHelper = self->_afsHelper;
  if (afsHelper)
  {
    v11 = -[SDAutoFillAgent helper:didPickUsername:password:error:](self->_server->_autoFillAgent, "helper:didPickUsername:password:error:", afsHelper, v12, v8, v9);
    if (!(_DWORD)v11)
      goto LABEL_11;
  }
  else
  {
    v11 = 4294960576;
  }
  if (dword_1007B21C0 <= 60 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection autoFillHelperDidPickUsername:password:error:]", 60, "### %@ failed: %#m\n", CFSTR("AutoFillHelperTryPIN"), v11);
LABEL_11:

}

- (void)autoFillHelperTryPIN:(id)a3
{
  SFRemoteAutoFillSessionHelper *afsHelper;
  uint64_t v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection autoFillHelperTryPIN:]", 30, "%@, PIN: %@\n", CFSTR("AutoFillHelperTryPIN"), v6);
  afsHelper = self->_afsHelper;
  if (afsHelper)
  {
    v5 = -[SDAutoFillAgent helper:tryPIN:](self->_server->_autoFillAgent, "helper:tryPIN:", afsHelper, v6);
    if (!(_DWORD)v5)
      goto LABEL_11;
  }
  else
  {
    v5 = 4294960576;
  }
  if (dword_1007B21C0 <= 60 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection autoFillHelperTryPIN:]", 60, "### %@ failed: %#m\n", CFSTR("AutoFillHelperTryPIN"), v5);
LABEL_11:

}

- (void)autoFillHelperUserNotificationDidActivate:(id)a3
{
  SFRemoteAutoFillSessionHelper *afsHelper;
  uint64_t v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection autoFillHelperUserNotificationDidActivate:]", 30, "%@, %@\n", CFSTR("AutoFillHelperNotificationDidActivate"), v6);
  afsHelper = self->_afsHelper;
  if (afsHelper)
  {
    v5 = -[SDAutoFillAgent helper:userNotificationDidActivate:](self->_server->_autoFillAgent, "helper:userNotificationDidActivate:", afsHelper, v6);
    if (!(_DWORD)v5)
      goto LABEL_11;
  }
  else
  {
    v5 = 4294960576;
  }
  if (dword_1007B21C0 <= 60 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection autoFillHelperUserNotificationDidActivate:]", 60, "### %@ failed: %#m\n", CFSTR("AutoFillHelperNotificationDidActivate"), v5);
LABEL_11:

}

- (void)autoFillHelperUserNotificationDidDismiss:(id)a3
{
  SFRemoteAutoFillSessionHelper *afsHelper;
  uint64_t v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection autoFillHelperUserNotificationDidDismiss:]", 30, "%@, %@\n", CFSTR("AutoFillHelperNotificationDidDismiss"), v6);
  afsHelper = self->_afsHelper;
  if (afsHelper)
  {
    v5 = -[SDAutoFillAgent helper:userNotificationDidDismiss:](self->_server->_autoFillAgent, "helper:userNotificationDidDismiss:", afsHelper, v6);
    if (!(_DWORD)v5)
      goto LABEL_11;
  }
  else
  {
    v5 = 4294960576;
  }
  if (dword_1007B21C0 <= 60 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection autoFillHelperUserNotificationDidDismiss:]", 60, "### %@ failed: %#m\n", CFSTR("AutoFillHelperNotificationDidDismiss"), v5);
LABEL_11:

}

- (void)activateAssertionWithIdentifier:(id)a3
{
  unsigned int v4;
  void *v5;
  id v6;
  NSMutableSet *assertions;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSUInteger v10;
  NSCountedSet *v11;
  NSCountedSet *v12;
  SDXPCServer *server;
  NSCountedSet *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v4 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("ActivateAssertion"));
  v5 = v17;
  if (!v4)
  {
    v6 = v17;
    if (!v6)
    {
LABEL_27:

      v5 = v17;
      goto LABEL_28;
    }
    if (-[NSMutableSet containsObject:](self->_assertions, "containsObject:", v6))
    {
      if (dword_1007B21C0 <= 30
        && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
      {
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection activateAssertionWithIdentifier:]", 30, "Ignoring duplicate assertion '%@'\n", v6);
      }
      goto LABEL_27;
    }
    assertions = self->_assertions;
    if (!assertions)
    {
      v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v9 = self->_assertions;
      self->_assertions = v8;

      assertions = self->_assertions;
    }
    -[NSMutableSet addObject:](assertions, "addObject:", v6);
    v10 = -[NSCountedSet countForObject:](self->_server->_assertions, "countForObject:", v6);
    v11 = self->_server->_assertions;
    if (!v11)
    {
      v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
      server = self->_server;
      v14 = server->_assertions;
      server->_assertions = v12;

      v11 = self->_server->_assertions;
    }
    -[NSCountedSet addObject:](v11, "addObject:", v6);
    if (dword_1007B21C0 <= 30
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection activateAssertionWithIdentifier:]", 30, "Activate assertion '%@': %ld -> %ld\n", v6, v10, v10 + 1);
    }
    if (v10)
      goto LABEL_27;
    if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.sharing.PreventAppleCardActivation")))
    {
      byte_1007D7F3C = 1;
      goto LABEL_27;
    }
    if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.sharing.DuetSync")))
    {
      byte_1007D7F3D = 1;
    }
    else
    {
      if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.sharing.PreventContinuityKeyboard")))
      {
        -[SDAutoFillAgent setPreventNotifications:](self->_server->_autoFillAgent, "setPreventNotifications:", 1);
        -[SDRemoteInteractionAgent setPreventNotifications:](self->_server->_riAgent, "setPreventNotifications:", 1);
        goto LABEL_27;
      }
      if (!objc_msgSend(v6, "isEqual:", CFSTR("com.apple.sharing.PreventNearbyActionAdvertising")))
      {
        if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.sharing.PreventProxCards")))
        {
          gSDProxCardsSuppressed = 1;
          goto LABEL_27;
        }
        if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.sharing.PreventRepair")))
        {
          -[SDSetupAgent setPreventRepair:](self->_server->_setupAgent, "setPreventRepair:", 1);
          goto LABEL_27;
        }
        if (!objc_msgSend(v6, "isEqual:", CFSTR("com.apple.sharing.EnhancedDiscovery")))
        {
          if (dword_1007B21C0 <= 30
            && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
          {
            LogPrintF(&dword_1007B21C0, "-[SDXPCConnection activateAssertionWithIdentifier:]", 30, "Ignoring add unknown assertion '%@'\n", v6);
          }
          goto LABEL_27;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
        objc_msgSend(v15, "setEnhancedDiscovery:", 1);
        goto LABEL_24;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      objc_msgSend(v16, "setPreventNearbyActionAdvertising:", 1);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    objc_msgSend(v15, "update");
LABEL_24:

    goto LABEL_27;
  }
LABEL_28:

}

- (void)_invalidateAssertions
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_assertions;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = -[NSCountedSet countForObject:](self->_server->_assertions, "countForObject:", v8);
        -[NSCountedSet removeObject:](self->_server->_assertions, "removeObject:", v8);
        if (dword_1007B21C0 <= 30
          && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
        {
          LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _invalidateAssertions]", 30, "Invalidate assertion '%@': %ld -> %ld\n", v8, v9, v9 - 1);
        }
        if (v9 == 1)
        {
          if (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.sharing.PreventAppleCardActivation")))
          {
            byte_1007D7F3C = 0;
            goto LABEL_21;
          }
          if (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.sharing.DuetSync")))
          {
            byte_1007D7F3D = 0;
            goto LABEL_19;
          }
          if (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.sharing.PreventContinuityKeyboard")))
          {
            -[SDAutoFillAgent setPreventNotifications:](self->_server->_autoFillAgent, "setPreventNotifications:", 0);
            -[SDRemoteInteractionAgent setPreventNotifications:](self->_server->_riAgent, "setPreventNotifications:", 0);
            goto LABEL_21;
          }
          if (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.sharing.PreventNearbyActionAdvertising")))
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
            objc_msgSend(v10, "setPreventNearbyActionAdvertising:", 0);

LABEL_19:
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
            objc_msgSend(v11, "update");
LABEL_20:

            goto LABEL_21;
          }
          if (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.sharing.PreventProxCards")))
          {
            gSDProxCardsSuppressed = 0;
          }
          else if (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.sharing.PreventRepair")))
          {
            -[SDSetupAgent setPreventRepair:](self->_server->_setupAgent, "setPreventRepair:", 0);
          }
          else
          {
            if (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.sharing.EnhancedDiscovery")))
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
              objc_msgSend(v11, "setEnhancedDiscovery:", 0);
              goto LABEL_20;
            }
            if (dword_1007B21C0 <= 30
              && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
            {
              LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _invalidateAssertions]", 30, "Ignoring remove unknown assertion '%@'\n", v8);
            }
          }
        }
LABEL_21:
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = v12;
    }
    while (v12);
  }

  -[NSMutableSet removeAllObjects](self->_assertions, "removeAllObjects");
}

- (void)activityStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v4 = (void (**)(id, _QWORD, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v5 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("ActivityState"));
  if ((_DWORD)v5)
  {
    if (v4)
    {
      v6 = (int)v5;
      v13 = NSLocalizedDescriptionKey;
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v5, 0, 0));
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)v8;
      v10 = CFSTR("?");
      if (v8)
        v10 = (const __CFString *)v8;
      v14 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v6, v11));
      v4[2](v4, 0, v12);

    }
  }
  else
  {
    -[SDNearbyAgent activityStateWithCompletion:](self->_server->_nearbyAgent, "activityStateWithCompletion:", v4);
  }

}

- (void)accountForAppleID:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v7)
  {
    v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("AppleIDAuth"));
    if ((_DWORD)v8)
    {
      v10 = v8;
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent accountForAppleID:](self->_server->_appleIDAgent, "accountForAppleID:", v6));
      if (v8)
      {
        v9 = (void *)v8;
        sub_100139C5C(v8);
        v7[2](v7, v9, 0);
LABEL_5:

        goto LABEL_6;
      }
      v10 = 201202;
    }
    sub_100139C5C(v8);
    v11 = (int)v10;
    v17 = NSLocalizedDescriptionKey;
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v10, 0, 0));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v9 = (void *)v13;
    v14 = CFSTR("?");
    if (v13)
      v14 = (const __CFString *)v13;
    v18 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v11, v15));
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v16);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)appleIDInfoWithCompletion:(id)a3
{
  void (**v4)(id, void *, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v4 = (void (**)(id, void *, uint64_t, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v6 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("AppleIDInfo"));
  if ((_DWORD)v6)
  {
    v8 = 0;
    v10 = 0;
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "myAppleID"));
    if (!v7)
    {
      if (dword_1007B21C0 > 60)
      {
        v8 = 0;
        v10 = 0;
      }
      else if (dword_1007B21C0 == -1)
      {
        v8 = 0;
        if (!_LogCategory_Initialize(&dword_1007B21C0, 60))
        {
          v6 = 4294960569;
          v10 = 0;
          goto LABEL_22;
        }
        v10 = 0;
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection appleIDInfoWithCompletion:]", 60, "### No appleID?\n");
      }
      else
      {
        v8 = 0;
        v10 = 0;
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection appleIDInfoWithCompletion:]", 60, "### No appleID?\n");
      }
LABEL_21:
      v6 = 4294960569;
      goto LABEL_22;
    }
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "myAppleIDValidationRecord"));
    v10 = v9;
    if (v9)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppleIDAccountValidationRecordData")));
      if (v11)
      {
        v12 = (void *)v11;
        if (v4)
          v4[2](v4, v8, v11, 0);
        goto LABEL_7;
      }
      if (dword_1007B21C0 <= 60
        && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
      {
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection appleIDInfoWithCompletion:]", 60, "### No record data?\n");
      }
      goto LABEL_21;
    }
    v6 = 4294960534;
  }
LABEL_22:
  if (v4)
  {
    v13 = (int)v6;
    v20 = NSLocalizedDescriptionKey;
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v6, 0, 0));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)v15;
    v17 = CFSTR("?");
    if (v15)
      v17 = (const __CFString *)v15;
    v21 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v13, v18));
    ((void (**)(id, void *, uint64_t, void *))v4)[2](v4, 0, 0, v19);

  }
  v12 = 0;
LABEL_7:

}

- (void)subCredentialPresentCardWithParams:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v7 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("subCredentialPresentCard"));
  if (!(_DWORD)v7)
  {
    if (dword_1007B21C0 <= 50
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 50)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection subCredentialPresentCardWithParams:completion:]", 50, "Client requesting subcredential presentation\n");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDSubCredentialAgent sharedAgent](SDSubCredentialAgent, "sharedAgent"));
    objc_msgSend(v8, "uiPresentWithParamsDirect:completion:", v11, v6);

  }
  if (v6)
  {
    v9 = NSErrorWithOSStatusF(v7, "Missing entitlement");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v6[2](v6, v10);

  }
}

- (void)broadwayPresentCardWithCode:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v10 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("BroadwayPresentCard"));
  if (!(_DWORD)v10)
  {
    if (dword_1007B21C0 <= 50
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 50)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection broadwayPresentCardWithCode:options:completion:]", 50, "Client requesting broadway presentation\n");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDBroadwayAgent sharedAgent](SDBroadwayAgent, "sharedAgent"));
    objc_msgSend(v11, "preparePresentationWithBroadwayActivationCode:testInfo:", v14, v8);

  }
  if (v9)
  {
    v12 = NSErrorWithOSStatusF(v10, "Missing entitlement");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v9[2](v9, v13);

  }
}

- (void)clearXPCHelperImageCacheWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  +[SDXPCHelperImageCache clearCacheWithSync:](_TtC16DaemoniOSLibrary21SDXPCHelperImageCache, "clearCacheWithSync:", 1);
  v3[2](v3, 0);

}

- (void)contactIDForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v12 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("ContactIDForHashes"));
  if ((_DWORD)v12)
  {
    v13 = 0;
    v15 = 0;
    v16 = 0;
    if (!v10)
      goto LABEL_13;
LABEL_7:
    if (!(_DWORD)v12)
    {
      v10[2](v10, v16, 0);
      goto LABEL_13;
    }
    v24 = v8;
    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contactsForEmailHash:phoneHash:", v8, v9));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contactWithPreferredIdentifierForContacts:", v13));
  if (v14)
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    if (v16)
      v12 = 0;
    else
      v12 = 4294960554;
    if (!v10)
      goto LABEL_13;
    goto LABEL_7;
  }
  if (!v10)
  {
    v16 = 0;
    v15 = 0;
    goto LABEL_13;
  }
  v24 = v8;
  v15 = 0;
  v16 = 0;
  v12 = 4294960569;
LABEL_9:
  v17 = (int)v12;
  v25 = NSLocalizedDescriptionKey;
  v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v12, 0, 0));
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)v19;
  v21 = CFSTR("?");
  if (v19)
    v21 = (const __CFString *)v19;
  v26 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v17, v22));
  ((void (**)(id, void *, void *))v10)[2](v10, v16, v23);

  v8 = v24;
LABEL_13:

}

- (void)displayNameForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v12 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("DisplayNameForHashes"));
  if ((_DWORD)v12)
  {
    v13 = 0;
    v16 = 0;
    v15 = 0;
    if (!v10)
      goto LABEL_5;
    goto LABEL_10;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contactsForEmailHash:phoneHash:", v8, v9));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contactWithPreferredIdentifierForContacts:", v13));
  if (!v14)
  {
    if (!v10)
    {
LABEL_13:
      v16 = 0;
      v15 = 0;
      goto LABEL_5;
    }
    v12 = 4294960569;
LABEL_10:
    v17 = (int)v12;
    v24 = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v12, 0, 0));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)v19;
    v21 = CFSTR("?");
    if (v19)
      v21 = (const __CFString *)v19;
    v25 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v17, v22));
    v10[2](v10, 0, v23);

    goto LABEL_13;
  }
  v15 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v14, 0));
  if (v10)
    ((void (**)(id, void *, void *))v10)[2](v10, v16, 0);
LABEL_5:

}

- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "meCard"));

  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v13 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("DisplayNameForHashes"));
  if ((_DWORD)v13)
  {
    v15 = 0;
    v22 = 0;
    if (!v10)
      goto LABEL_21;
    goto LABEL_16;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v15 = objc_msgSend(v8, "isEqual:", v14);

  if ((_DWORD)v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceForBluetoothDeviceID:conflictDetected:](self->_server->_nearbyAgent, "idsDeviceForBluetoothDeviceID:conflictDetected:", v9, 0));
    v17 = v16;
    if (v16)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
    }
    else
    {
      if (dword_1007B21C0 <= 60
        && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
      {
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection displayStringForContactIdentifier:deviceIdentifier:completion:]", 60, "### No IDS device found for ID %@\n", v9);
      }
      v18 = objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v12, 0));
    }
    v22 = (void *)v18;
  }
  else
  {
    v17 = objc_alloc_init((Class)CNContactStore);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
    v33 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "unifiedContactWithIdentifier:keysToFetch:error:", v8, v20, 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v21, 0));

  }
  if (v22)
    v13 = 0;
  else
    v13 = 4294960569;
  if (v10)
  {
LABEL_16:
    if ((_DWORD)v13)
    {
      v23 = (int)v13;
      v30 = v9;
      v31 = NSLocalizedDescriptionKey;
      v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v13, 0, 0));
      v25 = objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)v25;
      v27 = CFSTR("?");
      if (v25)
        v27 = (const __CFString *)v25;
      v32 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v23, v28));
      v10[2](v10, v22, v15, v29);

      v9 = v30;
    }
    else
    {
      v10[2](v10, v22, v15, 0);
    }
  }
LABEL_21:

}

- (void)myAccountWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  v4 = (void (**)(id, void *, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v4)
  {
    v5 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("AppleIDAuth"));
    if ((_DWORD)v5)
    {
      v7 = v5;
    }
    else
    {
      v5 = objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent myAccount](self->_server->_appleIDAgent, "myAccount"));
      if (v5)
      {
        v6 = (void *)v5;
        sub_100139C5C(v5);
        v4[2](v4, v6, 0);
LABEL_5:

        goto LABEL_6;
      }
      v7 = 201202;
    }
    sub_100139C5C(v5);
    v8 = (int)v7;
    v14 = NSLocalizedDescriptionKey;
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v7, 0, 0));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v6 = (void *)v10;
    v11 = CFSTR("?");
    if (v10)
      v11 = (const __CFString *)v10;
    v15 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v8, v12));
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v13);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *contactsQueue;
  dispatch_queue_t v14;
  SDXPCServer *server;
  OS_dispatch_queue *v16;
  _QWORD block[4];
  id v18;
  void (**v19)(id, _QWORD, void *);
  BOOL v20;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v10 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("FindContact"));
  if ((_DWORD)v10)
  {
    v11 = NSErrorWithOSStatusF(v10, "Missing entitlement");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v9[2](v9, 0, v12);

  }
  else
  {
    contactsQueue = self->_server->_contactsQueue;
    if (!contactsQueue)
    {
      v14 = dispatch_queue_create("SharingFindContact", 0);
      server = self->_server;
      v16 = server->_contactsQueue;
      server->_contactsQueue = (OS_dispatch_queue *)v14;

      contactsQueue = self->_server->_contactsQueue;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10013ACD4;
    block[3] = &unk_100718420;
    v18 = v8;
    v20 = a4;
    v19 = v9;
    dispatch_async(contactsQueue, block);

  }
}

- (void)getDeviceAssets:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint32_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint32_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10013B7B0;
  v29 = sub_10013B7C0;
  v30 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10013B7C8;
  v22[3] = &unk_100718448;
  v24 = &v25;
  v7 = a4;
  v23 = v7;
  v8 = objc_retainBlock(v22);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (-[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Session"), &self->_entitledClient, CFSTR("GetDeviceAssets")))
  {
    v18 = NSErrorF(NSOSStatusErrorDomain, 4294896128, "Missing entitlement: '%@'", CFSTR("com.apple.sharing.Session"));
    v13 = objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_7;
  }
  v9 = arc4random();
  v10 = objc_msgSend(v6, "bluetoothProductID");
  if (!v10)
  {
    v12 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "No productID");
    v13 = objc_claimAutoreleasedReturnValue(v12);
LABEL_7:
    v14 = (id)v26[5];
    v26[5] = v13;
    goto LABEL_10;
  }
  v11 = objc_msgSend(v6, "colorCode");
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection getDeviceAssets:completion:]", 30, "GetDeviceAssets start: XID 0x%X, ProductID 0x%X, ColorCode %u\n", v9, v10, v11);
  v14 = objc_msgSend(objc_alloc((Class)SFDeviceAssetQuery), "initWithBluetoothProductIdentifier:color:", v10, v11);
  v15 = objc_alloc_init((Class)SFDeviceAssetManager);
  objc_msgSend(v15, "setDispatchQueue:", self->_server->_dispatchQueue);
  v16 = objc_alloc((Class)SFDeviceAssetRequestConfiguration);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10013B888;
  v19[3] = &unk_100718470;
  v21 = v9;
  v20 = v7;
  v17 = objc_msgSend(v16, "initWithQueryResultHandler:", v19);
  objc_msgSend(v6, "timeoutSeconds");
  objc_msgSend(v17, "setTimeout:");
  objc_msgSend(v15, "activate");
  objc_msgSend(v15, "getAssetBundleForDeviceQuery:withRequestConfiguration:", v14, v17);

LABEL_10:
  ((void (*)(_QWORD *))v8[2])(v8);

  _Block_object_dispose(&v25, 8);
}

- (void)getPeopleSuggestions:(id)a3 completion:(id)a4
{
  id v6;
  void **v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id (*v12)(uint64_t);
  void ***v13;
  unsigned int v14;
  unsigned int v15;
  const char *v16;
  void **v17;
  id v18;
  void **v19;
  void **v20;

  v6 = a3;
  v7 = (void **)a4;
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = dispatch_queue_create("SharingGetPeopleSuggestions", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactIDs"));
  if (v11)
  {
    v20 = _NSConcreteStackBlock;
    v12 = sub_10013BBBC;
    v13 = &v20;
  }
  else
  {
    if (dword_1007B21C0 <= 30
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    {
      v14 = objc_msgSend(v6, "maxPeople");
      v15 = objc_msgSend(v6, "excludeBackfills");
      v16 = "NO";
      if (v15)
        v16 = "YES";
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection getPeopleSuggestions:completion:]", 30, "GetPeopleSuggestions start: max %d, excludeBackfills %s\n", v14, v16);
    }
    v19 = _NSConcreteStackBlock;
    v12 = sub_10013BBCC;
    v13 = &v19;
  }
  v13[1] = (void **)3221225472;
  v13[2] = (void **)v12;
  v13[3] = (void **)&unk_100714F68;
  v13[4] = (void **)&self->super.isa;
  v13[5] = (void **)v6;
  v13[6] = v7;
  v17 = v7;
  v18 = v6;
  dispatch_async(v10, v13);

}

- (void)_getPeopleInfo:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  char *v14;
  void *i;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  unsigned int v27;
  id v28;
  void *v29;
  char *v30;
  void *v31;
  void (**v32)(id, id, _QWORD);
  int v33;
  int v34;
  id obj;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  int v40;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _QWORD v53[3];

  v32 = (void (**)(id, id, _QWORD))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contactIDs"));
  v6 = objc_msgSend(v5, "count");
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _getPeopleInfo:completion:]", 30, "GetPeopleInfo start: contacts %d\n", (_DWORD)v6);
  if (v6)
  {
    v53[0] = CNContactEmailAddressesKey;
    v53[1] = CNContactInstantMessageAddressesKey;
    v53[2] = CNContactPhoneNumbersKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 3));
    v8 = objc_alloc_init((Class)CNContactStore);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v5));
    v50 = 0;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v7, &v50));
    v11 = v50;
    v12 = v11;
    v38 = (void *)v10;
    if ((!v10 || v11)
      && dword_1007B21C0 <= 90
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 90)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _getPeopleInfo:completion:]", 90, "### GetPeopleInfo failed: contacts, %{error}\n", v12);
    }

  }
  else
  {
    v38 = 0;
  }
  v36 = objc_alloc_init((Class)NSMutableArray);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v39)
  {
    v13 = 0;
    v40 = 0;
    v14 = 0;
    v37 = *(_QWORD *)v47;
    v33 = (int)v6;
    v34 = 0;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        v41 = v13;
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v17 = v38;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v43;
LABEL_21:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v43 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
            v24 = objc_msgSend(v23, "isEqual:", v16);

            if ((v24 & 1) != 0)
              break;
            if (v19 == (id)++v21)
            {
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
              if (v19)
                goto LABEL_21;
              goto LABEL_27;
            }
          }
          v25 = v22;

          if (!v25)
            goto LABEL_32;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v27 = objc_msgSend(v26, "contactIsBlocked:", v25);

          if (v27)
          {
            v28 = objc_alloc_init((Class)SFPeopleSuggesterResult);
            objc_msgSend(v28, "setContactID:", v16);
            objc_msgSend(v28, "setFlags:", 1);
            objc_msgSend(v36, "addObject:", v28);
            ++v34;

          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "emailAddresses"));
          v30 = &v14[(_QWORD)objc_msgSend(v29, "count")];

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "phoneNumbers"));
          v14 = (char *)objc_msgSend(v31, "count") + (_QWORD)v30;

        }
        else
        {
LABEL_27:

LABEL_32:
          v25 = objc_alloc_init((Class)SFPeopleSuggesterResult);
          objc_msgSend(v25, "setContactID:", v16);
          objc_msgSend(v25, "setFlags:", 2);
          objc_msgSend(v36, "addObject:", v25);
          ++v40;
        }

        v13 = v41 + 1;
        if (__ROR8__(0x8F5C28F5C28F5C29 * (_QWORD)v14, 2) <= 0x28F5C28F5C28F5CuLL
          && dword_1007B21C0 <= 30
          && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
        {
          LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _getPeopleInfo:completion:]", 30, "GetPeopleInfo progress: %d of %d, handles %d, blocked %d, notFound %d\n", v13, v33, (_DWORD)v14, v34, v40);
        }
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v39);
  }
  else
  {
    v34 = 0;
    v40 = 0;
  }

  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _getPeopleInfo:completion:]", 30, "GetPeopleInfo: requested %d, blocked %d, not found %d\n", objc_msgSend(obj, "count"), v34, v40);
  v32[2](v32, v36, 0);

}

- (void)_getPeopleSuggestions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id obj;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v5 = a3;
  v28 = a4;
  v6 = objc_alloc_init((Class)_PSSuggesterConfiguration);
  if (objc_msgSend(v5, "excludeBackfills"))
    objc_msgSend(v6, "setExcludeBackfillSuggestions:", 1);
  v29 = v5;
  v7 = objc_msgSend(v5, "maxPeople");
  if (v7)
    v8 = 2 * v7;
  else
    v8 = 100;
  objc_msgSend(v6, "setMaximumNumberOfSuggestions:", v8);
  v27 = v6;
  v9 = objc_msgSend(objc_alloc((Class)_PSSuggester), "initWithConfiguration:", v6);
  v25 = objc_alloc_init((Class)_PSPredictionContext);
  v26 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rankedGlobalSuggestionsFromContext:contactsOnly:"));
  v11 = objc_alloc_init((Class)NSMutableSet);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v12)
  {
    v13 = v12;
    v31 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recipients"));
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(_QWORD *)v35 != v19)
                objc_enumerationMutation(v16);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1)
                                                                                 + 8 * (_QWORD)j), "identifier"));
              if ((objc_msgSend(v11, "containsObject:", v21) & 1) == 0)
              {
                objc_msgSend(v11, "addObject:", v21);
                if (v7)
                {
                  if ((unint64_t)objc_msgSend(v11, "count") >= v7)
                  {

                    goto LABEL_23;
                  }
                }
              }

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v18)
              continue;
            break;
          }
        }
LABEL_23:

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v13);
  }

  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _getPeopleSuggestions:completion:]", 30, "GetPeopleSuggestions from CoreDuet finish: max %d, suggestions %d, results %d\n", v7, objc_msgSend(obj, "count"), objc_msgSend(v11, "count"));
  if (objc_msgSend(v11, "count"))
  {
    v22 = v29;
    if (dword_1007B21C0 <= 30
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _getPeopleSuggestions:completion:]", 30, "PeopleSuggestions: narrowing CD suggestions based on 1000 recent interactions");
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10013C5C8;
    v32[3] = &unk_100718498;
    v33 = v28;
    -[SDXPCConnection _getInteractionsFromDBPerPeopleSuggestion:completion:](self, "_getInteractionsFromDBPerPeopleSuggestion:completion:", v23, v32);

  }
  else
  {
    v22 = v29;
    if (dword_1007B21C0 <= 90
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 90)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _getPeopleSuggestions:completion:]", 90, "### GetPeopleSuggestions from CoreDuet had no results, skipping interaction DB query + exiting early");
    }
    (*((void (**)(id, void *, _QWORD))v28 + 2))(v28, &__NSArray0__struct, 0);
  }

}

- (void)_getInteractionsFromDBPerPeopleSuggestion:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void (**v64)(id, void *, _QWORD);
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  id obj;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  _BYTE v91[128];
  _QWORD v92[3];
  _BYTE v93[128];
  _BYTE v94[128];
  void *v95;

  v5 = a3;
  v64 = (void (**)(id, void *, _QWORD))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore defaultDatabaseDirectory](_CDInteractionStore, "defaultDatabaseDirectory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore storeWithDirectory:readOnly:](_CDInteractionStore, "storeWithDirectory:readOnly:", v6, 1));

  v67 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("direction == %i"), 1));
  v10 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("sender.personId != nil")));
  v11 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY recipients.personId IN %@"), v5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", 28800.0));
  v14 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate < %@"), v13));

  v61 = (void *)v9;
  objc_msgSend(v8, "addObject:", v9);
  v60 = (void *)v10;
  objc_msgSend(v8, "addObject:", v10);
  v59 = (void *)v11;
  objc_msgSend(v8, "addObject:", v11);
  v58 = (void *)v14;
  objc_msgSend(v8, "addObject:", v14);
  v62 = v8;
  v15 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v8));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
  v95 = v56;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v95, 1));
  v90 = 0;
  v63 = v7;
  v57 = (void *)v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v15, v16, 1000, &v90));
  v55 = v90;

  v18 = objc_alloc_init((Class)NSMutableDictionary);
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v17;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
  if (v73)
  {
    v71 = *(_QWORD *)v87;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v87 != v71)
          objc_enumerationMutation(obj);
        v75 = v19;
        v20 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v19);
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "recipients"));
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v83;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(_QWORD *)v83 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "personId"));
              v28 = objc_msgSend(v5, "containsObject:", v27);

              if (v28)
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sender"));
                v30 = v29;
                if (v29)
                {
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
                  if (v31)
                    objc_msgSend(v18, "setObject:forKey:", v31, v26);

                }
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
          }
          while (v23);
        }

        v19 = v75 + 1;
      }
      while ((id)(v75 + 1) != v73);
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    }
    while (v73);
  }

  v32 = objc_alloc_init((Class)CNContactStore);
  v92[0] = CNContactEmailAddressesKey;
  v92[1] = CNContactInstantMessageAddressesKey;
  v92[2] = CNContactPhoneNumbersKey;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 3));
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v33 = v18;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (v34)
  {
    v35 = v34;
    v65 = v32;
    v66 = 0;
    v68 = v33;
    v69 = 0;
    v76 = *(_QWORD *)v79;
    v36 = v67;
    while (1)
    {
      v37 = 0;
      v74 = v35;
      do
      {
        if (*(_QWORD *)v79 != v76)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
        v40 = objc_msgSend(v38, "type");
        if (v40 == (id)3)
        {
          objc_msgSend(v39, "rangeOfString:", CFSTR("@"));
          if (!v43)
          {
            v42 = v39;
            goto LABEL_32;
          }
LABEL_31:
          v44 = SFNormalizeEmailAddress(v39, 1);
          v42 = (id)objc_claimAutoreleasedReturnValue(v44);
          goto LABEL_32;
        }
        if (v40 == (id)2)
          goto LABEL_31;
        if (v40 != (id)1)
        {
          v45 = 0;
          goto LABEL_34;
        }
        v41 = SFNormalizePhoneNumber(v39);
        v42 = (id)objc_claimAutoreleasedReturnValue(v41);
LABEL_32:
        v45 = v42;
LABEL_34:
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "personId"));
        v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v38));
        v48 = (void *)v47;
        if (v45)
        {
          if (v46 && v47 != 0)
          {
            if (dword_1007B21C0 <= 40
              && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 40)))
            {
              LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _getInteractionsFromDBPerPeopleSuggestion:completion:]", 40, "hybridSuggester: ContactID %@, Handle %@ <-> SKA %@", v46, v45, v48);
            }
            v50 = objc_alloc_init((Class)SFPeopleSuggesterResult);
            objc_msgSend(v50, "setContactID:", v46);
            v77 = 0;
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "unifiedContactWithIdentifier:keysToFetch:error:", v46, v72, &v77));
            if (!v51 || v77)
            {
              objc_msgSend(v50, "setFlags:", 2);
              ++v69;
            }
            else
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
              v53 = objc_msgSend(v52, "contactIsBlocked:", v51);

              if (v53)
              {
                objc_msgSend(v50, "setFlags:", 1);
                ++v66;
              }
              else
              {
                v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v45));
                objc_msgSend(v50, "setHandles:", v54);

                objc_msgSend(v50, "setSendersKnownAlias:", v48);
              }
              v36 = v67;
              v32 = v65;
            }
            objc_msgSend(v36, "addObject:", v50);

            v33 = v68;
            v35 = v74;
          }
        }

        v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
      if (!v35)
        goto LABEL_56;
    }
  }
  v66 = 0;
  v69 = 0;
  v36 = v67;
LABEL_56:

  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection _getInteractionsFromDBPerPeopleSuggestion:completion:]", 30, "hybridSuggester: calling completion on %zu total results, %zu removed, %zu blocked", (size_t)objc_msgSend(v36, "count"), v69, v66);
  v64[2](v64, v36, 0);

}

- (void)getPairedWatchWristStateWithCompletionHandler:(id)a3
{
  NSObject *dispatchQueue;
  void (**v4)(id, id);
  id v5;

  dispatchQueue = self->_server->_dispatchQueue;
  v4 = (void (**)(id, id))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4[2](v4, objc_msgSend(v5, "pairedWatchWristState"));

}

- (void)beginMonitoringPairedWatchWristState
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 40 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 40)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection beginMonitoringPairedWatchWristState]", 40, "Began monitoring for wrist state changes");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handlePairedWatchWristStateChanged", CFSTR("com.apple.sharingd.PairedWatchWristStateChanged"), 0);

}

- (void)_handlePairedWatchWristStateChanged
{
  void *v2;
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcCnx, "remoteObjectProxyWithErrorHandler:", &stru_1007184B8));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v3 = objc_msgSend(v2, "pairedWatchWristState");

  objc_msgSend(v4, "pairedWatchWristStateChanged:", v3);
}

- (void)getProblemFlagsWithCompletionHandler:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v4 = -[SDSetupAgent problemFlags](self->_server->_setupAgent, "problemFlags");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, unint64_t, _QWORD))v6 + 2))(v6, v4, 0);
    v5 = v6;
  }

}

- (void)hashManagerControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v7)
  {
    v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("HashManagerControl"));
    if ((_DWORD)v8)
    {
      v25 = NSErrorWithOSStatusF(v8, "Missing entitlement");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v23 = 0;
      v10 = 0;
      goto LABEL_16;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cmd")));
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("hmrebuild")))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager shared](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "shared"));
        objc_msgSend(v11, "rebuildDB");

        v12 = 0;
LABEL_15:
        v23 = 0;
        goto LABEL_16;
      }
      v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("hmdump"));
      if ((_DWORD)v13)
      {
        v14 = NSTemporaryDirectory();
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("airdrop-hash-db.txt")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager shared](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "shared"));
          v19 = objc_msgSend(v18, "dumpDBAtFileURL:", v17);

          if ((v19 & 1) != 0)
          {
            v27 = CFSTR("filePath");
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
            v21 = (void *)v20;
            v22 = CFSTR("<unknown>");
            if (v20)
              v22 = (const __CFString *)v20;
            v28 = v22;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));

            v12 = 0;
            goto LABEL_12;
          }
          v26 = NSErrorWithOSStatusF(0, "Failed to perform hash database dump");
        }
        else
        {
          v26 = NSErrorWithOSStatusF(0, "Failed to create destination URL");
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v23 = 0;
LABEL_12:

LABEL_16:
        v7[2](v7, v23, v12);

        goto LABEL_17;
      }
      v24 = NSErrorWithOSStatusF(v13, "Unknown command");
    }
    else
    {
      v24 = NSErrorWithOSStatusF(0, "Missing command");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_15;
  }
LABEL_17:

}

- (void)openSetupURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("OpenSetupURL"));
  if ((_DWORD)v8)
  {
    if (v7)
    {
      v9 = (int)v8;
      v16 = NSLocalizedDescriptionKey;
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v8, 0, 0));
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)v11;
      v13 = CFSTR("?");
      if (v11)
        v13 = (const __CFString *)v11;
      v17 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v9, v14));
      v7[2](v7, v15);

    }
  }
  else
  {
    -[SDSetupAgent openSetupURL:](self->_server->_setupAgent, "openSetupURL:", v6);
    if (v7)
      v7[2](v7, 0);
  }

}

- (void)preheatXPCConnection
{
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection preheatXPCConnection]", 30, "preheatXPCConnection\n");
}

- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v7)
  {
    v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("AppleIDAuth"));
    if ((_DWORD)v8)
    {
      v9 = v8;
      sub_100139C5C(v8);
      v10 = (int)v9;
      v17 = NSLocalizedDescriptionKey;
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v9, 0, 0));
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      v14 = CFSTR("?");
      if (v12)
        v14 = (const __CFString *)v12;
      v18 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v10, v15));
      v7[2](v7, 0, v16);

    }
    else
    {
      -[SDAppleIDAgent personInfoWithEmailOrPhone:completion:](self->_server->_appleIDAgent, "personInfoWithEmailOrPhone:completion:", v6, v7);
    }
  }

}

- (void)preventExitForLocaleReason:(id)a3
{
  void *v5;
  void *v6;
  NSString **p_preventExitForLocaleReason;
  NSString *preventExitForLocaleReason;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (-[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("PreventExitForLocale")))
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v6 = v5;
    preventExitForLocaleReason = self->_preventExitForLocaleReason;
    p_preventExitForLocaleReason = &self->_preventExitForLocaleReason;
    if (preventExitForLocaleReason)
      objc_msgSend(v5, "removePreventExitForLocaleReason:");
    objc_storeStrong((id *)p_preventExitForLocaleReason, a3);
    if (v9)
      objc_msgSend(v6, "addPreventExitForLocaleReason:", v9);
  }

}

- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v4 = a3;
  v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v7 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("ReenableProxCardType"));
  if ((_DWORD)v7)
  {
LABEL_5:
    if (!v6)
      goto LABEL_63;
    goto LABEL_6;
  }
  if (-[SDSetupAgent reenableProxCardType:](self->_server->_setupAgent, "reenableProxCardType:", v4)
    || -[SDProximityPairingAgent reenableProxCardType:](self->_server->_ppAgent, "reenableProxCardType:", v4))
  {
    v7 = 0;
    goto LABEL_5;
  }
  if (dword_1007B21C0 <= 60 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
  {
    if ((int)v4 > 99)
    {
      switch((_DWORD)v4)
      {
        case 'd':
          v15 = "B238SetupAfterWiFi";
          break;
        case 'e':
          v15 = "B389SetupFromFindMy";
          break;
        case 'f':
          v15 = "B389SetupDone";
          break;
        default:
LABEL_60:
          v15 = "?";
          break;
      }
    }
    else
    {
      v15 = "Unspecified";
      switch((int)v4)
      {
        case 0:
          break;
        case 1:
          v15 = "ATVSetup";
          break;
        case 4:
          v15 = "MobileBackup";
          break;
        case 5:
          v15 = "WatchSetup";
          break;
        case 6:
          v15 = "ATVPair";
          break;
        case 7:
          v15 = "InternetRelay";
          break;
        case 8:
          v15 = "WiFiPassword";
          break;
        case 9:
          v15 = "iOSSetup";
          break;
        case 10:
          v15 = "Repair";
          break;
        case 11:
          v15 = "LegacyHomePodSetup";
          break;
        case 12:
          v15 = "ApplePay";
          break;
        case 13:
          v15 = "WHASetup";
          break;
        case 14:
          v15 = "DevToolsPair";
          break;
        case 17:
          v15 = "DDPing";
          break;
        case 18:
          v15 = "DDPong";
          break;
        case 19:
          v15 = "RemoteAutoFill";
          break;
        case 20:
          v15 = "CompanionLinkProx";
          break;
        case 21:
          v15 = "RemoteManagement";
          break;
        case 22:
          v15 = "RemoteAutoFillPong";
          break;
        case 24:
          v15 = "AccessorySetup";
          break;
        case 25:
          v15 = "TVLS";
          break;
        case 27:
          v15 = "ShareAudio";
          break;
        case 28:
          v15 = "AppSignIn";
          break;
        case 29:
          v15 = "Fitness";
          break;
        case 30:
          v15 = "TVCCS";
          break;
        case 31:
          v15 = "TVSA";
          break;
        case 32:
          v15 = "AuthenticateAccounts";
          break;
        case 33:
          v15 = "HomePodSetup";
          break;
        case 34:
          v15 = "CompanionAuthentication";
          break;
        case 36:
          v15 = "dovePeace";
          break;
        case 43:
          v15 = "AuthenticateAccountsV2";
          break;
        case 50:
          v15 = "NeedsRDLink";
          break;
        case 51:
          v15 = "NeedsCLink";
          break;
        case 52:
          v15 = "Goodbye";
          break;
        case 53:
          v15 = "PointToShare";
          break;
        case 55:
          v15 = "AUAction";
          break;
        case 56:
          v15 = "AcceptedInvitations";
          break;
        case 84:
          v15 = "HasInvitations";
          break;
        default:
          goto LABEL_60;
      }
    }
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection reenableProxCardType:completion:]", 60, "Ignored re-enable of unsupported prox card type %s\n", v15);
  }
  v7 = 4294960561;
  if (v6)
  {
LABEL_6:
    if ((_DWORD)v7)
    {
      v8 = (int)v7;
      v16 = NSLocalizedDescriptionKey;
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v7, 0, 0));
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)v10;
      v12 = CFSTR("?");
      if (v10)
        v12 = (const __CFString *)v10;
      v17 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v8, v13));
      v6[2](v6, v14);

    }
    else
    {
      v6[2](v6, 0);
    }
  }
LABEL_63:

}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6;
  void (**v8)(id, uint64_t);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v6 = *(_QWORD *)&a4;
  v13 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v9 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("RepairDevice"));
  if ((_DWORD)v9)
  {
    v11 = NSErrorWithOSStatusF(v9, "Missing entitlement '%@' for RepairDevice", CFSTR("com.apple.sharing.Client"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v10 = (void *)v12;
    if (v8 && v12)
      v8[2](v8, v12);
  }
  else
  {
    -[SDSetupAgent repairDevice:flags:completion:](self->_server->_setupAgent, "repairDevice:flags:completion:", v13, v6, v8);
    v10 = 0;
  }

}

- (void)requestWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("AppleIDAuth"));
  if ((_DWORD)v8)
  {
    if (v7)
    {
      v9 = v8;
      sub_100139C5C(v8);
      v10 = (int)v9;
      v17 = NSLocalizedDescriptionKey;
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v9, 0, 0));
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      v14 = CFSTR("?");
      if (v12)
        v14 = (const __CFString *)v12;
      v18 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v10, v15));
      v7[2](v7, 0, v16);

    }
  }
  else
  {
    -[SDAppleIDAgent requestWithInfo:completion:](self->_server->_appleIDAgent, "requestWithInfo:completion:", v6, v7);
  }

}

- (void)retriggerProximityPairing:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v5 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("RetriggerProximityPairing"));
  if ((_DWORD)v5)
  {
    if (v4)
    {
      v6 = (int)v5;
      v13 = NSLocalizedDescriptionKey;
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v5, 0, 0));
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)v8;
      v10 = CFSTR("?");
      if (v8)
        v10 = (const __CFString *)v8;
      v14 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v6, v11));
      v4[2](v4, v12);

    }
  }
  else
  {
    -[SDProximityPairingAgent retriggerProximityPairing:](self->_server->_ppAgent, "retriggerProximityPairing:", v4);
  }

}

- (void)retriggerProximitySetup:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v5 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("RetriggerProximitySetup"));
  if ((_DWORD)v5)
  {
    if (v4)
    {
      v6 = (int)v5;
      v13 = NSLocalizedDescriptionKey;
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v5, 0, 0));
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)v8;
      v10 = CFSTR("?");
      if (v8)
        v10 = (const __CFString *)v8;
      v14 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v6, v11));
      v4[2](v4, v12);

    }
  }
  else
  {
    -[SDSetupAgent retriggerProximitySetup:](self->_server->_setupAgent, "retriggerProximitySetup:", v4);
  }

}

- (void)setAudioRoutingScore:(int)a3 completion:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v4 = *(_QWORD *)&a3;
  v10 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v6 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("SetAudioRoutingScore"));
  if ((_DWORD)v6)
  {
    v7 = NSErrorWithOSStatusF(v6, "Missing entitlement '%@' for SetAudioRoutingScore", CFSTR("com.apple.sharing.Client"));
LABEL_6:
    v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10[2](v10, v9);

    goto LABEL_7;
  }
  if (v4 >= 0x10)
  {
    v7 = NSErrorWithOSStatusF(4294960591, "Out-of-range score: %d, min %d, max %d");
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  objc_msgSend(v8, "setAudioRoutingScore:", v4);

  v10[2](v10, 0);
LABEL_7:

}

- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v10 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("SetupDevice"));
  if ((_DWORD)v10)
  {
    v12 = NSErrorWithOSStatusF(v10, "Missing entitlement '%@' for SetupDevice", CFSTR("com.apple.sharing.Client"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v11 = (void *)v13;
    if (v9 && v13)
      v9[2](v9, v13);
  }
  else
  {
    -[SDSetupAgent setupDevice:homeIdentifier:completion:](self->_server->_setupAgent, "setupDevice:homeIdentifier:completion:", v14, v8, v9);
    v11 = 0;
  }

}

- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v7 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("ShowDevicePicker"));
  if ((_DWORD)v7)
  {
    v9 = NSErrorWithOSStatusF(v7, "Missing entitlement '%@' for ShowDevicePicker", CFSTR("com.apple.sharing.Client"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v8 = (void *)v10;
    if (v6 && v10)
      v6[2](v6, v10);
  }
  else
  {
    -[SDSetupAgent showDevicePickerWithInfo:completion:](self->_server->_setupAgent, "showDevicePickerWithInfo:completion:", v11, v6);
    v8 = 0;
  }

}

- (void)statusInfoWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v4 = (void (**)(id, _QWORD, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v5 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("AppleIDAuth"));
  if ((_DWORD)v5)
  {
    if (v4)
    {
      v8 = v5;
      sub_100139C5C(v5);
      v9 = (int)v8;
      v16 = NSLocalizedDescriptionKey;
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v8, 0, 0));
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)v11;
      v13 = CFSTR("?");
      if (v11)
        v13 = (const __CFString *)v11;
      v17 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v9, v14));
      v4[2](v4, 0, v15);

    }
    v7 = 0;
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent statusInfo](self->_server->_appleIDAgent, "statusInfo"));
    v7 = (void *)v6;
    if (v4)
    {
      sub_100139C5C(v6);
      ((void (**)(id, void *, void *))v4)[2](v4, v7, 0);
    }
  }

}

- (void)testContinuityKeyboardBegin:(BOOL)a3
{
  _BOOL4 v3;
  SDRemoteInteractionAgent *riAgent;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  riAgent = self->_server->_riAgent;
  if (v3)
    -[SDRemoteInteractionAgent handleInputDidBeginWithFlags:sessionInfo:](riAgent, "handleInputDidBeginWithFlags:sessionInfo:", 0, 0);
  else
    -[SDRemoteInteractionAgent handleInputDidEndWithFlags:sessionInfo:](riAgent, "handleInputDidEndWithFlags:sessionInfo:", 0, 0);
}

- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("TriggerHomeKitDeviceDetected"));
  if ((_DWORD)v8)
  {
    if (v7)
    {
      v9 = (int)v8;
      v16 = NSLocalizedDescriptionKey;
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v8, 0, 0));
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)v11;
      v13 = CFSTR("?");
      if (v11)
        v13 = (const __CFString *)v11;
      v17 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v9, v14));
      v7[2](v7, v15);

    }
  }
  else
  {
    -[SDSetupAgent triggerHomeKitDeviceDetectedWithURL:completion:](self->_server->_setupAgent, "triggerHomeKitDeviceDetectedWithURL:completion:", v6, v7);
  }

}

- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection triggerProximityAutoFillDetectedWithURL:completion:]", 30, "Triggering AutoFill detected with URL\n");
  -[SDAutoFillAgent triggerProximityAutoFillDetectedWithURL:completion:](self->_server->_autoFillAgent, "triggerProximityAutoFillDetectedWithURL:completion:", v7, v6);

}

- (void)wifiPasswordSharingAvailabilityWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, void *);
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  v4 = (void (**)(id, uint64_t, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v5 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Services"), &self->_entitledClient, CFSTR("WiFiPasswordSharingAvailability"));
  if ((_DWORD)v5)
  {
    if (v4)
    {
      v8 = (int)v5;
      v15 = NSLocalizedDescriptionKey;
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v5, 0, 0));
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)v10;
      v12 = CFSTR("?");
      if (v10)
        v12 = (const __CFString *)v10;
      v16 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v8, v13));
      v4[2](v4, 1, v14);

    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v7 = objc_msgSend(v6, "wifiPasswordSharingAvailability");

    if (dword_1007B21C0 <= 30
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection wifiPasswordSharingAvailabilityWithCompletion:]", 30, "PWS availability: %#{flags}\n", v7, &unk_1005CCA85);
    }
    if (v4)
      v4[2](v4, (uint64_t)v7, 0);
  }

}

- (void)startProxCardTransactionWithOptions:(unint64_t)a3 completion:(id)a4
{
  char v4;
  int v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (gSDProxCardsSuppressed || -[SDSetupAgent uiShowing](self->_server->_setupAgent, "uiShowing"))
    goto LABEL_24;
  if ((v4 & 4) != 0)
    v6 = 509955;
  else
    v6 = 509963;
  if ((v4 & 0x10) != 0)
    v6 &= 0x7C809u;
  if ((v4 & 8) != 0)
    v6 &= 0x7880Bu;
  v7 = v6 & 0x7C80A;
  if ((v4 & 1) == 0)
    v7 = v6;
  if ((v4 & 2) != 0)
    v7 &= ~0x20000u;
  if ((v4 & 0x20) != 0)
    v7 &= 0x6C80Bu;
  v8 = (v4 & 0x40) != 0 ? v7 & 0xFFFFF7FF : v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v10 = objc_msgSend(v9, "systemUIFlags") & v8;

  if (v10)
  {
LABEL_24:
    v11 = 0;
  }
  else
  {
    -[SDXPCConnection activateAssertionWithIdentifier:](self, "activateAssertionWithIdentifier:", CFSTR("com.apple.sharing.PreventProxCards"));
    v11 = 1;
  }
  v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, v11);
    v12 = v13;
  }

}

- (void)coordinatedAlertsRequestStart:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *, uint64_t, _QWORD);
  unint64_t v9;
  const char *v10;
  uint64_t Int64;
  void *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  signed int v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  v7 = a3;
  v8 = (void (**)(id, void *, uint64_t, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
  {
    v9 = (unint64_t)objc_msgSend(v7, "type");
    if (v9 > 6)
      v10 = "?";
    else
      v10 = off_100718650[v9];
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection coordinatedAlertsRequestStart:completion:]", 30, "%@ (%s)\n", CFSTR("CoordinatedAlertStart"), v10);
  }
  v20 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("caEntitlements"), &v20);
  if (v20
    || !Int64
    || (v20 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.CoordinatedAlerts"), &self->_entitledCoordinatedAlerts, CFSTR("CoordinatedAlertStart"))) == 0)
  {
    if (self->_caRequest)
    {
      v20 = -6721;
      if (dword_1007B21C0 <= 60
        && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
      {
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection coordinatedAlertsRequestStart:completion:]", 60, "### %@ rejected for %#{pid}: already in use\n", CFSTR("CoordinatedAlertStart"), -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
      }
    }
    else
    {
      objc_msgSend(v7, "setCompletionHandler:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
      objc_msgSend(v7, "setXpcConnection:", v12);

      objc_storeStrong((id *)&self->_caRequest, a3);
      -[SDNearbyAgent coordinatedAlertRequestStart:](self->_server->_nearbyAgent, "coordinatedAlertRequestStart:", v7);
      v20 = 0;
    }
  }
  if (v8 && v20)
  {
    v13 = v20;
    v21 = NSLocalizedDescriptionKey;
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v20, 0, 0));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)v15;
    v17 = CFSTR("?");
    if (v15)
      v17 = (const __CFString *)v15;
    v22 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v13, v18));
    v8[2](v8, v19, 1, 0);

  }
}

- (void)coordinatedAlertsRequestFinish
{
  SFCoordinatedAlertRequest *caRequest;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection coordinatedAlertsRequestFinish]", 30, "CoordinatedAlertFinish\n");
  if (self->_caRequest)
  {
    -[SDNearbyAgent coordinatedAlertRequestFinish:](self->_server->_nearbyAgent, "coordinatedAlertRequestFinish:");
    -[SFCoordinatedAlertRequest invalidate](self->_caRequest, "invalidate");
    caRequest = self->_caRequest;
    self->_caRequest = 0;

  }
}

- (void)coordinatedAlertsRequestCancel
{
  SFCoordinatedAlertRequest *caRequest;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection coordinatedAlertsRequestCancel]", 30, "CoordinatedAlertCancel\n");
  if (self->_caRequest)
  {
    -[SDNearbyAgent coordinatedAlertRequestCancel:](self->_server->_nearbyAgent, "coordinatedAlertRequestCancel:");
    caRequest = self->_caRequest;
    self->_caRequest = 0;

  }
}

- (void)deviceDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection deviceDiscoveryActivate:completion:]", 30, "%@: %@, from %#{pid}\n", CFSTR("DeviceDiscoveryActivate"), v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  v9 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.DeviceDiscovery"), &self->_entitledDeviceDiscovery, CFSTR("DeviceDiscoveryActivate"));
  if ((_DWORD)v9)
  {
    if (v8)
    {
      v10 = (int)v9;
      v21 = NSLocalizedDescriptionKey;
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v9, 0, 0));
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      v14 = CFSTR("?");
      if (v12)
        v14 = (const __CFString *)v12;
      v22 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v10, v15));
      v8[2](v8, v16);

    }
  }
  else
  {
    if (!self->_ddRequest)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000051E4;
      v20[3] = &unk_100714FD8;
      v20[4] = self;
      objc_msgSend(v7, "setDeviceFoundHandler:", v20);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000A158;
      v19[3] = &unk_100714FD8;
      v19[4] = self;
      objc_msgSend(v7, "setDeviceLostHandler:", v19);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100005170;
      v18[3] = &unk_100715000;
      v18[4] = self;
      objc_msgSend(v7, "setDeviceChangedHandler:", v18);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10013F26C;
      v17[3] = &unk_100715288;
      v17[4] = self;
      objc_msgSend(v7, "setScanStateChangedHandler:", v17);
      objc_storeStrong((id *)&self->_ddRequest, a3);
      -[SDNearbyAgent deviceDiscoveryRequestStart:](self->_server->_nearbyAgent, "deviceDiscoveryRequestStart:", v7);
    }
    if (v8)
      v8[2](v8, 0);
  }

}

- (void)deviceDiscoveryFastScanTrigger:(id)a3
{
  SFDeviceDiscovery *ddRequest;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest)
    -[SDNearbyAgent deviceDiscoveryFastScanTrigger:reason:](self->_server->_nearbyAgent, "deviceDiscoveryFastScanTrigger:reason:", ddRequest, v5);

}

- (void)deviceDiscoveryFastScanCancel:(id)a3
{
  SFDeviceDiscovery *ddRequest;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest)
    -[SDNearbyAgent deviceDiscoveryFastScanCancel:reason:](self->_server->_nearbyAgent, "deviceDiscoveryFastScanCancel:reason:", ddRequest, v5);

}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3
{
  SFDeviceDiscovery *ddRequest;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest)
    -[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:](self->_server->_nearbyAgent, "deviceDiscoveryTriggerEnhancedDiscovery:reason:", ddRequest, v5);

}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6;
  void (**v8)(id, _QWORD);
  SFDeviceDiscovery *ddRequest;
  id v10;

  v6 = *(_QWORD *)&a4;
  v10 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest)
    -[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:useCase:](self->_server->_nearbyAgent, "deviceDiscoveryTriggerEnhancedDiscovery:reason:useCase:", ddRequest, v10, v6);
  if (v8)
    v8[2](v8, 0);

}

- (void)bluetoothUserInteraction
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection bluetoothUserInteraction]", 30, "%@\n", CFSTR("BluetoothUserInteraction"));
  if (!-[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.BluetoothUserInteraction"), &self->_entitledBluetoothUserInteraction, CFSTR("BluetoothUserInteraction")))
  {
    -[SDProximityPairingAgent bluetoothUserInteractionStart:](self->_server->_ppAgent, "bluetoothUserInteractionStart:", self);
    self->_bluetoothUserInteraction = 1;
  }
}

- (void)diagnosticBLEModeWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection diagnosticBLEModeWithCompletion:]", 30, "%@\n", CFSTR("DiagnosticBLEMode"));
  v5 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Diagnostics"), &self->_entitledDiagnostics, CFSTR("DiagnosticBLEMode"));
  if ((_DWORD)v5)
  {
    v6 = (int)v5;
    v13 = NSLocalizedDescriptionKey;
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v5, 0, 0));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)v8;
    v10 = CFSTR("?");
    if (v8)
      v10 = (const __CFString *)v8;
    v14 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v6, v11));
    v4[2](v4, v12);

  }
  else
  {
    -[SDNearbyAgent diagnosticBLEModeStart:](self->_server->_nearbyAgent, "diagnosticBLEModeStart:", self);
    self->_diagnosticBLEModeStarted = 1;
    v4[2](v4, 0);
  }

}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *autoFillAgent;
  void *v10;
  uint64_t v11;
  void *v12;
  SDAutoFillAgent *v13;
  SDAutoFillAgent *v14;
  SDAutoFillAgent *v15;
  id v16;
  SDNearbyAgent *nearbyAgent;
  uint64_t v18;
  SDSetupAgent *setupAgent;
  SDRemoteInteractionAgent *riAgent;
  SDProximityPairingAgent *ppAgent;
  SDProximityPairingAgent *v22;
  id v23;
  id v24;
  SDSetupAgent *v25;
  SDSetupAgent *v26;
  SDSetupAgent *v27;
  SDSetupAgent *v28;
  SDSetupAgent *v29;
  SDSetupAgent *v30;
  SDSetupAgent *v31;
  void *v32;
  SDSetupAgent *v33;
  SDSetupAgent *v34;
  SDSetupAgent *v35;
  SDSetupAgent *v36;
  SDSetupAgent *v37;
  SDSetupAgent *v38;
  SDSetupAgent *v39;
  SDSetupAgent *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSString *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSErrorUserInfoKey v51;
  const __CFString *v52;
  const __CFString *v53;
  void *v54;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection diagnosticControl:completion:]", 30, "%@( '%@')\n", CFSTR("DiagnosticControl"), v6);
  v50 = 0;
  v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Diagnostics"), &self->_entitledDiagnostics, CFSTR("DiagnosticControl"));
  if ((_DWORD)v8)
    goto LABEL_101;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("afui")))
  {
    autoFillAgent = self->_server->_autoFillAgent;
    v10 = v6;
    v11 = 4;
LABEL_8:
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", v11));
    objc_msgSend(autoFillAgent, "testUI:", v12);
LABEL_15:

LABEL_16:
    v7[2](v7, 0);
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("afremote")))
  {
    v13 = self->_server->_autoFillAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", 8));
    -[SDAutoFillAgent testRemote:](v13, "testRemote:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("afservice")))
  {
    v14 = self->_server->_autoFillAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", 9));
    -[SDAutoFillAgent testService:](v14, "testService:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("afkc")))
  {
    v15 = self->_server->_autoFillAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", 4));
    -[SDAutoFillAgent testKeychain:](v15, "testKeychain:", v12);
    goto LABEL_15;
  }
  if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("au1")))
  {
    nearbyAgent = self->_server->_nearbyAgent;
    v18 = 1;
LABEL_24:
    -[SDNearbyAgent setAutoUnlockActive:](nearbyAgent, "setAutoUnlockActive:", v18);
    goto LABEL_16;
  }
  if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("au0")))
  {
    nearbyAgent = self->_server->_nearbyAgent;
    v18 = 0;
    goto LABEL_24;
  }
  v16 = objc_retainAutorelease(v6);
  if (sscanf((const char *)objc_msgSend(v16, "UTF8String"), "auua-%X-%X", (char *)&v50 + 4, &v50) == 2)
  {
    -[SDNearbyAgent unlockUpdateAdvertising:mask:](self->_server->_nearbyAgent, "unlockUpdateAdvertising:mask:", HIDWORD(v50), v50);
    goto LABEL_16;
  }
  if (objc_msgSend(v16, "hasPrefix:", CFSTR("choui")))
  {
    autoFillAgent = self->_server->_proxHandoffAgent;
    v10 = v16;
    v11 = 5;
    goto LABEL_8;
  }
  if (objc_msgSend(v16, "hasPrefix:", CFSTR("isui")))
  {
    setupAgent = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringFromIndex:", 4));
    -[SDSetupAgent testSetupUIiOS:](setupAgent, "testSetupUIiOS:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v16, "hasPrefix:", CFSTR("kbpost")))
  {
    riAgent = self->_server->_riAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringFromIndex:", 6));
    -[SDRemoteInteractionAgent testKeyboardPost:](riAgent, "testKeyboardPost:", v12);
    goto LABEL_15;
  }
  if (!objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("kbpostdelay")))
  {
    -[SDRemoteInteractionAgent testKeyboardPostWithDelay](self->_server->_riAgent, "testKeyboardPostWithDelay");
    goto LABEL_16;
  }
  if (!objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("kbpostupdate")))
  {
    -[SDRemoteInteractionAgent testKeyboardPostThenUpdate](self->_server->_riAgent, "testKeyboardPostThenUpdate");
    goto LABEL_16;
  }
  if (!objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("kbremove")))
  {
    -[SDRemoteInteractionAgent testKeyboardRemove](self->_server->_riAgent, "testKeyboardRemove");
    goto LABEL_16;
  }
  if (!objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("kbremovedelay")))
  {
    -[SDRemoteInteractionAgent testKeyboardRemoveWithDelay](self->_server->_riAgent, "testKeyboardRemoveWithDelay");
    goto LABEL_16;
  }
  if (!objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("kbupdate")))
  {
    -[SDRemoteInteractionAgent testKeyboardUpdate](self->_server->_riAgent, "testKeyboardUpdate");
    goto LABEL_16;
  }
  if (!objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("kbupdatedelay")))
  {
    -[SDRemoteInteractionAgent testKeyboardUpdateWithDelay](self->_server->_riAgent, "testKeyboardUpdateWithDelay");
    goto LABEL_16;
  }
  if (objc_msgSend(v16, "hasPrefix:", CFSTR("ppair")))
  {
    ppAgent = self->_server->_ppAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringFromIndex:", 5));
    -[SDProximityPairingAgent testPairingUI:](ppAgent, "testPairingUI:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v16, "hasPrefix:", CFSTR("pstat")))
  {
    v22 = self->_server->_ppAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringFromIndex:", 5));
    -[SDProximityPairingAgent testStatusUI:](v22, "testStatusUI:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v16, "hasPrefix:", CFSTR("mismatch")))
  {
    -[SDProximityPairingAgent testStatusUI:](self->_server->_ppAgent, "testStatusUI:", v16);
    goto LABEL_16;
  }
  if (!objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("btpipe")))
  {
    v24 = -[SDNearbyAgent sharedNearbyPipe](self->_server->_nearbyAgent, "sharedNearbyPipe");
    goto LABEL_16;
  }
  if (!objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("metrics")))
  {
    SFMetricsLog(CFSTR("com.apple.sharing.test"), &off_10074E5A8);
    goto LABEL_16;
  }
  if (!objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("pping")))
  {
    -[SDNearbyAgent testPipePing](self->_server->_nearbyAgent, "testPipePing");
    goto LABEL_16;
  }
  v23 = objc_retainAutorelease(v16);
  if (sscanf((const char *)objc_msgSend(v23, "UTF8String"), "hotspot=%X", (char *)&v50 + 4) == 1)
  {
    -[SDNearbyAgent setHotspotInfo:](self->_server->_nearbyAgent, "setHotspotInfo:", HIDWORD(v50));
    goto LABEL_16;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("atvui")))
  {
    v25 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 5));
    -[SDSetupAgent testUIAppleTVSetup:](v25, "testUIAppleTVSetup:", v12);
    goto LABEL_15;
  }
  if ((objc_msgSend(v23, "hasPrefix:", CFSTR("b238ui")) & 1) != 0
    || objc_msgSend(v23, "hasPrefix:", CFSTR("homepodui")))
  {
    v26 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 6));
    -[SDSetupAgent testSetupUIB238:](v26, "testSetupUIB238:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("hkui")))
  {
    v27 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 4));
    -[SDSetupAgent testHomeKitDeviceDetected:](v27, "testHomeKitDeviceDetected:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("nfcui")))
  {
    v28 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 5));
    -[SDSetupAgent testNFCUI:](v28, "testNFCUI:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("ppui")))
  {
    v29 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 4));
    -[SDSetupAgent testPairUI:](v29, "testPairUI:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("pinshow")))
  {
    v30 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 7));
    -[SDSetupAgent testPINShow:](v30, "testPINShow:", v12);
    goto LABEL_15;
  }
  if (!objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("pinhide")))
  {
    -[SDSetupAgent testPINHide](self->_server->_setupAgent, "testPINHide");
    goto LABEL_16;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("dpick")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 5));
    v31 = self->_server->_setupAgent;
    v53 = CFSTR("debugParams");
    v54 = v12;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
    -[SDSetupAgent showDevicePickerWithInfo:completion:](v31, "showDevicePickerWithInfo:completion:", v32, &stru_1007184D8);

    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("pwui")))
  {
    v33 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 4));
    -[SDSetupAgent testSetupUIPasswordSharing:](v33, "testSetupUIPasswordSharing:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("rpui")))
  {
    v34 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 4));
    -[SDSetupAgent testRepairUI:](v34, "testRepairUI:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("ShareAudioUI")))
  {
    v35 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 12));
    -[SDSetupAgent testUIShareAudio:](v35, "testUIShareAudio:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("siriN")))
  {
    -[SDProximityPairingAgent promptForSiriNotificationsForDevice:](self->_server->_ppAgent, "promptForSiriNotificationsForDevice:", 0);
    goto LABEL_16;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("TVLatencyUI")))
  {
    v36 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 11));
    -[SDSetupAgent testUITVLatencySetup:](v36, "testUITVLatencySetup:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("TVColorCalibrator")))
  {
    v37 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 17));
    -[SDSetupAgent testUITVLatencyColorimeterSetup:](v37, "testUITVLatencyColorimeterSetup:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("whaui")))
  {
    v38 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 5));
    -[SDSetupAgent testSetupUIWHA:](v38, "testSetupUIWHA:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("wsui")))
  {
    v39 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 4));
    -[SDSetupAgent testSetupUIWatch:](v39, "testSetupUIWatch:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("testProxCardKit")))
  {
    v40 = self->_server->_setupAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 8));
    -[SDSetupAgent testProxCardKit:](v40, "testProxCardKit:", v12);
    goto LABEL_15;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("unpost")))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](SDNotificationManager, "sharedManager"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 6));
    objc_msgSend(v41, "testPost:", v42);

    goto LABEL_16;
  }
  if (objc_msgSend(v23, "hasPrefix:", CFSTR("familyHSNotification")))
  {
    -[SDHotspotAgent testNotification](self->_server->_hotspotAgent, "testNotification");
    goto LABEL_16;
  }
  if (dword_1007B21C0 <= 50 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 50)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection diagnosticControl:completion:]", 50, "### Unsupported diagnostic control command: '%@'\n", v23);
  v8 = 4294960561;
LABEL_101:
  v43 = (int)v8;
  v51 = NSLocalizedDescriptionKey;
  v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v8, 0, 0));
  v45 = objc_claimAutoreleasedReturnValue(v44);
  v46 = (void *)v45;
  v47 = CFSTR("?");
  if (v45)
    v47 = (const __CFString *)v45;
  v52 = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v43, v48));
  ((void (**)(id, void *))v7)[2](v7, v49);

LABEL_17:
}

- (void)diagnosticLogControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, const __CFString *);
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = (void (**)(id, const __CFString *))a4;
  v13 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Diagnostics"), &self->_entitledDiagnostics, CFSTR("DiagnosticLogControl"));
  if (!(_DWORD)v8)
  {
    if (!v6 || (v8 = LogControl(objc_msgSend(objc_retainAutorelease(v6), "UTF8String")), !(_DWORD)v8))
      v8 = LogShow(&v13);
  }
  if (v7)
  {
    if (v13)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
      v10 = (__CFString *)v9;
      if (v9)
        v11 = (const __CFString *)v9;
      else
        v11 = CFSTR("?");
      v7[2](v7, v11);
    }
    else
    {
      v12 = NSPrintF("### Error: %#m\n", v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v12);
      v7[2](v7, v10);
    }

  }
  if (v13)
    free(v13);

}

- (void)diagnosticMock:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("change")))
  {
    if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("found")))
    {
      if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("lost")))
      {
        if (dword_1007B21C0 <= 50
          && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 50)))
        {
          LogPrintF(&dword_1007B21C0, "-[SDXPCConnection diagnosticMock:device:completion:]", 50, "### Unsupported mock event: '%@'\n", v10);
        }
      }
      else
      {
        -[SDNearbyAgent diagnosticMockLost:](self->_server->_nearbyAgent, "diagnosticMockLost:", v8);
      }
    }
    else
    {
      -[SDNearbyAgent diagnosticMockFound:](self->_server->_nearbyAgent, "diagnosticMockFound:", v8);
    }
  }
  else
  {
    -[SDNearbyAgent diagnosticMockChanged:](self->_server->_nearbyAgent, "diagnosticMockChanged:", v8);
  }
  if (v9)
    v9[2](v9, 0);

}

- (void)diagnosticMockStart:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (dword_1007B21C0 <= 50 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 50)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection diagnosticMockStart:]", 50, "Starting mock mode\n");
  -[SDNearbyAgent diagnosticBLEModeStart:](self->_server->_nearbyAgent, "diagnosticBLEModeStart:", self);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)diagnosticMockStop:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (dword_1007B21C0 <= 50 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 50)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection diagnosticMockStop:]", 50, "Stopping debug mode\n");
  -[SDNearbyAgent diagnosticBLEModeStop:](self->_server->_nearbyAgent, "diagnosticBLEModeStop:", self);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  SDNearbyAgent *nearbyAgent;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  SDXPCServer *server;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Diagnostics"), &self->_entitledDiagnostics, CFSTR("DiagnosticShow"));
  if ((_DWORD)v8)
  {
    v13 = 0;
    if (!v7)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("ids")))
  {
    nearbyAgent = self->_server->_nearbyAgent;
    v81 = 0;
    -[SDNearbyAgent idsDevicesAppendDescription:](nearbyAgent, "idsDevicesAppendDescription:", &v81);
    v10 = v81;
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("prox")))
  {
    v80 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfo](self->_server->_nearbyAgent, "bleProximityInfo"));
    NSAppendPrintF(&v80, "%@", v11);
    v12 = v80;
LABEL_10:
    v10 = v12;

    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("autofill")))
  {
    v79 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoFillAgent description](self->_server->_autoFillAgent, "description"));
    NSAppendPrintF(&v79, "%@", v11);
    v12 = v79;
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("handoff")))
  {
    v78 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent description](self->_server->_proxHandoffAgent, "description"));
    NSAppendPrintF(&v78, "%@", v11);
    v12 = v78;
    goto LABEL_10;
  }
  v16 = objc_msgSend(v6, "isEqual:", CFSTR("ss"));
  v17 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent description](self->_server->_nearbyAgent, "description"));
  v18 = (void *)v17;
  if (v17)
  {
    v77 = 0;
    NSAppendPrintF(&v77, "%@\n", v17);
    v19 = v77;
    if ((v16 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
    v19 = 0;
    if ((v16 & 1) != 0)
      goto LABEL_29;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent detailedDescription](self->_server->_appleIDAgent, "detailedDescription"));

  if (v20)
  {
    v76 = v19;
    NSAppendPrintF(&v76, "%@\n", v20);
    v21 = v76;

    v19 = v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager shared](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "shared"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "detailedDescription"));

  if (v23)
  {
    v75 = v19;
    NSAppendPrintF(&v75, "%@\n", v23);
    v24 = v75;

    v19 = v24;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));

  if (v18)
  {
    v74 = v19;
    NSAppendPrintF(&v74, "%@\n", v18);
    v26 = v74;

    v19 = v26;
  }
LABEL_29:
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDRemoteInteractionAgent description](self->_server->_riAgent, "description"));

  if (v27)
  {
    v73 = v19;
    NSAppendPrintF(&v73, "%@\n", v27);
    v28 = v73;

    v19 = v28;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoFillAgent description](self->_server->_autoFillAgent, "description"));

  if (v29)
  {
    v72 = v19;
    NSAppendPrintF(&v72, "%@\n", v29);
    v30 = v72;

    v19 = v30;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent description](self->_server->_proxHandoffAgent, "description"));

  if (v31)
  {
    v71 = v19;
    NSAppendPrintF(&v71, "%@\n", v31);
    v32 = v71;

    v19 = v32;
  }
  if ((v16 & 1) == 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](SDNotificationManager, "sharedManager"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "description"));

    if (v34)
    {
      v70 = v19;
      NSAppendPrintF(&v70, "%@\n", v34);
      v35 = v70;

      v19 = v35;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "state"));

    if (v37)
    {
      v69 = v19;
      NSAppendPrintF(&v69, "%@\n", v37);
      v38 = v69;

      v19 = v38;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "state"));

    if (v40)
    {
      v68 = v19;
      NSAppendPrintF(&v68, "%@\n", v40);
      v41 = v68;

      v19 = v41;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "state"));

    if (v43)
    {
      v67 = v19;
      NSAppendPrintF(&v67, "%@\n", v43);
      v44 = v67;

      v19 = v44;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDDeviceAssetMonitor sharedAssetMonitor](SDDeviceAssetMonitor, "sharedAssetMonitor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "state"));

    if (v46)
    {
      v66 = v19;
      NSAppendPrintF(&v66, "%@\n", v46);
      v47 = v66;

      v19 = v47;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "description"));

    if (v31)
    {
      v65 = v19;
      NSAppendPrintF(&v65, "%@\n", v31);
      v49 = v65;

      v19 = v49;
    }
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent description](self->_server->_ppAgent, "description"));

  if (v50)
  {
    v64 = v19;
    NSAppendPrintF(&v64, "%@\n", v50);
    v51 = v64;

    v19 = v51;
  }
  if (v16)
    v52 = 20;
  else
    v52 = 10;
  v53 = CUDescriptionWithLevel(self->_server->_setupAgent, v52);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v53);

  if (v13)
  {
    v63 = v19;
    NSAppendPrintF(&v63, "%@\n", v13);
    v54 = v63;

    v19 = v54;
  }
  server = self->_server;
  v62 = v19;
  -[SDXPCServer stateAppendXPCConnections:](server, "stateAppendXPCConnections:", &v62);
  v10 = v62;

  if (objc_msgSend(v6, "isEqual:", CFSTR("all")))
  {
    v61 = v10;
    NSAppendPrintF(&v61, "\n");
    v56 = v61;

    v60 = v56;
    NSAppendPrintF(&v60, "-- ProximityInfo --\n");
    v57 = v60;

    v59 = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfo](self->_server->_nearbyAgent, "bleProximityInfo"));
    NSAppendPrintF(&v59, "%@\n", v58);
    v10 = v59;

  }
  if (!v10)
  {
    if (!v7)
      goto LABEL_17;
    v8 = 4294960568;
LABEL_16:
    v14 = NSPrintF("### Error: %#m\n", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v7[2](v7, v15);

LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
LABEL_12:
  if (v7)
  {
    if (v10)
    {
      v7[2](v7, v10);
      goto LABEL_18;
    }
    v8 = 0;
    goto LABEL_16;
  }
LABEL_18:

}

- (void)diagnosticUnlockTestClientWithDevice:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v4 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Diagnostics"), &self->_entitledDiagnostics, CFSTR("DiagnosticUnlockTestClientWithDevice"));
  if ((_DWORD)v4)
  {
    if (dword_1007B21C0 <= 60)
    {
      if (dword_1007B21C0 != -1 || (v5 = v4, v6 = _LogCategory_Initialize(&dword_1007B21C0, 60), v4 = v5, v6))
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection diagnosticUnlockTestClientWithDevice:]", 60, "### %@ failed: %#m\n", CFSTR("DiagnosticUnlockTestClientWithDevice"), v4);
    }
  }
  else
  {
    -[SDNearbyAgent unlockStartTestClientWithDevice:](self->_server->_nearbyAgent, "unlockStartTestClientWithDevice:", v7);
    self->_unlockTestClientStarted = 1;
  }

}

- (void)diagnosticUnlockTestServer
{
  uint64_t v3;
  uint64_t v4;
  int v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v3 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Diagnostics"), &self->_entitledDiagnostics, CFSTR("DiagnosticUnlockTestServer"));
  if ((_DWORD)v3)
  {
    if (dword_1007B21C0 <= 60)
    {
      if (dword_1007B21C0 != -1 || (v4 = v3, v5 = _LogCategory_Initialize(&dword_1007B21C0, 60), v3 = v4, v5))
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection diagnosticUnlockTestServer]", 60, "### %@ failed: %#m\n", CFSTR("DiagnosticUnlockTestServer"), v3);
    }
  }
  else
  {
    -[SDNearbyAgent unlockStartTestServer](self->_server->_nearbyAgent, "unlockStartTestServer");
  }
}

- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection nfcTagReaderUIActivateWithEndpoint:params:completion:]", 30, "%@\n", CFSTR("NFCTagReaderUIActivate"));
  v11 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Client"), &self->_entitledClient, CFSTR("NFCTagReaderUIActivate"));
  if ((_DWORD)v11)
  {
    v12 = v11;
    if (dword_1007B21C0 <= 60
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection nfcTagReaderUIActivateWithEndpoint:params:completion:]", 60, "### %@ failed: %#m\n", CFSTR("NFCTagReaderUIActivate"), v12);
    }
    if (v10)
    {
      v13 = (int)v12;
      v20 = NSLocalizedDescriptionKey;
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v12, 0, 0));
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)v15;
      v17 = CFSTR("?");
      if (v15)
        v17 = (const __CFString *)v15;
      v21 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v13, v18));
      v10[2](v10, v19);

    }
  }
  else
  {
    -[SDSetupAgent nfcTagReaderUIActivateWithEndpoint:params:completion:](self->_server->_setupAgent, "nfcTagReaderUIActivateWithEndpoint:params:completion:", v8, v9, v10);
  }

}

- (void)b389NFCPromptDidRequestPresentationWithConfiguration:(id)a3 responseHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD, double);
  signed int v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *, _QWORD, double))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection b389NFCPromptDidRequestPresentationWithConfiguration:responseHandler:]", 30, "%@: %@\n", CFSTR("B389NFCPromptShow"), v10);
  v7 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.DurianTapPromptClient"), &self->_entitledB389NFCPromptClient, CFSTR("B389NFCPromptShow"));
  if (v7
    && (v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SFB389NFCPromptErrorDomain"), v7, &off_10074E5D0))) != 0)
  {
    v9 = v8;
    if (dword_1007B21C0 <= 60
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection b389NFCPromptDidRequestPresentationWithConfiguration:responseHandler:]", 60, "### %@ failed: %#m\n", CFSTR("B389NFCPromptShow"), v9);
    }
    if (v6)
      v6[2](v6, v9, 0, -1.0);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDB389SetupAgent shared](_TtC16DaemoniOSLibrary16SDB389SetupAgent, "shared"));
    objc_msgSend(v9, "showNFCPromptWithConfig:responseHandler:", v10, v6);
  }

}

- (void)b389NFCPromptUpdateConfiguration:(id)a3
{
  signed int v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection b389NFCPromptUpdateConfiguration:]", 30, "%@: %@\n", CFSTR("B389NFCPromptUpdateTitle"), v7);
  v4 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.DurianTapPromptClient"), &self->_entitledB389NFCPromptClient, CFSTR("B389NFCPromptUpdateTitle"));
  if (v4
    && (v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SFB389NFCPromptErrorDomain"), v4, &off_10074E5F8))) != 0)
  {
    v6 = v5;
    if (dword_1007B21C0 <= 60
      && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection b389NFCPromptUpdateConfiguration:]", 60, "### %@ failed: %#m\n", CFSTR("B389NFCPromptUpdateTitle"), v6);
    }

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDB389SetupAgent shared](_TtC16DaemoniOSLibrary16SDB389SetupAgent, "shared"));
    objc_msgSend(v6, "updateNFCPromptConfig:responseHandler:", v7, 0);
  }

}

- (void)dismissCurrentB389NFCPrompt
{
  signed int v3;
  id v4;
  id v5;
  int v6;
  id v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection dismissCurrentB389NFCPrompt]", 30, "%@\n", CFSTR("B389NFCPromptDismiss"));
  v3 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.DurianTapPromptClient"), &self->_entitledB389NFCPromptClient, CFSTR("B389NFCPromptDismiss"));
  if (v3
    && (v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SFB389NFCPromptErrorDomain"), v3, &off_10074E620))) != 0)
  {
    v5 = v4;
    v7 = v4;
    if (dword_1007B21C0 <= 60)
    {
      if (dword_1007B21C0 != -1 || (v6 = _LogCategory_Initialize(&dword_1007B21C0, 60), v5 = v7, v6))
        LogPrintF(&dword_1007B21C0, "-[SDXPCConnection dismissCurrentB389NFCPrompt]", 60, "### %@ failed: %#m\n", CFSTR("B389NFCPromptDismiss"), v5);
    }

  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[SDB389SetupAgent shared](_TtC16DaemoniOSLibrary16SDB389SetupAgent, "shared"));
    objc_msgSend(v7, "dismissNFCPrompt");
  }

}

- (void)proximityClientActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  NSErrorUserInfoKey v27;
  const __CFString *v28;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection proximityClientActivate:completion:]", 30, "%@\n", CFSTR("ProximityClientActivate"));
  v9 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.ProximityClient"), &self->_entitledProximityClient, CFSTR("ProximityClientActivate"));
  if (!(_DWORD)v9)
  {
    if (self->_proxClient)
    {
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v7, "setDispatchQueue:", self->_server->_dispatchQueue);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100141A08;
    v26[3] = &unk_100718500;
    v26[4] = self;
    objc_msgSend(v7, "setDeviceEnteredImmediateHandler:", v26);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100141A74;
    v25[3] = &unk_100718500;
    v25[4] = self;
    objc_msgSend(v7, "setDeviceExitedImmediateHandler:", v25);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100141AE0;
    v24[3] = &unk_100718500;
    v24[4] = self;
    objc_msgSend(v7, "setDeviceEnteredNearbyHandler:", v24);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100141B4C;
    v23[3] = &unk_100718500;
    v23[4] = self;
    objc_msgSend(v7, "setDeviceExitedNearbyHandler:", v23);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100141BB8;
    v22[3] = &unk_100718500;
    v22[4] = self;
    objc_msgSend(v7, "setDeviceWasDismissedHandler:", v22);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100141C28;
    v21[3] = &unk_1007164A0;
    v21[4] = self;
    objc_msgSend(v7, "setDeviceWasDismissedHandlerEx:", v21);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100141C9C;
    v20[3] = &unk_100718500;
    v20[4] = self;
    objc_msgSend(v7, "setDeviceWasSelectedHandler:", v20);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100141D08;
    v19[3] = &unk_100718500;
    v19[4] = self;
    objc_msgSend(v7, "setDeviceWillTriggerHandler:", v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100141D74;
    v18[3] = &unk_100718500;
    v18[4] = self;
    objc_msgSend(v7, "setDeviceDidUntriggerHandler:", v18);
    if (objc_msgSend(v7, "wantsUpdates"))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100141DE0;
      v17[3] = &unk_100718528;
      v17[4] = self;
      objc_msgSend(v7, "setDeviceUpdateHandler:", v17);
    }
    v9 = -[SDProxHandoffAgent proximityClientStart:](self->_server->_proxHandoffAgent, "proximityClientStart:", v7);
    if (!(_DWORD)v9)
    {
      objc_storeStrong((id *)&self->_proxClient, a3);
      goto LABEL_11;
    }
  }
LABEL_12:
  if (v8)
  {
    if ((_DWORD)v9)
    {
      v10 = (int)v9;
      v27 = NSLocalizedDescriptionKey;
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v9, 0, 0));
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      v14 = CFSTR("?");
      if (v12)
        v14 = (const __CFString *)v12;
      v28 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v10, v15));
      v8[2](v8, v16);

    }
    else
    {
      v8[2](v8, 0);
    }
  }

}

- (void)proximityClientUpdate:(id)a3
{
  unsigned int v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection proximityClientUpdate:]", 30, "%@: %@\n", CFSTR("ProximityClientUpdate"), v5);
  if (self->_proxClient)
  {
    v4 = objc_msgSend(v5, "shouldAdvertise");
    if (v4 != -[SFProximityClient shouldAdvertise](self->_proxClient, "shouldAdvertise"))
      -[SFProximityClient setShouldAdvertise:](self->_proxClient, "setShouldAdvertise:", objc_msgSend(v5, "shouldAdvertise"));
    -[SDProxHandoffAgent proximityClientUpdate:](self->_server->_proxHandoffAgent, "proximityClientUpdate:", self->_proxClient);
  }
  else if (dword_1007B21C0 <= 60
         && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
  {
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection proximityClientUpdate:]", 60, "### %@ failed: %#m\n", CFSTR("ProximityClientUpdate"), 4294960576);
  }

}

- (void)proximityClientDismissContentForDevice:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  SFProximityClient *proxClient;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.ProximityClient"), &self->_entitledProximityClient, CFSTR("ProximityClientDismissContent"));
  if (!(_DWORD)v8)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v7)
        goto LABEL_10;
      v8 = 4294960576;
      goto LABEL_6;
    }
    v8 = -[SDProxHandoffAgent proximityClient:dismissContentForDevice:](self->_server->_proxHandoffAgent, "proximityClient:dismissContentForDevice:", proxClient, v6);
  }
  if (!v7)
    goto LABEL_10;
  if (!(_DWORD)v8)
  {
    v7[2](v7, 0);
    goto LABEL_10;
  }
LABEL_6:
  v10 = (int)v8;
  v17 = NSLocalizedDescriptionKey;
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v8, 0, 0));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)v12;
  v14 = CFSTR("?");
  if (v12)
    v14 = (const __CFString *)v12;
  v18 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v10, v15));
  ((void (**)(id, void *))v7)[2](v7, v16);

LABEL_10:
}

- (void)proximityClientProvideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  uint64_t v13;
  SFProximityClient *proxClient;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v13 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.ProximityClient"), &self->_entitledProximityClient, CFSTR("ProximityClientProvideContent"));
  if (!(_DWORD)v13)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v12)
        goto LABEL_10;
      v13 = 4294960576;
      goto LABEL_6;
    }
    v13 = -[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:](self->_server->_proxHandoffAgent, "proximityClient:provideContent:forDevice:force:", proxClient, v10, v11, v7);
  }
  if (!v12)
    goto LABEL_10;
  if (!(_DWORD)v13)
  {
    v12[2](v12, 0);
    goto LABEL_10;
  }
LABEL_6:
  v15 = (int)v13;
  v22 = NSLocalizedDescriptionKey;
  v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v13, 0, 0));
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)v17;
  v19 = CFSTR("?");
  if (v17)
    v19 = (const __CFString *)v17;
  v23 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v15, v20));
  ((void (**)(id, void *))v12)[2](v12, v21);

LABEL_10:
}

- (void)proximityClientSuppressDevice:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  SFProximityClient *proxClient;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.ProximityClient"), &self->_entitledProximityClient, CFSTR("ProximityClientSuppressDevice"));
  if (!(_DWORD)v8)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v7)
        goto LABEL_10;
      v8 = 4294960576;
      goto LABEL_6;
    }
    v8 = -[SDProxHandoffAgent proximityClient:suppressDevice:](self->_server->_proxHandoffAgent, "proximityClient:suppressDevice:", proxClient, v6);
  }
  if (!v7)
    goto LABEL_10;
  if (!(_DWORD)v8)
  {
    v7[2](v7, 0);
    goto LABEL_10;
  }
LABEL_6:
  v10 = (int)v8;
  v17 = NSLocalizedDescriptionKey;
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v8, 0, 0));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)v12;
  v14 = CFSTR("?");
  if (v12)
    v14 = (const __CFString *)v12;
  v18 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v10, v15));
  ((void (**)(id, void *))v7)[2](v7, v16);

LABEL_10:
}

- (void)proximityClientStopSuppressingDevice:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  SFProximityClient *proxClient;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v8 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.ProximityClient"), &self->_entitledProximityClient, CFSTR("ProximityClientStopSuppressingDevice"));
  if (!(_DWORD)v8)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v7)
        goto LABEL_10;
      v8 = 4294960576;
      goto LABEL_6;
    }
    v8 = -[SDProxHandoffAgent proximityClient:stopSuppressingDevice:](self->_server->_proxHandoffAgent, "proximityClient:stopSuppressingDevice:", proxClient, v6);
  }
  if (!v7)
    goto LABEL_10;
  if (!(_DWORD)v8)
  {
    v7[2](v7, 0);
    goto LABEL_10;
  }
LABEL_6:
  v10 = (int)v8;
  v17 = NSLocalizedDescriptionKey;
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v8, 0, 0));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)v12;
  v14 = CFSTR("?");
  if (v12)
    v14 = (const __CFString *)v12;
  v18 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v10, v15));
  ((void (**)(id, void *))v7)[2](v7, v16);

LABEL_10:
}

- (void)proximityClientUpdateContent:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  SFProximityClient *proxClient;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v11 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.ProximityClient"), &self->_entitledProximityClient, CFSTR("ProximityClientUpdateContent"));
  if (!(_DWORD)v11)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v10)
        goto LABEL_10;
      v11 = 4294960576;
      goto LABEL_6;
    }
    v11 = -[SDProxHandoffAgent proximityClient:updateContent:forDevice:](self->_server->_proxHandoffAgent, "proximityClient:updateContent:forDevice:", proxClient, v8, v9);
  }
  if (!v10)
    goto LABEL_10;
  if (!(_DWORD)v11)
  {
    v10[2](v10, 0);
    goto LABEL_10;
  }
LABEL_6:
  v13 = (int)v11;
  v20 = NSLocalizedDescriptionKey;
  v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v11, 0, 0));
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)v15;
  v17 = CFSTR("?");
  if (v15)
    v17 = (const __CFString *)v15;
  v21 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v13, v18));
  ((void (**)(id, void *))v10)[2](v10, v19);

LABEL_10:
}

- (void)proximityClientRequestScannerTimerReset
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  v3 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.ProximityClient"), &self->_entitledProximityClient, CFSTR("ProximityClientUpdateContent"));
  if ((_DWORD)v3)
  {
    v4 = v3;
  }
  else
  {
    if (self->_proxClient)
    {
      -[SDProxHandoffAgent proximityClientRequestScannerTimerReset:](self->_server->_proxHandoffAgent, "proximityClientRequestScannerTimerReset:");
      return;
    }
    v4 = 4294960576;
  }
  if (dword_1007B21C0 <= 90 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 90)))
  {
    v5 = (int)v4;
    v12 = NSLocalizedDescriptionKey;
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v4, 0, 0));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)v7;
    v9 = CFSTR("?");
    if (v7)
      v9 = (const __CFString *)v7;
    v13 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v5, v10));
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection proximityClientRequestScannerTimerReset]", 90, "### Request scanner timer reset failed: %@\n", v11, v12);

  }
}

- (void)remoteInteractionSessionActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection remoteInteractionSessionActivate:completion:]", 30, "%@\n", CFSTR("RemoteInteractionSessionActivate"));
  v9 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.RemoteInteractionSession"), &self->_entitledRemoteInteractionSession, CFSTR("RemoteInteractionSessionActivate"));
  if (!(_DWORD)v9)
  {
    if (!self->_riSession)
    {
      objc_msgSend(v7, "setDispatchQueue:", self->_server->_dispatchQueue);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100142CF0;
      v20[3] = &unk_100715858;
      v20[4] = self;
      objc_msgSend(v7, "setRemoteTextEventHandler:", v20);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100142D5C;
      v19[3] = &unk_100718550;
      v19[4] = self;
      objc_msgSend(v7, "setTextSessionDidBegin:", v19);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100142DC8;
      v18[3] = &unk_100718550;
      v18[4] = self;
      objc_msgSend(v7, "setTextSessionDidEnd:", v18);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100142E34;
      v17[3] = &unk_100718550;
      v17[4] = self;
      objc_msgSend(v7, "setTextSessionDidChange:", v17);
      v9 = -[SDRemoteInteractionAgent sessionStart:](self->_server->_riAgent, "sessionStart:", v7);
      if ((_DWORD)v9)
        goto LABEL_10;
      objc_storeStrong((id *)&self->_riSession, a3);
    }
    v9 = 0;
  }
LABEL_10:
  if (v8)
  {
    if ((_DWORD)v9)
    {
      v10 = (int)v9;
      v21 = NSLocalizedDescriptionKey;
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v9, 0, 0));
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      v14 = CFSTR("?");
      if (v12)
        v14 = (const __CFString *)v12;
      v22 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v10, v15));
      v8[2](v8, v16);

    }
    else
    {
      v8[2](v8, 0);
    }
  }

}

- (void)remoteInteractionSessionSendPayload:(id)a3
{
  SFRemoteInteractionSession *riSession;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection remoteInteractionSessionSendPayload:]", 30, "%@\n", CFSTR("RemoteInteractionSessionSendData"));
  riSession = self->_riSession;
  if (riSession)
  {
    -[SFRemoteInteractionSession sendPayload:](riSession, "sendPayload:", v7);
LABEL_7:
    v5 = v7;
    goto LABEL_8;
  }
  v5 = v7;
  if (dword_1007B21C0 <= 60)
  {
    if (dword_1007B21C0 != -1 || (v6 = _LogCategory_Initialize(&dword_1007B21C0, 60), v5 = v7, v6))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection remoteInteractionSessionSendPayload:]", 60, "### %@ failed: %#m\n", CFSTR("RemoteInteractionSessionSendData"), 4294960576);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)serviceActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  uint64_t Int64;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  signed int v32;
  NSErrorUserInfoKey v33;
  const __CFString *v34;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceActivate:completion:]", 30, "ServiceActivate: %@\n", v7);
  if (!v9)
  {
    v17 = -6705;
    goto LABEL_21;
  }
  v32 = -[SDXPCConnection _entitledService:state:](self, "_entitledService:state:", v9, &self->_entitledService);
  if (!v32)
  {
    if (self->_service)
    {
      v17 = -6721;
      goto LABEL_21;
    }
    Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("dedDisable"), &v32);
    if (!v32)
    {
      if (Int64)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        v12 = SFServiceIdentifierDeviceDiagnostics;
        v13 = objc_msgSend(v11, "isEqual:", SFServiceIdentifierDeviceDiagnostics);

        if (v13)
        {
          if (dword_1007B21C0 <= 60
            && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
          {
            LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceActivate:completion:]", 60, "### Service identifier %@ is disabled via pref\n", v12);
          }
          v17 = -71165;
LABEL_21:
          v32 = v17;
          if (!v8)
            goto LABEL_27;
          goto LABEL_22;
        }
      }
    }
    objc_msgSend(v7, "setDispatchQueue:", self->_server->_dispatchQueue);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100143450;
    v31[3] = &unk_1007147C8;
    v31[4] = self;
    objc_msgSend(v7, "setErrorHandler:", v31);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001434BC;
    v30[3] = &unk_100717610;
    v30[4] = self;
    objc_msgSend(v7, "setEventMessageHandler:", v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100143574;
    v29[3] = &unk_100718578;
    v29[4] = self;
    objc_msgSend(v7, "setPeerDisconnectedHandler:", v29);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100143604;
    v28[3] = &unk_1007185A0;
    v28[4] = self;
    objc_msgSend(v7, "setReceivedFramePeerHandler:", v28);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100143694;
    v27[3] = &unk_100715238;
    v27[4] = self;
    objc_msgSend(v7, "setRequestMessageHandler:", v27);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10014374C;
    v26[3] = &unk_1007185C8;
    v26[4] = self;
    objc_msgSend(v7, "setResponseMessageInternalHandler:", v26);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100143804;
    v25[3] = &unk_1007185A0;
    v25[4] = self;
    objc_msgSend(v7, "setSendFramePeerHandler:", v25);
    v32 = -[SDNearbyAgent serviceStart:](self->_server->_nearbyAgent, "serviceStart:", v7);
    if (!v32)
    {
      objc_storeStrong((id *)&self->_service, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SFService identifier](self->_service, "identifier"));
      v15 = objc_msgSend(v14, "isEqualToString:", SFServiceIdentifierPasswordSharing);

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v16, "postNotificationName:object:", SFWiFiPasswordSharingAdvertisingBegan, 0);

      }
    }
  }
  if (!v8)
    goto LABEL_27;
LABEL_22:
  v18 = v32;
  if (v32)
  {
    v33 = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v32, 0, 0));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)v20;
    v22 = CFSTR("?");
    if (v20)
      v22 = (const __CFString *)v20;
    v34 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v18, v23));
    v8[2](v8, v24);

  }
  else
  {
    v8[2](v8, 0);
  }
LABEL_27:

}

- (void)serviceUpdate:(id)a3
{
  SFService *service;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceUpdate:]", 30, "%@: %@\n", CFSTR("ServiceUpdate"), v7);
  service = self->_service;
  if (service)
  {
    -[SFService updateWithService:](service, "updateWithService:", v7);
    -[SDNearbyAgent update](self->_server->_nearbyAgent, "update");
LABEL_7:
    v5 = v7;
    goto LABEL_8;
  }
  v5 = v7;
  if (dword_1007B21C0 <= 60)
  {
    if (dword_1007B21C0 != -1 || (v6 = _LogCategory_Initialize(&dword_1007B21C0, 60), v5 = v7, v6))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceUpdate:]", 60, "### %@ failed: %#m\n", CFSTR("ServiceUpdate"), 4294960576);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)servicePeerDisconnected:(id)a3 error:(id)a4
{
  id v6;
  SFService *service;
  id v8;

  v8 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 10 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 10)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection servicePeerDisconnected:error:]", 10, "%@: %@\n", CFSTR("ServicePeerDisconnected"), v8);
  service = self->_service;
  if (service)
  {
    -[SFService servicePeerDisconnected:error:](service, "servicePeerDisconnected:error:", v8, v6);
  }
  else if (dword_1007B21C0 <= 60
         && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
  {
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection servicePeerDisconnected:error:]", 60, "### %@ failed: %#m\n", CFSTR("ServicePeerDisconnected"), 4294960551);
  }

}

- (void)serviceSendEvent:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 10 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 10)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceSendEvent:]", 10, "%@: %@\n", CFSTR("ServiceSendEvent"), v6);
  if (self->_service)
  {
    -[SDNearbyAgent serviceSendEvent:service:](self->_server->_nearbyAgent, "serviceSendEvent:service:", v6);
LABEL_7:
    v4 = v6;
    goto LABEL_8;
  }
  v4 = v6;
  if (dword_1007B21C0 <= 60)
  {
    if (dword_1007B21C0 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B21C0, 60), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceSendEvent:]", 60, "### %@ failed: %#m\n", CFSTR("ServiceSendEvent"), 4294960551);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)serviceSendFrameType:(unsigned __int8)a3 data:(id)a4 peer:(id)a5
{
  uint64_t v6;
  id v8;
  const char *v9;
  SFService *service;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 10 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 10)))
  {
    if (v6 > 0x41)
      v9 = "?";
    else
      v9 = off_100718688[(char)v6];
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceSendFrameType:data:peer:]", 10, "%@: %s, %ld bytes\n", CFSTR("ServiceSendFrame"), v9, objc_msgSend(v11, "length"));
  }
  service = self->_service;
  if (service)
  {
    -[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:](self->_server->_nearbyAgent, "bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:", v6, -[SFService serviceType](service, "serviceType"), v11, v8, 0);
  }
  else if (dword_1007B21C0 <= 60
         && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 60)))
  {
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceSendFrameType:data:peer:]", 60, "### %@ failed: %#m\n", CFSTR("ServiceSendFrame"), 4294960551);
  }

}

- (void)serviceSendRequest:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 10 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 10)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceSendRequest:]", 10, "%@: %@\n", CFSTR("ServiceSendRequest"), v6);
  if (self->_service)
  {
    -[SDNearbyAgent serviceSendRequest:service:](self->_server->_nearbyAgent, "serviceSendRequest:service:", v6);
LABEL_7:
    v4 = v6;
    goto LABEL_8;
  }
  v4 = v6;
  if (dword_1007B21C0 <= 60)
  {
    if (dword_1007B21C0 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B21C0, 60), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceSendRequest:]", 60, "### %@ failed: %#m\n", CFSTR("ServiceSendRequest"), 4294960551);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)serviceSendResponse:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 10 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 10)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceSendResponse:]", 10, "%@: %@\n", CFSTR("ServiceSendResponse"), v6);
  if (self->_service)
  {
    -[SDNearbyAgent serviceSendResponse:service:](self->_server->_nearbyAgent, "serviceSendResponse:service:", v6);
LABEL_7:
    v4 = v6;
    goto LABEL_8;
  }
  v4 = v6;
  if (dword_1007B21C0 <= 60)
  {
    if (dword_1007B21C0 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B21C0, 60), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection serviceSendResponse:]", 60, "### %@ failed: %#m\n", CFSTR("ServiceSendResponse"), 4294960551);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)sessionActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection sessionActivate:completion:]", 30, "%@\n", CFSTR("SessionActivate"));
  v9 = -[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Session"), &self->_entitledSession, CFSTR("SessionActivate"));
  if (!(_DWORD)v9)
  {
    if (self->_session)
    {
      v9 = 4294960575;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceUUID"));

      if (v10)
      {
        objc_msgSend(v7, "setDispatchQueue:", self->_server->_dispatchQueue);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1001442BC;
        v24[3] = &unk_100715288;
        v24[4] = self;
        objc_msgSend(v7, "setBluetoothStateChangedHandler:", v24);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100144314;
        v23[3] = &unk_1007147C8;
        v23[4] = self;
        objc_msgSend(v7, "setErrorHandler:", v23);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100144380;
        v22[3] = &unk_100717610;
        v22[4] = self;
        objc_msgSend(v7, "setEventMessageHandler:", v22);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1001443EC;
        v21[3] = &unk_1007185F0;
        v21[4] = self;
        objc_msgSend(v7, "setReceivedFrameHandler:", v21);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100144460;
        v20[3] = &unk_100715238;
        v20[4] = self;
        objc_msgSend(v7, "setRequestMessageHandler:", v20);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1001444CC;
        v19[3] = &unk_1007185C8;
        v19[4] = self;
        objc_msgSend(v7, "setResponseMessageInternalHandler:", v19);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100144538;
        v18[3] = &unk_1007185F0;
        v18[4] = self;
        objc_msgSend(v7, "setSendFrameHandler:", v18);
        objc_storeStrong((id *)&self->_session, a3);
        v9 = -[SDNearbyAgent sessionStart:](self->_server->_nearbyAgent, "sessionStart:", v7);
      }
      else
      {
        v9 = 4294960551;
      }
    }
  }
  if (v8)
  {
    if ((_DWORD)v9)
    {
      v11 = (int)v9;
      v25 = NSLocalizedDescriptionKey;
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v9, 0, 0));
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)v13;
      v15 = CFSTR("?");
      if (v13)
        v15 = (const __CFString *)v13;
      v26 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v11, v16));
      v8[2](v8, v17);

    }
    else
    {
      v8[2](v8, 0);
    }
  }

}

- (void)sessionSendEvent:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 10 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 10)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection sessionSendEvent:]", 10, "%@: %@\n", CFSTR("SessionSendEvent"), v6);
  if (self->_session)
  {
    objc_msgSend(v6, "setSession:");
    -[SDNearbyAgent sessionSendEvent:session:](self->_server->_nearbyAgent, "sessionSendEvent:session:", v6, self->_session);
LABEL_7:
    v4 = v6;
    goto LABEL_8;
  }
  v4 = v6;
  if (dword_1007B21C0 <= 60)
  {
    if (dword_1007B21C0 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B21C0, 60), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection sessionSendEvent:]", 60, "### %@ failed: %#m\n", CFSTR("SessionSendEvent"), 4294960551);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)sessionSendFrameType:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4;
  const char *v6;
  SFSession *session;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;

  v4 = a3;
  v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 10 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 10)))
  {
    if (v4 > 0x41)
      v6 = "?";
    else
      v6 = off_100718688[(char)v4];
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection sessionSendFrameType:data:]", 10, "%@: %s, %ld bytes\n", CFSTR("SessionSendFrame"), v6, objc_msgSend(v13, "length"));
  }
  session = self->_session;
  if (session)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFSession peerDevice](session, "peerDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

    if (v9)
    {
      -[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:](self->_server->_nearbyAgent, "bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:", v4, -[SFSession serviceType](self->_session, "serviceType"), v13, v9, 1);

LABEL_12:
      v10 = v13;
      goto LABEL_13;
    }
    v11 = 4294960588;
  }
  else
  {
    v11 = 4294960551;
  }
  v10 = v13;
  if (dword_1007B21C0 <= 60)
  {
    if (dword_1007B21C0 != -1 || (v12 = _LogCategory_Initialize(&dword_1007B21C0, 60), v10 = v13, v12))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection sessionSendFrameType:data:]", 60, "### %@ failed: %#m\n", CFSTR("SessionSendFrame"), v11);
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)sessionSendRequest:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 10 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 10)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection sessionSendRequest:]", 10, "%@: %@\n", CFSTR("SessionSendRequest"), v6);
  if (self->_session)
  {
    objc_msgSend(v6, "setSession:");
    -[SDNearbyAgent sessionSendRequest:session:](self->_server->_nearbyAgent, "sessionSendRequest:session:", v6, self->_session);
LABEL_7:
    v4 = v6;
    goto LABEL_8;
  }
  v4 = v6;
  if (dword_1007B21C0 <= 60)
  {
    if (dword_1007B21C0 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B21C0, 60), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection sessionSendRequest:]", 60, "### %@ failed: %#m\n", CFSTR("SessionSendRequest"), 4294960551);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)sessionSendResponse:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 10 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 10)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection sessionSendResponse:]", 10, "%@: %@\n", CFSTR("SessionSendResponse"), v6);
  if (self->_session)
  {
    objc_msgSend(v6, "setSession:");
    -[SDNearbyAgent sessionSendResponse:session:](self->_server->_nearbyAgent, "sessionSendResponse:session:", v6, self->_session);
LABEL_7:
    v4 = v6;
    goto LABEL_8;
  }
  v4 = v6;
  if (dword_1007B21C0 <= 60)
  {
    if (dword_1007B21C0 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B21C0, 60), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B21C0, "-[SDXPCConnection sessionSendResponse:]", 60, "### %@ failed: %#m\n", CFSTR("SessionSendResponse"), 4294960551);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)shareAudioSessionActivate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  SFShareAudioSessionDaemon *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10013B7B0;
  v22 = sub_10013B7C0;
  v23 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100144D14;
  v15[3] = &unk_100718448;
  v17 = &v18;
  v7 = a4;
  v16 = v7;
  v8 = objc_retainBlock(v15);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection shareAudioSessionActivate:completion:]", 30, "%@\n", CFSTR("ShareAudioSession activate"));
  if (-[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Session"), &self->_entitledSession, CFSTR("ShareAudioSession activate")))
  {
    v11 = NSErrorF(NSOSStatusErrorDomain, 4294896128, "Missing entitlement: '%@'", CFSTR("com.apple.sharing.Session"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
LABEL_11:
    v9 = (SFShareAudioSessionDaemon *)v19[5];
    v19[5] = v12;
    goto LABEL_8;
  }
  if (self->_shareAudioSession)
  {
    v13 = NSErrorF(NSOSStatusErrorDomain, 4294960575, "Session already active");
    v12 = objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_11;
  }
  v9 = objc_alloc_init(SFShareAudioSessionDaemon);
  objc_storeStrong((id *)&self->_shareAudioSession, v9);
  -[SFShareAudioSessionDaemon setDispatchQueue:](v9, "setDispatchQueue:", self->_server->_dispatchQueue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  -[SFShareAudioSessionDaemon setStatusMonitor:](v9, "setStatusMonitor:", v10);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100144DD8;
  v14[3] = &unk_100718618;
  v14[4] = v9;
  v14[5] = self;
  -[SFShareAudioSessionDaemon setProgressHandler:](v9, "setProgressHandler:", v14);
  -[SFShareAudioSessionDaemon activate](v9, "activate");
  (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_8:

  ((void (*)(_QWORD *))v8[2])(v8);
  _Block_object_dispose(&v18, 8);

}

- (void)shareAudioUserConfirmed
{
  _QWORD *v3;
  SFShareAudioSessionDaemon *v4;
  SFShareAudioSessionDaemon *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10013B7B0;
  v16 = sub_10013B7C0;
  v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10014505C;
  v11[3] = &unk_100714258;
  v11[4] = &v12;
  v3 = objc_retainBlock(v11);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_1007B21C0 <= 30 && (dword_1007B21C0 != -1 || _LogCategory_Initialize(&dword_1007B21C0, 30)))
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection shareAudioUserConfirmed]", 30, "%@\n", CFSTR("ShareAudioSession UserConfirmed"));
  if (-[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.sharing.Session"), &self->_entitledSession, CFSTR("ShareAudioSession UserConfirmed")))
  {
    v6 = NSErrorF(NSOSStatusErrorDomain, 4294896128, "Missing entitlement: '%@'", CFSTR("com.apple.sharing.Session"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v5 = (SFShareAudioSessionDaemon *)v13[5];
    v13[5] = v7;
  }
  else
  {
    v4 = self->_shareAudioSession;
    v5 = v4;
    if (v4)
    {
      -[SFShareAudioSessionDaemon userConfirmed](v4, "userConfirmed");
    }
    else
    {
      v8 = NSErrorF(NSOSStatusErrorDomain, 4294960575, "No session");
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)v13[5];
      v13[5] = v9;

    }
  }

  ((void (*)(_QWORD *))v3[2])(v3);
  _Block_object_dispose(&v12, 8);

}

- (void)userNotificationPresent:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B21C0 <= 50
    && ((v6 = v3, dword_1007B21C0 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B21C0, 50), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B21C0, "-[SDXPCConnection userNotificationPresent:]", 50, "UserNotification XPC not supported on current platform\n");

  }
  else
  {

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_shareAudioSession, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_riSession, 0);
  objc_storeStrong((id *)&self->_proxClient, 0);
  objc_storeStrong((id *)&self->_preventExitForLocaleReason, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_ddRequest, 0);
  objc_storeStrong((id *)&self->_caRequest, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_afsHelper, 0);
}

@end
