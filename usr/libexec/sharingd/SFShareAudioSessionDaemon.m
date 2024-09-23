@implementation SFShareAudioSessionDaemon

- (SFShareAudioSessionDaemon)init
{
  SFShareAudioSessionDaemon *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  SFShareAudioSessionDaemon *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFShareAudioSessionDaemon;
  v2 = -[SFShareAudioSessionDaemon init](&v8, "init");
  if (v2)
  {
    v3 = SFMainQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8EFC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8FFC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    -[SFShareAudioSessionDaemon _reportProgress:](self, "_reportProgress:", 20);
    -[SFShareAudioSessionDaemon _cleanup](self, "_cleanup");
    if (dword_1007B1260 <= 30
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _invalidate]", 30, "Invalidated\n");
    }
  }
}

- (void)_run
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
    v3 = -[SFShareAudioSessionDaemon _runInit](self, "_runInit");
    if (v3 == 4 || v3 == 2)
    {
      v4 = -[SFShareAudioSessionDaemon _runScannerNearbyInfo](self, "_runScannerNearbyInfo");
      if (v4 == 4 || v4 == 2)
      {
        v5 = -[SFShareAudioSessionDaemon _runScannerProxPairing](self, "_runScannerProxPairing");
        if (v5 == 4 || v5 == 2)
        {
          v6 = -[SFShareAudioSessionDaemon _runAdvertiser](self, "_runAdvertiser");
          if (v6 == 4 || v6 == 2)
          {
            v7 = -[SFShareAudioSessionDaemon _runWaitForProxTrigger](self, "_runWaitForProxTrigger");
            if (v7 == 4 || v7 == 2)
            {
              v8 = -[SFShareAudioSessionDaemon _runConfirm](self, "_runConfirm");
              if (v8 == 4 || v8 == 2)
              {
                if (self->_triggerediOS)
                {
                  v9 = -[SFShareAudioSessionDaemon _runGuestiOSConnect](self, "_runGuestiOSConnect");
                  if (v9 != 4 && v9 != 2)
                    return;
                  v10 = -[SFShareAudioSessionDaemon _runGuestiOSPairSetupPublic](self, "_runGuestiOSPairSetupPublic");
                  if (v10 != 4 && v10 != 2)
                    return;
                  v11 = -[SFShareAudioSessionDaemon _runGuestiOSShareAudio](self, "_runGuestiOSShareAudio");
                  if (v11 != 2 && v11 != 4)
                    return;
                }
                else if ((-[SFDevice paired](self->_triggeredDevice, "paired") & 1) == 0)
                {
                  v12 = -[SFShareAudioSessionDaemon _runShowHeadphonesPairingInstructions](self, "_runShowHeadphonesPairingInstructions");
                  if (v12 != 4 && v12 != 2)
                    return;
                  v13 = -[SFShareAudioSessionDaemon _runWaitForGuestHeadphonesPairingMode](self, "_runWaitForGuestHeadphonesPairingMode");
                  if (v13 != 4 && v13 != 2)
                    return;
                }
                v14 = -[SFShareAudioSessionDaemon _runConnectGuestHeadphones](self, "_runConnectGuestHeadphones");
                if (v14 == 4 || v14 == 2)
                {
                  v15 = -[SFShareAudioSessionDaemon _runWaitForGuestHeadphones](self, "_runWaitForGuestHeadphones");
                  if (v15 == 4 || v15 == 2)
                    -[SFShareAudioSessionDaemon _runFinish](self, "_runFinish");
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
    Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("shaHeadphoneTrigger"), &v23);
    if (v23)
      v4 = 0;
    else
      v4 = Int64 == 0;
    v5 = !v4;
    self->_prefHeadphoneTrigger = v5;
    v6 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("shaiOSTrigger"), &v23);
    if (v23)
      v7 = 0;
    else
      v7 = v6 == 0;
    v8 = !v7;
    self->_prefiOSTrigger = v8;
    v9 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("shaColorCode"), &v23);
    if (v9 <= 0x7FFFFFFF && v9 >= (uint64_t)0xFFFFFFFF80000000 && v23 == 0)
      v12 = v9;
    else
      v12 = -1;
    self->_prefOverrideColorCode = v12;
    v13 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("shaProductID"), &v23);
    if (v13 <= 0x7FFFFFFF && v13 >= (uint64_t)0xFFFFFFFF80000000 && v23 == 0)
      v16 = v13;
    else
      v16 = -1;
    self->_prefOverrideProductID = v16;
    v17 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("shaRSSI"), 0);
    if ((unint64_t)(v17 - 1000) < 0xFFFFFFFFFFFFF831 || v17 == 0)
      v19 = -40;
    else
      v19 = v17;
    self->_prefRSSIThreshold = v19;
    self->_prefRespectDeviceSupport = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppWS"), &v23) == 0;
    if (!self->_preventProxCardsClient)
    {
      v20 = (SFClient *)objc_alloc_init((Class)SFClient);
      preventProxCardsClient = self->_preventProxCardsClient;
      self->_preventProxCardsClient = v20;

      -[SFClient activateAssertionWithIdentifier:](self->_preventProxCardsClient, "activateAssertionWithIdentifier:", CFSTR("com.apple.sharing.PreventProxCards"));
    }
    self->_initialized = 1;
    if (dword_1007B1260 <= 30
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runInit]", 30, "Initialized: RSSI threshold %d\n", self->_prefRSSIThreshold);
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
  if (self->_triggeredDevice && self->_triggeredNeedsSetupDevice)
  {
    if (self->_bleProxPairingScanner)
    {
      if (dword_1007B1260 <= 30
        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
      {
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runScannerProxPairing]", 30, "BLE ProxPairing scanner stop on triggered device\n");
      }
      -[SFDeviceDiscovery invalidate](self->_bleProxPairingScanner, "invalidate");
      bleProxPairingScanner = self->_bleProxPairingScanner;
      self->_bleProxPairingScanner = 0;

    }
    return 2;
  }
  if (!self->_bleProxPairingScanner)
  {
    if (dword_1007B1260 <= 30
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runScannerProxPairing]", 30, "BLE ProxPairing scanner start\n");
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
    v10[2] = sub_1000B9684;
    v10[3] = &unk_100716998;
    v10[4] = v7;
    v10[5] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](v7, "setDeviceFoundHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B96A0;
    v9[3] = &unk_1007169C0;
    v9[4] = v7;
    v9[5] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](v7, "setDeviceChangedHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B96BC;
    v8[3] = &unk_1007156D0;
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
      if (dword_1007B1260 <= 30
        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
      {
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runScannerNearbyInfo]", 30, "BLE NearbyInfo scanner stop on triggered device\n");
      }
      -[SFDeviceDiscovery invalidate](self->_bleNearbyInfoScanner, "invalidate");
      v4 = self->_bleNearbyInfoScanner;
      self->_bleNearbyInfoScanner = 0;

    }
    return 2;
  }
  if (!bleNearbyInfoScanner)
  {
    if (dword_1007B1260 <= 30
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runScannerNearbyInfo]", 30, "BLE NearbyInfo scanner start\n");
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
    v11[2] = sub_1000B99D4;
    v11[3] = &unk_100716998;
    v11[4] = v8;
    v11[5] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](v8, "setDeviceFoundHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B99F0;
    v10[3] = &unk_1007169C0;
    v10[4] = v8;
    v10[5] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](v8, "setDeviceChangedHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B9A0C;
    v9[3] = &unk_1007156D0;
    v9[4] = v8;
    v9[5] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v8, "activateWithCompletion:", v9);

  }
  return 4;
}

- (int)_runAdvertiser
{
  SFService *bleNearbyActionAdvertiser;
  SFService *v4;
  SFService *v6;
  SFService *v7;
  SFService *v8;
  _QWORD v9[6];

  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (self->_triggeredDevice)
  {
    if (bleNearbyActionAdvertiser)
    {
      if (dword_1007B1260 <= 30
        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
      {
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runAdvertiser]", 30, "BLE advertiser stop on triggered device\n");
      }
      -[SFService invalidate](self->_bleNearbyActionAdvertiser, "invalidate");
      v4 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = 0;

    }
    return 2;
  }
  else
  {
    if (!bleNearbyActionAdvertiser)
    {
      if (dword_1007B1260 <= 30
        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
      {
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runAdvertiser]", 30, "BLE advertiser start\n");
      }
      v6 = (SFService *)objc_alloc_init((Class)SFService);
      v7 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = v6;
      v8 = v6;

      -[SFService setAdvertiseRate:](v8, "setAdvertiseRate:", 60);
      -[SFService setDeviceActionType:](v8, "setDeviceActionType:", 27);
      -[SFService setDispatchQueue:](v8, "setDispatchQueue:", self->_dispatchQueue);
      -[SFService setIdentifier:](v8, "setIdentifier:", CFSTR("a5989962-d94b-4755-bbca-59ecf498ad2f"));
      -[SFService setLabel:](v8, "setLabel:", CFSTR("ShareAudio"));
      -[SFService setNeedsSetup:](v8, "setNeedsSetup:", 1);
      -[SFService setPairSetupDisabled:](v8, "setPairSetupDisabled:", 1);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000B9CD8;
      v9[3] = &unk_1007156D0;
      v9[4] = v8;
      v9[5] = self;
      -[SFService activateWithCompletion:](v8, "activateWithCompletion:", v9);

    }
    return 4;
  }
}

- (int)_runWaitForProxTrigger
{
  if (self->_triggeredDevice)
    return 4;
  else
    return 1;
}

- (int)_runConfirm
{
  int confirmState;

  confirmState = self->_confirmState;
  if (confirmState != 4 && confirmState != 2)
  {
    if (confirmState)
    {
      if (dword_1007B1260 <= 30)
      {
        if (dword_1007B1260 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B1260, 30))
            return self->_confirmState;
          confirmState = self->_confirmState;
        }
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runConfirm]", 30, "Confirm not ready yet (%d)\n", confirmState);
      }
    }
    else
    {
      if (dword_1007B1260 <= 30
        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
      {
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runConfirm]", 30, "Confirm start: %@\n", self->_triggeredDevice);
      }
      self->_confirmState = 1;
      -[SFShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 100);
    }
  }
  return self->_confirmState;
}

- (int)_runGuestiOSConnect
{
  int guestiOSConnectState;
  SFSession *v5;
  SFSession *guestiOSSession;
  SFSession *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];

  guestiOSConnectState = self->_guestiOSConnectState;
  if (guestiOSConnectState != 4 && guestiOSConnectState != 2)
  {
    if (guestiOSConnectState)
    {
      if (dword_1007B1260 <= 30)
      {
        if (dword_1007B1260 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B1260, 30))
            return self->_guestiOSConnectState;
          guestiOSConnectState = self->_guestiOSConnectState;
        }
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runGuestiOSConnect]", 30, "Guest iOS session not ready yet (%d)\n", guestiOSConnectState);
      }
    }
    else
    {
      if (dword_1007B1260 <= 30
        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
      {
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runGuestiOSConnect]", 30, "Guest iOS session start\n");
      }
      self->_guestiOSConnectState = 1;
      -[SFShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 200);
      v5 = (SFSession *)objc_alloc_init((Class)SFSession);
      guestiOSSession = self->_guestiOSSession;
      self->_guestiOSSession = v5;
      v7 = v5;

      -[SFSession setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
      -[SFSession setLabel:](v7, "setLabel:", CFSTR("ShareAudio"));
      -[SFSession setPeerDevice:](v7, "setPeerDevice:", self->_triggeredDevice);
      -[SFSession setServiceIdentifier:](v7, "setServiceIdentifier:", SFServiceIdentifierShareAudio);
      -[SFSession setSessionFlags:](v7, "setSessionFlags:", 1);
      -[SFSession setStatusMonitor:](v7, "setStatusMonitor:", self->_statusMonitor);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000BA160;
      v13[3] = &unk_1007156D0;
      v13[4] = v7;
      v13[5] = self;
      -[SFSession setErrorHandler:](v7, "setErrorHandler:", v13);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000BA270;
      v12[3] = &unk_100714860;
      v12[4] = v7;
      v12[5] = self;
      -[SFSession setInterruptionHandler:](v7, "setInterruptionHandler:", v12);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000BA2E0;
      v11[3] = &unk_100714860;
      v11[4] = v7;
      v11[5] = self;
      -[SFSession setInvalidationHandler:](v7, "setInvalidationHandler:", v11);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000BA350;
      v10[3] = &unk_100714860;
      v10[4] = v7;
      v10[5] = self;
      -[SFSession setSessionStartedHandler:](v7, "setSessionStartedHandler:", v10);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000BA3F0;
      v9[3] = &unk_1007156D0;
      v9[4] = v7;
      v9[5] = self;
      -[SFSession activateWithCompletion:](v7, "activateWithCompletion:", v9);

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
      if (dword_1007B1260 <= 30)
      {
        if (dword_1007B1260 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B1260, 30))
            return self->_guestiOSPairSetupPublicState;
          guestiOSPairSetupPublicState = self->_guestiOSPairSetupPublicState;
        }
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runGuestiOSPairSetupPublic]", 30, "Guest iOS PairSetup hasn't succeeded yet (%d)\n", guestiOSPairSetupPublicState);
      }
    }
    else
    {
      if (dword_1007B1260 <= 30
        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
      {
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runGuestiOSPairSetupPublic]", 30, "Guest iOS PairSetup start\n");
      }
      self->_guestiOSPairSetupPublicState = 1;
      v5 = self->_guestiOSSession;
      -[SFSession setFixedPIN:](v5, "setFixedPIN:", CFSTR("public"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000BA660;
      v7[3] = &unk_1007156D0;
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
      if (dword_1007B1260 <= 30)
      {
        if (dword_1007B1260 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B1260, 30))
            return self->_guestiOSShareAudioState;
          guestiOSShareAudioState = self->_guestiOSShareAudioState;
        }
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runGuestiOSShareAudio]", 30, "Guest iOS ShareAudio hasn't succeeded yet (%d)\n", guestiOSShareAudioState);
      }
    }
    else
    {
      self->_guestiOSShareAudioState = 1;
      -[SFShareAudioSessionDaemon _runGuestiOSShareAudioSendRequest](self, "_runGuestiOSShareAudioSendRequest");
    }
  }
  return self->_guestiOSShareAudioState;
}

- (void)_runGuestiOSShareAudioSendRequest
{
  id v3;
  void *v4;
  void *v5;
  SFSession *guestiOSSession;
  OS_dispatch_queue *dispatchQueue;
  SFSession *v8;
  uint64_t v9;
  _QWORD v10[7];

  if (dword_1007B1260 <= 30 && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
    LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runGuestiOSShareAudioSendRequest]", 30, "Guest iOS ShareAudio start\n");
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)MGCopyAnswer(CFSTR("BluetoothAddress"), 0);
  if (v4)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("btAd"));
    v5 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
    if (v5)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dname"));
    guestiOSSession = self->_guestiOSSession;
    dispatchQueue = self->_dispatchQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BAA10;
    v10[3] = &unk_1007147F0;
    v10[4] = guestiOSSession;
    v10[5] = self;
    v10[6] = v3;
    v8 = guestiOSSession;
    -[SFSession appleIDAddProof:dispatchQueue:completion:](v8, "appleIDAddProof:dispatchQueue:completion:", v3, dispatchQueue, v10);

  }
  else
  {
    if (dword_1007B1260 <= 90
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 90)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runGuestiOSShareAudioSendRequest]", 90, "### Get iOS ShareAudio get BT addr failed\n");
    }
    self->_guestiOSShareAudioState = 3;
    v9 = NSErrorF(NSOSStatusErrorDomain, 4294960535, "No iOS BT Addr");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SFShareAudioSessionDaemon _reportError:](self, "_reportError:", v5);
  }

}

- (void)_runGuestiOSShareAudioProcessResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  SFSession *guestiOSSession;
  OS_dispatch_queue *dispatchQueue;
  SFSession *v12;
  _QWORD v13[6];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  if (v9)
  {
    if (dword_1007B1260 <= 90
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 90)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runGuestiOSShareAudioProcessResponse:error:]", 90, "### Guest iOS ShareAudio error: %{error}\n", v9);
    }
    self->_guestiOSShareAudioState = 3;
    -[SFShareAudioSessionDaemon _reportError:](self, "_reportError:", v9);
  }
  else
  {
    if (dword_1007B1260 <= 30
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runGuestiOSShareAudioProcessResponse:error:]", 30, "Guest iOS response: %##.16@\n", v8);
    }
    guestiOSSession = self->_guestiOSSession;
    dispatchQueue = self->_dispatchQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000BAD0C;
    v13[3] = &unk_100716A10;
    v13[4] = guestiOSSession;
    v13[5] = self;
    v14 = v8;
    v12 = guestiOSSession;
    -[SFSession appleIDVerifyProof:dispatchQueue:completion:](v12, "appleIDVerifyProof:dispatchQueue:completion:", v14, dispatchQueue, v13);

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
      if (dword_1007B1260 <= 30
        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
      {
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runShowHeadphonesPairingInstructions]", 30, "Guest headphone show instructions: %@\n", self->_triggeredDevice);
      }
      -[SFShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 120);
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
  void *v4;
  id v5;
  _QWORD v6[6];

  result = self->_guestHeadphonesConnectState;
  if (!result)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_guestiOSSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("ShareAudio"), 16));
    if (dword_1007B1260 <= 30
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runConnectGuestHeadphones]", 30, "Guest headphone connect start: DA %@, GK %{mask}\n", self->_guestHeadphonesAddress, v4);
    }
    self->_guestHeadphonesConnectState = 1;
    -[SFShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 300);
    v5 = objc_alloc_init((Class)SFBluetoothPairingSession);
    objc_storeStrong((id *)&self->_guestHeadphonesPairingSession, v5);
    objc_msgSend(v5, "setDeviceAddress:", self->_guestHeadphonesAddress);
    objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
    if (self->_triggerediOS || !-[SFDevice paired](self->_triggeredDevice, "paired"))
    {
      objc_msgSend(v5, "setGuestKey:", v4);
      objc_msgSend(v5, "setGuestMode:", 1);
      if (self->_triggerediOS && !self->_guestiOSContact)
        objc_msgSend(v5, "setUserNotInContacts:", 1);
    }
    else
    {
      objc_msgSend(v5, "setAggregate:", 1);
      objc_msgSend(v5, "setConnectOnly:", 1);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000BB1DC;
    v6[3] = &unk_1007156D0;
    v6[4] = v5;
    v6[5] = self;
    objc_msgSend(v5, "setCompletionHandler:", v6);
    objc_msgSend(v5, "activate");

    return self->_guestHeadphonesConnectState;
  }
  return result;
}

- (int)_runWaitForGuestHeadphones
{
  int guestiOSWaitForRouteState;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;

  guestiOSWaitForRouteState = self->_guestiOSWaitForRouteState;
  if (guestiOSWaitForRouteState != 4 && guestiOSWaitForRouteState != 2)
  {
    if (guestiOSWaitForRouteState)
    {
      if (dword_1007B1260 <= 30)
      {
        if (dword_1007B1260 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B1260, 30))
            return self->_guestiOSWaitForRouteState;
          guestiOSWaitForRouteState = self->_guestiOSWaitForRouteState;
        }
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runWaitForGuestHeadphones]", 30, "Guest iOS wait for headphones hasn't succeeded yet (%d)\n", guestiOSWaitForRouteState);
      }
    }
    else
    {
      if (dword_1007B1260 <= 30
        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
      {
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runWaitForGuestHeadphones]", 30, "Guest iOS waiting for headphones: %@\n", self->_guestHeadphonesAddress);
      }
      self->_guestiOSWaitForRouteState = 1;
      -[SFShareAudioSessionDaemon _reportProgress:](self, "_reportProgress:", 320);
      v5 = objc_msgSend((Class)off_1007B12D0[0](), "sharedAVSystemController");
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = off_1007B12D8[0]();
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v16 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));

      v10 = off_1007B12E0[0]();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      objc_msgSend(v6, "setAttribute:forKey:error:", v9, v11, 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v13 = off_1007B12D8[0]();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v12, "addObserver:selector:name:object:", self, "_pickableRoutesChanged:", v14, v6);

      self->_observingPickableRoutes = 1;
      -[SFShareAudioSessionDaemon _pickableRoutesChanged](self, "_pickableRoutesChanged");

    }
  }
  return self->_guestiOSWaitForRouteState;
}

- (int)_runFinish
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  NSString *v11;

  v3 = self->_guestHeadphonesRouteUID;
  if (v3)
  {
    if (dword_1007B1260 <= 30
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runFinish]", 30, "Shared audio route ID: '%@'\n", v3);
    }
    v10 = CFSTR("mediaRouteID");
    v11 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    -[SFShareAudioSessionDaemon _reportProgress:info:](self, "_reportProgress:info:", 40, v4);
  }
  else
  {
    if (dword_1007B1260 <= 90
      && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 90)))
    {
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _runFinish]", 90, "### Shared audio route ID not found\n");
    }
    v8 = CFSTR("error");
    v5 = NSErrorWithOSStatusF(4294960569, "Audio route not found");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v9 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    -[SFShareAudioSessionDaemon _reportProgress:info:](self, "_reportProgress:info:", 50, v6);

  }
  -[SFShareAudioSessionDaemon _cleanup](self, "_cleanup");

  return 4;
}

- (void)_cleanup
{
  SFService *bleNearbyActionAdvertiser;
  SFDeviceDiscovery *bleNearbyInfoScanner;
  SFDeviceDiscovery *bleProxPairingScanner;
  NSString *guestHeadphonesAddress;
  SFBluetoothPairingSession *guestHeadphonesPairingSession;
  SFSession *guestiOSSession;
  void *v9;
  uint64_t v10;
  void *v11;
  SFClient *preventProxCardsClient;
  id progressHandler;
  SFDevice *triggeredDevice;
  SFDevice *triggeredNeedsSetupDevice;

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

  -[SFBluetoothPairingSession invalidate](self->_guestHeadphonesPairingSession, "invalidate");
  guestHeadphonesPairingSession = self->_guestHeadphonesPairingSession;
  self->_guestHeadphonesPairingSession = 0;

  -[SFSession invalidate](self->_guestiOSSession, "invalidate");
  guestiOSSession = self->_guestiOSSession;
  self->_guestiOSSession = 0;

  if (self->_observingPickableRoutes)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = off_1007B12D8[0]();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "removeObserver:name:object:", self, v11, 0);

    self->_observingPickableRoutes = 0;
  }
  -[SFClient invalidate](self->_preventProxCardsClient, "invalidate");
  preventProxCardsClient = self->_preventProxCardsClient;
  self->_preventProxCardsClient = 0;

  progressHandler = self->_progressHandler;
  self->_progressHandler = 0;

  triggeredDevice = self->_triggeredDevice;
  self->_triggeredDevice = 0;

  triggeredNeedsSetupDevice = self->_triggeredNeedsSetupDevice;
  self->_triggeredNeedsSetupDevice = 0;

  self->_triggerediOS = 0;
  -[SDProximityController clearDeviceList](self->_proximityController, "clearDeviceList");
}

- (void)_bleScannerNearbyInfoDeviceFound:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  int v13;
  int v14;
  void *v15;

  v5 = a3;
  v6 = v5;
  if (!self->_triggeredDevice)
  {
    v15 = v5;
    if (objc_msgSend(v5, "paired"))
    {
      v6 = v15;
      if (dword_1007B1260 <= 10)
      {
        if (dword_1007B1260 != -1 || (v13 = _LogCategory_Initialize(&dword_1007B1260, 10), v6 = v15, v13))
        {
          LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 10, "Ignoring same-account device: %@\n", v6);
          goto LABEL_23;
        }
      }
    }
    else
    {
      if ((objc_msgSend(v15, "deviceFlags") & 0x800) != 0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bleDevice"));
        v8 = objc_msgSend(v7, "rssiEstimate");
        -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityController deviceIdToCurrentPreset](self->_proximityController, "deviceIdToCurrentPreset"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
        v12 = objc_msgSend(v11, "isEqual:", &off_10074B610);

        if (v12)
        {
          if (dword_1007B1260 <= 50
            && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 50)))
          {
            LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 50, "#ni_estimator shareaudio iOS triggered");
          }
          if ((_os_feature_enabled_impl("Sharing", "ni_estimator") & 1) != 0)
            goto LABEL_17;
        }
        else if (_os_feature_enabled_impl("Sharing", "ni_estimator"))
        {
          if (dword_1007B1260 <= 50
            && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 50)))
          {
            LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 50, "#ni_estimator did not trigger shareaudio iOS for device: %@", v15);
          }
          goto LABEL_22;
        }
        if ((v8 & 0x80000000) == 0 || (int)v8 < self->_prefRSSIThreshold)
        {
          if (dword_1007B1260 <= 10
            && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 10)))
          {
            LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 10, "Ignoring weak RSSI: %d < %d, %@\n", v8, self->_prefRSSIThreshold, v15);
          }
          goto LABEL_22;
        }
LABEL_17:
        if (dword_1007B1260 <= 30
          && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
        {
          LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 30, "Triggering proximity ShareAudio (iOS): RSSI %d, %@\n", v8, v15);
        }
        objc_storeStrong((id *)&self->_triggeredDevice, a3);
        self->_triggerediOS = 1;
        -[SFShareAudioSessionDaemon _run](self, "_run");
LABEL_22:

LABEL_23:
        v6 = v15;
        goto LABEL_24;
      }
      v6 = v15;
      if (dword_1007B1260 <= 10)
      {
        if (dword_1007B1260 != -1 || (v14 = _LogCategory_Initialize(&dword_1007B1260, 10), v6 = v15, v14))
        {
          LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]", 10, "Ignoring unshareable: %@\n", v6);
          goto LABEL_23;
        }
      }
    }
  }
LABEL_24:

}

- (void)_bleScannerProxPairingDeviceFound:(id)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  char v19;
  int Int64Ranged;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *v41;
  NSString *guestHeadphonesAddress;
  const char *v43;
  id v44;
  void *v45;
  void *v46;
  SFShareAudioSessionDaemon *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  SFDevice **v53;
  unsigned int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];

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
        if (dword_1007B1260 <= 10
          && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 10)))
        {
          LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring non-share device: %@\n", v6);
        }
        goto LABEL_58;
      }
      if (CFDictionaryGetInt64Ranged(v10, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0) != 8208
        && (CFDictionaryGetInt64Ranged(v10, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0) & 0x24) != 0)
      {
        if (dword_1007B1260 <= 10
          && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 10)))
        {
          LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring in-ear device: %@\n", v6);
        }
        goto LABEL_58;
      }
      if (CFDictionaryGetInt64(v10, CFSTR("lc"), 0))
      {
        if (dword_1007B1260 <= 10
          && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 10)))
        {
          LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring lid-closed device: %@\n", v6);
        }
        goto LABEL_58;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
      v12 = objc_msgSend(v11, "smoothedRSSI");
      v13 = v12;
      if ((v12 & 0x80000000) != 0)
      {
        if (v8)
          v14 = 4294967236;
        else
          v14 = 4294967251;
        v54 = v8;
        if ((v8 & 1) == 0)
        {
          v51 = v12;
          -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityController deviceIdToCurrentPreset](self->_proximityController, "deviceIdToCurrentPreset"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));
          v18 = objc_msgSend(v17, "isEqual:", &off_10074B610);

          if (v18)
          {
            if (dword_1007B1260 <= 50
              && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 50)))
            {
              LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 50, "#ni_estimator shareaudio headphone triggered");
            }
            _os_feature_enabled_impl("Sharing", "ni_estimator");
            v13 = v51;
            p_triggeredNeedsSetupDevice = &self->_triggeredNeedsSetupDevice;
          }
          else
          {
            v13 = v51;
            p_triggeredNeedsSetupDevice = &self->_triggeredNeedsSetupDevice;
            if (_os_feature_enabled_impl("Sharing", "ni_estimator"))
            {
              if (dword_1007B1260 <= 50
                && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 50)))
              {
                LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 50, "#ni_estimator did not trigger shareaudio headphone for device: %@", v6);
              }
              goto LABEL_57;
            }
          }
        }
        v19 = _os_feature_enabled_impl("Sharing", "ni_estimator");
        if (v14 <= v13 || (v19 & 1) != 0)
        {
          Int64Ranged = CFDictionaryGetInt64Ranged(v10, CFSTR("CnSv"), 0, 0xFFFFFFFFLL, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothAddress"));
          v22 = v21;
          if (Int64Ranged && objc_msgSend(v21, "length") == (id)6)
          {
            v52 = v13;
            v53 = p_triggeredNeedsSetupDevice;
            v47 = self;
            v50 = v6;
            v49 = v22;
            v23 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v22), "bytes")));
            v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            v25 = objc_msgSend((Class)off_1007B12D0[0](), "sharedAVSystemController");
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            v27 = off_1007B12E8[0]();
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            v48 = v26;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "attributeForKey:", v28));

            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v30 = v29;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v56;
              while (2)
              {
                for (i = 0; i != v32; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v56 != v33)
                    objc_enumerationMutation(v30);
                  v35 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
                  v36 = off_1007B12F0[0]();
                  if (CFDictionaryGetInt64(v35, v36, 0))
                  {
                    v37 = off_1007B12F8();
                    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v38));

                    if (objc_msgSend(v39, "rangeOfString:options:", v24, 1) != (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      v6 = v50;
                      if (dword_1007B1260 <= 10
                        && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 10)))
                      {
                        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, "Ignoring already-routed device: %@\n", v50);
                      }

                      v22 = v49;
                      goto LABEL_56;
                    }

                  }
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
                if (v32)
                  continue;
                break;
              }
            }

            v6 = v50;
            v22 = v49;
            self = v47;
            v13 = v52;
            p_triggeredNeedsSetupDevice = v53;
          }
          if ((v54 & 1) == 0 && !objc_msgSend(v6, "paired"))
            goto LABEL_47;
          if (!v22)
          {
            if (dword_1007B1260 <= 90
              && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 90)))
            {
              LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 90, "Ignoring no address: %@\n", v6);
            }
            goto LABEL_56;
          }
          if (objc_msgSend(v22, "length") != (id)6)
          {
            if (dword_1007B1260 <= 90
              && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 90)))
            {
              LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 90, "Ignoring bad address: <%@>, %@\n", v22, v6);
            }
            goto LABEL_56;
          }
          v40 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v22), "bytes")));
          v41 = (NSString *)objc_claimAutoreleasedReturnValue(v40);
          guestHeadphonesAddress = self->_guestHeadphonesAddress;
          self->_guestHeadphonesAddress = v41;

          if (v54)
          {
            if (!self->_triggeredDevice)
              objc_storeStrong((id *)&self->_triggeredDevice, a3);
          }
          else
          {
LABEL_47:
            p_triggeredNeedsSetupDevice = &self->_triggeredDevice;
          }
          objc_storeStrong((id *)p_triggeredNeedsSetupDevice, a3);
          if (dword_1007B1260 <= 30
            && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
          {
            LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 30, "Triggering proximity ShareAudio (Headphones): RSSI %d, %@\n", v13, v6);
          }
          -[SFShareAudioSessionDaemon _run](self, "_run");
LABEL_56:

LABEL_57:
LABEL_58:

          goto LABEL_59;
        }
        if (dword_1007B1260 > 10
          || dword_1007B1260 == -1 && !_LogCategory_Initialize(&dword_1007B1260, 10))
        {
          goto LABEL_57;
        }
        v45 = (void *)v14;
        v46 = v6;
        v44 = v13;
        v43 = "Ignoring weak RSSI: %d < %d, %@\n";
      }
      else
      {
        if (dword_1007B1260 > 10
          || dword_1007B1260 == -1 && !_LogCategory_Initialize(&dword_1007B1260, 10))
        {
          goto LABEL_57;
        }
        v44 = v13;
        v45 = v6;
        v43 = "Ignoring invalid RSSI: %d, %@\n";
      }
      LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]", 10, v43, v44, v45, v46);
      goto LABEL_57;
    }
  }
LABEL_59:

}

- (void)_pickableRoutesChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BC438;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_pickableRoutesChanged
{
  NSString *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  NSString *guestHeadphonesRouteUID;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (self->_guestiOSWaitForRouteState == 1)
  {
    v3 = self->_guestHeadphonesAddress;
    if (v3)
    {
      v4 = objc_msgSend((Class)off_1007B12D0[0](), "sharedAVSystemController");
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v6 = off_1007B12E8[0]();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v19 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributeForKey:", v7));

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
            v15 = off_1007B12F8();
            v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
            v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v16));

            if (-[NSString rangeOfString:options:](v17, "rangeOfString:options:", v3, 1) != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if (dword_1007B1260 <= 30
                && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
              {
                LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _pickableRoutesChanged]", 30, "Guest iOS headphones found: %@\n", v17);
              }
              guestHeadphonesRouteUID = self->_guestHeadphonesRouteUID;
              self->_guestHeadphonesRouteUID = v17;

              self->_guestiOSWaitForRouteState = 4;
              -[SFShareAudioSessionDaemon _run](self, "_run");
              goto LABEL_17;
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v11)
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
  if (dword_1007B1260 <= 90 && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 90)))
    LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _reportError:]", 90, "### Error: %{error}\n", v4);
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
  if (dword_1007B1260 <= 30 && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
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
        LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _reportProgress:]", 30, "Progress: %s\n", v5);
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
  if (dword_1007B1260 <= 30 && (dword_1007B1260 != -1 || _LogCategory_Initialize(&dword_1007B1260, 30)))
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
            LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon _reportProgress:info:]", 30, "Progress: %s: %##@\n", v7, v6);
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
  uint64_t v9;
  void *v10;
  uint64_t NSNumber;
  uint64_t v12;
  id v13;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self->_triggeredDevice, "bleDevice"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "advertisementFields"));

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
  NSNumber = NSDictionaryGetNSNumber(v13, CFSTR("cc"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  if (v8)
    goto LABEL_6;
LABEL_7:

  if (self->_prefOverrideProductID < 0)
  {
    if (!self->_guestHeadphonesProductID)
    {
      v12 = NSDictionaryGetNSNumber(v13, CFSTR("pid"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (!v10)
        goto LABEL_13;
      goto LABEL_12;
    }
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
  }
  v10 = (void *)v9;
LABEL_12:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("pid"));
LABEL_13:

  -[SFShareAudioSessionDaemon _reportProgress:info:](self, "_reportProgress:info:", v3, v6);
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B1260 <= 50
    && ((v6 = v3, dword_1007B1260 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B1260, 50), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B1260, "-[SFShareAudioSessionDaemon proximityDeviceDidTrigger:]", 50, "#ni_estimator shareaudio delegate triggered for device: %@", v4);

  }
  else
  {

  }
}

- (void)userConfirmed
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BCE0C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_statusMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_triggeredNeedsSetupDevice, 0);
  objc_storeStrong((id *)&self->_triggeredDevice, 0);
  objc_storeStrong((id *)&self->_preventProxCardsClient, 0);
  objc_storeStrong((id *)&self->_guestiOSSession, 0);
  objc_storeStrong((id *)&self->_guestiOSDeviceAddress, 0);
  objc_storeStrong((id *)&self->_guestiOSContact, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesRouteUID, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesPairingSession, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesAddress, 0);
  objc_storeStrong((id *)&self->_bleProxPairingScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiser, 0);
}

@end
