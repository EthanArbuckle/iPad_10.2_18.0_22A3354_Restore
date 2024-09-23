@implementation BTShareAudioSessionDaemon

- (BTShareAudioSessionDaemon)init
{
  BTShareAudioSessionDaemon *v2;
  BTShareAudioSessionDaemon *v3;
  BTShareAudioSessionDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTShareAudioSessionDaemon;
  v2 = -[BTShareAudioSessionDaemon init](&v6, "init");
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
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009784C;
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
  block[2] = sub_100097954;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    -[BTShareAudioSessionDaemon _reportProgress:](self, "_reportProgress:", 20);
    -[BTShareAudioSessionDaemon _cleanup](self, "_cleanup");
    if (dword_1002100A8 <= 30
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _invalidate]", 30, "Invalidated");
    }
  }
}

- (void)_run
{
  int mode;

  mode = self->_mode;
  if (mode == 2)
  {
    -[BTShareAudioSessionDaemon _runStory6TV](self, "_runStory6TV");
  }
  else if (mode == 1)
  {
    -[BTShareAudioSessionDaemon _runStory6iOS](self, "_runStory6iOS");
  }
  else
  {
    -[BTShareAudioSessionDaemon _runDefault](self, "_runDefault");
  }
}

- (void)_runDefault
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;

  if (!self->_invalidateCalled)
  {
    v3 = -[BTShareAudioSessionDaemon _runInit](self, "_runInit");
    if (v3 == 4 || v3 == 2)
    {
      v4 = -[BTShareAudioSessionDaemon _runScannerProxPairing](self, "_runScannerProxPairing");
      if (v4 == 4 || v4 == 2)
      {
        v5 = -[BTShareAudioSessionDaemon _runScannerNearbyInfo](self, "_runScannerNearbyInfo");
        if (v5 == 4 || v5 == 2)
        {
          v6 = -[BTShareAudioSessionDaemon _runAdvertiser](self, "_runAdvertiser");
          if (v6 == 4 || v6 == 2)
          {
            v7 = -[BTShareAudioSessionDaemon _runWaitForProxTrigger](self, "_runWaitForProxTrigger");
            if (v7 == 4 || v7 == 2)
            {
              v8 = -[BTShareAudioSessionDaemon _runConfirm](self, "_runConfirm");
              if (v8 == 4 || v8 == 2)
              {
                if (self->_triggerediOS)
                {
                  v9 = -[BTShareAudioSessionDaemon _runGuestiOSConnect](self, "_runGuestiOSConnect");
                  if (v9 != 4 && v9 != 2)
                    return;
                  v10 = -[BTShareAudioSessionDaemon _runGuestiOSPairSetupPublic](self, "_runGuestiOSPairSetupPublic");
                  if (v10 != 4 && v10 != 2)
                    return;
                  v11 = -[BTShareAudioSessionDaemon _runGuestiOSShareAudio](self, "_runGuestiOSShareAudio");
                  if (v11 != 2 && v11 != 4)
                    return;
                }
                else if ((-[SFDevice paired](self->_triggeredDevice, "paired") & 1) == 0)
                {
                  v12 = -[BTShareAudioSessionDaemon _runShowHeadphonesPairingInstructions](self, "_runShowHeadphonesPairingInstructions");
                  if (v12 != 4 && v12 != 2)
                    return;
                  v13 = -[BTShareAudioSessionDaemon _runWaitForGuestHeadphonesPairingMode](self, "_runWaitForGuestHeadphonesPairingMode");
                  if (v13 != 4 && v13 != 2)
                    return;
                }
                v14 = -[BTShareAudioSessionDaemon _runConnectGuestHeadphones](self, "_runConnectGuestHeadphones");
                if (v14 == 4 || v14 == 2)
                {
                  v15 = -[BTShareAudioSessionDaemon _runWaitForGuestHeadphones](self, "_runWaitForGuestHeadphones");
                  if (v15 == 4 || v15 == 2)
                    -[BTShareAudioSessionDaemon _runFinish](self, "_runFinish");
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_runStory6iOS
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  if (!self->_invalidateCalled)
  {
    v3 = -[BTShareAudioSessionDaemon _runInit](self, "_runInit");
    if (v3 == 4 || v3 == 2)
    {
      v4 = -[BTShareAudioSessionDaemon _runGuestiOSConnect](self, "_runGuestiOSConnect");
      if (v4 == 4 || v4 == 2)
      {
        v5 = -[BTShareAudioSessionDaemon _runGuestiOSPairSetupPublic](self, "_runGuestiOSPairSetupPublic");
        if (v5 == 4 || v5 == 2)
        {
          v6 = -[BTShareAudioSessionDaemon _runGuestiOSShareAudio](self, "_runGuestiOSShareAudio");
          if (v6 == 4 || v6 == 2)
          {
            v7 = -[BTShareAudioSessionDaemon _runConnectGuestHeadphones](self, "_runConnectGuestHeadphones");
            if (v7 == 4 || v7 == 2)
            {
              v8 = -[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnect](self, "_runGuestiOSShareAudioConnect");
              if (v8 == 4 || v8 == 2)
                -[BTShareAudioSessionDaemon _runFinish](self, "_runFinish");
            }
          }
        }
      }
    }
  }
}

- (void)_runStory6TV
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  if (!self->_invalidateCalled)
  {
    v3 = -[BTShareAudioSessionDaemon _runInit](self, "_runInit");
    if (v3 == 4 || v3 == 2)
    {
      v4 = -[BTShareAudioSessionDaemon _runScannerProxPairing](self, "_runScannerProxPairing");
      if (v4 == 4 || v4 == 2)
      {
        v5 = -[BTShareAudioSessionDaemon _runShareAudioServiceStart](self, "_runShareAudioServiceStart");
        if (v5 == 4 || v5 == 2)
        {
          v6 = -[BTShareAudioSessionDaemon _runAdvertiser](self, "_runAdvertiser");
          if (v6 == 4 || v6 == 2)
          {
            v7 = -[BTShareAudioSessionDaemon _runWaitForConfigRequestOrProxTrigger](self, "_runWaitForConfigRequestOrProxTrigger");
            if (v7 == 4 || v7 == 2)
            {
              v8 = -[BTShareAudioSessionDaemon _runConfirm](self, "_runConfirm");
              if (v8 == 4 || v8 == 2)
              {
                if (self->_configRequestReceived)
                {
                  v9 = -[BTShareAudioSessionDaemon _runWaitForConnectRequest](self, "_runWaitForConnectRequest");
                  if (v9 != 2 && v9 != 4)
                    return;
                }
                else if ((-[SFDevice paired](self->_triggeredDevice, "paired") & 1) == 0)
                {
                  v10 = -[BTShareAudioSessionDaemon _runShowHeadphonesPairingInstructions](self, "_runShowHeadphonesPairingInstructions");
                  if (v10 != 4 && v10 != 2)
                    return;
                  v11 = -[BTShareAudioSessionDaemon _runWaitForGuestHeadphonesPairingMode](self, "_runWaitForGuestHeadphonesPairingMode");
                  if (v11 != 4 && v11 != 2)
                    return;
                }
                v12 = -[BTShareAudioSessionDaemon _runConnectGuestHeadphones](self, "_runConnectGuestHeadphones");
                if (v12 == 4 || v12 == 2)
                {
                  v13 = -[BTShareAudioSessionDaemon _runWaitForGuestHeadphones](self, "_runWaitForGuestHeadphones");
                  if (v13 == 4 || v13 == 2)
                    -[BTShareAudioSessionDaemon _runFinish](self, "_runFinish");
                }
              }
            }
          }
        }
      }
    }
  }
}

- (int)_runInit
{
  uint64_t Int64;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  int v12;
  uint64_t v13;
  int v16;
  uint64_t v17;
  int v19;
  SFClient *v20;
  SFClient *preventProxCardsClient;
  int v23;

  if (!self->_initialized)
  {
    v23 = 0;
    Int64 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("shaHeadphoneTrigger"), &v23);
    if (v23)
      v4 = 0;
    else
      v4 = Int64 == 0;
    v5 = !v4;
    self->_prefHeadphoneTrigger = v5;
    v6 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("shaiOSTrigger"), &v23);
    if (v23)
      v7 = 0;
    else
      v7 = v6 == 0;
    v8 = !v7;
    self->_prefiOSTrigger = v8;
    v9 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("shaColorCode"), &v23);
    if (v9 <= 0x7FFFFFFF && v9 >= (uint64_t)0xFFFFFFFF80000000 && v23 == 0)
      v12 = v9;
    else
      v12 = -1;
    self->_prefOverrideColorCode = v12;
    v13 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("shaProductID"), &v23);
    if (v13 <= 0x7FFFFFFF && v13 >= (uint64_t)0xFFFFFFFF80000000 && v23 == 0)
      v16 = v13;
    else
      v16 = -1;
    self->_prefOverrideProductID = v16;
    v17 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("shaRSSI"), 0);
    if ((unint64_t)(v17 - 1000) < 0xFFFFFFFFFFFFF831 || v17 == 0)
      v19 = -40;
    else
      v19 = v17;
    self->_prefRSSIThreshold = v19;
    self->_prefRespectDeviceSupport = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("ppWS"), &v23) == 0;
    if (!self->_preventProxCardsClient)
    {
      v20 = (SFClient *)objc_alloc_init((Class)SFClient);
      preventProxCardsClient = self->_preventProxCardsClient;
      self->_preventProxCardsClient = v20;

      -[SFClient activateAssertionWithIdentifier:](self->_preventProxCardsClient, "activateAssertionWithIdentifier:", CFSTR("com.apple.sharing.PreventProxCards"));
    }
    self->_initialized = 1;
    if (dword_1002100A8 <= 30
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runInit]", 30, "Initialized: RSSI threshold %d", self->_prefRSSIThreshold);
    }
  }
  return 4;
}

- (int)_runScannerProxPairing
{
  SFDeviceDiscovery *bleProxPairingScanner;
  SFDeviceDiscovery *v5;
  SFDeviceDiscovery *v6;
  SFDeviceDiscovery *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];

  if (!self->_prefHeadphoneTrigger)
    return 2;
  if (self->_configRequestReceived || self->_triggeredDevice && self->_triggeredNeedsSetupDevice)
  {
    if (self->_bleProxPairingScanner)
    {
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runScannerProxPairing]", 30, "BLE ProxPairing scanner stop on triggered device");
      }
      -[SFDeviceDiscovery invalidate](self->_bleProxPairingScanner, "invalidate");
      bleProxPairingScanner = self->_bleProxPairingScanner;
      self->_bleProxPairingScanner = 0;

    }
    return 2;
  }
  if (!self->_bleProxPairingScanner)
  {
    if (dword_1002100A8 <= 30
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runScannerProxPairing]", 30, "BLE ProxPairing scanner start");
    }
    v5 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    v6 = self->_bleProxPairingScanner;
    self->_bleProxPairingScanner = v5;
    v7 = v5;

    -[SFDeviceDiscovery setChangeFlags:](v7, "setChangeFlags:", 13);
    -[SFDeviceDiscovery setDiscoveryFlags:](v7, "setDiscoveryFlags:", 2);
    -[SFDeviceDiscovery setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](v7, "setPurpose:", CFSTR("ShareAudio"));
    -[SFDeviceDiscovery setScanRate:](v7, "setScanRate:", 50);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100098214;
    v10[3] = &unk_1001E3240;
    v10[4] = v7;
    v10[5] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](v7, "setDeviceFoundHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100098230;
    v9[3] = &unk_1001E3268;
    v9[4] = v7;
    v9[5] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](v7, "setDeviceChangedHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009824C;
    v8[3] = &unk_1001E2410;
    v8[4] = v7;
    v8[5] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v7, "activateWithCompletion:", v8);

  }
  return 4;
}

- (int)_runScannerNearbyInfo
{
  SFDeviceDiscovery *bleNearbyInfoScanner;
  SFDeviceDiscovery *v4;
  SFDeviceDiscovery *v6;
  SFDeviceDiscovery *v7;
  SFDeviceDiscovery *v8;
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];

  if (!self->_prefiOSTrigger)
    return 2;
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  if (self->_triggeredDevice)
  {
    if (bleNearbyInfoScanner)
    {
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runScannerNearbyInfo]", 30, "BLE NearbyInfo scanner stop on triggered device");
      }
      -[SFDeviceDiscovery invalidate](self->_bleNearbyInfoScanner, "invalidate");
      v4 = self->_bleNearbyInfoScanner;
      self->_bleNearbyInfoScanner = 0;

    }
    return 2;
  }
  if (!bleNearbyInfoScanner)
  {
    if (dword_1002100A8 <= 30
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runScannerNearbyInfo]", 30, "BLE NearbyInfo scanner start");
    }
    v6 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    v7 = self->_bleNearbyInfoScanner;
    self->_bleNearbyInfoScanner = v6;
    v8 = v6;

    -[SFDeviceDiscovery setChangeFlags:](v8, "setChangeFlags:", 13);
    -[SFDeviceDiscovery setDiscoveryFlags:](v8, "setDiscoveryFlags:", 1);
    -[SFDeviceDiscovery setDispatchQueue:](v8, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](v8, "setPurpose:", CFSTR("ShareAudio"));
    -[SFDeviceDiscovery setScanRate:](v8, "setScanRate:", 50);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100098564;
    v11[3] = &unk_1001E3240;
    v11[4] = v8;
    v11[5] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](v8, "setDeviceFoundHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100098580;
    v10[3] = &unk_1001E3268;
    v10[4] = v8;
    v10[5] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](v8, "setDeviceChangedHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10009859C;
    v9[3] = &unk_1001E2410;
    v9[4] = v8;
    v9[5] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v8, "activateWithCompletion:", v9);

  }
  return 4;
}

- (int)_runShareAudioServiceStart
{
  BTShareAudioService *v3;
  BTShareAudioService *shareAudioService;
  BTShareAudioService *v5;
  dispatch_queue_t v6;
  _QWORD v8[6];
  _QWORD v9[6];

  if (!self->_shareAudioService)
  {
    if (dword_1002100A8 <= 30
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runShareAudioServiceStart]", 30, "ShareAudio service start");
    }
    v3 = objc_alloc_init(BTShareAudioService);
    shareAudioService = self->_shareAudioService;
    self->_shareAudioService = v3;
    v5 = v3;

    v6 = dispatch_queue_create("ShareAudioService", 0);
    -[BTShareAudioService setDispatchQueue:](v5, "setDispatchQueue:", v6);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000987EC;
    v9[3] = &unk_1001E5568;
    v9[4] = v5;
    v9[5] = self;
    -[BTShareAudioService setConfigRequestHandler:](v5, "setConfigRequestHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100098888;
    v8[3] = &unk_1001E5568;
    v8[4] = v5;
    v8[5] = self;
    -[BTShareAudioService setConnectRequestHandler:](v5, "setConnectRequestHandler:", v8);
    -[BTShareAudioService activate](v5, "activate");

  }
  return 4;
}

- (void)_runShareAudioServiceConfigRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  CFTypeID v12;
  uint64_t v13;
  NSString *v14;
  NSString *guestHeadphonesName;
  id v16;
  id configResponseHandler;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100098BA0;
  v30 = sub_100098BB0;
  v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100098BB8;
  v23[3] = &unk_1001E2A58;
  v25 = &v26;
  v7 = a4;
  v24 = v7;
  v8 = objc_retainBlock(v23);
  if (dword_1002100A8 <= 30 && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runShareAudioServiceConfigRequest:responseHandler:]", 30, "Config request: %##@", v6);
  if (self->_configResponseHandler)
  {
    v18 = BTErrorF(4294960575, "Already handling config request");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v11 = (void *)v27[5];
    v27[5] = v19;
  }
  else
  {
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("btAd"), TypeID, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v11)
    {
      objc_storeStrong((id *)&self->_guestHeadphonesAddress, v11);
      v12 = CFStringGetTypeID();
      v13 = CFDictionaryGetTypedValue(v6, CFSTR("dname"), v12, 0);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue(v13);
      guestHeadphonesName = self->_guestHeadphonesName;
      self->_guestHeadphonesName = v14;

      self->_guestHeadphonesProductID = CFDictionaryGetInt64Ranged(v6, CFSTR("productID"), 0, 0xFFFFFFFFLL, 0);
      v16 = objc_retainBlock(v7);
      configResponseHandler = self->_configResponseHandler;
      self->_configResponseHandler = v16;

      self->_configRequestReceived = 1;
      -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 100);
      -[BTShareAudioSessionDaemon _run](self, "_run");
    }
    else
    {
      v20 = BTErrorF(4294960591, "No BT addr");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)v27[5];
      v27[5] = v21;

    }
  }

  ((void (*)(_QWORD *))v8[2])(v8);
  _Block_object_dispose(&v26, 8);

}

- (void)_runShareAudioServiceConfigResponse:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100098BA0;
  v16 = sub_100098BB0;
  v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100098E50;
  v9[3] = &unk_1001E2A58;
  v11 = &v12;
  v3 = a3;
  v10 = v3;
  v4 = objc_retainBlock(v9);
  v5 = (void *)MGCopyAnswer(CFSTR("BluetoothAddress"), 0);
  if (v5)
  {
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("btAd"));
    if (dword_1002100A8 <= 30
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runShareAudioServiceConfigResponse:]", 30, "Config response: %##@", v6);
    }
    (*((void (**)(id, _QWORD, _QWORD, id))v3 + 2))(v3, 0, 0, v6);
  }
  else
  {
    v7 = BTErrorF(4294960596, "Get Bluetooth address failed");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v6 = (id)v13[5];
    v13[5] = v8;
  }

  ((void (*)(_QWORD *))v4[2])(v4);
  _Block_object_dispose(&v12, 8);

}

- (void)_runShareAudioServiceConnectRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id connectResponseHandler;
  id v9;

  v9 = a3;
  v6 = a4;
  if (dword_1002100A8 <= 30 && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runShareAudioServiceConnectRequest:responseHandler:]", 30, "Connect request: %##@", v9);
  v7 = objc_retainBlock(v6);
  connectResponseHandler = self->_connectResponseHandler;
  self->_connectResponseHandler = v7;

  self->_connectRequestReceived = 1;
  -[BTShareAudioSessionDaemon _run](self, "_run");

}

- (int)_runAdvertiser
{
  SFService *bleNearbyActionAdvertiser;
  int DeviceClass;
  SFService *v5;
  SFService *v7;
  SFService *v8;
  SFService *v9;
  uint64_t v10;
  _QWORD v11[6];

  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (self->_triggeredDevice)
  {
    if (bleNearbyActionAdvertiser)
    {
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runAdvertiser]", 30, "BLE advertiser stop on triggered device");
      }
      -[SFService invalidate](self->_bleNearbyActionAdvertiser, "invalidate");
      v5 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = 0;

    }
    return 2;
  }
  else
  {
    if (!bleNearbyActionAdvertiser)
    {
      DeviceClass = GestaltGetDeviceClass(self, a2);
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runAdvertiser]", 30, "BLE advertiser start");
      }
      v7 = (SFService *)objc_alloc_init((Class)SFService);
      v8 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = v7;
      v9 = v7;

      -[SFService setAdvertiseRate:](v9, "setAdvertiseRate:", 60);
      if (DeviceClass == 4)
        v10 = 31;
      else
        v10 = 27;
      -[SFService setDeviceActionType:](v9, "setDeviceActionType:", v10);
      -[SFService setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
      -[SFService setIdentifier:](v9, "setIdentifier:", CFSTR("a5989962-d94b-4755-bbca-59ecf498ad2f"));
      -[SFService setLabel:](v9, "setLabel:", CFSTR("ShareAudio"));
      -[SFService setNeedsSetup:](v9, "setNeedsSetup:", 1);
      -[SFService setPairSetupDisabled:](v9, "setPairSetupDisabled:", 1);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000991A0;
      v11[3] = &unk_1001E2410;
      v11[4] = v9;
      v11[5] = self;
      -[SFService activateWithCompletion:](v9, "activateWithCompletion:", v11);

    }
    return 4;
  }
}

- (int)_runWaitForConfigRequestOrProxTrigger
{
  _BOOL4 configRequestReceived;
  int result;

  configRequestReceived = self->_configRequestReceived;
  result = 4;
  if (!configRequestReceived)
  {
    if (self->_triggeredDevice)
      return 4;
    else
      return 1;
  }
  return result;
}

- (int)_runWaitForProxTrigger
{
  if (self->_triggeredDevice)
    return 4;
  else
    return 1;
}

- (int)_runWaitForConnectRequest
{
  if (self->_connectRequestReceived)
    return 4;
  else
    return 1;
}

- (int)_runConfirm
{
  int confirmState;
  id v4;
  id configResponseHandler;

  confirmState = self->_confirmState;
  if (confirmState == 4)
  {
    v4 = objc_retainBlock(self->_configResponseHandler);
    configResponseHandler = self->_configResponseHandler;
    self->_configResponseHandler = 0;

    if (v4)
      -[BTShareAudioSessionDaemon _runShareAudioServiceConfigResponse:](self, "_runShareAudioServiceConfigResponse:", v4);

  }
  else if (confirmState != 2)
  {
    if (confirmState)
    {
      if (dword_1002100A8 <= 30)
      {
        if (dword_1002100A8 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1002100A8, 30))
            return self->_confirmState;
          confirmState = self->_confirmState;
        }
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runConfirm]", 30, "Confirm not ready yet (%d)", confirmState);
      }
    }
    else
    {
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runConfirm]", 30, "Confirm start: %@", self->_triggeredDevice);
      }
      self->_confirmState = 1;
      -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 100);
    }
  }
  return self->_confirmState;
}

- (int)_runGuestiOSConnect
{
  int guestiOSConnectState;
  id v5;
  SFDevice *darwinDevice;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];

  guestiOSConnectState = self->_guestiOSConnectState;
  if (guestiOSConnectState != 4 && guestiOSConnectState != 2)
  {
    if (guestiOSConnectState)
    {
      if (dword_1002100A8 <= 30)
      {
        if (dword_1002100A8 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1002100A8, 30))
            return self->_guestiOSConnectState;
          guestiOSConnectState = self->_guestiOSConnectState;
        }
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSConnect]", 30, "Guest iOS session not ready yet (%d)", guestiOSConnectState);
      }
    }
    else
    {
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSConnect]", 30, "Guest iOS session start");
      }
      self->_guestiOSConnectState = 1;
      -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 200);
      v5 = objc_alloc_init((Class)SFSession);
      objc_storeStrong((id *)&self->_guestiOSSession, v5);
      objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
      objc_msgSend(v5, "setLabel:", CFSTR("ShareAudio"));
      darwinDevice = self->_darwinDevice;
      if (!darwinDevice)
        darwinDevice = self->_triggeredDevice;
      objc_msgSend(v5, "setPeerDevice:", darwinDevice);
      objc_msgSend(v5, "setServiceIdentifier:", CFSTR("com.apple.sharing.ShareAudio"));
      objc_msgSend(v5, "setSessionFlags:", 1);
      objc_msgSend(v5, "setStatusMonitor:", self->_statusMonitor);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100099694;
      v12[3] = &unk_1001E2410;
      v12[4] = v5;
      v12[5] = self;
      objc_msgSend(v5, "setErrorHandler:", v12);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000997A4;
      v11[3] = &unk_1001E23E8;
      v11[4] = v5;
      v11[5] = self;
      objc_msgSend(v5, "setInterruptionHandler:", v11);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100099814;
      v10[3] = &unk_1001E23E8;
      v10[4] = v5;
      v10[5] = self;
      objc_msgSend(v5, "setInvalidationHandler:", v10);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100099884;
      v9[3] = &unk_1001E23E8;
      v9[4] = v5;
      v9[5] = self;
      objc_msgSend(v5, "setSessionStartedHandler:", v9);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100099924;
      v8[3] = &unk_1001E2410;
      v8[4] = v5;
      v8[5] = self;
      objc_msgSend(v5, "activateWithCompletion:", v8);

    }
  }
  return self->_guestiOSConnectState;
}

- (int)_runGuestiOSPairSetupPublic
{
  int guestiOSPairSetupPublicState;
  SFSession *v5;
  _QWORD v7[6];

  guestiOSPairSetupPublicState = self->_guestiOSPairSetupPublicState;
  if (guestiOSPairSetupPublicState != 4 && guestiOSPairSetupPublicState != 2)
  {
    if (guestiOSPairSetupPublicState)
    {
      if (dword_1002100A8 <= 30)
      {
        if (dword_1002100A8 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1002100A8, 30))
            return self->_guestiOSPairSetupPublicState;
          guestiOSPairSetupPublicState = self->_guestiOSPairSetupPublicState;
        }
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSPairSetupPublic]", 30, "Guest iOS PairSetup hasn't succeeded yet (%d)", guestiOSPairSetupPublicState);
      }
    }
    else
    {
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSPairSetupPublic]", 30, "Guest iOS PairSetup start");
      }
      self->_guestiOSPairSetupPublicState = 1;
      v5 = self->_guestiOSSession;
      -[SFSession setFixedPIN:](v5, "setFixedPIN:", CFSTR("public"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100099B94;
      v7[3] = &unk_1001E2410;
      v7[4] = v5;
      v7[5] = self;
      -[SFSession pairSetupWithFlags:completion:](v5, "pairSetupWithFlags:completion:", 16, v7);

    }
  }
  return self->_guestiOSPairSetupPublicState;
}

- (int)_runGuestiOSShareAudio
{
  int guestiOSShareAudioState;

  guestiOSShareAudioState = self->_guestiOSShareAudioState;
  if (guestiOSShareAudioState != 4 && guestiOSShareAudioState != 2)
  {
    if (guestiOSShareAudioState)
    {
      if (dword_1002100A8 <= 30)
      {
        if (dword_1002100A8 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1002100A8, 30))
            return self->_guestiOSShareAudioState;
          guestiOSShareAudioState = self->_guestiOSShareAudioState;
        }
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudio]", 30, "Guest iOS ShareAudio hasn't succeeded yet (%d)", guestiOSShareAudioState);
      }
    }
    else
    {
      self->_guestiOSShareAudioState = 1;
      -[BTShareAudioSessionDaemon _runGuestiOSShareAudioSendRequest](self, "_runGuestiOSShareAudioSendRequest");
    }
  }
  return self->_guestiOSShareAudioState;
}

- (void)_runGuestiOSShareAudioSendRequest
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  SFSession *guestiOSSession;
  OS_dispatch_queue *dispatchQueue;
  SFSession *v10;
  uint64_t v11;
  _QWORD v12[7];

  if (dword_1002100A8 <= 30 && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioSendRequest]", 30, "Guest iOS ShareAudio start");
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUBluetoothDevice addressString](self->_wxDevice, "addressString"));
  if (v4 || (v4 = (void *)MGCopyAnswer(CFSTR("BluetoothAddress"), 0)) != 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("btAd"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUBluetoothDevice name](self->_wxDevice, "name"));
    if (v5 || (v5 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0)) != 0)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dname"));

    }
    v6 = -[CUBluetoothDevice productIdentifier](self->_wxDevice, "productIdentifier");
    if ((_DWORD)v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("productID"));

    }
    guestiOSSession = self->_guestiOSSession;
    dispatchQueue = self->_dispatchQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100099FA0;
    v12[3] = &unk_1001E35F8;
    v12[4] = guestiOSSession;
    v12[5] = self;
    v12[6] = v3;
    v10 = guestiOSSession;
    -[SFSession appleIDAddProof:dispatchQueue:completion:](v10, "appleIDAddProof:dispatchQueue:completion:", v3, dispatchQueue, v12);

  }
  else
  {
    if (dword_1002100A8 <= 90
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioSendRequest]", 90, "### Get iOS ShareAudio get BT addr failed");
    }
    self->_guestiOSShareAudioState = 3;
    v11 = NSErrorF(NSOSStatusErrorDomain, 4294960535, "No iOS BT Addr");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v4);
  }

}

- (void)_runGuestiOSShareAudioProcessResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  SFSession *v10;
  OS_dispatch_queue *dispatchQueue;
  SFSession *v12;
  uint64_t v13;
  _QWORD v14[4];
  SFSession *v15;
  BTShareAudioSessionDaemon *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  if (v9)
  {
    if (dword_1002100A8 <= 90
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioProcessResponse:error:]", 90, "### Guest iOS ShareAudio error: %{error}", v9);
    }
    self->_guestiOSShareAudioState = 3;
    -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v9);
  }
  else
  {
    if (v8)
    {
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioProcessResponse:error:]", 30, "Guest iOS response: %##.16@", v8);
      }
      v10 = self->_guestiOSSession;
      dispatchQueue = self->_dispatchQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10009A34C;
      v14[3] = &unk_1001E55B8;
      v15 = v10;
      v16 = self;
      v17 = v8;
      v12 = v10;
      -[SFSession appleIDVerifyProof:dispatchQueue:completion:](v12, "appleIDVerifyProof:dispatchQueue:completion:", v17, dispatchQueue, v14);

    }
    else
    {
      if (dword_1002100A8 <= 90
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioProcessResponse:error:]", 90, "### Guest iOS ShareAudio error: no response");
      }
      self->_guestiOSShareAudioState = 3;
      v13 = NSErrorF(NSOSStatusErrorDomain, 4294960584, "No response");
      v12 = (SFSession *)objc_claimAutoreleasedReturnValue(v13);
      -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v12);
    }

  }
}

- (int)_runGuestiOSShareAudioConnect
{
  int guestiOSShareAudioConnectState;

  guestiOSShareAudioConnectState = self->_guestiOSShareAudioConnectState;
  if (guestiOSShareAudioConnectState != 4 && guestiOSShareAudioConnectState != 2)
  {
    if (guestiOSShareAudioConnectState)
    {
      if (dword_1002100A8 <= 30)
      {
        if (dword_1002100A8 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1002100A8, 30))
            return self->_guestiOSShareAudioConnectState;
          guestiOSShareAudioConnectState = self->_guestiOSShareAudioConnectState;
        }
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnect]", 30, "Guest iOS ShareAudio connect hasn't succeeded yet (%d)", guestiOSShareAudioConnectState);
      }
    }
    else
    {
      self->_guestiOSShareAudioConnectState = 1;
      -[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnectSendRequest](self, "_runGuestiOSShareAudioConnectSendRequest");
    }
  }
  return self->_guestiOSShareAudioConnectState;
}

- (void)_runGuestiOSShareAudioConnectSendRequest
{
  id v3;
  SFSession *guestiOSSession;
  SFSession *v5;
  _QWORD v6[6];

  if (dword_1002100A8 <= 30 && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnectSendRequest]", 30, "Guest iOS ShareAudio connect start");
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  guestiOSSession = self->_guestiOSSession;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009A778;
  v6[3] = &unk_1001E5590;
  v6[4] = guestiOSSession;
  v6[5] = self;
  v5 = guestiOSSession;
  -[SFSession sendRequestID:options:request:responseHandler:](v5, "sendRequestID:options:request:responseHandler:", CFSTR("_shCn"), 0, v3, v6);

}

- (void)_runGuestiOSShareAudioConnectProcessResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
  {
    if (dword_1002100A8 <= 90
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnectProcessResponse:error:]", 90, "### Guest iOS ShareAudio connect error: %{error}", v6);
    }
    self->_guestiOSShareAudioConnectState = 3;
    -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v6);
  }
  else
  {
    if (dword_1002100A8 <= 30
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnectProcessResponse:error:]", 30, "Guest iOS ShareAudio connect response: %##.16@", v7);
    }
    self->_guestiOSShareAudioConnectState = 4;
    -[BTShareAudioSessionDaemon _run](self, "_run");
  }

}

- (int)_runShowHeadphonesPairingInstructions
{
  int result;

  result = self->_guestHeadphonesInstructionsState;
  if (!result)
  {
    if (!self->_triggeredNeedsSetupDevice)
    {
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runShowHeadphonesPairingInstructions]", 30, "Guest headphone show instructions: %@", self->_triggeredDevice);
      }
      -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 120);
    }
    result = 4;
    self->_guestHeadphonesInstructionsState = 4;
  }
  return result;
}

- (int)_runWaitForGuestHeadphonesPairingMode
{
  if (self->_triggeredNeedsSetupDevice)
    return 4;
  else
    return 1;
}

- (int)_runConnectGuestHeadphones
{
  int result;
  NSString *v4;
  NSString *guestHeadphonesAddress;
  NSString *v6;
  SFSession *guestiOSSession;
  SFSession *v8;
  SFSession *v9;
  void *v10;
  id v11;
  _QWORD v12[6];

  result = self->_guestHeadphonesConnectState;
  if (!result)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[CUBluetoothDevice addressString](self->_wxDevice, "addressString"));
    guestHeadphonesAddress = v4;
    if (!v4)
      guestHeadphonesAddress = self->_guestHeadphonesAddress;
    v6 = guestHeadphonesAddress;

    guestiOSSession = self->_guestiOSSession;
    if (guestiOSSession)
      v8 = guestiOSSession;
    else
      v8 = (SFSession *)objc_claimAutoreleasedReturnValue(-[BTShareAudioService sfSession](self->_shareAudioService, "sfSession"));
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFSession pairingDeriveKeyForIdentifier:keyLength:](v8, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("ShareAudio"), 16));
    if (dword_1002100A8 <= 30
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runConnectGuestHeadphones]", 30, "Guest headphone connect start: DA %@, GA %@, GK %{mask}", v6, self->_guestDeviceAddress, v10);
    }
    self->_guestHeadphonesConnectState = 1;
    -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 300);
    v11 = objc_alloc_init((Class)BTBluetoothPairingSession);
    objc_storeStrong((id *)&self->_guestHeadphonesPairingSession, v11);
    objc_msgSend(v11, "setDeviceAddress:", v6);
    objc_msgSend(v11, "setDispatchQueue:", self->_dispatchQueue);
    if (self->_triggerediOS || !-[SFDevice paired](self->_triggeredDevice, "paired"))
    {
      if (self->_guestDeviceAddress)
        objc_msgSend(v11, "setGuestAddress:");
      objc_msgSend(v11, "setGuestKey:", v10);
      objc_msgSend(v11, "setGuestMode:", 1);
      objc_msgSend(v11, "setGuestPermanent:", self->_confirmPermanent);
      if (self->_triggerediOS && !self->_guestiOSContact || self->_mode == 1)
        objc_msgSend(v11, "setUserNotInContacts:", 1);
    }
    else
    {
      objc_msgSend(v11, "setAggregate:", 1);
      objc_msgSend(v11, "setConnectOnly:", 1);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009AB88;
    v12[3] = &unk_1001E2410;
    v12[4] = v11;
    v12[5] = self;
    objc_msgSend(v11, "setCompletionHandler:", v12);
    objc_msgSend(v11, "activate");

    return self->_guestHeadphonesConnectState;
  }
  return result;
}

- (int)_runWaitForGuestHeadphones
{
  int guestiOSWaitForRouteState;
  void *v5;
  void *v6;
  void *v7;

  guestiOSWaitForRouteState = self->_guestiOSWaitForRouteState;
  if (guestiOSWaitForRouteState != 4 && guestiOSWaitForRouteState != 2)
  {
    if (guestiOSWaitForRouteState)
    {
      if (dword_1002100A8 <= 30)
      {
        if (dword_1002100A8 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1002100A8, 30))
            return self->_guestiOSWaitForRouteState;
          guestiOSWaitForRouteState = self->_guestiOSWaitForRouteState;
        }
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runWaitForGuestHeadphones]", 30, "Guest iOS wait for headphones hasn't succeeded yet (%d)", guestiOSWaitForRouteState);
      }
    }
    else
    {
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runWaitForGuestHeadphones]", 30, "Guest iOS waiting for headphones: %@", self->_guestHeadphonesAddress);
      }
      self->_guestiOSWaitForRouteState = 1;
      -[BTShareAudioSessionDaemon _reportProgress:](self, "_reportProgress:", 320);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", AVSystemController_PickableRoutesDidChangeNotification));
      objc_msgSend(v5, "setAttribute:forKey:error:", v6, AVSystemController_SubscribeToNotificationsAttribute, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v7, "addObserver:selector:name:object:", self, "_pickableRoutesChanged:", AVSystemController_PickableRoutesDidChangeNotification, v5);
      self->_observingPickableRoutes = 1;
      -[BTShareAudioSessionDaemon _pickableRoutesChanged](self, "_pickableRoutesChanged");

    }
  }
  return self->_guestiOSWaitForRouteState;
}

- (int)_runFinish
{
  id v3;
  id connectResponseHandler;
  NSString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  NSString *v13;

  v3 = objc_retainBlock(self->_connectResponseHandler);
  if (v3)
  {
    if (dword_1002100A8 < 31
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runFinish]", 30, "Connect response");
    }
    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, &__NSDictionary0__struct);
    connectResponseHandler = self->_connectResponseHandler;
    self->_connectResponseHandler = 0;

  }
  v5 = self->_guestHeadphonesRouteUID;
  if (v5)
  {
    if (dword_1002100A8 <= 30
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runFinish]", 30, "Shared audio route ID: '%@'", v5);
    }
    v12 = CFSTR("mediaRouteID");
    v13 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    -[BTShareAudioSessionDaemon _reportProgress:info:](self, "_reportProgress:info:", 40, v6);
  }
  else
  {
    if (dword_1002100A8 <= 90
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _runFinish]", 90, "### Shared audio route ID not found");
    }
    v10 = CFSTR("error");
    v7 = NSErrorWithOSStatusF(4294960569, "Audio route not found");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v11 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    -[BTShareAudioSessionDaemon _reportProgress:info:](self, "_reportProgress:info:", 50, v8);

  }
  -[BTShareAudioSessionDaemon _cleanup](self, "_cleanup");

  return 4;
}

- (void)_cleanup
{
  id v3;
  uint64_t v4;
  void *v5;
  id configResponseHandler;
  id v7;
  uint64_t v8;
  void *v9;
  id connectResponseHandler;
  SFService *bleNearbyActionAdvertiser;
  SFDeviceDiscovery *bleNearbyInfoScanner;
  SFDeviceDiscovery *bleProxPairingScanner;
  NSString *guestHeadphonesAddress;
  BTBluetoothPairingSession *guestHeadphonesPairingSession;
  SFSession *guestiOSSession;
  void *v17;
  SFClient *preventProxCardsClient;
  BTShareAudioService *shareAudioService;
  id progressHandler;
  SFDevice *triggeredDevice;
  SFDevice *triggeredNeedsSetupDevice;

  v3 = objc_retainBlock(self->_configResponseHandler);
  if (v3)
  {
    v4 = BTErrorF(4294960544, "Session ended");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (dword_1002100A8 < 91
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _cleanup]", 90, "### ShareAudio config request aborted: %{error}\n", v5);
    }
    (*((void (**)(id, void *, _QWORD, _QWORD))v3 + 2))(v3, v5, 0, 0);
    configResponseHandler = self->_configResponseHandler;
    self->_configResponseHandler = 0;

  }
  v7 = objc_retainBlock(self->_connectResponseHandler);
  if (v7)
  {
    v8 = BTErrorF(4294960544, "Session ended");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (dword_1002100A8 < 91
      && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
    {
      LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _cleanup]", 90, "### ShareAudio config request aborted: %{error}\n", v9);
    }
    (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v9, 0, 0);
    connectResponseHandler = self->_connectResponseHandler;
    self->_connectResponseHandler = 0;

  }
  -[SFService invalidate](self->_bleNearbyActionAdvertiser, "invalidate");
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  self->_bleNearbyActionAdvertiser = 0;

  -[SFDeviceDiscovery invalidate](self->_bleNearbyInfoScanner, "invalidate");
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  self->_bleNearbyInfoScanner = 0;

  -[SFDeviceDiscovery invalidate](self->_bleProxPairingScanner, "invalidate");
  bleProxPairingScanner = self->_bleProxPairingScanner;
  self->_bleProxPairingScanner = 0;

  self->_guestHeadphonesConnectState = 0;
  guestHeadphonesAddress = self->_guestHeadphonesAddress;
  self->_guestHeadphonesAddress = 0;

  -[BTBluetoothPairingSession invalidate](self->_guestHeadphonesPairingSession, "invalidate");
  guestHeadphonesPairingSession = self->_guestHeadphonesPairingSession;
  self->_guestHeadphonesPairingSession = 0;

  -[SFSession invalidate](self->_guestiOSSession, "invalidate");
  guestiOSSession = self->_guestiOSSession;
  self->_guestiOSSession = 0;

  if (self->_observingPickableRoutes)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "removeObserver:name:object:", self, AVSystemController_PickableRoutesDidChangeNotification, 0);
    self->_observingPickableRoutes = 0;

  }
  -[SFClient invalidate](self->_preventProxCardsClient, "invalidate");
  preventProxCardsClient = self->_preventProxCardsClient;
  self->_preventProxCardsClient = 0;

  -[BTShareAudioService invalidate](self->_shareAudioService, "invalidate");
  shareAudioService = self->_shareAudioService;
  self->_shareAudioService = 0;

  progressHandler = self->_progressHandler;
  self->_progressHandler = 0;

  triggeredDevice = self->_triggeredDevice;
  self->_triggeredDevice = 0;

  triggeredNeedsSetupDevice = self->_triggeredNeedsSetupDevice;
  self->_triggeredNeedsSetupDevice = 0;

  self->_triggerediOS = 0;
}

- (void)_bleScannerNearbyInfoDeviceFound:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  int v11;
  void *v12;

  v5 = a3;
  v6 = v5;
  if (!self->_triggeredDevice)
  {
    v12 = v5;
    if (objc_msgSend(v5, "paired"))
    {
      v6 = v12;
      if (dword_1002100A8 <= 10)
      {
        if (dword_1002100A8 != -1 || (v10 = _LogCategory_Initialize(&dword_1002100A8, 10), v6 = v12, v10))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 10, "Ignoring same-account device: %@", v6);
LABEL_12:
          v6 = v12;
        }
      }
    }
    else
    {
      if ((objc_msgSend(v12, "deviceFlags") & 0x800) != 0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bleDevice"));
        v8 = objc_msgSend(v7, "rssiEstimate");
        v9 = v8;
        if ((v8 & 0x80000000) != 0 && (int)v8 >= self->_prefRSSIThreshold)
        {
          if (dword_1002100A8 <= 30
            && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
          {
            LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 30, "Triggering proximity ShareAudio (iOS): RSSI %d, %@", v9, v12);
          }
          objc_storeStrong((id *)&self->_triggeredDevice, a3);
          self->_triggerediOS = 1;
          -[BTShareAudioSessionDaemon _run](self, "_run");
        }
        else if (dword_1002100A8 <= 10
               && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 10)))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 10, "Ignoring weak RSSI: %d < %d, %@", v9, self->_prefRSSIThreshold, v12);
        }

        goto LABEL_12;
      }
      v6 = v12;
      if (dword_1002100A8 <= 10)
      {
        if (dword_1002100A8 != -1 || (v11 = _LogCategory_Initialize(&dword_1002100A8, 10), v6 = v12, v11))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 10, "Ignoring unshareable: %@", v6);
          goto LABEL_12;
        }
      }
    }
  }

}

- (void)_bleScannerProxPairingDeviceFound:(id)a3
{
  id v3;
  id v5;
  void *v6;
  SFDevice **p_triggeredNeedsSetupDevice;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  int Int64Ranged;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *v28;
  NSString *guestHeadphonesAddress;
  unsigned int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v3 = a3;
  v5 = a3;
  v6 = v5;
  p_triggeredNeedsSetupDevice = &self->_triggeredNeedsSetupDevice;
  if (!self->_triggeredNeedsSetupDevice)
  {
    v8 = objc_msgSend(v5, "needsSetup");
    if ((v8 & 1) != 0 || !self->_triggeredDevice)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advertisementFields"));

      if ((v8 & 1) == 0
        && self->_prefRespectDeviceSupport
        && (objc_msgSend(v6, "deviceFlags") & 0x800) == 0)
      {
        if (dword_1002100A8 <= 10
          && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 10)))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring non-share device: %@", v6);
        }
        goto LABEL_45;
      }
      if ((CFDictionaryGetInt64Ranged(v10, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0) & 0x24) != 0)
      {
        if (dword_1002100A8 <= 10
          && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 10)))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring in-ear device: %@", v6);
        }
        goto LABEL_45;
      }
      if (CFDictionaryGetInt64(v10, CFSTR("lc"), 0))
      {
        if (dword_1002100A8 <= 10
          && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 10)))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring lid-closed device: %@", v6);
        }
        goto LABEL_45;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
      v12 = objc_msgSend(v11, "smoothedRSSI");
      v13 = v12;
      if ((v12 & 0x80000000) == 0)
      {
        if (dword_1002100A8 <= 10
          && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 10)))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring invalid RSSI: %d, %@", v13, v6);
        }
        goto LABEL_44;
      }
      if (v8)
        v14 = 4294967236;
      else
        v14 = 4294967251;
      if (v14 > v12)
      {
        if (dword_1002100A8 <= 10
          && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 10)))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring weak RSSI: %d < %d, %@", v13, v14, v6);
        }
        goto LABEL_44;
      }
      Int64Ranged = CFDictionaryGetInt64Ranged(v10, CFSTR("CnSv"), 0, 0xFFFFFFFFLL, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothAddress"));
      v17 = v16;
      if (Int64Ranged && objc_msgSend(v16, "length") == (id)6)
      {
        v30 = v8;
        v31 = v3;
        v33 = v11;
        v34 = v10;
        v35 = v6;
        v18 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v17), "bytes")));
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "attributeForKey:", AVSystemController_PickableRoutesAttribute));
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(_QWORD *)v37 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
              if (CFDictionaryGetInt64(v25, AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked, 0))
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", AVSystemController_RouteDescriptionKey_RouteUID));
                if (objc_msgSend(v26, "rangeOfString:options:", v19, 1) != (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  v6 = v35;
                  if (dword_1002100A8 <= 10
                    && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 10)))
                  {
                    LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring already-routed device: %@", v35);
                  }

                  v11 = v33;
                  v10 = v34;
                  goto LABEL_43;
                }

              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
            if (v22)
              continue;
            break;
          }
        }

        v10 = v34;
        v6 = v35;
        v11 = v33;
        v3 = v31;
        v8 = v30;
      }
      if ((v8 & 1) == 0 && !objc_msgSend(v6, "paired"))
        goto LABEL_34;
      if (!v17)
      {
        if (dword_1002100A8 <= 90
          && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 90, "Ignoring no address: %@", v6);
        }
        goto LABEL_43;
      }
      if (objc_msgSend(v17, "length") != (id)6)
      {
        if (dword_1002100A8 <= 90
          && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
        {
          LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 90, "Ignoring bad address: <%@>, %@", v17, v6);
        }
        goto LABEL_43;
      }
      v27 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v17), "bytes")));
      v28 = (NSString *)objc_claimAutoreleasedReturnValue(v27);
      guestHeadphonesAddress = self->_guestHeadphonesAddress;
      self->_guestHeadphonesAddress = v28;

      if (v8)
      {
        if (!self->_triggeredDevice)
          objc_storeStrong((id *)&self->_triggeredDevice, v3);
      }
      else
      {
LABEL_34:
        p_triggeredNeedsSetupDevice = &self->_triggeredDevice;
      }
      objc_storeStrong((id *)p_triggeredNeedsSetupDevice, v3);
      if (dword_1002100A8 <= 30
        && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
      {
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 30, "Triggering proximity ShareAudio (Headphones): RSSI %d, %@", v13, v6);
      }
      -[BTShareAudioSessionDaemon _run](self, "_run");
LABEL_43:

LABEL_44:
LABEL_45:

    }
  }

}

- (void)_pickableRoutesChanged:(id)a3
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009BC38;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_pickableRoutesChanged
{
  NSString *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSString *v10;
  NSString *guestHeadphonesRouteUID;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self->_guestiOSWaitForRouteState == 1)
  {
    v3 = self->_guestHeadphonesAddress;
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributeForKey:", AVSystemController_PickableRoutesAttribute));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", AVSystemController_RouteDescriptionKey_RouteUID));
            if (-[NSString rangeOfString:options:](v10, "rangeOfString:options:", v3, 1) != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if (dword_1002100A8 <= 30
                && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
              {
                LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _pickableRoutesChanged]", 30, "Guest iOS headphones found: %@", v10);
              }
              guestHeadphonesRouteUID = self->_guestHeadphonesRouteUID;
              self->_guestHeadphonesRouteUID = v10;

              self->_guestiOSWaitForRouteState = 4;
              -[BTShareAudioSessionDaemon _run](self, "_run");
              goto LABEL_17;
            }

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_17:

    }
  }
}

- (void)_reportError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v4 = a3;
  if (dword_1002100A8 <= 90 && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 90)))
    LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _reportError:]", 90, "### Error: %{error}", v4);
  v8 = CFSTR("error");
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = objc_retainBlock(self->_progressHandler);
  v7 = v6;
  if (v6)
    (*((void (**)(id, uint64_t, void *))v6 + 2))(v6, 50, v5);

}

- (void)_reportProgress:(int)a3
{
  uint64_t v3;
  const char *v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  if (dword_1002100A8 <= 30 && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
  {
    if ((int)v3 > 119)
    {
      if ((int)v3 <= 219)
      {
        switch((_DWORD)v3)
        {
          case 0x78:
            v5 = "ShowPairInstructions";
            goto LABEL_39;
          case 0xC8:
            v5 = "GuestiOSConnecting";
            goto LABEL_39;
          case 0xD2:
            v5 = "GuestiOSAuthenticated";
            goto LABEL_39;
        }
      }
      else if ((int)v3 > 309)
      {
        if ((_DWORD)v3 == 310)
        {
          v5 = "GuestHeadphonesConnected";
          goto LABEL_39;
        }
        if ((_DWORD)v3 == 320)
        {
          v5 = "GuestHeadphonesWaitForRoute";
          goto LABEL_39;
        }
      }
      else
      {
        if ((_DWORD)v3 == 220)
        {
          v5 = "GuestiOSWaitingForAccept";
          goto LABEL_39;
        }
        if ((_DWORD)v3 == 300)
        {
          v5 = "GuestHeadphonesConnecting";
          goto LABEL_39;
        }
      }
    }
    else if ((int)v3 <= 29)
    {
      switch((_DWORD)v3)
      {
        case 0:
          v5 = "Invalid";
          goto LABEL_39;
        case 0xA:
          v5 = "Activated";
          goto LABEL_39;
        case 0x14:
          v5 = "Invalidated";
          goto LABEL_39;
      }
    }
    else if ((int)v3 > 49)
    {
      if ((_DWORD)v3 == 50)
      {
        v5 = "Failed";
        goto LABEL_39;
      }
      if ((_DWORD)v3 == 100)
      {
        v5 = "Confirm";
        goto LABEL_39;
      }
    }
    else
    {
      if ((_DWORD)v3 == 30)
      {
        v5 = "Interrupted";
        goto LABEL_39;
      }
      if ((_DWORD)v3 == 40)
      {
        v5 = "Succeeded";
LABEL_39:
        LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _reportProgress:]", 30, "Progress: %s", v5);
        goto LABEL_40;
      }
    }
    v5 = "?";
    goto LABEL_39;
  }
LABEL_40:
  v6 = objc_retainBlock(self->_progressHandler);
  if (v6)
  {
    v7 = v6;
    (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, v3, 0);
    v6 = v7;
  }

}

- (void)_reportProgress:(int)a3 info:(id)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  id v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a3;
  v10 = a4;
  if (dword_1002100A8 <= 30 && (dword_1002100A8 != -1 || _LogCategory_Initialize(&dword_1002100A8, 30)))
  {
    if ((int)v4 > 119)
    {
      if ((int)v4 > 219)
      {
        if ((int)v4 > 309)
        {
          v6 = v10;
          if ((_DWORD)v4 == 310)
          {
            v7 = "GuestHeadphonesConnected";
            goto LABEL_40;
          }
          if ((_DWORD)v4 == 320)
          {
            v7 = "GuestHeadphonesWaitForRoute";
            goto LABEL_40;
          }
        }
        else
        {
          v6 = v10;
          if ((_DWORD)v4 == 220)
          {
            v7 = "GuestiOSWaitingForAccept";
            goto LABEL_40;
          }
          if ((_DWORD)v4 == 300)
          {
            v7 = "GuestHeadphonesConnecting";
            goto LABEL_40;
          }
        }
LABEL_39:
        v7 = "?";
        goto LABEL_40;
      }
      if ((_DWORD)v4 != 120)
      {
        v6 = v10;
        if ((_DWORD)v4 == 200)
        {
          v7 = "GuestiOSConnecting";
          goto LABEL_40;
        }
        if ((_DWORD)v4 == 210)
        {
          v7 = "GuestiOSAuthenticated";
          goto LABEL_40;
        }
        goto LABEL_39;
      }
      v7 = "ShowPairInstructions";
    }
    else
    {
      if ((int)v4 > 29)
      {
        if ((int)v4 > 49)
        {
          v6 = v10;
          if ((_DWORD)v4 == 50)
          {
            v7 = "Failed";
            goto LABEL_40;
          }
          if ((_DWORD)v4 == 100)
          {
            v7 = "Confirm";
            goto LABEL_40;
          }
        }
        else
        {
          v6 = v10;
          if ((_DWORD)v4 == 30)
          {
            v7 = "Interrupted";
            goto LABEL_40;
          }
          if ((_DWORD)v4 == 40)
          {
            v7 = "Succeeded";
LABEL_40:
            LogPrintF(&dword_1002100A8, "-[BTShareAudioSessionDaemon _reportProgress:info:]", 30, "Progress: %s: %##@", v7, v6);
            goto LABEL_41;
          }
        }
        goto LABEL_39;
      }
      if ((_DWORD)v4)
      {
        v6 = v10;
        if ((_DWORD)v4 == 10)
        {
          v7 = "Activated";
          goto LABEL_40;
        }
        if ((_DWORD)v4 == 20)
        {
          v7 = "Invalidated";
          goto LABEL_40;
        }
        goto LABEL_39;
      }
      v7 = "Invalid";
    }
    v6 = v10;
    goto LABEL_40;
  }
LABEL_41:
  v8 = objc_retainBlock(self->_progressHandler);
  v9 = v8;
  if (v8)
    (*((void (**)(id, uint64_t, id))v8 + 2))(v8, v4, v10);

}

- (void)_reportProgressTriggeredDevice:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSString *guestHeadphonesName;
  uint64_t v10;
  void *v11;
  uint64_t NSNumber;
  uint64_t v13;
  id v14;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self->_triggeredDevice, "bleDevice"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "advertisementFields"));

  v6 = objc_alloc_init((Class)NSMutableDictionary);
  if ((self->_prefOverrideColorCode & 0x80000000) == 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
LABEL_5:
    v8 = (void *)v7;
LABEL_6:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("colorCode"));
    goto LABEL_7;
  }
  if (self->_guestHeadphonesColorCode)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
    goto LABEL_5;
  }
  NSNumber = NSDictionaryGetNSNumber(v14, CFSTR("cc"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  if (v8)
    goto LABEL_6;
LABEL_7:

  guestHeadphonesName = self->_guestHeadphonesName;
  if (guestHeadphonesName)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", guestHeadphonesName, CFSTR("deviceName"));
  if (self->_prefOverrideProductID < 0)
  {
    if (!self->_guestHeadphonesProductID)
    {
      v13 = NSDictionaryGetNSNumber(v14, CFSTR("pid"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (!v11)
        goto LABEL_15;
      goto LABEL_14;
    }
    v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
  }
  v11 = (void *)v10;
LABEL_14:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("pid"));
LABEL_15:

  -[BTShareAudioSessionDaemon _reportProgress:info:](self, "_reportProgress:info:", v3, v6);
}

- (void)userConfirmed:(BOOL)a3
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009C56C;
  v4[3] = &unk_1001E31C8;
  v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, v4);
}

- (SFDevice)darwinDevice
{
  return self->_darwinDevice;
}

- (void)setDarwinDevice:(id)a3
{
  objc_storeStrong((id *)&self->_darwinDevice, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_statusMonitor, a3);
}

- (CUBluetoothDevice)wxDevice
{
  return self->_wxDevice;
}

- (void)setWxDevice:(id)a3
{
  objc_storeStrong((id *)&self->_wxDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wxDevice, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_darwinDevice, 0);
  objc_storeStrong((id *)&self->_triggeredNeedsSetupDevice, 0);
  objc_storeStrong((id *)&self->_triggeredDevice, 0);
  objc_storeStrong((id *)&self->_shareAudioService, 0);
  objc_storeStrong((id *)&self->_preventProxCardsClient, 0);
  objc_storeStrong((id *)&self->_guestiOSSession, 0);
  objc_storeStrong((id *)&self->_guestiOSDeviceAddress, 0);
  objc_storeStrong((id *)&self->_guestiOSContact, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesRouteUID, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesPairingSession, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesName, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesAddress, 0);
  objc_storeStrong((id *)&self->_guestDeviceAddress, 0);
  objc_storeStrong(&self->_connectResponseHandler, 0);
  objc_storeStrong(&self->_configResponseHandler, 0);
  objc_storeStrong((id *)&self->_bleProxPairingScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiser, 0);
}

@end
