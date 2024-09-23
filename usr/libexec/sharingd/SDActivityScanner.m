@implementation SDActivityScanner

+ (id)sharedScanner
{
  if (qword_1007C6C90 != -1)
    dispatch_once(&qword_1007C6C90, &stru_10071A120);
  return (id)qword_1007C6C88;
}

- (SDActivityScanner)init
{
  SDActivityScanner *v2;
  uint64_t v3;
  SDStatusMonitor *monitor;
  NSMutableDictionary *v5;
  NSMutableDictionary *deviceIdentifierToDeviceRecord;
  NSMutableDictionary *v7;
  NSMutableDictionary *deviceIdentifierToLostDeviceTimers;
  IDSContinuity *v9;
  IDSContinuity *continuity;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SDActivityScanner;
  v2 = -[SDActivityController init](&v13, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v2->_monitor;
    v2->_monitor = (SDStatusMonitor *)v3;

    v2->_versionByte = sub_1000CEA34(CFSTR("BluetoothAdvertiseScanVersionByte"), 0);
    v2->_scanTypes = 0;
    v2->_isScanning = 0;
    v5 = objc_opt_new(NSMutableDictionary);
    deviceIdentifierToDeviceRecord = v2->_deviceIdentifierToDeviceRecord;
    v2->_deviceIdentifierToDeviceRecord = v5;

    v7 = objc_opt_new(NSMutableDictionary);
    deviceIdentifierToLostDeviceTimers = v2->_deviceIdentifierToLostDeviceTimers;
    v2->_deviceIdentifierToLostDeviceTimers = v7;

    v9 = (IDSContinuity *)objc_msgSend(objc_alloc((Class)IDSContinuity), "initWithDelegate:queue:", v2, &_dispatch_main_q);
    continuity = v2->_continuity;
    v2->_continuity = v9;

    -[SDActivityScanner initializeStateCaptureBlock](v2, "initializeStateCaptureBlock");
    -[SDActivityScanner addObservers](v2, "addObservers");
    v12.receiver = v2;
    v12.super_class = (Class)SDActivityScanner;
    -[SDXPCDaemon _activate](&v12, "_activate");
  }
  return v2;
}

- (BOOL)shouldScanForHandoff
{
  return self->_scanTypes & 1;
}

- (BOOL)shouldScanForCopyPaste
{
  return (LOBYTE(self->_scanTypes) >> 1) & 1;
}

- (BOOL)shouldBoostScan
{
  return (LOBYTE(self->_scanTypes) >> 2) & 1;
}

- (void)start
{
  self->_scannerEnabled = 1;
  -[SDActivityScanner restart](self, "restart");
}

- (void)stop
{
  OS_os_transaction *scanningTransaction;

  scanningTransaction = self->_scanningTransaction;
  self->_scanningTransaction = 0;

  self->_scannerEnabled = 0;
  -[SDActivityScanner restart](self, "restart");
}

- (BOOL)restart
{
  SDActivityScanner *v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  const char *v14;
  id v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  NSObject *stopScanLostDeviceTimer;
  id v20;
  NSObject *v21;
  uint64_t v22;
  OS_dispatch_source *v23;
  dispatch_time_t v24;
  BOOL v25;
  void *v26;
  unint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *i;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const __CFString *v36;
  __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  OS_dispatch_source *v44;
  uint64_t v46;
  id v47;
  __CFString *v48;
  unsigned int v49;
  _QWORD v50[6];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  _BYTE v57[20];
  __int16 v58;
  const __CFString *v59;
  _BYTE v60[128];

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[SDActivityController shouldStart](v2, "shouldStart");
  v4 = -[SDActivityScanner shouldScanForCopyPaste](v2, "shouldScanForCopyPaste");
  v5 = -[SDActivityScanner shouldScanForHandoff](v2, "shouldScanForHandoff");
  if (!v2->_scannerEnabled
    || (-[IDSContinuity state](v2->_continuity, "state") == (id)3 ? (v6 = v3) : (v6 = 0),
        v6 == 1 ? (v7 = (v4 | v5) == 0) : (v7 = 1),
        v7))
  {
    if (v2->_isScanning)
      v8 = CFSTR("Stopped");
    else
      v8 = CFSTR("Skipping request for");
    v9 = v8;
    v11 = handoff_log(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v2->_scannerEnabled)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      if (((unint64_t)-[IDSContinuity state](v2->_continuity, "state") & 0x8000000000000000) != 0
        || (uint64_t)-[IDSContinuity state](v2->_continuity, "state") > 3)
      {
        v14 = "UnexpectedState";
      }
      else
      {
        v14 = off_10071A140[(_QWORD)-[IDSContinuity state](v2->_continuity, "state")];
      }
      if (v3)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      *(_DWORD *)buf = 138413570;
      if (v4)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      if (v5)
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2080;
      v56 = (uint64_t (*)(uint64_t, uint64_t))v14;
      *(_WORD *)v57 = 2112;
      *(_QWORD *)&v57[2] = v16;
      *(_WORD *)&v57[10] = 2112;
      *(_QWORD *)&v57[12] = v17;
      v58 = 2112;
      v59 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ enabled: %@, state: %s, shouldStart: %@, scanForCopyPaste: %@, scanForHandoff: %@", buf, 0x3Eu);
    }

    if (v2->_isScanning)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v56 = sub_1001B7FB4;
      *(_QWORD *)v57 = sub_1001B7FC4;
      *(_QWORD *)&v57[8] = 0;
      *(_QWORD *)&v57[8] = v2->_scanningTransaction;
      -[IDSContinuity stopScanningForType:](v2->_continuity, "stopScanningForType:", 0);
      stopScanLostDeviceTimer = v2->_stopScanLostDeviceTimer;
      if (!stopScanLostDeviceTimer)
      {
        v20 = &_dispatch_main_q;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1001B7FCC;
        v50[3] = &unk_1007148F0;
        v50[4] = v2;
        v50[5] = buf;
        v21 = sub_10019AAD8(0, &_dispatch_main_q, v50);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        v23 = v2->_stopScanLostDeviceTimer;
        v2->_stopScanLostDeviceTimer = (OS_dispatch_source *)v22;

        dispatch_resume((dispatch_object_t)v2->_stopScanLostDeviceTimer);
        stopScanLostDeviceTimer = v2->_stopScanLostDeviceTimer;
      }
      v24 = sub_10019AAC0(10.0);
      sub_10019AB78(stopScanLostDeviceTimer, v24);
      _Block_object_dispose(buf, 8);

    }
    v25 = 0;
  }
  else
  {
    -[SDActivityScanner _createOSTransactionIfNeeded](v2, "_createOSTransactionIfNeeded");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDActivityController allPeerBTIdentifiers](v2, "allPeerBTIdentifiers"));
    if (((v4 ^ 1 | v5) & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 14));
      objc_msgSend(v26, "setLength:", 14);
      v15 = objc_retainAutorelease(v26);
      *(_BYTE *)objc_msgSend(v15, "mutableBytes") = 8;
    }
    v27 = -[SDActivityScanner shouldBoostScan](v2, "shouldBoostScan");
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v2->_deviceIdentifierToDeviceRecord, "allValues"));
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    v49 = v27;
    if (v29)
    {
      v30 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v30)
            objc_enumerationMutation(v28);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), "deviceTracked") & 1) != 0)
          {
            LODWORD(v29) = 1;
            goto LABEL_49;
          }
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v29)
          continue;
        break;
      }
LABEL_49:
      v27 = v49;
    }

    v34 = handoff_log(v32, v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v47 = v15;
      if (v5)
        v36 = CFSTR(" Handoff");
      else
        v36 = &stru_10072FE60;
      v37 = v9;
      if (v4)
        v38 = CFSTR(" CopyPaste");
      else
        v38 = &stru_10072FE60;
      if ((_DWORD)v27)
        v39 = CFSTR(" Boosted");
      else
        v39 = &stru_10072FE60;
      if ((_DWORD)v29)
        v40 = CFSTR("YES");
      else
        v40 = CFSTR("NO");
      v48 = v37;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString valueForKeyPath:](v37, "valueForKeyPath:", CFSTR("@unionOfObjects.UUIDString")));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "componentsJoinedByString:", CFSTR(", ")));
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v38;
      *(_WORD *)&buf[22] = 2112;
      v56 = (uint64_t (*)(uint64_t, uint64_t))v39;
      *(_WORD *)v57 = 2112;
      *(_QWORD *)&v57[2] = v40;
      *(_WORD *)&v57[10] = 2112;
      *(_QWORD *)&v57[12] = v42;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Starting%@%@%@ scanning with duplicates:%@ for peers [%@]", buf, 0x34u);

      v15 = v47;
      v9 = v48;
      v27 = v49;

    }
    LOBYTE(v46) = (_BYTE)v29;
    -[IDSContinuity startScanningForType:withData:mask:peers:withOptions:boostedScan:duplicates:](v2->_continuity, "startScanningForType:withData:mask:peers:withOptions:boostedScan:duplicates:", 0, v15, v15, v9, 0, v27, v46);
    v43 = v2->_stopScanLostDeviceTimer;
    if (v43)
    {
      dispatch_source_cancel(v43);
      v44 = v2->_stopScanLostDeviceTimer;
      v2->_stopScanLostDeviceTimer = 0;

    }
    v25 = 1;
  }

  objc_sync_exit(v2);
  return v25;
}

- (void)_createOSTransactionIfNeeded
{
  OS_os_transaction *v3;
  OS_os_transaction *scanningTransaction;

  if (!self->_scanningTransaction)
  {
    v3 = (OS_os_transaction *)os_transaction_create("SDActivityScanner");
    scanningTransaction = self->_scanningTransaction;
    self->_scanningTransaction = v3;

  }
}

- (void)activityServiceDevicesChanged:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSMutableDictionary *deviceIdentifierToDeviceRecord;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id obj;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        deviceIdentifierToDeviceRecord = self->_deviceIdentifierToDeviceRecord;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIDOverride", v19));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](deviceIdentifierToDeviceRecord, "objectForKeyedSubscript:", v11));

        if (v12)
        {
          objc_msgSend(v12, "setIdsDevice:", v9);
          if (objc_msgSend(v12, "deviceTracked"))
          {
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_1001B82F0;
            v23[3] = &unk_10071A168;
            v24 = v12;
            -[SDActivityScanner _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v23);

          }
          v13 = sub_1000C0734(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cachedDecryptionKeyForDeviceIdentifier:", v16));

            if (v17)
            {
              objc_msgSend(v14, "setValidKey:", objc_msgSend(v17, "isValidKey"));
              objc_msgSend(v14, "setKeyCounter:", objc_msgSend(v17, "lastUsedCounter"));
            }
            objc_msgSend(v19, "addObject:", v14);

          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001B8340;
  v21[3] = &unk_10071A168;
  v22 = v19;
  v18 = v19;
  -[SDActivityScanner _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v21);

}

- (void)nearbyServiceDevicesChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v6 = handoff_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1001BA4D4(v4, v7);

  if (!-[SDActivityController shouldStart](self, "shouldStart"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "isLocallyPaired", (_QWORD)v15)
            && (objc_msgSend(v13, "isNearby") & 1) == 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueIDOverride"));
            -[SDActivityScanner didLosePeer:](self, "didLosePeer:", v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (void)handleNewAdvertisementDevice:(id)a3 data:(id)a4 receivedViaScanning:(BOOL)a5 withSuccessHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  SDActivityDeviceRecord *v20;
  NSObject *v21;
  uint64_t v22;
  int versionByte;
  _QWORD v24[4];
  SDActivityDeviceRecord *v25;
  SDActivityScanner *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIDOverride"));
  v14 = sub_1000C04F4(v11);
  v16 = v14;
  if ((v14 & 1) != 0)
  {
    v22 = handoff_log(v14, v15);
    v21 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      versionByte = self->_versionByte;
      *(_DWORD *)buf = 138412802;
      v32 = v13;
      v33 = 1024;
      v34 = v16;
      v35 = 1024;
      v36 = versionByte;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Saw IDS device %@ with mismatched version %d, expected %d", buf, 0x18u);
    }
  }
  else
  {
    if (v7)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdentifierToLostDeviceTimers, "objectForKeyedSubscript:", v13));
      v18 = v17;
      if (v17)
        objc_msgSend(v17, "invalidate");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "didLosePeerTimer:", v13, 0, 10.0));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceIdentifierToLostDeviceTimers, "setObject:forKeyedSubscript:", v19, v13);

    }
    v20 = (SDActivityDeviceRecord *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdentifierToDeviceRecord, "objectForKeyedSubscript:", v13));
    if (!v20)
    {
      v20 = -[SDActivityDeviceRecord initWithDevice:]([SDActivityDeviceRecord alloc], "initWithDevice:", v10);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceIdentifierToDeviceRecord, "setObject:forKeyedSubscript:", v20, v13);
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001B8740;
    v24[3] = &unk_10071A190;
    v25 = v20;
    v26 = self;
    v27 = v10;
    v30 = v12;
    v28 = v11;
    v29 = v13;
    v21 = v20;
    -[NSObject updateWithRawAdvertisementData:receivedViaScanning:newAdvertisementHandler:](v21, "updateWithRawAdvertisementData:receivedViaScanning:newAdvertisementHandler:", v28, v7, v24);

  }
}

- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
  -[SDXPCDaemon remoteObjectProxyForConnection:usingBlock:](self, "remoteObjectProxyForConnection:usingBlock:", a3, a4);
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
  -[SDXPCDaemon enumerateRemoteObjectProxiesUsingBlock:](self, "enumerateRemoteObjectProxiesUsingBlock:", a3);
}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.handoff.scanning");
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFContinuityScannerProtocol);
}

- (id)remoteObjectInterface
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFContinuityScannerClient));
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(SFActivityAdvertisement), "receivedAdvertisement:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(SFPeerDevice), "foundDeviceWithDevice:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(SFPeerDevice), "lostDeviceWithDevice:", 0, 0);
  v6[0] = objc_opt_class(NSSet);
  v6[1] = objc_opt_class(SFPeerDevice);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, "pairedDevicesChanged:", 0, 0);

  return v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = handoff_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1001BA690();

  if (!self->_scannerEnabled)
    -[SDActivityScanner start](self, "start");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceIdentifierToDeviceRecord, "allValues"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "deviceTracked"))
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_1001B8D10;
          v12[3] = &unk_10071A168;
          v12[4] = v11;
          -[SDActivityScanner _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v12);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)connectionInvalidated:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = handoff_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1001BA6BC();

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[SDActivityScanner stop](self, "stop");
}

- (void)initializeStateCaptureBlock
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001B8E44;
  v2[3] = &unk_100714CC0;
  v2[4] = self;
  self->_stateHandle = os_state_add_handler(&_dispatch_main_q, v2);
}

- (os_state_data_s)dumpState
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  os_state_data_s *v21;
  os_state_data_s *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];

  v3 = handoff_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dumping state", buf, 2u);
  }

  v29 = 0;
  NSAppendPrintF(&v29, "\n");
  v5 = v29;
  v6 = objc_claimAutoreleasedReturnValue(-[SDActivityScanner state](self, "state"));
  v7 = (void *)v6;
  if (v6)
  {
    v28 = v5;
    NSAppendPrintF(&v28, "%@\n", v6);
    v8 = v28;

    v5 = v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](SDActivityAdvertiser, "sharedAdvertiser"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "state"));

  if (v10)
  {
    v27 = v5;
    NSAppendPrintF(&v27, "%@\n", v10);
    v11 = v27;

    v5 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "state"));

  if (v13)
  {
    v26 = v5;
    NSAppendPrintF(&v26, "%@\n", v13);
    v14 = v26;

    v5 = v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityPayloadManager sharedPayloadManager](SDActivityPayloadManager, "sharedPayloadManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "state"));

  if (v16)
  {
    v25 = v5;
    NSAppendPrintF(&v25, "%@\n", v16);
    v17 = v25;

    v5 = v17;
  }
  v24 = v5;
  NSAppendPrintF(&v24, "Handoff State End\n");
  v18 = v24;

  if (v18)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v18, 200, 0, 0));
    v20 = objc_msgSend(v19, "length");
    v21 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v20 + 200, 0xEF23776AuLL);
    v22 = v21;
    if (v21)
    {
      v21->var0 = 1;
      v21->var1.var1 = v20;
      __strlcpy_chk(v21->var3, "Handoff State", 64, 64);
      v19 = objc_retainAutorelease(v19);
      memcpy(v22->var4, objc_msgSend(v19, "bytes"), (size_t)v20);
    }
  }
  else
  {
    v19 = 0;
    v22 = 0;
  }

  return v22;
}

- (id)state
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v26 = 0;
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v26, "%@\n", v5);
  v6 = v26;

  v25 = v6;
  NSAppendPrintF(&v25, "-------------\n");
  v7 = v25;

  v24 = v7;
  NSAppendPrintF(&v24, "Version Byte: %u\n", self->_versionByte);
  v8 = v24;

  v23 = v8;
  if (-[SDActivityController shouldStart](self, "shouldStart"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  NSAppendPrintF(&v23, "Should Start: %@\n", v9);
  v10 = v23;

  v22 = v10;
  if (self->_isScanning)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  NSAppendPrintF(&v22, "Is Scanning: %@\n", v11);
  v12 = v22;

  v21 = v12;
  v13 = SFActivityScanTypesToString(self->_scanTypes);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  NSAppendPrintF(&v21, "Scan Types: %@\n", v14);
  v15 = v21;

  v20 = v15;
  NSAppendPrintF(&v20, "Device Identifier To Lost Device Timer: %@\n", self->_deviceIdentifierToLostDeviceTimers);
  v16 = v20;

  v19 = v16;
  NSAppendPrintF(&v19, "Device Identifier To Device Record: %@\n", self->_deviceIdentifierToDeviceRecord);
  v17 = v19;

  return v17;
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "resetStateRequested:", CFSTR("com.apple.sharingd.ResetState"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "systemWillSleep:", CFSTR("com.apple.sharingd.SystemWillSleep"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "systemHasPoweredOn:", CFSTR("com.apple.sharingd.SystemHasPoweredOn"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "consoleUserChanged:", CFSTR("com.apple.sharingd.ConsoleUserChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)systemWillSleep:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _DWORD v6[2];

  v4 = handoff_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = getuid();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopping for user %d on sleep", (uint8_t *)v6, 8u);
  }

  -[SDActivityScanner stop](self, "stop");
}

- (void)systemHasPoweredOn:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser", a3);
  if (v4)
  {
    v6 = handoff_log(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = getuid();
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting for user %d on wake", (uint8_t *)v8, 8u);
    }

    -[SDActivityScanner start](self, "start");
  }
}

- (void)consoleUserChanged:(id)a3
{
  _BOOL8 v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  uid_t v11;

  v4 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser", a3);
  v5 = v4;
  v7 = handoff_log(v4, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      v10 = 67109120;
      v11 = getuid();
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Starting for user %d on login", (uint8_t *)&v10, 8u);
    }

    -[SDActivityScanner start](self, "start");
  }
  else
  {
    if (v9)
    {
      v10 = 67109120;
      v11 = getuid();
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Stopping for user %d on logout", (uint8_t *)&v10, 8u);
    }

    -[SDActivityScanner stop](self, "stop");
  }
}

- (void)continuityDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  os_activity_scope_state_s v20;
  uint8_t buf[4];
  const char *v22;

  v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityScanner/continuityDidUpdateState", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v20.opaque[0] = 0;
  v20.opaque[1] = 0;
  os_activity_scope_enter(v5, &v20);
  v8 = handoff_log(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (((unint64_t)objc_msgSend(v4, "state") & 0x8000000000000000) != 0
      || (uint64_t)objc_msgSend(v4, "state") > 3)
    {
      v10 = "UnexpectedState";
    }
    else
    {
      v10 = off_10071A140[(_QWORD)objc_msgSend(v4, "state")];
    }
    *(_DWORD *)buf = 136315138;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Did update state to %s", buf, 0xCu);
  }

  v11 = objc_msgSend(v4, "state");
  switch((unint64_t)v11)
  {
    case 0uLL:
      v13 = handoff_log(v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1001BA6E8();
      goto LABEL_18;
    case 1uLL:
      v19 = handoff_log(v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_100088E90();
LABEL_18:

      break;
    case 2uLL:
      v15 = handoff_log(v11, v12);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        sub_100088E38();

      -[SDActivityScanner lostAllDevices](self, "lostAllDevices");
      break;
    case 3uLL:
      v17 = handoff_log(v11, v12);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        sub_100088E0C();

      -[SDActivityScanner restart](self, "restart");
      break;
    default:
      break;
  }
  os_activity_scope_leave(&v20);

}

- (void)continuity:(id)a3 didStartScanningForType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  os_activity_scope_state_s v13;

  v6 = a3;
  v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityScanner/continuityDidStartScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  if (!a4)
    self->_isScanning = 1;
  v10 = handoff_log(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1001BA720(a4, v11, v12);

  os_activity_scope_leave(&v13);
}

- (void)continuity:(id)a3 didStopScanningForType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  OS_os_transaction *scanningTransaction;
  os_activity_scope_state_s v14;

  v6 = a3;
  v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityScanner/continuityDidStopScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v7, &v14);
  if (!a4)
    self->_isScanning = 0;
  v10 = handoff_log(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1001BA7A8(a4, v11, v12);

  scanningTransaction = self->_scanningTransaction;
  self->_scanningTransaction = 0;

  os_activity_scope_leave(&v14);
}

- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  OS_os_transaction *scanningTransaction;
  os_activity_scope_state_s v18;
  uint8_t buf[24];

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityScanner/continuityDidFailToStartScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v10, &v18);
  if (!a4)
    self->_isScanning = 0;
  v13 = handoff_log(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    if ((unint64_t)a4 > 3)
      v15 = "UnexpectedType";
    else
      v15 = off_10071A1B0[a4];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
    sub_1001BA830((uint64_t)v15, v16, buf, v14);
  }

  scanningTransaction = self->_scanningTransaction;
  self->_scanningTransaction = 0;

  os_activity_scope_leave(&v18);
}

- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;

  v9 = a5;
  if (!a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "UUIDString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityController idsDeviceFromBTIdentifier:](self, "idsDeviceFromBTIdentifier:", v10));
    if (v12)
    {
      -[SDActivityScanner handleNewAdvertisementDevice:data:receivedViaScanning:withSuccessHandler:](self, "handleNewAdvertisementDevice:data:receivedViaScanning:withSuccessHandler:", v12, v9, 1, 0);
    }
    else
    {
      v13 = handoff_log(0, v11);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1001BA894((uint64_t)v10, v14);

    }
  }

}

- (void)didLosePeer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;

  v4 = a3;
  v6 = handoff_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Lost IDS device %@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdentifierToDeviceRecord, "objectForKeyedSubscript:", v4));
  if (objc_msgSend(v8, "deviceTracked"))
  {
    objc_msgSend(v8, "setDeviceTracked:", 0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001B9E5C;
    v18[3] = &unk_10071A168;
    v19 = v8;
    -[SDActivityScanner _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v18);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceIdentifierToDeviceRecord, "allValues", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "deviceTracked") & 1) != 0)
        {

          goto LABEL_15;
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v11)
        continue;
      break;
    }
  }

  -[SDActivityScanner restart](self, "restart");
LABEL_15:

}

- (void)lostAllDevices
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = handoff_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1001BA904();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceIdentifierToDeviceRecord, "allKeys", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdentifierToLostDeviceTimers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9)));
        objc_msgSend(v10, "fire");

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)didLosePeerTimer:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdentifierToLostDeviceTimers, "removeObjectForKey:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdentifierToDeviceRecord, "objectForKeyedSubscript:", v5));
  objc_msgSend(v4, "setDisableDuplicateFilterOnce:", 1);
  -[SDActivityScanner didLosePeer:](self, "didLosePeer:", v5);

}

- (void)scanForTypes:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  void *v11;

  v5 = handoff_log(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = SFActivityScanTypesToString(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "requested scanning for %@", buf, 0xCu);

  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001BA180;
  v9[3] = &unk_100716108;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)activityPayloadFromDeviceUniqueID:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  int64_t v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BA28C;
  block[3] = &unk_10071A1D8;
  v19 = v11;
  v20 = v12;
  v22 = a7;
  v23 = a6;
  v21 = v13;
  v14 = v22;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifierToLostDeviceTimers, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierToDeviceRecord, 0);
  objc_storeStrong((id *)&self->_stopScanLostDeviceTimer, 0);
  objc_storeStrong((id *)&self->_scanningTransaction, 0);
  objc_storeStrong((id *)&self->_continuity, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
