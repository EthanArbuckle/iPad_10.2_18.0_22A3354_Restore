@implementation CBDaemonServer

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
    -[CBDaemonServer _xpcConnectionAccept:](self, "_xpcConnectionAccept:", v9);
    goto LABEL_7;
  }
  v4 = v9;
  if (v9 == &_xpc_error_connection_invalid)
  {
    if (dword_100977980 <= 30)
    {
      if (dword_100977980 != -1 || (v8 = _LogCategory_Initialize(&dword_100977980, 30), v4 = v9, v8))
      {
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcListenerEvent:]", 30, "XPC listener invalidated");
        goto LABEL_7;
      }
    }
  }
  else if (dword_100977980 <= 90)
  {
    if (dword_100977980 != -1 || (v7 = _LogCategory_Initialize(&dword_100977980, 90), v4 = v9, v7))
    {
      v5 = CUPrintXPC(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcListenerEvent:]", 90, "### XPC listener error: %@", v6);

LABEL_7:
      v4 = v9;
    }
  }

}

- (void)scheduleDiscoveryUpdateImmediate:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *bleDiscoveryArray;
  NSMutableArray *whbDiscoveryArray;

  v3 = a3;
  bleDiscoveryArray = self->_bleDiscoveryArray;
  self->_bleDiscoveryArray = 0;

  self->_deviceMonitorFlagsValid = 0;
  whbDiscoveryArray = self->_whbDiscoveryArray;
  self->_whbDiscoveryArray = 0;

  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", v3);
}

- (void)_xpcConnectionAccept:(id)a3
{
  _xpc_connection_s *v4;
  CBDaemonXPCConnection *v5;
  NSMutableSet *xpcConnections;
  NSMutableSet *v7;
  NSMutableSet *v8;
  _QWORD handler[5];

  v4 = (_xpc_connection_s *)a3;
  v5 = objc_alloc_init(CBDaemonXPCConnection);
  -[CBDaemonXPCConnection setDaemon:](v5, "setDaemon:", self);
  -[CBDaemonXPCConnection setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[CBDaemonXPCConnection setPid:](v5, "setPid:", xpc_connection_get_pid(v4));
  -[CBDaemonXPCConnection setXpcCnx:](v5, "setXpcCnx:", v4);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10006591C;
  handler[3] = &unk_100917878;
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
  -[CBDaemonXPCConnection activate](v5, "activate");

}

- (void)_performUserControllerActionWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  CUSystemMonitor *v5;
  CBUserController *v6;
  CBUserController *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(id, _QWORD);
  _QWORD v12[5];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = self->_systemMonitor;
  if ((-[CUSystemMonitor firstUnlocked](v5, "firstUnlocked") & 1) != 0)
  {
    v6 = self->_userController;
    if (v6)
    {
      v7 = v6;
      v4[2](v4, 0);
    }
    else
    {
      v7 = (CBUserController *)objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor userControllerClass](self->_stackAdaptor, "userControllerClass")));
      -[CBUserController setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10008BCC0;
      v12[3] = &unk_100917080;
      v12[4] = self;
      -[CBUserController setInvalidationHandler:](v7, "setInvalidationHandler:", v12);
      objc_storeStrong((id *)&self->_userController, v7);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10008BCD0;
      v10[3] = &unk_100917D80;
      v10[4] = self;
      v11 = v4;
      -[CBUserController activateWithCompletion:](v7, "activateWithCompletion:", v10);

    }
  }
  else
  {
    v8 = CBErrorF(4294960520, "Device not first unlocked for user controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    ((void (**)(id, void *))v4)[2](v4, v9);

  }
}

- (void)_update
{
  unsigned int assertionFlags;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  const char *v18;
  const char *v19;
  NSMutableArray *bleDiscoveryArray;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  self->_updatePending = 0;
  if (!self->_assertionFlagsValid)
  {
    assertionFlags = self->_assertionFlags;
    self->_assertionFlags = 0;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v4 = self->_xpcConnections;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "activatedController"));
          v10 = v9;
          if (v9)
            self->_assertionFlags |= objc_msgSend(v9, "assertionFlags");

        }
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v6);
    }

    self->_assertionFlagsValid = 1;
    v11 = self->_assertionFlags;
    if ((_DWORD)v11 != assertionFlags)
    {
      if (dword_100977980 <= 30)
      {
        if (dword_100977980 != -1
          || (v16 = _LogCategory_Initialize(&dword_100977980, 30), v11 = self->_assertionFlags, v16))
        {
          v12 = CUPrintFlags32(v11, &unk_1007378B8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          v14 = CUPrintFlags32(self->_assertionFlags ^ assertionFlags, &unk_1007378B8);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _update]", 30, "AssertionFlags changed: %@ (^ %@)", v13, v15, (_QWORD)v26);

          v11 = self->_assertionFlags;
        }
      }
      -[CBExtensionsDaemon setAssertionFlags:](self->_extensionsDaemon, "setAssertionFlags:", v11);
    }
  }
  if (self->_wifiCriticalOverride)
    v17 = self->_wifiCriticalOverride == 1;
  else
    v17 = (-[CUSystemMonitor wifiFlags](self->_systemMonitor, "wifiFlags") >> 8) & 1;
  if (v17 != self->_wifiCritical)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v18 = "no";
      if (v17)
        v19 = "no";
      else
        v19 = "yes";
      if (v17)
        v18 = "yes";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _update]", 30, "WiFi critical changed: %s -> %s", v19, v18);
    }
    self->_wifiCritical = v17;
    bleDiscoveryArray = self->_bleDiscoveryArray;
    self->_bleDiscoveryArray = 0;

  }
  if (-[CBDaemonServer _identitiesShouldRun](self, "_identitiesShouldRun"))
    -[CBDaemonServer _identitiesEnsureStarted](self, "_identitiesEnsureStarted");
  else
    -[CBDaemonServer _identitiesEnsureStopped](self, "_identitiesEnsureStopped");
  v21 = -[CBDaemonServer _bleAdvertiserShouldRun](self, "_bleAdvertiserShouldRun");
  v22 = -[CBDaemonServer _stackBLEScannerShouldRun](self, "_stackBLEScannerShouldRun");
  v23 = v22;
  if ((v21 & 1) != 0 || !v22)
  {
    if (v21)
      goto LABEL_37;
  }
  else if (self->_stackBLEScannerNeedsAdvertisingAddress)
  {
LABEL_37:
    -[CBDaemonServer _bleAddressMonitorEnsureStarted](self, "_bleAddressMonitorEnsureStarted");
    goto LABEL_40;
  }
  -[CBDaemonServer _bleAddressMonitorEnsureStopped](self, "_bleAddressMonitorEnsureStopped");
LABEL_40:
  if (v21)
    -[CBDaemonServer _bleAdvertiserEnsureStarted](self, "_bleAdvertiserEnsureStarted");
  else
    -[CBDaemonServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  if (-[CBDaemonServer _stackAccessoryMonitorShouldRun](self, "_stackAccessoryMonitorShouldRun"))
    -[CBDaemonServer _stackAccessoryMonitorEnsureStarted](self, "_stackAccessoryMonitorEnsureStarted");
  else
    -[CBDaemonServer _stackAccessoryMonitorEnsureStopped](self, "_stackAccessoryMonitorEnsureStopped");
  if (v23)
    -[CBDaemonServer _stackBLEScannerEnsureStarted](self, "_stackBLEScannerEnsureStarted");
  else
    -[CBDaemonServer _stackBLEScannerEnsureStopped](self, "_stackBLEScannerEnsureStopped");
  if (-[CBDaemonServer _stackClassicScannerShouldRun](self, "_stackClassicScannerShouldRun"))
    -[CBDaemonServer _stackClassicScannerEnsureStarted](self, "_stackClassicScannerEnsureStarted");
  else
    -[CBDaemonServer _stackClassicScannerEnsureStopped](self, "_stackClassicScannerEnsureStopped");
  if (-[CBDaemonServer _stackDeviceMonitorShouldRun](self, "_stackDeviceMonitorShouldRun"))
    -[CBDaemonServer _stackDeviceMonitorEnsureStarted](self, "_stackDeviceMonitorEnsureStarted");
  else
    -[CBDaemonServer _stackDeviceMonitorEnsureStopped](self, "_stackDeviceMonitorEnsureStopped");
  if (self->_prefAccessoryDaemonEnabled)
    -[CBDaemonServer _accessoryDaemonEnsureStarted](self, "_accessoryDaemonEnsureStarted");
  else
    -[CBDaemonServer _accessoryDaemonEnsureStopped](self, "_accessoryDaemonEnsureStopped");
  if (self->_prefExtensionsEnabled)
    -[CBDaemonServer _extensionsEnsureStarted](self, "_extensionsEnsureStarted");
  else
    -[CBDaemonServer _extensionsEnsureStopped](self, "_extensionsEnsureStopped");
  v24 = -[CBDaemonServer _whbDiscoveryShouldRun](self, "_whbDiscoveryShouldRun");
  v25 = v24;
  if (self->_prefRemoteClientEnabled && (v24 & 1) != 0 || self->_prefRemoteServerEnabled)
    -[CBDaemonServer _remoteEnsureStarted](self, "_remoteEnsureStarted");
  else
    -[CBDaemonServer _remoteEnsureStopped](self, "_remoteEnsureStopped");
  if (v25)
    -[CBDaemonServer _whbDiscoveryEnsureStarted](self, "_whbDiscoveryEnsureStarted");
  else
    -[CBDaemonServer _whbDiscoveryEnsureStopped](self, "_whbDiscoveryEnsureStopped");
}

- (BOOL)_whbDiscoveryShouldRun
{
  BOOL v3;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!self->_prefRemoteClientEnabled
    || !-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked"))
  {
    return 0;
  }
  if (self->_prefWHBDiscoveryAlways)
    return 1;
  v5 = self->_whbDiscoveryArray;
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_xpcConnections;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v6 = 0;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "activatedDiscoveryWHB", (_QWORD)v13));
          if (v12)
          {
            if (!v6)
              v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
            -[NSMutableArray addObject:](v6, "addObject:", v12);
          }

        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    else
    {
      v6 = 0;
    }

    objc_storeStrong((id *)&self->_whbDiscoveryArray, v6);
    -[CBWHBDiscoveryDaemon setDiscoveryArray:](self->_whbDiscoveryDaemon, "setDiscoveryArray:", 0);
  }
  v3 = -[NSMutableArray count](v6, "count", (_QWORD)v13) != 0;

  return v3;
}

- (void)_whbDiscoveryEnsureStopped
{
  NSMutableArray *whbDiscoveryArray;
  CBWHBDiscoveryDaemon *whbDiscoveryDaemon;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSMutableSet *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  if (self->_whbDiscoveryDaemon)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _whbDiscoveryEnsureStopped]", 30, "WHB discovery stop");
    }
    whbDiscoveryArray = self->_whbDiscoveryArray;
    self->_whbDiscoveryArray = 0;

    -[CBWHBDiscoveryDaemon invalidate](self->_whbDiscoveryDaemon, "invalidate");
    whbDiscoveryDaemon = self->_whbDiscoveryDaemon;
    self->_whbDiscoveryDaemon = 0;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_whbDeviceMap, "allValues"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          -[CBDaemonServer _whbDiscoveryDeviceLost:](self, "_whbDiscoveryDeviceLost:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_xpcConnections;
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j), "whbStop", (_QWORD)v15);
        }
        v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }

  }
}

- (BOOL)_stackDeviceMonitorShouldRun
{
  unsigned int v3;
  BOOL v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = -[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore");
  if (v3)
  {
    v3 = -[CBStackController poweredOn](self->_stackController, "poweredOn");
    if (v3)
    {
      if (self->_deviceMonitorFlagsValid)
      {
        v4 = self->_deviceMonitorFlags == 0;
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v5 = self->_xpcConnections;
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
        {
          v7 = v6;
          v8 = 0;
          v9 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(_QWORD *)v16 != v9)
                objc_enumerationMutation(v5);
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "activatedDiscovery", (_QWORD)v15));
              v12 = (unint64_t)objc_msgSend(v11, "discoveryFlags");

              if ((v12 & 0xA00000) != 0)
                v13 = v12;
              else
                v13 = 0;
              v8 |= v13;
            }
            v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v7);
        }
        else
        {
          v8 = 0;
        }

        self->_deviceMonitorFlags = v8;
        self->_deviceMonitorFlagsValid = 1;
        v4 = v8 == 0;
      }
      LOBYTE(v3) = !v4;
    }
  }
  return v3;
}

- (void)_stackDeviceMonitorEnsureStarted
{
  CBStackDeviceMonitor *v3;
  id v4;
  id v5;
  id deviceMonitorFlags;
  void **v7;
  uint64_t v8;
  _QWORD *(*v9)(uint64_t, uint64_t);
  void *v10;
  CBStackDeviceMonitor *v11;
  CBDaemonServer *v12;
  _QWORD v13[4];
  id v14;
  CBDaemonServer *v15;

  v3 = self->_stackDeviceMonitor;
  if (!v3)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackDeviceMonitorEnsureStarted]", 30, "Stack device monitor start");
    }
    v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor deviceMonitorClass](self->_stackAdaptor, "deviceMonitorClass")));
    objc_storeStrong((id *)&self->_stackDeviceMonitor, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000858F0;
    v13[3] = &unk_1009171C0;
    v5 = v4;
    v14 = v5;
    v15 = self;
    objc_msgSend(v5, "setDeviceFoundHandler:", v13);
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_10008590C;
    v10 = &unk_1009171C0;
    v3 = (CBStackDeviceMonitor *)v5;
    v11 = v3;
    v12 = self;
    -[CBStackDeviceMonitor setDeviceLostHandler:](v3, "setDeviceLostHandler:", &v7);

  }
  deviceMonitorFlags = (id)self->_deviceMonitorFlags;
  if (deviceMonitorFlags != -[CBStackDeviceMonitor discoveryFlags](v3, "discoveryFlags", v7, v8, v9, v10))
  {
    -[CBStackDeviceMonitor setDiscoveryFlags:](v3, "setDiscoveryFlags:", self->_deviceMonitorFlags);
    -[CBStackDeviceMonitor activate](v3, "activate");
  }

}

- (BOOL)_stackClassicScannerShouldRun
{
  NSMutableSet *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (-[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore")
    && -[CBStackController poweredOn](self->_stackController, "poweredOn"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_xpcConnections;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v3);
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "activatedDiscovery", (_QWORD)v10));
          v8 = (unint64_t)objc_msgSend(v7, "discoveryFlags");

          if ((v8 & 0x4000000000000) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_14;
          }
        }
        v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)_stackClassicScannerEnsureStopped
{
  CBStackBLEScanner *stackClassicScanner;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_stackClassicScanner)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackClassicScannerEnsureStopped]", 30, "Stack classic scanner stop");
    }
    -[CBStackBLEScanner invalidate](self->_stackClassicScanner, "invalidate");
    stackClassicScanner = self->_stackClassicScanner;
    self->_stackClassicScanner = 0;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceMap, "allValues", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          v10 = objc_autoreleasePoolPush();
          -[CBDaemonServer _stackClassicScannerDeviceLost:](self, "_stackClassicScannerDeviceLost:", v9);
          objc_autoreleasePoolPop(v10);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)_stackBLEScannerShouldRun
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  BOOL v5;
  void *v7;
  _BOOL4 v8;
  NSMutableSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int deviceSetupState;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  int v25;
  _BOOL4 v26;
  _BOOL4 odeonActive;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  id v31;
  int DeviceClass;
  NSMutableArray *obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  if (!self->_prefBLEScanning
    || (self->_assertionFlags & 1) != 0
    || !-[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore")
    || !-[CBStackController poweredOn](self->_stackController, "poweredOn"))
  {
    return 0;
  }
  v3 = self->_bleDiscoveryArray;
  if (v3)
  {
    v4 = v3;
    goto LABEL_84;
  }
  DeviceClass = GestaltGetDeviceClass(0);
  if (-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"));
    if (objc_msgSend(v7, "isAlwaysOnEnabled"))
      v8 = self->_screenUndimmed != 0;
    else
      v8 = 1;

  }
  else
  {
    v8 = 0;
  }
  *(_WORD *)&self->_stackBLEScannerNeedsAdvertisingAddress = 0;
  self->_stackBLEProxControlFlags = 0;
  self->_stackBLEProxControlNeedsDeviceClose = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = self->_xpcConnections;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v10)
  {
    obj = 0;
    goto LABEL_83;
  }
  v11 = v10;
  obj = 0;
  v12 = *(_QWORD *)v35;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v35 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activatedDiscovery"));
      v16 = v15;
      if (v15)
      {
        v17 = (unint64_t)objc_msgSend(v15, "discoveryFlags");
        if (!objc_msgSend(v16, "needsBLEScan"))
        {
          v19 = v16;
          v20 = 0;
LABEL_38:
          objc_msgSend(v19, "setDisabledPending:", v20);
          goto LABEL_39;
        }
        if (!self->_prefDiscoveryProxy && objc_msgSend(v14, "xpcToken")
          || (objc_msgSend(v16, "internalFlags") & 0x10) != 0
          || (v8 | (v17 >> 25) & 1) != 1
          || objc_msgSend(v16, "denyLowPowerModeScans") && self->_lowPowerModeEnabled
          || objc_msgSend(v16, "denyScreenLockedScans")
          && (self->_screenLocked
           || !-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked"))
          || (v17 & 0x200000000000) != 0 && !-[CBDaemonServer _supportsProxControl](self, "_supportsProxControl"))
        {
          v19 = v16;
          v20 = 1;
          goto LABEL_38;
        }
        if (objc_msgSend(v16, "deviceSetupState"))
        {
          deviceSetupState = self->_deviceSetupState;
          objc_msgSend(v16, "setDisabledPending:", deviceSetupState == 10);
          if (deviceSetupState == 10)
            goto LABEL_39;
        }
        else
        {
          objc_msgSend(v16, "setDisabledPending:", 0);
        }
        if (objc_msgSend(v16, "needsAdvertisingAddress"))
          self->_stackBLEScannerNeedsAdvertisingAddress = 1;
        if (objc_msgSend(v16, "needsIdentify"))
          self->_stackBLENeedsIdentify = 1;
        if ((v17 & 0x200000000000) != 0)
        {
          self->_stackBLENeedsIdentify = 1;
          if (DeviceClass == 7)
          {
            v21 = 64;
          }
          else
          {
            self->_stackBLEProxControlNeedsDeviceClose = 1;
            v21 = 0x80000;
          }
          self->_stackBLEProxControlFlags = v21;
        }
        else
        {
          v21 = 0;
        }
        objc_msgSend(v16, "setExtraDiscoveryFlags:", v21);
        v22 = objc_msgSend(v16, "bleScanRateOverride");
        if (v8 || (v23 = objc_msgSend(v16, "bleScanRateScreenOff")) == 0)
          v23 = objc_msgSend(v16, "bleScanRate");
        if (self->_wifiCritical && v23 >= 31)
        {
          if ((objc_msgSend(v16, "useCase") & 0xFFFF0000) == 0x90000)
            v24 = 40;
          else
            v24 = 30;
          v25 = 1;
        }
        else
        {
          v26 = v23 > 30;
          odeonActive = self->_odeonActive;
          if (odeonActive && v26)
            v25 = 2;
          else
            v25 = 0;
          if (odeonActive && v26)
            v24 = 30;
          else
            v24 = v22;
          if (!self->_odeonActive && !self->_wifiCritical)
          {
            v25 = 0;
            if (objc_msgSend(v16, "bleScanRateOverride"))
              v24 = 0;
            else
              v24 = v22;
          }
        }
        if ((_DWORD)v24 != v22)
        {
          objc_msgSend(v16, "setBleScanRateOverride:", v24);
          objc_msgSend(v16, "setSystemOverrideFlags:", (unint64_t)objc_msgSend(v16, "systemOverrideFlags") & 0xFFFFFFFC);
          if ((_DWORD)v24)
            objc_msgSend(v16, "setSystemOverrideFlags:", objc_msgSend(v16, "systemOverrideFlags") | v25);
          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "systemOverrideHandler"));
          v29 = (void *)v28;
          if (v28)
            (*(void (**)(uint64_t))(v28 + 16))(v28);

        }
        v30 = obj;
        if (!obj)
          v30 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        obj = v30;
        -[NSMutableArray addObject:](v30, "addObject:", v16);
      }
LABEL_39:

      v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    v11 = v31;
  }
  while (v31);
LABEL_83:

  v4 = obj;
  objc_storeStrong((id *)&self->_bleDiscoveryArray, obj);
  -[CBStackBLEScanner setDiscoveryArray:](self->_stackBLEScanner, "setDiscoveryArray:", 0);
  v3 = obj;
LABEL_84:
  v5 = -[NSMutableArray count](v3, "count") != 0;

  return v5;
}

- (void)_stackBLEScannerDeviceFound:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  CBStackController *stackController;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v5));
    if (!v6)
    {
      v6 = objc_alloc_init((Class)CBDevice);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v9 = self->_deviceMap;
        self->_deviceMap = v8;

        deviceMap = self->_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v6, v5);
    }
    objc_msgSend(v6, "setInternalFlags:", objc_msgSend(v6, "internalFlags") | 2);
    objc_msgSend(v6, "updateWithCBDevice:", v4);
    objc_msgSend(v6, "updateWithReceivedAuthTag:forType:", self->_selfAuthTag, 21);
    if (objc_msgSend(v6, "changedTypesNeedsIdentify") && self->_stackBLENeedsIdentify)
      -[CBDaemonServer _identitiesResolveNearbyDevice:](self, "_identitiesResolveNearbyDevice:", v6);
    -[CBDaemonServer _stackBLEScannerUpdateProxControlIfNeeded:](self, "_stackBLEScannerUpdateProxControlIfNeeded:", v6);
    if ((objc_msgSend(v6, "attributeInternalFlags") & 1) != 0)
    {
      stackController = self->_stackController;
      v11 = 0;
      -[CBStackController modifyDevice:error:](stackController, "modifyDevice:error:", v4, &v11);
    }
    -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v6);

  }
}

- (void)_stackBLEScannerUpdateProxControlIfNeeded:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  id v8;

  v8 = a3;
  v4 = (unint64_t)objc_msgSend(v8, "discoveryFlags");
  if ((self->_stackBLEProxControlFlags & v4) != 0
    && (!self->_stackBLEProxControlNeedsDeviceClose || (objc_msgSend(v8, "nearbyActionFlags") & 0x10) != 0))
  {
    v5 = v4 | 0x200000000000;
  }
  else
  {
    v5 = v4 & 0xFFFFDFFFFFFFFFFFLL;
  }
  v6 = v8;
  v7 = v5 ^ v4;
  if (v7)
  {
    objc_msgSend(v8, "setChangeFlags:", (unint64_t)objc_msgSend(v8, "changeFlags") | v7);
    objc_msgSend(v8, "setDiscoveryFlags:", v5);
    v6 = v8;
  }

}

- (void)_reportDeviceFound:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedDiscovery", (_QWORD)v14));
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "disabledActive") & 1) == 0)
          objc_msgSend(v10, "reportDeviceFound:", v4);

        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "changedTypesRemoveAll");
}

- (void)_stackBLEScannerEnsureStarted
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  CBDaemonServer *v17;
  CBStackBLEScanner *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  _BOOL8 v25;
  NSData *v26;
  void *v27;
  NSData *v28;
  NSData *v29;
  NSData *v30;
  unsigned __int8 v31;
  NSData *v32;
  void *v33;
  NSData *v34;
  NSData *v35;
  NSData *v36;
  unsigned __int8 v37;
  CBDaemonServer *v38;
  CBDaemonServer *v39;
  uint64_t v40;
  id v41;
  NSMutableSet *obj;
  _QWORD v43[4];
  CBStackBLEScanner *v44;
  CBDaemonServer *v45;
  _QWORD v46[4];
  id v47;
  CBDaemonServer *v48;
  _QWORD v49[4];
  id v50;
  CBDaemonServer *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v38 = self;
  obj = self->_xpcConnections;
  v2 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v57;
    v40 = *(_QWORD *)v57;
    do
    {
      v6 = 0;
      v41 = v3;
      do
      {
        if (*(_QWORD *)v57 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activatedDiscovery", v38));
        v9 = v8;
        if (v8)
        {
          v10 = objc_msgSend(v8, "disabledPending");
          if ((_DWORD)v10 != objc_msgSend(v9, "disabledActive"))
          {
            if (!v4)
              v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v38->_deviceMap, "allValues"));
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v4 = v4;
            v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v53;
              do
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v53 != v13)
                    objc_enumerationMutation(v4);
                  v15 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
                  v16 = objc_autoreleasePoolPush();
                  if ((_DWORD)v10)
                    objc_msgSend(v7, "reportDeviceLost:", v15);
                  else
                    objc_msgSend(v7, "reportDeviceFound:", v15);
                  objc_autoreleasePoolPop(v16);
                }
                v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
              }
              while (v12);
            }

            objc_msgSend(v9, "setDisabledActive:", v10);
            v5 = v40;
            v3 = v41;
          }
        }

        v6 = (char *)v6 + 1;
      }
      while (v6 != v3);
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  v17 = v38;
  v18 = v38->_stackBLEScanner;
  if (!v18)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackBLEScannerEnsureStarted]", 30, "Stack BLE scanner start", v38);
    }
    v19 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor bleScannerClass](v17->_stackAdaptor, "bleScannerClass", v38)));
    objc_storeStrong((id *)&v17->_stackBLEScanner, v19);
    objc_msgSend(v19, "setDispatchQueue:", v17->_dispatchQueue);
    objc_msgSend(v19, "setIdentifier:", CFSTR("CBDaemon"));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100029BB0;
    v49[3] = &unk_1009171C0;
    v20 = v19;
    v50 = v20;
    v51 = v38;
    objc_msgSend(v20, "setDeviceFoundHandler:", v49);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000844DC;
    v46[3] = &unk_1009171C0;
    v17 = v38;
    v21 = v20;
    v47 = v21;
    v48 = v38;
    objc_msgSend(v21, "setDeviceLostHandler:", v46);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000844F8;
    v43[3] = &unk_100917A68;
    v18 = (CBStackBLEScanner *)v21;
    v44 = v18;
    v45 = v38;
    -[CBStackBLEScanner setDevicesBufferedHandler:](v18, "setDevicesBufferedHandler:", v43);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackBLEScanner discoveryArray](v18, "discoveryArray", v38));
  if (v22)
  {

LABEL_33:
    v23 = 0;
    goto LABEL_36;
  }
  if (!-[NSMutableArray count](v17->_bleDiscoveryArray, "count"))
    goto LABEL_33;
  -[CBStackBLEScanner setDiscoveryArray:](v18, "setDiscoveryArray:", v17->_bleDiscoveryArray);
  v23 = 1;
LABEL_36:
  if ((-[CUSystemMonitor screenOn](v17->_systemMonitor, "screenOn") & 1) == 0)
  {
    if ((-[CBStackBLEScanner screenOn](v18, "screenOn") & 1) == 0)
      goto LABEL_44;
    v25 = 0;
    goto LABEL_43;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"));
  if (objc_msgSend(v24, "isAlwaysOnEnabled"))
    v25 = v39->_screenUndimmed != 0;
  else
    v25 = 1;

  v17 = v39;
  if (v25 != -[CBStackBLEScanner screenOn](v18, "screenOn"))
  {
LABEL_43:
    -[CBStackBLEScanner setScreenOn:](v18, "setScreenOn:", v25);
    v23 = 1;
  }
LABEL_44:
  v26 = v17->_selfAuthTag;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackBLEScanner selfAuthTag](v18, "selfAuthTag"));
  v28 = v26;
  v29 = v27;
  if (v28 == v29)
  {

    goto LABEL_51;
  }
  v30 = v29;
  if ((v28 == 0) == (v29 != 0))
  {

    goto LABEL_50;
  }
  v31 = -[NSData isEqual:](v28, "isEqual:", v29);

  if ((v31 & 1) == 0)
  {
LABEL_50:
    -[CBStackBLEScanner setSelfAuthTag:](v18, "setSelfAuthTag:", v28);
    v23 = 1;
  }
LABEL_51:
  v32 = v39->_selfAuthTagNonConnectable;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackBLEScanner selfAuthTagNonConnectable](v18, "selfAuthTagNonConnectable"));
  v34 = v32;
  v35 = v33;
  if (v34 == v35)
  {

    goto LABEL_56;
  }
  v36 = v35;
  if ((v34 == 0) != (v35 != 0))
  {
    v37 = -[NSData isEqual:](v34, "isEqual:", v35);

    if ((v37 & 1) == 0)
      goto LABEL_59;
LABEL_56:
    if (!v23)
      goto LABEL_61;
    goto LABEL_60;
  }

LABEL_59:
  -[CBStackBLEScanner setSelfAuthTagNonConnectable:](v18, "setSelfAuthTagNonConnectable:", v34);
LABEL_60:
  -[CBStackBLEScanner activate](v18, "activate");
LABEL_61:

}

- (BOOL)_stackAccessoryMonitorShouldRun
{
  unsigned int v3;

  v3 = -[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore");
  if (v3)
    LOBYTE(v3) = -[CBStackController poweredOn](self->_stackController, "poweredOn");
  return v3;
}

- (void)_stackAccessoryMonitorEnsureStarted
{
  CBStackAccessoryMonitor *v3;
  id v4;
  id v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  CBStackAccessoryMonitor *v10;
  CBDaemonServer *v11;
  _QWORD v12[4];
  id v13;
  CBDaemonServer *v14;

  v3 = self->_stackAccessoryMonitor;
  if (!v3)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackAccessoryMonitorEnsureStarted]", 30, "Stack accessory monitor start");
    }
    v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor accessoryMonitorClass](self->_stackAdaptor, "accessoryMonitorClass")));
    objc_storeStrong((id *)&self->_stackAccessoryMonitor, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000841B0;
    v12[3] = &unk_100917A18;
    v5 = v4;
    v13 = v5;
    v14 = self;
    objc_msgSend(v5, "setAudioAccessoryEventHandler:", v12);
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_10008430C;
    v9 = &unk_100917A40;
    v3 = (CBStackAccessoryMonitor *)v5;
    v10 = v3;
    v11 = self;
    -[CBStackAccessoryMonitor setAudioAccessoryInfoChangedHandler:](v3, "setAudioAccessoryInfoChangedHandler:", &v6);

    -[CBStackAccessoryMonitor activate](v3, "activate", v6, v7, v8, v9);
  }

}

- (void)_remoteEnsureStopped
{
  RPCompanionLinkClient *remoteClient;
  RPServer *remoteServer;
  void *v5;

  if (self->_remoteClient)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteEnsureStopped]", 30, "Remote client stop");
    }
    -[RPCompanionLinkClient invalidate](self->_remoteClient, "invalidate");
    remoteClient = self->_remoteClient;
    self->_remoteClient = 0;

    self->_remoteRequestRegistered = 0;
  }
  if (self->_remoteServer)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteEnsureStopped]", 30, "Remote server stop");
    }
    -[RPServer invalidate](self->_remoteServer, "invalidate");
    remoteServer = self->_remoteServer;
    self->_remoteServer = 0;

  }
  if (self->_coexNotificationSetup)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.bluetooth.leconnection"), 0);

    self->_coexNotificationSetup = 0;
  }
}

- (BOOL)_identitiesShouldRun
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (!-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked")
    || !-[CBStackController poweredOn](self->_stackController, "poweredOn"))
  {
    return 0;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_xpcConnections;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activatedDiscovery", (_QWORD)v15));
        if ((objc_msgSend(v9, "needsIdentify") & 1) != 0)
          goto LABEL_16;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activatedSpatialInteractionSession"));
        if ((objc_msgSend(v10, "controlFlags") & 0x3E0) != 0
          || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activatedAdvertiser")),
              v12 = objc_msgSend(v11, "needsIdentify"),
              v11,
              v12))
        {

LABEL_16:
          v13 = 1;
          goto LABEL_18;
        }

      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_18:

  return v13;
}

- (void)_identitiesResolveNearbyDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char *v6;
  char *v7;
  void *v8;
  NSMutableDictionary *deviceMap;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  unsigned __int8 v20;
  id v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  NSMutableDictionary *identifyDevices;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  unsigned __int16 v34;
  _BOOL4 v35;
  void *v36;
  NSArray *obj;
  uint64_t v39;
  _BOOL4 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[6];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];

  v3 = a3;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  if (v36)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifyDevices, "objectForKeyedSubscript:", v36));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nearbyInfoV2EncryptedData"));
      if (v5 || objc_msgSend(v3, "nearbyInfoV2EncryptedFlags"))
      {

      }
      else
      {
        v34 = (unsigned __int16)objc_msgSend(v3, "internalFlags");

        if ((v34 & 0x800) == 0)
          goto LABEL_84;
      }
    }
    v6 = (char *)-[NSMutableDictionary count](self->_identifyDevices, "count");
    if ((unint64_t)v6 >= 0x15E)
    {
      v7 = v6 - 300;
      do
      {
        v47 = 0;
        v48 = &v47;
        v49 = 0x3032000000;
        v50 = sub_10006248C;
        v51 = sub_100062300;
        v52 = 0;
        v8 = objc_autoreleasePoolPush();
        deviceMap = self->_deviceMap;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100086610;
        v46[3] = &unk_100917B80;
        v46[4] = self;
        v46[5] = &v47;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v46);
        objc_autoreleasePoolPop(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v48[5], "identifier"));
        if (v10)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identifyDevices, "setObject:forKeyedSubscript:", 0, v10);

        if (dword_100977980 < 31
          && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
        {
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesResolveNearbyDevice:]", 30, "Identities removed excess device: %@", v48[5]);
        }
        _Block_object_dispose(&v47, 8);

        --v7;
      }
      while (v7);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identityMapSameAccount, "objectForKeyedSubscript:", v36));
    if (v11)
    {
      objc_msgSend(v3, "updateWithCBDeviceIdentity:", v11);
      objc_msgSend(v3, "setInternalFlags:", objc_msgSend(v3, "internalFlags") | 8);
      if (dword_100977980 <= 20
        && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
      {
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesResolveNearbyDevice:]", 20, "Identities resolve match: same account, %@, %@", v3, v11);
      }
      v39 = 1;
    }
    else
    {
      v39 = 0;
    }

    *(_QWORD *)&v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nearbyAuthTag"));
    *((_QWORD *)&v41 + 1) = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nearbyInfoV2AuthTagData"));
    if (*((_QWORD *)&v41 + 1))
    {
      v40 = 0;
      v35 = (_QWORD)v41 == 0;
    }
    else
    {
      *((_QWORD *)&v41 + 1) = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "airplaySourceAuthTagData"));
      v35 = (_QWORD)v41 == 0;
      v40 = *((_QWORD *)&v41 + 1) == 0;
      if (v41 == 0)
      {
LABEL_83:

        goto LABEL_84;
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "btAddressData"));
    if (v12)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = self->_identityArray;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v43 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
            v17 = objc_autoreleasePoolPush();
            v18 = objc_msgSend(v16, "type");
            if (v18 <= 9 && ((1 << v18) & 0x354) != 0)
            {
              if (v40)
              {
                v20 = objc_msgSend(v16, "verifyAuthTag:data:type:error:", (_QWORD)v41, v12, 2, 0);
                v21 = (id)v41;
                if ((v20 & 1) == 0)
                  goto LABEL_51;
                goto LABEL_46;
              }
              if (objc_msgSend(v16, "verifyAuthTag:data:type:error:", *((_QWORD *)&v41 + 1), v12, 2, 0))
              {
                v22 = *((id *)&v41 + 1);
                goto LABEL_42;
              }
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "btAddress"));
              v24 = v23 == 0;

              if (v24)
              {
                v28 = *((id *)&v41 + 1);
              }
              else
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "btAddress"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "subdataWithRange:", 1, 6));

                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "btAddressData"));
                LODWORD(v25) = objc_msgSend(v26, "isEqualToData:", v27);

                v28 = *((id *)&v41 + 1);
                if ((_DWORD)v25)
                {
LABEL_42:
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nearbyInfoV2AuthIntegrityTagData"));
                  if (!v29)
                  {

                    v21 = (id)*((_QWORD *)&v41 + 1);
                    goto LABEL_46;
                  }
                  v30 = -[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:](self, "_verifyNearbyInfoV2IntegrityTag:rapportIdentity:", v3, v16);

                  v21 = (id)*((_QWORD *)&v41 + 1);
                  if ((v30 & 1) != 0)
                  {
LABEL_46:
                    objc_msgSend(v3, "updateWithRPIdentity:", v16);
                    objc_msgSend(v3, "setInternalFlags:", objc_msgSend(v3, "internalFlags") | 8);
                    if (dword_100977980 <= 20
                      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
                    {
                      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesResolveNearbyDevice:]", 20, "Identities resolve match: Addr %@, AT %@, %@, %@", v12, v21, v3, v16);
                    }
                    v39 = (v39 + 1);
                  }
                  else
                  {
LABEL_51:
                    if (dword_100977980 <= 5
                      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 5)))
                    {
                      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesResolveNearbyDevice:]", 5, "Identities resolve mismatch: Addr %@, AT %@, %@, %@", v12, v21, v3, v16);
                    }
                  }

                  goto LABEL_59;
                }
              }
              v21 = v28;
              goto LABEL_51;
            }
LABEL_59:
            objc_autoreleasePoolPop(v17);
          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
        }
        while (v13);
      }

      if ((objc_msgSend(v3, "internalFlags") & 0x800) == 0)
      {
        identifyDevices = self->_identifyDevices;
        if (!identifyDevices)
        {
          v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v33 = self->_identifyDevices;
          self->_identifyDevices = v32;

          identifyDevices = self->_identifyDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](identifyDevices, "setObject:forKeyedSubscript:", v3, v36);
        if (v40)
        {
          if (dword_100977980 <= 30
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
          {
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesResolveNearbyDevice:]", 30, "Identities resolve added: Addr %@, AT %@, %@, matches %d", v12, (_QWORD)v41, v3, v39);
          }
        }
        else if (v35)
        {
          if (dword_100977980 <= 30
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
          {
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesResolveNearbyDevice:]", 30, "Identities resolve added: Addr %@, ATNC %@, %@, matches %d", v12, *((_QWORD *)&v41 + 1), v3, v39);
          }
        }
        else if (dword_100977980 <= 30
               && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
        {
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesResolveNearbyDevice:]", 30, "Identities resolve added: Addr %@, AT %@, ATNC %@, %@, matches %d", v12, v41, v3, v39);
        }
      }
    }

    goto LABEL_83;
  }
LABEL_84:

}

- (void)_identitiesEnsureStarted
{
  int *p_identitiesNotifyToken;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  p_identitiesNotifyToken = &self->_identitiesNotifyToken;
  if (self->_identitiesNotifyToken == -1)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesEnsureStarted]", 30, "Identities start");
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100085F90;
    handler[3] = &unk_100917928;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.identitiesChanged", p_identitiesNotifyToken, dispatchQueue, handler);
    -[CBDaemonServer _identitiesGet](self, "_identitiesGet");
  }
}

- (void)_extensionsEnsureStarted
{
  CBExtensionsDaemon *v3;
  CBExtensionsDaemon *extensionsDaemon;

  if (!self->_extensionsDaemon)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _extensionsEnsureStarted]", 30, "Extensions start");
    }
    v3 = objc_alloc_init(CBExtensionsDaemon);
    extensionsDaemon = self->_extensionsDaemon;
    self->_extensionsDaemon = v3;

    -[CBExtensionsDaemon setDispatchQueue:](self->_extensionsDaemon, "setDispatchQueue:", self->_dispatchQueue);
    -[CBExtensionsDaemon setDaemonServer:](self->_extensionsDaemon, "setDaemonServer:", self);
    -[CBExtensionsDaemon activate](self->_extensionsDaemon, "activate");
  }
}

- (BOOL)_bleAdvertiserShouldRun
{
  NSMutableArray *v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  if (!self->_prefBLEAdvertising
    || !-[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore")
    || !-[CBStackController poweredOn](self->_stackController, "poweredOn"))
  {
    return 0;
  }
  v3 = self->_bleAdvertiserArray;
  if (-[NSMutableArray count](v3, "count"))
    goto LABEL_30;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_xpcConnections;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedAdvertiser"));
        if (v11)
        {
          if (!v3)
            v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          -[NSMutableArray addObject:](v3, "addObject:", v11);
        }
        if (v7)
        {
          v7 = 1;
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedSpatialInteractionSession"));
          v13 = v12;
          if (v12)
            v7 = (objc_msgSend(v12, "controlFlags") & 8) == 0;
          else
            v7 = 0;

        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_storeStrong((id *)&self->_bleAdvertiserArray, v3);
  -[CBAdvertiserDaemon setAdvertiserArray:](self->_bleAdvertiser, "setAdvertiserArray:", 0);
  if (v7
    || -[CBAdvertiserDaemon needsToRun](self->_bleAdvertiser, "needsToRun")
    || self->_bleAdvertiserSpatialLingerTimer
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon spatialInteractionIdentifiers](self->_bleAdvertiser, "spatialInteractionIdentifiers")), v17 = objc_msgSend(v16, "count"), v16, v17))
  {
LABEL_30:
    v14 = 1;
  }
  else
  {
    v14 = -[NSMutableArray count](v3, "count") != 0;
  }

  return v14;
}

- (BOOL)_firstUnlockedOrAllowedBefore
{
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0
    || (os_variant_is_recovery("com.apple.bluetooth") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"));
  }
}

- (void)_bleAdvertiserEnsureStarted
{
  CBAdvertiserDaemon **p_bleAdvertiser;
  CBAdvertiserDaemon *v4;
  _BOOL4 v5;
  CBAdvertiserDaemon *v6;
  NSData *v7;
  void *v8;
  NSData *v9;
  NSData *v10;
  NSData *v11;
  unsigned __int8 v12;
  void *v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  BOOL v18;
  _QWORD v19[4];
  CBAdvertiserDaemon *v20;
  CBDaemonServer *v21;
  BOOL v22;
  _QWORD v23[4];
  CBAdvertiserDaemon *v24;
  CBDaemonServer *v25;

  p_bleAdvertiser = &self->_bleAdvertiser;
  v4 = self->_bleAdvertiser;
  v5 = v4 == 0;
  if (!v4)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserEnsureStarted]", 30, "BLE advertiser start");
    }
    v6 = objc_alloc_init(CBAdvertiserDaemon);
    objc_storeStrong((id *)p_bleAdvertiser, v6);
    -[CBAdvertiserDaemon setDaemonServer:](v6, "setDaemonServer:", self);
    -[CBAdvertiserDaemon setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
    -[CBAdvertiserDaemon setStackAdaptor:](v6, "setStackAdaptor:", self->_stackAdaptor);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100083A98;
    v23[3] = &unk_100917058;
    v4 = v6;
    v24 = v4;
    v25 = self;
    -[CBAdvertiserDaemon setStateChangedHandler:](v4, "setStateChangedHandler:", v23);

  }
  v7 = self->_selfAuthTag;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon selfAuthTag](v4, "selfAuthTag"));
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_14;
  }
  v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_13;
  }
  v12 = -[NSData isEqual:](v9, "isEqual:", v10);

  if ((v12 & 1) == 0)
  {
LABEL_13:
    -[CBAdvertiserDaemon setSelfAuthTag:](v4, "setSelfAuthTag:", v9);
    v5 = 1;
  }
LABEL_14:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon advertiserArray](v4, "advertiserArray"));
  if (v13)
  {

LABEL_16:
    v14 = 0;
    goto LABEL_19;
  }
  if (!-[NSMutableArray count](self->_bleAdvertiserArray, "count"))
    goto LABEL_16;
  -[CBAdvertiserDaemon setAdvertiserArray:](v4, "setAdvertiserArray:", self->_bleAdvertiserArray);
  v14 = 1;
LABEL_19:
  v15 = -[CBDaemonServer _bleAdvertiserUpdateSpatialInteraction](self, "_bleAdvertiserUpdateSpatialInteraction");
  v16 = -[CBDaemonServer _bleAdvertiserUpdateWithAuthTagNC](self, "_bleAdvertiserUpdateWithAuthTagNC");
  if (v5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackAddressMonitor nonConnectableAddressData](self->_addressMonitor, "nonConnectableAddressData"));
    v18 = v17 == 0;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100083AB0;
    v19[3] = &unk_1009179F0;
    v20 = v4;
    v21 = self;
    v22 = v18;
    -[CBAdvertiserDaemon activateWithCompletion:](v20, "activateWithCompletion:", v19);

  }
  else if (v14 + v15 != (int)(v16 << 31) >> 31
         && dword_100977980 <= 30
         && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
  {
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserEnsureStarted]", 30, "BLE advertiser updated: %@", v4);
  }

}

- (BOOL)_bleAdvertiserUpdateWithAuthTagNC
{
  CBDaemonServer *v2;
  CBAdvertiserDaemon *v3;
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  unsigned int v15;
  BOOL v16;
  char v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  id v38;
  unsigned int v39;
  id v40;
  id v41;
  uint64_t v42;
  BOOL v43;
  char v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  void *v50;
  double Current;
  const char *v52;
  double v53;
  double v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  id v64;
  BOOL v66;
  CBAdvertiserDaemon *v67;
  char v68;
  void *v69;
  unsigned __int8 v70;
  void *v71;
  void *v72;
  unsigned __int8 v73;
  void *v74;
  void *v75;
  CBDaemonServer *v76;
  unsigned int v77;
  unsigned int v78;
  char v79;
  id obj;
  double v81;
  unsigned int v82;
  unint64_t v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  unsigned __int8 v93;
  _BYTE v94[128];
  _BYTE v95[128];

  v2 = self;
  v3 = self->_bleAdvertiser;
  if (!v3)
  {
    v6 = 0;
    goto LABEL_99;
  }
  v93 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackAddressMonitor nonConnectableAddressData](v2->_addressMonitor, "nonConnectableAddressData"));
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon advertiserArray](v3, "advertiserArray"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  v6 = v5 != 0;
  if (!v5)
  {
    v74 = 0;
    v75 = 0;
    v72 = 0;
    goto LABEL_96;
  }
  v7 = v5;
  v66 = v5 != 0;
  v67 = v3;
  v8 = 0;
  v72 = 0;
  v74 = 0;
  v78 = 0;
  v9 = 0;
  v75 = 0;
  v76 = v2;
  v68 = 0;
  v10 = *(_QWORD *)v90;
  v71 = v4;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v90 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v11);
      v13 = objc_autoreleasePoolPush();
      v14 = objc_msgSend(v12, "nearbyInfoV2DecryptedFlags");
      v93 |= v14;
      v8 |= objc_msgSend(v12, "nearbyInfoV2Flags") & 4;
      v15 = objc_msgSend(v12, "airplaySourceFlags");
      if (v8)
        v16 = 0;
      else
        v16 = v15 == 0;
      if (v16 && v93 == 0)
        goto LABEL_46;
      if (!v2->_identitySelf)
        goto LABEL_44;
      v18 = v15;
      if (objc_msgSend(v4, "length") != (id)6)
        goto LABEL_44;
      if (v8)
        v19 = 0;
      else
        v19 = v93 == 0;
      v77 = v9;
      if (!v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nearbyInfoV2AuthTagData"));

        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nearbyInfoV2RapportIRKData"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity authTagForData:type:error:](v2->_identitySelf, "authTagForData:type:error:", v4, 2, 0));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity deviceIRKData](v2->_identitySelf, "deviceIRKData"));
        v23 = v20;
        v24 = v21;
        v25 = v23;
        v26 = v24;
        v74 = v25;
        if (v25 == v24)
        {

          goto LABEL_27;
        }
        if ((v25 == 0) != (v24 != 0))
        {
          v73 = objc_msgSend(v25, "isEqual:", v24);

          if ((v73 & 1) != 0)
          {
LABEL_27:
            v27 = v69;
            v28 = v22;
            v29 = v28;
            v72 = v27;
            if (v27 == v28)
            {

            }
            else
            {
              if ((v27 == 0) != (v28 != 0))
              {
                v70 = objc_msgSend(v27, "isEqual:", v28);

                if ((v70 & 1) != 0)
                  goto LABEL_34;
              }
              else
              {

              }
              objc_msgSend(v12, "setNearbyInfoV2RapportIRKData:", v29);
              v68 = 1;
            }
LABEL_34:

            v4 = v71;
            v2 = v76;
            v9 = v77;
            goto LABEL_35;
          }
        }
        else
        {

        }
        objc_msgSend(v12, "setNearbyInfoV2AuthTagData:", v26);
        v68 = 1;
        goto LABEL_27;
      }
LABEL_35:
      if ((v18 & 0x10) != 0)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "airplaySourceAuthTagData"));

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity authTagForData:type:error:](v2->_identitySelf, "authTagForData:type:error:", v4, 2, 0));
        v32 = v30;
        v33 = v31;
        v34 = v32;
        v35 = v33;
        v75 = v34;
        if (v34 == v33)
        {

        }
        else
        {
          if ((v34 == 0) != (v33 != 0))
          {
            v36 = v34;
            v37 = objc_msgSend(v34, "isEqual:", v33);

            if ((v37 & 1) != 0)
              goto LABEL_43;
          }
          else
          {

          }
          objc_msgSend(v12, "setAirplaySourceAuthTagData:", v35);
          v68 = 1;
        }
LABEL_43:

        v4 = v71;
        v9 = v77;
      }
LABEL_44:
      if (v78)
      {
        if (v9)
          goto LABEL_46;
      }
      else
      {
        v78 = objc_msgSend(v12, "nearbyInfoV2InvitationCounter");
        if (v9)
          goto LABEL_46;
      }
      v9 = objc_msgSend(v12, "nearbyInfoV2InvitationRouteType");
LABEL_46:
      objc_autoreleasePoolPop(v13);
      v11 = (char *)v11 + 1;
    }
    while (v7 != v11);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    v7 = v38;
  }
  while (v38);

  if ((v68 & 1) == 0)
  {
    v6 = 0;
    v3 = v67;
    goto LABEL_98;
  }
  v39 = v9;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v3 = v67;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon advertiserArray](v67, "advertiserArray"));
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (!v40)
    goto LABEL_94;
  v41 = v40;
  v42 = *(_QWORD *)v86;
  if (v78)
    v43 = v39 == 0;
  else
    v43 = 1;
  v44 = !v43;
  v79 = v44;
  while (2)
  {
    v45 = 0;
    while (2)
    {
      if (*(_QWORD *)v86 != v42)
        objc_enumerationMutation(obj);
      v46 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v45);
      v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "nearbyInfoV2AuthTagData"));
      if (v47)
      {
        v48 = (void *)v47;
        if (objc_msgSend(v46, "nearbyInfoV2Flags"))
        {

LABEL_67:
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "nearbyInfoV2AuthTagData"));
          Current = CFAbsoluteTimeGetCurrent();
          v83 = 0xBFF0000000000000;
          v84 = 0xBFF0000000000000;
          v82 = -1;
          if (!v2->_prefSystemReferenceTimeDisabled && TMGetReferenceTime(&v84, &v83, &v82) && v82)
          {
            v53 = *(double *)&v84;
            if (dword_100977980 > 20)
            {
              v54 = *(double *)&v84;
            }
            else
            {
              v54 = *(double *)&v84;
              if (dword_100977980 != -1
                || (v63 = _LogCategory_Initialize(&dword_100977980, 20), v54 = *(double *)&v84, v63))
              {
                v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v54));
                v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "description")));
                v57 = objc_msgSend(v56, "UTF8String");
                LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserUpdateWithAuthTagNC]", 20, "System reference time for advertising %f, (%s). delta: %f ±%f reliability %d for auth tag: %@", *(_QWORD *)&v54, v57, v53 - Current, v83, v82, v50);

                v54 = *(double *)&v84;
              }
            }
          }
          else
          {
            if (dword_100977980 <= 20
              && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
            {
              v52 = "disabled";
              if (!v2->_prefSystemReferenceTimeDisabled)
                v52 = "not available";
              LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserUpdateWithAuthTagNC]", 20, "System reference time for advertising '%s' for auth tag: %@", v52, v50);
            }
            v54 = Current;
          }
          if ((v93 & 1) == 0)
            v93 = v93 & 0xFE | v79;
          v81 = (double)((v54 + kCFAbsoluteTimeIntervalSince1970) / 7200.0) * 7200.0
              - kCFAbsoluteTimeIntervalSince1970;
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "bleAdv22IauthTag", 16));
          objc_msgSend(v58, "appendData:", v59);

          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v81, 8));
          objc_msgSend(v58, "appendData:", v60);

          v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v93, 1));
          objc_msgSend(v58, "appendData:", v61);

          objc_msgSend(v58, "appendData:", v50);
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity authTagForData:type:error:](v2->_identitySelf, "authTagForData:type:error:", v58, 2, 0));
          objc_msgSend(v46, "setNearbyInfoV2AuthIntegrityTagData:", v62);
          if (dword_100977980 <= 20
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
          {
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserUpdateWithAuthTagNC]", 20, "IntegrityTag parameters advertisting: AT %@, IT %@, CBIN %u, T: %f, F2: %u", v50, v62, ((v54 + kCFAbsoluteTimeIntervalSince1970) / 7200.0), *(_QWORD *)&v81, v93);
          }

          v2 = v76;
        }
        else
        {
          v49 = objc_msgSend(v46, "nearbyInfoV2DecryptedFlags");

          if (v49)
            goto LABEL_67;
        }
      }
      if (v41 != (id)++v45)
        continue;
      break;
    }
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    v41 = v64;
    if (v64)
      continue;
    break;
  }
  v3 = v67;
  v4 = v71;
LABEL_94:
  v6 = v66;
LABEL_96:

LABEL_98:
LABEL_99:

  return v6;
}

- (BOOL)_bleAdvertiserUpdateSpatialInteraction
{
  BOOL v2;
  CBAdvertiserDaemon *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSMutableSet *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  void *v18;
  void *v19;
  int v20;
  _WORD *v21;
  __int16 v22;
  id v23;
  _BYTE *v24;
  char v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  CBDaemonServer *v33;
  char v34;
  void *v35;
  char v36;
  id v37;
  id v38;
  unsigned int v39;
  unsigned __int8 v40;
  unsigned int v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  unsigned __int8 v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  unsigned __int8 v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  CBDaemonServer *v61;
  void *v62;
  OS_dispatch_source *bleAdvertiserSpatialLingerTimer;
  NSObject *v64;
  OS_dispatch_source *v65;
  void *v66;
  dispatch_source_t v67;
  OS_dispatch_source *v68;
  CBAdvertiserDaemon *v70;
  CBDaemonServer *v71;
  void *v72;
  void *v73;
  void *v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  _QWORD handler[5];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  unint64_t v84;
  uint64_t v85;
  char v86;
  _BYTE v87[128];

  if (!self->_bleAdvertiserSpatialValid)
  {
    v4 = self->_bleAdvertiser;
    if (!v4)
    {
      v2 = 0;
      goto LABEL_109;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackAddressMonitor nonConnectableAddressData](self->_addressMonitor, "nonConnectableAddressData"));
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(-[CBStackAddressMonitor fakeNonConnectableAddressData](self->_addressMonitor, "fakeNonConnectableAddressData"));
    v8 = v7;

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v9 = self->_xpcConnections;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    v71 = self;
    v73 = v8;
    if (v10)
    {
      v70 = v4;
      v74 = 0;
      v77 = 0;
      v78 = 0;
      v76 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v81;
      v72 = 0;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v81 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i), "activatedSpatialInteractionSession"));
          v15 = v14;
          if (v14)
          {
            v16 = (unsigned __int16)objc_msgSend(v14, "controlFlags");
            if ((v16 & 8) == 0)
            {
              v17 = v16;
              if (objc_msgSend(v8, "length") == (id)6)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifierData"));
                if (objc_msgSend(v18, "length") == (id)3)
                {
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "irkData"));
                  if (objc_msgSend(v19, "length") == (id)16)
                  {
                    v20 = objc_msgSend(v15, "advertiseRate");
                    if (v20 > (int)v11)
                      LODWORD(v11) = v20;
                    v75 = v11;
                    if ((v17 & 0x400) == 0)
                    {
                      v86 = 0;
                      v85 = 0;
                      v21 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
                      v22 = v21[2];
                      LODWORD(v85) = *(_DWORD *)v21;
                      WORD2(v85) = v22;
                      v23 = objc_retainAutorelease(v18);
                      v24 = objc_msgSend(v23, "bytes");
                      v25 = v24[2];
                      HIWORD(v85) = *(_WORD *)v24;
                      v86 = v25;
                      v84 = bswap64(SipHash(objc_msgSend(objc_retainAutorelease(v19), "bytes"), &v85, 9));
                      v26 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v84, 3);
                      v27 = v74;
                      if (!v74)
                        v27 = objc_alloc_init((Class)NSMutableArray);
                      v74 = v27;
                      objc_msgSend(v27, "addObject:", v23);
                      v28 = v78;
                      if (!v78)
                        v28 = objc_alloc_init((Class)NSMutableArray);
                      v78 = v28;
                      objc_msgSend(v28, "addObject:", v26);

                      v8 = v73;
                    }
                    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uwbConfigData"));
                    v30 = objc_msgSend(v29, "length");
                    if ((v17 & 2) != 0 && v30)
                    {
                      v31 = v29;

                      v72 = v31;
                      v8 = v73;
                    }
                    LOBYTE(v76) = ((v17 & 0x3E0) != 0) | v76;
                    HIDWORD(v76) |= (unsigned __int16)(v17 & 0x4000) >> 14;
                    LODWORD(v77) = v77 | ((unsigned __int16)(v17 & 0x800) >> 11);
                    HIDWORD(v77) |= objc_msgSend(v15, "enableEPAForLEAdvertisement");
                    v32 = objc_msgSend(v78, "count");

                    if ((unint64_t)v32 > 2)
                    {

                      v4 = v70;
                      v33 = v71;
                      v34 = BYTE4(v77);
                      v35 = v72;
                      v11 = v75;
                      goto LABEL_38;
                    }
                    v11 = v75;
                  }

                }
              }
            }
          }

        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
        if (v10)
          continue;
        break;
      }

      v4 = v70;
      v33 = v71;
      v34 = BYTE4(v77);
      v35 = v72;
LABEL_38:
      v36 = BYTE4(v76);
      LOBYTE(v10) = v77;
      if ((v76 & 1) == 0 || !v33->_identitySelf || objc_msgSend(v8, "length") != (id)6)
      {
LABEL_51:
        v39 = objc_msgSend(v78, "count") & 3;
        if (v35)
          LOBYTE(v39) = v39 | 8;
        if ((v36 & 1) != 0)
          LOBYTE(v39) = v39 | 0x20;
        if ((v10 & 1) != 0)
          v40 = v39 | 0x10;
        else
          v40 = v39;
        v41 = -[CBAdvertiserDaemon spatialInteractionAdvertiseRate](v4, "spatialInteractionAdvertiseRate");
        v2 = (_DWORD)v11 != v41;
        if ((_DWORD)v11 != v41)
          -[CBAdvertiserDaemon setSpatialInteractionAdvertiseRate:](v4, "setSpatialInteractionAdvertiseRate:", v11);
        v42 = v40;
        if (v40 != -[CBAdvertiserDaemon spatialInteractionFlags](v4, "spatialInteractionFlags"))
        {
          -[CBAdvertiserDaemon setSpatialInteractionFlags:](v4, "setSpatialInteractionFlags:", v40);
          v2 = 1;
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon spatialInteractionIdentifiers](v4, "spatialInteractionIdentifiers"));
        v44 = v78;
        v45 = v43;
        v46 = v45;
        if (v44 == v45)
        {

          goto LABEL_69;
        }
        if ((v44 == 0) != (v45 != 0))
        {
          v47 = objc_msgSend(v44, "isEqual:", v45);

          if ((v47 & 1) != 0)
          {
LABEL_69:
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon spatialInteractionUWBConfigData](v4, "spatialInteractionUWBConfigData"));
            v49 = v35;
            v50 = v48;
            if (v49 == v50)
            {

              goto LABEL_76;
            }
            v51 = v50;
            if ((v35 == 0) != (v50 != 0))
            {
              v52 = objc_msgSend(v49, "isEqual:", v50);

              if ((v52 & 1) != 0)
              {
LABEL_76:
                if ((v34 & 1) != -[CBAdvertiserDaemon advertiserEnableEPA](v4, "advertiserEnableEPA"))
                {
                  -[CBAdvertiserDaemon setAdvertiserEnableEPA:](v4, "setAdvertiserEnableEPA:");
                  v2 = 1;
                }
                if (objc_msgSend(v44, "count"))
                {
                  if (dword_100977980 <= 30
                    && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
                  {
                    v53 = CUPrintNSDataAddress(v73);
                    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
                    v55 = CUPrintFlags32(v42, &unk_100737911);
                    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
                    v57 = CUPrintNSObjectOneLine(v74);
                    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
                    v59 = CUPrintNSObjectOneLine(v44);
                    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
                    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserUpdateSpatialInteraction]", 30, "BLE advertiser: spatial update: Addr %@, Flags %@, IDs %@, Hashes %@", v54, v56, v58, v60);

                  }
                  v61 = v71;
                  bleAdvertiserSpatialLingerTimer = v71->_bleAdvertiserSpatialLingerTimer;
                  if (!bleAdvertiserSpatialLingerTimer)
                    goto LABEL_108;
                  if (dword_100977980 >= 31)
                  {
                    v64 = bleAdvertiserSpatialLingerTimer;
                  }
                  else
                  {
                    if (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30))
                      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserUpdateSpatialInteraction]", 30, "BLE advertiser: spatial linger cancel");
                    v64 = v71->_bleAdvertiserSpatialLingerTimer;
                    if (!v64)
                      goto LABEL_108;
                  }
                  dispatch_source_cancel(v64);
                  v65 = v71->_bleAdvertiserSpatialLingerTimer;
                  v71->_bleAdvertiserSpatialLingerTimer = 0;

                }
                else
                {
                  v61 = v71;
                  if (!objc_msgSend(v46, "count") || v71->_bleAdvertiserSpatialLingerTimer)
                  {
                    if (!-[CBAdvertiserDaemon spatialInteractionFlags](v4, "spatialInteractionFlags"))
                    {
                      v62 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon spatialInteractionIdentifiers](v4, "spatialInteractionIdentifiers"));
                      if (v62)
                      {

                      }
                      else
                      {
                        v66 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon spatialInteractionUWBConfigData](v4, "spatialInteractionUWBConfigData"));

                        if (!v66)
                        {
LABEL_108:
                          v61->_bleAdvertiserSpatialValid = 1;

LABEL_109:
                          return v2;
                        }
                      }
                    }
                    if (dword_100977980 <= 30
                      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
                    {
                      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserUpdateSpatialInteraction]", 30, "BLE advertiser: spatial clear");
                    }
                    -[CBAdvertiserDaemon setSpatialInteractionFlags:](v4, "setSpatialInteractionFlags:", 0);
                    -[CBAdvertiserDaemon setSpatialInteractionIdentifiers:](v4, "setSpatialInteractionIdentifiers:", 0);
                    -[CBAdvertiserDaemon setSpatialInteractionUWBConfigData:](v4, "setSpatialInteractionUWBConfigData:", 0);
                    v2 = 1;
                    goto LABEL_108;
                  }
                  if (dword_100977980 <= 30
                    && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
                  {
                    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserUpdateSpatialInteraction]", 30, "BLE advertiser: spatial linger start: %d seconds", 4);
                  }
                  -[CBAdvertiserDaemon setSpatialInteractionIdentifiers:](v4, "setSpatialInteractionIdentifiers:", &__NSArray0__struct);
                  v67 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v71->_dispatchQueue);
                  v68 = v71->_bleAdvertiserSpatialLingerTimer;
                  v71->_bleAdvertiserSpatialLingerTimer = (OS_dispatch_source *)v67;
                  v64 = v67;

                  handler[0] = _NSConcreteStackBlock;
                  handler[1] = 3221225472;
                  handler[2] = sub_1000840A8;
                  handler[3] = &unk_100917080;
                  handler[4] = v71;
                  dispatch_source_set_event_handler(v64, handler);
                  CUDispatchTimerSet(v64, 4.0, -1.0, 1.0);
                  dispatch_activate(v64);
                }

                goto LABEL_108;
              }
            }
            else
            {

            }
            -[CBAdvertiserDaemon setSpatialInteractionUWBConfigData:](v4, "setSpatialInteractionUWBConfigData:", v49);
            v2 = 1;
            goto LABEL_76;
          }
        }
        else
        {

        }
        -[CBAdvertiserDaemon setSpatialInteractionIdentifiers:](v4, "setSpatialInteractionIdentifiers:", v44);
        v2 = 1;
        goto LABEL_69;
      }
      v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[RPIdentity authTagForData:type:error:](v33->_identitySelf, "authTagForData:type:error:", v8, 2, 0));
      if (v9)
      {
        if ((unint64_t)objc_msgSend(v78, "count") >= 3)
        {
          do
            objc_msgSend(v78, "removeLastObject");
          while ((unint64_t)objc_msgSend(v78, "count") > 2);
        }
        if ((unint64_t)objc_msgSend(v74, "count") >= 3)
        {
          do
            objc_msgSend(v74, "removeLastObject");
          while ((unint64_t)objc_msgSend(v74, "count") > 2);
        }
        v37 = v74;
        if (!v74)
          v37 = objc_alloc_init((Class)NSMutableArray);
        v74 = v37;
        objc_msgSend(v37, "insertObject:atIndex:", v8, 0);
        v38 = v78;
        if (!v78)
          v38 = objc_alloc_init((Class)NSMutableArray);
        v78 = v38;
        objc_msgSend(v38, "insertObject:atIndex:", v9, 0);
      }
    }
    else
    {
      v11 = 0;
      v36 = 0;
      v34 = 0;
      v35 = 0;
      v74 = 0;
      v78 = 0;
    }

    goto LABEL_51;
  }
  return 0;
}

- (void)_bleAddressMonitorEnsureStarted
{
  CBStackAddressMonitor **p_addressMonitor;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  CBDaemonServer *v10;

  if (!self->_addressMonitor)
  {
    p_addressMonitor = &self->_addressMonitor;
    v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor addressMonitorClass](self->_stackAdaptor, "addressMonitorClass")));
    objc_storeStrong((id *)p_addressMonitor, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100083A28;
    v8[3] = &unk_100917058;
    v5 = v4;
    v9 = v5;
    v10 = self;
    objc_msgSend(v5, "setAddressChangedHandler:", v8);
    objc_msgSend(v5, "activate");
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v6 = CUDescriptionWithLevel(v5, 134217778);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAddressMonitorEnsureStarted]", 30, "BLE advertiser address monitor started: %@", v7);

    }
    -[CBDaemonServer _bleAdvertiserAddressChanged:](self, "_bleAdvertiserAddressChanged:", 1);
    -[CBDaemonServer _updateSelfAuthTag](self, "_updateSelfAuthTag");

  }
}

- (void)_accessoryDaemonEnsureStarted
{
  CBAccessoryDaemon *v3;
  CBAccessoryDaemon *accessoryDaemon;

  if (!self->_accessoryDaemon)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _accessoryDaemonEnsureStarted]", 30, "AccessoryDaemon start");
    }
    v3 = objc_alloc_init(CBAccessoryDaemon);
    accessoryDaemon = self->_accessoryDaemon;
    self->_accessoryDaemon = v3;

    -[CBAccessoryDaemon setDispatchQueue:](self->_accessoryDaemon, "setDispatchQueue:", self->_dispatchQueue);
    -[CBAccessoryDaemon setDaemonServer:](self->_accessoryDaemon, "setDaemonServer:", self);
    -[CBAccessoryDaemon activate](self->_accessoryDaemon, "activate");
  }
}

- (CBStackController)stackController
{
  return self->_stackController;
}

- (void)scheduleUpdateImmediate:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *dispatchQueue;
  _QWORD block[7];

  if (a3)
  {
    -[CBDaemonServer _update](self, "_update");
  }
  else
  {
    block[5] = v3;
    block[6] = v4;
    if (!self->_updatePending)
    {
      self->_updatePending = 1;
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100067540;
      block[3] = &unk_100917080;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
}

- (BOOL)prefEnforceApprovedList
{
  return self->_prefEnforceApprovedList;
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (BOOL)_supportsProxControl
{
  if (qword_10097BAB8 != -1)
    dispatch_once(&qword_10097BAB8, &stru_100917DF0);
  return byte_10097BAC0;
}

- (CBDaemonServer)initWithCBStackAdaptor:(id)a3
{
  id v5;
  CBDaemonServer *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *dispatchQueue;
  CBDaemonServer *v11;
  objc_super v13;

  v5 = a3;
  if (objc_opt_class(CUSystemMonitor)
    && (v13.receiver = self,
        v13.super_class = (Class)CBDaemonServer,
        v6 = -[CBDaemonServer init](&v13, "init"),
        (self = v6) != 0))
  {
    v6->_deviceSetupStateToken = -1;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (OS_dispatch_queue *)dispatch_queue_create("CBDaemon", v8);
    dispatchQueue = self->_dispatchQueue;
    self->_dispatchQueue = v9;

    self->_identitiesNotifyToken = -1;
    self->_odeonNotifyToken = -1;
    self->_prefsChangedNotifyToken = -1;
    self->_screenDimmedChangeNotifyToken = -1;
    self->_screenUndimmedChangeNotifyToken = -1;
    objc_storeStrong((id *)&self->_stackAdaptor, a3);
    self->_systemFlagsNotifyToken = -1;
    self->_coexNotificationSetup = 0;
    *(_QWORD *)&self->_userCloudDataChangedNotifyToken = -1;
    objc_storeStrong((id *)&gCBDaemonServer, self);
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)descriptionInternalDebug
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (IsAppleInternalBuild(self))
  {
    v3 = sub_10007F530();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "---------------- CBDaemonServer ----------------", v6, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer descriptionWithLevel:](self, "descriptionWithLevel:", 5));
    objc_msgSend(v5, "enumerateLinesUsingBlock:", &stru_100917800);

  }
}

- (id)description
{
  return -[CBDaemonServer descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  BOOL v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSUInteger v17;
  id v18;
  const char *v19;
  const char *v20;
  unsigned int deviceSetupState;
  const char *v22;
  NSData *v23;
  NSData *v24;
  id *v25;
  uint64_t v26;
  void *v27;
  NSData *v28;
  NSData *v29;
  id *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id *v37;
  id *v38;
  uint64_t assertionFlags;
  id *v40;
  uint64_t v41;
  void *v42;
  CBAdvertiserDaemon *v43;
  CBAdvertiserDaemon *v44;
  uint64_t v45;
  id *v46;
  uint64_t v47;
  void *v48;
  BOOL v49;
  id *v50;
  id *v51;
  uint64_t v52;
  void *v53;
  id *v54;
  CBStackAddressMonitor *v55;
  CBStackAddressMonitor *v56;
  id *v57;
  uint64_t v58;
  void *v59;
  BOOL v60;
  id *v61;
  id *v62;
  CBStackController *v63;
  CBStackController *v64;
  id *v65;
  uint64_t v66;
  void *v67;
  BOOL v68;
  id *v69;
  RPCompanionLinkClient *v70;
  RPCompanionLinkClient *v71;
  id *v72;
  void *v73;
  void *v74;
  void *v75;
  RPServer *v76;
  RPServer *v77;
  id *v78;
  const char *v79;
  id *v80;
  id *v81;
  id *v82;
  uint64_t v83;
  void *v84;
  BOOL v85;
  id *v86;
  id *v87;
  uint64_t v88;
  void *v89;
  BOOL v90;
  BOOL v91;
  BOOL v92;
  CBWHBDiscoveryDaemon *v93;
  id *v94;
  id *v95;
  uint64_t v96;
  void *v97;
  id *v98;
  id *v99;
  uint64_t v100;
  void *v101;
  BOOL v102;
  id *v103;
  id *v104;
  uint64_t v105;
  void *v106;
  CBWHBDiscoveryDaemon *v107;
  id *v108;
  id *v109;
  uint64_t v110;
  void *v111;
  char *v112;
  id *v113;
  id *v114;
  NSMutableDictionary *deviceMap;
  unint64_t v116;
  BOOL v117;
  char *v118;
  id *v119;
  id *v120;
  id v121;
  id *v122;
  NSMutableOrderedSet *lostDevicesForCBSpatial;
  id *v124;
  id v125;
  id *v126;
  id *v127;
  NSMutableSet *v128;
  id v129;
  uint64_t v130;
  void *i;
  uint64_t v132;
  id *v133;
  uint64_t v134;
  void *v135;
  id *v136;
  id *v137;
  void *v138;
  int v139;
  id v140;
  uint64_t v141;
  void *j;
  uint64_t v143;
  uint64_t v144;
  id *v145;
  void *v146;
  id *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  id v151;
  uint64_t v152;
  void *k;
  const __CFString *v154;
  CFPropertyListRef v155;
  void *v156;
  id *v157;
  uint64_t v158;
  void *v159;
  id *v160;
  id v161;
  int v164;
  CBStackDeviceMonitor *v165;
  CBStackBLEScanner *v166;
  CBAccessoryDaemon *v167;
  CBExtensionsDaemon *v168;
  CBStackBLEScanner *v169;
  unsigned int v170;
  id v171;
  id v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  id v178;
  id v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  id v184;
  id v185;
  id v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  id v191;
  id v192;
  id v193;
  _QWORD v194[5];
  int v195;
  id v196;
  id v197;
  id v198;
  _QWORD v199[6];
  int v200;
  int v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  uint64_t v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id obj;
  uint64_t v238;
  uint64_t *v239;
  uint64_t v240;
  uint64_t (*v241)(uint64_t, uint64_t);
  void (*v242)(uint64_t);
  id v243;
  _QWORD v244[30];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];

  v4 = a3 < 0xBu;
  if (a3 >= 0xBu)
    v5 = 60;
  else
    v5 = 30;
  if (a3 >= 0xBu)
    v6 = 30;
  else
    v6 = 20;
  v170 = a3;
  v238 = 0;
  v239 = &v238;
  v240 = 0x3032000000;
  v241 = sub_10006248C;
  v242 = sub_100062300;
  if (a3 < 6u)
    v5 = 5;
  v164 = v5;
  if (a3 >= 6u)
    v7 = v6;
  else
    v7 = 5;
  v243 = 0;
  obj = 0;
  v8 = mach_continuous_time();
  v9 = UpTicksToSeconds(v8 - self->_startTicksFull);
  v10 = CUPrintDuration64(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = mach_absolute_time();
  v13 = UpTicksToSeconds(v12 - self->_startTicksAwake);
  v14 = CUPrintDuration64(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = -[NSMutableDictionary count](self->_identityMapSameAccount, "count");
  v17 = -[NSArray count](self->_identityArray, "count");
  v18 = -[NSMutableDictionary count](self->_identifyDevices, "count");
  v19 = "yes";
  if (self->_odeonActive)
    v20 = "yes";
  else
    v20 = "no";
  if (!self->_wifiCritical)
    v19 = "no";
  deviceSetupState = self->_deviceSetupState;
  if (deviceSetupState > 9)
  {
    if (deviceSetupState == 10)
    {
      v22 = "NotStarted";
      goto LABEL_27;
    }
    if (deviceSetupState == 20)
    {
      v22 = "Complete";
      goto LABEL_27;
    }
  }
  else
  {
    if (!self->_deviceSetupState)
    {
      v22 = "Unknown";
      goto LABEL_27;
    }
    if (deviceSetupState == 1)
    {
      v22 = "FrameworkUnavailable";
      goto LABEL_27;
    }
  }
  v22 = "?";
LABEL_27:
  NSAppendPrintF_safe(&obj, "Up %@ (awake %@), Identities SA %d / Other %d / Devices %d, Odeon %s, WiFi critical %s, Device Setup %s", v11, v15, v16, v17, v18, v20, v19, v22);
  objc_storeStrong(&v243, obj);

  v23 = self->_selfAuthTag;
  v24 = v23;
  if (v23)
  {
    v25 = (id *)(v239 + 5);
    v236 = (id)v239[5];
    v26 = CUPrintNSDataHex(v23, 10, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    NSAppendPrintF_safe(&v236, ", AuthTag <%@>", v27);
    objc_storeStrong(v25, v236);

  }
  v28 = self->_selfAuthTagNonConnectable;
  v29 = v28;
  if (v28)
  {
    v30 = (id *)(v239 + 5);
    v235 = (id)v239[5];
    v31 = CUPrintNSDataHex(v28, 10, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    NSAppendPrintF_safe(&v235, ", AuthTagNonConnectable <%@>", v32);
    objc_storeStrong(v30, v235);

  }
  if (IsAppleInternalBuild(v33))
  {
    v34 = ((CFAbsoluteTimeGetCurrent() + kCFAbsoluteTimeIntervalSince1970) / 7200.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", -(kCFAbsoluteTimeIntervalSince1970 - (double)v34 * 7200.0)));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v35, 1, 1));

    v37 = (id *)(v239 + 5);
    v234 = (id)v239[5];
    NSAppendPrintF_safe(&v234, ", CBIntervalNumber <%u, %f, %@>", v34, -(kCFAbsoluteTimeIntervalSince1970 - (double)v34 * 7200.0), v36);
    objc_storeStrong(v37, v234);

  }
  v38 = (id *)(v239 + 5);
  v233 = (id)v239[5];
  NSAppendPrintF_safe(&v233, "\n\n");
  objc_storeStrong(v38, v233);
  assertionFlags = self->_assertionFlags;
  if ((_DWORD)assertionFlags)
  {
    v40 = (id *)(v239 + 5);
    v232 = (id)v239[5];
    v41 = CUPrintFlags32(assertionFlags, &unk_1007378B8);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    NSAppendPrintF_safe(&v232, "Assertions: %@\n", v42);
    objc_storeStrong(v40, v232);

  }
  v43 = self->_bleAdvertiser;
  v44 = v43;
  if (v43)
  {
    if (v170 >= 0xB)
      v45 = 50;
    else
      v45 = 30;
    v46 = (id *)(v239 + 5);
    v231 = (id)v239[5];
    v47 = CUDescriptionWithLevel(v43, v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    NSAppendPrintF_safe(&v231, "%@\n", v48);
    objc_storeStrong(v46, v231);

  }
  v167 = self->_accessoryDaemon;
  if (v167)
    v49 = v170 < 0xB;
  else
    v49 = 1;
  if (!v49)
  {
    v50 = (id *)(v239 + 5);
    v230 = (id)v239[5];
    NSAppendPrintF_safe(&v230, "%@\n", v167);
    objc_storeStrong(v50, v230);
  }
  v168 = self->_extensionsDaemon;
  if (v170 >= 0xB && v168)
  {
    v51 = (id *)(v239 + 5);
    v229 = (id)v239[5];
    NSAppendPrintF_safe(&v229, "%@\n", v168);
    objc_storeStrong(v51, v229);
  }
  v52 = objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
  v53 = (void *)v52;
  if (v52)
  {
    v54 = (id *)(v239 + 5);
    v228 = (id)v239[5];
    NSAppendPrintF_safe(&v228, "%@\n", v52);
    objc_storeStrong(v54, v228);
  }

  v55 = self->_addressMonitor;
  v56 = v55;
  if (v55)
  {
    v57 = (id *)(v239 + 5);
    v227 = (id)v239[5];
    v58 = CUDescriptionWithLevel(v55, v7);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    NSAppendPrintF_safe(&v227, "%@\n", v59);
    objc_storeStrong(v57, v227);

  }
  v166 = self->_stackBLEScanner;
  if (v166)
    v60 = v170 < 0xB;
  else
    v60 = 1;
  if (!v60)
  {
    v61 = (id *)(v239 + 5);
    v226 = (id)v239[5];
    NSAppendPrintF_safe(&v226, "%@\n", v166);
    objc_storeStrong(v61, v226);
  }
  v169 = self->_stackClassicScanner;
  if (v170 >= 0xB && v169)
  {
    v62 = (id *)(v239 + 5);
    v225 = (id)v239[5];
    NSAppendPrintF_safe(&v225, "%@\n", v169);
    objc_storeStrong(v62, v225);
  }
  v63 = self->_stackController;
  v64 = v63;
  if (v63)
  {
    v65 = (id *)(v239 + 5);
    v224 = (id)v239[5];
    v66 = CUDescriptionWithLevel(v63, v7);
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    NSAppendPrintF_safe(&v224, "%@\n", v67);
    objc_storeStrong(v65, v224);

  }
  v165 = self->_stackDeviceMonitor;
  if (v165)
    v68 = v170 < 0xB;
  else
    v68 = 1;
  if (!v68)
  {
    v69 = (id *)(v239 + 5);
    v223 = (id)v239[5];
    NSAppendPrintF_safe(&v223, "%@\n", v165);
    objc_storeStrong(v69, v223);
  }
  v70 = self->_remoteClient;
  v71 = v70;
  if (v70)
  {
    v72 = (id *)(v239 + 5);
    v222 = (id)v239[5];
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient localDevice](v70, "localDevice"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "idsDeviceIdentifier"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](v71, "activeDevices"));
    NSAppendPrintF_safe(&v222, "%sRemoteClient: IDS %@, controllers %d", ", v74, objc_msgSend(v75, "count"));
    objc_storeStrong(v72, v222);

  }
  v76 = self->_remoteServer;
  if (v76)
  {
    v77 = v76;
    v78 = (id *)(v239 + 5);
    v221 = (id)v239[5];
    v79 = ", ";
    if (!v71)
      v79 = "";
    NSAppendPrintF_safe(&v221, "%sRemoteServer: Yes", v79);
    objc_storeStrong(v78, v221);

    goto LABEL_74;
  }
  if (v71)
  {
LABEL_74:
    v80 = (id *)(v239 + 5);
    v220 = (id)v239[5];
    NSAppendPrintF_safe(&v220, "\n");
    objc_storeStrong(v80, v220);
  }
  if (v167 && v170 <= 0xA)
  {
    v81 = (id *)(v239 + 5);
    v219 = (id)v239[5];
    NSAppendPrintF_safe(&v219, "\n");
    objc_storeStrong(v81, v219);
    v82 = (id *)(v239 + 5);
    v218 = (id)v239[5];
    v83 = CUDescriptionWithLevel(v167, v7);
    v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
    NSAppendPrintF_safe(&v218, "%@", v84);
    objc_storeStrong(v82, v218);

  }
  if (v168)
    v85 = v170 > 0xA;
  else
    v85 = 1;
  if (!v85)
  {
    v86 = (id *)(v239 + 5);
    v217 = (id)v239[5];
    NSAppendPrintF_safe(&v217, "\n");
    objc_storeStrong(v86, v217);
    v87 = (id *)(v239 + 5);
    v216 = (id)v239[5];
    v88 = CUDescriptionWithLevel(v168, v7);
    v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
    NSAppendPrintF_safe(&v216, "%@", v89);
    objc_storeStrong(v87, v216);

  }
  if (v166)
    v90 = v170 > 0xA;
  else
    v90 = 1;
  if (v90)
  {
    if (v169)
      v91 = v170 > 0xA;
    else
      v91 = 1;
    if (v91)
    {
      if (v165)
        v92 = v170 > 0xA;
      else
        v92 = 1;
      if (v92)
      {
        v93 = self->_whbDiscoveryDaemon;
        if (!v93)
        {
          v4 = 0;
          goto LABEL_112;
        }
LABEL_110:
        v108 = (id *)(v239 + 5);
        v209 = (id)v239[5];
        NSAppendPrintF_safe(&v209, "\n");
        objc_storeStrong(v108, v209);
        goto LABEL_111;
      }
      goto LABEL_106;
    }
LABEL_99:
    v98 = (id *)(v239 + 5);
    v213 = (id)v239[5];
    NSAppendPrintF_safe(&v213, "\n");
    objc_storeStrong(v98, v213);
    goto LABEL_100;
  }
  v94 = (id *)(v239 + 5);
  v215 = (id)v239[5];
  NSAppendPrintF_safe(&v215, "\n");
  objc_storeStrong(v94, v215);
  v95 = (id *)(v239 + 5);
  v214 = (id)v239[5];
  v96 = CUDescriptionWithLevel(v166, v7);
  v97 = (void *)objc_claimAutoreleasedReturnValue(v96);
  NSAppendPrintF_safe(&v214, "%@\n", v97);
  objc_storeStrong(v95, v214);

  if (!v169)
    goto LABEL_101;
  if (v170 >= 0xB)
    goto LABEL_99;
LABEL_100:
  v99 = (id *)(v239 + 5);
  v212 = (id)v239[5];
  v100 = CUDescriptionWithLevel(v169, v7);
  v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
  NSAppendPrintF_safe(&v212, "%@\n", v101);
  objc_storeStrong(v99, v212);

LABEL_101:
  if (v165)
    v102 = v170 > 0xA;
  else
    v102 = 1;
  if (!v102)
  {
    if (v170 < 0xB)
    {
LABEL_107:
      v104 = (id *)(v239 + 5);
      v210 = (id)v239[5];
      v105 = CUDescriptionWithLevel(v165, v7);
      v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
      NSAppendPrintF_safe(&v210, "%@\n", v106);
      objc_storeStrong(v104, v210);

      goto LABEL_108;
    }
LABEL_106:
    v103 = (id *)(v239 + 5);
    v211 = (id)v239[5];
    NSAppendPrintF_safe(&v211, "\n");
    objc_storeStrong(v103, v211);
    goto LABEL_107;
  }
LABEL_108:
  v107 = self->_whbDiscoveryDaemon;
  if (!v107)
    goto LABEL_112;
  v93 = v107;
  if (v170 >= 0xB)
    goto LABEL_110;
LABEL_111:
  v109 = (id *)(v239 + 5);
  v208 = (id)v239[5];
  v110 = CUDescriptionWithLevel(v93, v7);
  v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
  NSAppendPrintF_safe(&v208, "%@\n", v111);
  objc_storeStrong(v109, v208);

LABEL_112:
  v112 = (char *)-[NSMutableDictionary count](self->_deviceMap, "count");
  if (v112)
  {
    if (!v4)
    {
      v113 = (id *)(v239 + 5);
      v207 = (id)v239[5];
      NSAppendPrintF_safe(&v207, "\n");
      objc_storeStrong(v113, v207);
    }
    v114 = (id *)(v239 + 5);
    v206 = (id)v239[5];
    NSAppendPrintF_safe(&v206, "== Combined devices: %d ==\n", (_DWORD)v112);
    objc_storeStrong(v114, v206);
    v202 = 0;
    v203 = &v202;
    v204 = 0x2020000000;
    v205 = 0;
    deviceMap = self->_deviceMap;
    v199[0] = _NSConcreteStackBlock;
    v199[1] = 3221225472;
    v199[2] = sub_1000809E4;
    v199[3] = &unk_100917828;
    v199[4] = &v238;
    v199[5] = &v202;
    v200 = v164;
    v201 = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v199);
    v116 = v203[3];
    v117 = (unint64_t)v112 >= v116;
    v118 = &v112[-v116];
    if (v118 != 0 && v117)
    {
      v119 = (id *)(v239 + 5);
      v198 = (id)v239[5];
      NSAppendPrintF_safe(&v198, "... %d more, %d total\n", (_DWORD)v118, (_DWORD)v112);
      objc_storeStrong(v119, v198);
    }
    v120 = (id *)(v239 + 5);
    v197 = (id)v239[5];
    NSAppendPrintF_safe(&v197, "\n");
    objc_storeStrong(v120, v197);
    _Block_object_dispose(&v202, 8);
    v4 = 1;
  }
  v121 = -[NSMutableOrderedSet count](self->_lostDevicesForCBSpatial, "count");
  if (v121)
  {
    v122 = (id *)(v239 + 5);
    v196 = (id)v239[5];
    NSAppendPrintF_safe(&v196, "== Lost CBSpatial Devices: %d ==\n", (_DWORD)v121);
    objc_storeStrong(v122, v196);
    lostDevicesForCBSpatial = self->_lostDevicesForCBSpatial;
    v194[0] = _NSConcreteStackBlock;
    v194[1] = 3221225472;
    v194[2] = sub_100080A8C;
    v194[3] = &unk_100917850;
    v194[4] = &v238;
    v195 = v164;
    -[NSMutableOrderedSet enumerateObjectsUsingBlock:](lostDevicesForCBSpatial, "enumerateObjectsUsingBlock:", v194);
    v124 = (id *)(v239 + 5);
    v193 = (id)v239[5];
    NSAppendPrintF_safe(&v193, "\n");
    objc_storeStrong(v124, v193);
    v4 = 1;
  }
  v125 = -[NSMutableSet count](self->_xpcConnections, "count");
  if (v125)
  {
    if (!v4)
    {
      v126 = (id *)(v239 + 5);
      v192 = (id)v239[5];
      NSAppendPrintF_safe(&v192, "\n");
      objc_storeStrong(v126, v192);
    }
    v127 = (id *)(v239 + 5);
    v191 = (id)v239[5];
    NSAppendPrintF_safe(&v191, "== XPC Cnx: %d ==\n", (_DWORD)v125);
    objc_storeStrong(v127, v191);
    v189 = 0u;
    v190 = 0u;
    v187 = 0u;
    v188 = 0u;
    v128 = self->_xpcConnections;
    v129 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v187, v247, 16);
    if (v129)
    {
      v130 = *(_QWORD *)v188;
      do
      {
        for (i = 0; i != v129; i = (char *)i + 1)
        {
          if (*(_QWORD *)v188 != v130)
            objc_enumerationMutation(v128);
          v132 = *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * (_QWORD)i);
          v133 = (id *)(v239 + 5);
          v186 = (id)v239[5];
          v134 = CUDescriptionWithLevel(v132, v7);
          v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
          NSAppendPrintF_safe(&v186, "%@", v135);
          objc_storeStrong(v133, v186);

          if (v7 > 0x14)
          {
            v136 = (id *)(v239 + 5);
            v185 = (id)v239[5];
            NSAppendPrintF_safe(&v185, "\n");
            objc_storeStrong(v136, v185);
          }
        }
        v129 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v187, v247, 16);
      }
      while (v129);
    }

    v137 = (id *)(v239 + 5);
    v184 = (id)v239[5];
    NSAppendPrintF_safe(&v184, "\n");
    objc_storeStrong(v137, v184);
    v4 = 1;
  }
  if (v170 <= 0x14)
  {
    v182 = 0u;
    v183 = 0u;
    v180 = 0u;
    v181 = 0u;
    v138 = (void *)CFPrefs_CopyKeys(CFSTR("com.apple.bluetooth"), 0);
    v139 = 0;
    v140 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v180, v246, 16);
    if (v140)
    {
      v141 = *(_QWORD *)v181;
      do
      {
        for (j = 0; j != v140; j = (char *)j + 1)
        {
          if (*(_QWORD *)v181 != v141)
            objc_enumerationMutation(v138);
          v143 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * (_QWORD)j);
          v144 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v143, v144) & 1) != 0)
          {
            if (!v4)
            {
              v145 = (id *)(v239 + 5);
              v179 = (id)v239[5];
              NSAppendPrintF_safe(&v179, "\n");
              objc_storeStrong(v145, v179);
            }
            v146 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.bluetooth"), v143, 0, 0);
            v147 = (id *)(v239 + 5);
            v178 = (id)v239[5];
            v148 = CUPrintNSObjectOneLine(v146);
            v149 = (void *)objc_claimAutoreleasedReturnValue(v148);
            NSAppendPrintF_safe(&v178, "Pref: '%@' = '%@'\n", v143, v149);
            objc_storeStrong(v147, v178);

            ++v139;
            v4 = 1;
          }
        }
        v140 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v180, v246, 16);
      }
      while (v140);
    }

    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v244[0] = CFSTR("accessoryDaemonConnections");
    v244[1] = CFSTR("accessoryDaemonConnectSeconds");
    v244[2] = CFSTR("accessoryDaemonEnabled");
    v244[3] = CFSTR("adjustHIDSniffForStereoSCO");
    v244[4] = CFSTR("APLogCloudCollectionEnabled");
    v244[5] = CFSTR("authTagIntegrityCheckEnabled");
    v244[6] = CFSTR("bleAdvertising");
    v244[7] = CFSTR("bleScanning");
    v244[8] = CFSTR("btvcDefaultAdvRSSI");
    v244[9] = CFSTR("disableCentralSkipSniff");
    v244[10] = CFSTR("disabledExtensions");
    v244[11] = CFSTR("discoveryProxy");
    v244[12] = CFSTR("enableSpecialSniffTransitions");
    v244[13] = CFSTR("enforceApprovedExtensions");
    v244[14] = CFSTR("enforceApprovedList");
    v244[15] = CFSTR("extensionsEnabled");
    v244[16] = CFSTR("intelligenceDaemonEnabled");
    v244[17] = CFSTR("memoryPressureFlags");
    v244[18] = CFSTR("move3PPLEMSToLegacyMode");
    v244[19] = CFSTR("move3PPLEMSToLegacyModeSerial");
    v244[20] = CFSTR("remoteClientEnabled");
    v244[21] = CFSTR("remoteServerEnabled");
    v244[22] = CFSTR("BluetoothAutoSeekKeyboard");
    v244[23] = CFSTR("BluetoothAutoSeekPointingDevice");
    v244[24] = CFSTR("SpatialSoundProfileAllowed");
    v244[25] = CFSTR("systemReferenceTimeDisabled");
    v244[26] = CFSTR("whbDiscoveryAlways");
    v244[27] = CFSTR("whbMaxLEConnections");
    v244[28] = CFSTR("wiproxAdvertising");
    v244[29] = CFSTR("UseLowLatencyGameController");
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v244, 30));
    v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v174, v245, 16);
    if (v151)
    {
      v152 = *(_QWORD *)v175;
      v171 = v150;
      do
      {
        for (k = 0; k != v151; k = (char *)k + 1)
        {
          if (*(_QWORD *)v175 != v152)
            objc_enumerationMutation(v171);
          v154 = *(const __CFString **)(*((_QWORD *)&v174 + 1) + 8 * (_QWORD)k);
          v155 = CFPreferencesCopyValue(v154, CFSTR("com.apple.Bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
          v156 = (void *)v155;
          if (v155)
          {
            v157 = (id *)(v239 + 5);
            v173 = (id)v239[5];
            v158 = CUPrintNSObjectOneLine(v155);
            v159 = (void *)objc_claimAutoreleasedReturnValue(v158);
            NSAppendPrintF_safe(&v173, "Pref: '%@' = '%@' (legacy)\n", v154, v159);
            objc_storeStrong(v157, v173);

            ++v139;
          }

        }
        v150 = v171;
        v151 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v174, v245, 16);
      }
      while (v151);
    }

    if (v139 >= 1)
    {
      v160 = (id *)(v239 + 5);
      v172 = (id)v239[5];
      NSAppendPrintF_safe(&v172, "\n");
      objc_storeStrong(v160, v172);
    }
  }
  v161 = (id)v239[5];

  _Block_object_dispose(&v238, 8);
  return v161;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080B50;
  block[3] = &unk_100917080;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  OS_xpc_object *mach_service;
  OS_xpc_object *xpcListener;
  OS_xpc_object *v5;
  uint64_t v6;
  OS_xpc_event_publisher *v7;
  OS_xpc_event_publisher *xpcPublisherConnections;
  OS_xpc_event_publisher *v9;
  uint64_t v10;
  OS_xpc_event_publisher *v11;
  OS_xpc_event_publisher *xpcPublisherDiscovery;
  OS_xpc_event_publisher *v13;
  NSObject *dispatchQueue;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  dispatch_source_t v19;
  CUSystemMonitor *v20;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  OS_dispatch_queue *v27;
  id v28;
  unsigned __int8 v29;
  id v30;
  const char *v31;
  NSObject *v32;
  unsigned int deviceSetupState;
  const char *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[6];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[4];
  NSObject *v45;
  CBDaemonServer *v46;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD handler[5];

  self->_startTicksAwake = mach_absolute_time();
  self->_startTicksFull = mach_continuous_time();
  LogSetAppID(CFSTR("com.apple.bluetooth"));
  LogControl("?.*:level=chatty,.*:flags=public");
  -[CBDaemonServer _stackControllerEnsureStarted](self, "_stackControllerEnsureStarted");
  if (!self->_xpcListener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)self->_dispatchQueue, 1uLL);
    xpcListener = self->_xpcListener;
    self->_xpcListener = mach_service;

    v5 = self->_xpcListener;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006755C;
    handler[3] = &unk_100917878;
    handler[4] = self;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_activate(self->_xpcListener);
  }
  if (!self->_xpcPublisherConnections)
  {
    v6 = xpc_event_publisher_create("com.apple.bluetooth.connections", self->_dispatchQueue);
    v7 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue(v6);
    xpcPublisherConnections = self->_xpcPublisherConnections;
    self->_xpcPublisherConnections = v7;

    v9 = self->_xpcPublisherConnections;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10008135C;
    v51[3] = &unk_1009178A0;
    v51[4] = self;
    xpc_event_publisher_set_handler(v9, v51);
    xpc_event_publisher_set_error_handler(self->_xpcPublisherConnections, &stru_1009178E0);
    xpc_event_publisher_activate(self->_xpcPublisherConnections);
  }
  if (!self->_xpcPublisherDiscovery)
  {
    v10 = xpc_event_publisher_create("com.apple.bluetooth.discovery", self->_dispatchQueue);
    v11 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue(v10);
    xpcPublisherDiscovery = self->_xpcPublisherDiscovery;
    self->_xpcPublisherDiscovery = v11;

    v13 = self->_xpcPublisherDiscovery;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100081404;
    v50[3] = &unk_1009178A0;
    v50[4] = self;
    xpc_event_publisher_set_handler(v13, v50);
    xpc_event_publisher_set_error_handler(self->_xpcPublisherDiscovery, &stru_100917900);
    xpc_event_publisher_activate(self->_xpcPublisherDiscovery);
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000814AC;
    v49[3] = &unk_100917928;
    v49[4] = self;
    notify_register_dispatch("com.apple.bluetooth.prefsChanged", &self->_prefsChangedNotifyToken, dispatchQueue, v49);
  }
  if (self->_screenDimmedChangeNotifyToken == -1)
  {
    v15 = self->_dispatchQueue;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10008151C;
    v48[3] = &unk_100917928;
    v48[4] = self;
    notify_register_dispatch("com.apple.springboardservices.eventobserver.internalSBSEventObserverEventDimmed", &self->_screenDimmedChangeNotifyToken, v15, v48);
  }
  if (self->_screenUndimmedChangeNotifyToken == -1)
  {
    v16 = self->_dispatchQueue;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100081598;
    v47[3] = &unk_100917928;
    v47[4] = self;
    notify_register_dispatch("com.apple.springboardservices.eventobserver.internalSBSEventObserverEventUndimmed", &self->_screenUndimmedChangeNotifyToken, v16, v47);
  }
  v17 = self->_memoryPressureSource;
  v18 = v17;
  if (!v17)
  {
    v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 7uLL, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_memoryPressureSource, v19);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100081618;
    v44[3] = &unk_100917058;
    v18 = v19;
    v45 = v18;
    v46 = self;
    dispatch_source_set_event_handler(v18, v44);
    dispatch_activate(v18);

  }
  if (!self->_systemMonitor)
  {
    v20 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v20;
    v22 = v20;

    -[CUSystemMonitor setDispatchQueue:](v22, "setDispatchQueue:", self->_dispatchQueue);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100081700;
    v43[3] = &unk_100917080;
    v43[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](v22, "setFirstUnlockHandler:", v43);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100081708;
    v42[3] = &unk_100917080;
    v42[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](v22, "setScreenOnChangedHandler:", v42);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100081714;
    v41[3] = &unk_100917080;
    v41[4] = self;
    -[CUSystemMonitor setWifiStateChangedHandler:](v22, "setWifiStateChangedHandler:", v41);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100081720;
    v40[3] = &unk_100917058;
    v40[4] = self;
    v40[5] = v22;
    -[CUSystemMonitor activateWithCompletion:](v22, "activateWithCompletion:", v40);

  }
  if (self->_odeonNotifyToken == -1)
  {
    v23 = self->_dispatchQueue;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100081770;
    v39[3] = &unk_100917928;
    v39[4] = self;
    v17 = notify_register_dispatch("com.apple.airplay.isPlayingAmbientAudioChanged", &self->_odeonNotifyToken, v23, v39);
  }
  if (self->_systemFlagsNotifyToken == -1)
    v17 = notify_register_check("com.apple.bluetooth.systemFlags", &self->_systemFlagsNotifyToken);
  if (!self->_tipiObserving)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "addObserver:selector:name:object:", self, "_tipiChanged:", CFSTR("com.apple.bluetooth.TipiChanged"), 0);
    self->_tipiObserving = 1;

  }
  if (self->_userCloudDataChangedNotifyToken == -1)
  {
    v25 = self->_dispatchQueue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100081858;
    v38[3] = &unk_100917928;
    v38[4] = self;
    v17 = notify_register_dispatch("com.apple.bluetoothuser.cloudChanged", &self->_userCloudDataChangedNotifyToken, v25, v38);
  }
  if (self->_userDaemonStartedNotifyToken == -1)
  {
    v26 = self->_dispatchQueue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100081860;
    v37[3] = &unk_100917928;
    v37[4] = self;
    v17 = notify_register_dispatch("com.apple.bluetoothuser.daemonStarted", &self->_userDaemonStartedNotifyToken, v26, v37);
  }
  if (!self->_stateHandler)
  {
    v27 = self->_dispatchQueue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100081868;
    v36[3] = &unk_100917950;
    v36[4] = self;
    v17 = os_state_add_handler(v27, v36);
    self->_stateHandler = v17;
  }
  if (&_BYSetupAssistantNeedsToRun)
  {
    if (self->_deviceSetupState == 1)
    {
      v28 = 0;
    }
    else
    {
      if (BYSetupAssistantNeedsToRun(v17))
        v29 = 10;
      else
        v29 = 20;
      self->_deviceSetupState = v29;
      v30 = BYSetupAssistantFinishedDarwinNotification;
      v28 = v30;
      if (self->_deviceSetupState == 10 && self->_deviceSetupStateToken == -1)
      {
        v28 = objc_retainAutorelease(v30);
        v31 = (const char *)objc_msgSend(v28, "UTF8String");
        v32 = self->_dispatchQueue;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000818A0;
        v35[3] = &unk_100917928;
        v35[4] = self;
        notify_register_dispatch(v31, &self->_deviceSetupStateToken, v32, v35);
      }
    }
  }
  else
  {
    v28 = 0;
    self->_deviceSetupState = 1;
  }
  if (dword_100977980 <= 30 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
  {
    deviceSetupState = self->_deviceSetupState;
    if (deviceSetupState > 9)
    {
      if (deviceSetupState == 10)
      {
        v34 = "NotStarted";
        goto LABEL_53;
      }
      if (deviceSetupState == 20)
      {
        v34 = "Complete";
        goto LABEL_53;
      }
    }
    else
    {
      if (!self->_deviceSetupState)
      {
        v34 = "Unknown";
        goto LABEL_53;
      }
      if (deviceSetupState == 1)
      {
        v34 = "FrameworkUnavailable";
LABEL_53:
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _activate]", 30, "Device setup %s", v34);
        goto LABEL_54;
      }
    }
    v34 = "?";
    goto LABEL_53;
  }
LABEL_54:
  -[CBDaemonServer _prefsChanged](self, "_prefsChanged");
  notify_post("com.apple.bluetooth.daemonStarted");

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000819E4;
  block[3] = &unk_100917080;
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
  OS_dispatch_source *lostDevicesForCBSpatialWipeTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *memoryPressureSource;
  NSObject *v14;
  OS_dispatch_source *v15;
  int deviceSetupStateToken;
  int prefsChangedNotifyToken;
  int odeonNotifyToken;
  int screenDimmedChangeNotifyToken;
  int screenUndimmedChangeNotifyToken;
  int systemFlagsNotifyToken;
  int userCloudDataChangedNotifyToken;
  int userDaemonStartedNotifyToken;
  CUSystemMonitor *systemMonitor;
  void *v25;
  OS_xpc_object *xpcListener;
  _xpc_connection_s *v27;
  OS_xpc_object *v28;
  OS_xpc_event_publisher *xpcPublisherConnections;
  OS_xpc_event_publisher *xpcPublisherDiscovery;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = self->_xpcConnections;
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v3;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "invalidate", (_QWORD)v31);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v7);
  }

  -[NSMutableSet removeAllObjects](v5, "removeAllObjects");
  -[CBDaemonServer _remoteEnsureStopped](self, "_remoteEnsureStopped");
  -[CBDaemonServer _whbDiscoveryEnsureStopped](self, "_whbDiscoveryEnsureStopped");
  -[CBDaemonServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  -[CBDaemonServer _identitiesEnsureStopped](self, "_identitiesEnsureStopped");
  -[CBDaemonServer _stackBLEScannerEnsureStopped](self, "_stackBLEScannerEnsureStopped");
  -[CBDaemonServer _stackClassicScannerEnsureStopped](self, "_stackClassicScannerEnsureStopped");
  -[CBDaemonServer _stackControllerEnsureStopped](self, "_stackControllerEnsureStopped");
  -[CBDaemonServer _stackDeviceMonitorEnsureStopped](self, "_stackDeviceMonitorEnsureStopped");
  -[CBDaemonServer _accessoryDaemonEnsureStopped](self, "_accessoryDaemonEnsureStopped");
  -[CBDaemonServer _extensionsEnsureStopped](self, "_extensionsEnsureStopped");
  -[CBDaemonServer _invalidateUserController](self, "_invalidateUserController");
  lostDevicesForCBSpatialWipeTimer = self->_lostDevicesForCBSpatialWipeTimer;
  if (lostDevicesForCBSpatialWipeTimer)
  {
    v11 = lostDevicesForCBSpatialWipeTimer;
    dispatch_source_cancel(v11);
    v12 = self->_lostDevicesForCBSpatialWipeTimer;
    self->_lostDevicesForCBSpatialWipeTimer = 0;

  }
  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
  {
    v14 = memoryPressureSource;
    dispatch_source_cancel(v14);
    v15 = self->_memoryPressureSource;
    self->_memoryPressureSource = 0;

  }
  deviceSetupStateToken = self->_deviceSetupStateToken;
  if (deviceSetupStateToken != -1)
  {
    notify_cancel(deviceSetupStateToken);
    self->_deviceSetupStateToken = -1;
  }
  prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_prefsChangedNotifyToken = -1;
  }
  odeonNotifyToken = self->_odeonNotifyToken;
  if (odeonNotifyToken != -1)
  {
    notify_cancel(odeonNotifyToken);
    self->_odeonNotifyToken = -1;
  }
  screenDimmedChangeNotifyToken = self->_screenDimmedChangeNotifyToken;
  if (screenDimmedChangeNotifyToken != -1)
  {
    notify_cancel(screenDimmedChangeNotifyToken);
    self->_screenDimmedChangeNotifyToken = -1;
  }
  screenUndimmedChangeNotifyToken = self->_screenUndimmedChangeNotifyToken;
  if (screenUndimmedChangeNotifyToken != -1)
  {
    notify_cancel(screenUndimmedChangeNotifyToken);
    self->_screenUndimmedChangeNotifyToken = -1;
  }
  systemFlagsNotifyToken = self->_systemFlagsNotifyToken;
  if (systemFlagsNotifyToken != -1)
  {
    notify_cancel(systemFlagsNotifyToken);
    self->_systemFlagsNotifyToken = -1;
  }
  userCloudDataChangedNotifyToken = self->_userCloudDataChangedNotifyToken;
  if (userCloudDataChangedNotifyToken != -1)
  {
    notify_cancel(userCloudDataChangedNotifyToken);
    self->_userCloudDataChangedNotifyToken = -1;
  }
  userDaemonStartedNotifyToken = self->_userDaemonStartedNotifyToken;
  if (userDaemonStartedNotifyToken != -1)
  {
    notify_cancel(userDaemonStartedNotifyToken);
    self->_userDaemonStartedNotifyToken = -1;
  }
  if (self->_stateHandler)
  {
    os_state_remove_handler();
    self->_stateHandler = 0;
  }
  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate", (_QWORD)v31);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  if (self->_tipiObserving || self->_lowPowerModeObserving)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "removeObserver:", self);

    if (self->_tipiObserving)
      self->_tipiObserving = 0;
    if (self->_lowPowerModeObserving)
      self->_lowPowerModeObserving = 0;
  }
  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    v27 = xpcListener;
    xpc_connection_cancel(v27);
    v28 = self->_xpcListener;
    self->_xpcListener = 0;

  }
  xpcPublisherConnections = self->_xpcPublisherConnections;
  self->_xpcPublisherConnections = 0;

  xpcPublisherDiscovery = self->_xpcPublisherDiscovery;
  self->_xpcPublisherDiscovery = 0;

  if (dword_100977980 <= 30 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _invalidate]", 30, "Invalidated");

}

- (void)_prefsChanged
{
  uint64_t Int64;
  BOOL v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  BOOL v24;
  _BOOL4 v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  unsigned __int8 v29;
  uint64_t deviceSetupState;
  const char *v31;
  const char *v32;
  uint64_t v33;
  BOOL v34;
  _BOOL4 v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  BOOL v39;
  _BOOL4 v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  BOOL v44;
  _BOOL4 v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  _BOOL4 v49;
  uint64_t v50;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t prefMemoryPressureFlags;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSObject *dispatchQueue;
  uint64_t v61;
  _BOOL4 v62;
  int DeviceClass;
  const char *v65;
  const char *v66;
  uint64_t v67;
  _BOOL4 v68;
  int v69;
  const char *v71;
  const char *v72;
  uint64_t v73;
  BOOL v74;
  _BOOL4 v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  BOOL v79;
  _BOOL4 v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  BOOL v84;
  _BOOL4 v85;
  const char *v86;
  const char *v87;
  _QWORD block[5];
  int v89;

  v89 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("accessoryDaemonEnabled"), &v89);
  if (v89)
    v4 = 0;
  else
    v4 = Int64 == 0;
  v5 = !v4;
  if (self->_prefAccessoryDaemonEnabled != v5)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v6 = "yes";
      if (v5)
        v7 = "no";
      else
        v7 = "yes";
      if (!v5)
        v6 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "AccessoryDaemonEnabled: %s -> %s", v7, v6);
    }
    self->_prefAccessoryDaemonEnabled = v5;
  }
  v8 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("APLogCloudCollectionEnabled"), &v89);
  v9 = v8 != 0;
  if (self->_prefAppleAudioDeviceLimitedLoggingEnabled != v9)
  {
    if (dword_100977980 <= 30)
    {
      v10 = v8;
      if (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30))
      {
        v11 = "yes";
        if (v10)
          v12 = "no";
        else
          v12 = "yes";
        if (!v10)
          v11 = "no";
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "AppleAudioDeviceLimitedLoggingEnabled: %s -> %s", v12, v11);
      }
    }
    self->_prefAppleAudioDeviceLimitedLoggingEnabled = v9;
  }
  v13 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("authTagIntegrityCheckEnabled"), &v89);
  if (v89)
    v14 = 1;
  else
    v14 = v13 == 0;
  v15 = !v14;
  if (self->_prefAuthTagIntegrityCheckEnabled != v15)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v16 = "yes";
      if (v15)
        v17 = "no";
      else
        v17 = "yes";
      if (!v15)
        v16 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "AuthTagIntegrityCheckEnabled: %s -> %s", v17, v16);
    }
    self->_prefAuthTagIntegrityCheckEnabled = v15;
  }
  v18 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("bleAdvertising"), &v89);
  if (v89)
    v19 = 0;
  else
    v19 = v18 == 0;
  v20 = !v19;
  if (self->_prefBLEAdvertising != v20)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v21 = "yes";
      if (v20)
        v22 = "no";
      else
        v22 = "yes";
      if (!v20)
        v21 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "BLEAdvertising: %s -> %s", v22, v21);
    }
    self->_prefBLEAdvertising = v20;
  }
  v23 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("bleScanning"), &v89);
  if (v89)
    v24 = 0;
  else
    v24 = v23 == 0;
  v25 = !v24;
  if (self->_prefBLEScanning != v25)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v26 = "yes";
      if (v25)
        v27 = "no";
      else
        v27 = "yes";
      if (!v25)
        v26 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "BLEScanning: %s -> %s", v27, v26);
    }
    self->_prefBLEScanning = v25;
  }
  v28 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("deviceSetupState"), &v89);
  if (!v89)
  {
    v29 = v28;
    deviceSetupState = self->_deviceSetupState;
    if (v28 != deviceSetupState)
    {
      if (dword_100977980 <= 30)
      {
        if (dword_100977980 != -1)
          goto LABEL_84;
        if (_LogCategory_Initialize(&dword_100977980, 30))
        {
          LODWORD(deviceSetupState) = self->_deviceSetupState;
LABEL_84:
          if ((int)deviceSetupState > 9)
          {
            if ((_DWORD)deviceSetupState == 10)
            {
              v31 = "NotStarted";
              goto LABEL_96;
            }
            if ((_DWORD)deviceSetupState == 20)
            {
              v31 = "Complete";
              goto LABEL_96;
            }
          }
          else
          {
            if (!(_DWORD)deviceSetupState)
            {
              v31 = "Unknown";
              goto LABEL_96;
            }
            if ((_DWORD)deviceSetupState == 1)
            {
              v31 = "FrameworkUnavailable";
              goto LABEL_96;
            }
          }
          v31 = "?";
LABEL_96:
          if (v29 > 9u)
          {
            if (v29 == 10)
            {
              v32 = "NotStarted";
              goto LABEL_106;
            }
            if (v29 == 20)
            {
              v32 = "Complete";
              goto LABEL_106;
            }
          }
          else
          {
            if (!v29)
            {
              v32 = "Unknown";
              goto LABEL_106;
            }
            if (v29 == 1)
            {
              v32 = "FrameworkUnavailable";
LABEL_106:
              LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "DeviceSetupState: %s -> %s", v31, v32);
              goto LABEL_107;
            }
          }
          v32 = "?";
          goto LABEL_106;
        }
      }
LABEL_107:
      self->_deviceSetupState = v29;
    }
  }
  v33 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("discoveryProxy"), &v89);
  if (v89)
    v34 = 0;
  else
    v34 = v33 == 0;
  v35 = !v34;
  if (self->_prefDiscoveryProxy != v35)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v36 = "yes";
      if (v35)
        v37 = "no";
      else
        v37 = "yes";
      if (!v35)
        v36 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "DiscoveryProxy: %s -> %s", v37, v36);
    }
    self->_prefDiscoveryProxy = v35;
  }
  v38 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("enforceApprovedExtensions"), &v89);
  if (v89)
    v39 = 0;
  else
    v39 = v38 == 0;
  v40 = !v39;
  if (self->_prefEnforceApprovedExtensions != v40)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v41 = "yes";
      if (v40)
        v42 = "no";
      else
        v42 = "yes";
      if (!v40)
        v41 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "EnforceApprovedExtensions: %s -> %s", v42, v41);
    }
    self->_prefEnforceApprovedExtensions = v40;
  }
  v43 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("enforceApprovedList"), &v89);
  if (v89)
    v44 = 0;
  else
    v44 = v43 == 0;
  v45 = !v44;
  if (self->_prefEnforceApprovedList != v45)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v46 = "yes";
      if (v45)
        v47 = "no";
      else
        v47 = "yes";
      if (!v45)
        v46 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "EnforceApprovedlist: %s -> %s", v47, v46);
    }
    self->_prefEnforceApprovedList = v45;
  }
  v48 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("extensionsEnabled"), &v89);
  v49 = v48 != 0;
  if (v89)
  {
    v50 = v48;
    v49 = GestaltGetDeviceClass(v48) - 1 < 3 || v50 != 0;
  }
  if (self->_prefExtensionsEnabled != v49)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v52 = "yes";
      if (v49)
        v53 = "no";
      else
        v53 = "yes";
      if (!v49)
        v52 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "ExtensionsEnabled: %s -> %s", v53, v52);
    }
    self->_prefExtensionsEnabled = v49;
  }
  v54 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("memoryPressureFlags"), 0);
  prefMemoryPressureFlags = self->_prefMemoryPressureFlags;
  if (v54 != prefMemoryPressureFlags)
  {
    if (dword_100977980 <= 30)
    {
      if (dword_100977980 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100977980, 30))
          goto LABEL_182;
        prefMemoryPressureFlags = self->_prefMemoryPressureFlags;
      }
      v56 = CUPrintFlags32(prefMemoryPressureFlags, &unk_1007378E2);
      v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      v58 = CUPrintFlags64(v54, &unk_1007378E2);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "MemoryPressureFlags: %@ -> %@", v57, v59);

    }
LABEL_182:
    self->_prefMemoryPressureFlags = v54;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100082974;
    block[3] = &unk_100917080;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
  v61 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("remoteClientEnabled"), &v89);
  v62 = v61 != 0;
  if (v89)
  {
    DeviceClass = GestaltGetDeviceClass(v61);
    v62 = DeviceClass == 4 || DeviceClass == 7;
  }
  if (self->_prefRemoteClientEnabled != v62)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v65 = "yes";
      if (v62)
        v66 = "no";
      else
        v66 = "yes";
      if (!v62)
        v65 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "RemoteClientEnabled: %s -> %s", v66, v65);
    }
    self->_prefRemoteClientEnabled = v62;
  }
  v67 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("remoteServerEnabled"), &v89);
  v68 = v67 != 0;
  if (v89)
  {
    v69 = GestaltGetDeviceClass(v67);
    v68 = v69 == 4 || v69 == 7;
  }
  if (self->_prefRemoteServerEnabled != v68)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v71 = "yes";
      if (v68)
        v72 = "no";
      else
        v72 = "yes";
      if (!v68)
        v71 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "RemoteServerEnabled: %s -> %s", v72, v71);
    }
    self->_prefRemoteServerEnabled = v68;
  }
  v73 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("systemReferenceTimeDisabled"), &v89);
  if (v89)
    v74 = 1;
  else
    v74 = v73 == 0;
  v75 = !v74;
  if (self->_prefSystemReferenceTimeDisabled != v75)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v76 = "yes";
      if (v75)
        v77 = "no";
      else
        v77 = "yes";
      if (!v75)
        v76 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "SystemReferenceTimeDisabled: %s -> %s", v77, v76);
    }
    self->_prefSystemReferenceTimeDisabled = v75;
  }
  v78 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("whbDiscoveryAlways"), &v89);
  if (v89)
    v79 = 1;
  else
    v79 = v78 == 0;
  v80 = !v79;
  if (self->_prefWHBDiscoveryAlways != v80)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v81 = "yes";
      if (v80)
        v82 = "no";
      else
        v82 = "yes";
      if (!v80)
        v81 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "WHBDiscoveryAlways: %s -> %s", v82, v81);
    }
    self->_prefWHBDiscoveryAlways = v80;
  }
  v83 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("wiproxAdvertising"), &v89);
  if (v89)
    v84 = 0;
  else
    v84 = v83 == 0;
  v85 = !v84;
  if (self->_prefWiProxAdvertising != v85)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v86 = "yes";
      if (v85)
        v87 = "no";
      else
        v87 = "yes";
      if (!v85)
        v86 = "no";
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _prefsChanged]", 30, "WiProxAdvertising: %s -> %s", v87, v86);
    }
    self->_prefWiProxAdvertising = v85;
  }
  -[CBAccessoryDaemon prefsChanged](self->_accessoryDaemon, "prefsChanged");
  -[CBExtensionsDaemon prefsChanged](self->_extensionsDaemon, "prefsChanged");
  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", 0);
}

- (void)_reportDeviceLost:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
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
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        v11 = objc_autoreleasePoolPush();
        objc_msgSend(v10, "reportDeviceLost:", v4, (_QWORD)v12);
        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "changedTypesRemoveAll");
}

- (void)_reportDevicesBuffered:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
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

  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedDiscovery"));
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "disabledActive") & 1) == 0)
          objc_msgSend(v10, "reportDevicesBuffered:", v4);

        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v18), "changedTypesRemoveAll", (_QWORD)v19);
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)scheduleAdvertiserUpdateImmediate:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *bleAdvertiserArray;

  v3 = a3;
  bleAdvertiserArray = self->_bleAdvertiserArray;
  self->_bleAdvertiserArray = 0;

  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", v3);
}

- (void)scheduleControlUpdateImmediate:(BOOL)a3
{
  self->_assertionFlagsValid = 0;
  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", a3);
}

- (void)scheduleSpatialUpdateImmediate:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *bleAdvertiserArray;

  v3 = a3;
  bleAdvertiserArray = self->_bleAdvertiserArray;
  self->_bleAdvertiserArray = 0;

  self->_bleAdvertiserSpatialValid = 0;
  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", v3);
}

- (void)setSystemFlags:(unsigned int)a3 mask:(unsigned int)a4
{
  unsigned int systemFlags;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  systemFlags = self->_systemFlags;
  v8 = systemFlags & ~a4 | a4 & a3;
  if ((_DWORD)v8 != systemFlags)
  {
    self->_systemFlags = v8;
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v9 = CUPrintFlags32(v8, &unk_1007378FC);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = CUPrintFlags32(v8 ^ systemFlags, &unk_1007378FC);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer setSystemFlags:mask:]", 30, "SystemFlags changed: %@ (^ %@)", v10, v12);

    }
    notify_set_state(self->_systemFlagsNotifyToken, v8);
    notify_post("com.apple.bluetooth.systemFlags");
  }
}

- (void)_tipiChanged:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CBDaemonServer *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100082E70;
  v7[3] = &unk_100917058;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_updateMemoryPressure
{
  OS_xpc_event_publisher *v2;
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int memoryPressureFlags;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  OS_xpc_event_publisher *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v2 = self->_xpcPublisherDiscovery;
  if (v2)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v3 = self->_xpcConnections;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v27;
      v24 = v2;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v9 = objc_autoreleasePoolPush();
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "xpcCnx"));

          if (!v10)
          {
            v11 = objc_msgSend(v8, "xpcToken");
            if (v11)
            {
              v12 = v11;
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activatedDiscovery"));
              v14 = v13;
              if (v13)
              {
                if (objc_msgSend(v13, "keepAlive"))
                {
                  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceMap"));
                  if (objc_msgSend(v15, "count"))
                  {
                    memoryPressureFlags = self->_memoryPressureFlags;
                    v17 = (memoryPressureFlags & ~objc_msgSend(v14, "memoryPressureFlags")) == 0;
                  }
                  else
                  {
                    v17 = 0;
                  }

                }
                else
                {
                  v17 = 0;
                }
                v18 = xpc_event_publisher_set_subscriber_keepalive(v2, v12, v17);
                if (dword_100977980 <= 30)
                {
                  v19 = v18;
                  if (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30))
                  {
                    if (v17)
                      v20 = "yes";
                    else
                      v20 = "no";
                    v21 = CUPrintErrorCode(v19);
                    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                    v23 = v20;
                    v2 = v24;
                    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateMemoryPressure]", 30, "XPC subscriber keepalive: token %llu, keepAlive %s, %@", v12, v23, v22);

                  }
                }
              }

            }
          }
          objc_autoreleasePoolPop(v9);
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v5);
    }

  }
}

- (void)_updateSelfAuthTag
{
  RPIdentity *v3;
  void *v4;
  void *v5;
  id v6;
  NSData *selfAuthTag;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSData *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSData *v20;
  void *v21;
  void *v22;
  id v23;
  NSData *selfAuthTagNonConnectable;
  NSData *v25;
  NSData *v26;
  NSData *v27;
  unsigned __int8 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSData *v36;
  id v37;
  id v38;

  v3 = self->_identitySelf;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackAddressMonitor connectableAddressData](self->_addressMonitor, "connectableAddressData"));
    if (!v4)
    {
      if (dword_100977980 <= 30
        && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
      {
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateSelfAuthTag]", 30, "SelfAuthTag: no address");
      }
      v15 = 0;
LABEL_33:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackAddressMonitor nonConnectableAddressData](self->_addressMonitor, "nonConnectableAddressData"));
      if (!v21)
      {
        if (dword_100977980 <= 30
          && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
        {
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateSelfAuthTag]", 30, "SelfAuthTagNC: no address");
        }
LABEL_60:
        if (!v15)
          goto LABEL_65;
        goto LABEL_64;
      }
      v37 = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity authTagForData:type:error:](v3, "authTagForData:type:error:", v21, 2, &v37));
      v23 = v37;
      if (v22)
      {
        selfAuthTagNonConnectable = self->_selfAuthTagNonConnectable;
        v25 = v22;
        v26 = selfAuthTagNonConnectable;
        if (v25 == v26)
        {

        }
        else
        {
          v27 = v26;
          if (!v26)
          {

            goto LABEL_51;
          }
          v28 = -[NSData isEqual:](v25, "isEqual:", v26);

          if ((v28 & 1) == 0)
          {
LABEL_51:
            if (dword_100977980 <= 30
              && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
            {
              v32 = CUPrintNSDataHex(self->_selfAuthTagNonConnectable, 100, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              v34 = CUPrintNSDataHex(v25, 100, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
              LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateSelfAuthTag]", 30, "SelfAuthTagNC: updated <%@> -> <%@>", v33, v35);

            }
            v36 = self->_selfAuthTagNonConnectable;
            self->_selfAuthTagNonConnectable = v25;

            -[CBDaemonServer _bleAdvertiserUpdateWithAuthTagNC](self, "_bleAdvertiserUpdateWithAuthTagNC");
LABEL_64:
            -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", 1);
LABEL_65:

            goto LABEL_66;
          }
        }
        if (dword_100977980 > 30
          || dword_100977980 == -1 && !_LogCategory_Initialize(&dword_100977980, 30))
        {
          goto LABEL_59;
        }
        v31 = CUPrintNSDataHex(v25, 100, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v31);
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateSelfAuthTag]", 30, "SelfAuthTagNC: unchanged: %@", v30);
      }
      else
      {
        if (dword_100977980 > 30
          || dword_100977980 == -1 && !_LogCategory_Initialize(&dword_100977980, 30))
        {
          goto LABEL_59;
        }
        v29 = CUPrintNSError(v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateSelfAuthTag]", 30, "SelfAuthTag: failed: %@", v30);
      }

LABEL_59:
      goto LABEL_60;
    }
    v38 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity authTagForData:type:error:](v3, "authTagForData:type:error:", v4, 2, &v38));
    v6 = v38;
    if (v5)
    {
      selfAuthTag = self->_selfAuthTag;
      v8 = v5;
      v9 = selfAuthTag;
      if (v8 == v9)
      {

      }
      else
      {
        v10 = v9;
        if (!v9)
        {

          goto LABEL_20;
        }
        v11 = -[NSData isEqual:](v8, "isEqual:", v9);

        if ((v11 & 1) == 0)
        {
LABEL_20:
          if (dword_100977980 <= 30
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
          {
            v16 = CUPrintNSDataHex(self->_selfAuthTag, 100, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            v18 = CUPrintNSDataHex(v8, 100, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateSelfAuthTag]", 30, "SelfAuthTag: updated <%@> -> <%@>", v17, v19);

          }
          v20 = v8;
          v13 = self->_selfAuthTag;
          self->_selfAuthTag = v20;
          v15 = 1;
          goto LABEL_31;
        }
      }
      if (dword_100977980 > 30
        || dword_100977980 == -1 && !_LogCategory_Initialize(&dword_100977980, 30))
      {
LABEL_28:
        v15 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v14 = CUPrintNSDataHex(v8, 100, 1);
      v13 = (NSData *)objc_claimAutoreleasedReturnValue(v14);
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateSelfAuthTag]", 30, "SelfAuthTag: unchanged: %@", v13);
    }
    else
    {
      if (dword_100977980 > 30
        || dword_100977980 == -1 && !_LogCategory_Initialize(&dword_100977980, 30))
      {
        goto LABEL_28;
      }
      v12 = CUPrintNSError(v6);
      v13 = (NSData *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateSelfAuthTag]", 30, "SelfAuthTag: failed: %@", v13);
    }
    v15 = 0;
LABEL_31:

    goto LABEL_32;
  }
  if (dword_100977980 <= 30 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _updateSelfAuthTag]", 30, "SelfAuthTag: no identity");
LABEL_66:

}

- (void)_updateUserControllerCloudDevices
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008384C;
  v2[3] = &unk_1009179A0;
  v2[4] = self;
  -[CBDaemonServer _performUserControllerActionWithCompletion:](self, "_performUserControllerActionWithCompletion:", v2);
}

- (OS_xpc_object)xpcListenerEndpoint
{
  CBDaemonServer *v2;
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

- (void)_bleAddressMonitorEnsureStopped
{
  CBStackAddressMonitor *addressMonitor;

  -[CBStackAddressMonitor invalidate](self->_addressMonitor, "invalidate");
  addressMonitor = self->_addressMonitor;
  self->_addressMonitor = 0;

}

- (void)_bleAdvertiserEnsureStopped
{
  NSMutableArray *bleAdvertiserArray;
  CBAdvertiserDaemon *bleAdvertiser;
  OS_dispatch_source *bleAdvertiserSpatialLingerTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *bleAdvertiserSpatialRestartTimer;
  OS_dispatch_source *v9;
  NSObject *v10;

  if (self->_bleAdvertiser)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserEnsureStopped]", 30, "BLE advertiser stop");
    }
    bleAdvertiserArray = self->_bleAdvertiserArray;
    self->_bleAdvertiserArray = 0;

    -[CBAdvertiserDaemon invalidate](self->_bleAdvertiser, "invalidate");
    bleAdvertiser = self->_bleAdvertiser;
    self->_bleAdvertiser = 0;

    self->_bleAdvertiserSpatialValid = 0;
    bleAdvertiserSpatialLingerTimer = self->_bleAdvertiserSpatialLingerTimer;
    if (bleAdvertiserSpatialLingerTimer)
    {
      v6 = bleAdvertiserSpatialLingerTimer;
      dispatch_source_cancel(v6);
      v7 = self->_bleAdvertiserSpatialLingerTimer;
      self->_bleAdvertiserSpatialLingerTimer = 0;

    }
    bleAdvertiserSpatialRestartTimer = self->_bleAdvertiserSpatialRestartTimer;
    if (bleAdvertiserSpatialRestartTimer)
    {
      v10 = bleAdvertiserSpatialRestartTimer;
      dispatch_source_cancel(v10);
      v9 = self->_bleAdvertiserSpatialRestartTimer;
      self->_bleAdvertiserSpatialRestartTimer = 0;

    }
  }
}

- (void)_bleAdvertiserAddressChanged:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void (**v13)(_QWORD);
  void *v14;
  void (**v15)(_QWORD);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (!a3)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      v4 = CUDescriptionWithLevel(self->_addressMonitor, 134217778);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _bleAdvertiserAddressChanged:]", 30, "BLE advertiser address changed: %@", v5);

    }
    self->_bleAdvertiserSpatialValid = 0;
    -[CBAdvertiserDaemon advertisingAddressChanged](self->_bleAdvertiser, "advertisingAddressChanged");
    -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", 0);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_xpcConnections;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activatedSpatialInteractionSession"));
        v13 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "advertisingAddressChangedHandler"));

        if (v13)
          v13[2](v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activatedAdvertiser"));
        v15 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "advertisingAddressChangedHandler"));

        if (v15)
          v15[2](v15);

      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)clearDuplicateFilterCache:(id)a3
{
  CBStackBLEScanner *stackBLEScanner;

  stackBLEScanner = self->_stackBLEScanner;
  if (stackBLEScanner)
    -[CBStackBLEScanner clearDuplicateFilterCache:](stackBLEScanner, "clearDuplicateFilterCache:", a3);
}

- (id)getAudioAccessoryDeviceArray
{
  CBDaemonServer *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackAccessoryMonitor getAudioAccessoryDeviceArray](v2->_stackAccessoryMonitor, "getAudioAccessoryDeviceArray"));
  objc_sync_exit(v2);

  return v3;
}

- (void)_stackAccessoryMonitorEnsureStopped
{
  CBStackAccessoryMonitor *stackAccessoryMonitor;

  if (self->_stackAccessoryMonitor)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackAccessoryMonitorEnsureStopped]", 30, "Stack accessory monitor stop");
    }
    -[CBStackAccessoryMonitor invalidate](self->_stackAccessoryMonitor, "invalidate");
    stackAccessoryMonitor = self->_stackAccessoryMonitor;
    self->_stackAccessoryMonitor = 0;

  }
}

- (void)_reportDeviceLostIfNeeded:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  CBStackController *stackController;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceMap, "allValues"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        stackController = self->_stackController;
        v15 = 0;
        v12 = -[CBStackController isDeviceConnected:error:](stackController, "isDeviceConnected:error:", v10, &v15);
        v13 = v15;
        if ((v12 & 1) == 0 && (unint64_t)objc_msgSend(v10, "lastSeenTicks") < a3)
        {
          if (dword_100977980 <= 20
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
          {
            v14 = UpTicksToSeconds(a3 - (_QWORD)objc_msgSend(v10, "lastSeenTicks"));
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _reportDeviceLostIfNeeded:]", 20, "Device :%@ is lost. It was discovered :%llu seconds before scan stopped", v10, v14);
          }
          -[CBDaemonServer _stackBLEScannerDeviceLost:](self, "_stackBLEScannerDeviceLost:", v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)_stackBLEScannerEnsureStopped
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  NSMutableArray *bleDiscoveryArray;
  CBStackBLEScanner *stackBLEScanner;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  dispatch_time_t v20;
  NSObject *dispatchQueue;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  if (self->_stackBLEScanner)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackBLEScannerEnsureStopped]", 30, "Stack BLE scanner stop");
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v3 = self->_xpcConnections;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v6)
            objc_enumerationMutation(v3);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "activatedDiscovery"));
          v9 = v8;
          if (v8)
          {
            objc_msgSend(v8, "setDisabledActive:", 0);
            objc_msgSend(v9, "setDisabledPending:", 0);
          }

        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v5);
    }

    bleDiscoveryArray = self->_bleDiscoveryArray;
    self->_bleDiscoveryArray = 0;

    -[CBStackBLEScanner invalidate](self->_stackBLEScanner, "invalidate");
    stackBLEScanner = self->_stackBLEScanner;
    self->_stackBLEScanner = 0;

    if ((self->_assertionFlags & 1) != 0)
    {
      v19 = mach_absolute_time();
      if (dword_100977980 <= 20
        && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
      {
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackBLEScannerEnsureStopped]", 20, "Scan stopped due to suppression. Delayed lost notification");
      }
      v20 = dispatch_time(0, 10000000000);
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000849AC;
      block[3] = &unk_100917130;
      block[4] = self;
      block[5] = v19;
      dispatch_after(v20, dispatchQueue, block);
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceMap, "allValues", 0));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
            v18 = objc_autoreleasePoolPush();
            -[CBDaemonServer _stackBLEScannerDeviceLost:](self, "_stackBLEScannerDeviceLost:", v17);
            objc_autoreleasePoolPop(v18);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        }
        while (v14);
      }

    }
  }
}

- (void)_stackBLEScannerDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identifyDevices, "setObject:forKeyedSubscript:", 0, v7);
      if ((objc_msgSend(v5, "removeInternalFlags:", 2) & 0x8000000) != 0)
      {
        if (IsAppleInternalBuild(-[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v7)))
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spatialInteractionDeviceTimestampArrayDictionary"));

          if (v6)
            -[CBDaemonServer addLostDeviceToLostCBSpatialDevicesIfNeeded:](self, "addLostDeviceToLostCBSpatialDevicesIfNeeded:", v5);
        }
        -[CBDaemonServer _reportDeviceLost:](self, "_reportDeviceLost:", v5);
      }
      else
      {
        -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v5);
      }
    }

    v4 = v7;
  }

}

- (void)_stackBLEScannerDevicesBuffered:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  CBStackBLEScanner *v14;
  CBStackBLEScanner *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  id v25;
  void *v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a3;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v25)
  {
    v26 = 0;
    v24 = *(_QWORD *)v29;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v4);
        v6 = objc_autoreleasePoolPush();
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        if (!v7)
        {
          objc_autoreleasePoolPop(v6);
          goto LABEL_33;
        }
        v8 = (void *)v7;
        v9 = objc_alloc_init((Class)CBDevice);
        objc_msgSend(v9, "setIdentifier:", v8);
        objc_msgSend(v9, "setInternalFlags:", 2048);
        v10 = self->_deviceMap;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v8));
        if (v11)
          objc_msgSend(v9, "updateWithCBDevice:", v11);

        v12 = (unint64_t)objc_msgSend(v9, "updateWithCBDevice:", v5);
        objc_msgSend(v9, "setChangeFlags:", (unint64_t)objc_msgSend(v9, "changeFlags") | v12);
        objc_msgSend(v9, "setLastSeenTicks:", mach_absolute_time());
        v13 = (unint64_t)objc_msgSend(v9, "discoveryFlags");
        v14 = self->_stackBLEScanner;
        v15 = v14;
        if (v14)
        {
          v16 = (unint64_t)-[CBStackBLEScanner aggregateDiscoveryFlags](v14, "aggregateDiscoveryFlags");
          v27 = 0;
          LODWORD(v14) = -[CBStackBLEScanner aggregateDiscoveryTypes](v15, "aggregateDiscoveryTypes");
        }
        else
        {
          v16 = 0;
        }
        v27 = (int)v14;
        if ((v16 & (v13 | v12)) != 0
          || (objc_msgSend(v9, "discoveryTypesContainTypes:", &v27) & 1) != 0
          || (objc_msgSend(v9, "changedTypesContainTypes:", &v27) & 1) != 0)
        {
          if (objc_msgSend(v9, "changedTypesNeedsIdentify") && self->_stackBLENeedsIdentify)
            -[CBDaemonServer _identitiesResolveNearbyDevice:](self, "_identitiesResolveNearbyDevice:", v9);
          v17 = v26;
          if (!v26)
            v17 = objc_alloc_init((Class)NSMutableArray);
          v26 = v17;
          objc_msgSend(v17, "addObject:", v9);
        }
        else if (dword_100977980 <= 30
               && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
        {
          v18 = CUPrintFlags64(v16, "");
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v20 = CBDiscoveryTypesToString(&v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackBLEScannerDevicesBuffered:]", 30, "Device buffered mismatch: %@, DsFl %@, DsTy %@", v9, v19, v21);

        }
        objc_autoreleasePoolPop(v6);
        v4 = (char *)v4 + 1;
      }
      while (v25 != v4);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v25 = v22;
    }
    while (v22);

    if (!v26)
      goto LABEL_35;
    -[CBDaemonServer _reportDevicesBuffered:](self, "_reportDevicesBuffered:");
  }
  else
  {
    v26 = 0;
LABEL_33:

  }
LABEL_35:

}

- (void)_stackClassicScannerEnsureStarted
{
  CBStackBLEScanner *v3;
  id v4;
  id v5;
  void **v6;
  uint64_t v7;
  _QWORD *(*v8)(uint64_t, uint64_t);
  void *v9;
  CBStackBLEScanner *v10;
  CBDaemonServer *v11;
  _QWORD v12[4];
  id v13;
  CBDaemonServer *v14;

  v3 = self->_stackClassicScanner;
  if (!v3)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackClassicScannerEnsureStarted]", 30, "Stack classic scanner start");
    }
    v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor classicScannerClass](self->_stackAdaptor, "classicScannerClass")));
    objc_storeStrong((id *)&self->_stackClassicScanner, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100084F24;
    v12[3] = &unk_1009171C0;
    v5 = v4;
    v13 = v5;
    v14 = self;
    objc_msgSend(v5, "setDeviceFoundHandler:", v12);
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_100084F40;
    v9 = &unk_1009171C0;
    v3 = (CBStackBLEScanner *)v5;
    v10 = v3;
    v11 = self;
    -[CBStackBLEScanner setDeviceLostHandler:](v3, "setDeviceLostHandler:", &v6);

    -[CBStackBLEScanner activate](v3, "activate", v6, v7, v8, v9);
  }

}

- (void)_stackClassicScannerDeviceFound:(id)a3
{
  void *v4;
  id v5;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));
    if (!v5)
    {
      v5 = objc_alloc_init((Class)CBDevice);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v8 = self->_deviceMap;
        self->_deviceMap = v7;

        deviceMap = self->_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v5, v4);
    }
    objc_msgSend(v5, "setInternalFlags:", objc_msgSend(v5, "internalFlags") | 0x80);
    objc_msgSend(v5, "updateWithCBDevice:", v9);
    -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v5);

  }
}

- (void)_stackClassicScannerDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "removeInternalFlags:", 128) & 0x8000000) != 0)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v7);
        -[CBDaemonServer _reportDeviceLost:](self, "_reportDeviceLost:", v6);
      }
      else
      {
        -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v6);
      }
    }

    v4 = v7;
  }

}

- (void)_stackControllerEnsureStarted
{
  CBStackController **p_stackController;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, uint64_t, void *);
  void *v13;
  id v14;
  CBDaemonServer *v15;
  _QWORD v16[4];
  id v17;
  CBDaemonServer *v18;
  _QWORD v19[4];
  id v20;
  CBDaemonServer *v21;
  _QWORD v22[4];
  id v23;
  CBDaemonServer *v24;
  _QWORD v25[4];
  id v26;
  CBDaemonServer *v27;

  if (!self->_stackController)
  {
    p_stackController = &self->_stackController;
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackControllerEnsureStarted]", 30, "Stack controller start");
    }
    v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor controllerClass](self->_stackAdaptor, "controllerClass")));
    objc_storeStrong((id *)p_stackController, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000852A8;
    v25[3] = &unk_100917058;
    v5 = v4;
    v26 = v5;
    v27 = self;
    objc_msgSend(v5, "setControllerDataChangedHandler:", v25);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000852C0;
    v22[3] = &unk_100917058;
    v6 = v5;
    v23 = v6;
    v24 = self;
    objc_msgSend(v6, "setDiscoverableStateChangedHandler:", v22);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000853FC;
    v19[3] = &unk_100917058;
    v7 = v6;
    v20 = v7;
    v21 = self;
    objc_msgSend(v7, "setInquiryStateChangedHandler:", v19);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100085538;
    v16[3] = &unk_100917058;
    v8 = v7;
    v17 = v8;
    v18 = self;
    objc_msgSend(v8, "setPowerChangedHandler:", v16);
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1000856E8;
    v13 = &unk_100917A90;
    v14 = v8;
    v15 = self;
    v9 = v8;
    objc_msgSend(v9, "setRelayMessageHandler:", &v10);
    objc_msgSend(v9, "activate", v10, v11, v12, v13);

  }
}

- (void)_stackControllerEnsureStopped
{
  CBStackController *stackController;

  if (self->_stackController)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackControllerEnsureStopped]", 30, "Stack controller stop");
    }
    -[CBStackController invalidate](self->_stackController, "invalidate");
    stackController = self->_stackController;
    self->_stackController = 0;

  }
}

- (void)_stackDeviceMonitorEnsureStopped
{
  CBStackDeviceMonitor *stackDeviceMonitor;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_stackDeviceMonitor)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _stackDeviceMonitorEnsureStopped]", 30, "Stack device monitor stop");
    }
    self->_deviceMonitorFlagsValid = 0;
    -[CBStackDeviceMonitor invalidate](self->_stackDeviceMonitor, "invalidate");
    stackDeviceMonitor = self->_stackDeviceMonitor;
    self->_stackDeviceMonitor = 0;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceMap, "allValues", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          v10 = objc_autoreleasePoolPush();
          -[CBDaemonServer _stackDeviceMonitorDeviceLost:](self, "_stackDeviceMonitorDeviceLost:", v9);
          objc_autoreleasePoolPop(v10);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)_stackDeviceMonitorDeviceFound:(id)a3
{
  void *v4;
  id v5;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));
    if (!v5)
    {
      v5 = objc_alloc_init((Class)CBDevice);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v8 = self->_deviceMap;
        self->_deviceMap = v7;

        deviceMap = self->_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v5, v4);
    }
    objc_msgSend(v5, "setInternalFlags:", objc_msgSend(v5, "internalFlags") | 4);
    objc_msgSend(v5, "updateWithCBDevice:", v9);
    -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v5);

  }
}

- (void)_stackDeviceMonitorDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "removeInternalFlags:", 4) & 0x8000000) != 0)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v7);
        -[CBDaemonServer _reportDeviceLost:](self, "_reportDeviceLost:", v6);
      }
      else
      {
        -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v6);
      }
    }

    v4 = v7;
  }

}

- (void)_accessoryDaemonEnsureStopped
{
  CBAccessoryDaemon *accessoryDaemon;

  if (self->_accessoryDaemon)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _accessoryDaemonEnsureStopped]", 30, "AccessoryDaemon stop");
    }
    -[CBAccessoryDaemon invalidate](self->_accessoryDaemon, "invalidate");
    accessoryDaemon = self->_accessoryDaemon;
    self->_accessoryDaemon = 0;

  }
}

- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6
{
  id v10;
  NSObject *dispatchQueue;
  id v12;
  _QWORD block[5];
  id v14;
  unsigned int v15;
  BOOL v16;
  BOOL v17;

  v10 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085D48;
  block[3] = &unk_100917AE0;
  block[4] = self;
  v14 = v10;
  v16 = a4;
  v17 = a5;
  v15 = a6;
  v12 = v10;
  dispatch_async(dispatchQueue, block);

}

- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[5];
  unsigned int v6;
  BOOL v7;

  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015598;
  v5[3] = &unk_100917B30;
  v5[4] = self;
  v7 = a3;
  v6 = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)_extensionsEnsureStopped
{
  CBExtensionsDaemon *extensionsDaemon;

  if (self->_extensionsDaemon)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _extensionsEnsureStopped]", 30, "Extensions stop");
    }
    -[CBExtensionsDaemon invalidate](self->_extensionsDaemon, "invalidate");
    extensionsDaemon = self->_extensionsDaemon;
    self->_extensionsDaemon = 0;

  }
}

- (void)_identitiesEnsureStopped
{
  int identitiesNotifyToken;
  NSArray *identityArray;
  NSMutableDictionary *identifyDevices;

  identitiesNotifyToken = self->_identitiesNotifyToken;
  if (identitiesNotifyToken != -1)
  {
    if (dword_100977980 > 30)
      goto LABEL_7;
    if (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30))
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesEnsureStopped]", 30, "Identities stop");
    identitiesNotifyToken = self->_identitiesNotifyToken;
    if (identitiesNotifyToken != -1)
    {
LABEL_7:
      notify_cancel(identitiesNotifyToken);
      self->_identitiesNotifyToken = -1;
    }
  }
  identityArray = self->_identityArray;
  self->_identityArray = 0;

  identifyDevices = self->_identifyDevices;
  self->_identifyDevices = 0;

}

- (void)_identitiesGet
{
  id v3;
  _QWORD v4[6];

  if (objc_opt_class(RPClient))
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesGet]", 30, "Identities get start");
    }
    v3 = objc_alloc_init((Class)RPClient);
    objc_msgSend(v3, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v3, "setTargetUserSession:", 1);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000861E0;
    v4[3] = &unk_100917B58;
    v4[4] = v3;
    v4[5] = self;
    objc_msgSend(v3, "getIdentitiesWithFlags:completion:", 19883, v4);

  }
  else if (dword_100977980 <= 90
         && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 90)))
  {
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesGet]", 90, "### Identities not supported");
  }
}

- (void)_identitiesReevaluateDevices
{
  NSMutableDictionary *deviceMap;
  _QWORD v4[5];

  if (dword_100977980 <= 30 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _identitiesReevaluateDevices]", 30, "Identities re-evaluate: Identities SA %d / Other %d / Devices %d", -[NSMutableDictionary count](self->_identityMapSameAccount, "count"), -[NSArray count](self->_identityArray, "count"), -[NSMutableDictionary count](self->_deviceMap, "count"));
  -[NSMutableDictionary removeAllObjects](self->_identifyDevices, "removeAllObjects");
  deviceMap = self->_deviceMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000867CC;
  v4[3] = &unk_100917BA8;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", 0);
}

- (void)updateIdentities:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *identityMapSameAccount;
  CBDaemonServer *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v16 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));

        if (v14)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v14);
        }
        else if (dword_100977980 <= 30
               && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
        {
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer updateIdentities:]", 30, "UpdateIdentities: ignoring identity without BTID: %@", v11);
        }

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (dword_100977980 <= 30 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer updateIdentities:]", 30, "UpdateIdentities: %d mapped, %d total", -[NSMutableDictionary count](v5, "count"), objc_msgSend(v6, "count"));
  identityMapSameAccount = v16->_identityMapSameAccount;
  v16->_identityMapSameAccount = v5;

  -[CBDaemonServer _identitiesReevaluateDevices](v16, "_identitiesReevaluateDevices");
}

- (BOOL)_verifyNearbyInfoV2IntegrityTag:(id)a3 rapportIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  double Current;
  const char *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  unsigned int v27;
  int v28;
  BOOL v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  char v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  BOOL v37;
  int v38;
  _QWORD *v40;
  double v41;
  unsigned int v42;
  unint64_t v43;
  unint64_t v44;
  unsigned __int8 v45;
  id obj;
  _QWORD v47[8];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;

  v6 = a3;
  v7 = a4;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = sub_10006248C;
  v62 = sub_100062300;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = sub_10006248C;
  v56 = sub_100062300;
  v57 = 0;
  v57 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nearbyInfoV2AuthIntegrityTagData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nearbyInfoV2AuthTagData"));
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000871DC;
  v47[3] = &unk_100917BD0;
  v47[4] = &v58;
  v47[5] = &v64;
  v47[6] = &v52;
  v47[7] = &v48;
  v40 = objc_retainBlock(v47);
  v9 = v59;
  obj = v59[5];
  objc_msgSend(v6, "decryptApplePayloadWithIdentity:forType:error:", v7, 22, &obj);
  objc_storeStrong(v9 + 5, obj);
  if (v59[5])
  {
    if (self->_prefAuthTagIntegrityCheckEnabled)
      goto LABEL_54;
    goto LABEL_58;
  }
  v45 = objc_msgSend(v6, "nearbyInfoV2DecryptedFlags");
  Current = CFAbsoluteTimeGetCurrent();
  v43 = 0xBFF0000000000000;
  v44 = 0xBFF0000000000000;
  v42 = -1;
  if (!self->_prefSystemReferenceTimeDisabled && TMGetReferenceTime(&v44, &v43, &v42) && v42)
  {
    v13 = *(double *)&v44;
    if (dword_100977980 > 20)
    {
      v12 = *(double *)&v44;
    }
    else
    {
      v12 = *(double *)&v44;
      if (dword_100977980 != -1 || (v38 = _LogCategory_Initialize(&dword_100977980, 20), v12 = *(double *)&v44, v38))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v12));
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description")));
        v16 = objc_msgSend(v15, "UTF8String");
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]", 20, "IntegrityTag System reference time %f, (%s). delta: %f ±%f reliability %d for auth tag: %@", *(_QWORD *)&v12, v16, v13 - Current, v43, v42, v8);

        v12 = *(double *)&v44;
      }
    }
  }
  else if (dword_100977980 <= 20
         && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
  {
    if (self->_prefSystemReferenceTimeDisabled)
      v11 = "disabled";
    else
      v11 = "not available";
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]", 20, "IntegrityTag System reference time '%s' using current absolute time %f for auth tag: %@", v11, *(_QWORD *)&Current, v8);
    v12 = Current;
  }
  else
  {
    v12 = Current;
  }
  v17 = 0;
  do
  {
    v18 = objc_autoreleasePoolPush();
    v19 = byte_100737DA6[v17];
    v20 = ((kCFAbsoluteTimeIntervalSince1970 + v12 + (double)(7200 * v19)) / 7200.0);
    *((_BYTE *)v49 + 24) = v19;
    v41 = (double)v20 * 7200.0 - kCFAbsoluteTimeIntervalSince1970;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "bleAdv22IauthTag", 16));
    objc_msgSend(v21, "appendData:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v41, 8));
    objc_msgSend(v21, "appendData:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v45, 1));
    objc_msgSend(v21, "appendData:", v24);

    objc_msgSend(v21, "appendData:", v8);
    if (dword_100977980 <= 20
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
    {
      v25 = *((char *)v49 + 24) + 1;
      v26 = "?";
      if (v25 <= 2)
        v26 = off_100917E30[v25];
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]", 20, "IntegrityTag parameters: AT %@, IT %@, %s, CBIN %u, RefT: %f, F2: %u, %@, %@", v8, v53[5], v26, v20, *(_QWORD *)&v41, v45, v6, v7);
    }
    v27 = objc_msgSend(v7, "verifyAuthTag:data:type:error:", v53[5], v21, 2, 0);
    *((_BYTE *)v65 + 24) = v27;
    if (v27 && dword_100977980 <= 30)
    {
      if (dword_100977980 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100977980, 30))
          goto LABEL_33;
        v28 = *((unsigned __int8 *)v65 + 24);
      }
      else
      {
        v28 = 1;
      }
      v29 = v28 == 0;
      v30 = "yes";
      if (v29)
        v30 = "no";
      v31 = *((char *)v49 + 24) + 1;
      v32 = "?";
      if (v31 <= 2)
        v32 = off_100917E30[v31];
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]", 30, "IntegrityTag resolved: AT %@, IT valid %s, %s, CBIN %u, %@, %@", v8, v30, v32, v20, v6, v7);
    }
LABEL_33:

    objc_autoreleasePoolPop(v18);
    v29 = v17++ == 2;
    if (v29)
      v33 = 1;
    else
      v33 = v27;
  }
  while ((v33 & 1) == 0);
  if (!*((_BYTE *)v65 + 24))
  {
    if (self->_prefAuthTagIntegrityCheckEnabled)
      objc_msgSend(v6, "resetNearbyInfoV2SensitiveProperties");
    if (dword_100977980 <= 90
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 90)))
    {
      v34 = "yes";
      if (!*((_BYTE *)v65 + 24))
        v34 = "no";
      v35 = *((char *)v49 + 24) + 1;
      if (v35 > 2)
        v36 = "?";
      else
        v36 = off_100917E30[v35];
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]", 90, "IntegrityTag resolve mismatch: AT %@, IT valid %s, %s, CBIN %u, %@, %@", v8, v34, v36, v20, v6, v7);
    }
  }
  if (!self->_prefAuthTagIntegrityCheckEnabled)
  {
LABEL_58:
    v37 = 1;
    goto LABEL_59;
  }
LABEL_54:
  v37 = *((_BYTE *)v65 + 24) != 0;
LABEL_59:
  ((void (*)(_QWORD *))v40[2])(v40);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  return v37;
}

- (void)_remoteEnsureStarted
{
  RPCompanionLinkClient **p_remoteClient;
  RPCompanionLinkClient *v4;
  RPCompanionLinkClient *v5;
  RPServer *remoteServer;
  RPServer **p_remoteServer;
  RPServer *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  RPServer *v12;
  CBDaemonServer *v13;
  _QWORD v14[4];
  RPCompanionLinkClient *v15;
  CBDaemonServer *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  p_remoteClient = &self->_remoteClient;
  v4 = self->_remoteClient;
  v5 = v4;
  if (!v4)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteEnsureStarted]", 30, "Remote client start");
    }
    v5 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    objc_storeStrong((id *)p_remoteClient, v5);
    -[RPCompanionLinkClient setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100087800;
    v21[3] = &unk_100917BF8;
    v21[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v21);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100087894;
    v20[3] = &unk_100917BF8;
    v20[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](v5, "setDeviceLostHandler:", v20);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100087930;
    v19[3] = &unk_100917C20;
    v19[4] = self;
    -[RPCompanionLinkClient setDeviceChangedHandler:](v5, "setDeviceChangedHandler:", v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000879C4;
    v18[3] = &unk_100917C48;
    v18[4] = self;
    -[RPCompanionLinkClient registerEventID:options:handler:](v5, "registerEventID:options:handler:", CFSTR("com.apple.bluetooth.event"), 0, v18);
  }
  if (!self->_prefRemoteServerEnabled)
  {
    if (self->_remoteRequestRegistered)
    {
      if (dword_100977980 <= 30
        && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
      {
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteEnsureStarted]", 30, "Remote server deregister request");
      }
      -[RPCompanionLinkClient deregisterRequestID:](v5, "deregisterRequestID:", CFSTR("com.apple.bluetooth.request"));
      self->_remoteRequestRegistered = 0;
    }
LABEL_18:
    if (v4)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (self->_remoteRequestRegistered)
    goto LABEL_18;
  if (dword_100977980 <= 30 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteEnsureStarted]", 30, "Remote server register request");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000879D4;
  v17[3] = &unk_100917C70;
  v17[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:](v5, "registerRequestID:options:handler:", CFSTR("com.apple.bluetooth.request"), 0, v17);
  self->_remoteRequestRegistered = 1;
  if (!v4)
  {
LABEL_19:
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000879E8;
    v14[3] = &unk_1009171E8;
    v15 = v5;
    v16 = self;
    -[RPCompanionLinkClient activateWithCompletion:](v15, "activateWithCompletion:", v14);

  }
LABEL_20:
  p_remoteServer = &self->_remoteServer;
  remoteServer = self->_remoteServer;
  if (self->_prefRemoteServerEnabled)
  {
    v8 = remoteServer;
    if (!v8)
    {
      if (dword_100977980 <= 30
        && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
      {
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteEnsureStarted]", 30, "Remote server start");
      }
      v9 = objc_alloc_init((Class)RPServer);
      objc_storeStrong((id *)&self->_remoteServer, v9);
      objc_msgSend(v9, "setDispatchQueue:", self->_dispatchQueue);
      objc_msgSend(v9, "setServiceType:", CFSTR("com.apple.bluetooth.remote"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100087B10;
      v11[3] = &unk_1009171E8;
      v8 = (RPServer *)v9;
      v12 = v8;
      v13 = self;
      -[RPServer setErrorHandler:](v8, "setErrorHandler:", v11);
      -[RPServer activate](v8, "activate");

    }
  }
  else
  {
    if (!remoteServer)
      goto LABEL_37;
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteEnsureStarted]", 30, "Remote server stop");
    }
    -[RPServer invalidate](*p_remoteServer, "invalidate");
    v8 = *p_remoteServer;
    *p_remoteServer = 0;
  }

LABEL_37:
  if (!self->_coexNotificationSetup)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "coexChangeNotification:", CFSTR("com.apple.bluetooth.leconnection"), 0);

    self->_coexNotificationSetup = 1;
  }

}

- (void)coexChangeNotification:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CBDaemonServer *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100087C3C;
  v7[3] = &unk_100917058;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)sendCoexUpdate:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _BYTE v27[128];

  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteDevice"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedDiscovery"));

          if (v13)
          {
            if (dword_100977980 <= 30
              && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
            {
              v14 = CUPrintNSObjectOneLine(v4);
              v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
              LogPrintF_safe(&dword_100977980, "-[CBDaemonServer sendCoexUpdate:]", 30, "WHB update send coexUpdate: %@ to remoteDevice: %@", v15, v12, (_QWORD)v21);

            }
            -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](self->_remoteClient, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.bluetooth.whbU"), v4, v12, 0, 0);
          }
        }

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NUMBER_OF_LE_CONNECTIONS")));
  v17 = objc_msgSend(v16, "unsignedLongValue");
  v25[0] = CFSTR("CBWHBMetricsKeyEventType");
  v25[1] = CFSTR("CBWHBMetricsKeySubEventType");
  v26[0] = CFSTR("CoexUpdateEvent");
  v26[1] = CFSTR("SentCoexUpdate");
  v25[2] = CFSTR("CBWHBMetricsKeyNumLEConnections");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v17));
  v26[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
  objc_msgSend(v20, "reportWhbMetric:", v19);

}

- (void)_remoteReceivedEvent:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  uint64_t NSNumber;
  void *v9;
  uint64_t v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = a4;
  NSNumber = NSDictionaryGetNSNumber(v6, CFSTR("cid"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  v10 = RPOptionSenderIDSDeviceID;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, v10, TypeID, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10006248C;
  v33 = sub_100062300;
  v34 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10008832C;
  v28[3] = &unk_100917C98;
  v28[5] = v9;
  v28[6] = &v29;
  v28[4] = v13;
  v14 = objc_retainBlock(v28);
  if (!v9)
  {
    v20 = CBErrorF(4294960591, "No client ID");
    v21 = objc_claimAutoreleasedReturnValue(v20);
LABEL_14:
    v18 = (void *)v30[5];
    v30[5] = v21;
    goto LABEL_11;
  }
  if (!v13)
  {
    v22 = CBErrorF(4294960591, "No sender ID");
    v21 = objc_claimAutoreleasedReturnValue(v22);
    goto LABEL_14;
  }
  if (dword_100977980 <= 20 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
  {
    v15 = objc_msgSend(v9, "unsignedIntValue");
    v16 = CUPrintNSObjectOneLine(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteReceivedEvent:options:]", 20, "Remote event received: Sender %@, CID 0x%X, %@", v13, v15, v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteConnectionMap, "objectForKeyedSubscript:", v9));
  if (v18)
  {
    v19 = (void *)_CFXPCCreateXPCObjectFromCFObject(v6);
    if (v19)
    {
      objc_msgSend(v18, "xpcReceivedEvent:", v19);
    }
    else
    {
      v25 = CBErrorF(4294960579, "Convert CF to XPC failed");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)v30[5];
      v30[5] = v26;

    }
  }
  else
  {
    v23 = CBErrorF(4294960591, "Connection not found");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v19 = (void *)v30[5];
    v30[5] = v24;
  }

LABEL_11:
  ((void (*)(_QWORD *))v14[2])(v14);

  _Block_object_dispose(&v29, 8);
}

- (void)_remoteReceivedRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t NSNumber;
  void *v12;
  uint64_t v13;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v16;
  id v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  void *v21;
  CBDaemonXPCConnection *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSMutableSet *xpcConnections;
  NSMutableSet *v27;
  NSMutableSet *v28;
  NSMutableDictionary *remoteConnectionMap;
  NSMutableDictionary *v30;
  NSMutableDictionary *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[6];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  NSNumber = NSDictionaryGetNSNumber(v8, CFSTR("cid"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  v13 = RPOptionSenderIDSDeviceID;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v9, v13, TypeID, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_10006248C;
  v47 = sub_100062300;
  v48 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000887E4;
  v40[3] = &unk_100917CC0;
  v42 = &v43;
  v40[4] = v16;
  v40[5] = v12;
  v17 = v10;
  v41 = v17;
  v18 = objc_retainBlock(v40);
  if (!v12)
  {
    v34 = CBErrorF(4294960591, "No client ID");
    v35 = objc_claimAutoreleasedReturnValue(v34);
LABEL_19:
    v22 = (CBDaemonXPCConnection *)v44[5];
    v44[5] = v35;
    goto LABEL_16;
  }
  if (!v16)
  {
    v36 = CBErrorF(4294960591, "No sender ID");
    v35 = objc_claimAutoreleasedReturnValue(v36);
    goto LABEL_19;
  }
  if (dword_100977980 <= 20 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
  {
    v19 = objc_msgSend(v12, "unsignedIntValue");
    v20 = CUPrintNSObjectOneLine(v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteReceivedRequest:options:responseHandler:]", 20, "Remote request received: Sender %@, CID 0x%X, Request %@", v16, v19, v21);

  }
  v22 = (CBDaemonXPCConnection *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteConnectionMap, "objectForKeyedSubscript:", v12));
  if (!v22)
  {
    v22 = objc_alloc_init(CBDaemonXPCConnection);
    v23 = NSPrintF_safe("Remote-%@-0x%X", v16, objc_msgSend(v12, "unsignedIntValue"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[CBDaemonXPCConnection setAppID:](v22, "setAppID:", v24);

    -[CBDaemonXPCConnection setDaemon:](v22, "setDaemon:", self);
    -[CBDaemonXPCConnection setDispatchQueue:](v22, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDaemonXPCConnection setEntitled:](v22, "setEntitled:", 1);
    -[CBDaemonXPCConnection setRemoteAccepted:](v22, "setRemoteAccepted:", 1);
    -[CBDaemonXPCConnection setRemoteClient:](v22, "setRemoteClient:", self->_remoteClient);
    -[CBDaemonXPCConnection setRemoteClientID:](v22, "setRemoteClientID:", v12);
    v25 = objc_alloc_init((Class)CBDevice);
    objc_msgSend(v25, "setIdentifier:", v16);
    -[CBDaemonXPCConnection setRemoteDevice:](v22, "setRemoteDevice:", v25);
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      v27 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v28 = self->_xpcConnections;
      self->_xpcConnections = v27;

      xpcConnections = self->_xpcConnections;
    }
    -[NSMutableSet addObject:](xpcConnections, "addObject:", v22);
    remoteConnectionMap = self->_remoteConnectionMap;
    if (!remoteConnectionMap)
    {
      v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v31 = self->_remoteConnectionMap;
      self->_remoteConnectionMap = v30;

      remoteConnectionMap = self->_remoteConnectionMap;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](remoteConnectionMap, "setObject:forKeyedSubscript:", v22, v12);
    -[CBDaemonXPCConnection activate](v22, "activate");

  }
  v32 = (void *)_CFXPCCreateXPCObjectFromCFObject(v8);
  if (v32)
  {
    v33 = objc_retainBlock(v17);
    CUXPCObjectSetResponseHandler(v32, v33);

    -[CBDaemonXPCConnection xpcReceivedRequest:](v22, "xpcReceivedRequest:", v32);
  }
  else
  {
    v37 = CBErrorF(4294960579, "Convert CF to XPC failed");
    v38 = objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)v44[5];
    v44[5] = v38;

  }
LABEL_16:

  ((void (*)(_QWORD *))v18[2])(v18);
  _Block_object_dispose(&v43, 8);

}

- (void)remoteRegisterConnection:(id)a3 clientID:(id)a4
{
  id v6;
  NSMutableDictionary *remoteConnectionMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  remoteConnectionMap = self->_remoteConnectionMap;
  if (!remoteConnectionMap)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = self->_remoteConnectionMap;
    self->_remoteConnectionMap = v8;

    remoteConnectionMap = self->_remoteConnectionMap;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](remoteConnectionMap, "setObject:forKeyedSubscript:", v10, v6);
  if (dword_100977980 <= 30 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer remoteRegisterConnection:clientID:]", 30, "Remote connection registered: CID %@, %@", v6, v10);

}

- (void)remoteDeregisterConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_remoteConnectionMap, "allKeys"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteConnectionMap, "objectForKeyedSubscript:", v10));
        if (v11 == v4)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteConnectionMap, "setObject:forKeyedSubscript:", 0, v10);
          if (dword_100977980 <= 30
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
          {
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer remoteDeregisterConnection:]", 30, "Remote connection deregistered: CID %@, %@", v10, v4);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_remoteInvalidateInactiveXPC
{
  id v2;
  id v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *k;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableSet *obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];

  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_xpcConnections;
  v2 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v2)
  {
    v3 = v2;
    v24 = 0;
    v27 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteDevice"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

        if (v7)
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_remoteClient, "activeDevices"));
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v33;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(_QWORD *)v33 != v11)
                  objc_enumerationMutation(v8);
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1)
                                                                                   + 8 * (_QWORD)j), "idsDeviceIdentifier"));
                v14 = objc_msgSend(v13, "isEqual:", v7);

                if ((v14 & 1) != 0)
                {

                  goto LABEL_19;
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
              if (v10)
                continue;
              break;
            }
          }

          v15 = v24;
          if (!v24)
            v15 = objc_alloc_init((Class)NSMutableArray);
          v24 = v15;
          objc_msgSend(v15, "addObject:", v5);
        }
LABEL_19:

      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v3);
  }
  else
  {
    v24 = 0;
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v24;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)k);
        if (dword_100977980 <= 30
          && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "remoteDevice"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _remoteInvalidateInactiveXPC]", 30, "Invalidating inactive XPC from Remote: %@", v23);

        }
        objc_msgSend(v21, "invalidate");
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v18);
  }

}

- (void)_whbDiscoveryEnsureStarted
{
  CBWHBDiscoveryDaemon *v3;
  CBWHBDiscoveryDaemon *v4;
  CBWHBDiscoveryDaemon *v5;
  CBWHBDiscoveryDaemon *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  _QWORD *(*v10)(uint64_t, uint64_t);
  void *v11;
  CBWHBDiscoveryDaemon *v12;
  CBDaemonServer *v13;
  _QWORD v14[4];
  CBWHBDiscoveryDaemon *v15;
  CBDaemonServer *v16;

  v3 = self->_whbDiscoveryDaemon;
  v4 = v3;
  if (!v3)
  {
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _whbDiscoveryEnsureStarted]", 30, "WHB discovery start");
    }
    v5 = objc_alloc_init(CBWHBDiscoveryDaemon);
    objc_storeStrong((id *)&self->_whbDiscoveryDaemon, v5);
    -[CBWHBDiscoveryDaemon setDaemonServer:](v5, "setDaemonServer:", self);
    -[CBWHBDiscoveryDaemon setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CBWHBDiscoveryDaemon setRemoteClient:](v5, "setRemoteClient:", self->_remoteClient);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100088FEC;
    v14[3] = &unk_1009171C0;
    v6 = v5;
    v15 = v6;
    v16 = self;
    -[CBWHBDiscoveryDaemon setDeviceFoundHandler:](v6, "setDeviceFoundHandler:", v14);
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_100089008;
    v11 = &unk_1009171C0;
    v4 = v6;
    v12 = v4;
    v13 = self;
    -[CBWHBDiscoveryDaemon setDeviceLostHandler:](v4, "setDeviceLostHandler:", &v8);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBDiscoveryDaemon discoveryArray](v4, "discoveryArray", v8, v9, v10, v11));
  if (v7)
  {

  }
  else if (-[NSMutableArray count](self->_whbDiscoveryArray, "count"))
  {
    -[CBWHBDiscoveryDaemon setDiscoveryArray:](v4, "setDiscoveryArray:", self->_whbDiscoveryArray);
LABEL_13:
    -[CBWHBDiscoveryDaemon activate](v4, "activate");
    goto LABEL_14;
  }
  if (!v3)
    goto LABEL_13;
LABEL_14:

}

- (void)_whbDiscoveryDeviceFound:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableDictionary *whbDeviceMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbDeviceMap, "objectForKeyedSubscript:", v5));
    if (!v6)
    {
      v6 = objc_alloc_init((Class)CBDevice);
      whbDeviceMap = self->_whbDeviceMap;
      if (!whbDeviceMap)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v9 = self->_whbDeviceMap;
        self->_whbDeviceMap = v8;

        whbDeviceMap = self->_whbDeviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](whbDeviceMap, "setObject:forKeyedSubscript:", v6, v5);
    }
    objc_msgSend(v6, "setInternalFlags:", objc_msgSend(v6, "internalFlags") | 2);
    objc_msgSend(v6, "updateWithCBDevice:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteHostID"));
    objc_msgSend(v6, "setRemoteHostID:", v10);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_xpcConnections;
    v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activatedDiscoveryWHB", (_QWORD)v19));
          v18 = v17;
          if (v17 && (objc_msgSend(v17, "disabledActive") & 1) == 0)
            objc_msgSend(v16, "reportDeviceFound:", v6);

        }
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setChangeFlags:", 0);
  }

}

- (void)_whbDiscoveryDeviceLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbDeviceMap, "objectForKeyedSubscript:", v5));
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_whbDeviceMap, "setObject:forKeyedSubscript:", 0, v5);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = self->_xpcConnections;
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activatedDiscoveryWHB", (_QWORD)v14));
            if (v13)
              objc_msgSend(v12, "reportDeviceLost:", v6);

          }
          v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

      objc_msgSend(v4, "setChangeFlags:", 0);
    }

  }
}

- (void)_userControllerCloudUpdateWithDevices:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  CBStackController *stackController;
  unsigned int v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  CBUserController *userController;
  id obj;
  _QWORD v27[6];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v4 = a3;
  if (dword_100977980 <= 50)
  {
    if (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 50))
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _userControllerCloudUpdateWithDevices:]", 50, "User controller fetched %lu devices", objc_msgSend(v4, "count"));
    if (dword_100977980 <= 35
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 35)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _userControllerCloudUpdateWithDevices:]", 35, "User controller fetched: %@", v4);
    }
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
LABEL_11:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
      v10 = objc_autoreleasePoolPush();
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      if (!v11)
      {
        objc_autoreleasePoolPop(v10);
        v23 = obj;
        goto LABEL_35;
      }
      v12 = (void *)v11;
      v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v11));
      if (!v13)
      {
        v13 = objc_alloc_init((Class)CBDevice);
        deviceMap = self->_deviceMap;
        if (!deviceMap)
        {
          v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v16 = self->_deviceMap;
          self->_deviceMap = v15;

          deviceMap = self->_deviceMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v13, v12);
      }
      objc_msgSend(v13, "setInternalFlags:", objc_msgSend(v13, "internalFlags") | 0x400);
      objc_msgSend(v13, "updateWithCBDevice:", v9);
      stackController = self->_stackController;
      v28 = 0;
      v18 = -[CBStackController modifyDevice:error:](stackController, "modifyDevice:error:", v13, &v28);
      v19 = v28;
      if (v18)
      {
        if (dword_100977980 > 40
          || dword_100977980 == -1 && !_LogCategory_Initialize(&dword_100977980, 40))
        {
          goto LABEL_30;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _userControllerCloudUpdateWithDevices:]", 40, "User controller: device %@ updated", v20);
      }
      else
      {
        if (dword_100977980 > 90
          || dword_100977980 == -1 && !_LogCategory_Initialize(&dword_100977980, 90))
        {
          goto LABEL_30;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v21 = CUPrintNSError(v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _userControllerCloudUpdateWithDevices:]", 90, "User controller: device %@ update failed with error %@", v20, v22);

      }
LABEL_30:
      -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v13);

      objc_autoreleasePoolPop(v10);
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v6)
          goto LABEL_11;
        break;
      }
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity idsDeviceID](self->_identitySelf, "idsDeviceID"));
  if (v23)
  {
    v24 = objc_alloc_init((Class)CBDevice);
    objc_msgSend(v24, "setIdentifier:", v23);
    objc_msgSend(v24, "setIdsDeviceID:", v23);
    userController = self->_userController;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100089788;
    v27[3] = &unk_100917CE8;
    v27[4] = v23;
    v27[5] = self;
    -[CBUserController getControllerInfoForDevice:completion:](userController, "getControllerInfoForDevice:completion:", v24, v27);

  }
LABEL_35:

}

- (void)_userControllerUploadLocalControllerInfo
{
  void *v3;
  void *v4;
  _QWORD v5[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackController controllerInfo](self->_stackController, "controllerInfo"));
  if (objc_msgSend(v3, "fastLEConnectionInfoVersion")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastLEConnectionInfoData")),
        v4,
        v4))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100089A4C;
    v5[3] = &unk_1009171E8;
    v5[4] = self;
    v5[5] = v3;
    -[CBDaemonServer _performUserControllerActionWithCompletion:](self, "_performUserControllerActionWithCompletion:", v5);
  }
  else if (dword_100977980 <= 35
         && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 35)))
  {
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _userControllerUploadLocalControllerInfo]", 35, "Fast LE controller info not available");
  }

}

- (void)activateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
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
  block[2] = sub_100089C54;
  block[3] = &unk_100917D30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_activateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  CBDaemonXPCConnection *v15;
  NSMutableSet *xpcConnections;
  NSMutableSet *v17;
  NSMutableSet *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activatedAdvertiser"));

      if (v14 == v6)
        break;
      if (v10 == (id)++v12)
      {
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v13;

    if (!v15)
      goto LABEL_14;
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _activateCBAdvertiser:completion:]", 30, "Direct update: %@", v6);
    }
    -[CBDaemonXPCConnection setActivatedAdvertiser:](v15, "setActivatedAdvertiser:", v6);
  }
  else
  {
LABEL_9:

LABEL_14:
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _activateCBAdvertiser:completion:]", 30, "Direct activate: %@", v6);
    }
    v15 = objc_alloc_init(CBDaemonXPCConnection);
    -[CBDaemonXPCConnection setActivatedAdvertiser:](v15, "setActivatedAdvertiser:", v6);
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v18 = self->_xpcConnections;
      self->_xpcConnections = v17;

      xpcConnections = self->_xpcConnections;
    }
    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15);
    -[CBDaemonXPCConnection activate](v15, "activate");
  }
  -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self, "scheduleAdvertiserUpdateImmediate:", 0);
  v7[2](v7, 0);

}

- (void)invalidateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
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
  block[2] = sub_100089F74;
  block[3] = &unk_100917D30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_invalidateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activatedAdvertiser"));

        if (v14 == v6)
        {
          if (dword_100977980 <= 30
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
          {
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _invalidateCBAdvertiser:completion:]", 30, "Direct invalidate: %@", v6);
          }
          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13);

          goto LABEL_15;
        }

      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

  -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self, "scheduleAdvertiserUpdateImmediate:", 0);
  v7[2](v7, 0);

}

- (void)activateCBController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
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
  block[2] = sub_10008A1E8;
  block[3] = &unk_100917D30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_activateCBController:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  CBDaemonXPCConnection *v15;
  NSMutableSet *xpcConnections;
  NSMutableSet *v17;
  NSMutableSet *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activatedController"));

      if (v14 == v6)
        break;
      if (v10 == (id)++v12)
      {
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v13;

    if (!v15)
      goto LABEL_14;
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _activateCBController:completion:]", 30, "Direct update: %@", v6);
    }
    -[CBDaemonXPCConnection setActivatedController:](v15, "setActivatedController:", v6);
  }
  else
  {
LABEL_9:

LABEL_14:
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _activateCBController:completion:]", 30, "Direct activate: %@", v6);
    }
    v15 = objc_alloc_init(CBDaemonXPCConnection);
    -[CBDaemonXPCConnection setActivatedController:](v15, "setActivatedController:", v6);
    -[CBDaemonXPCConnection setAppID:](v15, "setAppID:", CFSTR("CBDaemon"));
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v18 = self->_xpcConnections;
      self->_xpcConnections = v17;

      xpcConnections = self->_xpcConnections;
    }
    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15);
    -[CBDaemonXPCConnection activate](v15, "activate");
  }
  -[CBDaemonServer scheduleControlUpdateImmediate:](self, "scheduleControlUpdateImmediate:", 0);
  v7[2](v7, 0);

}

- (void)invalidateCBController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
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
  block[2] = sub_10008A518;
  block[3] = &unk_100917D30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_invalidateCBController:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activatedController"));

        if (v14 == v6)
        {
          if (dword_100977980 <= 30
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
          {
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _invalidateCBController:completion:]", 30, "Direct invalidate: %@", v6);
          }
          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13);

          goto LABEL_15;
        }

      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

  -[CBDaemonServer scheduleControlUpdateImmediate:](self, "scheduleControlUpdateImmediate:", 0);
  v7[2](v7, 0);

}

- (void)activateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
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
  block[2] = sub_10008A78C;
  block[3] = &unk_100917D30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_activateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  CBDaemonXPCConnection *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  NSMutableSet *xpcConnections;
  NSMutableSet *v20;
  NSMutableSet *v21;
  void *v22;
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
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activatedDiscovery"));

      if (v14 == v6)
        break;
      if (v10 == (id)++v12)
      {
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v13;

    if (!v15)
      goto LABEL_14;
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _activateCBDiscovery:completion:]", 30, "Direct update: %@", v6);
    }
    -[CBDaemonXPCConnection setActivatedDiscovery:](v15, "setActivatedDiscovery:", v6);
  }
  else
  {
LABEL_9:

LABEL_14:
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _activateCBDiscovery:completion:]", 30, "Direct activate: %@", v6);
    }
    v15 = objc_alloc_init(CBDaemonXPCConnection);
    -[CBDaemonXPCConnection setActivatedDiscovery:](v15, "setActivatedDiscovery:", v6);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appID"));
    v17 = (void *)v16;
    if (v16)
      v18 = (const __CFString *)v16;
    else
      v18 = CFSTR("CBDaemon");
    -[CBDaemonXPCConnection setAppID:](v15, "setAppID:", v18);

    -[CBDaemonXPCConnection setDispatchQueue:](v15, "setDispatchQueue:", self->_dispatchQueue);
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v21 = self->_xpcConnections;
      self->_xpcConnections = v20;

      xpcConnections = self->_xpcConnections;
    }
    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15);
    -[CBDaemonXPCConnection activate](v15, "activate");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
    objc_msgSend(v22, "reportCBDiscovery:daemonCnx:action:", v6, v15, CFSTR("strt"));

  }
  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0);
  v7[2](v7, 0);

}

- (void)invalidateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
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
  block[2] = sub_10008AB10;
  block[3] = &unk_100917D30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_invalidateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activatedDiscovery"));

        if (v14 == v6)
        {
          if (dword_100977980 <= 30
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
          {
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _invalidateCBDiscovery:completion:]", 30, "Direct invalidate: %@", v6);
          }
          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
          objc_msgSend(v15, "reportCBDiscovery:daemonCnx:action:", v6, v13, CFSTR("stop"));

          -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0);
          goto LABEL_15;
        }

      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

  v7[2](v7, 0);
}

- (void)activateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
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
  block[2] = sub_10008ADB0;
  block[3] = &unk_100917D30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_activateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  CBDaemonXPCConnection *v15;
  NSMutableSet *xpcConnections;
  NSMutableSet *v17;
  NSMutableSet *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activatedSpatialInteractionSession"));

      if (v14 == v6)
        break;
      if (v10 == (id)++v12)
      {
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v13;

    if (!v15)
      goto LABEL_14;
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _activateCBSpatialInteractionSession:completion:]", 30, "Direct update: %@", v6);
    }
    -[CBDaemonXPCConnection setActivatedSpatialInteractionSession:](v15, "setActivatedSpatialInteractionSession:", v6);
  }
  else
  {
LABEL_9:

LABEL_14:
    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _activateCBSpatialInteractionSession:completion:]", 30, "Direct activate: %@", v6);
    }
    v15 = objc_alloc_init(CBDaemonXPCConnection);
    -[CBDaemonXPCConnection setActivatedSpatialInteractionSession:](v15, "setActivatedSpatialInteractionSession:", v6);
    -[CBDaemonXPCConnection setAppID:](v15, "setAppID:", CFSTR("CBDaemon"));
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v18 = self->_xpcConnections;
      self->_xpcConnections = v17;

      xpcConnections = self->_xpcConnections;
    }
    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15);
    -[CBDaemonXPCConnection activate](v15, "activate");
  }
  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0);
  v7[2](v7, 0);

}

- (void)invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
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
  block[2] = sub_10008B0E0;
  block[3] = &unk_100917D30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activatedSpatialInteractionSession"));

        if (v14 == v6)
        {
          if (dword_100977980 <= 30
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
          {
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _invalidateCBSpatialInteractionSession:completion:]", 30, "Direct invalidate: %@", v6);
          }
          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13);
          -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0);

          goto LABEL_15;
        }

      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

  v7[2](v7, 0);
}

- (void)aopMessageReceived:(id)a3
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
  v7[2] = sub_10008B328;
  v7[3] = &unk_100917058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_aopMessageReceived:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedSpatialInteractionSession"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aopDataHandler"));

        if (v12)
        {
          if (dword_100977980 <= 20
            && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
          {
            v14 = CUPrintNSDataHex(v4, 100, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _aopMessageReceived:]", 20, "AOPMessageReceived: %@, <%@>", v11, v15, (_QWORD)v16);

          }
          objc_msgSend(v10, "aopMessageReceived:", v4);

          goto LABEL_17;
        }

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (dword_100977980 <= 90 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 90)))
  {
    v13 = CUPrintNSDataHex(v4, 100, 1);
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v13);
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _aopMessageReceived:]", 90, "### AOPMessageReceived with no session: <%@>", v5);
LABEL_17:

  }
}

- (void)notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008B61C;
  v15[3] = &unk_100917D58;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

- (void)_notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5
{
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  xpc_object_t v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  OS_xpc_event_publisher *v39;
  id v40;
  uint64_t v41;
  NSMutableSet *v42;
  id v43;
  id v44;
  int v45;
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];

  v44 = a3;
  v40 = a4;
  v46 = a5;
  v39 = self->_xpcPublisherConnections;
  if (!v39)
    goto LABEL_47;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (!v9)
  {

LABEL_43:
    if (dword_100977980 <= 20
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 20)))
    {
      v37 = CUPrintNSObjectOneLine(v46);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _notifyConnectedDeviceUUID:name:servicesUUIDs:]", 20, "XPC subscriber connected: no matches, %@", v38);

    }
    goto LABEL_47;
  }
  v10 = v9;
  v45 = 0;
  v11 = *(_QWORD *)v59;
  v41 = *(_QWORD *)v59;
  v42 = v8;
  do
  {
    v12 = 0;
    v43 = v10;
    do
    {
      if (*(_QWORD *)v59 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v12);
      v14 = objc_msgSend(v13, "xpcToken");
      if (v14)
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activatedConnection"));
        v17 = v16;
        if (v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceUUIDs"));
          if (v18)
          {
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v19 = v46;
            v48 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
            if (v48)
            {
              v20 = *(_QWORD *)v55;
              v49 = v19;
              v47 = *(_QWORD *)v55;
              while (2)
              {
                for (i = 0; i != v48; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v55 != v20)
                    objc_enumerationMutation(v19);
                  v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
                  v50 = 0u;
                  v51 = 0u;
                  v52 = 0u;
                  v53 = 0u;
                  v23 = v18;
                  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
                  if (v24)
                  {
                    v25 = v24;
                    v26 = *(_QWORD *)v51;
LABEL_17:
                    v27 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v51 != v26)
                        objc_enumerationMutation(v23);
                      if ((objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v27), "isEqual:", v22) & 1) != 0)
                        break;
                      if (v25 == (id)++v27)
                      {
                        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
                        if (v25)
                          goto LABEL_17;
                        goto LABEL_23;
                      }
                    }

                    v19 = xpc_dictionary_create(0, 0, 0);
                    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "UUIDString")));
                    v29 = (const char *)objc_msgSend(v28, "UTF8String");

                    if (!v29)
                      goto LABEL_32;
                    xpc_dictionary_set_string(v19, "deviceID", v29);
                    v30 = (const char *)objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
                    v8 = v42;
                    v10 = v43;
                    v11 = v41;
                    if (v30)
                      xpc_dictionary_set_string(v19, "name", v30);
                    v31 = xpc_event_publisher_fire(v39, v15, v19);
                    if (dword_100977980 <= 30)
                    {
                      v32 = v31;
                      if (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30))
                      {
                        v33 = CUPrintNSObjectOneLine(v49);
                        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                        v35 = CUPrintErrorCode(v32);
                        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
                        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _notifyConnectedDeviceUUID:name:servicesUUIDs:]", 30, "XPC subscriber connected: token %llu, device %@, services %@, %@", v15, v44, v34, v36);

                      }
                    }
                    ++v45;
                    goto LABEL_35;
                  }
LABEL_23:

                  v19 = v49;
                  v20 = v47;
                }
                v48 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
                if (v48)
                  continue;
                break;
              }
LABEL_32:
              v8 = v42;
              v10 = v43;
              v11 = v41;
            }
LABEL_35:

          }
        }

      }
      v12 = (char *)v12 + 1;
    }
    while (v12 != v10);
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  }
  while (v10);

  if (!v45)
    goto LABEL_43;
LABEL_47:

}

- (id)localWhbDeviceForStableId:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10006248C;
  v16 = sub_100062300;
  v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008BB6C;
  block[3] = &unk_100917C98;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)optimalWhbDeviceForStableIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
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
  block[2] = sub_10008BC50;
  block[3] = &unk_100917D30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_invalidateUserController
{
  id v3;
  CBUserController *userController;

  if (!self->_userController)
  {
    v3 = 0;
    objc_msgSend(0, "invalidate");
    userController = self->_userController;
    self->_userController = 0;

    if (dword_100977980 <= 30
      && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    {
      LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _invalidateUserController]", 30, "Stack user controller stopped");
    }
  }
}

- (void)xpcConnectionInvalidated:(id)a3
{
  NSMutableSet *xpcConnections;
  id v5;

  xpcConnections = self->_xpcConnections;
  v5 = a3;
  -[NSMutableSet removeObject:](xpcConnections, "removeObject:", v5);
  -[CBDaemonServer remoteDeregisterConnection:](self, "remoteDeregisterConnection:", v5);

  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", 0);
}

- (void)_xpcPublisherConnectionsAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  id v14;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = v8;
  switch((_DWORD)v6)
  {
    case 2:
      if (dword_100977980 <= 30)
      {
        v14 = v8;
        if (dword_100977980 != -1 || (v12 = _LogCategory_Initialize(&dword_100977980, 30), v9 = v14, v12))
        {
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherConnectionsAction:token:info:]", 30, "XPC publisher initial barrier: connections");
          goto LABEL_12;
        }
      }
      break;
    case 1:
      v14 = v8;
      -[CBDaemonServer _xpcPublisherConnectionsRemoveToken:reason:](self, "_xpcPublisherConnectionsRemoveToken:reason:", a4, "removed");
      goto LABEL_12;
    case 0:
      v14 = v8;
      -[CBDaemonServer _xpcPublisherConnectionsAddToken:info:](self, "_xpcPublisherConnectionsAddToken:info:", a4);
LABEL_12:
      v9 = v14;
      break;
    default:
      if (dword_100977980 <= 30)
      {
        v14 = v8;
        if (dword_100977980 != -1 || (v13 = _LogCategory_Initialize(&dword_100977980, 30), v9 = v14, v13))
        {
          v10 = CUPrintXPC(v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherConnectionsAction:token:info:]", 30, "Unknown XPC publisher action: connections, %d, %@", v6, v11);

          goto LABEL_12;
        }
      }
      break;
  }

}

- (void)_xpcPublisherConnectionsAddToken:(unint64_t)a3 info:(id)a4
{
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CBDaemonXPCConnection *v14;
  id v15;
  NSMutableSet *xpcConnections;
  NSMutableSet *v17;
  NSMutableSet *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a4;
  if (-[CBDaemonServer xpcEventAllowedInfo:](self, "xpcEventAllowedInfo:", v6))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_xpcConnections;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        if (objc_msgSend(v12, "xpcToken") == (id)a3)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "xpcCnx"));

          if (!v13)
            break;
        }
        if (v9 == (id)++v11)
        {
          v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      v14 = v12;

      if (!v14)
        goto LABEL_17;
      v15 = (id)objc_claimAutoreleasedReturnValue(-[CBDaemonXPCConnection activatedConnection](v14, "activatedConnection"));
      objc_msgSend(v15, "updateWithXPCSubscriberInfo:", v6);
      if (dword_100977980 <= 30
        && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
      {
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherConnectionsAddToken:info:]", 30, "XPC subscriber update: connections, %llu, %@", a3, v14, (_QWORD)v19);
      }
    }
    else
    {
LABEL_11:

LABEL_17:
      v14 = objc_alloc_init(CBDaemonXPCConnection);
      -[CBDaemonXPCConnection setAppID:](v14, "setAppID:", CFSTR("XPCProxy"));
      -[CBDaemonXPCConnection setXpcToken:](v14, "setXpcToken:", a3);
      v15 = objc_alloc_init((Class)CBConnection);
      -[CBDaemonXPCConnection setActivatedConnection:](v14, "setActivatedConnection:", v15);
      objc_msgSend(v15, "updateWithXPCSubscriberInfo:", v6);
      if (dword_100977980 <= 30
        && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
      {
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherConnectionsAddToken:info:]", 30, "XPC subscriber add: connections, token %llu, %@", a3, v14, (_QWORD)v19);
      }
      xpcConnections = self->_xpcConnections;
      if (!xpcConnections)
      {
        v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v18 = self->_xpcConnections;
        self->_xpcConnections = v17;

        xpcConnections = self->_xpcConnections;
      }
      -[NSMutableSet addObject:](xpcConnections, "addObject:", v14);
      -[CBDaemonXPCConnection activate](v14, "activate");
    }

  }
  else
  {
    -[CBDaemonServer _xpcPublisherConnectionsRemoveToken:reason:](self, "_xpcPublisherConnectionsRemoveToken:reason:", a3, "not allowed");
  }

}

- (void)_xpcPublisherConnectionsRemoveToken:(unint64_t)a3 reason:(const char *)a4
{
  NSMutableSet *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_xpcConnections;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "xpcToken") == (id)a3)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "xpcCnx"));

          if (!v12)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  if (dword_100977980 <= 30 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherConnectionsRemoveToken:reason:]", 30, "XPC subscriber remove: connections, reason %s, token %llu, %@", a4, a3, v8);
  if (v8)
  {
    -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v8);
    objc_msgSend(v8, "invalidate");
  }

}

- (BOOL)xpcEventAllowedInfo:(id)a3
{
  id v3;
  xpc_object_t array;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[6];
  _QWORD applier[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a3;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    LOBYTE(v9) = 1;
    goto LABEL_12;
  }
  array = xpc_dictionary_get_array(v3, "limitToDeviceClasses");
  v5 = objc_claimAutoreleasedReturnValue(array);
  v6 = xpc_dictionary_get_array(v3, "denyProductList");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (!(v5 | v7))
  {
    LOBYTE(v9) = 1;
    goto LABEL_11;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (v5)
  {
    v8 = objc_retainAutorelease((id)MGCopyAnswer(CFSTR("DeviceClass"), 0));
    v9 = objc_msgSend(v8, "UTF8String");

    if (!v9)
      goto LABEL_10;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10008C5E4;
    applier[3] = &unk_100917DA8;
    applier[4] = &v14;
    applier[5] = v9;
    xpc_array_apply((xpc_object_t)v5, applier);
  }
  if (!v7)
  {
LABEL_9:
    LOBYTE(v9) = *((_BYTE *)v15 + 24) != 0;
    goto LABEL_10;
  }
  v10 = objc_retainAutorelease((id)MGCopyAnswer(CFSTR("ProductType"), 0));
  v9 = objc_msgSend(v10, "UTF8String");

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008C638;
    v12[3] = &unk_100917DA8;
    v12[4] = &v14;
    v12[5] = v9;
    xpc_array_apply((xpc_object_t)v7, v12);
    goto LABEL_9;
  }
LABEL_10:
  _Block_object_dispose(&v14, 8);
LABEL_11:

LABEL_12:
  return (char)v9;
}

- (void)_xpcPublisherDiscoveryAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  id v14;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = v8;
  switch((_DWORD)v6)
  {
    case 2:
      if (dword_100977980 <= 30)
      {
        v14 = v8;
        if (dword_100977980 != -1 || (v12 = _LogCategory_Initialize(&dword_100977980, 30), v9 = v14, v12))
        {
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherDiscoveryAction:token:info:]", 30, "XPC publisher initial barrier: discovery");
          goto LABEL_12;
        }
      }
      break;
    case 1:
      v14 = v8;
      -[CBDaemonServer _xpcPublisherDiscoveryRemoveToken:reason:](self, "_xpcPublisherDiscoveryRemoveToken:reason:", a4, "removed");
      goto LABEL_12;
    case 0:
      v14 = v8;
      -[CBDaemonServer _xpcPublisherDiscoveryAddToken:info:](self, "_xpcPublisherDiscoveryAddToken:info:", a4);
LABEL_12:
      v9 = v14;
      break;
    default:
      if (dword_100977980 <= 30)
      {
        v14 = v8;
        if (dword_100977980 != -1 || (v13 = _LogCategory_Initialize(&dword_100977980, 30), v9 = v14, v13))
        {
          v10 = CUPrintXPC(v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherDiscoveryAction:token:info:]", 30, "Unknown XPC publisher action: discovery, %d, %@", v6, v11);

          goto LABEL_12;
        }
      }
      break;
  }

}

- (void)_xpcPublisherDiscoveryAddToken:(unint64_t)a3 info:(id)a4
{
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CBDaemonXPCConnection *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSMutableSet *xpcConnections;
  NSMutableSet *v20;
  NSMutableSet *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[8];
  _QWORD v26[8];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a4;
  if (-[CBDaemonServer xpcEventAllowedInfo:](self, "xpcEventAllowedInfo:", v6))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self->_xpcConnections;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        if (objc_msgSend(v12, "xpcToken") == (id)a3)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "xpcCnx"));

          if (!v13)
            break;
        }
        if (v9 == (id)++v11)
        {
          v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      v14 = v12;

      if (!v14)
        goto LABEL_17;
      v15 = (id)objc_claimAutoreleasedReturnValue(-[CBDaemonXPCConnection activatedDiscovery](v14, "activatedDiscovery"));
      v16 = objc_msgSend(v15, "updateWithXPCSubscriberInfo:", v6);
      if (dword_100977980 <= 30
        && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
      {
        v17 = CUPrintFlags64(v16, "");
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherDiscoveryAddToken:info:]", 30, "XPC subscriber update: discovery, %llu, %@, %@", a3, v14, v18);

      }
      if (v16)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
        v23 = v22;
        v24 = CFSTR("updt");
        goto LABEL_27;
      }
    }
    else
    {
LABEL_11:

LABEL_17:
      v14 = objc_alloc_init(CBDaemonXPCConnection);
      -[CBDaemonXPCConnection setAppID:](v14, "setAppID:", CFSTR("XPCProxy"));
      -[CBDaemonXPCConnection setXpcToken:](v14, "setXpcToken:", a3);
      v15 = objc_alloc_init((Class)CBDiscovery);
      -[CBDaemonXPCConnection setActivatedDiscovery:](v14, "setActivatedDiscovery:", v15);
      objc_msgSend(v15, "updateWithXPCSubscriberInfo:", v6);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10008CB7C;
      v26[3] = &unk_100917DD0;
      v26[4] = v15;
      v26[5] = v14;
      v26[6] = self;
      v26[7] = a3;
      objc_msgSend(v15, "setDeviceFoundHandler:", v26);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10008CD94;
      v25[3] = &unk_100917DD0;
      v25[4] = v15;
      v25[5] = v14;
      v25[6] = self;
      v25[7] = a3;
      objc_msgSend(v15, "setDeviceLostHandler:", v25);
      if (dword_100977980 <= 30
        && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
      {
        LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherDiscoveryAddToken:info:]", 30, "XPC subscriber add: discovery, token %llu, %@", a3, v14);
      }
      xpcConnections = self->_xpcConnections;
      if (!xpcConnections)
      {
        v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v21 = self->_xpcConnections;
        self->_xpcConnections = v20;

        xpcConnections = self->_xpcConnections;
      }
      -[NSMutableSet addObject:](xpcConnections, "addObject:", v14);
      -[CBDaemonXPCConnection activate](v14, "activate");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
      v23 = v22;
      v24 = CFSTR("strt");
LABEL_27:
      objc_msgSend(v22, "reportCBDiscovery:daemonCnx:action:", v15, v14, v24);

    }
    -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0);

  }
  else
  {
    -[CBDaemonServer _xpcPublisherDiscoveryRemoveToken:reason:](self, "_xpcPublisherDiscoveryRemoveToken:reason:", a3, "not allowed");
  }

}

- (void)_xpcPublisherDiscoveryRemoveToken:(unint64_t)a3 reason:(const char *)a4
{
  NSMutableSet *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_xpcConnections;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "xpcToken") == (id)a3)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "xpcCnx"));

          if (!v12)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  if (dword_100977980 <= 30 && (dword_100977980 != -1 || _LogCategory_Initialize(&dword_100977980, 30)))
    LogPrintF_safe(&dword_100977980, "-[CBDaemonServer _xpcPublisherDiscoveryRemoveToken:reason:]", 30, "XPC subscriber remove: discovery, reason %s, token %llu, %@", a4, a3, v8);
  if (v8)
  {
    -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activatedDiscovery"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
      objc_msgSend(v14, "reportCBDiscovery:daemonCnx:action:", v13, v8, CFSTR("stop"));

    }
    objc_msgSend(v8, "invalidate");
    -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0);

  }
}

- (void)addLostDeviceToLostCBSpatialDevicesIfNeeded:(id)a3
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
  v7[2] = sub_10008D238;
  v7[3] = &unk_100917058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (CBAccessoryDaemon)accessoryDaemon
{
  return self->_accessoryDaemon;
}

- (void)setAccessoryDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryDaemon, a3);
}

- (CBStackAddressMonitor)addressMonitor
{
  return self->_addressMonitor;
}

- (void)setAddressMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_addressMonitor, a3);
}

- (void)setDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMap, a3);
}

- (CBExtensionsDaemon)extensionsDaemon
{
  return self->_extensionsDaemon;
}

- (void)setExtensionsDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_extensionsDaemon, a3);
}

- (NSArray)identityArray
{
  return self->_identityArray;
}

- (void)setIdentityArray:(id)a3
{
  objc_storeStrong((id *)&self->_identityArray, a3);
}

- (BOOL)prefAppleAudioDeviceLimitedLoggingEnabled
{
  return self->_prefAppleAudioDeviceLimitedLoggingEnabled;
}

- (BOOL)prefEnforceApprovedExtensions
{
  return self->_prefEnforceApprovedExtensions;
}

- (void)setPrefEnforceApprovedExtensions:(BOOL)a3
{
  self->_prefEnforceApprovedExtensions = a3;
}

- (void)setPrefEnforceApprovedList:(BOOL)a3
{
  self->_prefEnforceApprovedList = a3;
}

- (BOOL)prefRemoteClientEnabled
{
  return self->_prefRemoteClientEnabled;
}

- (BOOL)prefRemoteServerEnabled
{
  return self->_prefRemoteServerEnabled;
}

- (BOOL)prefSystemReferenceTimeDisabled
{
  return self->_prefSystemReferenceTimeDisabled;
}

- (BOOL)prefWiProxAdvertising
{
  return self->_prefWiProxAdvertising;
}

- (CBStackAdaptor)stackAdaptor
{
  return self->_stackAdaptor;
}

- (CBStackBLEScanner)stackBLEScanner
{
  return self->_stackBLEScanner;
}

- (void)setStackController:(id)a3
{
  objc_storeStrong((id *)&self->_stackController, a3);
}

- (CBAdvertiserDaemon)testAdvertiser
{
  return self->_testAdvertiser;
}

- (void)setTestAdvertiser:(id)a3
{
  objc_storeStrong((id *)&self->_testAdvertiser, a3);
}

- (CBController)testAssertion
{
  return self->_testAssertion;
}

- (void)setTestAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_testAssertion, a3);
}

- (CBDiscovery)testDiscovery
{
  return self->_testDiscovery;
}

- (void)setTestDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_testDiscovery, a3);
}

- (CBUserController)userController
{
  return self->_userController;
}

- (void)setUserController:(id)a3
{
  objc_storeStrong((id *)&self->_userController, a3);
}

- (NSMutableDictionary)whbDeviceMap
{
  return self->_whbDeviceMap;
}

- (CBWHBDiscoveryDaemon)whbDiscoveryDaemon
{
  return self->_whbDiscoveryDaemon;
}

- (char)wifiCriticalOverride
{
  return self->_wifiCriticalOverride;
}

- (void)setWifiCriticalOverride:(char)a3
{
  self->_wifiCriticalOverride = a3;
}

- (NSMutableSet)xpcConnections
{
  return self->_xpcConnections;
}

- (void)setXpcConnections:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnections, a3);
}

- (NSMutableDictionary)identifyDevices
{
  return self->_identifyDevices;
}

- (void)setIdentifyDevices:(id)a3
{
  objc_storeStrong((id *)&self->_identifyDevices, a3);
}

- (BOOL)prefExtensionsEnabled
{
  return self->_prefExtensionsEnabled;
}

- (void)setPrefExtensionsEnabled:(BOOL)a3
{
  self->_prefExtensionsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyDevices, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_whbDiscoveryDaemon, 0);
  objc_storeStrong((id *)&self->_whbDeviceMap, 0);
  objc_storeStrong((id *)&self->_userController, 0);
  objc_storeStrong((id *)&self->_testDiscovery, 0);
  objc_storeStrong((id *)&self->_testAssertion, 0);
  objc_storeStrong((id *)&self->_testAdvertiser, 0);
  objc_storeStrong((id *)&self->_stackController, 0);
  objc_storeStrong((id *)&self->_stackBLEScanner, 0);
  objc_storeStrong((id *)&self->_stackAdaptor, 0);
  objc_storeStrong((id *)&self->_identityArray, 0);
  objc_storeStrong((id *)&self->_extensionsDaemon, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_addressMonitor, 0);
  objc_storeStrong((id *)&self->_accessoryDaemon, 0);
  objc_storeStrong((id *)&self->_xpcPublisherDiscovery, 0);
  objc_storeStrong((id *)&self->_xpcPublisherConnections, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_stackDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_stackClassicScanner, 0);
  objc_storeStrong((id *)&self->_stackAccessoryMonitor, 0);
  objc_storeStrong((id *)&self->_selfAuthTagNonConnectable, 0);
  objc_storeStrong((id *)&self->_selfAuthTag, 0);
  objc_storeStrong((id *)&self->_whbDiscoveryArray, 0);
  objc_storeStrong((id *)&self->_remoteServer, 0);
  objc_storeStrong((id *)&self->_remoteConnectionMap, 0);
  objc_storeStrong((id *)&self->_remoteClient, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_lostDevicesForCBSpatialWipeTimer, 0);
  objc_storeStrong((id *)&self->_lostDevicesForCBSpatial, 0);
  objc_storeStrong((id *)&self->_identitySelf, 0);
  objc_storeStrong((id *)&self->_identityMapSameAccount, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bleDiscoveryArray, 0);
  objc_storeStrong((id *)&self->_bleAdvertiserSpatialRestartTimer, 0);
  objc_storeStrong((id *)&self->_bleAdvertiserSpatialLingerTimer, 0);
  objc_storeStrong((id *)&self->_bleAdvertiserArray, 0);
  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

@end
