@implementation SDProximityPairingAgent

+ (SDProximityPairingAgent)sharedProximityPairingAgent
{
  if (qword_1007C6878 != -1)
    dispatch_once(&qword_1007C6878, &stru_100717318);
  return (SDProximityPairingAgent *)(id)qword_1007C6880;
}

- (SDProximityPairingAgent)init
{
  SDProximityPairingAgent *v2;
  uint64_t v3;
  SDProximityPairingAgent *v4;
  uint64_t v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  _TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient *v8;
  _TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient *headphoneProxFeatureClient;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SDProximityPairingAgent;
  v2 = -[SDProximityPairingAgent init](&v11, "init");
  v4 = v2;
  if (v2)
  {
    v5 = SFMainQueue(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v6;

    -[SDProximityPairingAgent setBufferedDevicesPurgeBlock:](v4, "setBufferedDevicesPurgeBlock:", 0);
    v8 = objc_alloc_init(_TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient);
    headphoneProxFeatureClient = v4->_headphoneProxFeatureClient;
    v4->_headphoneProxFeatureClient = v8;

    -[HeadphoneProxFeatureClient setDelegate:](v4->_headphoneProxFeatureClient, "setDelegate:", v4);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  SDProximityPairingAgent *v5;
  SEL v6;
  objc_super v7;

  if (self->_deviceDiscovery)
  {
    v5 = (SDProximityPairingAgent *)FatalErrorF("Discovery still active during dealloc", a2);
    -[SDProximityPairingAgent description](v5, v6);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent bufferedDevicesPurgeBlock](self, "bufferedDevicesPurgeBlock"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent bufferedDevicesPurgeBlock](self, "bufferedDevicesPurgeBlock"));
      dispatch_block_cancel(v4);

      -[SDProximityPairingAgent setBufferedDevicesPurgeBlock:](self, "setBufferedDevicesPurgeBlock:", 0);
    }
    v7.receiver = self;
    v7.super_class = (Class)SDProximityPairingAgent;
    -[SDProximityPairingAgent dealloc](&v7, "dealloc");
  }
}

- (NSString)description
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  int autoPairRSSI;
  int autoStatusRSSI;
  int exitRSSI;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  SFDeviceDiscovery *deviceDiscovery;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  NSMutableDictionary *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *j;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  NSMutableSet *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *obj;
  id obja;
  NSMutableDictionary *objb;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  id v85;
  id v86;
  id v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];

  v87 = 0;
  NSAppendPrintF(&v87, "-- SDProximityPairingAgent --\n");
  v3 = v87;
  v86 = v3;
  if (self->_enabled)
    v4 = "yes";
  else
    v4 = "no";
  v5 = " (always)";
  if (!self->_scanAlways)
    v5 = "";
  v61 = v5;
  obj = v4;
  if (self->_autoPairEnabled)
    v6 = "yes";
  else
    v6 = "no";
  if (self->_autoStatusEnabled)
    v7 = "yes";
  else
    v7 = "no";
  if (self->_autoStatusUnpaired)
    v8 = "yes";
  else
    v8 = "no";
  autoPairRSSI = self->_autoPairRSSI;
  autoStatusRSSI = self->_autoStatusRSSI;
  exitRSSI = self->_exitRSSI;
  v12 = -[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags");
  v13 = 79;
  if (!self->_fastScanStatusOthers)
    v13 = 111;
  v14 = 77;
  if (!self->_fastScanStatusMine)
    v14 = 109;
  v15 = 80;
  if (!self->_fastScanPair)
    v15 = 115;
  v16 = 65;
  if (!self->_fastScanAlways)
    v16 = 97;
  v17 = 89;
  if (!self->_fastScanTimer)
    v17 = 110;
  NSAppendPrintF(&v86, "Enabled %s%s, Pair %s (%d), Status %s (%d), Exit %d, Unpaired %s, SystemUI 0x%X, Fast %c%c%c%c%c\n", obj, v61, v6, autoPairRSSI, v7, autoStatusRSSI, exitRSSI, v8, v12, v17, v16, v15, v14, v13);
  obja = v86;

  v85 = obja;
  if (self->_pairingAlertHandle)
    v18 = "yes";
  else
    v18 = "no";
  if (self->_statusAlertHandle)
    v19 = "yes";
  else
    v19 = "no";
  v60 = v19;
  v62 = v18;
  v59 = -[NSMutableSet count](self->_bluetoothUserInteractionClients, "count");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v21 = objc_msgSend(v20, "bleProximityRSSIThreshold:", CFSTR("ppEn"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v23 = objc_msgSend(v22, "bleProximityRSSIThreshold:", CFSTR("ppEx"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v25 = objc_msgSend(v24, "bleProximityRSSIThreshold:", CFSTR("ppRp"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v27 = objc_msgSend(v26, "bleProximityRSSIThreshold:", CFSTR("psEn"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  NSAppendPrintF(&v85, "PairUI %s, StatusUI %s, BTUser %ld, RSSI Pair %ld|%ld, Repair %ld, Status %ld|%ld\n", v62, v60, v59, v21, v23, v25, v27, objc_msgSend(v28, "bleProximityRSSIThreshold:", CFSTR("psEx")));
  v29 = v85;

  v84 = v29;
  if (self->_deviceDiscovery)
    deviceDiscovery = self->_deviceDiscovery;
  else
    deviceDiscovery = (SFDeviceDiscovery *)CFSTR("off");
  NSAppendPrintF(&v84, "Device Discovery: %@, %ld devices, %ld triggered\n", deviceDiscovery, -[NSMutableDictionary count](self->_devices, "count"), -[NSMutableDictionary count](self->_triggeredDevices, "count"));
  v31 = v84;

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  objb = self->_devices;
  v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v81 != v34)
          objc_enumerationMutation(objb);
        v36 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
        v79 = v31;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v36));
        NSAppendPrintF(&v79, "    %@", v37);
        v38 = v79;

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v36));
        if (v39)
        {
          v78 = v38;
          NSAppendPrintF(&v78, ", triggered");
          v40 = v78;

          v38 = v40;
        }
        v77 = v38;
        NSAppendPrintF(&v77, "\n");
        v31 = v77;

      }
      v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    }
    while (v33);
  }

  v76 = 0u;
  v74 = 0u;
  v75 = 0u;
  v73 = 0u;
  v41 = self->_triggeredDevices;
  v42 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(_QWORD *)v74 != v44)
          objc_enumerationMutation(v41);
        v46 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v46));

        if (!v47)
        {
          v72 = v31;
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v46));
          NSAppendPrintF(&v72, "    Orphaned triggered device: %@", v48);
          v49 = v72;

          v31 = v49;
        }
      }
      v43 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
    }
    while (v43);
  }

  v71 = v31;
  NSAppendPrintF(&v71, "PowerSources: %d\n", -[NSMutableSet count](self->_powerSourceContainers, "count"));
  v50 = v71;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v51 = self->_powerSourceContainers;
  v52 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v68;
    do
    {
      v55 = 0;
      v56 = v50;
      do
      {
        if (*(_QWORD *)v68 != v54)
          objc_enumerationMutation(v51);
        v57 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v55);
        v66 = v56;
        NSAppendPrintF(&v66, "    %@\n", v57);
        v50 = v66;

        v55 = (char *)v55 + 1;
        v56 = v50;
      }
      while (v53 != v55);
      v53 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
    }
    while (v53);
  }

  return (NSString *)v50;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D961C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  SDProximityPairingBufferedScanner *v3;
  SDProximityPairingBufferedScanner *proximityPairingBufferedScanner;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B15E0 <= 30 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _activate]", 30, "Activate\n");
  -[SDProximityPairingAgent prefsChanged](self, "prefsChanged");
  if (self->_enabled && !self->_proximityPairingBufferedScanner)
  {
    v3 = -[SDProximityPairingBufferedScanner initWithQueue:]([SDProximityPairingBufferedScanner alloc], "initWithQueue:", self->_dispatchQueue);
    proximityPairingBufferedScanner = self->_proximityPairingBufferedScanner;
    self->_proximityPairingBufferedScanner = v3;

    location = 0;
    objc_initWeak(&location, self);
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_1000D976C;
    v8 = &unk_100717340;
    objc_copyWeak(&v9, &location);
    -[SDProximityPairingBufferedScanner setBufferedDeviceFoundHandler:](self->_proximityPairingBufferedScanner, "setBufferedDeviceFoundHandler:", &v5);
    -[SDProximityPairingBufferedScanner ensureStarted](self->_proximityPairingBufferedScanner, "ensureStarted", v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D980C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B15E0 <= 30 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _invalidate]", 30, "Invalidate\n");
  -[SDProximityPairingAgent _ensureStopped](self, "_ensureStopped");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent bufferedDevicesPurgeBlock](self, "bufferedDevicesPurgeBlock"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent bufferedDevicesPurgeBlock](self, "bufferedDevicesPurgeBlock"));
    dispatch_block_cancel(v4);

    -[SDProximityPairingAgent setBufferedDevicesPurgeBlock:](self, "setBufferedDevicesPurgeBlock:", 0);
  }
}

- (void)_accountSettingsChanged
{
  if (dword_1007B15E0 <= 30 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _accountSettingsChanged]", 30, "Account settings changed");
  -[SDProximityPairingAgent _resetTriggers](self, "_resetTriggers");
}

- (void)bluetoothUserInteractionStart:(id)a3
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
  v7[2] = sub_1000D99C0;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)bluetoothUserInteractionStop:(id)a3
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
  v7[2] = sub_1000D9AF8;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)prefsChanged
{
  uint64_t Int64;
  BOOL v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t autoPairRSSI;
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
  uint64_t v26;
  uint64_t autoStatusRSSI;
  uint64_t v28;
  BOOL v29;
  _BOOL4 v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v36;
  uint64_t exitRSSI;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  BOOL v44;
  _BOOL4 v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  BOOL v49;
  _BOOL4 v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  BOOL v54;
  _BOOL4 v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  BOOL v59;
  _BOOL4 v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  _BOOL4 v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  int v68;

  v68 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppAutoPairEnabled"), &v68);
  if (v68)
    v4 = 0;
  else
    v4 = Int64 == 0;
  v5 = !v4;
  if (self->_autoPairEnabled != v5)
  {
    if (dword_1007B15E0 <= 40
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40)))
    {
      v6 = "yes";
      if (v5)
        v7 = "no";
      else
        v7 = "yes";
      if (!v5)
        v6 = "no";
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Auto Pair Enabled: %s -> %s\n", v7, v6);
    }
    self->_autoPairEnabled = v5;
  }
  v8 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppPairRSSI"), &v68);
  if (v8 <= 999 && v8 >= -999 && v68 == 0)
    v11 = v8;
  else
    v11 = 0;
  autoPairRSSI = self->_autoPairRSSI;
  if (v11 != autoPairRSSI)
  {
    if (dword_1007B15E0 <= 40)
    {
      if (dword_1007B15E0 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B15E0, 40))
          goto LABEL_32;
        LODWORD(autoPairRSSI) = self->_autoPairRSSI;
      }
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Auto Pair RSSI: %d -> %lld\n", autoPairRSSI, v11);
    }
LABEL_32:
    self->_autoPairRSSI = v11;
  }
  v13 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppAutoStatusEnabled"), &v68);
  if (v68)
    v14 = 0;
  else
    v14 = v13 == 0;
  v15 = !v14;
  if (self->_autoStatusEnabled != v15)
  {
    if (dword_1007B15E0 <= 40
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40)))
    {
      v16 = "yes";
      if (v15)
        v17 = "no";
      else
        v17 = "yes";
      if (!v15)
        v16 = "no";
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Auto Status Enabled: %s -> %s\n", v17, v16);
    }
    self->_autoStatusEnabled = v15;
  }
  v18 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppAutoStatusUnpaired"), &v68);
  if (v68)
    v19 = 0;
  else
    v19 = v18 == 0;
  v20 = !v19;
  if (self->_autoStatusUnpaired != v20)
  {
    if (dword_1007B15E0 <= 40
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40)))
    {
      v21 = "yes";
      if (v20)
        v22 = "no";
      else
        v22 = "yes";
      if (!v20)
        v21 = "no";
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Auto Status Unpaired: %s -> %s\n", v22, v21);
    }
    self->_autoStatusUnpaired = v20;
  }
  v23 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppStatusRSSI"), &v68);
  if (v23 <= 999 && v23 >= -999 && v68 == 0)
    v26 = v23;
  else
    v26 = 0;
  autoStatusRSSI = self->_autoStatusRSSI;
  if (v26 != autoStatusRSSI)
  {
    if (dword_1007B15E0 <= 40)
    {
      if (dword_1007B15E0 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B15E0, 40))
          goto LABEL_81;
        LODWORD(autoStatusRSSI) = self->_autoStatusRSSI;
      }
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Auto Status RSSI: %d -> %lld\n", autoStatusRSSI, v26);
    }
LABEL_81:
    self->_autoStatusRSSI = v26;
  }
  v28 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppEnabled"), &v68);
  if (v68)
    v29 = 0;
  else
    v29 = v28 == 0;
  v30 = !v29;
  if (self->_enabled != v30)
  {
    if (dword_1007B15E0 <= 40
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40)))
    {
      v31 = "yes";
      if (v30)
        v32 = "no";
      else
        v32 = "yes";
      if (!v30)
        v31 = "no";
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Enabled: %s -> %s\n", v32, v31);
    }
    self->_enabled = v30;
  }
  v33 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppExitRSSI"), &v68);
  if (v33 <= 999 && v33 >= -999 && v68 == 0)
    v36 = v33;
  else
    v36 = 0;
  exitRSSI = self->_exitRSSI;
  if (v36 != exitRSSI)
  {
    if (dword_1007B15E0 <= 40)
    {
      if (dword_1007B15E0 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B15E0, 40))
          goto LABEL_113;
        LODWORD(exitRSSI) = self->_exitRSSI;
      }
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Exit RSSI: %d -> %lld\n", exitRSSI, v36);
    }
LABEL_113:
    self->_exitRSSI = v36;
  }
  v38 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppFastScanAlways"), 0);
  v39 = v38 != 0;
  if (self->_fastScanAlways != v39)
  {
    if (dword_1007B15E0 <= 40)
    {
      v40 = v38;
      if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40))
      {
        v41 = "yes";
        if (v40)
          v42 = "no";
        else
          v42 = "yes";
        if (!v40)
          v41 = "no";
        LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Fast Scan Always: %s -> %s\n", v42, v41);
      }
    }
    self->_fastScanAlways = v39;
  }
  v43 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppFastScanPair"), &v68);
  if (v68)
    v44 = 0;
  else
    v44 = v43 == 0;
  v45 = !v44;
  if (self->_fastScanPair != v45)
  {
    if (dword_1007B15E0 <= 40
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40)))
    {
      v46 = "yes";
      if (v45)
        v47 = "no";
      else
        v47 = "yes";
      if (!v45)
        v46 = "no";
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Fast Scan Pair: %s -> %s\n", v47, v46);
    }
    self->_fastScanPair = v45;
  }
  v48 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppFastScanStatusMine"), &v68);
  if (v68)
    v49 = 0;
  else
    v49 = v48 == 0;
  v50 = !v49;
  if (self->_fastScanStatusMine != v50)
  {
    if (dword_1007B15E0 <= 40
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40)))
    {
      v51 = "yes";
      if (v50)
        v52 = "no";
      else
        v52 = "yes";
      if (!v50)
        v51 = "no";
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Fast Scan Status Mine: %s -> %s\n", v52, v51);
    }
    self->_fastScanStatusMine = v50;
  }
  v53 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppFastScanStatusOthers"), &v68);
  if (v68)
    v54 = 0;
  else
    v54 = v53 == 0;
  v55 = !v54;
  if (self->_fastScanStatusOthers != v55)
  {
    if (dword_1007B15E0 <= 40
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40)))
    {
      v56 = "yes";
      if (v55)
        v57 = "no";
      else
        v57 = "yes";
      if (!v55)
        v56 = "no";
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Fast Scan Status Others: %s -> %s\n", v57, v56);
    }
    self->_fastScanStatusOthers = v55;
  }
  v58 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppPhoneOnly"), &v68);
  if (v68)
    v59 = 1;
  else
    v59 = v58 == 0;
  v60 = !v59;
  if (self->_phoneOnly != v60)
  {
    if (dword_1007B15E0 <= 40
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40)))
    {
      v61 = "yes";
      if (v60)
        v62 = "no";
      else
        v62 = "yes";
      if (!v60)
        v61 = "no";
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Phone only: %s -> %s\n", v62, v61);
    }
    self->_phoneOnly = v60;
  }
  v63 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppScanAlways"), 0);
  v64 = v63 != 0;
  if (self->_scanAlways != v64)
  {
    if (dword_1007B15E0 <= 40)
    {
      v65 = v63;
      if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 40))
      {
        v66 = "yes";
        if (v65)
          v67 = "no";
        else
          v67 = "yes";
        if (!v65)
          v66 = "no";
        LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent prefsChanged]", 40, "Scan Always: %s -> %s\n", v67, v66);
      }
    }
    self->_scanAlways = v64;
  }
  -[SDProximityPairingAgent _update](self, "_update");
}

- (BOOL)reenableProxCardType:(unsigned __int8)a3
{
  int v3;
  const char *v4;

  v3 = a3;
  if (a3 == 102)
  {
    self->_triggeredB389Setup = 0;
  }
  else
  {
    if (a3 != 101)
      return 0;
    -[SDProximityPairingAgent _removeB389sFromTriggeredDevices](self, "_removeB389sFromTriggeredDevices");
  }
  if (dword_1007B15E0 <= 30 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
  {
    v4 = "?";
    if (v3 == 101)
      v4 = "B389SetupFromFindMy";
    if (v3 == 102)
      v4 = "B389SetupDone";
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent reenableProxCardType:]", 30, "Re-enabled prox card type %s\n", v4);
  }
  return 1;
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_enabled && (!self->_phoneOnly || SFIsDevicePhone()))
    -[SDProximityPairingAgent _ensureStarted](self, "_ensureStarted");
  else
    -[SDProximityPairingAgent _ensureStopped](self, "_ensureStopped");
}

- (void)_ensureStarted
{
  SDStatusMonitor *v3;
  SDStatusMonitor *statusMonitor;
  void *v5;
  CUSystemMonitor *v6;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v8;
  SDProximityController *v9;
  SDProximityController *proximityController;
  SDProximityPairingBufferedScanner *v11;
  NSMutableDictionary *bufferedDevices;
  SFDeviceDiscovery *v13;
  SFDeviceDiscovery *deviceDiscovery;
  uint64_t v15;
  uint64_t v16;
  SDProximityPairingBufferedScanner *proximityPairingBufferedScanner;
  BOOL v18;
  SFDeviceDiscovery *v19;
  SBSRemoteAlertHandle *pairingAlertHandle;
  SBSRemoteAlertHandle *v21;
  SBSRemoteAlertHandle *statusAlertHandle;
  SBSRemoteAlertHandle *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_statusMonitor)
  {
    v3 = (SDStatusMonitor *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_screenStateChanged", CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);

  }
  if (!self->_systemMonitor)
  {
    v6 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v6;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000DA95C;
    v30[3] = &unk_1007146D8;
    v30[4] = self;
    -[CUSystemMonitor setManateeChangedHandler:](self->_systemMonitor, "setManateeChangedHandler:", v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000DA964;
    v29[3] = &unk_1007146D8;
    v29[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v29);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000DA96C;
    v28[3] = &unk_1007146D8;
    v28[4] = self;
    -[CUSystemMonitor setSystemLockStateChangedHandler:](self->_systemMonitor, "setSystemLockStateChangedHandler:", v28);
    v8 = self->_systemMonitor;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000DA974;
    v27[3] = &unk_1007146D8;
    v27[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v8, "activateWithCompletion:", v27);
  }
  if (self->_forceFastScan || self->_scanAlways || -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (!self->_proximityController)
    {
      v9 = (SDProximityController *)objc_claimAutoreleasedReturnValue(+[SDProximityController sharedController](SDProximityController, "sharedController"));
      proximityController = self->_proximityController;
      self->_proximityController = v9;

    }
    if (!self->_deviceDiscovery)
    {
      if (dword_1007B15E0 <= 30
        && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
      {
        LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _ensureStarted]", 30, "Discovery start\n");
      }
      v13 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
      deviceDiscovery = self->_deviceDiscovery;
      self->_deviceDiscovery = v13;

      -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 13);
      -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", 2);
      -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", self->_forceFastScan);
      -[SFDeviceDiscovery setPurpose:](self->_deviceDiscovery, "setPurpose:", CFSTR("PPA"));
      if (self->_forceFastScan)
        v15 = -80;
      else
        v15 = -60;
      -[SFDeviceDiscovery setRssiThreshold:](self->_deviceDiscovery, "setRssiThreshold:", v15);
      if (self->_fastScanAlways)
      {
        v16 = 50;
      }
      else if (self->_forceFastScan)
      {
        v16 = 50;
      }
      else
      {
        v16 = 20;
      }
      -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", v16);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000DA97C;
      v26[3] = &unk_100714FD8;
      v26[4] = self;
      -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v26);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000DA988;
      v25[3] = &unk_100714FD8;
      v25[4] = self;
      -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v25);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000DA994;
      v24[3] = &unk_100715000;
      v24[4] = self;
      -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v24);
      -[SFDeviceDiscovery activateWithCompletion:](self->_deviceDiscovery, "activateWithCompletion:", &stru_100717360);
    }
    proximityPairingBufferedScanner = self->_proximityPairingBufferedScanner;
    if (proximityPairingBufferedScanner)
      -[SDProximityPairingBufferedScanner ensureStarted](proximityPairingBufferedScanner, "ensureStarted");
    v18 = 1;
LABEL_33:
    self->_started = v18;
    return;
  }
  v11 = self->_proximityPairingBufferedScanner;
  if (v11)
  {
    -[SDProximityPairingBufferedScanner turnOffScreenOffScanningIfNoAirPodsOntheAccount](v11, "turnOffScreenOffScanningIfNoAirPodsOntheAccount");
    -[NSMutableDictionary removeAllObjects](self->_bufferedDevices, "removeAllObjects");
    bufferedDevices = self->_bufferedDevices;
    self->_bufferedDevices = 0;

  }
  if (self->_deviceDiscovery)
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _ensureStarted]", 30, "Discovery stop (screen off)\n");
    }
    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    v19 = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

    -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
    -[SDProximityPairingAgent _resetTriggers](self, "_resetTriggers");
    -[SDProximityPairingAgent _powerSourceEnsureStopped](self, "_powerSourceEnsureStopped");
    -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "screenOff", 0);
    pairingAlertHandle = self->_pairingAlertHandle;
    if (pairingAlertHandle)
    {
      -[SBSRemoteAlertHandle removeObserver:](pairingAlertHandle, "removeObserver:", self);
      -[SBSRemoteAlertHandle invalidate](self->_pairingAlertHandle, "invalidate");
      v21 = self->_pairingAlertHandle;
      self->_pairingAlertHandle = 0;

    }
    statusAlertHandle = self->_statusAlertHandle;
    if (statusAlertHandle)
    {
      -[SBSRemoteAlertHandle removeObserver:](statusAlertHandle, "removeObserver:", self);
      -[SBSRemoteAlertHandle invalidate](self->_statusAlertHandle, "invalidate");
      v23 = self->_statusAlertHandle;
      self->_statusAlertHandle = 0;

    }
    v18 = 0;
    goto LABEL_33;
  }
}

- (void)_ensureStopped
{
  SDStatusMonitor *statusMonitor;
  void *v4;
  CUSystemMonitor *systemMonitor;
  SFDeviceDiscovery *deviceDiscovery;
  NSMutableDictionary *devices;
  SBSRemoteAlertHandle *pairingAlertHandle;
  SBSRemoteAlertHandle *v9;
  SBSRemoteAlertHandle *statusAlertHandle;
  SBSRemoteAlertHandle *v11;
  SDProximityPairingBufferedScanner *proximityPairingBufferedScanner;
  SDProximityPairingBufferedScanner *v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  statusMonitor = self->_statusMonitor;
  self->_statusMonitor = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);

  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  if (self->_deviceDiscovery)
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _ensureStopped]", 30, "Discovery stop (stopped)\n");
    }
    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

  }
  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0;

  -[SDProximityPairingAgent _resetTriggers](self, "_resetTriggers");
  -[SDProximityPairingAgent _powerSourceEnsureStopped](self, "_powerSourceEnsureStopped");
  pairingAlertHandle = self->_pairingAlertHandle;
  if (pairingAlertHandle)
  {
    -[SBSRemoteAlertHandle removeObserver:](pairingAlertHandle, "removeObserver:", self);
    -[SBSRemoteAlertHandle invalidate](self->_pairingAlertHandle, "invalidate");
    v9 = self->_pairingAlertHandle;
    self->_pairingAlertHandle = 0;

  }
  statusAlertHandle = self->_statusAlertHandle;
  if (statusAlertHandle)
  {
    -[SBSRemoteAlertHandle removeObserver:](statusAlertHandle, "removeObserver:", self);
    -[SBSRemoteAlertHandle invalidate](self->_statusAlertHandle, "invalidate");
    v11 = self->_statusAlertHandle;
    self->_statusAlertHandle = 0;

  }
  -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "stop", 0);
  -[SDProximityController clearDeviceList](self->_proximityController, "clearDeviceList");
  proximityPairingBufferedScanner = self->_proximityPairingBufferedScanner;
  if (proximityPairingBufferedScanner)
  {
    -[SDProximityPairingBufferedScanner invalidate](proximityPairingBufferedScanner, "invalidate");
    v13 = self->_proximityPairingBufferedScanner;
    self->_proximityPairingBufferedScanner = 0;

  }
  self->_started = 0;
}

- (void)_bufferedBleDeviceFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *bufferedDevices;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v4 = a3;
  v10 = objc_alloc_init((Class)SFDevice);
  objc_msgSend(v10, "updateWithBLEDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  if (dword_1007B15E0 <= 30 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bleDevice"));
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _bufferedBleDeviceFound:]", 30, "Found Buffered BLE Prox Device: %@\n", v6);

  }
  bufferedDevices = self->_bufferedDevices;
  if (!bufferedDevices)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = self->_bufferedDevices;
    self->_bufferedDevices = v8;

    bufferedDevices = self->_bufferedDevices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](bufferedDevices, "setObject:forKeyedSubscript:", v10, v5);
  if (self->_started)
  {
    -[SDProximityPairingAgent _deviceFound:andIsABufferedDevice:](self, "_deviceFound:andIsABufferedDevice:", v10, 1);
    -[SDProximityPairingAgent ensureTimerStartedForBufferedDevicesPurge](self, "ensureTimerStartedForBufferedDevicesPurge");
  }

}

- (void)_deviceFound:(id)a3
{
  -[SDProximityPairingAgent _deviceFound:andIsABufferedDevice:](self, "_deviceFound:andIsABufferedDevice:", a3, 0);
}

- (void)_deviceFound:(id)a3 andIsABufferedDevice:(BOOL)a4
{
  void *v6;
  NSMutableDictionary *devices;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_deviceDiscovery)
  {
    if (dword_1007B15E0 <= 9 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 9)))
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceFound:andIsABufferedDevice:]", 9, "Found device: %@\n", v10);
    if (v6)
    {
      devices = self->_devices;
      if (!devices)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v9 = self->_devices;
        self->_devices = v8;

        devices = self->_devices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v10, v6);
      -[SDProximityPairingAgent _deviceChanged:](self, "_deviceChanged:", v10);
      if (!a4)
        -[SDProximityPairingAgent _powerSourcesUpdateForDevice:changes:](self, "_powerSourcesUpdateForDevice:changes:", v10, 0xFFFFFFFFLL);
    }
  }

}

- (void)_deviceLost:(id)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B15E0 <= 9 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 9)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceLost:]", 9, "Lost device: %@\n", v9);
  if (v4)
  {
    v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "model"));
    if (v5 == CFSTR("Device1,21760")
      || (v6 = v5) != 0
      && (v7 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("Device1,21760")),
          v6,
          v6,
          v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDB389SetupAgent shared](_TtC16DaemoniOSLibrary16SDB389SetupAgent, "shared"));
      objc_msgSend(v8, "advertisingB389Lost:", v4);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
    -[SDProximityPairingAgent _update](self, "_update");
  }

}

- (void)_deviceChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 Int64Ranged;
  void *v10;
  __int16 v11;
  int v12;
  unint64_t autoPairRSSI;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  BOOL v29;
  int v30;
  __int16 v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  int v37;
  unint64_t autoStatusRSSI;
  void *v39;
  unint64_t v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  NSMutableDictionary *triggeredDevices;
  NSMutableDictionary *v48;
  NSMutableDictionary *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  double v53;
  NSMutableDictionary *v54;
  NSMutableDictionary *v55;
  NSMutableDictionary *v56;
  SDProximityPairingAgent *v57;
  id v58;
  uint64_t v59;
  void *v60;
  char v61;
  void *v62;
  unsigned int v63;
  double v64;
  int v65;
  unsigned int v66;
  unsigned int v67;
  NSMutableDictionary *v68;
  NSMutableDictionary *v69;
  NSMutableDictionary *v70;
  NSMutableDictionary *v71;
  NSMutableDictionary *v72;
  NSMutableDictionary *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "counterpartIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "advertisementFields"));
  Int64Ranged = CFDictionaryGetInt64Ranged(v8, CFSTR("subType"), 0, 255, 0);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v5 || !self->_deviceDiscovery)
    goto LABEL_124;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v5));
  if (!v10 && v7)
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v7));
  if (!v10)
  {
    if (!-[SDProximityPairingAgent _systemCanShowUIWithCounterpart:](self, "_systemCanShowUIWithCounterpart:", v7))
      goto LABEL_124;
    v81 = v8;
    v11 = CFDictionaryGetInt64Ranged(v8, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0);
    v12 = Int64Ranged;
    if (Int64Ranged == 5)
    {
      autoPairRSSI = self->_autoPairRSSI;
      if (!(_DWORD)autoPairRSSI)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
        autoPairRSSI = (unint64_t)objc_msgSend(v14, "bleProximityRSSIThresholdForType:device:", 8, v4);

      }
      v8 = v81;
      if ((autoPairRSSI & 0x8000000000000000) == 0)
        goto LABEL_124;
      v15 = v7;
      v16 = (unint64_t)objc_msgSend(v6, "rssiFloor");
      -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v4);
      v17 = -[SDProximityController checkDeviceRegion:](self->_proximityController, "checkDeviceRegion:", v4);
      if (_os_feature_enabled_impl("Sharing", "ni_estimator"))
      {
        if (v17 == 2)
        {
          if (dword_1007B15E0 <= 50
            && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
          {
            LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "#ni_estimator airtagpairing trigger launched");
          }
LABEL_89:
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v46 = objc_msgSend(v45, "deviceKeyBagLocked");

          if (v46)
          {
            if (dword_1007B15E0 <= 30)
            {
              v7 = v15;
              if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30))
                LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 30, "Ignoring proximity B389 pairing on lock screen\n");
              goto LABEL_124;
            }
LABEL_118:
            v10 = 0;
            v7 = v15;
            goto LABEL_125;
          }
          if (self->_triggeredB389Setup)
          {
            v74 = v6;
            v75 = v4;
            v76 = v74;
            if (dword_1007B15E0 <= 30
              && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
            {
              LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 30, "Ignoring proximity B389 pairing, already triggered\n");
            }
            v10 = 0;
            v77 = v76;
            v4 = v75;
            v6 = v77;
            v7 = v15;
            goto LABEL_85;
          }
          v7 = v15;
          if (dword_1007B15E0 <= 50
            && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
          {
            LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "Triggering B389 proximity pairing (%ld): %@\n", autoPairRSSI, v6);
          }
          triggeredDevices = self->_triggeredDevices;
          if (!triggeredDevices)
          {
            v48 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            v49 = self->_triggeredDevices;
            self->_triggeredDevices = v48;

            triggeredDevices = self->_triggeredDevices;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](triggeredDevices, "setObject:forKeyedSubscript:", v4, v5);
          self->_triggeredB389Setup = 1;
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[SDB389SetupAgent shared](_TtC16DaemoniOSLibrary16SDB389SetupAgent, "shared"));
          objc_msgSend(v50, "advertisingB389Found:", v4);

LABEL_124:
          v10 = 0;
          goto LABEL_125;
        }
LABEL_61:
        if (self->_fastScanPair)
          -[SDProximityPairingAgent _fastScanStart:](self, "_fastScanStart:", v4);
        goto LABEL_118;
      }
      v7 = v15;
      if ((v16 & 0x8000000000000000) != 0 && autoPairRSSI <= v16)
      {
        if (dword_1007B15E0 <= 50
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
        {
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "#ni_estimator SF airtagpairing triggered");
        }
        goto LABEL_89;
      }
LABEL_79:
      if (self->_fastScanPair)
        -[SDProximityPairingAgent _fastScanStart:](self, "_fastScanStart:", v4);
      goto LABEL_124;
    }
    v31 = v11;
    if (self->_autoPairEnabled && objc_msgSend(v4, "needsSetup"))
    {
      if ((v31 & 0x24) == 0)
      {
        v8 = v81;
        if (CFDictionaryGetInt64(v81, CFSTR("lc"), 0))
          goto LABEL_124;
        v32 = self->_autoPairRSSI;
        if (!(_DWORD)v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
          v32 = (unint64_t)objc_msgSend(v33, "bleProximityRSSIThresholdForType:device:", 1, v4);

        }
        v15 = v7;
        if ((v32 & 0x8000000000000000) == 0)
          goto LABEL_118;
        v34 = (unint64_t)objc_msgSend(v6, "rssiFloor");
        -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v4);
        v35 = -[SDProximityController checkDeviceRegion:](self->_proximityController, "checkDeviceRegion:", v4);
        if (_os_feature_enabled_impl("Sharing", "ni_estimator"))
        {
          if (v35 != 2)
            goto LABEL_61;
          if (dword_1007B15E0 <= 50
            && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
          {
            LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "#ni_estimator pairing trigger launched");
          }
        }
        else
        {
          v7 = v15;
          if ((v34 & 0x8000000000000000) == 0 || v32 > v34)
            goto LABEL_79;
          if (dword_1007B15E0 <= 50
            && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
          {
            LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "#ni_estimator SF pairing triggered");
          }
        }
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
        v52 = objc_msgSend(v51, "deviceKeyBagLocked");

        if (v52)
        {
          v53 = CACurrentMediaTime();
          if (v53 - BKSHIDServicesLastUserEventTime() > 30.0)
          {
            if (dword_1007B15E0 <= 30)
            {
              v7 = v15;
              if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30))
                LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 30, "Ignoring proximity pairing for non-user initiated lock screen\n");
              goto LABEL_124;
            }
            goto LABEL_118;
          }
          if (!-[SDProximityPairingAgent _supportedDevice:](self, "_supportedDevice:", v4))
          {
            if (dword_1007B15E0 <= 30)
            {
              v7 = v15;
              if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30))
                LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 30, "Ignoring proximity pairing unsupported device on lock screen\n");
              goto LABEL_124;
            }
            goto LABEL_118;
          }
        }
        if (dword_1007B15E0 <= 50
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
        {
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "Triggering proximity pairing (%ld): %@, %@\n", v32, v4, v6);
        }
        -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger pair", 1);
        v54 = self->_triggeredDevices;
        v7 = v15;
        if (!v54)
        {
          v55 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v56 = self->_triggeredDevices;
          self->_triggeredDevices = v55;

          v54 = self->_triggeredDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v54, "setObject:forKeyedSubscript:", v4, v5);
        v57 = self;
        v58 = v4;
        v59 = 0;
LABEL_123:
        -[SDProximityPairingAgent _startPairingUI:autoStart:repair:](v57, "_startPairingUI:autoStart:repair:", v58, 0, v59);
        goto LABEL_124;
      }
LABEL_49:
      v10 = 0;
LABEL_85:
      v8 = v81;
      goto LABEL_125;
    }
    if (!self->_autoStatusEnabled
      || (objc_msgSend(v4, "needsSetup") & 1) != 0
      || !self->_autoStatusUnpaired && !objc_msgSend(v4, "paired"))
    {
      goto LABEL_49;
    }
    v80 = v7;
    if ((v31 & 0x400) == 0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
      v37 = sub_1000DBF88(v36);

      if (!v37)
        goto LABEL_155;
    }
    autoStatusRSSI = self->_autoStatusRSSI;
    if (!(_DWORD)autoStatusRSSI)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      autoStatusRSSI = (unint64_t)objc_msgSend(v39, "bleProximityRSSIThresholdForType:device:", 4, v4);

    }
    if ((autoStatusRSSI & 0x8000000000000000) == 0)
    {
LABEL_155:
      v10 = 0;
      v7 = v80;
      v8 = v81;
      goto LABEL_125;
    }
    v40 = (unint64_t)objc_msgSend(v6, "rssiFloor");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
    v42 = objc_msgSend(v41, "triggered");

    if ((v42 & 1) == 0)
    {
      if (dword_1007B15E0 <= 30
        && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "description"));
        LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 30, "Sending device to proximity estimator: %@", v44);

      }
      -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v4);
    }
    if (_os_feature_enabled_impl("Sharing", "ni_estimator"))
    {
      v7 = v80;
      if ((id)-[SDProximityController checkDeviceRegion:](self->_proximityController, "checkDeviceRegion:", v4) == (id)2)
      {
        if (dword_1007B15E0 <= 50
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
        {
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "#ni_estimator status trigger launched");
        }
        goto LABEL_145;
      }
    }
    else
    {
      v7 = v80;
      if ((v40 & 0x8000000000000000) != 0 && autoStatusRSSI <= v40)
      {
        if (dword_1007B15E0 <= 50
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
        {
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "#ni_estimator SF status triggered");
        }
LABEL_145:
        if (v12 != 4 && (v31 & 0x400) == 0)
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
          v61 = sub_1000DC044(v60);

          if ((v61 & 1) == 0 && (v31 & 0x212) != 0x12)
            goto LABEL_155;
        }
        if (CFDictionaryGetInt64(v81, CFSTR("lc"), 0))
          goto LABEL_155;
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
        v63 = objc_msgSend(v62, "deviceKeyBagLocked");

        if (v63)
        {
          v64 = CACurrentMediaTime();
          if (v64 - BKSHIDServicesLastUserEventTime() > 30.0)
          {
            if (dword_1007B15E0 <= 30)
            {
              v7 = v80;
              v8 = v81;
              if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30))
                LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 30, "Ignoring proximity status for non-user initiated lock screen\n");
              goto LABEL_124;
            }
            goto LABEL_155;
          }
        }
        v65 = CFDictionaryGetInt64Ranged(v81, CFSTR("CnSv"), 0, 0xFFFFFFFFLL, 0);
        v66 = -[CUSystemMonitor screenLocked](self->_systemMonitor, "screenLocked");
        v67 = v66;
        if (v12 == 4 && (v66 & 1) == 0)
        {
          v7 = v80;
          if (dword_1007B15E0 <= 50
            && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
          {
            LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "Triggering proximity mismatch (%ld): %@, %@\n", autoStatusRSSI, v4, v6);
          }
          -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger mismatch", 1);
          v68 = self->_triggeredDevices;
          v8 = v81;
          if (v68)
            goto LABEL_178;
          goto LABEL_177;
        }
        if (v65 && (objc_msgSend(v4, "deviceFlags") & 0x1000) != 0)
        {
          v8 = v81;
          if (dword_1007B15E0 <= 50
            && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
          {
            LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "Triggering proximity disconnect (%ld): %@, %@\n", autoStatusRSSI, v4, v6);
          }
          -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger disconnect", 1);
          v71 = self->_triggeredDevices;
          v7 = v80;
          if (v71)
            goto LABEL_186;
        }
        else
        {
          v8 = v81;
          if (((objc_msgSend(v4, "paired") | v67) & 1) != 0)
          {
            v7 = v80;
            if (!objc_msgSend(v4, "paired")
              || !-[SDProximityPairingAgent _shouldShowBatteryCard:inDevice:](self, "_shouldShowBatteryCard:inDevice:", v6, v4))
            {
              goto LABEL_124;
            }
            if (dword_1007B15E0 <= 50
              && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
            {
              LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "Triggering proximity status (%ld) %@, %@\n", autoStatusRSSI, v4, v6);
            }
            -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger status", 1);
            v68 = self->_triggeredDevices;
            if (v68)
              goto LABEL_178;
LABEL_177:
            v69 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            v70 = self->_triggeredDevices;
            self->_triggeredDevices = v69;

            v68 = self->_triggeredDevices;
LABEL_178:
            -[NSMutableDictionary setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v4, v5);
            -[SDProximityPairingAgent _startStatusUI:](self, "_startStatusUI:", v4);
            goto LABEL_124;
          }
          v7 = v80;
          if (dword_1007B15E0 <= 50
            && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
          {
            LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "Triggering proximity repair (%ld): %@, %@\n", autoStatusRSSI, v4, v6);
          }
          -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger repair", 1);
          v71 = self->_triggeredDevices;
          if (v71)
          {
LABEL_186:
            -[NSMutableDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", v4, v5);
            v57 = self;
            v58 = v4;
            v59 = 1;
            goto LABEL_123;
          }
        }
        v72 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v73 = self->_triggeredDevices;
        self->_triggeredDevices = v72;

        v71 = self->_triggeredDevices;
        goto LABEL_186;
      }
    }
    if (self->_fastScanPair)
      -[SDProximityPairingAgent _fastScanStart:](self, "_fastScanStart:", v4);
    goto LABEL_49;
  }
  if (!CFDictionaryGetInt64(v8, CFSTR("lc"), 0))
  {
    v78 = v4;
    v79 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bleDevice"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "advertisementFields"));

    v82 = 0;
    v20 = CFDictionaryGetInt64Ranged(v19, CFSTR("locP"), 0, 0xFFFFFFFFLL, (char *)&v82 + 4);
    v21 = CFDictionaryGetInt64Ranged(v8, CFSTR("locP"), 0, 0xFFFFFFFFLL, &v82);
    v22 = HIDWORD(v82) | v82;
    v23 = CFDictionaryGetInt64Ranged(v19, CFSTR("locS"), 0, 0xFFFFFFFFLL, (char *)&v82 + 4);
    v24 = v8;
    v25 = v23;
    v81 = v24;
    v26 = CFDictionaryGetInt64Ranged(v24, CFSTR("locS"), 0, 0xFFFFFFFFLL, &v82);
    v27 = v26;
    v28 = v26 != v25;
    if (v22)
      v29 = 1;
    else
      v29 = v21 == v20;
    v30 = !v29;
    if (!v29)
      v28 = 1;
    if (v82)
      v28 = v30;
    if (v28)
    {
      if (dword_1007B15E0 <= 50
        && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
      {
        LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "Re-enable trigger on lid open count (%u -> %u): %@\n", v25, v27, v6);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v5);
      v4 = v78;
      v7 = v79;
      if (v79)
        -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v79);
    }
    else
    {
      v4 = v78;
      v7 = v79;
      if ((_DWORD)v26 != (_DWORD)v25 || v21 != v20)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggeredDevices, "setObject:forKeyedSubscript:", v78, v5);
    }

    goto LABEL_85;
  }
  if (dword_1007B15E0 <= 50 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _deviceChanged:]", 50, "Re-enable trigger on lid close: %@\n", v6);
  -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v5);
  if (v7)
    -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v7);
LABEL_125:
  -[SDProximityPairingAgent _update](self, "_update");

}

- (BOOL)_shouldShowBatteryCard:(id)a3 inDevice:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  char v21;
  void *v23;
  void *v24;
  unsigned int v25;
  const char *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc((Class)SFHeadphoneProduct);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "model"));

  v9 = objc_msgSend(v7, "initWithBluetoothModel:", v8);
  v10 = objc_msgSend(v9, "ignoresBatteryStatusIfCounterfeit");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothAddress"));
  v12 = CUPrintNSDataAddress();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uppercaseString"));

  if (v14)
  {
    v15 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.Sharing"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v14));

    if (!v16)
    {
      v21 = 1;
      goto LABEL_8;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dictionaryForKey:", v14));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("genuineness")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    v20 = objc_msgSend(v18, "isEqualToNumber:", v19);

    if ((v20 & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("genuineness")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
      v25 = objc_msgSend(v23, "isEqualToNumber:", v24);

      if (v25)
      {
        v21 = v10 ^ 1;
        if (dword_1007B15E0 <= 50
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
        {
          v26 = "will";
          if (v10)
            v26 = "won't";
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _shouldShowBatteryCard:inDevice:]", 50, "Device not genuine, %s show battery card: %@\n", v26, v5);
        }
        goto LABEL_5;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("needsUpsell")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      v29 = objc_msgSend(v27, "isEqualToNumber:", v28);

      if (v29)
      {
        if (dword_1007B15E0 <= 50
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
        {
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _shouldShowBatteryCard:inDevice:]", 50, "Device doesn't needs upsell %@\n", v5);
        }
      }
      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("needsUpsell")));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
        if ((objc_msgSend(v30, "isEqualToNumber:", v31) & 1) != 0)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("genuineness")));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
          v34 = objc_msgSend(v32, "isEqualToNumber:", v33);

          if ((v34 & 1) != 0)
          {
            v21 = 0;
            goto LABEL_5;
          }
        }
        else
        {

        }
        if (dword_1007B15E0 <= 50
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
        {
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _shouldShowBatteryCard:inDevice:]", 50, "Device genuineness unknown skipping battery status %@\n", v5);
        }
      }
    }
    v21 = 1;
LABEL_5:

LABEL_8:
    goto LABEL_9;
  }
  v21 = 1;
LABEL_9:

  return v21;
}

- (void)_fastScanStart:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *fastScanTimer;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD handler[5];
  _QWORD v17[2];
  _QWORD v18[2];

  v4 = a3;
  if (self->_fastScanAlways || self->_fastScanTimer)
    goto LABEL_28;
  v5 = mach_absolute_time();
  if ((unint64_t)UpTicksToSeconds(v5 - self->_fastScanLastEndTicks) > 0x63)
  {
    if (dword_1007B15E0 <= 50
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _fastScanStart:]", 50, "Fast scan rate start for %@\n", v6);

    }
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 50);
    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    fastScanTimer = self->_fastScanTimer;
    self->_fastScanTimer = v7;

    v9 = self->_fastScanTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000DC78C;
    handler[3] = &unk_1007146D8;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    SFDispatchTimerSet(self->_fastScanTimer, 10.0, -1.0, -10.0);
    dispatch_resume((dispatch_object_t)self->_fastScanTimer);
    v17[0] = CFSTR("scanRate");
    v10 = (uint64_t)-[SFDeviceDiscovery scanRate](self->_deviceDiscovery, "scanRate");
    if (v10 <= 19)
    {
      v11 = "Invalid";
      switch(v10)
      {
        case 0:
          goto LABEL_25;
        case 1:
          v11 = "BackgroundOld";
          break;
        case 2:
          v11 = "NormalOld";
          break;
        case 3:
          v11 = "HighOld";
          break;
        case 4:
          v11 = "AggressiveOld";
          break;
        case 10:
          v11 = "Background";
          break;
        default:
          goto LABEL_24;
      }
      goto LABEL_25;
    }
    if (v10 > 39)
    {
      if (v10 == 40)
      {
        v11 = "High";
        goto LABEL_25;
      }
      if (v10 == 50)
      {
        v11 = "Aggressive";
        goto LABEL_25;
      }
    }
    else
    {
      if (v10 == 20)
      {
        v11 = "Normal";
        goto LABEL_25;
      }
      if (v10 == 30)
      {
        v11 = "HighNormal";
LABEL_25:
        v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
        v13 = (void *)v12;
        v14 = CFSTR("?");
        if (v12)
          v14 = (const __CFString *)v12;
        v17[1] = CFSTR("state");
        v18[0] = v14;
        v18[1] = CFSTR("Start");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
        SFPowerLogEvent(CFSTR("ProximityPairingAgent"), v15);

        goto LABEL_28;
      }
    }
LABEL_24:
    v11 = "?";
    goto LABEL_25;
  }
  if (dword_1007B15E0 <= 10 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 10)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _fastScanStart:]", 10, "Fast scan rate skipped (too soon)\n");
LABEL_28:

}

- (void)_fastScanStop:(const char *)a3 reset:(BOOL)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  OS_dispatch_source *fastScanTimer;
  NSObject *v16;
  OS_dispatch_source *v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];

  if (self->_fastScanTimer)
  {
    v19[0] = CFSTR("scanRate");
    v7 = (uint64_t)-[SFDeviceDiscovery scanRate](self->_deviceDiscovery, "scanRate");
    if (v7 > 19)
    {
      if (v7 > 39)
      {
        if (v7 == 40)
        {
          v8 = "High";
          goto LABEL_21;
        }
        if (v7 == 50)
        {
          v8 = "Aggressive";
          goto LABEL_21;
        }
      }
      else
      {
        if (v7 == 20)
        {
          v8 = "Normal";
          goto LABEL_21;
        }
        if (v7 == 30)
        {
          v8 = "HighNormal";
          goto LABEL_21;
        }
      }
LABEL_20:
      v8 = "?";
    }
    else
    {
      v8 = "Invalid";
      switch(v7)
      {
        case 0:
          break;
        case 1:
          v8 = "BackgroundOld";
          break;
        case 2:
          v8 = "NormalOld";
          break;
        case 3:
          v8 = "HighOld";
          break;
        case 4:
          v8 = "AggressiveOld";
          break;
        case 10:
          v8 = "Background";
          break;
        default:
          goto LABEL_20;
      }
    }
LABEL_21:
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
    v10 = (void *)v9;
    v11 = CFSTR("?");
    if (v9)
      v11 = (const __CFString *)v9;
    v19[1] = CFSTR("state");
    v20[0] = v11;
    v20[1] = CFSTR("Stop");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
    SFPowerLogEvent(CFSTR("ProximityPairingAgent"), v12);

    if (dword_1007B15E0 <= 50
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _fastScanStop:reset:]", 50, "Fast scan rate stopped (%s)\n", a3);
    }
    -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", self->_forceFastScan);
    if (self->_forceFastScan)
      v13 = -80;
    else
      v13 = -60;
    -[SFDeviceDiscovery setRssiThreshold:](self->_deviceDiscovery, "setRssiThreshold:", v13);
    if (self->_forceFastScan)
      v14 = 50;
    else
      v14 = 20;
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", v14);
    fastScanTimer = self->_fastScanTimer;
    if (fastScanTimer)
    {
      v16 = fastScanTimer;
      dispatch_source_cancel(v16);
      v17 = self->_fastScanTimer;
      self->_fastScanTimer = 0;

    }
    if (!a4)
    {
      v18 = mach_absolute_time();
      goto LABEL_38;
    }
LABEL_36:
    v18 = 0;
LABEL_38:
    self->_fastScanLastEndTicks = v18;
    return;
  }
  if (a4)
    goto LABEL_36;
}

- (void)_powerSourceEnsureStopped
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = -[NSMutableSet copy](self->_powerSourceContainers, "copy", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "invalidate");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[NSMutableSet removeAllObjects](self->_powerSourceContainers, "removeAllObjects");
    if (dword_1007B15E0 <= 50
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _powerSourceEnsureStopped]", 50, "Power source containers invalidated");
    }
  }
}

- (id)_createNewPowerSourceContainer
{
  SDBLEPowerSourceContainer *v3;
  id v4;
  SDBLEPowerSourceContainer *v5;
  SDBLEPowerSourceContainer *v6;
  SDBLEPowerSourceContainer *v7;
  SDBLEPowerSourceContainer *v8;
  _QWORD v10[5];
  SDBLEPowerSourceContainer *v11;

  v3 = [SDBLEPowerSourceContainer alloc];
  v4 = objc_alloc_init((Class)SFPowerSource);
  v5 = -[SDBLEPowerSourceContainer initWithPowerSource:](v3, "initWithPowerSource:", v4);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DCC50;
  v10[3] = &unk_100714860;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  -[SDBLEPowerSourceContainer setInvalidationHandler:](v6, "setInvalidationHandler:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

- (void)_powerSourcesUpdateForDevice:(id)a3 changes:(unsigned int)a4
{
  char v4;
  id v6;
  NSMutableSet *v7;
  NSMutableSet *powerSourceContainers;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CFTypeID TypeID;
  void *v21;
  uint64_t TypedValue;
  void *v23;
  void *v24;
  uint64_t v25;
  SDProximityPairingAgent *v26;
  NSMutableSet *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  SDProximityPairingAgent *v51;
  void *v52;
  SDProximityPairingAgent *v53;
  void *v54;
  uint64_t v55;
  _BOOL4 v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  SDProximityPairingAgent *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];

  v4 = a4;
  v6 = a3;
  if (!objc_msgSend(v6, "paired"))
    goto LABEL_80;
  if (!self->_powerSourceContainers)
  {
    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    powerSourceContainers = self->_powerSourceContainers;
    self->_powerSourceContainers = v7;

  }
  v62 = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
  v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advertisementFields"));

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v61 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "batteryInfo"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  if (v11)
  {
    v12 = v11;
    v66 = 0;
    v67 = 0;
    v13 = 0;
    v68 = 0;
    v14 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v74 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
        v17 = v13;
        v18 = v16;
        switch((unint64_t)objc_msgSend(v16, "batteryType"))
        {
          case 1uLL:
            goto LABEL_14;
          case 2uLL:
            v17 = v67;
            v67 = v16;
            goto LABEL_12;
          case 3uLL:
            v17 = v66;
            v66 = v16;
LABEL_12:
            v18 = v13;
            goto LABEL_14;
          case 4uLL:
            v17 = v68;
            v18 = v13;
            v68 = v16;
LABEL_14:
            v19 = v16;

            v13 = v18;
            break;
          default:
            continue;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    }
    while (v12);
  }
  else
  {
    v66 = 0;
    v67 = 0;
    v13 = 0;
    v68 = 0;
  }

  TypeID = CFDataGetTypeID();
  v21 = (void *)v63;
  TypedValue = CFDictionaryGetTypedValue(v63, CFSTR("publicAddress"), TypeID, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v24 = 0;
  if (objc_msgSend(v23, "length") == (id)6)
  {
    v25 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v23), "bytes")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v25);
  }
  v26 = v62;
  v27 = v62->_powerSourceContainers;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("powerSource.groupID == %@"), v24));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet filteredSetUsingPredicate:](v27, "filteredSetUsingPredicate:", v28));

  v30 = v4 & 9;
  if (!v68)
  {
    v60 = v23;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v32 = v29;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    v58 = v29;
    v59 = v24;
    if (!v33)
    {

      v6 = v61;
      v45 = v67;
      if (!v67)
      {
        if (!v66)
        {
          v47 = 0;
          v35 = 0;
          v65 = 0;
          v46 = 0;
          if (!v13)
            goto LABEL_77;
          goto LABEL_75;
        }
        v65 = 0;
        v47 = 0;
        v46 = v66;
        goto LABEL_65;
      }
      v65 = 0;
      v35 = 0;
      v46 = v66;
LABEL_58:
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent _createNewPowerSourceContainer](v26, "_createNewPowerSourceContainer"));
LABEL_59:
      -[SDProximityPairingAgent _powerSourceContainerUpdate:device:batteryInfo:](v26, "_powerSourceContainerUpdate:device:batteryInfo:", v47, v6, v45);
      v48 = 1;
      if (!v46)
        goto LABEL_67;
      goto LABEL_60;
    }
    v34 = v33;
    v56 = v30 != 0;
    v57 = v30;
    v64 = 0;
    v65 = 0;
    v35 = 0;
    v36 = *(_QWORD *)v70;
LABEL_28:
    v37 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v36)
        objc_enumerationMutation(v32);
      v38 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "powerSource"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "partID"));

      if ((objc_msgSend(v40, "isEqual:", CFSTR("Case")) & 1) != 0)
      {
        v41 = v65;
        v65 = v38;
      }
      else
      {
        if ((objc_msgSend(v40, "isEqual:", CFSTR("Left")) & 1) == 0)
        {
          v41 = v35;
          v42 = v38;
          if (!objc_msgSend(v40, "isEqual:", CFSTR("Right")))
            goto LABEL_37;
          goto LABEL_36;
        }
        v41 = v64;
        v64 = v38;
      }
      v42 = v35;
LABEL_36:
      v43 = v38;

      v35 = v42;
LABEL_37:

      if (v34 == (id)++v37)
      {
        v44 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
        v34 = v44;
        if (!v44)
        {

          v45 = v67;
          if (!v67)
          {
            v6 = v61;
            v26 = v62;
            v21 = (void *)v63;
            v47 = v64;
            v46 = v66;
            v23 = v60;
            v48 = v56;
            if (!v66)
              goto LABEL_67;
            goto LABEL_60;
          }
          v6 = v61;
          v26 = v62;
          v46 = v66;
          v23 = v60;
          v47 = v64;
          if (v64)
          {
            if (v57)
            {
              v21 = (void *)v63;
              goto LABEL_59;
            }
            objc_msgSend(v64, "trigger");
            v48 = 0;
            v21 = (void *)v63;
            if (!v66)
            {
LABEL_67:
              if (!v13)
                goto LABEL_77;
              if (v65)
              {
                if (v48)
                {
                  v55 = (uint64_t)v65;
                  goto LABEL_76;
                }
                objc_msgSend(v65, "trigger");
LABEL_77:
                v31 = v46;

                v29 = v58;
                v24 = v59;
                v50 = v65;
LABEL_78:
                v54 = v68;
                goto LABEL_79;
              }
LABEL_75:
              kdebug_trace(725287128, 0, 0, 0, 0);
              v55 = objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent _createNewPowerSourceContainer](v26, "_createNewPowerSourceContainer"));
LABEL_76:
              v65 = (void *)v55;
              -[SDProximityPairingAgent _powerSourceContainerUpdate:device:batteryInfo:](v26, "_powerSourceContainerUpdate:device:batteryInfo:");
              goto LABEL_77;
            }
LABEL_60:
            if (v35)
            {
              if (!v48)
              {
                objc_msgSend(v35, "trigger");
                v48 = 0;
                goto LABEL_67;
              }
              goto LABEL_66;
            }
LABEL_65:
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent _createNewPowerSourceContainer](v26, "_createNewPowerSourceContainer"));
LABEL_66:
            -[SDProximityPairingAgent _powerSourceContainerUpdate:device:batteryInfo:](v26, "_powerSourceContainerUpdate:device:batteryInfo:", v35, v6, v46);
            v48 = 1;
            goto LABEL_67;
          }
          v21 = (void *)v63;
          goto LABEL_58;
        }
        goto LABEL_28;
      }
    }
  }
  v6 = v61;
  v31 = v66;
  if ((unint64_t)objc_msgSend(v29, "count") >= 2
    && dword_1007B15E0 <= 90
    && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 90)))
  {
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _powerSourcesUpdateForDevice:changes:]", 90, "Found unexpected %d matching power sources containers for %@\n", objc_msgSend(v29, "count"), v24);
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "anyObject"));
  if (v49)
  {
    v50 = v49;
    if (!v30)
    {
      objc_msgSend(v49, "trigger");
      v45 = v67;
      goto LABEL_78;
    }
    v51 = v62;
  }
  else
  {
    v51 = v62;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent _createNewPowerSourceContainer](v62, "_createNewPowerSourceContainer"));
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "powerSource"));
  objc_msgSend(v52, "setLowWarnLevel:", 20.0);

  v53 = v51;
  v54 = v68;
  -[SDProximityPairingAgent _powerSourceContainerUpdate:device:batteryInfo:](v53, "_powerSourceContainerUpdate:device:batteryInfo:", v50, v61, v68);
  v45 = v67;
LABEL_79:

LABEL_80:
}

- (void)_powerSourceContainerUpdate:(id)a3 device:(id)a4 batteryInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int16 Int64Ranged;
  id v15;
  id v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  unsigned int v32;
  NSBundle *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  double v46;
  const __CFString *v47;
  unint64_t v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t Int64;
  id v52;
  uint64_t v53;
  unsigned int v54;
  char v55;
  BOOL v56;
  unsigned int v57;
  char v58;
  BOOL v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  SDProximityPairingAgent *v66;
  id v67;
  void *v68;
  id v69;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bleDevice"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "advertisementFields"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "powerSource"));
  Int64Ranged = CFDictionaryGetInt64Ranged(v12, CFSTR("pid"), 0, 0xFFFFLL, 0);
  v66 = self;
  v67 = v8;
  -[NSMutableSet removeObject:](self->_powerSourceContainers, "removeObject:", v8);
  v15 = objc_msgSend(v10, "batteryType");
  if (v15 == (id)1)
  {
    objc_msgSend(v13, "setAccessoryCategory:", CFSTR("Audio Battery Case"));
    if (CFDictionaryGetInt64Ranged(v12, CFSTR("csVs"), 0, 255, 0) == 1)
    {
      objc_msgSend(v13, "setAdapterSourceID:", (unsigned __int16)CFDictionaryGetInt64Ranged(v12, CFSTR("matID"), 0, 0xFFFFLL, 0));
      v16 = objc_alloc_init((Class)SFPowerSourceLEDInfo);
      v17 = CFDictionaryGetInt64Ranged(v12, CFSTR("csLS"), 0, 255, 0);
      if (v17)
        v18 = 2 * (v17 == 1);
      else
        v18 = 1;
      objc_msgSend(v16, "setLEDState:", v18);
      switch(CFDictionaryGetInt64Ranged(v12, CFSTR("csLC"), 0, 255, 0))
      {
        case 0u:
          objc_msgSend(v16, "setLEDState:", 0);
          goto LABEL_16;
        case 1u:
          v19 = v16;
          v20 = 1;
          goto LABEL_15;
        case 2u:
          v19 = v16;
          v20 = 2;
          goto LABEL_15;
        case 3u:
          v19 = v16;
          v20 = 3;
          goto LABEL_15;
        case 4u:
          v19 = v16;
          v20 = 4;
          goto LABEL_15;
        default:
          v19 = v16;
          v20 = 0;
LABEL_15:
          objc_msgSend(v19, "setLEDColor:", v20);
LABEL_16:
          v69 = v16;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
          objc_msgSend(v13, "setLEDs:", v21);

          break;
      }
    }
    else
    {
      objc_msgSend(v13, "setLEDs:", &__NSArray0__struct);
    }
  }
  else
  {
    objc_msgSend(v13, "setAccessoryCategory:", CFSTR("Headphone"));
  }
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v12, CFSTR("publicAddress"), TypeID, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v65 = v24;
  if (objc_msgSend(v24, "length") == (id)6)
  {
    v25 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v24), "bytes")));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (v26)
    {
      objc_msgSend(v13, "setAccessoryID:", v26);
      v27 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v26 = 0;
  }
  v27 = 1;
LABEL_22:
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessoryID"));
  objc_msgSend(v13, "setGroupID:", v28);

  v29 = objc_msgSend(v10, "batteryState");
  objc_msgSend(v13, "setCharging:", v29 == (id)2);
  objc_msgSend(v10, "batteryLevel");
  objc_msgSend(v13, "setChargeLevel:");
  objc_msgSend(v13, "setMaxCapacity:", 100.0);
  objc_msgSend(v13, "setLowWarnLevel:", 10.0);
  if ((v27 & 1) == 0)
    objc_msgSend(v13, "setGroupID:", v26);
  v64 = (void *)v26;
  v68 = v9;
  if (v15 != (id)1)
  {
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
LABEL_30:
    v38 = (void *)v40;
    if (!v40)
      goto LABEL_32;
    goto LABEL_31;
  }
  if (Int64Ranged != 8203)
  {
    v31 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", Int64Ranged);
    v32 = objc_msgSend(v31, "usesProductCaseName");

    if (!v32)
      goto LABEL_28;
  }
  v33 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SFBLEAdvertiser, v30));
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Localizable-PID_%d"), Int64Ranged));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PRODUCT_CASE_NAME_PID_%d"), Int64Ranged));
  v37 = SFLocalizedStringEx(v34, v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

  if (!v38)
  {
LABEL_28:
    v39 = SFLocalizedStringForKey(CFSTR("AIRPODS_CASE_NAME"), v30);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    goto LABEL_30;
  }
LABEL_31:
  objc_msgSend(v13, "setName:", v38);
LABEL_32:
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "partID"));

  if (v41)
    goto LABEL_42;
  if (v15 == (id)2)
  {
    v42 = CFSTR("Left");
  }
  else if (v15 == (id)3)
  {
    v42 = CFSTR("Right");
  }
  else if (v15 == (id)1)
  {
    v42 = CFSTR("Case");
  }
  else
  {
    if (v15 != (id)4)
      goto LABEL_42;
    v42 = CFSTR("Single");
  }
  objc_msgSend(v13, "setPartID:", v42);
LABEL_42:
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "partName"));

  if (v43)
    goto LABEL_48;
  if (v15 == (id)2)
  {
    v44 = CFSTR(" 🅛");
  }
  else
  {
    if (v15 != (id)3)
      goto LABEL_48;
    v44 = CFSTR(" 🅡");
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByAppendingString:", v44));
  objc_msgSend(v13, "setPartName:", v45);

LABEL_48:
  objc_msgSend(v10, "batteryLevel");
  if (fabs(v46 + -1.0) < 0.00000011920929)
  {
    objc_msgSend(v13, "setPowerState:", 4);
    objc_msgSend(v13, "setProductID:", Int64Ranged);
    if (v29 != (id)2)
      goto LABEL_55;
LABEL_53:
    v47 = CFSTR("AC Power");
    goto LABEL_56;
  }
  if (v29 == (id)2)
  {
    objc_msgSend(v13, "setPowerState:", 3);
    objc_msgSend(v13, "setProductID:", Int64Ranged);
    goto LABEL_53;
  }
  objc_msgSend(v13, "setPowerState:", 2);
  objc_msgSend(v13, "setProductID:", Int64Ranged);
LABEL_55:
  v47 = CFSTR("Battery Power");
LABEL_56:
  objc_msgSend(v13, "setState:", v47);
  objc_msgSend(v13, "setTransportType:", CFSTR("Bluetooth"));
  objc_msgSend(v13, "setType:", CFSTR("Accessory Source"));
  objc_msgSend(v13, "setVendorID:", 76);
  v48 = CFDictionaryGetInt64Ranged(v12, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0);
  v49 = Int64Ranged;
  v50 = ((unsigned __int16)(Int64Ranged - 8213) > 7u) | (0x76u >> (Int64Ranged - 21));
  Int64 = CFDictionaryGetInt64(v12, CFSTR("lc"), 0);
  v52 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v49);
  if (objc_msgSend(v52, "hasCaseBT"))
  {
    v53 = (v48 >> 4) & 1;
    if ((v48 & 0x100) != 0)
      LODWORD(v53) = (v48 >> 1) & 1;
    if ((_DWORD)v53)
      v54 = 1;
    else
      v54 = (v48 >> 3) & 1;
    v55 = v53 ^ 1;
    v56 = Int64 == 0;
    if (Int64)
      v57 = v54;
    else
      v57 = (v48 >> 3) & 1;
    if (v56)
      v58 = 1;
    else
      v58 = v55;
    -[NSMutableSet addObject:](v66->_powerSourceContainers, "addObject:", v67);
    v59 = v15 == (id)1;
    v60 = v67;
    v61 = !v59;
    if (!v59 && !v57)
    {
      LOBYTE(v50) = v61 & v58 & v50;
      goto LABEL_75;
    }
  }
  else
  {
    v60 = v67;
    -[NSMutableSet addObject:](v66->_powerSourceContainers, "addObject:", v67);
    if ((v48 & 8) == 0)
    {
LABEL_75:
      if ((v50 & 1) != 0)
      {
        if (dword_1007B15E0 <= 50
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bleDevice"));
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _powerSourceContainerUpdate:device:batteryInfo:]", 50, "Publishing powersource: %@ for device: %@", v13, v62);

        }
        objc_msgSend(v60, "publish");
      }
      goto LABEL_86;
    }
  }
  if (dword_1007B15E0 <= 50 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bleDevice"));
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _powerSourceContainerUpdate:device:batteryInfo:]", 50, "Invalidating powersource: %@ for device: %@", v13, v63);

  }
  objc_msgSend(v60, "invalidate");
LABEL_86:

}

- (void)_removeB389sFromTriggeredDevices
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_triggeredDevices, "allKeys"));
  v4 = objc_msgSend(v3, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
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
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v10, (_QWORD)v16));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleDevice"));
        v13 = v12;
        if (v12)
        {
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "advertisementFields"));
          v15 = (void *)v14;
          if (v14 && CFDictionaryGetInt64Ranged(v14, CFSTR("subType"), 0, 255, 0) == 5)
            -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  self->_triggeredB389Setup = 0;
}

- (BOOL)shouldPromptForSiriNotificationForDevice:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  char v8;

  v4 = a3;
  if ((objc_msgSend(v4, "supportsAACPService") & 1) == 0)
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForSiriNotificationForDevice:]", 30, "Does not support AACP: %@\n", v4);
    }
    goto LABEL_27;
  }
  if (!-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForSiriNotificationForDevice:]", 30, "Screen isn't on: %@\n", v4);
    }
    goto LABEL_27;
  }
  if (!-[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForSiriNotificationForDevice:]", 30, "Device UI isn't Unlocked");
    }
    goto LABEL_27;
  }
  if (!-[SDProximityPairingAgent _systemCanShowUIWithCounterpart:](self, "_systemCanShowUIWithCounterpart:", 0))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForSiriNotificationForDevice:]", 30, "System is preventing prompting for SiriNotifications\n");
    }
    goto LABEL_27;
  }
  if ((+[SFSiriController isHeySiriEnabled](SFSiriController, "isHeySiriEnabled") & 1) == 0)
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForSiriNotificationForDevice:]", 30, "Siri is not enabled\n");
    }
    goto LABEL_27;
  }
  v5 = objc_msgSend(v4, "primaryPlacement") == 1
    || objc_msgSend(v4, "secondaryPlacement") == 1;
  if (objc_msgSend(v4, "primaryPlacement") != 4)
  {
    v8 = objc_msgSend(v4, "secondaryPlacement") == 4 || v5;
    if ((v8 & 1) == 0)
    {
      if (dword_1007B15E0 <= 30
        && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
      {
        objc_msgSend(v4, "primaryPlacement");
        objc_msgSend(v4, "secondaryPlacement");
        LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForSiriNotificationForDevice:]", 30, "Device is not in or on ear. Primary - %s, secondary - %s");
      }
      goto LABEL_27;
    }
  }
  if ((+[SFSiriController shouldPromptForAnnounceMessagesForProductID:isUpsellFlow:](SFSiriController, "shouldPromptForAnnounceMessagesForProductID:isUpsellFlow:", objc_msgSend(v4, "productIdentifier"), 1) & 1) == 0&& (+[SFSiriController shouldPromptForAnnounceCallsForProductID:supportsInEarDetection:isUpsellFlow:](SFSiriController, "shouldPromptForAnnounceCallsForProductID:supportsInEarDetection:isUpsellFlow:", objc_msgSend(v4, "productIdentifier"), 1, 1) & 1) == 0)
  {
    if (SFIsAnnounceCallsEnabled())
      +[SFSiriController setHasUserSeenAnnounceCallsOptOutScreen:](SFSiriController, "setHasUserSeenAnnounceCallsOptOutScreen:", 1);
    else
      +[SFSiriController setHasUserSeenAnnounceMessagesOptOutScreen:](SFSiriController, "setHasUserSeenAnnounceMessagesOptOutScreen:", 1);
  }
  v6 = 1;
  if ((+[SFSiriController shouldPromptForAnnounceNotificationsForProductID:isUpsellFlow:](SFSiriController, "shouldPromptForAnnounceNotificationsForProductID:isUpsellFlow:", objc_msgSend(v4, "productIdentifier"), 1) & 1) == 0)
  {
    +[SFSiriController setHasUserSeenAnnounceNotificationsOptOutScreen:](SFSiriController, "setHasUserSeenAnnounceNotificationsOptOutScreen:", 1);
LABEL_27:
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldPromptForSpatialAudioProfileForDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  const char *v9;
  id v11;

  v4 = a3;
  if (!-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (dword_1007B15E0 > 30 || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
      goto LABEL_27;
    v11 = v4;
    v9 = "Screen isn't on: %@\n";
    goto LABEL_15;
  }
  if (!-[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked"))
  {
    if (dword_1007B15E0 > 30 || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
      goto LABEL_27;
    v9 = "Device UI isn't Unlocked";
    goto LABEL_15;
  }
  if (!-[SDProximityPairingAgent _systemCanShowUIWithCounterpart:](self, "_systemCanShowUIWithCounterpart:", 0))
  {
    if (dword_1007B15E0 > 30 || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
      goto LABEL_27;
    v9 = "System is preventing prompting for SpatialAudioProfile\n";
LABEL_15:
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForSpatialAudioProfileForDevice:]", 30, v9, v11);
LABEL_27:
    v8 = 0;
    goto LABEL_28;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressString"));

  if (!v5)
  {
    if (dword_1007B15E0 <= 115
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 115)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForSpatialAudioProfileForDevice:]", 115, "Missing addressString for CUBluetoothDevice -- returning NO for promptForSpatialAudioProfile {inDevice: %@}\n", v4);
    }
    goto LABEL_27;
  }
  v6 = sub_1000DE204();
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressString"));
  v8 = objc_msgSend(v6, "isProxCardEnrollmentSupportedForDevice:", v7);

LABEL_28:
  return v8;
}

- (BOOL)shouldPromptForEndCallProx:(id)a3
{
  id v4;
  void *v5;
  SDHeadphoneEndCallManager *v6;
  void *v7;
  SDHeadphoneEndCallManager *v8;
  unsigned int v9;
  id v10;
  unsigned int v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const char *v15;
  char v16;
  id v18;

  v4 = a3;
  if (!-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (dword_1007B15E0 > 30 || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
      goto LABEL_38;
    v18 = v4;
    v15 = "Screen isn't on: %@\n";
    goto LABEL_25;
  }
  if (!-[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked"))
  {
    if (dword_1007B15E0 > 30 || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
      goto LABEL_38;
    v15 = "Device UI isn't Unlocked";
    goto LABEL_25;
  }
  if (!-[SDProximityPairingAgent _systemCanShowUIWithCounterpart:](self, "_systemCanShowUIWithCounterpart:", 0))
  {
    if (dword_1007B15E0 > 30 || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
      goto LABEL_38;
    v15 = "System is preventing prompting for SpatialAudioProfile\n";
LABEL_25:
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForEndCallProx:]", 30, v15, v18);
LABEL_38:
    v16 = 0;
    goto LABEL_39;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressString"));

  if (!v5)
  {
    if (dword_1007B15E0 <= 115
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 115)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForEndCallProx:]", 115, "Missing addressString for CUBluetoothDevice -- returning NO for promptForEndCallProx {inDevice: %@}\n", v4);
    }
    goto LABEL_38;
  }
  v6 = [SDHeadphoneEndCallManager alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressString"));
  v8 = -[SDHeadphoneEndCallManager initWithBluetoothAddress:](v6, "initWithBluetoothAddress:", v7);

  v9 = -[SDHeadphoneEndCallManager isStatusUnknown](v8, "isStatusUnknown");
  v10 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", objc_msgSend(v4, "productIdentifier"));
  v11 = objc_msgSend(v10, "supportsEndCallProx");

  if (dword_1007B15E0 <= 115
    && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 115)))
  {
    v12 = CFSTR("NO");
    if (v9)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    if (v11)
      v14 = v13;
    else
      v14 = CFSTR("NO");
    if (v11)
      v12 = CFSTR("YES");
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptForEndCallProx:]", 115, "Shoud show endCallProx %@ -- supportsEndCallProx:%@, endCallStatus:%@ {inDevice: %@}\n", v14, v12, v13, v4);
  }
  v16 = v11 & v9;

LABEL_39:
  return v16;
}

- (BOOL)shouldPromptForMuteCallProx:(id)a3
{
  return -[SDProximityPairingAgent shouldPromptProx:forFeature:](self, "shouldPromptProx:forFeature:", a3, 0);
}

- (BOOL)shouldPromptForAdaptiveControlsProx:(id)a3
{
  return -[SDProximityPairingAgent shouldPromptProx:forFeature:](self, "shouldPromptProx:forFeature:", a3, 1);
}

- (BOOL)shouldPromptForWhatsNewProx:(id)a3
{
  return -[SDProximityPairingAgent shouldPromptProx:forFeature:](self, "shouldPromptProx:forFeature:", a3, 2);
}

- (BOOL)shouldPromptProx:(id)a3 forFeature:(int)a4
{
  void *v4;
  id v6;
  void *v7;
  _TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient *headphoneProxFeatureClient;
  SDHeadphoneFeatureManager *v9;
  unsigned __int8 v10;
  const char *v11;
  SDHeadphoneFeatureManager *v12;
  void *v13;
  BOOL v14;
  id v16;

  v4 = *(void **)&a4;
  v6 = a3;
  if (!-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (dword_1007B15E0 > 30 || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
      goto LABEL_30;
    v16 = v6;
    v11 = "Screen isn't on: %@\n";
    goto LABEL_16;
  }
  if (!-[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked"))
  {
    if (dword_1007B15E0 > 30 || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
      goto LABEL_30;
    v11 = "Device UI isn't Unlocked";
    goto LABEL_16;
  }
  if (!-[SDProximityPairingAgent _systemCanShowUIWithCounterpart:](self, "_systemCanShowUIWithCounterpart:", 0))
  {
    if (dword_1007B15E0 > 30 || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
      goto LABEL_30;
    v16 = v4;
    v11 = "System is preventing prompting for headphone feature : %d\n";
LABEL_16:
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptProx:forFeature:]", 30, v11, v16);
LABEL_30:
    v14 = 0;
    goto LABEL_31;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressString"));

  if (!v7)
  {
    if (dword_1007B15E0 <= 115
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 115)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldPromptProx:forFeature:]", 115, "Missing addressString for CUBluetoothDevice -- returning NO for shouldPromptProx headphone feature: %d {inDevice: %@}\n", v4, v6);
    }
    goto LABEL_30;
  }
  if ((_DWORD)v4 == 2)
  {
    headphoneProxFeatureClient = self->_headphoneProxFeatureClient;
    v9 = (SDHeadphoneFeatureManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressString"));
    v10 = -[HeadphoneProxFeatureClient shouldShowWhatsNewCardWithDeviceAddress:](headphoneProxFeatureClient, "shouldShowWhatsNewCardWithDeviceAddress:", v9);
  }
  else
  {
    v12 = [SDHeadphoneFeatureManager alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressString"));
    v9 = -[SDHeadphoneFeatureManager initWithBluetoothAddress:productID:](v12, "initWithBluetoothAddress:productID:", v13, objc_msgSend(v6, "productIdentifier"));

    v10 = -[SDHeadphoneFeatureManager shouldShowProxCardForFeature:](v9, "shouldShowProxCardForFeature:", v4);
  }
  v14 = v10;

LABEL_31:
  return v14;
}

- (BOOL)isBackgroundCheckReadyForFeature:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (!-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothAddress"));
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent isBackgroundCheckReadyForFeature:forDevice:]", 30, "Screen isn't on: %@\n", v9);

    }
    goto LABEL_20;
  }
  if (!-[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent isBackgroundCheckReadyForFeature:forDevice:]", 30, "Device UI isn't Unlocked");
    }
    goto LABEL_20;
  }
  if (!-[SDProximityPairingAgent _systemCanShowUIWithCounterpart:](self, "_systemCanShowUIWithCounterpart:", 0))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent isBackgroundCheckReadyForFeature:forDevice:]", 30, "System is preventing prompting for headphone feature : %d\n");
    }
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  v8 = 1;
LABEL_21:

  return v8;
}

- (void)readyToShowWithDevice:(id)a3 features:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = a4;
  if (dword_1007B15E0 <= 30 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bluetoothAddress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent readyToShowWithDevice:features:]", 30, "HeadphoneProxFeatureService: [Sharing] Features Ready To Show: Device: %@, Features To Show: %@", v8, v9);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (-[SDProximityPairingAgent isBackgroundCheckReadyForFeature:forDevice:](self, "isBackgroundCheckReadyForFeature:forDevice:", v15, v6))
        {
          -[SDProximityPairingAgent promptForHeadphoneProxFeature:forDevice:](self, "promptForHeadphoneProxFeature:forDevice:", v15, v6);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (BOOL)shouldNotifyForNonGenuineDevice:(id)a3
{
  id v4;
  int v5;
  char v6;
  _UNKNOWN **v7;
  char v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _UNKNOWN **v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  const char *v37;
  _UNKNOWN **v38;
  char v39;
  id v41;
  id v42;
  void *v43;
  char v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];

  v4 = a3;
  if (!-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldNotifyForNonGenuineDevice:]", 30, "Screen isn't on: %@\n", v4);
    }
    goto LABEL_69;
  }
  if (!-[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldNotifyForNonGenuineDevice:]", 30, "Device UI isn't Unlocked");
    }
    goto LABEL_69;
  }
  if (!-[SDProximityPairingAgent _systemCanShowUIWithCounterpart:](self, "_systemCanShowUIWithCounterpart:", 0))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldNotifyForNonGenuineDevice:]", 30, "System is preventing prompting for Genuine Device\n");
    }
LABEL_69:
    v39 = 0;
    goto LABEL_70;
  }
  LOBYTE(v5) = 0;
  v6 = 1;
  v7 = NSLocale_ptr;
  do
  {
    v8 = v6;
    if ((v6 & 1) == 0)
      break;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uppercaseString"));

    v11 = v10 != 0;
    if (v10)
    {
      v12 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.Sharing"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dictionaryForKey:", v10));
      if (!v13)
      {
        v11 = 0;
        goto LABEL_21;
      }
      v44 = v8;
      v45 = v13;
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("needsUpsell")));
      v16 = v7;
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[15], "numberWithInt:", 1));
      if (objc_msgSend(v15, "isEqualToNumber:", v17))
      {
        v42 = v12;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("genuineness")));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[15], "numberWithInt:", 0));
        v20 = objc_msgSend(v18, "isEqualToNumber:", v19);

        if (v20)
        {
          v50 = 0;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBDiscovery devicesWithDiscoveryFlags:error:](CBDiscovery, "devicesWithDiscoveryFlags:error:", 0x200000, &v50));
          v22 = v50;
          v23 = v22;
          if (v22 && !v21)
          {
            v7 = NSLocale_ptr;
            v12 = v42;
            if (dword_1007B15E0 <= 90)
            {
              if (dword_1007B15E0 != -1
                || (v26 = v22, v27 = _LogCategory_Initialize(&dword_1007B15E0, 90), v23 = v26, v27))
              {
                v24 = v23;
                LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldNotifyForNonGenuineDevice:]", 90, "### CBDiscovery failed %@\n", v23);
                v23 = v24;
              }
            }

            v45 = v14;
LABEL_20:

            v8 = v44;
            v13 = v45;
LABEL_21:

            goto LABEL_22;
          }
          v43 = v22;
          if (dword_1007B15E0 <= 30
            && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "description"));
            LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldNotifyForNonGenuineDevice:]", 30, "Device is unknown, checking for details %@\n", v25);

          }
          v41 = v4;
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v17 = v21;
          v28 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(_QWORD *)v47 != v30)
                  objc_enumerationMutation(v17);
                v32 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "btAddressData"));
                v34 = CUPrintNSDataAddress();
                v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

                if (objc_msgSend(v35, "isEqualToString:", v10))
                {
                  v36 = objc_msgSend(v32, "gapaFlags");
                  if ((v36 & 2) != 0)
                  {
                    if (dword_1007B15E0 > 30
                      || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
                    {
                      LOBYTE(v5) = 1;
                      v38 = &off_10074E3A0;
                      goto LABEL_49;
                    }
                    v37 = "Unknown Device is not genuine, proceeding to show non genuine card %@\n";
                    v38 = &off_10074E3A0;
                  }
                  else
                  {
                    if ((objc_msgSend(v32, "gapaFlags") & 1) == 0)
                      goto LABEL_50;
                    if (dword_1007B15E0 > 30
                      || dword_1007B15E0 == -1 && !_LogCategory_Initialize(&dword_1007B15E0, 30))
                    {
                      LOBYTE(v5) = 0;
                      v38 = &off_10074E3C8;
                      goto LABEL_49;
                    }
                    v37 = "Unknown device is genuine, not showing non genuine card %@\n";
                    v38 = &off_10074E3C8;
                  }
                  v5 = (v36 >> 1) & 1;
                  LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldNotifyForNonGenuineDevice:]", 30, v37, v10);
LABEL_49:

                  v14 = v38;
                }
LABEL_50:

              }
              v29 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
            }
            while (v29);
          }

          v4 = v41;
          v12 = v42;
LABEL_17:

        }
        else
        {
          v12 = v42;
        }
        objc_msgSend(v12, "setObject:forKey:", v14, v10);
        v11 = 0;
        v7 = NSLocale_ptr;
        goto LABEL_20;
      }
      v43 = v15;
      goto LABEL_17;
    }
LABEL_22:

    v6 = 0;
  }
  while (!v11);
  v39 = (v8 ^ 1) & v5;
LABEL_70:

  return v39 & 1;
}

- (BOOL)launchRemoteAlertWithUserInfo:(id)a3
{
  id v4;
  SBSRemoteAlertHandle *pairingAlertHandle;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  id v10;
  SBSRemoteAlertHandle *v11;
  SBSRemoteAlertHandle *v12;
  SBSRemoteAlertHandle *v13;

  v4 = a3;
  pairingAlertHandle = self->_pairingAlertHandle;
  if (pairingAlertHandle)
  {
    -[SBSRemoteAlertHandle unregisterObserver:](pairingAlertHandle, "unregisterObserver:", self);
    -[SBSRemoteAlertHandle invalidate](self->_pairingAlertHandle, "invalidate");
  }
  v6 = _os_feature_enabled_impl("Sharing", "HeadphoneProxService");
  if (v6)
    v7 = CFSTR("com.apple.HeadphoneProxService");
  else
    v7 = CFSTR("com.apple.SharingViewService");
  if (v6)
    v8 = CFSTR("HeadphoneProxService.HeadphoneFlowViewController");
  else
    v8 = CFSTR("SharingViewService.HeadphoneFlowViewController");
  v9 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", v7, v8);
  v10 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  objc_msgSend(v10, "setUserInfo:", v4);
  v11 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v9, v10);
  v12 = self->_pairingAlertHandle;
  self->_pairingAlertHandle = v11;

  v13 = self->_pairingAlertHandle;
  if (v13)
  {
    -[SBSRemoteAlertHandle registerObserver:](self->_pairingAlertHandle, "registerObserver:", self);
    -[SBSRemoteAlertHandle activateWithContext:](self->_pairingAlertHandle, "activateWithContext:", 0);
  }

  return v13 != 0;
}

- (void)promptForSiriNotificationsForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[SDProximityPairingAgent shouldPromptForSiriNotificationForDevice:](self, "shouldPromptForSiriNotificationForDevice:"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForSiriNotificationsForDevice:]", 30, "Prompt for SiriNotifications for device %@\n", v11);
    }
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("siriNote"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "productIdentifier")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("pid"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("deviceIdentifier"));

    if (v11)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (objc_msgSend(v11, "deviceFlags") >> 3) & 1));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("softwareVolume"));

      if (objc_msgSend(v11, "primaryPlacement"))
        v9 = 1;
      else
        v9 = objc_msgSend(v11, "secondaryPlacement") != 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("inEarDetection"));

    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4)
      && dword_1007B15E0 <= 90
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 90)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForSiriNotificationsForDevice:]", 90, "### Prompt for SiriNotifications failed\n");
    }

  }
}

- (void)promptForSpatialAudioProfileForDevice:(id)a3
{
  unsigned int v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = -[SDProximityPairingAgent shouldPromptForSpatialAudioProfileForDevice:](self, "shouldPromptForSpatialAudioProfileForDevice:", v13);
  v5 = v13;
  if (v4)
  {
    if (dword_1007B15E0 <= 30)
    {
      if (dword_1007B15E0 != -1 || (v6 = _LogCategory_Initialize(&dword_1007B15E0, 30), v5 = v13, v6))
      {
        LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForSpatialAudioProfileForDevice:]", 30, "Prompt for spatial audio profile for device %@\n", v5);
        v5 = v13;
      }
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressString"));

    if (v7)
    {
      v8 = sub_1000DE204();
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addressString"));
      objc_msgSend(v8, "setProxCardShowed:forDevice:", 1, v9);

    }
    else if (dword_1007B15E0 <= 115
           && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 115)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForSpatialAudioProfileForDevice:]", 115, "Missing addressString for CUBluetoothDevice -- not setting proxCardShowed: {inDevice: %@}\n", v13);
    }
    v10 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("spatialAudioProfile"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("deviceIdentifier"));

    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v10)
      && dword_1007B15E0 <= 90
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 90)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForSpatialAudioProfileForDevice:]", 90, "### Prompt for spatial audio profile failed\n");
    }

    v5 = v13;
  }

}

- (void)promptForEndCallProxForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[SDProximityPairingAgent shouldPromptForEndCallProx:](self, "shouldPromptForEndCallProx:"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForEndCallProxForDevice:]", 30, "Notify for end call prox %@\n", v11);
    }
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("endCallProx"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceIdentifier"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "productIdentifier")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("pid"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "colorCode")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("colorCode"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressString"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressString"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("deviceAddress"));

    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4)
      && dword_1007B15E0 <= 90
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 90)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForEndCallProxForDevice:]", 90, "### Prompt for spatial audio profile failed\n");
    }

  }
}

- (void)promptForMuteCallProxForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[SDProximityPairingAgent shouldPromptForMuteCallProx:](self, "shouldPromptForMuteCallProx:"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForMuteCallProxForDevice:]", 30, "Notify for Mute Call prox %@\n", v11);
    }
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("muteCallProx"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceIdentifier"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "productIdentifier")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("pid"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "colorCode")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("colorCode"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressString"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressString"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("deviceAddress"));

    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4)
      && dword_1007B15E0 <= 90
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 90)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForMuteCallProxForDevice:]", 90, "### Prompt for Mute Call failed\n");
    }

  }
}

- (void)promptForHeadphoneProxFeature:(id)a3 forDevice:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bluetoothAddress"));
  NSLog(CFSTR("HeadphoneProxFeatureService: [Sharing] promptForHeadphoneProxFeature: %@, for Device: %@"), v11, v7);

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("deviceIdentifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bluetoothAddress"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("deviceAddress"));

  if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v8)
    && dword_1007B15E0 <= 90
    && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 90)))
  {
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForHeadphoneProxFeature:forDevice:]", 90, "### Prompt for %@ failed\n", v11);
  }

}

- (void)promptForAdaptiveControlsProxForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[SDProximityPairingAgent shouldPromptForAdaptiveControlsProx:](self, "shouldPromptForAdaptiveControlsProx:"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForAdaptiveControlsProxForDevice:]", 30, "Notify for Adaptive Controls prox %@\n", v11);
    }
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("adaptiveControlsProx"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceIdentifier"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "productIdentifier")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("pid"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "colorCode")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("colorCode"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressString"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressString"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("deviceAddress"));

    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4)
      && dword_1007B15E0 <= 90
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 90)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForAdaptiveControlsProxForDevice:]", 90, "### Prompt for Adaptive Controls failed\n");
    }

  }
}

- (void)promptForWhatsNewProxForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[SDProximityPairingAgent shouldPromptForWhatsNewProx:](self, "shouldPromptForWhatsNewProx:"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForWhatsNewProxForDevice:]", 30, "Notify for Whats New prox %@\n", v10);
    }
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("whatsNew"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceIdentifier"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "productIdentifier")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("pid"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressString"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressString"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("deviceAddress"));

    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4)
      && dword_1007B15E0 <= 90
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 90)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent promptForWhatsNewProxForDevice:]", 90, "### Prompt for Whats New failed\n");
    }

  }
}

- (void)notifyForNonGenuineDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[SDProximityPairingAgent shouldNotifyForNonGenuineDevice:](self, "shouldNotifyForNonGenuineDevice:"))
  {
    if (dword_1007B15E0 <= 30
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 30)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent notifyForNonGenuineDevice:]", 30, "Notify for non genuine device %@\n", v7);
    }
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("nonGenuineDevice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceIdentifier"));

    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4)
      && dword_1007B15E0 <= 90
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 90)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent notifyForNonGenuineDevice:]", 90, "### Prompt for spatial audio profile failed\n");
    }

  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SDProximityPairingAgent *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E0198;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SDProximityPairingAgent *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E0324;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SDProximityPairingAgent *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E04DC;
  block[3] = &unk_100715138;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_resetTriggers
{
  NSMutableDictionary *triggeredDevices;

  -[NSMutableDictionary removeAllObjects](self->_triggeredDevices, "removeAllObjects");
  triggeredDevices = self->_triggeredDevices;
  self->_triggeredDevices = 0;

  *(_WORD *)&self->_triggeredB389Setup = 0;
}

- (void)retriggerProximityPairing:(id)a3
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
  v7[2] = sub_1000E06F8;
  v7[3] = &unk_100714F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_screenStateChanged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E09A4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (int)_startPairingUI:(id)a3 autoStart:(BOOL)a4 repair:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *i;
  void *v23;
  id v24;
  double v25;
  double v26;
  uint64_t Int64Ranged;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  id v33;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  _BOOL8 v52;
  void *v53;
  void *v54;
  void *v55;
  NSNumber *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v71;
  id v72;
  _BOOL4 v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  _QWORD v87[4];
  _BYTE v88[128];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bleDevice"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "advertisementFields"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

  v79 = (void *)v10;
  if (!v10)
  {
    if (dword_1007B15E0 <= 60
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 60)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startPairingUI:autoStart:repair:]", 60, "### No device identifier for %@\n", v7);
    }
    goto LABEL_81;
  }
  if (!v5 || (objc_msgSend(v7, "deviceFlags") & 0x1000) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bluetoothAddress"));
    if (v12)
    {
      v13 = v12;
      if (objc_msgSend(v12, "length") != (id)6)
      {
        if (dword_1007B15E0 <= 60
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 60)))
        {
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startPairingUI:autoStart:repair:]", 60, "### Bad device address size for %@\n", v8);
        }
        v81 = 0;
        v67 = 0;
        v38 = 0;
        v51 = 0;
        v77 = 0;
        v15 = 4294960553;
        goto LABEL_86;
      }
      v72 = objc_retainAutorelease(v13);
      v14 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(v72, "bytes")));
      v11 = objc_claimAutoreleasedReturnValue(v14);
      goto LABEL_8;
    }
    if (dword_1007B15E0 <= 60
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 60)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startPairingUI:autoStart:repair:]", 60, "### No device address for %@\n", v8);
    }
LABEL_81:
    v81 = 0;
    v13 = 0;
    v67 = 0;
    v38 = 0;
    v51 = 0;
    v77 = 0;
    v15 = 4294960535;
    goto LABEL_86;
  }
  v72 = 0;
  v11 = 0;
LABEL_8:
  v74 = v5;
  v75 = v8;
  v76 = (void *)v11;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "batteryInfo"));
  v16 = objc_msgSend((id)v15, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  v73 = v6;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v83;
    v19 = 0.0;
    v20 = 0.0;
    v21 = 0.0;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v83 != v18)
          objc_enumerationMutation((id)v15);
        v23 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
        v24 = objc_msgSend(v23, "batteryState");
        objc_msgSend(v23, "batteryLevel");
        if (v24 == (id)2)
          v26 = v25;
        else
          v26 = -v25;
        switch((unint64_t)objc_msgSend(v23, "batteryType"))
        {
          case 1uLL:
          case 4uLL:
            v21 = v26;
            break;
          case 2uLL:
            v19 = v26;
            break;
          case 3uLL:
            v20 = v26;
            break;
          default:
            continue;
        }
      }
      v17 = objc_msgSend((id)v15, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    }
    while (v17);
  }
  else
  {
    v19 = 0.0;
    v20 = 0.0;
    v21 = 0.0;
  }

  Int64Ranged = CFDictionaryGetInt64Ranged(v78, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);
  v28 = CFDictionaryGetInt64Ranged(v78, CFSTR("cc"), 0, 255, 0);
  v29 = CFDictionaryGetInt64Ranged(v78, CFSTR("csVs"), 0, 255, 0);
  v30 = CFDictionaryGetInt64Ranged(v78, CFSTR("csLC"), 0, 255, 0);
  LODWORD(v15) = objc_msgSend(v7, "deviceFlags");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "btConnectedDeviceMonitor"));
  v33 = objc_msgSend(v32, "statusFlags");

  v71 = v33;
  if (objc_msgSend(v7, "testMode") | ((v33 & 8) >> 3))
    v15 = v15;
  else
    v15 = v15 & 0xFFFFF7FF;
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v78, CFSTR("engravingData"), TypeID, 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "UUIDString"));

  v37 = objc_alloc_init((Class)NSMutableDictionary);
  v38 = v37;
  if (v73)
    objc_msgSend(v37, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("autoStart"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, CFSTR("batteryLevelLeft"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("batteryLevelRight"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v41, CFSTR("batteryLevelCase"));

  if (-[SDStatusMonitor carplayConnected](self->_statusMonitor, "carplayConnected")
    || (v71 & 0x10) != 0)
  {
    objc_msgSend(v38, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("carplayConnected"));
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v30));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v42, CFSTR("caseLEDColor"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v29));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v43, CFSTR("caseVers"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v28));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v44, CFSTR("colorCode"));

  if (v76)
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v76, CFSTR("deviceAddress"));
  if ((_DWORD)v15)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v15));
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v45, CFSTR("deviceFlags"));

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  if (v46)
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v46, CFSTR("deviceName"));

  objc_msgSend(v38, "setObject:forKeyedSubscript:", v79, CFSTR("deviceIdentifier"));
  v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
  v48 = (void *)v47;
  if (v47)
    v49 = (const __CFString *)v47;
  else
    v49 = &stru_10072FE60;
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v49, CFSTR("model"));

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", Int64Ranged));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v50, CFSTR("pid"));

  objc_msgSend(v38, "setObject:forKeyedSubscript:", v81, CFSTR("sessionUUID"));
  v51 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", Int64Ranged);
  if (v51)
    v52 = 1;
  else
    v52 = -[SDProximityPairingAgent _supportedDevice:](self, "_supportedDevice:", v7);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v52));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v53, CFSTR("supportedDevice"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bleDevice"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v54, "proxPairingTicks")));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v55, CFSTR("foundTicks"));

  v56 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", mach_absolute_time());
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v57, CFSTR("triggerTicks"));

  objc_msgSend(v38, "setObject:forKeyedSubscript:", v77, CFSTR("engravingData"));
  if (!v74)
    goto LABEL_47;
  if ((SFShouldShowRepairProxCard(v38) & 1) != 0)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    v59 = objc_msgSend(v58, "bleProximityRSSIThresholdForType:device:", 3, v7);

    objc_msgSend(v38, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("repairMode"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v59));
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v60, CFSTR("repairRSSI"));

LABEL_47:
    if (-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v38))
    {
      v87[0] = v81;
      v86[0] = CFSTR("sid");
      v86[1] = CFSTR("rssi");
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v75, "rssi")));
      v87[1] = v61;
      v86[2] = CFSTR("smoothedRSSI");
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v75, "rssiFloor")));
      v87[2] = v62;
      v86[3] = CFSTR("pairedModel");
      v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
      v64 = (void *)v63;
      if (v63)
        v65 = (const __CFString *)v63;
      else
        v65 = &stru_10072FE60;
      v87[3] = v65;
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 4));
      SFMetricsLog(CFSTR("com.apple.sharing.Proximity.PairingTriggered"), v66);

      if (dword_1007B15E0 > 50)
      {
        LODWORD(v15) = 0;
        v8 = v75;
        v67 = v76;
      }
      else
      {
        v67 = v76;
        if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50))
        {
          v8 = v75;
          v68 = objc_msgSend(v75, "rssiFloor");
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startPairingUI:autoStart:repair:]", 50, "PP: PairUI, ID %@, RSSI %d, model %@, DF %#{flags}, BTSF %#{flags}", v81, v68, v69, v15, &unk_1005CC811, v71, &unk_1005CC8B2);

          LODWORD(v15) = 0;
        }
        else
        {
          LODWORD(v15) = 0;
          v8 = v75;
        }
      }
      v13 = v72;
    }
    else
    {
      v13 = v72;
      if (dword_1007B15E0 > 60)
      {
        LODWORD(v15) = 0;
        v8 = v75;
        v67 = v76;
      }
      else
      {
        v8 = v75;
        v67 = v76;
        if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 60))
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startPairingUI:autoStart:repair:]", 60, "### Create remote alert handle failed\n");
        LODWORD(v15) = 0;
      }
    }
    goto LABEL_64;
  }
  if (dword_1007B15E0 > 60)
  {
    v15 = 4294960561;
    v8 = v75;
    v67 = v76;
    v13 = v72;
  }
  else
  {
    v8 = v75;
    v67 = v76;
    v13 = v72;
    if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 60))
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startPairingUI:autoStart:repair:]", 60, "### Repair not supported for this product\n");
    v15 = 4294960561;
  }
LABEL_86:
  if (dword_1007B15E0 <= 60 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 60)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startPairingUI:autoStart:repair:]", 60, "### Start pairing UI failed: %#m\n", v15);
LABEL_64:

  return v15;
}

- (void)_startSoftwareUpdateRequiredUI
{
  SBSRemoteAlertHandle *softwareUpdateAlertHandle;
  SBSRemoteAlertHandle *v4;
  SBSRemoteAlertHandle *v5;
  id v6;

  softwareUpdateAlertHandle = self->_softwareUpdateAlertHandle;
  if (softwareUpdateAlertHandle)
  {
    -[SBSRemoteAlertHandle removeObserver:](softwareUpdateAlertHandle, "removeObserver:", self);
    -[SBSRemoteAlertHandle invalidate](self->_softwareUpdateAlertHandle, "invalidate");
  }
  v6 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SharingViewService"), CFSTR("SharingViewService.SoftwareUpdateRequiredFlow"));
  v4 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v6, 0);
  v5 = self->_softwareUpdateAlertHandle;
  self->_softwareUpdateAlertHandle = v4;

  -[SBSRemoteAlertHandle addObserver:](self->_softwareUpdateAlertHandle, "addObserver:", self);
  -[SBSRemoteAlertHandle activateWithContext:](self->_softwareUpdateAlertHandle, "activateWithContext:", 0);

}

- (int)_startStatusUI:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t Int64;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *i;
  void *v25;
  id v26;
  double v27;
  double v28;
  _BOOL8 v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSNumber *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  CFTypeID v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  __CFString *v57;
  void *v58;
  NSNumber *v59;
  void *v60;
  void *v61;
  id v62;
  SBSRemoteAlertHandle *statusAlertHandle;
  SBSRemoteAlertHandle *v64;
  SBSRemoteAlertHandle *v65;
  SBSRemoteAlertHandle *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  unsigned __int8 v85;
  void *v86;
  uint64_t v87;
  void *v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  SDProximityPairingAgent *v96;
  void *v97;
  id v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  uint64_t Int64Ranged;
  void *v105;
  __CFString *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  _QWORD v112[4];
  _QWORD v113[21];
  _QWORD v114[21];
  _BYTE v115[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "advertisementFields"));
  v8 = (void *)v7;
  v103 = (void *)v6;
  if (v6)
  {
    v96 = self;
    Int64Ranged = CFDictionaryGetInt64Ranged(v7, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);
    v94 = CFDictionaryGetInt64Ranged(v8, CFSTR("pid2"), 0, 0xFFFFFFFFLL, 0);
    v90 = CFDictionaryGetInt64Ranged(v8, CFSTR("cc"), 0, 255, 0);
    v92 = CFDictionaryGetInt64Ranged(v8, CFSTR("CnSv"), 0, 0xFFFFFFFFLL, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothAddress"));
    v106 = &stru_10072FE60;
    if (objc_msgSend(v9, "length") == (id)6)
    {
      v10 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v9), "bytes")));
      v106 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
    }
    v102 = v9;
    v78 = v5;
    Int64 = CFDictionaryGetInt64(v8, CFSTR("paired"), 0);
    v85 = CFDictionaryGetInt64Ranged(v8, CFSTR("csVs"), 0, 255, 0);
    v12 = CFDictionaryGetInt64Ranged(v8, CFSTR("csLC"), 0, 255, 0);
    v13 = CFDictionaryGetInt64Ranged(v8, CFSTR("subType"), 0, 255, 0);
    v87 = CFDictionaryGetInt64Ranged(v8, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0);
    v14 = CFDictionaryGetInt64Ranged(v8, CFSTR("obcState"), 0, 255, 0);
    TypeID = CFDataGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("engravingData"), TypeID, 0);
    v99 = objc_claimAutoreleasedReturnValue(TypedValue);
    v100 = v4;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "batteryInfo"));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
    v97 = v8;
    v89 = v13;
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v108;
      v21 = 0.0;
      v22 = 0.0;
      v23 = 0.0;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v108 != v20)
            objc_enumerationMutation(v17);
          v25 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i);
          v26 = objc_msgSend(v25, "batteryState");
          objc_msgSend(v25, "batteryLevel");
          if (v26 == (id)2)
            v28 = v27;
          else
            v28 = -v27;
          switch((unint64_t)objc_msgSend(v25, "batteryType"))
          {
            case 1uLL:
            case 4uLL:
              v23 = v28;
              break;
            case 2uLL:
              v21 = v28;
              break;
            case 3uLL:
              v22 = v28;
              break;
            default:
              continue;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
      }
      while (v19);
    }
    else
    {
      v21 = 0.0;
      v22 = 0.0;
      v23 = 0.0;
    }
    v29 = Int64 != 0;

    v30 = _os_feature_enabled_impl("Sharing", "HeadphoneProxService");
    if (v30)
      v31 = CFSTR("com.apple.HeadphoneProxService");
    else
      v31 = CFSTR("com.apple.SharingViewService");
    if (v30)
      v32 = CFSTR("HeadphoneProxService.HeadphoneFlowViewController");
    else
      v32 = CFSTR("SharingViewService.HeadphoneFlowViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "UUIDString"));

    v101 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", v31, v32);
    v98 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "name"));
    v113[0] = CFSTR("batteryLevelLeft");
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
    v114[0] = v84;
    v113[1] = CFSTR("batteryLevelRight");
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
    v114[1] = v83;
    v113[2] = CFSTR("batteryLevelCase");
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
    v114[2] = v82;
    v113[3] = CFSTR("caseLEDColor");
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12));
    v114[3] = v81;
    v113[4] = CFSTR("caseVers");
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v85));
    v114[4] = v86;
    v113[5] = CFSTR("colorCode");
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v90));
    v114[5] = v91;
    v113[6] = CFSTR("cnSv");
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v92));
    v114[6] = v93;
    v114[7] = v106;
    v113[7] = CFSTR("deviceAddress");
    v113[8] = CFSTR("deviceIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "UUIDString"));
    v114[8] = v80;
    v113[9] = CFSTR("headsetStatus");
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v87));
    v114[9] = v88;
    v113[10] = CFSTR("model");
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "model"));
    v37 = (void *)v36;
    if (v36)
      v38 = (const __CFString *)v36;
    else
      v38 = &stru_10072FE60;
    v114[10] = v38;
    v113[11] = CFSTR("pid");
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", Int64Ranged));
    v114[11] = v79;
    v113[12] = CFSTR("pid2");
    v39 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v94));
    v40 = (void *)v39;
    v95 = (void *)v35;
    if (v35)
      v41 = (const __CFString *)v35;
    else
      v41 = &stru_10072FE60;
    v114[12] = v39;
    v114[13] = v41;
    v113[13] = CFSTR("name");
    v113[14] = CFSTR("obcState");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v14));
    v114[14] = v42;
    v113[15] = CFSTR("paired");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v29));
    v114[15] = v43;
    v105 = (void *)v34;
    v114[16] = v34;
    v113[16] = CFSTR("sessionUUID");
    v113[17] = CFSTR("subType");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v89));
    v114[17] = v44;
    v114[18] = &__kCFBooleanTrue;
    v113[18] = CFSTR("statusOnly");
    v113[19] = CFSTR("foundTicks");
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "bleDevice"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v45, "proxPairingTicks")));
    v114[19] = v46;
    v113[20] = CFSTR("triggerTicks");
    v47 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", mach_absolute_time());
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v114[20] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v114, v113, 21));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v49));

    v51 = (void *)v99;
    if (v99)
      objc_msgSend(v50, "setObject:forKeyedSubscript:", v99, CFSTR("engravingData"));
    v52 = CFDataGetTypeID();
    v8 = v97;
    v53 = CFDictionaryGetTypedValue(v97, CFSTR("publicAddress2"), v52, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = v54;
    if (v54)
    {
      if (objc_msgSend(v54, "length") == (id)6)
      {
        v56 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v102), "bytes")));
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue(v56);
      }
      else
      {
        v57 = &stru_10072FE60;
      }
      v4 = v100;
      v5 = v78;
      v58 = v98;
      objc_msgSend(v50, "setObject:forKeyedSubscript:", v57, CFSTR("deviceAddress2"));
    }
    else
    {
      v57 = 0;
      v4 = v100;
      v5 = v78;
      v58 = v98;
    }
    v59 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", CFDictionaryGetInt64(v97, CFSTR("notMyCase"), 0) != 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
    objc_msgSend(v50, "setObject:forKeyedSubscript:", v60, CFSTR("notMyCase"));

    v61 = v50;
    v62 = objc_msgSend(v50, "copy");
    objc_msgSend(v58, "setUserInfo:", v62);

    statusAlertHandle = v96->_statusAlertHandle;
    if (statusAlertHandle)
    {
      -[SBSRemoteAlertHandle removeObserver:](statusAlertHandle, "removeObserver:", v96);
      -[SBSRemoteAlertHandle invalidate](v96->_statusAlertHandle, "invalidate");
    }
    v64 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v101, v58);
    v65 = v96->_statusAlertHandle;
    v96->_statusAlertHandle = v64;

    v66 = v96->_statusAlertHandle;
    if (v66)
    {
      -[SBSRemoteAlertHandle addObserver:](v66, "addObserver:", v96);
      -[SBSRemoteAlertHandle activateWithContext:](v96->_statusAlertHandle, "activateWithContext:", 0);
      v112[0] = v105;
      v111[0] = CFSTR("sid");
      v111[1] = CFSTR("rssi");
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "rssi")));
      v112[1] = v67;
      v111[2] = CFSTR("smoothedRSSI");
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "rssiFloor")));
      v112[2] = v68;
      v111[3] = CFSTR("pairedModel");
      v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
      v70 = (void *)v69;
      v71 = &stru_10072FE60;
      if (v69)
        v71 = (const __CFString *)v69;
      v112[3] = v71;
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v112, v111, 4));
      SFMetricsLog(CFSTR("com.apple.sharing.Proximity.StatusTriggered"), v72);

      if (dword_1007B15E0 > 50)
      {
        LODWORD(v75) = 0;
        v51 = (void *)v99;
      }
      else
      {
        v51 = (void *)v99;
        if (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50))
        {
          v73 = objc_msgSend(v5, "rssiFloor");
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startStatusUI:]", 50, "PP: StatusUI, ID %@, RSSI %ld, model %@", v105, v73, v74);

        }
        LODWORD(v75) = 0;
      }
      v76 = v95;
      v58 = v98;
      goto LABEL_52;
    }
    v76 = v95;
    if (dword_1007B15E0 <= 60
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 60)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startStatusUI:]", 60, "### Create remote alert handle failed\n");
    }
    v75 = 4294960556;
  }
  else
  {
    if (dword_1007B15E0 <= 60
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 60)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startStatusUI:]", 60, "### No device identifier for %@\n", v4);
    }
    v105 = 0;
    v106 = 0;
    v76 = 0;
    v101 = 0;
    v102 = 0;
    v58 = 0;
    v51 = 0;
    v55 = 0;
    v57 = 0;
    v61 = 0;
    v75 = 4294960535;
  }
  if (dword_1007B15E0 <= 60 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 60)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent _startStatusUI:]", 60, "### Start status UI failed: %#m\n", v75);
LABEL_52:

  return v75;
}

- (BOOL)_supportedDevice:(id)a3
{
  void *v3;
  BOOL v4;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "model"));
  if ((objc_msgSend(v3, "isEqual:", CFSTR("AirPods1,1")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("BeatsX1,1")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("AirPods1,3")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("AirPodsPro1,1")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("PowerBeats3,1")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("BeatsSolo3,1")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("Powerbeats4,1")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("BeatsSoloPro1,1")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("BeatsStudio3,2")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("PowerbeatsPro1,1")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("Device1,8202")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("Device1,8208")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithBluetoothModel:", v3);
    v4 = v6 != 0;

  }
  return v4;
}

- (BOOL)_systemCanShowUIWithCounterpart:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;

  v4 = a3;
  v5 = v4;
  v6 = !gSDProxCardsSuppressed
    && (!v4
     || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v4)), v8, !v8))&& !-[SDProximityPairingAgent _uiShowing](self, "_uiShowing")&& (-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x78801) == 0;

  return v6;
}

- (BOOL)_uiShowing
{
  return self->_pairingAlertHandle || self->_statusAlertHandle != 0;
}

- (void)_uiLockStatusChanged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E26E4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)testPairingUI:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  char v7;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  NSObject *dispatchQueue;
  id v14;
  _QWORD block[5];
  id v16;
  char v17;
  uint64_t v18;
  char *v19;
  const char *v20;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v20 = v5;
  v6 = &v5[strlen(v5)];
  if (dword_1007B15E0 <= 50 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent testPairingUI:]", 50, "Testing pairing UI (%@)\n", v4);
  v18 = 0;
  v19 = 0;
  v7 = 0;
  if (!TextSep(v5, v6, ",", &v19, &v18, &v20))
    goto LABEL_16;
  do
  {
    v8 = v19;
    if (!v18)
    {
LABEL_13:
      v11 = 0;
      goto LABEL_15;
    }
    while (1)
    {
      v9 = *v8;
      if (*v8 < 0)
        break;
      if ((_DefaultRuneLocale.__runetype[v9] & 0x4000) == 0)
        goto LABEL_14;
LABEL_11:
      ++v8;
      v10 = v18-- == 1;
      v19 = v8;
      if (v10)
        goto LABEL_13;
    }
    if (__maskrune(v9, 0x4000uLL))
      goto LABEL_11;
LABEL_14:
    v11 = v18;
    v8 = v19;
LABEL_15:
    v7 |= strnicmpx(v8, v11, "repair") == 0;
  }
  while (TextSep(v20, v6, ",", &v19, &v18, &v20));
LABEL_16:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent _testDeviceWithParams:](self, "_testDeviceWithParams:", v4));
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E299C;
  block[3] = &unk_100715D58;
  block[4] = self;
  v16 = v12;
  v17 = v7 & 1;
  v14 = v12;
  dispatch_async(dispatchQueue, block);

}

- (void)testStatusUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int16 Int64Ranged;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *dispatchQueue;
  id v14;
  _QWORD block[5];
  id v16;

  v4 = a3;
  if (dword_1007B15E0 <= 50 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent testStatusUI:]", 50, "Testing status UI (%@)\n", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent _testDeviceWithParams:](self, "_testDeviceWithParams:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "advertisementFields"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v8, CFSTR("pid"), 0, 0xFFFFLL, 0);

    v10 = SFLocalizedNameForBluetoothProductID(Int64Ranged);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("John‘s %@"), v11));
    objc_msgSend(v5, "setName:", v12);

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2B44;
  block[3] = &unk_100714860;
  block[4] = self;
  v16 = v5;
  v14 = v5;
  dispatch_async(dispatchQueue, block);

}

- (id)_testDeviceWithParams:(id)a3
{
  const char *v4;
  double v5;
  __CFString *v6;
  double v7;
  const char *v8;
  _UNKNOWN **v9;
  const char *v10;
  const char *v11;
  const char *v12;
  double v13;
  char *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  int v19;
  id v20;
  __CFString *v21;
  id v22;
  id v23;
  double v24;
  id v25;
  double v26;
  id v27;
  double v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  __CFString *v35;
  const char *v36;
  const char *v37;
  _UNKNOWN **v38;
  const char *v39;
  const char *v40;
  SDProximityPairingAgent *v41;
  uint64_t v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  uint64_t v71;
  void *v72;
  unsigned int v73;
  void *v74;
  unsigned int v75;
  void *v76;
  unsigned int v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  void *v83;
  id v84;
  id v85;
  const char *v87;
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  unsigned int v97;
  unsigned __int8 v98;
  uint64_t v99;
  char *v100;
  const char *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  _QWORD v114[3];

  v88 = objc_retainAutorelease(a3);
  v101 = (const char *)objc_msgSend(v88, "UTF8String");
  v4 = &v101[strlen(v101)];
  v99 = 0;
  v100 = 0;
  v98 = 0;
  v97 = 0;
  v90 = objc_alloc_init((Class)SFBLEDevice);
  v89 = objc_alloc_init((Class)NSMutableDictionary);
  if (!TextSep(v101, v4, ",", &v100, &v99, &v101))
  {
    v91 = 0;
    v92 = 0;
    v94 = 0;
    v95 = 0;
    v93 = 0;
    v96 = 0;
    v13 = 1.0;
    v7 = 0.88;
    v5 = 1.0;
    v6 = &stru_10072FE60;
    goto LABEL_55;
  }
  v93 = 0;
  v94 = 0;
  v95 = 0;
  v96 = 0;
  v91 = 0;
  v92 = 0;
  v5 = 1.0;
  v6 = &stru_10072FE60;
  v7 = 0.88;
  v8 = "model=";
  v9 = NSLocale_ptr;
  v10 = ",";
  v11 = "lbattery=";
  v12 = "rbattery=";
  v13 = 1.0;
  v87 = v4;
  do
  {
    v14 = v100;
    if (!v99)
    {
LABEL_10:
      v17 = 0;
      goto LABEL_12;
    }
    while (1)
    {
      v15 = *v14;
      if (*v14 < 0)
        break;
      if ((_DefaultRuneLocale.__runetype[v15] & 0x4000) == 0)
        goto LABEL_11;
LABEL_8:
      ++v14;
      v16 = v99-- == 1;
      v100 = v14;
      if (v16)
        goto LABEL_10;
    }
    if (__maskrune(v15, 0x4000uLL))
      goto LABEL_8;
LABEL_11:
    v17 = v99;
    v14 = v100;
LABEL_12:
    if (!strnicmp_prefix(v14, v17, v8))
    {
      v20 = objc_alloc((Class)v9[26]);
      v21 = (__CFString *)objc_msgSend(v20, "initWithBytes:length:encoding:", v100 + 6, v99 - 6, 4);

      v6 = v21;
      continue;
    }
    if (!strnicmp_prefix(v100, v99, v11))
    {
      v22 = objc_alloc((Class)v9[26]);
      v23 = objc_msgSend(v22, "initWithBytes:length:encoding:", v100 + 9, v99 - 9, 4);
      objc_msgSend(v23, "doubleValue");
      v5 = v24;
LABEL_37:

      continue;
    }
    if (!strnicmp_prefix(v100, v99, v12))
    {
      v25 = objc_alloc((Class)v9[26]);
      v23 = objc_msgSend(v25, "initWithBytes:length:encoding:", v100 + 9, v99 - 9, 4);
      objc_msgSend(v23, "doubleValue");
      v13 = v26;
      goto LABEL_37;
    }
    if (!strnicmp_prefix(v100, v99, "cbattery="))
    {
      v27 = objc_alloc((Class)v9[26]);
      v23 = objc_msgSend(v27, "initWithBytes:length:encoding:", v100 + 9, v99 - 9, 4);
      objc_msgSend(v23, "doubleValue");
      v7 = v28;
      goto LABEL_37;
    }
    if (!strnicmp_prefix(v100, v99, "name="))
    {
      v29 = objc_alloc((Class)v9[26]);
      v30 = objc_msgSend(v29, "initWithBytes:length:encoding:", v100 + 5, v99 - 5, 4);

      v96 = v30;
      continue;
    }
    if (!strnicmp_prefix(v100, v99, "engraving="))
    {
      v31 = objc_alloc((Class)v9[26]);
      v32 = objc_msgSend(v31, "initWithBytes:length:encoding:", v100 + 10, v99 - 10, 4);
      v34 = objc_msgSend((id)objc_opt_class(self, v33), "dataFromHexString:", v32);
      v35 = v6;
      v36 = v10;
      v37 = v8;
      v38 = v9;
      v39 = v11;
      v40 = v12;
      v41 = self;
      v42 = objc_claimAutoreleasedReturnValue(v34);

      v95 = (void *)v42;
      self = v41;
      v12 = v40;
      v11 = v39;
      v9 = v38;
      v8 = v37;
      v10 = v36;
      v6 = v35;
      v4 = v87;
      continue;
    }
    if (!strnicmpx(v100, v99, "fail"))
    {
      BYTE4(v94) = 1;
      continue;
    }
    if (SNScanF(v100, v99, "pid=%u", &v97) != 1
      && SNScanF(v100, v99, "color=%hhu", &v98) != 1)
    {
      if (!strnicmpx(v100, v99, "amber"))
      {
        LOBYTE(v94) = 1;
        continue;
      }
      if (!strnicmpx(v100, v99, "charging"))
      {
        BYTE4(v93) = 1;
        continue;
      }
      if (!strnicmpx(v100, v99, "b435"))
      {
        v19 = 1;
        goto LABEL_46;
      }
      if (!strnicmpx(v100, v99, "mismatch"))
      {
        BYTE4(v92) = 1;
        continue;
      }
      if (!strnicmpx(v100, v99, "siri"))
      {
        BYTE4(v91) = 1;
        continue;
      }
      if (!strnicmpx(v100, v99, "siriNotes"))
      {
        LOBYTE(v91) = 1;
        continue;
      }
      if (strnicmpx(v100, v99, "tempPaired"))
      {
        if (strnicmpx(v100, v99, "ShareAudio"))
        {
          if (strnicmpx(v100, v99, "b427"))
          {
            v18 = strnicmpx(v100, v99, "b627");
            v19 = v93;
            if (!v18)
              v19 = 3;
          }
          else
          {
            v19 = 2;
          }
LABEL_46:
          LODWORD(v93) = v19;
          continue;
        }
        v43 = v92 | 0x800;
      }
      else
      {
        v43 = v92 | 0x1000;
      }
      LODWORD(v92) = v43;
    }
  }
  while (TextSep(v101, v4, v10, &v100, &v99, &v101));
LABEL_55:
  if (!-[__CFString length](v6, "length") && !v97)
    v97 = 8194;
  v45 = v89;
  v44 = v90;
  v46 = v95;
  if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b188"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b288"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b444"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b298"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b507"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b607"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b688"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b768e"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b768m"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b494"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b498"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b698"))
    && -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b463"))
    && !sub_1000E3FF0(v97))
  {
    if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b282")) || v97 == 8197)
    {

      v97 = 8197;
      v59 = objc_alloc_init((Class)SFBatteryInfo);
      objc_msgSend(v59, "setBatteryLevel:", 0.82);
      objc_msgSend(v59, "setBatteryState:", 2);
      objc_msgSend(v59, "setBatteryType:", 4);
      v113 = v59;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v113, 1));
      v6 = CFSTR("BeatsX1,1");
    }
    else if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b312")) || v97 == 8195)
    {

      v97 = 8195;
      v59 = objc_alloc_init((Class)SFBatteryInfo);
      objc_msgSend(v59, "setBatteryLevel:", 0.12);
      objc_msgSend(v59, "setBatteryState:", 1);
      objc_msgSend(v59, "setBatteryType:", 4);
      v112 = v59;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v112, 1));
      v6 = CFSTR("PowerBeats3,1");
    }
    else if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b352")) || v97 == 8198)
    {

      v97 = 8198;
      v59 = objc_alloc_init((Class)SFBatteryInfo);
      objc_msgSend(v59, "setBatteryLevel:", 0.52);
      objc_msgSend(v59, "setBatteryState:", 2);
      objc_msgSend(v59, "setBatteryType:", 4);
      v111 = v59;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v111, 1));
      v6 = CFSTR("BeatsSolo3,1");
    }
    else if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b443")) || v97 == 8201)
    {

      v97 = 8201;
      v59 = objc_alloc_init((Class)SFBatteryInfo);
      objc_msgSend(v59, "setBatteryLevel:", 0.43);
      objc_msgSend(v59, "setBatteryState:", 2);
      objc_msgSend(v59, "setBatteryType:", 4);
      v110 = v59;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v110, 1));
      v6 = CFSTR("BeatsStudio3,2");
    }
    else
    {
      if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b453")) || v97 == 8215)
      {

        v97 = 8215;
        v59 = objc_alloc_init((Class)SFBatteryInfo);
        objc_msgSend(v59, "setBatteryLevel:", 0.68);
        objc_msgSend(v59, "setBatteryState:", 1);
        objc_msgSend(v59, "setBatteryType:", 4);
        v109 = v59;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v109, 1));
        v6 = CFSTR("BeatsStudioPro1,1");
      }
      else if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b465")) || v97 == 8229)
      {

        v97 = 8229;
        v59 = objc_alloc_init((Class)SFBatteryInfo);
        objc_msgSend(v59, "setBatteryLevel:", 0.74);
        objc_msgSend(v59, "setBatteryState:", 2);
        objc_msgSend(v59, "setBatteryType:", 4);
        v108 = v59;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v108, 1));
        v6 = CFSTR("Device1,8229");
      }
      else if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b487")) || v97 == 8218)
      {

        v97 = 8218;
        v59 = objc_alloc_init((Class)SFBatteryInfo);
        objc_msgSend(v59, "setBatteryLevel:", 0.56);
        objc_msgSend(v59, "setBatteryState:", 2);
        objc_msgSend(v59, "setBatteryType:", 4);
        v107 = v59;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v107, 1));
        v6 = CFSTR("Device1,8218");
      }
      else if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b419")) || v97 == 8204)
      {

        v97 = 8204;
        v59 = objc_alloc_init((Class)SFBatteryInfo);
        objc_msgSend(v59, "setBatteryLevel:", 0.19);
        objc_msgSend(v59, "setBatteryState:", 2);
        objc_msgSend(v59, "setBatteryType:", 4);
        v106 = v59;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v106, 1));
        v6 = CFSTR("BeatsSoloPro1,1");
      }
      else if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b364")) || v97 == 8205)
      {

        v97 = 8205;
        v59 = objc_alloc_init((Class)SFBatteryInfo);
        objc_msgSend(v59, "setBatteryLevel:", 0.64);
        objc_msgSend(v59, "setBatteryState:", 2);
        objc_msgSend(v59, "setBatteryType:", 4);
        v105 = v59;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v105, 1));
        v6 = CFSTR("Powerbeats4,1");
      }
      else if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b515")) || v97 == 8202)
      {

        v97 = 8202;
        v59 = objc_alloc_init((Class)SFBatteryInfo);
        objc_msgSend(v59, "setBatteryLevel:", 0.15);
        objc_msgSend(v59, "setBatteryState:", 2);
        objc_msgSend(v59, "setBatteryType:", 4);
        v104 = v59;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v104, 1));
        v6 = CFSTR("Device1,8202");
      }
      else
      {
        if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b372")) && v97 != 8208)
        {
          v59 = objc_alloc_init((Class)SFBatteryInfo);
          objc_msgSend(v59, "setBatteryLevel:", 0.75);
          objc_msgSend(v59, "setBatteryState:", 1);
          objc_msgSend(v59, "setBatteryType:", 4);
          v102 = v59;
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v102, 1));
          v45 = v89;
          v44 = v90;
          v46 = v95;
          goto LABEL_109;
        }

        v97 = 8208;
        v59 = objc_alloc_init((Class)SFBatteryInfo);
        objc_msgSend(v59, "setBatteryLevel:", 0.15);
        objc_msgSend(v59, "setBatteryState:", 2);
        objc_msgSend(v59, "setBatteryType:", 4);
        v103 = v59;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v103, 1));
        v6 = CFSTR("Device1,8208");
      }
      v45 = v89;
      v44 = v90;
      v46 = v95;
    }
  }
  else
  {
    if (!-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b188")))
      goto LABEL_85;
    if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b288")))
    {
      if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b298")))
      {
        if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b444")))
        {
          if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b507")))
          {
            if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b688")))
            {
              if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b768e")))
              {
                if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b768m")))
                {
                  if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b494")))
                  {
                    if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b498")))
                    {
                      if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b698")))
                      {
                        if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b607")))
                        {
                          if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("b463")))
                          {
LABEL_85:

                            v97 = 8194;
                            v6 = CFSTR("AirPods1,1");
                            goto LABEL_99;
                          }
                          v57 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463"));
                          v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bluetoothModel"));

                          v49 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463"));
                        }
                        else
                        {
                          v56 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607"));
                          v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bluetoothModel"));

                          v49 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607"));
                        }
                      }
                      else
                      {
                        v55 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698"));
                        v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bluetoothModel"));

                        v49 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698"));
                      }
                    }
                    else
                    {
                      v54 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498"));
                      v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bluetoothModel"));

                      v49 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498"));
                    }
                  }
                  else
                  {
                    v53 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494"));
                    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bluetoothModel"));

                    v49 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494"));
                  }
                }
                else
                {
                  v52 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b768m](SFHeadphoneProduct, "b768m"));
                  v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bluetoothModel"));

                  v49 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b768m](SFHeadphoneProduct, "b768m"));
                }
              }
              else
              {
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b768e](SFHeadphoneProduct, "b768e"));
                v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bluetoothModel"));

                v49 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b768e](SFHeadphoneProduct, "b768e"));
              }
            }
            else
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b688](SFHeadphoneProduct, "b688"));
              v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bluetoothModel"));

              v49 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b688](SFHeadphoneProduct, "b688"));
            }
          }
          else
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b507](SFHeadphoneProduct, "b507"));
            v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bluetoothModel"));

            v49 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b507](SFHeadphoneProduct, "b507"));
          }
          v58 = v49;
          v97 = objc_msgSend(v49, "productID");

          v6 = (__CFString *)v48;
        }
        else
        {

          v97 = 8203;
          v6 = CFSTR("PowerbeatsPro1,1");
        }
      }
      else
      {

        v97 = 8206;
        v6 = CFSTR("AirPodsPro1,1");
      }
    }
    else
    {

      v97 = 8207;
      v6 = CFSTR("AirPods1,3");
    }
LABEL_99:
    v59 = objc_alloc_init((Class)SFBatteryInfo);
    objc_msgSend(v59, "setBatteryLevel:", fabs(v5));
    if (v5 < 0.0)
      v60 = 1;
    else
      v60 = 2;
    objc_msgSend(v59, "setBatteryState:", v60);
    objc_msgSend(v59, "setBatteryType:", 2);
    v61 = objc_alloc_init((Class)SFBatteryInfo);
    objc_msgSend(v61, "setBatteryLevel:", fabs(v13));
    if (v13 < 0.0)
      v62 = 1;
    else
      v62 = 2;
    objc_msgSend(v61, "setBatteryState:", v62);
    objc_msgSend(v61, "setBatteryType:", 3);
    v63 = objc_alloc_init((Class)SFBatteryInfo);
    objc_msgSend(v63, "setBatteryLevel:", fabs(v7));
    if (v7 < 0.0)
      v64 = 1;
    else
      v64 = 2;
    objc_msgSend(v63, "setBatteryState:", v64);
    objc_msgSend(v63, "setBatteryType:", 1);
    v114[0] = v59;
    v114[1] = v61;
    v114[2] = v63;
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 3));

  }
LABEL_109:

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v93));
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v66, CFSTR("csVs"));

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v98));
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v67, CFSTR("cc"));

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v97));
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v68, CFSTR("pid"));

  if ((v94 & 1) != 0)
    objc_msgSend(v45, "setObject:forKeyedSubscript:", &off_10074B760, CFSTR("csLC"));
  if ((v93 & 0x100000000) != 0)
    objc_msgSend(v45, "setObject:forKeyedSubscript:", &off_10074B760, CFSTR("csLC"));
  if (v46)
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, CFSTR("engravingData"));
  if ((v92 & 0x100000000) != 0)
  {
    v69 = v97;
    if (v97 == 8207)
    {
      v70 = v44;
      v71 = 8194;
LABEL_120:
      objc_msgSend(v70, "setProductID2:", v71);
    }
    else
    {
      if (v97 == 8194)
      {
        v70 = v44;
        v71 = 8207;
        goto LABEL_120;
      }
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsPro](SFHeadphoneProduct, "airPodsPro"));
      v73 = objc_msgSend(v72, "productID");

      if (v69 == v73)
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698"));
        goto LABEL_125;
      }
      v75 = v97;
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698"));
      v77 = objc_msgSend(v76, "productID");

      if (v75 == v77)
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsPro](SFHeadphoneProduct, "airPodsPro"));
LABEL_125:
        v78 = v74;
        objc_msgSend(v44, "setProductID2:", objc_msgSend(v74, "productID"));

      }
    }
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v44, "productID2")));
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v79, CFSTR("pid2"));

    objc_msgSend(v45, "setObject:forKeyedSubscript:", &off_10074B778, CFSTR("subType"));
  }
  v80 = CFSTR("00000000-0000-0000-0000-000000000003");
  if ((v91 & 1 & BYTE4(v91)) != 0)
    v80 = CFSTR("00000000-0000-0000-0000-000000000004");
  v81 = CFSTR("00000000-0000-0000-0000-000000000000");
  if ((v94 & 0x100000000) != 0)
    v81 = CFSTR("00000000-0000-0000-0000-000000000001");
  if ((v91 & 0x100000000) != 0)
    v81 = CFSTR("00000000-0000-0000-0000-000000000002");
  if ((v91 & 1) != 0)
    v82 = v80;
  else
    v82 = v81;
  objc_msgSend(v44, "setAdvertisementFields:", v45);
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &unk_1005CC8FB, 6));
  objc_msgSend(v44, "setBluetoothAddress:", v83);

  v84 = objc_alloc_init((Class)SFDevice);
  objc_msgSend(v84, "setBatteryInfo:", v65);
  objc_msgSend(v84, "setBleDevice:", v44);
  objc_msgSend(v84, "setDeviceFlags:", v92);
  v85 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v82);
  objc_msgSend(v84, "setIdentifier:", v85);

  objc_msgSend(v84, "setModel:", v6);
  objc_msgSend(v84, "setTestMode:", 1);
  objc_msgSend(v84, "setName:", v96);

  return v84;
}

+ (id)dataFromHexString:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  char *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  unint64_t v12;
  char __str[2];
  char v14;

  v3 = a3;
  if ((objc_msgSend(v3, "length") & 1) != 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("0"), "stringByAppendingString:", v3));

    v3 = (id)v4;
  }
  v5 = objc_retainAutorelease(v3);
  v6 = (char *)objc_msgSend(v5, "UTF8String");
  v7 = objc_msgSend(v5, "length");
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = v7 + 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (uint64_t)v8 >> 1));
  v14 = 0;
  v12 = 0;
  if (v7 >= 1)
  {
    v10 = 0;
    do
    {
      *(_WORD *)__str = *(_WORD *)&v6[v10];
      v10 += 2;
      v12 = strtoul(__str, 0, 16);
      objc_msgSend(v9, "appendBytes:length:", &v12, 1);
    }
    while ((int)v10 < v7);
  }

  return v9;
}

- (BOOL)shouldNotTriggerBecauseDeviceInformationIsTooOld:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double Double;
  double v10;
  BOOL v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bleDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advertisementFields"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("sampleTimestamp")));

  if (!v6)
  {
    if (dword_1007B15E0 <= 50
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldNotTriggerBecauseDeviceInformationIsTooOld:]", 50, "Not triggering Prox Card because device info does not have SFBluetoothKeySampleTimeMachContInSec. Device: %@", v3);
    }
    goto LABEL_16;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bleDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "advertisementFields"));
  Double = CFDictionaryGetDouble(v8, CFSTR("sampleTimestamp"), 0);

  v10 = (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0 - Double;
  if (v10 > 5.0)
  {
    if (dword_1007B15E0 <= 50
      && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
    {
      LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldNotTriggerBecauseDeviceInformationIsTooOld:]", 50, "Not triggering Prox Card because device info is too old. Device age: %f seconds. Device: %@", *(_QWORD *)&v10, v3);
    }
LABEL_16:
    v11 = 1;
    goto LABEL_19;
  }
  if (dword_1007B15E0 <= 10 && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 10)))
    LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent shouldNotTriggerBecauseDeviceInformationIsTooOld:]", 10, "WE ARE triggering Prox Card because device info is NOT too old. Device age: %f seconds. Device: %@", *(_QWORD *)&v10, v3);
  v11 = 0;
LABEL_19:

  return v11;
}

- (void)proximityDeviceDidTrigger:(id)a3
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
  v7[2] = sub_1000E43B8;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)ensureTimerStartedForBufferedDevicesPurge
{
  void *v3;
  dispatch_block_t v4;
  dispatch_time_t v5;
  NSObject *dispatchQueue;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent bufferedDevicesPurgeBlock](self, "bufferedDevicesPurgeBlock"));

  if (!v3)
  {
    location = 0;
    objc_initWeak(&location, self);
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_1000E473C;
    v11 = &unk_1007145D0;
    objc_copyWeak(&v12, &location);
    v4 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v8);
    -[SDProximityPairingAgent setBufferedDevicesPurgeBlock:](self, "setBufferedDevicesPurgeBlock:", v4, v8, v9, v10, v11);

    v5 = dispatch_time(0, 5000000000);
    dispatchQueue = self->_dispatchQueue;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingAgent bufferedDevicesPurgeBlock](self, "bufferedDevicesPurgeBlock"));
    dispatch_after(v5, dispatchQueue, v7);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)removeOldBufferedSamplesFromCache
{
  void *i;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t Double;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id obj;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bufferedDevices, "allKeys"));
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (dword_1007B15E0 <= 50
          && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
        {
          LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent removeOldBufferedSamplesFromCache]", 50, "Purging buffered device %@", v4);
        }
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bufferedDevices, "objectForKeyedSubscript:", v4));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "advertisementFields"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("sampleTimestamp")));

        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advertisementFields"));
          Double = (unint64_t)CFDictionaryGetDouble(v10, CFSTR("sampleTimestamp"), 0);

        }
        else
        {
          Double = 0;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));
        v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bleDevice"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "advertisementFields"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("sampleTimestamp")));

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bleDevice"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "advertisementFields"));
            v19 = (unint64_t)CFDictionaryGetDouble(v18, CFSTR("sampleTimestamp"), 0);

            if (Double >= v19)
            {
              if (dword_1007B15E0 <= 50
                && (dword_1007B15E0 != -1 || _LogCategory_Initialize(&dword_1007B15E0, 50)))
              {
                LogPrintF(&dword_1007B15E0, "-[SDProximityPairingAgent removeOldBufferedSamplesFromCache]", 50, "Purging cached device because it is the same as the buffered device %@", v4);
              }
              -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
            }
          }
        }
        -[NSMutableDictionary removeObjectForKey:](self->_bufferedDevices, "removeObjectForKey:", v4);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v22);
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)bufferedDevicesPurgeBlock
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setBufferedDevicesPurgeBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bufferedDevicesPurgeBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_headphoneProxFeatureClient, 0);
  objc_storeStrong((id *)&self->_proximityPairingBufferedScanner, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_triggeredDevices, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAlertHandle, 0);
  objc_storeStrong((id *)&self->_statusAlertHandle, 0);
  objc_storeStrong((id *)&self->_powerSourceContainers, 0);
  objc_storeStrong((id *)&self->_pairingAlertHandle, 0);
  objc_storeStrong((id *)&self->_fastScanTimer, 0);
  objc_storeStrong((id *)&self->_bufferedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_bluetoothUserInteractionClients, 0);
}

@end
