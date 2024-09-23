@implementation CBExtension

- (BOOL)triggerIfPending
{
  NSMutableDictionary *triggeredDeviceMap;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (self->_triggeredUI)
  {
    if (dword_100977690 <= 30
      && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
    {
      LogPrintF_safe(&dword_100977690, "-[CBExtension triggerIfPending]", 30, "CBExtension: UI already triggered: %@", self->_extensionID);
    }
    return 0;
  }
  else
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    triggeredDeviceMap = self->_triggeredDeviceMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100077748;
    v6[3] = &unk_100917198;
    v6[4] = self;
    v6[5] = &v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](triggeredDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v6);
    -[CBExtension _updateRSSIFilter](self, "_updateRSSIFilter");
    v4 = *((_BYTE *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  return v4;
}

- (void)_updateRSSIFilter
{
  CBDiscovery *discoveryClient;
  unint64_t v4;

  if (self->_allowRSSI
    && !self->_triggeredUI
    && (-[NSMutableDictionary count](self->_deviceMap, "count")
     || -[NSMutableDictionary count](self->_triggeredDeviceMap, "count")))
  {
    if (((unint64_t)-[CBDiscovery discoveryFlags](self->_discoveryClient, "discoveryFlags") & 0x200000000) == 0)
    {
      if (dword_100977690 <= 30
        && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
      {
        LogPrintF_safe(&dword_100977690, "-[CBExtension _updateRSSIFilter]", 30, "CBExtension: Enable RSSI: %@", self->_extensionID);
      }
      discoveryClient = self->_discoveryClient;
      v4 = (unint64_t)-[CBDiscovery discoveryFlags](discoveryClient, "discoveryFlags") | 0x200000000;
LABEL_18:
      -[CBDiscovery setDiscoveryFlags:](discoveryClient, "setDiscoveryFlags:", v4);
    }
  }
  else if (((unint64_t)-[CBDiscovery discoveryFlags](self->_discoveryClient, "discoveryFlags") & 0x200000000) != 0)
  {
    if (dword_100977690 <= 30
      && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
    {
      LogPrintF_safe(&dword_100977690, "-[CBExtension _updateRSSIFilter]", 30, "CBExtension: Disable RSSI: %@", self->_extensionID);
    }
    discoveryClient = self->_discoveryClient;
    v4 = (unint64_t)-[CBDiscovery discoveryFlags](discoveryClient, "discoveryFlags") & 0xFFFFFFFDFFFFFFFFLL;
    goto LABEL_18;
  }
}

- (id)description
{
  return -[CBExtension descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  id v6;
  NSString *extensionID;
  NSString *v8;
  id v9;
  CBDiscovery *discoveryClient;
  CBDiscovery *v11;
  id v12;
  const char *v13;
  id v14;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;

  v20 = 12;
  v19 = 0;
  v4 = objc_msgSend((id)objc_opt_class(self), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  CUAppendF(&v19, &v20, "%@", v5);
  v6 = v19;

  extensionID = self->_extensionID;
  if (extensionID)
  {
    v18 = v6;
    v8 = extensionID;
    CUAppendF(&v18, &v20, "%@", v8);
    v9 = v18;

    v6 = v9;
  }
  discoveryClient = self->_discoveryClient;
  if (discoveryClient)
  {
    v17 = v6;
    v11 = discoveryClient;
    CUAppendF(&v17, &v20, "%@", v11);
    v12 = v17;

    v6 = v12;
  }
  if (self->_allowRSSI)
    v13 = "yes";
  else
    v13 = "no";
  v16 = v6;
  CUAppendF(&v16, &v20, "AllowRSSI %s", v13);
  v14 = v16;

  return v14;
}

- (void)invalidate
{
  CBDiscovery *discoveryClient;
  int v4;
  CBDiscovery *v5;

  discoveryClient = self->_discoveryClient;
  if (discoveryClient)
  {
    if (dword_100977690 <= 30)
    {
      if (dword_100977690 != -1
        || (v4 = _LogCategory_Initialize(&dword_100977690, 30), discoveryClient = self->_discoveryClient, v4))
      {
        LogPrintF_safe(&dword_100977690, "-[CBExtension invalidate]", 30, "CBExtension: discovery stop: %@, %@", self->_extensionID, discoveryClient);
        discoveryClient = self->_discoveryClient;
      }
    }
    -[CBDiscovery invalidate](discoveryClient, "invalidate");
    v5 = self->_discoveryClient;
    self->_discoveryClient = 0;

  }
}

- (void)reset
{
  void *v3;
  id v4;
  __objc2_class *v5;
  id v6;
  uint64_t v7;
  int *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  int isa;
  NSString *extensionID;
  void *v15;
  uint64_t v16;
  void *v17;
  __objc2_class *v18;
  int *v19;
  NSString *v20;
  void *v21;
  int v22;
  NSString *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_triggeredDeviceMap, "allKeys"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v5 = &OBJC_METACLASS___BTVCLinkAdvertiseSet;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v26;
    v8 = &dword_100977690;
    do
    {
      v9 = 0;
      v24 = v6;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDeviceMap, "objectForKeyedSubscript:", v10));
        v12 = objc_msgSend(v11, "present");
        isa = (int)v5[42].isa;
        if (v12)
        {
          if (isa <= 30 && (isa != -1 || _LogCategory_Initialize(v8, 30)))
          {
            extensionID = self->_extensionID;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "device"));
            LogPrintF_safe(v8, "-[CBExtension reset]", 30, "CBExtension: reset triggered device: %@, %@", extensionID, v15);

          }
          objc_msgSend(v11, "setUiTicks:", 0);
        }
        else
        {
          if (isa <= 30 && (isa != -1 || _LogCategory_Initialize(v8, 30)))
          {
            v16 = v7;
            v17 = v3;
            v18 = v5;
            v19 = v8;
            v20 = self->_extensionID;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "device"));
            v23 = v20;
            v8 = v19;
            v5 = v18;
            v3 = v17;
            v7 = v16;
            v6 = v24;
            LogPrintF_safe(v8, "-[CBExtension reset]", 30, "CBExtension: remove triggered device: %@, %@", v23, v21);

          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggeredDeviceMap, "setObject:forKeyedSubscript:", 0, v10);
        }

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  if (self->_triggeredUI)
  {
    self->_triggeredUI = 0;
    v22 = (int)v5[42].isa;
    if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
      LogPrintF_safe(&dword_100977690, "-[CBExtension reset]", 30, "CBExtension: reset triggered UI: %@", self->_extensionID);
  }
  -[CBExtension _updateRSSIFilter](self, "_updateRSSIFilter");
}

- (void)updateWithXPCDiscoveryInfo:(id)a3
{
  id v4;
  CBDiscovery **p_discoveryClient;
  CBDiscovery *v6;
  CBDiscovery *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  CBDiscovery *v13;
  CBExtension *v14;
  _QWORD v15[4];
  CBDiscovery *v16;
  CBExtension *v17;
  _QWORD v18[4];
  id v19;
  CBExtension *v20;

  v4 = a3;
  p_discoveryClient = &self->_discoveryClient;
  v6 = self->_discoveryClient;
  v7 = v6;
  if (!v6)
  {
    v8 = objc_alloc_init((Class)CBDiscovery);
    objc_storeStrong((id *)&self->_discoveryClient, v8);
    objc_msgSend(v8, "setAppID:", self->_extensionID);
    objc_msgSend(v8, "setDispatchQueue:", self->_dispatchQueue);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100077BE4;
    v18[3] = &unk_1009171C0;
    v9 = v8;
    v19 = v9;
    v20 = self;
    objc_msgSend(v9, "setDeviceFoundHandler:", v18);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100077C00;
    v15[3] = &unk_1009171C0;
    v7 = (CBDiscovery *)v9;
    v16 = v7;
    v17 = self;
    -[CBDiscovery setDeviceLostHandler:](v7, "setDeviceLostHandler:", v15);

  }
  v10 = -[CBDiscovery updateWithXPCSubscriberInfo:](v7, "updateWithXPCSubscriberInfo:", v4);
  if ((-[CBDiscovery bleRSSIThresholdHint](*p_discoveryClient, "bleRSSIThresholdHint") & 0x80000000) == 0)
    -[CBDiscovery setBleRSSIThresholdHint:](*p_discoveryClient, "setBleRSSIThresholdHint:", 4294967226);
  if (v6)
  {
    if (v10)
    {
      if (dword_100977690 <= 30
        && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
      {
        LogPrintF_safe(&dword_100977690, "-[CBExtension updateWithXPCDiscoveryInfo:]", 30, "CBExtension: discovery updated: %@, %@", self->_extensionID, v7);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBExtensionsDaemon daemonServer](self->_extensionsDaemon, "daemonServer"));
      objc_msgSend(v11, "scheduleDiscoveryUpdateImmediate:", 0);

    }
    else if (dword_100977690 <= 20
           && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 20)))
    {
      LogPrintF_safe(&dword_100977690, "-[CBExtension updateWithXPCDiscoveryInfo:]", 20, "CBExtension: discovery unchanged: %@", self->_extensionID);
    }
  }
  else
  {
    if (dword_100977690 <= 30
      && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
    {
      LogPrintF_safe(&dword_100977690, "-[CBExtension updateWithXPCDiscoveryInfo:]", 30, "CBExtension: discovery starting: %@, %@", self->_extensionID, v7);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100077C1C;
    v12[3] = &unk_1009171E8;
    v13 = v7;
    v14 = self;
    -[CBDiscovery activateWithCompletion:](v13, "activateWithCompletion:", v12);

  }
  self->_allowRSSI = (-[CBDiscovery bleRSSIThresholdHint](self->_discoveryClient, "bleRSSIThresholdHint") & 0x80) != 0;
  -[CBExtension _updateRSSIFilter](self, "_updateRSSIFilter");

}

- (void)_deviceFound:(id)a3
{
  id v4;
  void *v5;
  signed int v6;
  signed int v7;
  CBTriggeredDevice *v8;
  NSMutableDictionary *triggeredDeviceMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  CBExtensionsDaemon *extensionsDaemon;
  unsigned __int8 v14;
  id v15;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  CBTriggeredDevice *v19;
  NSString *extensionID;
  void *v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSString *v27;
  uint64_t v28;
  void *v29;
  id v30;
  __CFString *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (v5)
  {
    v6 = objc_msgSend(v4, "rssi");
    v7 = -[CBDiscovery bleRSSIThresholdHint](self->_discoveryClient, "bleRSSIThresholdHint");
    if (v7 < 0 && (!v6 || v6 < v7))
    {
      if (dword_100977690 <= 30
        && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
      {
        LogPrintF_safe(&dword_100977690, "-[CBExtension _deviceFound:]", 30, "CBExtension: device found: out-of-range, %@, %@", self->_extensionID, v4);
      }
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v18 = self->_deviceMap;
        self->_deviceMap = v17;

        deviceMap = self->_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v4, v5);
      v19 = (CBTriggeredDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDeviceMap, "objectForKeyedSubscript:", v5));
      v8 = v19;
      if (v19)
      {
        -[CBTriggeredDevice setPresent:](v19, "setPresent:", 0);
        if (dword_100977690 <= 30
          && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
        {
          extensionID = self->_extensionID;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBTriggeredDevice device](v8, "device"));
          LogPrintF_safe(&dword_100977690, "-[CBExtension _deviceFound:]", 30, "CBExtension: reset old triggered device: %@, %@", extensionID, v21);

        }
      }
      -[CBExtension _updateRSSIFilter](self, "_updateRSSIFilter");
    }
    else
    {
      if (dword_100977690 <= 30
        && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
      {
        LogPrintF_safe(&dword_100977690, "-[CBExtension _deviceFound:]", 30, "CBExtension: device found: %@, %@", self->_extensionID, v4);
      }
      v8 = (CBTriggeredDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDeviceMap, "objectForKeyedSubscript:", v5));
      if (!v8)
      {
        v8 = objc_alloc_init(CBTriggeredDevice);
        triggeredDeviceMap = self->_triggeredDeviceMap;
        if (!triggeredDeviceMap)
        {
          v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v11 = self->_triggeredDeviceMap;
          self->_triggeredDeviceMap = v10;

          triggeredDeviceMap = self->_triggeredDeviceMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](triggeredDeviceMap, "setObject:forKeyedSubscript:", v8, v5);
      }
      -[CBTriggeredDevice setDevice:](v8, "setDevice:", v4);
      -[CBTriggeredDevice setPresent:](v8, "setPresent:", 1);
      v12 = mach_absolute_time();
      -[CBTriggeredDevice setTriggerTicks:](v8, "setTriggerTicks:", v12);
      if (-[CBTriggeredDevice uiTicks](v8, "uiTicks"))
      {
        if (dword_100977690 <= 30
          && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
        {
          v22 = self->_extensionID;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBTriggeredDevice device](v8, "device"));
          v24 = UpTicksToSecondsF(v12 - -[CBTriggeredDevice uiTicks](v8, "uiTicks"));
          v25 = CUPrintDurationDouble(v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          LogPrintF_safe(&dword_100977690, "-[CBExtension _deviceFound:]", 30, "CBExtension: ignore already-triggered device: %@, %@, %@ ago", v22, v23, v26);

        }
      }
      else if (self->_triggeredUI)
      {
        if (dword_100977690 <= 30
          && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
        {
          LogPrintF_safe(&dword_100977690, "-[CBExtension _deviceFound:]", 30, "CBExtension: UI already triggered: %@, %@", self->_extensionID, v4);
        }
      }
      else
      {
        v31 = CFSTR("unknown");
        if (-[CBExtensionsDaemon remoteAlertAllowedAndReturnReason:extension:](self->_extensionsDaemon, "remoteAlertAllowedAndReturnReason:extension:", &v31, self))
        {
          extensionsDaemon = self->_extensionsDaemon;
          v30 = 0;
          v14 = -[CBExtensionsDaemon remoteAlertStartWithCBExtension:device:error:](extensionsDaemon, "remoteAlertStartWithCBExtension:device:error:", self, v4, &v30);
          v15 = v30;
          if ((v14 & 1) != 0)
          {
            -[CBTriggeredDevice setUiTicks:](v8, "setUiTicks:", v12);
            self->_triggeredUI = 1;
            -[CBExtension _updateRSSIFilter](self, "_updateRSSIFilter");
          }
          else if (dword_100977690 <= 90
                 && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 90)))
          {
            v27 = self->_extensionID;
            v28 = CUPrintNSError(v15);
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            LogPrintF_safe(&dword_100977690, "-[CBExtension _deviceFound:]", 90, "### CBExtension: UI start failed: %@, %@", v27, v29);

          }
        }
        else if (dword_100977690 <= 30
               && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
        {
          LogPrintF_safe(&dword_100977690, "-[CBExtension _deviceFound:]", 30, "CBExtension: UI start not allowed: %@, %@", self->_extensionID, v31);
        }

      }
    }

  }
}

- (void)_deviceLost:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *extensionID;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = a3;
  if (dword_100977690 <= 30 && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
  {
    if (self->_triggeredUI)
      v5 = "yes";
    else
      v5 = "no";
    LogPrintF_safe(&dword_100977690, "-[CBExtension _deviceLost:]", 30, "CBExtension: device lost: %@, %@, triggered %s", self->_extensionID, v4, v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDeviceMap, "objectForKeyedSubscript:", v6));
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setPresent:", 0);
      -[CBExtension _updateRSSIFilter](self, "_updateRSSIFilter");
      if (self->_triggeredUI)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
        v12[0] = CFSTR("deviceIdentifier");
        v12[1] = CFSTR("extensionID");
        extensionID = (const __CFString *)self->_extensionID;
        if (!extensionID)
          extensionID = CFSTR("?");
        v13[0] = v6;
        v13[1] = extensionID;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
        objc_msgSend(v9, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.bluetooth.extensionDeviceLost"), 0, v11, 1);

      }
    }

  }
}

- (BOOL)allowRSSI
{
  return self->_allowRSSI;
}

- (void)setAllowRSSI:(BOOL)a3
{
  self->_allowRSSI = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMap, a3);
}

- (CBDiscovery)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryClient, a3);
}

- (NSDictionary)discoveryInfo
{
  return self->_discoveryInfo;
}

- (void)setDiscoveryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (CBExtensionsDaemon)extensionsDaemon
{
  return self->_extensionsDaemon;
}

- (void)setExtensionsDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_extensionsDaemon, a3);
}

- (NSString)extensionID
{
  return self->_extensionID;
}

- (void)setExtensionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (BOOL)screenLocked
{
  return self->_screenLocked;
}

- (void)setScreenLocked:(BOOL)a3
{
  self->_screenLocked = a3;
}

- (NSMutableDictionary)triggeredDeviceMap
{
  return self->_triggeredDeviceMap;
}

- (void)setTriggeredDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_triggeredDeviceMap, a3);
}

- (BOOL)triggeredUI
{
  return self->_triggeredUI;
}

- (void)setTriggeredUI:(BOOL)a3
{
  self->_triggeredUI = a3;
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_xpc_object)xpcDiscoveryInfo
{
  return self->_xpcDiscoveryInfo;
}

- (void)setXpcDiscoveryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_xpcDiscoveryInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcDiscoveryInfo, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_triggeredDeviceMap, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_extensionsDaemon, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryInfo, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
