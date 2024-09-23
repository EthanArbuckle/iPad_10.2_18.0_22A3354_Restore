@implementation AADeviceManagerDaemon

+ (id)sharedAADeviceManagerDaemon
{
  if (qword_100212578 != -1)
    dispatch_once(&qword_100212578, &stru_1001E2720);
  return (id)qword_100212570;
}

- (AADeviceManagerDaemon)init
{
  AADeviceManagerDaemon *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  AADeviceManagerDaemon *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AADeviceManagerDaemon;
  v2 = -[AADeviceManagerDaemon init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("AADeviceManagerDaemon", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v2->_hRTFDownloadOTATriggered = -[AADeviceManagerDaemon _getBoolPreferencesForKey:](v2, "_getBoolPreferencesForKey:", CFSTR("HRTFDownloadOTATriggered"));
    v2->_prefsChangedNotifyToken = -1;
    v7 = v2;
  }

  return v2;
}

- (NSString)description
{
  return (NSString *)-[AADeviceManagerDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  _TtC15audioaccessoryd13DeviceManager *v4;
  _TtC15audioaccessoryd13DeviceManager *v5;
  id *v6;
  id *v7;
  NSMutableDictionary *devicesMap;
  id *v9;
  id *v10;
  id *v11;
  id v12;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id obj;
  id v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = (id *)&v21;
  v23 = 0x3032000000;
  v24 = sub_1000110B4;
  v25 = sub_1000110C4;
  v26 = 0;
  v20 = 0;
  NSAppendPrintF_safe(&v20, "-- AADeviceManagerDaemon --\n", *(_QWORD *)&a3);
  objc_storeStrong(&v26, v20);
  v4 = self->_cloudSyncDeviceManager;
  v5 = v4;
  if (v4)
  {
    v6 = v22;
    obj = v22[5];
    NSAppendPrintF(&obj, "CloudSync DeviceManager: %@\n", v4);
    objc_storeStrong(v6 + 5, obj);
  }

  v7 = v22;
  v18 = v22[5];
  NSAppendPrintF(&v18, "Connected Accessories: %d, %@\n", -[NSMutableDictionary count](self->_devicesMap, "count"), self->_bluetoothDeviceDiscovery);
  objc_storeStrong(v7 + 5, v18);
  devicesMap = self->_devicesMap;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000110CC;
  v17[3] = &unk_1001E2748;
  v17[4] = &v21;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v17);
  v9 = v22;
  v16 = v22[5];
  NSAppendPrintF(&v16, "\n");
  objc_storeStrong(v9 + 5, v16);
  if (self->_hRTFDownloadOTATriggered)
  {
    v10 = v22;
    v15 = v22[5];
    NSAppendPrintF_safe(&v15, "HRTF Asset Download triggered: %s", "yes");
    objc_storeStrong(v10 + 5, v15);
  }
  v11 = v22;
  v14 = v22[5];
  NSAppendPrintF(&v14, "\n");
  objc_storeStrong(v11 + 5, v14);
  v12 = v22[5];
  _Block_object_dispose(&v21, 8);

  return v12;
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011170;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000111D0;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  if (dword_10020F840 <= 30 && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _invalidate]", 30, "Invalidate");
  -[AADeviceManagerDaemon _aaControllerEnsureStopped](self, "_aaControllerEnsureStopped");
  -[AADeviceManagerDaemon _cbDiscoveryEnsureStopped](self, "_cbDiscoveryEnsureStopped");
  -[AADeviceManagerDaemon _cbControllerEnsureStopped](self, "_cbControllerEnsureStopped");
  -[AADeviceManagerDaemon _cloudSyncEnsureStopped](self, "_cloudSyncEnsureStopped");
  -[AADeviceManagerDaemon _languageChangeMonitoringEnsureStopped](self, "_languageChangeMonitoringEnsureStopped");
  -[AADeviceManagerDaemon stopHeadGestureManager](self, "stopHeadGestureManager");
  self->_activateCalled = 0;
}

- (void)_activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD handler[5];

  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    if (dword_10020F840 <= 30
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _activate]", 30, "Activate");
    }
    if (self->_prefsChangedNotifyToken == -1)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100011380;
      handler[3] = &unk_1001E2398;
      handler[4] = self;
      notify_register_dispatch("com.apple.AudioAccessory.prefsChanged", &self->_prefsChangedNotifyToken, (dispatch_queue_t)dispatchQueue, handler);
    }
    -[AADeviceManagerDaemon _prefsChanged](self, "_prefsChanged");
    -[AADeviceManagerDaemon _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted");
    -[AADeviceManagerDaemon _cbDiscoveryEnsureStarted](self, "_cbDiscoveryEnsureStarted");
    -[AADeviceManagerDaemon _cbControllerEnsureStarted](self, "_cbControllerEnsureStarted");
    -[AADeviceManagerDaemon _cloudSyncEnsureStarted](self, "_cloudSyncEnsureStarted");
    -[AADeviceManagerDaemon _languageChangeMonitoringEnsureStarted](self, "_languageChangeMonitoringEnsureStarted");
  }
}

- (void)_aaControllerEnsureStarted
{
  AAController **p_aaController;
  AAController *v4;
  AAController *v5;
  _QWORD v6[4];
  AAController *v7;
  AADeviceManagerDaemon *v8;
  _QWORD v9[5];

  p_aaController = &self->_aaController;
  v4 = self->_aaController;
  if (!v4)
  {
    v5 = objc_alloc_init(AAController);
    -[AAController setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_aaController, v5);
    -[AAController setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_1001E2768);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001159C;
    v9[3] = &unk_1001E2210;
    v9[4] = self;
    -[AAController setDeviceInfoChangeHandler:](v5, "setDeviceInfoChangeHandler:", v9);
    if (dword_10020F840 <= 30
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _aaControllerEnsureStarted]", 30, "Activating AAController: %@", v5);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000115A8;
    v6[3] = &unk_1001E2410;
    v4 = v5;
    v7 = v4;
    v8 = self;
    -[AAController activateWithCompletion:](v4, "activateWithCompletion:", v6);

  }
}

- (void)_aaControllerEnsureStopped
{
  AAController *aaController;
  AAController *v4;

  aaController = self->_aaController;
  if (aaController)
  {
    -[AAController invalidate](aaController, "invalidate");
    v4 = self->_aaController;
    self->_aaController = 0;

  }
}

- (void)_sendConfigOverAAController:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AudioAccessoryDeviceConfig *v11;
  AAController *aaController;
  void *v13;
  void *v14;
  AudioAccessoryDeviceConfig *v15;
  _QWORD v16[4];
  id v17;
  AudioAccessoryDeviceConfig *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "needsUpdateToAAController") & 1) != 0)
  {
    v11 = objc_alloc_init(AudioAccessoryDeviceConfig);
    -[AudioAccessoryDeviceConfig setAutoANCStrength:](v11, "setAutoANCStrength:", objc_msgSend(v8, "autoANCStrength"));
    -[AudioAccessoryDeviceConfig setEnableSiriMultitone:](v11, "setEnableSiriMultitone:", objc_msgSend(v8, "enableSiriMultitone"));
    -[AudioAccessoryDeviceConfig setEnableHeartRateMonitor:](v11, "setEnableHeartRateMonitor:", objc_msgSend(v8, "enableHeartRateMonitor"));
    -[AADeviceManagerDaemon _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted");
    aaController = self->_aaController;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAccessoryDeviceConfig xpcObjectRepresentation](v11, "xpcObjectRepresentation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000118C0;
    v16[3] = &unk_1001E2480;
    v17 = v9;
    v18 = v11;
    v19 = v10;
    v15 = v11;
    -[AAController sendDeviceConfig:destinationIdentifier:completionHandler:](aaController, "sendDeviceConfig:destinationIdentifier:completionHandler:", v13, v14, v16);

  }
  else
  {
    if (dword_10020F840 <= 10
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 10)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _sendConfigOverAAController:device:completion:]", 10, "No changes in AudioAccessoryDeviceConfig");
    }
    if (v10)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)_accessoryDeviceFound:(id)a3 withChange:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothAddress"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    if (v7)
    {
      if (v4)
      {
        if (dword_10020F840 <= 30
          && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
        {
          LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _accessoryDeviceFound:withChange:]", 30, "AADevice changed: %@", v9);
        }
        -[AADeviceManagerDaemon _loadDeviceRecordForDevice:](self, "_loadDeviceRecordForDevice:", v9);
        if (-[AADeviceManagerDaemon _accessoryDevicePerformActionsOnChange:](self, "_accessoryDevicePerformActionsOnChange:", v9))
        {
          -[AADeviceManagerDaemon _saveDeviceRecordForDevice:](self, "_saveDeviceRecordForDevice:", v9);
          -[AADeviceManagerDaemon _sendCloudConfigsToDevice:](self, "_sendCloudConfigsToDevice:", v9);
        }
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AAServicesDaemon sharedAAServicesDaemon](AAServicesDaemon, "sharedAAServicesDaemon"));
      objc_msgSend(v8, "reportDeviceFound:", v9);

    }
    else if (dword_10020F840 <= 90
           && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _accessoryDeviceFound:withChange:]", 90, "## identifier not found while updating device config");
    }

  }
  else if (dword_10020F840 <= 90
         && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
  {
    LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _accessoryDeviceFound:withChange:]", 90, "## bluetooth address not found while updating device config");
  }

}

- (void)_accessoryDeviceInfoChanged:(id)a3
{
  id v4;
  AudioAccessoryDeviceInfo *v5;
  id v6;
  void *v7;
  id v8;
  NSMutableDictionary *devicesMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v13 = 0;
  v5 = -[AudioAccessoryDeviceInfo initWithXPCObject:error:]([AudioAccessoryDeviceInfo alloc], "initWithXPCObject:error:", v4, &v13);

  v6 = v13;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAccessoryDeviceInfo identifier](v5, "identifier"));
    if (v7)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesMap, "objectForKeyedSubscript:", v7));
      if (!v8)
      {
        if (dword_10020F840 <= 30
          && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
        {
          LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _accessoryDeviceInfoChanged:]", 30, "AADevice found from AADeviceInfo dictionary, identifier: %@", v7);
        }
        v8 = objc_msgSend(objc_alloc((Class)AudioAccessoryDevice), "initWithIdentifier:", v7);
        devicesMap = self->_devicesMap;
        if (!devicesMap)
        {
          v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v11 = self->_devicesMap;
          self->_devicesMap = v10;

          devicesMap = self->_devicesMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](devicesMap, "setObject:forKeyedSubscript:", v8, v7);
      }
      -[AADeviceManagerDaemon _accessoryDeviceFound:withChange:](self, "_accessoryDeviceFound:withChange:", v8, objc_msgSend(v8, "updateWithAADeviceInfo:", v5));

    }
    else if (dword_10020F840 <= 90
           && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _accessoryDeviceInfoChanged:]", 90, "## identifier not found in deviceInfo");
    }
    goto LABEL_12;
  }
  if (dword_10020F840 <= 90 && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
  {
    v12 = CUPrintNSError(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v12);
    LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _accessoryDeviceInfoChanged:]", 90, "## Failed to receive accessory device info: %@", v7);
LABEL_12:

  }
}

- (BOOL)_accessoryDevicePerformActionsOnChange:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  _BOOL4 hRTFDownloadOTATriggered;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "setDefaultConfigurationsIfNeeded");
  if (v5
    && dword_10020F840 <= 30
    && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
  {
    LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _accessoryDevicePerformActionsOnChange:]", 30, "AADevice defaults applied: %@", v4);
  }
  if (objc_msgSend(v4, "siriMultitoneCapability") == 2)
    -[AADeviceManagerDaemon _sendSiriMultitoneConfigToDevice:](self, "_sendSiriMultitoneConfigToDevice:", v4);
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "HRTFDownloadOTA"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "coreBluetoothDevice"));
    if ((objc_msgSend(v6, "deviceFlags") & 0x800000) != 0)
    {
      hRTFDownloadOTATriggered = self->_hRTFDownloadOTATriggered;

      if (!hRTFDownloadOTATriggered)
        -[AADeviceManagerDaemon downloadHRTFAsset](self, "downloadHRTFAsset");
    }
    else
    {

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));
  objc_msgSend(v8, "getSmartRoutingStateForDeviceAddress:", v9);

  return v5;
}

- (void)_accessoryDeviceUpdateCloudRecord:(id)a3 config:(id)a4
{
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "headGestureToggle"))
    objc_msgSend(v10, "setHeadGestureToggle:", objc_msgSend(v6, "headGestureToggle"));
  if (objc_msgSend(v6, "acceptReplyPlayPauseConfig"))
    objc_msgSend(v10, "setAcceptReplyPlayPauseConfig:", objc_msgSend(v6, "acceptReplyPlayPauseConfig"));
  v7 = objc_msgSend(v6, "declineDismissSkipConfig");
  v8 = v10;
  if (v7)
  {
    objc_msgSend(v10, "setDeclineDismissSkipConfig:", objc_msgSend(v6, "declineDismissSkipConfig", v10));
    v8 = v10;
  }
  -[AADeviceManagerDaemon _saveDeviceRecordForDevice:](self, "_saveDeviceRecordForDevice:", v8);
  if (dword_10020F840 <= 30 && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _accessoryDeviceUpdateCloudRecord:config:]", 30, "AADevice config applied locally: %@", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AAServicesDaemon sharedAAServicesDaemon](AAServicesDaemon, "sharedAAServicesDaemon"));
  objc_msgSend(v9, "reportDeviceFound:", v10);

}

- (id)availableDevices
{
  return -[NSMutableDictionary copy](self->_devicesMap, "copy");
}

- (void)sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *dispatchQueue;
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
  v15[2] = sub_100012110;
  v15[3] = &unk_1001E2288;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);

}

- (void)_sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  void *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesMap, "objectForKeyedSubscript:", v11));
    if (v12)
    {
      if (objc_msgSend(v8, "needsUpdateToDeviceCloudRecord"))
        -[AADeviceManagerDaemon _accessoryDeviceUpdateCloudRecord:config:](self, "_accessoryDeviceUpdateCloudRecord:config:", v12, v8);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10001237C;
      v20[3] = &unk_1001E2790;
      v23 = v10;
      v20[4] = self;
      v21 = v8;
      v22 = v12;
      -[AADeviceManagerDaemon _sendConfigOverCBController:device:completion:](self, "_sendConfigOverCBController:device:completion:", v21, v12, v20);

      v13 = 0;
    }
    else
    {
      v17 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "AADevice not found");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (dword_10020F840 <= 90
        && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
      {
        v18 = CUPrintNSError(v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _sendDeviceConfig:identifier:completion:]", 90, "## Unable to send config to device with identifier: %@, error: %@", v11, v19);

      }
      if (v10)
        (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }

  }
  else
  {
    v14 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "AADevice identifier not found");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (dword_10020F840 <= 90
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
    {
      v15 = CUPrintNSError(v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _sendDeviceConfig:identifier:completion:]", 90, "## Unable to send config to device with identifier: %@, error: %@", 0, v16);

    }
    if (v10)
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }

}

- (void)_cbControllerEnsureStarted
{
  CBController **p_bluetoothController;
  CBController *v4;
  id v5;
  _QWORD v6[4];
  CBController *v7;
  AADeviceManagerDaemon *v8;

  p_bluetoothController = &self->_bluetoothController;
  v4 = self->_bluetoothController;
  if (!v4)
  {
    v5 = objc_alloc_init((Class)CBController);
    objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_bluetoothController, v5);
    objc_msgSend(v5, "setInvalidationHandler:", &stru_1001E27B0);
    if (dword_10020F840 <= 30
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _cbControllerEnsureStarted]", 30, "Activating CBController: %@", v5);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001254C;
    v6[3] = &unk_1001E2410;
    v4 = (CBController *)v5;
    v7 = v4;
    v8 = self;
    -[CBController activateWithCompletion:](v4, "activateWithCompletion:", v6);

  }
}

- (void)_cbControllerEnsureStopped
{
  CBController *bluetoothController;
  CBController *v4;

  bluetoothController = self->_bluetoothController;
  if (bluetoothController)
  {
    -[CBController invalidate](bluetoothController, "invalidate");
    v4 = self->_bluetoothController;
    self->_bluetoothController = 0;

  }
}

- (void)_cbDiscoveryEnsureStarted
{
  CBDiscovery **p_bluetoothDeviceDiscovery;
  CBDiscovery *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  CBDiscovery *v10;
  AADeviceManagerDaemon *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  AADeviceManagerDaemon *v15;
  _QWORD v16[4];
  id v17;
  AADeviceManagerDaemon *v18;
  _QWORD v19[4];
  id v20;
  AADeviceManagerDaemon *v21;

  p_bluetoothDeviceDiscovery = &self->_bluetoothDeviceDiscovery;
  v4 = self->_bluetoothDeviceDiscovery;
  if (!v4)
  {
    v5 = objc_alloc_init((Class)CBDiscovery);
    objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_bluetoothDeviceDiscovery, v5);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001283C;
    v19[3] = &unk_1001E23C0;
    v6 = v5;
    v20 = v6;
    v21 = self;
    objc_msgSend(v6, "setDeviceFoundHandler:", v19);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100012858;
    v16[3] = &unk_1001E23C0;
    v7 = v6;
    v17 = v7;
    v18 = self;
    objc_msgSend(v7, "setDeviceLostHandler:", v16);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100012874;
    v13[3] = &unk_1001E23E8;
    v8 = v7;
    v14 = v8;
    v15 = self;
    objc_msgSend(v8, "setInterruptionHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100012908;
    v12[3] = &unk_1001E20E8;
    v12[4] = self;
    objc_msgSend(v8, "setInvalidationHandler:", v12);
    objc_msgSend(v8, "setDiscoveryFlags:", (unint64_t)objc_msgSend(v8, "discoveryFlags") | 0x80000200000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012988;
    v9[3] = &unk_1001E2410;
    v4 = (CBDiscovery *)v8;
    v10 = v4;
    v11 = self;
    -[CBDiscovery activateWithCompletion:](v4, "activateWithCompletion:", v9);

  }
}

- (void)_cbDiscoveryEnsureStopped
{
  CBDiscovery *bluetoothDeviceDiscovery;
  CBDiscovery *v4;

  bluetoothDeviceDiscovery = self->_bluetoothDeviceDiscovery;
  if (bluetoothDeviceDiscovery)
  {
    -[CBDiscovery invalidate](bluetoothDeviceDiscovery, "invalidate");
    v4 = self->_bluetoothDeviceDiscovery;
    self->_bluetoothDeviceDiscovery = 0;

  }
}

- (void)_coreBluetoothDeviceFound:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSMutableDictionary *devicesMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  if (v4)
  {
    if (objc_msgSend(v13, "vendorID") == 76)
    {
      v5 = objc_msgSend(v13, "productID") - 8194;
      if (v5 <= 0x24 && ((1 << v5) & 0x1C7BB7FF9BLL) != 0)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesMap, "objectForKeyedSubscript:", v4));
        if (v6)
        {
          v7 = v6;
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "coreBluetoothDevice"));

          v9 = objc_msgSend(v7, "updateWithCBDevice:", v13);
          if (!v8
            && dword_10020F840 <= 30
            && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
          {
            LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _coreBluetoothDeviceFound:]", 30, "AADevice updated from CBDiscovery: %@", v7);
          }
        }
        else
        {
          v7 = objc_msgSend(objc_alloc((Class)AudioAccessoryDevice), "initWithIdentifier:", v4);
          devicesMap = self->_devicesMap;
          if (!devicesMap)
          {
            v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            v12 = self->_devicesMap;
            self->_devicesMap = v11;

            devicesMap = self->_devicesMap;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](devicesMap, "setObject:forKeyedSubscript:", v7, v4);
          v9 = objc_msgSend(v7, "updateWithCBDevice:", v13);
          if (dword_10020F840 <= 30
            && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
          {
            LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _coreBluetoothDeviceFound:]", 30, "AADevice found from CBDiscovery: %@", v7);
          }
        }
        -[AADeviceManagerDaemon _accessoryDeviceFound:withChange:](self, "_accessoryDeviceFound:withChange:", v7, v9);

      }
    }
  }
  else if (dword_10020F840 <= 90
         && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
  {
    LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _coreBluetoothDeviceFound:]", 90, "CBDevice identifier not found, %@", v13);
  }

}

- (void)_coreBluetoothDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesMap, "objectForKeyedSubscript:", v4));
    if (v5)
    {
      if (dword_10020F840 <= 30
        && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
      {
        LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _coreBluetoothDeviceLost:]", 30, "AADevice lost: %@", v5);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devicesMap, "setObject:forKeyedSubscript:", 0, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AAServicesDaemon sharedAAServicesDaemon](AAServicesDaemon, "sharedAAServicesDaemon"));
      objc_msgSend(v6, "reportDeviceLost:", v5);

    }
  }
  else if (dword_10020F840 <= 90
         && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
  {
    LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _coreBluetoothDeviceLost:]", 90, "CBDevice identifier not found, %@", v7);
  }

}

- (id)_getCurrentAudioOwner
{
  NSMutableDictionary *devicesMap;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000110B4;
  v10 = sub_1000110C4;
  v11 = 0;
  devicesMap = self->_devicesMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012F58;
  v5[3] = &unk_1001E2748;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_sendConfigOverCBController:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  CBController *bluetoothController;
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "coreBluetoothDevice"));
  if (!v11)
  {
    v11 = objc_alloc_init((Class)CBDevice);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    objc_msgSend(v11, "setIdentifier:", v12);

  }
  v13 = objc_alloc_init((Class)CBDeviceSettings);
  objc_msgSend(v13, "setAclPriority:", objc_msgSend(v10, "aclPriority"));
  objc_msgSend(v13, "setAdaptiveVolumeConfig:", objc_msgSend(v10, "adaptiveVolumeConfig"));
  objc_msgSend(v13, "setAllowsAutoRoute:", objc_msgSend(v10, "allowsAutoRoute"));
  objc_msgSend(v13, "setAudioRouteHidden:", objc_msgSend(v10, "audioRouteHidden"));
  objc_msgSend(v13, "setClickHoldModeLeft:", objc_msgSend(v10, "clickHoldModeLeft"));
  objc_msgSend(v13, "setClickHoldModeRight:", objc_msgSend(v10, "clickHoldModeRight"));
  objc_msgSend(v13, "setConversationDetectConfig:", objc_msgSend(v10, "conversationDetectConfig"));
  objc_msgSend(v13, "setCrownRotationDirection:", objc_msgSend(v10, "crownRotationDirection"));
  objc_msgSend(v13, "setDoubleTapActionLeft:", objc_msgSend(v10, "doubleTapActionLeft"));
  objc_msgSend(v13, "setDoubleTapActionRight:", objc_msgSend(v10, "doubleTapActionRight"));
  objc_msgSend(v13, "setEndCallConfig:", objc_msgSend(v10, "endCallConfig"));
  objc_msgSend(v13, "setListeningMode:", objc_msgSend(v10, "listeningMode"));
  objc_msgSend(v13, "setListeningModeConfigs:", objc_msgSend(v10, "listeningModeConfigs"));
  objc_msgSend(v13, "setMicrophoneMode:", objc_msgSend(v10, "microphoneMode"));
  objc_msgSend(v13, "setMuteControlConfig:", objc_msgSend(v10, "muteControlConfig"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  objc_msgSend(v13, "setName:", v14);

  objc_msgSend(v13, "setPlacementMode:", objc_msgSend(v10, "placementMode"));
  objc_msgSend(v13, "setRelinquishAudioRoute:", objc_msgSend(v10, "relinquishAudioRoute"));
  objc_msgSend(v13, "setSelectiveSpeechListeningConfig:", objc_msgSend(v10, "selectiveSpeechListeningConfig"));
  objc_msgSend(v13, "setSmartRoutingMode:", objc_msgSend(v10, "smartRoutingMode"));
  objc_msgSend(v13, "setSpatialAudioAllowed:", objc_msgSend(v10, "spatialAudioAllowed"));
  v15 = objc_msgSend(v10, "spatialAudioMode");

  objc_msgSend(v13, "setSpatialAudioMode:", v15);
  bluetoothController = self->_bluetoothController;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000132BC;
  v18[3] = &unk_1001E2070;
  v18[4] = v13;
  v19 = v9;
  v17 = v9;
  -[CBController modifyDevice:settings:completion:](bluetoothController, "modifyDevice:settings:completion:", v11, v13, v18);

}

- (void)aaDeviceRecordsRemovedWithRecords:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000133E4;
  v7[3] = &unk_1001E23E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_aaDeviceRecordsRemovedWithRecords:(id)a3
{
  NSMutableDictionary *devicesMap;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync"))
  {
    devicesMap = self->_devicesMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100013488;
    v6[3] = &unk_1001E27D8;
    v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

- (void)aaDeviceRecordsUpdatedWithRecords:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001372C;
  block[3] = &unk_1001E23E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);

}

- (void)_aaDeviceRecordsUpdatedWithRecords:(id)a3
{
  NSMutableDictionary *devicesMap;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync"))
  {
    devicesMap = self->_devicesMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000137D0;
    v6[3] = &unk_1001E27D8;
    v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

- (void)_cloudSyncEnsureStarted
{
  _TtC15audioaccessoryd13DeviceManager *v3;
  _TtC15audioaccessoryd13DeviceManager *cloudSyncDeviceManager;

  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync")
    && !self->_cloudSyncDeviceManager)
  {
    if (dword_10020F840 <= 30
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _cloudSyncEnsureStarted]", 30, "starting cloud sync Device Manager");
    }
    v3 = (_TtC15audioaccessoryd13DeviceManager *)objc_claimAutoreleasedReturnValue(+[DeviceManager singleton](_TtC15audioaccessoryd13DeviceManager, "singleton"));
    cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
    self->_cloudSyncDeviceManager = v3;

    -[DeviceManager setAaDeviceDelegate:](self->_cloudSyncDeviceManager, "setAaDeviceDelegate:", self);
  }
}

- (void)_cloudSyncEnsureStopped
{
  _TtC15audioaccessoryd13DeviceManager *cloudSyncDeviceManager;

  if (self->_cloudSyncDeviceManager)
  {
    if (dword_10020F840 <= 30
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _cloudSyncEnsureStopped]", 30, "stopping cloud sync Device Manager");
    }
    -[DeviceManager setAaDeviceDelegate:](self->_cloudSyncDeviceManager, "setAaDeviceDelegate:", 0);
    cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
    self->_cloudSyncDeviceManager = 0;

  }
}

- (void)_loadDeviceRecordForDevice:(id)a3
{
  int v4;
  void *v5;
  _TtC15audioaccessoryd13DeviceManager *cloudSyncDeviceManager;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = _os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync");
  v5 = v10;
  if (v4)
  {
    cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bluetoothAddress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceManager fetchAADeviceRecordSyncWithAddress:](cloudSyncDeviceManager, "fetchAADeviceRecordSyncWithAddress:", v7));

    if (v8)
    {
      if (objc_msgSend(v10, "updateWithAADeviceRecord:", v8))
        -[AADeviceManagerDaemon _sendCloudConfigsToDevice:](self, "_sendCloudConfigsToDevice:", v10);
    }
    else if (dword_10020F840 <= 30
           && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bluetoothAddress"));
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _loadDeviceRecordForDevice:]", 30, "AADeviceRecord not found for address %@", v9);

    }
    v5 = v10;
  }

}

- (void)_saveDeviceRecordForDevice:(id)a3
{
  id v4;
  _TtC15audioaccessoryd14AADeviceRecord *v5;
  id v6;
  _TtC15audioaccessoryd13DeviceManager *cloudSyncDeviceManager;
  _QWORD v8[5];
  _TtC15audioaccessoryd14AADeviceRecord *v9;
  id v10;

  v4 = a3;
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync"))
  {
    v10 = 0;
    v5 = -[AADeviceRecord initWithDevice:error:]([_TtC15audioaccessoryd14AADeviceRecord alloc], "initWithDevice:error:", v4, &v10);
    v6 = v10;
    if (v5)
    {
      cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100013DC0;
      v8[3] = &unk_1001E2410;
      v8[4] = self;
      v9 = v5;
      -[DeviceManager updateAADeviceRecordWithRecord:completion:](cloudSyncDeviceManager, "updateAADeviceRecordWithRecord:completion:", v9, v8);

    }
    else if (dword_10020F840 <= 90
           && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _saveDeviceRecordForDevice:]", 90, "unable to save AADeviceRecord, record init failed with error: %@", v6);
    }

  }
}

- (void)_sendCloudConfigsToDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)AADeviceConfig);
  objc_msgSend(v5, "setListeningModeOffAllowed:", objc_msgSend(v4, "listeningModeOffAllowed"));
  -[AADeviceManagerDaemon _sendConfigOverAAController:device:completion:](self, "_sendConfigOverAAController:device:completion:", v5, v4, 0);

}

- (void)didDetectedWithHeadGesture:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AADeviceManagerDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013FC8;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)didStartStreamingWithIsStreaming:(BOOL)a3
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[4];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000141A4;
  block[3] = &unk_1001E25E0;
  v5 = a3;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)_onlyMuteAudioFeedbackFlagChanged:(unsigned int)a3
{
  unsigned int headGestureUpdateFlags;
  unsigned int v4;
  int v5;

  headGestureUpdateFlags = self->_headGestureUpdateFlags;
  if (((headGestureUpdateFlags ^ a3) & 3) != 0)
    return 0;
  v4 = (a3 >> 2) & 1;
  v5 = (headGestureUpdateFlags >> 2) & 1;
  if (v4 == v5)
    return 0;
  if (dword_10020F840 <= 30 && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _onlyMuteAudioFeedbackFlagChanged:]", 30, "Only Mute Audio Feedback flag has changed newHeadGestureDetectionFlag %d and previous headGestureDetectionMuteAudioFeedbackFlag %d", v4, v5);
  return 1;
}

- (void)_runHeadGestureDetection:(unsigned int)a3
{
  unsigned int v5;
  HGManager *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  HGManager *v10;
  HGManager *headGestureManager;
  id v12;

  v5 = -[AADeviceManagerDaemon _onlyMuteAudioFeedbackFlagChanged:](self, "_onlyMuteAudioFeedbackFlagChanged:");
  self->_headGestureUpdateFlags = a3;
  if (v5 && (v6 = self->_headGestureManager) != 0)
  {
    -[HGManager setMuteAudioFeedback:](v6, "setMuteAudioFeedback:", (a3 >> 2) & 1);
  }
  else
  {
    if (dword_10020F840 <= 30
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    {
      v7 = CFSTR("YES");
      if ((a3 & 3) == 0)
        v7 = CFSTR("NO");
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _runHeadGestureDetection:]", 30, "shouldStartHeadGestureManager %@", v7);
    }
    if ((a3 & 3) != 0)
    {
      if (self->_headGestureManager)
        -[AADeviceManagerDaemon stopHeadGestureManager](self, "stopHeadGestureManager");
      v12 = objc_alloc_init((Class)HGConfiguration);
      if ((a3 & 1) != 0)
      {
        v8 = objc_alloc_init((Class)HGAudioFeedbackConfiguration);
        objc_msgSend(v12, "setAudioFeedbackConfig:", v8);

        objc_msgSend(v12, "setRequestPartGestures:", 1);
      }
      if ((a3 & 2) != 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "audioFeedbackConfig"));
        objc_msgSend(v9, "setEnableAudioFeedback:", 1);

      }
      v10 = (HGManager *)objc_msgSend(objc_alloc((Class)HGManager), "initWithDelegate:config:", self, v12);
      headGestureManager = self->_headGestureManager;
      self->_headGestureManager = v10;

      if (dword_10020F840 <= 30
        && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
      {
        LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon _runHeadGestureDetection:]", 30, "Starting Head Gesture Manager");
      }
      -[HGManager start](self->_headGestureManager, "start");
      -[HGManager setMuteAudioFeedback:](self->_headGestureManager, "setMuteAudioFeedback:", (a3 >> 2) & 1);

    }
    else
    {
      -[AADeviceManagerDaemon stopHeadGestureManager](self, "stopHeadGestureManager");
    }
  }
}

- (void)startHeadGestureManagerWithFlags:(unsigned int)a3
{
  if (self->_headGestureUpdateFlags == a3)
  {
    if (dword_10020F840 <= 10
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 10)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon startHeadGestureManagerWithFlags:]", 10, "Previous HeadgestureManager was running with same flags, returning");
    }
  }
  else
  {
    -[AADeviceManagerDaemon _runHeadGestureDetection:](self, "_runHeadGestureDetection:");
  }
}

- (void)stopHeadGestureManager
{
  HGManager *headGestureManager;

  if (self->_headGestureManager)
  {
    if (dword_10020F840 <= 30
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    {
      LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon stopHeadGestureManager]", 30, "Stopping Head Gesture Manager");
    }
    -[HGManager stop](self->_headGestureManager, "stop");
    headGestureManager = self->_headGestureManager;
    self->_headGestureManager = 0;

    self->_headGestureUpdateFlags = 0;
  }
}

- (void)smartRoutingStateUpdated:(unsigned int)a3 ForDeviceIdentifier:(id)a4
{
  id v6;
  OS_dispatch_queue *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014648;
  block[3] = &unk_1001E2800;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);

}

- (void)_handleAssistantLanguageChanged:(id)a3
{
  NSMutableDictionary *devicesMap;
  _QWORD v4[5];

  devicesMap = self->_devicesMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014824;
  v4[3] = &unk_1001E27D8;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)_languageChangeMonitoringEnsureStarted
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleAssistantLanguageChanged:", AFLanguageCodeDidChangeNotification, 0);

}

- (void)_languageChangeMonitoringEnsureStopped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AFLanguageCodeDidChangeNotification, 0);

}

- (void)_sendSiriMultitoneConfigToDevice:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (MGGetBoolAnswer(CFSTR("DeviceSupportsGenerativeModelSystems")))
  {
    if (AFDeviceSupportsSystemAssistantExperience())
      v5 = 1;
    else
      v5 = 2;
    objc_msgSend(v4, "setSiriMultitoneEnabled:", v5);
    v6 = objc_alloc_init((Class)AADeviceConfig);
    objc_msgSend(v6, "setEnableSiriMultitone:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000149C0;
    v8[3] = &unk_1001E2410;
    v9 = v4;
    v10 = v6;
    -[AADeviceManagerDaemon _sendDeviceConfig:identifier:completion:](self, "_sendDeviceConfig:identifier:completion:", v6, v7, v8);

  }
}

- (void)downloadHRTFAsset
{
  _TtC15audioaccessoryd13DeviceManager *cloudSyncDeviceManager;
  _QWORD v4[5];

  cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
  if (cloudSyncDeviceManager)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100014B74;
    v4[3] = &unk_1001E2868;
    v4[4] = self;
    -[DeviceManager fetchSoundProfileRecordWithCompletion:](cloudSyncDeviceManager, "fetchSoundProfileRecordWithCompletion:", v4);
  }
  else if (dword_10020F840 <= 90
         && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 90)))
  {
    LogPrintF(&dword_10020F840, "-[AADeviceManagerDaemon downloadHRTFAsset]", 90, "## _cloudSyncDeviceManager is invalid");
  }
}

- (BOOL)_getBoolPreferencesForKey:(id)a3
{
  __CFString *v3;
  int AppBooleanValue;

  v3 = (__CFString *)a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.AudioAccessory"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, CFSTR("com.apple.AudioAccessory"), 0);

  return AppBooleanValue != 0;
}

- (void)_setHRTFAssetDownloadOTA
{
  self->_hRTFDownloadOTATriggered = 1;
  -[AADeviceManagerDaemon _setPreferencesForKey:withBoolValue:](self, "_setPreferencesForKey:withBoolValue:", CFSTR("HRTFDownloadOTATriggered"), 1);
}

- (void)_setPreferencesForKey:(id)a3 withBoolValue:(BOOL)a4
{
  CFPropertyListRef *v4;

  v4 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a4)
    v4 = (CFPropertyListRef *)&kCFBooleanFalse;
  CFPreferencesSetAppValue((CFStringRef)a3, *v4, CFSTR("com.apple.AudioAccessory"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.AudioAccessory"));
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
  objc_storeStrong((id *)&self->_headGestureManager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_devicesMap, 0);
  objc_storeStrong((id *)&self->_cloudSyncDeviceManager, 0);
  objc_storeStrong((id *)&self->_bluetoothController, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceDiscovery, 0);
  objc_storeStrong((id *)&self->_aaController, 0);
}

@end
