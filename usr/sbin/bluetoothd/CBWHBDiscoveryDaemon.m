@implementation CBWHBDiscoveryDaemon

- (id)description
{
  return -[CBWHBDiscoveryDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  char *v5;
  id *v6;
  id v7;
  void *v8;
  id *v9;
  NSMutableDictionary *remoteControllerMap;
  NSMutableDictionary *aggregateDeviceMap;
  unint64_t v12;
  BOOL v13;
  char *v14;
  id *v15;
  id *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v21;
  id v22;
  id obj;
  _QWORD v24[6];
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v3 = *(_QWORD *)&a3;
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = sub_1000624DC;
  v37 = sub_100062328;
  v38 = 0;
  v5 = (char *)-[NSMutableDictionary count](self->_aggregateDeviceMap, "count");
  v6 = v34;
  v32 = v34[5];
  v7 = objc_msgSend((id)objc_opt_class(self), "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF_safe(&v32, "== %@: Controllers %d, Devices %d ==", v8, -[NSMutableDictionary count](self->_remoteControllerMap, "count"), v5);
  objc_storeStrong(v6 + 5, v32);

  v9 = v34 + 5;
  if (v3 > 0x14u)
  {
    v21 = v34[5];
    NSAppendPrintF_safe(&v21, "\n== %@ ==", self->_whbRouter);
    objc_storeStrong(v9, v21);
  }
  else
  {
    v31 = v34[5];
    NSAppendPrintF_safe(&v31, "\n");
    objc_storeStrong(v9, v31);
    remoteControllerMap = self->_remoteControllerMap;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10009FC4C;
    v30[3] = &unk_100918480;
    v30[4] = &v33;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](remoteControllerMap, "enumerateKeysAndObjectsUsingBlock:", v30);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    aggregateDeviceMap = self->_aggregateDeviceMap;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10009FC98;
    v24[3] = &unk_1009184A8;
    v24[4] = &v33;
    v24[5] = &v26;
    v25 = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](aggregateDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v24);
    v12 = v27[3];
    v13 = (unint64_t)v5 >= v12;
    v14 = &v5[-v12];
    if (v14 != 0 && v13)
    {
      v15 = v34;
      obj = v34[5];
      NSAppendPrintF_safe(&obj, "... %d more, %d total\n", (_DWORD)v14, (_DWORD)v5);
      objc_storeStrong(v15 + 5, obj);
    }
    v16 = v34;
    v22 = v34[5];
    v17 = CUDescriptionWithLevel(self->_whbRouter, v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    NSAppendPrintF_safe(&v22, "\n%@", v18);
    objc_storeStrong(v16 + 5, v22);

    _Block_object_dispose(&v26, 8);
  }
  v19 = v34[5];
  _Block_object_dispose(&v33, 8);

  return v19;
}

- (void)activate
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  CBWHBRouter *v12;
  RPCompanionLinkClient *v13;
  CBDiscovery *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  CBDiscovery *v19;
  CBWHBDiscoveryDaemon *v20;
  _QWORD v21[4];
  id v22;
  CBWHBDiscoveryDaemon *v23;
  _QWORD v24[4];
  id v25;
  CBWHBDiscoveryDaemon *v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_aggregateDiscoveryFlags = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = self->_discoveryArray;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v9 = (unint64_t)objc_msgSend(v8, "discoveryFlags");
        self->_aggregateDiscoveryFlags |= (unint64_t)objc_msgSend(v8, "extraDiscoveryFlags") | v9;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

  if (dword_100977D88 <= 30 && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 30)))
  {
    v10 = CUPrintFlags64(self->_aggregateDiscoveryFlags, &unk_100737E88);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon activate]", 30, "Activate: ADF %@", v11);

  }
  v12 = self->_whbRouter;
  if (!v12)
  {
    v12 = objc_alloc_init(CBWHBRouter);
    objc_storeStrong((id *)&self->_whbRouter, v12);
    -[CBWHBRouter activate](self->_whbRouter, "activate");
  }
  if (!self->_whbEventRegistered)
  {
    v13 = self->_remoteClient;
    if (!v13
      && dword_100977D88 <= 90
      && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 90)))
    {
      LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon activate]", 90, "### No remote client to register event");
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000A00C4;
    v27[3] = &unk_1009184D0;
    v27[4] = v13;
    v27[5] = self;
    -[RPCompanionLinkClient registerEventID:options:handler:](v13, "registerEventID:options:handler:", CFSTR("com.apple.bluetooth.whbU"), 0, v27);
    self->_whbEventRegistered = 1;

  }
  v14 = self->_localDiscovery;
  if (!v14)
  {
    v15 = objc_alloc_init((Class)CBDiscovery);
    objc_storeStrong((id *)&self->_localDiscovery, v15);
    objc_msgSend(v15, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v15, "setDiscoveryFlags:", self->_aggregateDiscoveryFlags & 0xFFFFBFFFFFFFFFFFLL);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000A00E4;
    v24[3] = &unk_1009171C0;
    v16 = v15;
    v25 = v16;
    v26 = self;
    objc_msgSend(v16, "setDeviceFoundHandler:", v24);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000A0170;
    v21[3] = &unk_1009171C0;
    v17 = v16;
    v22 = v17;
    v23 = self;
    objc_msgSend(v17, "setDeviceLostHandler:", v21);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000A0190;
    v18[3] = &unk_1009171E8;
    v14 = (CBDiscovery *)v17;
    v19 = v14;
    v20 = self;
    -[CBDiscovery activateWithCompletion:](v14, "activateWithCompletion:", v18);

  }
  -[CBWHBDiscoveryDaemon remoteControllersChanged](self, "remoteControllersChanged");

}

- (void)invalidate
{
  CBDiscovery *localDiscovery;
  CBWHBRouter *whbRouter;
  id deviceFoundHandler;
  id deviceLostHandler;
  NSMutableDictionary *remoteControllerMap;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100977D88 <= 30 && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 30)))
    LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon invalidate]", 30, "Invalidate");
  -[CBDiscovery invalidate](self->_localDiscovery, "invalidate");
  localDiscovery = self->_localDiscovery;
  self->_localDiscovery = 0;

  -[RPCompanionLinkClient deregisterEventID:](self->_remoteClient, "deregisterEventID:", CFSTR("com.apple.bluetooth.whbU"));
  self->_whbEventRegistered = 0;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_remoteControllerMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100918510);
  -[CBWHBRouter invalidate](self->_whbRouter, "invalidate");
  whbRouter = self->_whbRouter;
  self->_whbRouter = 0;

  deviceFoundHandler = self->_deviceFoundHandler;
  self->_deviceFoundHandler = 0;

  deviceLostHandler = self->_deviceLostHandler;
  self->_deviceLostHandler = 0;

  remoteControllerMap = self->_remoteControllerMap;
  self->_remoteControllerMap = 0;

}

- (void)diagnosticControl:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](self->_remoteClient, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.bluetooth.whbU"), v5, RPDestinationIdentifierSameHome, 0, 0);

}

- (void)_reportLostDevicesForController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
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

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activatedDiscovery"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "discoveredDevices"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        -[CBWHBDiscoveryDaemon deviceLost:remoteController:](self, "deviceLost:remoteController:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), v4, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)remoteControllersChanged
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  void *v18;
  void *v19;
  NSMutableDictionary *remoteControllerMap;
  unsigned int v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_remoteClient, "activeDevices"));
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceTypes"));
        v10 = objc_msgSend(v9, "containsObject:", CFSTR("com.apple.bluetooth.remote"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceIdentifier"));
          if (v11)
          {
            if (!v4)
              v4 = objc_alloc_init((Class)NSMutableDictionary);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v11);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v5);
  }

  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v28 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_remoteControllerMap, "allKeys"));
  v13 = 0;
  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v17));

        if (!v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteControllerMap, "objectForKeyedSubscript:", v17));
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteControllerMap, "setObject:forKeyedSubscript:", 0, v17);
          -[CBWHBRouter hostConnectionInterruptedOn:](self->_whbRouter, "hostConnectionInterruptedOn:", v17);
          -[CBWHBDiscoveryDaemon _reportLostDevicesForController:](self, "_reportLostDevicesForController:", v19);
          objc_msgSend(v19, "invalidate");

          ++v13;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v14);
  }

  remoteControllerMap = self->_remoteControllerMap;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000A08CC;
  v27[3] = &unk_100918538;
  v27[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](remoteControllerMap, "enumerateKeysAndObjectsUsingBlock:", v27);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A08E0;
  v22[3] = &unk_100918560;
  v22[4] = self;
  v22[5] = &v23;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v22);
  if (dword_100977D88 <= 30 && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 30)))
  {
    v21 = -[NSMutableDictionary count](self->_remoteControllerMap, "count");
    LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon remoteControllersChanged]", 30, "Remote controllers updated: %d total, %d started, %d stopped", v21, *((_DWORD *)v24 + 6), v13);
  }
  _Block_object_dispose(&v23, 8);

}

- (void)deviceFound:(id)a3 remoteController:(id)a4
{
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  CBWHBAggregateDevice *v11;
  NSMutableDictionary *aggregateDeviceMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "controllerID"));
  v7 = (void *)v6;
  v8 = CFSTR("CBLocalHostID");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  if (dword_100977D88 <= 30 && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 30)))
    LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon deviceFound:remoteController:]", 30, "Device found: %@, CtID %@", v20, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stableIdentifier"));
  if (v10)
  {
    objc_msgSend(v20, "setLastSeenTicks:", mach_absolute_time());
    objc_msgSend(v20, "setRemoteHostID:", v9);
    v11 = (CBWHBAggregateDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateDeviceMap, "objectForKeyedSubscript:", v10));
    if (!v11)
    {
      v11 = objc_alloc_init(CBWHBAggregateDevice);
      aggregateDeviceMap = self->_aggregateDeviceMap;
      if (!aggregateDeviceMap)
      {
        v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v14 = self->_aggregateDeviceMap;
        self->_aggregateDeviceMap = v13;

        aggregateDeviceMap = self->_aggregateDeviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](aggregateDeviceMap, "setObject:forKeyedSubscript:", v11, v10);
    }
    v15 = (id)objc_claimAutoreleasedReturnValue(-[CBWHBAggregateDevice deviceControllerMap](v11, "deviceControllerMap"));
    if (!v15)
    {
      v15 = objc_alloc_init((Class)NSMutableDictionary);
      -[CBWHBAggregateDevice setDeviceControllerMap:](v11, "setDeviceControllerMap:", v15);
    }
    -[CBWHBRouter deviceFound:](self->_whbRouter, "deviceFound:", v20);
    if ((self->_aggregateDiscoveryFlags & 0x200100000) != 0
      && ((unint64_t)objc_msgSend(v20, "discoveryFlags") & 0x1400000) != 0
      && ((unint64_t)objc_msgSend(v20, "changeFlags") & 0x1000000000000) != 0
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v9)),
          v17 = objc_msgSend(v16, "isEquivalentToCBDevice:compareFlags:", v20, 1),
          v16,
          (v17 & 1) == 0))
    {
      -[CBWHBAggregateDevice setLatestDevice:](v11, "setLatestDevice:", v20);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, v9);
      v18 = objc_retainBlock(self->_deviceFoundHandler);
      v19 = v18;
      if (v18)
        (*((void (**)(id, id))v18 + 2))(v18, v20);

    }
  }

}

- (void)deviceLost:(id)a3 remoteController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controllerID"));
  v9 = (void *)v8;
  v10 = CFSTR("CBLocalHostID");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  if (dword_100977D88 <= 30 && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 30)))
    LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon deviceLost:remoteController:]", 30, "Device lost: %@, CtID %@", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stableIdentifier"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateDeviceMap, "objectForKeyedSubscript:", v12));
    v14 = v13;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceControllerMap"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v11));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v11);
      objc_msgSend(v16, "setRemoteHostID:", v11);
      -[CBWHBRouter deviceLost:](self->_whbRouter, "deviceLost:", v16);
      v17 = objc_retainBlock(self->_deviceLostHandler);
      v18 = v17;
      if (v17)
        (*((void (**)(id, void *))v17 + 2))(v17, v16);
      if (objc_msgSend(v15, "count"))
      {
        v21 = 0;
        v22 = &v21;
        v23 = 0x3032000000;
        v24 = sub_1000624DC;
        v25 = sub_100062328;
        v26 = 0;
        v20[0] = 0;
        v20[1] = v20;
        v20[2] = 0x2020000000;
        v20[3] = 0;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000A0F20;
        v19[3] = &unk_100918588;
        v19[4] = &v21;
        v19[5] = v20;
        objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v19);
        if (!v22[5]
          && dword_100977D88 <= 115
          && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 115)))
        {
          LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon deviceLost:remoteController:]", 115, "### No latest device: %@, CtID %@", v6, v11);
        }
        objc_msgSend(v14, "setLatestDevice:", v22[5]);
        _Block_object_dispose(v20, 8);
        _Block_object_dispose(&v21, 8);

      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_aggregateDeviceMap, "setObject:forKeyedSubscript:", 0, v12);
      }

    }
  }

}

- (id)localDeviceForStableId:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateDeviceMap, "objectForKeyedSubscript:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceControllerMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CBLocalHostID")));

  return v8;
}

- (id)optimalHostIdForStableId:(id)a3 result:(int *)a4
{
  id v6;
  CBWHBRouter *whbRouter;
  void *v8;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  whbRouter = self->_whbRouter;
  if (!a4 || whbRouter)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBRouter optimalWHBHostForStableIdentifier:result:](whbRouter, "optimalWHBHostForStableIdentifier:result:", v6, a4));
  }
  else
  {
    v8 = 0;
    *a4 = 1702;
  }

  return v8;
}

- (void)_receivedWHBUpdateEvent:(id)a3 options:(id)a4
{
  uint64_t v6;
  id v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  CBWHBRouter *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = RPOptionSenderIDSDeviceID;
  v7 = a4;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, v6, TypeID, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v10)
  {
    v11 = self->_whbRouter;
    if (v11)
    {
      if (dword_100977D88 <= 30
        && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 30)))
      {
        v12 = CUPrintNSObjectOneLine(v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon _receivedWHBUpdateEvent:options:]", 30, "WHB update received: Sender %@, %@", v10, v13);

      }
      -[CBWHBRouter receivedUpdateEvent:hostID:](v11, "receivedUpdateEvent:hostID:", v14, v10);
    }
    else if (dword_100977D88 <= 30
           && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 30)))
    {
      LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon _receivedWHBUpdateEvent:options:]", 30, "Ingoring WHB update with no router");
    }

  }
  else if (dword_100977D88 <= 90
         && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 90)))
  {
    LogPrintF_safe(&dword_100977D88, "-[CBWHBDiscoveryDaemon _receivedWHBUpdateEvent:options:]", 90, "### WHB update with no senderID");
  }

}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
  objc_storeStrong((id *)&self->_daemonServer, a3);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)discoveryArray
{
  return self->_discoveryArray;
}

- (void)setDiscoveryArray:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryArray, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (RPCompanionLinkClient)remoteClient
{
  return self->_remoteClient;
}

- (void)setRemoteClient:(id)a3
{
  objc_storeStrong((id *)&self->_remoteClient, a3);
}

- (CBWHBRouter)whbRouter
{
  return self->_whbRouter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whbRouter, 0);
  objc_storeStrong((id *)&self->_remoteClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryArray, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_remoteControllerMap, 0);
  objc_storeStrong((id *)&self->_localDiscovery, 0);
  objc_storeStrong((id *)&self->_aggregateDeviceMap, 0);
}

@end
