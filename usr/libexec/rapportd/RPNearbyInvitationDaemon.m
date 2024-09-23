@implementation RPNearbyInvitationDaemon

- (RPNearbyInvitationDaemon)init
{
  RPNearbyInvitationDaemon *v2;
  RPNearbyInvitationDaemon *v3;
  RPNearbyInvitationDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPNearbyInvitationDaemon;
  v2 = -[RPNearbyInvitationDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055A4C;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;

  if (dword_100130D88 <= 30 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _activate]", 30, "Activate\n");
  RandomBytes(&self->_sessionIDLast, 4);
  if (!self->_xpcListener)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _activate]", 30, "Activating XPC listener %@\n", CFSTR("com.apple.rapport.NearbyInvitation"));
    }
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.rapport.NearbyInvitation"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  -[RPNearbyInvitationDaemon prefsChanged](self, "prefsChanged");
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055BE8;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSXPCListener *xpcListener;
  CUSystemMonitor *systemMonitor;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _invalidate]", 30, "Invalidating\n");
    }
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    -[RPNearbyInvitationDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    -[RPNearbyInvitationDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[RPNearbyInvitationDaemon _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableSet count](self->_xpcConnections, "count")
    && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (void)prefsChanged
{
  uint64_t v3;
  uint64_t v4;
  int DeviceClass;
  uint64_t Int64;
  BOOL v7;
  _BOOL4 v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  _BOOL4 v21;
  const char *v22;
  const char *v23;
  _BOOL4 v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  _BOOL4 v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  int v32;

  v32 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  DeviceClass = GestaltGetDeviceClass(v3, v4);
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("nearbyInvitationClient"), &v32);
  if (v32)
    v7 = DeviceClass == 1;
  else
    v7 = 0;
  v9 = v7 || Int64 != 0;
  if (self->_prefClientEnabled != v9)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      v10 = "yes";
      if (v9)
        v11 = "no";
      else
        v11 = "yes";
      if (!v9)
        v10 = "no";
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon prefsChanged]", 30, "Client enabled: %s -> %s\n", v11, v10);
    }
    self->_prefClientEnabled = v9;
  }
  v12 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("nearbyInvitationServer"), &v32);
  if (v32)
    v13 = DeviceClass == 7;
  else
    v13 = 0;
  v15 = v13 || v12 != 0;
  if (self->_prefServerEnabled != v15)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      v16 = "yes";
      if (v15)
        v17 = "no";
      else
        v17 = "yes";
      if (!v15)
        v16 = "no";
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon prefsChanged]", 30, "Server enabled: %s -> %s\n", v17, v16);
    }
    self->_prefServerEnabled = v15;
  }
  v18 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("nearbyInvitationGuestServer"), &v32);
  if (v32)
    v19 = DeviceClass == 7;
  else
    v19 = 0;
  v21 = v19 || v18 != 0;
  if (self->_prefGuestServerEnabled != v21)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      v22 = "yes";
      if (v21)
        v23 = "no";
      else
        v23 = "yes";
      if (!v21)
        v22 = "no";
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon prefsChanged]", 30, "Guest server enabled: %s -> %s\n", v23, v22);
    }
    self->_prefGuestServerEnabled = v21;
  }
  v24 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("nearbyInvitationGuestClient"), &v32) != 0;
  if (v32 && (DeviceClass | 2) == 3)
    v24 = 1;
  if (self->_prefGuestClientEnabled != v24)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      v25 = "yes";
      if (v24)
        v26 = "no";
      else
        v26 = "yes";
      if (!v24)
        v25 = "no";
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon prefsChanged]", 30, "Guest client enabled: %s -> %s\n", v26, v25);
    }
    self->_prefGuestClientEnabled = v24;
  }
  v27 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("nearbyInvitationDisableServerRSSI"), &v32);
  v28 = v27 != 0;
  if (self->_prefServerRSSIDisabled != v28)
  {
    if (dword_100130D88 <= 30)
    {
      v29 = v27;
      if (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30))
      {
        v30 = "yes";
        if (v29)
          v31 = "no";
        else
          v31 = "yes";
        if (!v29)
          v30 = "no";
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon prefsChanged]", 30, "Server RSSI disabled: %s -> %s\n", v31, v30);
      }
    }
    self->_prefServerRSSIDisabled = v28;
  }
  -[RPNearbyInvitationDaemon _update](self, "_update");
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

+ (id)sharedInvitationDaemon
{
  if (qword_100132098 != -1)
    dispatch_once(&qword_100132098, &stru_100112CD8);
  return (id)qword_100132090;
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;

  v4 = 0;
  NSAppendPrintF(&v4, "-- RPNearbyInvitationDaemon --\n", *(_QWORD *)&a3);
  return v4;
}

- (void)setBleDeviceWantingInvitations:(id)a3
{
  id v4;
  RPCompanionLinkDevice *v5;
  RPCompanionLinkDevice *v6;
  unsigned __int8 v7;
  RPCompanionLinkDevice *v8;
  RPCompanionLinkDevice *bleDeviceWantingInvitations;
  int v10;
  RPCompanionLinkDevice *v11;
  RPCompanionLinkDevice *v12;

  v4 = a3;
  v5 = self->_bleDeviceWantingInvitations;
  v6 = (RPCompanionLinkDevice *)v4;
  v12 = v6;
  if (v5 == v6)
  {

    bleDeviceWantingInvitations = v12;
  }
  else
  {
    if ((v6 != 0) != (v5 == 0))
    {
      v7 = -[RPCompanionLinkDevice isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

      v8 = v12;
    }
    if (dword_100130D88 <= 30)
    {
      if (dword_100130D88 != -1 || (v10 = _LogCategory_Initialize(&dword_100130D88, 30), v8 = v12, v10))
      {
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:]", 30, "BLE device wanting invitations: %@ -> %@\n", self->_bleDeviceWantingInvitations, v8);
        v8 = v12;
      }
    }
    v11 = v8;
    bleDeviceWantingInvitations = self->_bleDeviceWantingInvitations;
    self->_bleDeviceWantingInvitations = v11;
  }

  v8 = v12;
LABEL_13:

}

- (void)setBleDeviceAcceptedInvitations:(id)a3
{
  id v4;
  RPNearbyInvitationDevice *v5;
  RPNearbyInvitationDevice *v6;
  unsigned __int8 v7;
  RPNearbyInvitationDevice *v8;
  RPNearbyInvitationDevice *bleDeviceAcceptedInvitations;
  int v10;
  RPNearbyInvitationDevice *v11;
  RPNearbyInvitationDevice *v12;

  v4 = a3;
  v5 = self->_bleDeviceAcceptedInvitations;
  v6 = (RPNearbyInvitationDevice *)v4;
  v12 = v6;
  if (v5 == v6)
  {

    bleDeviceAcceptedInvitations = v12;
  }
  else
  {
    if ((v6 != 0) != (v5 == 0))
    {
      v7 = -[RPNearbyInvitationDevice isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

      v8 = v12;
    }
    if (dword_100130D88 <= 30)
    {
      if (dword_100130D88 != -1 || (v10 = _LogCategory_Initialize(&dword_100130D88, 30), v8 = v12, v10))
      {
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon setBleDeviceAcceptedInvitations:]", 30, "BLE device accepted invitations: %@ -> %@\n", self->_bleDeviceAcceptedInvitations, v8);
        v8 = v12;
      }
    }
    v11 = v8;
    bleDeviceAcceptedInvitations = self->_bleDeviceAcceptedInvitations;
    self->_bleDeviceAcceptedInvitations = v11;
  }

  v8 = v12;
LABEL_13:

}

- (void)_clientEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[RPNearbyInvitationDaemon _clientProximityEstimatorShouldRun](self, "_clientProximityEstimatorShouldRun"))
    -[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStarted](self, "_clientProximityEstimatorEnsureStarted");
  else
    -[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStopped](self, "_clientProximityEstimatorEnsureStopped");
  if (-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryShouldRun](self, "_clientBLENearbyActionDiscoveryShouldRun"))
  {
    -[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStarted](self, "_clientBLENearbyActionDiscoveryEnsureStarted");
  }
  else
  {
    -[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStopped](self, "_clientBLENearbyActionDiscoveryEnsureStopped");
  }
  if (-[RPNearbyInvitationDaemon _clientBLEServerShouldRun](self, "_clientBLEServerShouldRun"))
    -[RPNearbyInvitationDaemon _clientBLEServerEnsureStarted](self, "_clientBLEServerEnsureStarted");
  else
    -[RPNearbyInvitationDaemon _clientBLEServerEnsureStopped](self, "_clientBLEServerEnsureStopped");
  if (-[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserShouldRun](self, "_clientBLENearbyActionAdvertiserShouldRun"))
  {
    -[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStarted](self, "_clientBLENearbyActionAdvertiserEnsureStarted");
  }
  else
  {
    -[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStopped](self, "_clientBLENearbyActionAdvertiserEnsureStopped");
  }
}

- (void)_clientEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStopped](self, "_clientProximityEstimatorEnsureStopped");
  -[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStopped](self, "_clientBLENearbyActionDiscoveryEnsureStopped");
  -[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStopped](self, "_clientBLENearbyActionAdvertiserEnsureStopped");
}

- (BOOL)_clientBLENearbyActionDiscoveryShouldRun
{
  unsigned int v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  if (v3)
    LOBYTE(v3) = -[NSMutableSet count](self->_activatedDiscoverySet, "count") != 0;
  return v3;
}

- (void)_clientBLENearbyActionDiscoveryEnsureStarted
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *clientBLENearbyActionDiscovery;
  SFDeviceDiscovery *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientBLENearbyActionDiscovery)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStarted]", 30, "BLE NearbyAction scanner start\n");
    }
    v3 = (SFDeviceDiscovery *)objc_alloc_init(off_100130DF8());
    clientBLENearbyActionDiscovery = self->_clientBLENearbyActionDiscovery;
    self->_clientBLENearbyActionDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_clientBLENearbyActionDiscovery, "setChangeFlags:", 1);
    -[SFDeviceDiscovery setDispatchQueue:](self->_clientBLENearbyActionDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_clientBLENearbyActionDiscovery, "setPurpose:", CFSTR("RPNearbyInvitation"));
    -[SFDeviceDiscovery setRssiThreshold:](self->_clientBLENearbyActionDiscovery, "setRssiThreshold:", -70);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_clientBLENearbyActionDiscovery, "setDiscoveryFlags:", 16);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000566C8;
    v9[3] = &unk_100112D00;
    v9[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_clientBLENearbyActionDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000566D4;
    v8[3] = &unk_100112D00;
    v8[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_clientBLENearbyActionDiscovery, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000566E0;
    v7[3] = &unk_100112D28;
    v7[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_clientBLENearbyActionDiscovery, "setDeviceChangedHandler:", v7);
    -[SFDeviceDiscovery setInterruptionHandler:](self->_clientBLENearbyActionDiscovery, "setInterruptionHandler:", &stru_100112D48);
    v5 = self->_clientBLENearbyActionDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005674C;
    v6[3] = &unk_100111860;
    v6[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_clientBLENearbyActionDiscoveryEnsureStopped
{
  SFDeviceDiscovery *clientBLENearbyActionDiscovery;
  NSMutableDictionary *discoveredDevices;
  OS_dispatch_source *clientNearbyActionDiscoveryTimer;
  OS_dispatch_source *v6;
  NSObject *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clientBLENearbyActionDiscovery)
  {
    if (dword_100130D88 <= 50
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStopped]", 50, "BLE NearbyAction discovery stop");
    }
    -[SFDeviceDiscovery invalidate](self->_clientBLENearbyActionDiscovery, "invalidate");
    clientBLENearbyActionDiscovery = self->_clientBLENearbyActionDiscovery;
    self->_clientBLENearbyActionDiscovery = 0;

  }
  discoveredDevices = self->_discoveredDevices;
  self->_discoveredDevices = 0;

  clientNearbyActionDiscoveryTimer = self->_clientNearbyActionDiscoveryTimer;
  if (clientNearbyActionDiscoveryTimer)
  {
    v7 = clientNearbyActionDiscoveryTimer;
    dispatch_source_cancel(v7);
    v6 = self->_clientNearbyActionDiscoveryTimer;
    self->_clientNearbyActionDiscoveryTimer = 0;

  }
}

- (void)_clientBLENearbyActionDiscoveryDeviceFound:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSMutableDictionary *discoveredDevices;
  NSMutableDictionary *v30;
  NSMutableDictionary *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;

  v38 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = objc_msgSend(v38, "deviceActionType") == 84;
  v5 = v38;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

    if (!v7)
    {
      if (dword_100130D88 <= 90
        && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
      {
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]", 90, "### Ignoring BLE device found: no ID, %@\n", v38);
      }
      goto LABEL_49;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bleDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "advertisementFields"));
    TypeID = CFDataGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v9, CFSTR("tatag"), TypeID, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identityOfSelfAndReturnError:", 0));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor bluetoothAddressData](self->_systemMonitor, "bluetoothAddressData"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "authTagForData:type:error:", v15, 2, 0));
      if (dword_100130D88 <= 30
        && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
      {
        v17 = v38;
        if ((objc_opt_respondsToSelector(v17, "shortDescription") & 1) != 0)
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "shortDescription"));
        }
        else if ((objc_opt_respondsToSelector(v17, "descriptionWithLevel:") & 1) != 0)
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "descriptionWithLevel:", 50));
        }
        else
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
        }
        v19 = (void *)v18;

        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]", 30, "Evaluating target AuthTag <%@> from device (%@) using BLE addr %.6a selfAuthTag <%@>\n", v12, v19, objc_msgSend(objc_retainAutorelease(v15), "bytes"), v16);
      }
      v20 = objc_retainAutorelease(v16);
      v21 = objc_msgSend(v20, "bytes");
      v22 = objc_retainAutorelease(v12);
      if (memcmp(v21, objc_msgSend(v22, "bytes"), (size_t)objc_msgSend(v22, "length")))
      {
        if (dword_100130D88 <= 30
          && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
        {
          LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]", 30, "Ignoring BLE device as target AuthTag <%@> did not match hash <%@>\n", v22, v20);
        }

LABEL_48:
LABEL_49:

        v5 = v38;
        goto LABEL_50;
      }

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v7));
    if (v23)
    {
      v14 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bleDevice"));
      v25 = objc_msgSend(v24, "isBLEDeviceReplaced");

      if (v25
        && dword_100130D88 <= 30
        && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bleDevice"));
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]", 30, "Replaced BLE device %@ -> %@", v26, v38);

      }
      v32 = objc_msgSend(v14, "updateWithSFDevice:", v38);
      if ((_DWORD)v32)
      {
        v33 = v32;
        if (objc_msgSend(v14, "inBubble"))
        {
          if (dword_100130D88 <= 10
            && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 10)))
          {
            v34 = CUDescriptionWithLevel(v38, 30);
            v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]", 10, "BLE device changed: %@\n", v35);

          }
          -[RPNearbyInvitationDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v14, v33);
        }
      }
      if ((objc_msgSend(v14, "inBubble") & 1) == 0)
        -[RPNIProximityEstimator sendSampleForDevice:](self->_proximityEstimator, "sendSampleForDevice:", v38);
      if (dword_100130D88 <= 10
        && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 10)))
      {
        v36 = CUDescriptionWithLevel(v14, 30);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]", 10, "BLE device in cache: %@\n", v37);

      }
    }
    else
    {
      if (dword_100130D88 <= 30
        && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
      {
        v27 = CUDescriptionWithLevel(v38, 30);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]", 30, "BLE device found: %@\n", v28);

      }
      v14 = objc_alloc_init((Class)RPNearbyInvitationDevice);
      objc_msgSend(v14, "setIdentifier:", v7);
      objc_msgSend(v14, "updateWithSFDevice:", v38);
      discoveredDevices = self->_discoveredDevices;
      if (!discoveredDevices)
      {
        v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v31 = self->_discoveredDevices;
        self->_discoveredDevices = v30;

        discoveredDevices = self->_discoveredDevices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v14, v7);
      -[SFDeviceDiscovery setScanRate:](self->_clientBLENearbyActionDiscovery, "setScanRate:", 30);
      -[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryScanRateStartTimer](self, "_clientBLENearbyActionDiscoveryScanRateStartTimer");
      -[RPNearbyInvitationDaemon _clientBLENearbyActionDisableDupeFilter](self, "_clientBLENearbyActionDisableDupeFilter");
      -[RPNIProximityEstimator sendSampleForDevice:](self->_proximityEstimator, "sendSampleForDevice:", v38);
      -[RPNearbyInvitationDaemon _update](self, "_update");
    }
    goto LABEL_48;
  }
LABEL_50:

}

- (void)_clientBLENearbyActionDiscoveryDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v5));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_discoveredDevices, "setObject:forKeyedSubscript:", 0, v5);
    if (objc_msgSend(v6, "inBubble"))
      -[RPNearbyInvitationDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v6);
    if (!-[NSMutableDictionary count](self->_discoveredDevices, "count"))
      -[RPNearbyInvitationDaemon _clientBLENearbyActionEnableDupeFilter](self, "_clientBLENearbyActionEnableDupeFilter");

  }
  else if (dword_100130D88 <= 90
         && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
  {
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceLost:]", 90, "### Ignoring BLE device lost: no ID, %@\n", v7);
  }

}

- (void)_clientBLENearbyActionDiscoveryScanRateStartTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *clientNearbyActionDiscoveryTimer;
  NSObject *v5;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientNearbyActionDiscoveryTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    clientNearbyActionDiscoveryTimer = self->_clientNearbyActionDiscoveryTimer;
    self->_clientNearbyActionDiscoveryTimer = v3;
    v5 = v3;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000570A0;
    handler[3] = &unk_1001110F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet(v5, 30.0, -1.0, 1.0);
    dispatch_activate(v5);

  }
}

- (void)_clientBLENearbyActionDisableDupeFilter
{
  OS_dispatch_source *clientDisabledDupeFilterTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((-[SFDeviceDiscovery changeFlags](self->_clientBLENearbyActionDiscovery, "changeFlags") & 4) == 0)
  {
    if (dword_100130D88 <= 50
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDisableDupeFilter]", 50, "Disabling dupe filter to measure RSSI");
    }
    -[SFDeviceDiscovery setChangeFlags:](self->_clientBLENearbyActionDiscovery, "setChangeFlags:", -[SFDeviceDiscovery changeFlags](self->_clientBLENearbyActionDiscovery, "changeFlags") | 4);
  }
  clientDisabledDupeFilterTimer = self->_clientDisabledDupeFilterTimer;
  if (clientDisabledDupeFilterTimer)
  {
    v4 = clientDisabledDupeFilterTimer;
    dispatch_source_cancel(v4);
    v5 = self->_clientDisabledDupeFilterTimer;
    self->_clientDisabledDupeFilterTimer = 0;

    v6 = self->_clientDisabledDupeFilterTimer;
    self->_clientDisabledDupeFilterTimer = 0;

  }
  v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v8 = self->_clientDisabledDupeFilterTimer;
  self->_clientDisabledDupeFilterTimer = v7;
  v9 = v7;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000572A8;
  handler[3] = &unk_1001110F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet(v9, 300.0, -1.0, 1.0);
  dispatch_activate(v9);

}

- (void)_clientBLENearbyActionEnableDupeFilter
{
  OS_dispatch_source *clientDisabledDupeFilterTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clientBLENearbyActionDiscovery)
  {
    if (dword_100130D88 <= 50
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionEnableDupeFilter]", 50, "Enabling dupe filter");
    }
    clientDisabledDupeFilterTimer = self->_clientDisabledDupeFilterTimer;
    if (clientDisabledDupeFilterTimer)
    {
      v4 = clientDisabledDupeFilterTimer;
      dispatch_source_cancel(v4);
      v5 = self->_clientDisabledDupeFilterTimer;
      self->_clientDisabledDupeFilterTimer = 0;

    }
    -[SFDeviceDiscovery setChangeFlags:](self->_clientBLENearbyActionDiscovery, "setChangeFlags:", (unint64_t)-[SFDeviceDiscovery changeFlags](self->_clientBLENearbyActionDiscovery, "changeFlags") & 0xFFFFFFFB);
  }
}

- (id)_idleSessionConnection
{
  NSMutableSet *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activatedSession", (_QWORD)v13));
        if (v7)
        {
          v8 = (void *)v7;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activatedSession"));
          if ((objc_msgSend(v9, "waitingToConnect") & 1) != 0)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activatedSession"));
            v11 = objc_msgSend(v10, "failedToConnect");

            if ((v11 & 1) == 0)
            {
              v3 = v6;
              goto LABEL_13;
            }
          }
          else
          {

          }
        }
      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }
LABEL_13:

  return v3;
}

- (BOOL)_clientBLENearbyActionAdvertiserShouldRun
{
  void *v3;
  void *v4;
  BOOL v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon _idleSessionConnection](self, "_idleSessionConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activatedSession"));
  v5 = v4 != 0;

  return v5;
}

- (void)_clientBLENearbyActionAdvertiserEnsureStarted
{
  void *v3;
  void *v4;
  SFService *v5;
  SFService *clientBLENearbyActionAdvertiser;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SFService *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientBLENearbyActionAdvertiser)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStarted]", 30, "BLE NearbyAction advertiser start\n");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon _idleSessionConnection](self, "_idleSessionConnection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activatedSession"));

    v5 = (SFService *)objc_alloc_init(off_100130E00());
    clientBLENearbyActionAdvertiser = self->_clientBLENearbyActionAdvertiser;
    self->_clientBLENearbyActionAdvertiser = v5;

    -[SFService setDeviceActionType:](self->_clientBLENearbyActionAdvertiser, "setDeviceActionType:", 56);
    -[SFService setDispatchQueue:](self->_clientBLENearbyActionAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    v7 = off_100130E08();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SFService setIdentifier:](self->_clientBLENearbyActionAdvertiser, "setIdentifier:", v8);

    -[SFService setLabel:](self->_clientBLENearbyActionAdvertiser, "setLabel:", CFSTR("RPNearbyInvitation"));
    -[SFService setPairSetupDisabled:](self->_clientBLENearbyActionAdvertiser, "setPairSetupDisabled:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bleTargetData"));
    -[SFService setTargetAuthTag:](self->_clientBLENearbyActionAdvertiser, "setTargetAuthTag:", v10);

    -[SFService setAdvertiseRate:](self->_clientBLENearbyActionAdvertiser, "setAdvertiseRate:", 50);
    v11 = self->_clientBLENearbyActionAdvertiser;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000576D4;
    v13[3] = &unk_1001121C0;
    v13[4] = self;
    v14 = v4;
    v12 = v4;
    -[SFService activateWithCompletion:](v11, "activateWithCompletion:", v13);

  }
}

- (void)_clientBLENearbyActionAdvertiserEnsureStopped
{
  SFService *clientBLENearbyActionAdvertiser;
  OS_dispatch_source *clientNearbyActionAdvertiserTimer;
  OS_dispatch_source *v5;
  NSObject *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clientBLENearbyActionAdvertiser)
  {
    if (dword_100130D88 <= 50
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStopped]", 50, "BLE NearbyAction advertiser stop");
    }
    -[SFService invalidate](self->_clientBLENearbyActionAdvertiser, "invalidate");
    clientBLENearbyActionAdvertiser = self->_clientBLENearbyActionAdvertiser;
    self->_clientBLENearbyActionAdvertiser = 0;

  }
  clientNearbyActionAdvertiserTimer = self->_clientNearbyActionAdvertiserTimer;
  if (clientNearbyActionAdvertiserTimer)
  {
    v6 = clientNearbyActionAdvertiserTimer;
    dispatch_source_cancel(v6);
    v5 = self->_clientNearbyActionAdvertiserTimer;
    self->_clientNearbyActionAdvertiserTimer = 0;

  }
}

- (void)_clientBLENearbyActionAdvertiserStartTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *clientNearbyActionAdvertiserTimer;
  NSObject *v5;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientNearbyActionAdvertiserTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    clientNearbyActionAdvertiserTimer = self->_clientNearbyActionAdvertiserTimer;
    self->_clientNearbyActionAdvertiserTimer = v3;
    v5 = v3;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005797C;
    handler[3] = &unk_1001110F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet(v5, 15.0, -1.0, 1.0);
    dispatch_activate(v5);

  }
}

- (BOOL)_clientProximityEstimatorShouldRun
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return -[NSMutableSet count](self->_activatedDiscoverySet, "count") != 0;
}

- (void)_clientProximityEstimatorEnsureStarted
{
  RPNIProximityEstimator *v3;
  RPNIProximityEstimator *proximityEstimator;
  RPNIProximityEstimator *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_proximityEstimator)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStarted]", 30, "Proximity estimator start\n");
    }
    v3 = objc_alloc_init(RPNIProximityEstimator);
    proximityEstimator = self->_proximityEstimator;
    self->_proximityEstimator = v3;

    -[RPNIProximityEstimator setInnerPresencePreset:](self->_proximityEstimator, "setInnerPresencePreset:", 6);
    -[RPNIProximityEstimator setInnerRegionName:](self->_proximityEstimator, "setInnerRegionName:", CFSTR("nearbyInvitation-inner"));
    -[RPNIProximityEstimator setOuterRegionName:](self->_proximityEstimator, "setOuterRegionName:", CFSTR("nearbyInvitation-outer"));
    -[RPNIProximityEstimator setDispatchQueue:](self->_proximityEstimator, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100057C14;
    v7[3] = &unk_100112D70;
    v7[4] = self;
    -[RPNIProximityEstimator setDeviceRegionChangedHandler:](self->_proximityEstimator, "setDeviceRegionChangedHandler:", v7);
    v5 = self->_proximityEstimator;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100057D48;
    v6[3] = &unk_100111860;
    v6[4] = self;
    -[RPNIProximityEstimator activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_clientProximityEstimatorEnsureStopped
{
  RPNIProximityEstimator *proximityEstimator;
  OS_dispatch_source *clientDisabledDupeFilterTimer;
  OS_dispatch_source *v5;
  NSObject *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityEstimator)
  {
    if (dword_100130D88 <= 50
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStopped]", 50, "Proximity estimator stop");
    }
    -[RPNIProximityEstimator invalidate](self->_proximityEstimator, "invalidate");
    proximityEstimator = self->_proximityEstimator;
    self->_proximityEstimator = 0;

  }
  clientDisabledDupeFilterTimer = self->_clientDisabledDupeFilterTimer;
  if (clientDisabledDupeFilterTimer)
  {
    v6 = clientDisabledDupeFilterTimer;
    dispatch_source_cancel(v6);
    v5 = self->_clientDisabledDupeFilterTimer;
    self->_clientDisabledDupeFilterTimer = 0;

  }
}

- (void)_clientReportFoundDevice:(id)a3
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "reportFoundDevice:outReason:", v4, 0, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
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

  v4 = *(_QWORD *)&a4;
  v6 = a3;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "reportChangedDevice:changes:", v6, v4, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_clientReportLostDevice:(id)a3
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "reportLostDevice:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_findMatchingDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "compareWithDeviceIdentifier:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_clientBLEServerShouldRun
{
  id v3;

  if (self->_prefClientEnabled && self->_prefGuestClientEnabled)
  {
    v3 = -[NSMutableDictionary count](self->_discoveredDevices, "count");
    if (v3)
      LOBYTE(v3) = -[NSMutableSet count](self->_activatedSessionSet, "count") != 0;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)_clientBLEServerEnsureStarted
{
  CUBLEServer *v3;
  CUBLEServer *bleServer;
  CUBLEServer *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_bleServer)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLEServerEnsureStarted]", 30, "BLE server start\n");
    }
    v3 = (CUBLEServer *)objc_alloc_init((Class)CUBLEServer);
    bleServer = self->_bleServer;
    self->_bleServer = v3;

    -[CUBLEServer setDispatchQueue:](self->_bleServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBLEServer setLabel:](self->_bleServer, "setLabel:", CFSTR("RPNearbyInvitation"));
    -[CUBLEServer setListenPSM:](self->_bleServer, "setListenPSM:", CBAssignedL2CAPPSMForNearbyInvitation);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000584AC;
    v7[3] = &unk_100111BD0;
    v7[4] = self;
    -[CUBLEServer setConnectionStartedHandler:](self->_bleServer, "setConnectionStartedHandler:", v7);
    v5 = self->_bleServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000584B8;
    v6[3] = &unk_100111860;
    v6[4] = self;
    -[CUBLEServer activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_clientBLEServerHandleConnectionStarted:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  NSMutableSet *bleServerConnections;
  NSMutableSet *v20;
  NSMutableSet *v21;
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)RPConnection);
  objc_msgSend(v5, "setBleConnection:", v4);
  objc_msgSend(v5, "setControlFlags:", 1536);
  objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v5, "setIdentityDaemon:", v6);

  v7 = objc_alloc((Class)NSString);
  v8 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v8;
  v9 = objc_msgSend(v7, "initWithFormat:", CFSTR("NICnx-%u"), v8);
  objc_msgSend(v5, "setLabel:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localDeviceInfo"));
  objc_msgSend(v5, "setLocalDeviceInfo:", v11);

  objc_msgSend(v5, "setPasswordType:", 0);
  objc_msgSend(v5, "setPresent:", 1);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = self->_xpcConnections;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activatedSession"));

        if (v18)
        {
          objc_msgSend(v5, "setClient:", v17);
          goto LABEL_11;
        }
      }
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100058904;
  v26[3] = &unk_100111860;
  v26[4] = v5;
  objc_msgSend(v5, "setReadErrorHandler:", v26);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100058A08;
  v25[3] = &unk_100111928;
  v25[4] = v5;
  v25[5] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v25);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100058A60;
  v24[3] = &unk_100111950;
  v24[4] = v5;
  v24[5] = self;
  objc_msgSend(v5, "setReceivedEventHandler:", v24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100058AF4;
  v23[3] = &unk_100111978;
  v23[4] = v5;
  v23[5] = self;
  objc_msgSend(v5, "setReceivedRequestHandler:", v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100058B9C;
  v22[3] = &unk_1001119A0;
  v22[4] = v5;
  v22[5] = self;
  objc_msgSend(v5, "setStateChangedHandler:", v22);
  bleServerConnections = self->_bleServerConnections;
  if (!bleServerConnections)
  {
    v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v21 = self->_bleServerConnections;
    self->_bleServerConnections = v20;

    bleServerConnections = self->_bleServerConnections;
  }
  -[NSMutableSet addObject:](bleServerConnections, "addObject:", v5);
  objc_msgSend(v5, "activate");

}

- (void)_clientBLEServerHandleConnectionEnded:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "setClient:", 0);
    -[NSMutableSet removeObject:](self->_bleServerConnections, "removeObject:", v4);

  }
}

- (void)_clientBLEServerHandleConnectionStateChange:(int)a3 cnx:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  if (a3 == 1)
  {
    v8 = v6;
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLEServerHandleConnectionStateChange:cnx:]", 30, "Nearby invitation BLE connection setup complete: %@\n", v8);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon _idleSessionConnection](self, "_idleSessionConnection"));
    objc_msgSend(v7, "sessionActivatedWithError:", 0);
    objc_msgSend(v7, "setNetCnx:", v8);
    -[RPNearbyInvitationDaemon _update](self, "_update");

    v6 = v8;
  }

}

- (void)_clientBLEServerEnsureStopped
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSMutableSet *bleServerConnections;
  CUBLEServer *bleServer;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self->_bleServer)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLEServerEnsureStopped]", 30, "BLE server stop\n");
    }
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_bleServerConnections;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "invalidate", (_QWORD)v10);
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    -[NSMutableSet removeAllObjects](self->_bleServerConnections, "removeAllObjects");
    bleServerConnections = self->_bleServerConnections;
    self->_bleServerConnections = 0;

    -[CUBLEServer invalidate](self->_bleServer, "invalidate");
    bleServer = self->_bleServer;
    self->_bleServer = 0;

  }
}

- (void)_serverEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryShouldRun](self, "_serverBLENearbyInfoDiscoveryShouldRun"))
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStarted](self, "_serverBLENearbyInfoDiscoveryEnsureStarted");
  }
  else
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStopped](self, "_serverBLENearbyInfoDiscoveryEnsureStopped");
  }
  if (-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryShouldRun](self, "_serverBLENearbyActionDiscoveryShouldRun"))
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStarted](self, "_serverBLENearbyActionDiscoveryEnsureStarted");
  }
  else
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStopped](self, "_serverBLENearbyActionDiscoveryEnsureStopped");
  }
  if (-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserShouldRun](self, "_serverBLENearbyActionAdvertiserShouldRun"))
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStarted](self, "_serverBLENearbyActionAdvertiserEnsureStarted");
  }
  else
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStopped](self, "_serverBLENearbyActionAdvertiserEnsureStopped");
  }
  if (-[RPNearbyInvitationDaemon _serverBLEClientConnectionShouldStart](self, "_serverBLEClientConnectionShouldStart"))
    -[RPNearbyInvitationDaemon _serverBLEClientConnectionEnsureStarted](self, "_serverBLEClientConnectionEnsureStarted");
}

- (void)_serverEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStopped](self, "_serverBLENearbyInfoDiscoveryEnsureStopped");
  -[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStopped](self, "_serverBLENearbyActionDiscoveryEnsureStopped");
  -[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStopped](self, "_serverBLENearbyActionAdvertiserEnsureStopped");
}

- (BOOL)_serverBLENearbyInfoDiscoveryShouldRun
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return -[NSMutableDictionary count](self->_activatedServerXPCCnxMap, "count") != 0;
}

- (void)_serverBLENearbyInfoDiscoveryEnsureStarted
{
  RPCompanionLinkClient *v3;
  RPCompanionLinkClient *bleNearbyInfoDiscovery;
  RPCompanionLinkClient *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleNearbyInfoDiscovery)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStarted]", 30, "BLE NearbyInfo scanner start\n");
    }
    v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    bleNearbyInfoDiscovery = self->_bleNearbyInfoDiscovery;
    self->_bleNearbyInfoDiscovery = v3;

    -[RPCompanionLinkClient setDispatchQueue:](self->_bleNearbyInfoDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[RPCompanionLinkClient setEncodeSensitiveProperties:](self->_bleNearbyInfoDiscovery, "setEncodeSensitiveProperties:", 1);
    -[RPCompanionLinkClient setControlFlags:](self->_bleNearbyInfoDiscovery, "setControlFlags:", 0x200000002);
    if (self->_prefGuestServerEnabled)
    {
      -[RPCompanionLinkClient setControlFlags:](self->_bleNearbyInfoDiscovery, "setControlFlags:", (unint64_t)-[RPCompanionLinkClient controlFlags](self->_bleNearbyInfoDiscovery, "controlFlags") | 0x400);
      -[RPCompanionLinkClient setFlags:](self->_bleNearbyInfoDiscovery, "setFlags:", 1);
    }
    if (!self->_prefServerRSSIDisabled)
      -[RPCompanionLinkClient setRssiThreshold:](self->_bleNearbyInfoDiscovery, "setRssiThreshold:", -57);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005912C;
    v9[3] = &unk_100112DB8;
    v9[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_bleNearbyInfoDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100059138;
    v8[3] = &unk_100112DB8;
    v8[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_bleNearbyInfoDiscovery, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100059144;
    v7[3] = &unk_100112DE0;
    v7[4] = self;
    -[RPCompanionLinkClient setDeviceChangedHandler:](self->_bleNearbyInfoDiscovery, "setDeviceChangedHandler:", v7);
    v5 = self->_bleNearbyInfoDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100059150;
    v6[3] = &unk_100111860;
    v6[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_serverBLENearbyInfoDiscoveryEnsureStopped
{
  RPCompanionLinkClient *bleNearbyInfoDiscovery;
  NSMutableSet *devicesWantingInvitations;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_bleNearbyInfoDiscovery)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStopped]", 30, "BLE NearbyInfo scanner stop\n");
    }
    -[RPCompanionLinkClient invalidate](self->_bleNearbyInfoDiscovery, "invalidate");
    bleNearbyInfoDiscovery = self->_bleNearbyInfoDiscovery;
    self->_bleNearbyInfoDiscovery = 0;

  }
  devicesWantingInvitations = self->_devicesWantingInvitations;
  self->_devicesWantingInvitations = 0;

  -[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:](self, "setBleDeviceWantingInvitations:", 0);
}

- (void)_serverBLENearbyInfoDiscoveryDeviceFound:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSMutableSet *devicesWantingInvitations;
  NSMutableSet *v12;
  NSMutableSet *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_devicesWantingInvitations;
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "isEqualToDevice:", v4) & 1) != 0)
        {

          if (dword_100130D88 <= 10
            && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 10)))
          {
            LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryDeviceFound:]", 10, "BLE NearbyInfo device exists: %@\n", v4);
          }
          goto LABEL_24;
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (dword_100130D88 <= 30 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryDeviceFound:]", 30, "BLE NearbyInfo scanner found device: %@ %@\n", v4, v10, (_QWORD)v15);

  }
  devicesWantingInvitations = self->_devicesWantingInvitations;
  if (!devicesWantingInvitations)
  {
    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v13 = self->_devicesWantingInvitations;
    self->_devicesWantingInvitations = v12;

    devicesWantingInvitations = self->_devicesWantingInvitations;
  }
  -[NSMutableSet addObject:](devicesWantingInvitations, "addObject:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon bleDeviceWantingInvitations](self, "bleDeviceWantingInvitations"));

  if (!v14)
    -[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:](self, "setBleDeviceWantingInvitations:", v4);
  -[RPNearbyInvitationDaemon _update](self, "_update");
  if ((unint64_t)-[NSMutableSet count](self->_devicesWantingInvitations, "count") >= 2)
    -[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserRestartTimer](self, "_serverBLENearbyActionAdvertiserRestartTimer");
LABEL_24:

}

- (void)_serverBLENearbyInfoDiscoveryDeviceLost:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableSet *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_devicesWantingInvitations;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      if ((objc_msgSend(v10, "isEqualToDevice:", v4) & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_17;
    if (dword_100130D88 <= 50
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryDeviceLost:]", 50, "BLE NearbyInfo scanner lost device wanting invitations: %@\n", v4);
    }
    -[NSMutableSet removeObject:](self->_devicesWantingInvitations, "removeObject:", v11);
    -[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:](self, "setBleDeviceWantingInvitations:", 0);
    -[RPNearbyInvitationDaemon _update](self, "_update");
  }
  else
  {
LABEL_9:
    v11 = v5;
  }

LABEL_17:
}

- (BOOL)_serverBLENearbyActionDiscoveryShouldRun
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return -[NSMutableSet count](self->_devicesWantingInvitations, "count") != 0;
}

- (void)_serverBLENearbyActionDiscoveryEnsureStarted
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *bleNearbyActionDiscovery;
  SFDeviceDiscovery *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleNearbyActionDiscovery)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStarted]", 30, "BLE NearbyAction scanner start\n");
    }
    v3 = (SFDeviceDiscovery *)objc_alloc_init(off_100130DF8());
    bleNearbyActionDiscovery = self->_bleNearbyActionDiscovery;
    self->_bleNearbyActionDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleNearbyActionDiscovery, "setChangeFlags:", 1);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleNearbyActionDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_bleNearbyActionDiscovery, "setPurpose:", CFSTR("RPNearbyInvitation"));
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleNearbyActionDiscovery, "setRssiThreshold:", -60);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleNearbyActionDiscovery, "setDiscoveryFlags:", 16);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100059894;
    v8[3] = &unk_100112D00;
    v8[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleNearbyActionDiscovery, "setDeviceFoundHandler:", v8);
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleNearbyActionDiscovery, "setDeviceLostHandler:", &stru_100112E20);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100059920;
    v7[3] = &unk_100112D28;
    v7[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleNearbyActionDiscovery, "setDeviceChangedHandler:", v7);
    -[SFDeviceDiscovery setInterruptionHandler:](self->_bleNearbyActionDiscovery, "setInterruptionHandler:", &stru_100112E40);
    v5 = self->_bleNearbyActionDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005998C;
    v6[3] = &unk_100111860;
    v6[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_serverBLENearbyActionDiscoveryEnsureStopped
{
  SFDeviceDiscovery *bleNearbyActionDiscovery;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SFDeviceDiscovery invalidate](self->_bleNearbyActionDiscovery, "invalidate");
  bleNearbyActionDiscovery = self->_bleNearbyActionDiscovery;
  self->_bleNearbyActionDiscovery = 0;

}

- (void)_serverBLENearbyActionDiscoveryDeviceFound:(id)a3
{
  void *v4;
  void *v5;
  RPNearbyInvitationDevice *bleDeviceAcceptedInvitations;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v10;

  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v10, "deviceActionType") == 56)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

    if (v5)
    {
      bleDeviceAcceptedInvitations = self->_bleDeviceAcceptedInvitations;
      if (bleDeviceAcceptedInvitations
        && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDevice identifier](bleDeviceAcceptedInvitations, "identifier")),
            v8 = objc_msgSend(v5, "isEqualToString:", v7),
            v7,
            (v8 & 1) == 0))
      {
        if (dword_100130D88 <= 30
          && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
        {
          LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryDeviceFound:]", 30, "Ignoring new BLE device (%@) that accepted invitation while accepting from existing device (%@)\n", v10, self->_bleDeviceAcceptedInvitations);
        }
      }
      else
      {
        if (dword_100130D88 <= 30
          && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
        {
          LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryDeviceFound:]", 30, "BLE NearbyAction found device: %@\n", v10);
        }
        v9 = objc_alloc_init((Class)RPNearbyInvitationDevice);
        objc_msgSend(v9, "setIdentifier:", v5);
        objc_msgSend(v9, "updateWithSFDevice:", v10);
        -[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:](self, "setBleDeviceWantingInvitations:", 0);
        -[RPNearbyInvitationDaemon setBleDeviceAcceptedInvitations:](self, "setBleDeviceAcceptedInvitations:", v9);
        -[RPNearbyInvitationDaemon _update](self, "_update");

      }
    }
    else if (dword_100130D88 <= 30
           && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryDeviceFound:]", 30, "Ignoring device without an identifier: %@\n", v10);
    }

  }
  else if (dword_100130D88 <= 10
         && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 10)))
  {
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryDeviceFound:]", 10, "### Ignoring BLE device with wrong action type: %@\n", v10);
  }

}

- (BOOL)_serverBLENearbyActionAdvertiserShouldRun
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return -[NSMutableSet count](self->_devicesWantingInvitations, "count") != 0;
}

- (void)_serverBLENearbyActionAdvertiserEnsureStarted
{
  void *v3;
  id v4;
  SFService *bleNearbyActionAdvertiser;
  id v6;
  SFService *v7;
  SFService *v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  SFService *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon bleDeviceWantingInvitations](self, "bleDeviceWantingInvitations"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bleTargetData"));
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (bleNearbyActionAdvertiser)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SFService targetAuthTag](bleNearbyActionAdvertiser, "targetAuthTag"));
    if ((unint64_t)-[NSMutableSet count](self->_devicesWantingInvitations, "count") >= 2)
    {

      v4 = 0;
    }
    if (v6 != v4)
    {
      if (dword_100130D88 <= 30
        && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
      {
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStarted]", 30, "BLE NearbyAction advertiser updating target %@ -> %@ \n", v6, v4);
      }
      -[SFService setTargetAuthTag:](self->_bleNearbyActionAdvertiser, "setTargetAuthTag:", v4);
    }

  }
  else
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStarted]", 30, "BLE NearbyAction advertiser start\n");
    }
    v7 = (SFService *)objc_alloc_init(off_100130E00());
    v8 = self->_bleNearbyActionAdvertiser;
    self->_bleNearbyActionAdvertiser = v7;

    -[SFService setDeviceActionType:](self->_bleNearbyActionAdvertiser, "setDeviceActionType:", 84);
    -[SFService setDispatchQueue:](self->_bleNearbyActionAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    v9 = off_100130E10();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SFService setIdentifier:](self->_bleNearbyActionAdvertiser, "setIdentifier:", v10);

    -[SFService setLabel:](self->_bleNearbyActionAdvertiser, "setLabel:", CFSTR("RPNearbyInvitation"));
    -[SFService setPairSetupDisabled:](self->_bleNearbyActionAdvertiser, "setPairSetupDisabled:", 1);
    -[SFService setAdvertiseRate:](self->_bleNearbyActionAdvertiser, "setAdvertiseRate:", 50);
    v11 = -[NSMutableSet count](self->_devicesWantingInvitations, "count");
    if (v11 == (id)1)
      -[SFService setTargetAuthTag:](self->_bleNearbyActionAdvertiser, "setTargetAuthTag:", v4);
    v12 = v11 == (id)1;
    v13 = self->_bleNearbyActionAdvertiser;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100059F84;
    v14[3] = &unk_100112E68;
    v14[4] = self;
    v17 = v12;
    v15 = v3;
    v4 = v4;
    v16 = v4;
    -[SFService activateWithCompletion:](v13, "activateWithCompletion:", v14);

  }
}

- (void)_serverBLENearbyActionAdvertiserEnsureStopped
{
  SFService *bleNearbyActionAdvertiser;
  OS_dispatch_source *serverNearbyActionAdvertiserTimer;
  OS_dispatch_source *v5;
  NSObject *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SFService invalidate](self->_bleNearbyActionAdvertiser, "invalidate");
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  self->_bleNearbyActionAdvertiser = 0;

  serverNearbyActionAdvertiserTimer = self->_serverNearbyActionAdvertiserTimer;
  if (serverNearbyActionAdvertiserTimer)
  {
    v6 = serverNearbyActionAdvertiserTimer;
    dispatch_source_cancel(v6);
    v5 = self->_serverNearbyActionAdvertiserTimer;
    self->_serverNearbyActionAdvertiserTimer = 0;

  }
}

- (void)_serverBLENearbyActionAdvertiserRestartTimer
{
  OS_dispatch_source *serverNearbyActionAdvertiserTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_bleNearbyActionAdvertiser)
  {
    serverNearbyActionAdvertiserTimer = self->_serverNearbyActionAdvertiserTimer;
    if (serverNearbyActionAdvertiserTimer)
    {
      v4 = serverNearbyActionAdvertiserTimer;
      dispatch_source_cancel(v4);
      v5 = self->_serverNearbyActionAdvertiserTimer;
      self->_serverNearbyActionAdvertiserTimer = 0;

      if (dword_100130D88 <= 50
        && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
      {
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserRestartTimer]", 50, "Restarting HasInvitation advertiser timer\n");
      }
    }
    else if (dword_100130D88 <= 50
           && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserRestartTimer]", 50, "Starting HasInvitation advertiser timer\n");
    }
    v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v7 = self->_serverNearbyActionAdvertiserTimer;
    self->_serverNearbyActionAdvertiserTimer = v6;
    v8 = v6;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005A2B0;
    handler[3] = &unk_1001110F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet(v8, 45.0, -1.0, 1.0);
    dispatch_activate(v8);

  }
}

- (BOOL)_serverBLEClientConnectionShouldStart
{
  uint64_t v3;
  void *v4;
  id v5;
  BOOL result;

  result = 0;
  if (self->_prefServerEnabled && self->_prefGuestServerEnabled)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon bleDeviceAcceptedInvitations](self, "bleDeviceAcceptedInvitations"));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[NSMutableDictionary count](self->_bleClientConnections, "count");

      if (!v5)
        return 1;
    }
  }
  return result;
}

- (void)_serverBLEClientConnectionEnsureStarted
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  NSMutableDictionary *bleClientConnections;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[7];
  _QWORD v26[7];
  _QWORD v27[7];
  _QWORD v28[7];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = objc_alloc_init((Class)RPConnection);
  ++self->_sessionIDLast;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon bleDeviceAcceptedInvitations](self, "bleDeviceAcceptedInvitations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

  objc_msgSend(v3, "setBlePeerIdentifier:", v7);
  objc_msgSend(v3, "setBleClientUseCase:", 131091);
  objc_msgSend(v3, "setControlFlags:", (unint64_t)objc_msgSend(v3, "controlFlags") | 0x600);
  objc_msgSend(v3, "setDispatchQueue:", self->_dispatchQueue);
  v8 = objc_alloc((Class)NSString);
  v9 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v9;
  v10 = objc_msgSend(v8, "initWithFormat:", CFSTR("NICnx-%u"), v9);
  objc_msgSend(v3, "setLabel:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localDeviceInfo"));
  objc_msgSend(v3, "setLocalDeviceInfo:", v12);

  objc_msgSend(v3, "setPasswordType:", 0);
  objc_msgSend(v3, "setPresent:", 1);
  objc_msgSend(v3, "setBleConnectionPSM:", CBAssignedL2CAPPSMForNearbyInvitation);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = self->_xpcConnections;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activatedServer"));

        if (v19)
        {
          objc_msgSend(v3, "setClient:", v18);
          goto LABEL_11;
        }
      }
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_11:

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10005A7C4;
  v28[3] = &unk_1001116C8;
  v28[4] = v3;
  v28[5] = self;
  v28[6] = v4;
  objc_msgSend(v3, "setInvalidationHandler:", v28);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10005A838;
  v27[3] = &unk_100112E90;
  v27[4] = v3;
  v27[5] = self;
  v27[6] = v4;
  objc_msgSend(v3, "setReceivedEventHandler:", v27);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10005A8C8;
  v26[3] = &unk_100112EB8;
  v26[4] = v3;
  v26[5] = self;
  v26[6] = v4;
  objc_msgSend(v3, "setReceivedRequestHandler:", v26);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005A96C;
  v25[3] = &unk_1001119F0;
  v25[4] = v3;
  v25[5] = self;
  v25[6] = v4;
  objc_msgSend(v3, "setStateChangedHandler:", v25);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005A9B8;
  v24[3] = &unk_1001121C0;
  v24[4] = v3;
  v24[5] = v4;
  objc_msgSend(v3, "setReadErrorHandler:", v24);
  bleClientConnections = self->_bleClientConnections;
  if (!bleClientConnections)
  {
    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v22 = self->_bleClientConnections;
    self->_bleClientConnections = v21;

    bleClientConnections = self->_bleClientConnections;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](bleClientConnections, "setObject:forKeyedSubscript:", v3, v23);

  objc_msgSend(v3, "activate");
}

- (void)_bleClientConnectionEnded:(id)a3
{
  NSMutableDictionary *bleClientConnections;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "blePeerIdentifier"));
  bleClientConnections = self->_bleClientConnections;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](bleClientConnections, "setObject:forKeyedSubscript:", 0, v5);

  -[RPNearbyInvitationDaemon setBleDeviceAcceptedInvitations:](self, "setBleDeviceAcceptedInvitations:", 0);
}

- (void)_bleClientConnectionStateChanged:(int)a3 cnx:(id)a4 sessionID:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "client"));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activatedServer"));

    if (v11)
    {
      -[RPNearbyInvitationDaemon setBleDeviceAcceptedInvitations:](self, "setBleDeviceAcceptedInvitations:", 0);
      if (a3 == 1)
        objc_msgSend(v10, "sessionStartWithID:netCnx:completion:", v8, v12, &stru_100112EF8);
      else
        objc_msgSend(v10, "sessionEndedWithID:netCnx:", v8, v12);
    }
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  RPNearbyInvitationXPCConnection *v6;
  NSMutableSet *xpcConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  RPNearbyInvitationXPCConnection *v11;
  void *v12;
  _QWORD v14[5];
  RPNearbyInvitationXPCConnection *v15;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = -[RPNearbyInvitationXPCConnection initWithDaemon:xpcCnx:]([RPNearbyInvitationXPCConnection alloc], "initWithDaemon:xpcCnx:", self, v5);
  -[RPNearbyInvitationXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  ++self->_xpcLastID;
  -[RPNearbyInvitationXPCConnection setXpcID:](v6, "setXpcID:");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPNearbyInvitationXPCDaemonInterface));
  objc_msgSend(v5, "setExportedInterface:", v10);

  objc_msgSend(v5, "setExportedObject:", v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005ADD0;
  v14[3] = &unk_100111928;
  v14[4] = self;
  v11 = v6;
  v15 = v11;
  objc_msgSend(v5, "setInvalidationHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPNearbyInvitationXPCClientInterface));
  objc_msgSend(v5, "setRemoteObjectInterface:", v12);

  objc_msgSend(v5, "resume");
  if (dword_100130D88 <= 20 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 20)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started from %#{pid}\n", objc_msgSend(v5, "processIdentifier"));

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    objc_msgSend(v4, "connectionInvalidated");
    -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v4);
    -[RPNearbyInvitationDaemon _update](self, "_update");
  }

}

- (void)_update
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10005AF20;
    v5[3] = &unk_1001110F8;
    v5[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v5);
    -[CUSystemMonitor activateWithCompletion:](self->_systemMonitor, "activateWithCompletion:", 0);
  }
  if (self->_prefClientEnabled || self->_prefGuestClientEnabled)
    -[RPNearbyInvitationDaemon _clientEnsureStarted](self, "_clientEnsureStarted");
  else
    -[RPNearbyInvitationDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
  if (self->_prefServerEnabled || self->_prefGuestServerEnabled)
    -[RPNearbyInvitationDaemon _serverEnsureStarted](self, "_serverEnsureStarted");
  else
    -[RPNearbyInvitationDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
}

- (void)_handleServerActivation:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *activatedServerXPCCnxMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activatedServer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceType"));

  if (v5)
  {
    activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
    if (!activatedServerXPCCnxMap)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v8 = self->_activatedServerXPCCnxMap;
      self->_activatedServerXPCCnxMap = v7;

      activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](activatedServerXPCCnxMap, "setObject:forKeyedSubscript:", v9, v5);
  }

}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 xpcCnx:(id)a6 sessionID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *dispatchQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B0D0;
  block[3] = &unk_100112F20;
  v24 = v15;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v15;
  dispatch_async(dispatchQueue, block);

}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 xpcCnx:(id)a7 sessionID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *dispatchQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  dispatchQueue = self->_dispatchQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10005B340;
  v27[3] = &unk_100112F48;
  v28 = v18;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v32 = v19;
  v33 = v17;
  v21 = v19;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  v26 = v18;
  dispatch_async(dispatchQueue, v27);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (SFService)bleNearbyActionAdvertiser
{
  return self->_bleNearbyActionAdvertiser;
}

- (void)setBleNearbyActionAdvertiser:(id)a3
{
  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiser, a3);
}

- (SFService)clientBLENearbyActionAdvertiser
{
  return self->_clientBLENearbyActionAdvertiser;
}

- (void)setClientBLENearbyActionAdvertiser:(id)a3
{
  objc_storeStrong((id *)&self->_clientBLENearbyActionAdvertiser, a3);
}

- (SFDeviceDiscovery)bleNearbyActionDiscovery
{
  return self->_bleNearbyActionDiscovery;
}

- (void)setBleNearbyActionDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_bleNearbyActionDiscovery, a3);
}

- (SFDeviceDiscovery)clientBLENearbyActionDiscovery
{
  return self->_clientBLENearbyActionDiscovery;
}

- (void)setClientBLENearbyActionDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_clientBLENearbyActionDiscovery, a3);
}

- (unsigned)cnxIDLast
{
  return self->_cnxIDLast;
}

- (void)setCnxIDLast:(unsigned int)a3
{
  self->_cnxIDLast = a3;
}

- (RPCompanionLinkClient)bleNearbyInfoDiscovery
{
  return self->_bleNearbyInfoDiscovery;
}

- (void)setBleNearbyInfoDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_bleNearbyInfoDiscovery, a3);
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (NSMutableSet)devicesWantingInvitations
{
  return self->_devicesWantingInvitations;
}

- (void)setDevicesWantingInvitations:(id)a3
{
  objc_storeStrong((id *)&self->_devicesWantingInvitations, a3);
}

- (RPCompanionLinkDevice)bleDeviceWantingInvitations
{
  return self->_bleDeviceWantingInvitations;
}

- (RPNearbyInvitationDevice)bleDeviceAcceptedInvitations
{
  return self->_bleDeviceAcceptedInvitations;
}

- (CUBLEServer)bleServer
{
  return self->_bleServer;
}

- (void)setBleServer:(id)a3
{
  objc_storeStrong((id *)&self->_bleServer, a3);
}

- (NSMutableSet)bleServerConnections
{
  return self->_bleServerConnections;
}

- (void)setBleServerConnections:(id)a3
{
  objc_storeStrong((id *)&self->_bleServerConnections, a3);
}

- (NSMutableDictionary)bleClientConnections
{
  return self->_bleClientConnections;
}

- (void)setBleClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_bleClientConnections, a3);
}

- (RPNIProximityEstimator)proximityEstimator
{
  return self->_proximityEstimator;
}

- (void)setProximityEstimator:(id)a3
{
  objc_storeStrong((id *)&self->_proximityEstimator, a3);
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (BOOL)invalidateDone
{
  return self->_invalidateDone;
}

- (void)setInvalidateDone:(BOOL)a3
{
  self->_invalidateDone = a3;
}

- (BOOL)prefClientEnabled
{
  return self->_prefClientEnabled;
}

- (void)setPrefClientEnabled:(BOOL)a3
{
  self->_prefClientEnabled = a3;
}

- (BOOL)prefGuestServerEnabled
{
  return self->_prefGuestServerEnabled;
}

- (void)setPrefGuestServerEnabled:(BOOL)a3
{
  self->_prefGuestServerEnabled = a3;
}

- (BOOL)prefGuestClientEnabled
{
  return self->_prefGuestClientEnabled;
}

- (void)setPrefGuestClientEnabled:(BOOL)a3
{
  self->_prefGuestClientEnabled = a3;
}

- (BOOL)prefServerEnabled
{
  return self->_prefServerEnabled;
}

- (void)setPrefServerEnabled:(BOOL)a3
{
  self->_prefServerEnabled = a3;
}

- (BOOL)prefServerRSSIDisabled
{
  return self->_prefServerRSSIDisabled;
}

- (void)setPrefServerRSSIDisabled:(BOOL)a3
{
  self->_prefServerRSSIDisabled = a3;
}

- (OS_dispatch_source)clientNearbyActionDiscoveryTimer
{
  return self->_clientNearbyActionDiscoveryTimer;
}

- (void)setClientNearbyActionDiscoveryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clientNearbyActionDiscoveryTimer, a3);
}

- (OS_dispatch_source)serverNearbyActionAdvertiserTimer
{
  return self->_serverNearbyActionAdvertiserTimer;
}

- (void)setServerNearbyActionAdvertiserTimer:(id)a3
{
  objc_storeStrong((id *)&self->_serverNearbyActionAdvertiserTimer, a3);
}

- (OS_dispatch_source)clientNearbyActionAdvertiserTimer
{
  return self->_clientNearbyActionAdvertiserTimer;
}

- (void)setClientNearbyActionAdvertiserTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clientNearbyActionAdvertiserTimer, a3);
}

- (OS_dispatch_source)clientDisabledDupeFilterTimer
{
  return self->_clientDisabledDupeFilterTimer;
}

- (void)setClientDisabledDupeFilterTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clientDisabledDupeFilterTimer, a3);
}

- (unsigned)sessionIDLast
{
  return self->_sessionIDLast;
}

- (void)setSessionIDLast:(unsigned int)a3
{
  self->_sessionIDLast = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDisabledDupeFilterTimer, 0);
  objc_storeStrong((id *)&self->_clientNearbyActionAdvertiserTimer, 0);
  objc_storeStrong((id *)&self->_serverNearbyActionAdvertiserTimer, 0);
  objc_storeStrong((id *)&self->_clientNearbyActionDiscoveryTimer, 0);
  objc_storeStrong((id *)&self->_proximityEstimator, 0);
  objc_storeStrong((id *)&self->_bleClientConnections, 0);
  objc_storeStrong((id *)&self->_bleServerConnections, 0);
  objc_storeStrong((id *)&self->_bleServer, 0);
  objc_storeStrong((id *)&self->_bleDeviceAcceptedInvitations, 0);
  objc_storeStrong((id *)&self->_bleDeviceWantingInvitations, 0);
  objc_storeStrong((id *)&self->_devicesWantingInvitations, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoDiscovery, 0);
  objc_storeStrong((id *)&self->_clientBLENearbyActionDiscovery, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionDiscovery, 0);
  objc_storeStrong((id *)&self->_clientBLENearbyActionAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiser, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_activatedServerXPCCnxMap, 0);
  objc_storeStrong((id *)&self->_activatedSessionSet, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_activatedDiscoverySet, 0);
}

@end
