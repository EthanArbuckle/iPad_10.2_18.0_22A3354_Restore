@implementation CBStackDeviceMonitorBTStack

- (void)_updateDevicesConnected
{
  int v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *__p;
  _BYTE *v21;
  uint64_t v22;
  _BYTE v23[128];

  __p = 0;
  v21 = 0;
  v22 = 0;
  if (qword_100977898 != -1)
    dispatch_once(&qword_100977898, &stru_100917630);
  v3 = sub_10006D830((uint64_t)off_100977890, &__p);
  if (v3)
  {
    if (dword_1009777C0 > 90)
      goto LABEL_12;
    if (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 90))
    {
      v4 = CUPrintErrorCode((v3 + 310000));
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updateDevicesConnected]", 90, "### GetConnectedDevices failed: %@", v5);

    }
  }
  if (dword_1009777C0 <= 30 && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30)))
    LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updateDevicesConnected]", 30, "Update devices: connected, classic, %zu total", (v21 - (_BYTE *)__p) >> 3);
LABEL_12:
  v6 = __p;
  v7 = v21;
  while (v6 != v7)
    -[CBStackDeviceMonitorBTStack _updateDeviceClassic:flags:](self, "_updateDeviceClassic:flags:", *v6++, 0x200000);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  if (qword_1009778A8 != -1)
    dispatch_once(&qword_1009778A8, &stru_100917650);
  v8 = sub_100069E14((uint64_t)off_1009778A0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      v10 += (int)v11;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[CBStackDeviceMonitorBTStack _updateDeviceBLE:flags:](self, "_updateDeviceBLE:flags:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), 0x200000);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v11);
  }

  v14 = -[CBStackDeviceMonitorBTStack _updatePowerSources](self, "_updatePowerSources");
  if (dword_1009777C0 <= 30)
  {
    v15 = v14;
    if (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30))
      LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updateDevicesConnected]", 30, "Update devices: connected, BLE, %d total, power sources %d", v10, v15);
  }
  if (__p)
  {
    v21 = __p;
    operator delete(__p);
  }
}

- (void)activate
{
  void *v2;
  NSObject *dispatchQueue;
  uint64_t v5;
  CUCoalescer *v6;
  id v7;
  NSObject *v8;
  _Unwind_Exception *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if (!self->_deviceFoundHandler)
  {
    FatalErrorF("CBStackDeviceMonitor: No deviceFoundHandler", a2);
    goto LABEL_19;
  }
  if (!self->_deviceLostHandler)
  {
LABEL_19:
    FatalErrorF("CBStackDeviceMonitor: No deviceLostHandler", a2);
    goto LABEL_20;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_20:
    FatalErrorF("CBStackDeviceMonitor: No dispatchQueue", a2);
LABEL_21:
    v9 = (_Unwind_Exception *)FatalErrorF("CBStackDeviceMonitor: Activate after invalidate", v5);

    _Unwind_Resume(v9);
  }
  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_invalidateCalled)
    goto LABEL_21;
  if (dword_1009777C0 <= 30 && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30)))
    LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack activate]", 30, "Activate");
  if (!self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BAA0);
    if (!qword_10097BAA8)
      operator new();
    sub_100078B14(qword_10097BAA8, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BAA0);
    self->_addedMonitor = 1;
  }
  v6 = self->_powerTimeRemainingCoalescer;
  if (!v6)
  {
    v7 = objc_alloc_init((Class)CUCoalescer);
    objc_storeStrong((id *)&self->_powerTimeRemainingCoalescer, v7);
    objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v7, "setMinDelay:", 1.0);
    objc_msgSend(v7, "setMaxDelay:", 5.0);
    objc_msgSend(v7, "setLeeway:", 1.0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100078D88;
    v11[3] = &unk_1009172A0;
    v11[4] = self;
    objc_msgSend(v7, "setActionHandler:", v11);
    v6 = (CUCoalescer *)v7;
  }
  if (self->_powerTimeRemainingToken == -1)
  {
    v8 = self->_dispatchQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100078DF8;
    v10[3] = &unk_1009172C8;
    v10[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.timeremaining", &self->_powerTimeRemainingToken, v8, v10);
  }
  -[CBStackDeviceMonitorBTStack updateDevices](self, "updateDevices");

}

- (void)_updateDevicesPaired
{
  int v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *__p;
  _BYTE *v19;
  uint64_t v20;
  _BYTE v21[128];

  __p = 0;
  v19 = 0;
  v20 = 0;
  if (qword_100977898 != -1)
    dispatch_once(&qword_100977898, &stru_100917630);
  v3 = sub_10006D888((uint64_t)off_100977890, (uint64_t **)&__p);
  if (v3)
  {
    if (dword_1009777C0 > 90)
      goto LABEL_12;
    if (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 90))
    {
      v4 = CUPrintErrorCode((v3 + 310000));
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updateDevicesPaired]", 90, "### GetPairedDevices failed: %@", v5);

    }
  }
  if (dword_1009777C0 <= 30 && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30)))
    LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updateDevicesPaired]", 30, "Update devices: paired, classic, %zu total", (v19 - (_BYTE *)__p) >> 3);
LABEL_12:
  v6 = __p;
  v7 = v19;
  while (v6 != v7)
    -[CBStackDeviceMonitorBTStack _updateDeviceClassic:flags:](self, "_updateDeviceClassic:flags:", *v6++, 0x800000);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_100917670);
  v8 = sub_10006A768(qword_1009778B0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      v10 += (int)v11;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CBStackDeviceMonitorBTStack _updateDeviceBLE:flags:](self, "_updateDeviceBLE:flags:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), 0x800000);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v11);
  }

  if (dword_1009777C0 <= 30 && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30)))
    LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updateDevicesPaired]", 30, "Update devices: paired, BLE, %d total", v10);
  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }
}

- (void)updateDevices
{
  unint64_t discoveryFlags;
  NSMutableDictionary *deviceMap;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _BYTE v18[128];

  if (self->_addedMonitor)
  {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_deviceMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100917308);
    discoveryFlags = self->_discoveryFlags;
    if ((discoveryFlags & 0x800000) != 0)
    {
      -[CBStackDeviceMonitorBTStack _updateDevicesPaired](self, "_updateDevicesPaired");
      discoveryFlags = self->_discoveryFlags;
    }
    if ((discoveryFlags & 0x200000) != 0)
      -[CBStackDeviceMonitorBTStack _updateDevicesConnected](self, "_updateDevicesConnected");
    deviceMap = self->_deviceMap;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100079388;
    v17[3] = &unk_100917330;
    v17[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v17);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceMap, "allKeys"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v9));
          if (((unint64_t)objc_msgSend(v10, "discoveryFlags") & 0xA00000) == 0)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v9);
            if (dword_1009777C0 <= 30
              && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30)))
            {
              LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack updateDevices]", 30, "Device lost: %@", v10);
            }
            v11 = objc_retainBlock(self->_deviceLostHandler);
            v12 = v11;
            if (v11)
              (*((void (**)(id, void *))v11 + 2))(v11, v10);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v6);
    }

  }
}

- (int)_updatePowerSources
{
  uint64_t v3;
  const void *v4;
  CFArrayRef v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  void (**v9)(_QWORD);
  const void *ValueAtIndex;
  CFDictionaryRef v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _QWORD *v19;
  int v20;
  _QWORD *v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v3 = IOPSCopyPowerSourcesByType(4, a2);
  if (v3)
  {
    v4 = (const void *)v3;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100067144;
    v23[3] = &unk_100917378;
    v23[4] = v3;
    v21 = objc_retainBlock(v23);
    v5 = IOPSCopyPowerSourcesList(v4);
    v6 = v5;
    if (v5)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10006713C;
      v22[3] = &unk_100917378;
      v22[4] = v5;
      v19 = objc_retainBlock(v22);
      Count = CFArrayGetCount(v6);
      if (Count < 1)
      {
        v20 = 0;
        v9 = (void (**)(_QWORD))v21;
      }
      else
      {
        v8 = 0;
        v20 = 0;
        v9 = (void (**)(_QWORD))v21;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, v8);
          v11 = IOPSGetPowerSourceDescription(v4, ValueAtIndex);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          v13 = v12;
          if (v12)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Accessory Identifier")));
            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v14));
              v16 = v15;
              if (v15 && (objc_msgSend(v15, "connectedServices") & 0x400000) != 0)
              {
                objc_msgSend(v16, "setChangeFlags:", (unint64_t)objc_msgSend(v16, "changeFlags") | (unint64_t)objc_msgSend(v16, "updateWithPowerSourceDescription:", v13));
                ++v20;
              }

              v9 = (void (**)(_QWORD))v21;
            }

          }
          else if (dword_1009777C0 <= 90
                 && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 90)))
          {
            LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updatePowerSources]", 90, "### Get power source desc failed");
          }

          ++v8;
        }
        while (Count != v8);
      }
      ((void (*)(_QWORD *))v19[2])(v19);

      v17 = v20;
    }
    else
    {
      if (dword_1009777C0 <= 90
        && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 90)))
      {
        LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updatePowerSources]", 90, "### Get power source array failed");
      }
      v17 = 0;
      v9 = (void (**)(_QWORD))v21;
    }
    v9[2](v9);

  }
  else
  {
    if (dword_1009777C0 <= 90
      && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 90)))
    {
      LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updatePowerSources]", 90, "### Get power sources info failed");
    }
    return 0;
  }
  return v17;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (CBStackDeviceMonitorBTStack)init
{
  CBStackDeviceMonitorBTStack *v2;
  CBStackDeviceMonitorBTStack *v3;
  CBStackDeviceMonitorBTStack *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBStackDeviceMonitorBTStack;
  v2 = -[CBStackDeviceMonitorBTStack init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_powerTimeRemainingToken = -1;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  return -[CBStackDeviceMonitorBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *deviceMap;
  unint64_t v14;
  BOOL v15;
  char *v16;
  id *v17;
  id v18;
  id obj;
  _QWORD v20[6];
  unsigned int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v5 = (char *)-[NSMutableDictionary count](self->_deviceMap, "count");
  if (v4 < 0x15)
  {
    v27 = 0;
    v28 = (id *)&v27;
    v29 = 0x3032000000;
    v30 = sub_10006246C;
    v31 = sub_1000622F0;
    v32 = 0;
    v26 = 0;
    v11 = CUPrintFlags64(self->_discoveryFlags, &unk_10073751E);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    NSAppendPrintF_safe(&v26, "== CBStackDeviceMonitor: DF %@, Devices %d ==\n", v12, v5);
    objc_storeStrong(&v32, v26);

    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    deviceMap = self->_deviceMap;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100078A50;
    v20[3] = &unk_100917278;
    v20[4] = &v27;
    v20[5] = &v22;
    v21 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v20);
    v14 = v23[3];
    v15 = (unint64_t)v5 >= v14;
    v16 = &v5[-v14];
    if (v16 != 0 && v15)
    {
      v17 = v28;
      obj = v28[5];
      NSAppendPrintF_safe(&obj, "... %d more, %d total\n", (_DWORD)v16, (_DWORD)v5);
      objc_storeStrong(v17 + 5, obj);
    }
    v18 = v28[5];
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v27, 8);

    return v18;
  }
  else
  {
    v6 = CUPrintFlags64(self->_discoveryFlags, &unk_10073751E);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = NSPrintF_safe("CBStackDeviceMonitor: DF %@, Devices %d", v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    return v9;
  }
}

- (void)invalidate
{
  int powerTimeRemainingToken;
  CUCoalescer *powerTimeRemainingCoalescer;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1009777C0 <= 30
      && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30)))
    {
      LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack invalidate]", 30, "Invalidate");
    }
    powerTimeRemainingToken = self->_powerTimeRemainingToken;
    if (powerTimeRemainingToken != -1)
    {
      notify_cancel(powerTimeRemainingToken);
      self->_powerTimeRemainingToken = -1;
    }
    -[CUCoalescer invalidate](self->_powerTimeRemainingCoalescer, "invalidate");
    powerTimeRemainingCoalescer = self->_powerTimeRemainingCoalescer;
    self->_powerTimeRemainingCoalescer = 0;

    if (self->_addedMonitor)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BAA0);
      if (qword_10097BAA8)
        sub_100078F64(qword_10097BAA8, self);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BAA0);
      self->_addedMonitor = 0;
    }
    -[CBStackDeviceMonitorBTStack _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  id deviceFoundHandler;
  id deviceLostHandler;
  id invalidationHandler;
  void (**v6)(void);

  if (!self->_invalidateDone)
  {
    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v6)
      v6[2]();
    self->_invalidateDone = 1;
    if (dword_1009777C0 <= 30
      && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30)))
    {
      LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _invalidated]", 30, "Invalidated");
    }

  }
}

- (void)localDeviceEvent:(int)a3
{
  if (self->_addedMonitor)
  {
    if (a3 == 4)
    {
      if ((self->_discoveryFlags & 0x800000) != 0)
      {
        if (dword_1009777C0 <= 30
          && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30)))
        {
          LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack localDeviceEvent:]", 30, "Pairing status changed");
        }
        goto LABEL_16;
      }
    }
    else if (a3 == 5 && (self->_discoveryFlags & 0x200000) != 0)
    {
      if (dword_1009777C0 <= 30
        && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 30)))
      {
        LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack localDeviceEvent:]", 30, "Connection status changed");
      }
LABEL_16:
      -[CBStackDeviceMonitorBTStack updateDevices](self, "updateDevices");
    }
  }
}

- (void)_updateDeviceBLE:(id)a3 flags:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (qword_1009778C8 != -1)
    dispatch_once(&qword_1009778C8, &stru_100917690);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007972C;
  v13[3] = &unk_100917358;
  v13[4] = &v14;
  if (sub_10065E6EC((uint64_t)off_1009778C0, v6, v13) && v15[3])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v7));
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      v8 = objc_alloc_init((Class)CBDevice);
      objc_msgSend(v8, "setIdentifier:", v7);
      objc_msgSend(v8, "setInternalFlags:", 4);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v12 = self->_deviceMap;
        self->_deviceMap = v11;

        deviceMap = self->_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v8, v7);
      v9 = 0x4000000;
    }
    objc_msgSend(v8, "setChangeFlags:", (unint64_t)objc_msgSend(v8, "updateWithBLEDevice:btAddr:", v6, v15[3]) | v9 | (unint64_t)objc_msgSend(v8, "changeFlags"));
    objc_msgSend(v8, "setDiscoveryFlags:", (unint64_t)objc_msgSend(v8, "discoveryFlags") | a4);

  }
  _Block_object_dispose(&v14, 8);

}

- (void)_updateDeviceClassic:(void *)a3 flags:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v19;
  NSMutableDictionary **p_deviceMap;
  NSMutableDictionary *v21;
  _QWORD v22[2];

  v7 = *((unsigned __int8 *)a3 + 128);
  v8 = *((unsigned __int8 *)a3 + 129);
  v9 = *((unsigned __int8 *)a3 + 130);
  v10 = *((unsigned __int8 *)a3 + 131);
  v11 = *((unsigned __int8 *)a3 + 132);
  v12 = *((unsigned __int8 *)a3 + 133);
  if (qword_1009778C8 != -1)
    dispatch_once(&qword_1009778C8, &stru_100917690);
  v22[0] = 0;
  v22[1] = 0;
  sub_10003F924((uint64_t)off_1009778C0, (v7 << 40) | (v8 << 32) | (v9 << 24) | (v10 << 16) | (v11 << 8) | v12, 1u, 1u, 0, 0, (unsigned __int8 *)v22);
  v13 = sub_100030DF4((const unsigned __int8 *)v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
  if (v15)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v15));
    if (v16)
    {
      v17 = 0;
    }
    else
    {
      v16 = objc_alloc_init((Class)CBDevice);
      objc_msgSend(v16, "setIdentifier:", v15);
      objc_msgSend(v16, "setInternalFlags:", 4);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v21 = self->_deviceMap;
        p_deviceMap = &self->_deviceMap;
        *p_deviceMap = v19;

        deviceMap = *p_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v16, v15);
      v17 = 0x4000000;
    }
    objc_msgSend(v16, "setChangeFlags:", (unint64_t)objc_msgSend(v16, "updateWithClassicDevice:deviceUUID:", a3, v14) | v17 | (unint64_t)objc_msgSend(v16, "changeFlags"));
    objc_msgSend(v16, "setDiscoveryFlags:", (unint64_t)objc_msgSend(v16, "discoveryFlags") | a4);

  }
  else if (dword_1009777C0 <= 90
         && (dword_1009777C0 != -1 || _LogCategory_Initialize(&dword_1009777C0, 90)))
  {
    LogPrintF_safe(&dword_1009777C0, "-[CBStackDeviceMonitorBTStack _updateDeviceClassic:flags:]", 90, "### Get identifier failed");
  }

}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_powerTimeRemainingCoalescer, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
}

@end
