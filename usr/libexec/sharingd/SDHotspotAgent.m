@implementation SDHotspotAgent

+ (id)sharedAgent
{
  if (qword_1007C6608 != -1)
    dispatch_once(&qword_1007C6608, &stru_100715788);
  return (id)qword_1007C6610;
}

- (SDHotspotAgent)init
{
  SDHotspotAgent *v2;
  SDHotspotAgent *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  __int128 v6;
  SDHotspotAgent *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDHotspotAgent;
  v2 = -[SDHotspotAgent init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_advertisementTime = 0.0;
    v4 = dispatch_queue_create("com.apple.sharing.SDHotspotAgent", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_familyCount = -1;
    *(_QWORD *)&v6 = -1;
    *((_QWORD *)&v6 + 1) = -1;
    *(_OWORD *)&v3->_idsLegacyClientDeviceCount = v6;
    *(_OWORD *)&v3->_idsTetheringClientDeviceCount = v6;
    *(_QWORD *)&v3->_wombatActivityReadyToken = 0xFFFFFFFFLL;
    v7 = v3;
  }

  return v3;
}

- (NSString)description
{
  id v3;
  id v4;
  id v5;
  const char *v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  id v18;
  const char *v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  id v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v41 = 0;
  NSAppendPrintF(&v41, "-- SDHotspotAgent --\n");
  v3 = v41;
  v40 = v3;
  NSAppendPrintF(&v40, "Companion Link:         %@\n", self->_companionLinkClient);
  v4 = v40;

  v39 = v4;
  NSAppendPrintF(&v39, "Family Count:           %ld\n", self->_familyCount);
  v5 = v39;

  v38 = v5;
  if (self->_hotspotBrowser)
    v6 = "yes";
  else
    v6 = "no";
  NSAppendPrintF(&v38, "Legacy Browser:         %s\n", v6);
  v7 = v38;

  v37 = v7;
  NSAppendPrintF(&v37, "Legacy Client Count:    %ld\n", self->_idsLegacyClientDeviceCount);
  v8 = v37;

  v36 = v8;
  NSAppendPrintF(&v36, "Legacy Host Count:      %ld\n", self->_idsLegacyHostDeviceCount);
  v9 = v36;

  v35 = v9;
  if (-[SDHotspotManager isTetheringSupported](self->_hotspotManager, "isTetheringSupported"))
    v10 = "yes";
  else
    v10 = "no";
  NSAppendPrintF(&v35, "PH Supported:           %s\n", v10);
  v11 = v35;

  v34 = v11;
  NSAppendPrintF(&v34, "PH Device Count:        %ld\n", -[NSArray count](self->_idsDeviceArray, "count"));
  v12 = v34;

  v33 = v12;
  NSAppendPrintF(&v33, "PH Client Count:        %ld\n", self->_idsTetheringClientDeviceCount);
  v13 = v33;

  v32 = v13;
  NSAppendPrintF(&v32, "PH Host Count:          %ld\n", self->_idsTetheringHostDeviceCount);
  v14 = v32;

  v31 = v14;
  NSAppendPrintF(&v31, "\n");
  v15 = v31;

  v30 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor localPowerSource](self->_statusMonitor, "localPowerSource"));
  objc_msgSend(v16, "chargeLevel");
  NSAppendPrintF(&v30, "Charge Level:           %ld%%\n", (uint64_t)(v17 * 100.0));
  v18 = v30;

  v29 = v18;
  if (-[SDStatusMonitor familyHotspotEnabled](self->_statusMonitor, "familyHotspotEnabled"))
    v19 = "yes";
  else
    v19 = "no";
  NSAppendPrintF(&v29, "Family HS Enabled:      %s\n", v19);
  v20 = v29;

  v28 = v20;
  NSAppendPrintF(&v28, "Network Type:           %ld\n", -[SDStatusMonitor networkType](self->_statusMonitor, "networkType"));
  v21 = v28;

  v27 = v21;
  NSAppendPrintF(&v27, "Signal Strength:        %ld\n", -[SDStatusMonitor signalStrength](self->_statusMonitor, "signalStrength"));
  v22 = v27;

  v26 = v22;
  if (-[SDHotspotAgent p2pAllowed](self, "p2pAllowed"))
    v23 = "yes";
  else
    v23 = "no";
  NSAppendPrintF(&v26, "P2P Allowed:            %s\n", v23);
  v24 = v26;

  return (NSString *)v24;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E364;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  SDStatusMonitor *v3;
  SDStatusMonitor *statusMonitor;
  void *v5;
  _QWORD block[5];

  if (dword_1007B0A10 <= 30 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 30)))
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _activate]", 30, "Activate\n");
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (SDStatusMonitor *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  statusMonitor = self->_statusMonitor;
  self->_statusMonitor = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "update", CFSTR("com.apple.sharingd.HotspotAutoStateChanged"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "update", CFSTR("com.apple.sharingd.HotspotFamilyStateChanged"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "update", CFSTR("com.apple.sharingd.PowerSourceChanged"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "update", CFSTR("com.apple.sharingd.SIMDataChanged"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "update", CFSTR("com.apple.sharingd.SignalStrengthChanged"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "update", CFSTR("SDHotspotManagerConnectionStateChanged"), 0);
  -[SDHotspotAgent _prefsChanged:](self, "_prefsChanged:", 1);
  -[SDHotspotAgent _idsEnsureStarted](self, "_idsEnsureStarted");
  -[SDHotspotAgent _sysMonitorEnsureStarted](self, "_sysMonitorEnsureStarted");
  -[SDHotspotAgent _registerForWombatActivityNotifications](self, "_registerForWombatActivityNotifications");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E54C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E5E8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1007B0A10 <= 30
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 30)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _invalidate]", 30, "Invalidating\n");
    }
    -[SDHotspotAgent _unregisterWombatActivityNotifications](self, "_unregisterWombatActivityNotifications");
    -[SDHotspotAgent _advertiserEnsureStopped](self, "_advertiserEnsureStopped");
    -[SDHotspotAgent _companionLinkEnsureStopped](self, "_companionLinkEnsureStopped");
    -[SDHotspotAgent _idsEnsureStopped](self, "_idsEnsureStopped");
    -[SDHotspotAgent _legacyBrowserEnsureStopped](self, "_legacyBrowserEnsureStopped");
    -[SDHotspotAgent _sysMonitorEnsureStopped](self, "_sysMonitorEnsureStopped");
    -[SDHotspotAgent _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_invalidateDone = 1;
  if (dword_1007B0A10 <= 30 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 30)))
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _invalidated]", 30, "Invalidated\n");
}

- (void)prefsChanged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E78C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_prefsChanged:(BOOL)a3
{
  uint64_t Int64;
  BOOL v6;
  _BOOL4 v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int prefBatteryLevelOverride;
  uint64_t v15;
  BOOL v16;
  _BOOL4 v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  NSNumber *v21;
  NSNumber *prefFamilyEnabledOverride;
  unsigned int v23;
  const char *v24;
  const char *v25;
  NSNumber *v26;
  NSNumber *v27;
  uint64_t v28;
  BOOL v29;
  _BOOL4 v30;
  const char *v31;
  const char *v32;
  CFTypeID TypeID;
  void *v34;
  NSNumber *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  NSNumber *v44;
  NSNumber *prefNetworkTypeOverride;
  uint64_t v46;
  BOOL v47;
  _BOOL4 v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  int prefSignalStrengthOverride;
  char v56;
  int v57;

  v57 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("hsAdvertisingDisabled"), &v57);
  if (v57)
    v6 = 1;
  else
    v6 = Int64 == 0;
  v7 = !v6;
  if (self->_prefAdvertisingDisabled != v7)
  {
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      v8 = "yes";
      if (v7)
        v9 = "no";
      else
        v9 = "yes";
      if (!v7)
        v8 = "no";
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _prefsChanged:]", 50, "Advertising disabled: %s -> %s\n", v9, v8);
    }
    self->_prefAdvertisingDisabled = v7;
  }
  v10 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("hsBatteryLevel"), &v57);
  if (v57)
    v11 = -1;
  else
    v11 = v10;
  v12 = 100;
  if (v11 < 100)
    v12 = v11;
  if (v12 <= 1)
    LODWORD(v12) = 1;
  if (v11 < 0)
    v13 = -1;
  else
    v13 = v12;
  prefBatteryLevelOverride = self->_prefBatteryLevelOverride;
  if (v13 != prefBatteryLevelOverride)
  {
    if (dword_1007B0A10 <= 50)
    {
      if (dword_1007B0A10 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B0A10, 50))
          goto LABEL_33;
        prefBatteryLevelOverride = self->_prefBatteryLevelOverride;
      }
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _prefsChanged:]", 50, "Battery level overridden: %d -> %d\n", prefBatteryLevelOverride, v13);
    }
LABEL_33:
    self->_prefBatteryLevelOverride = v13;
  }
  v15 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("hsChargingOverrideDisabled"), &v57);
  if (v57)
    v16 = 1;
  else
    v16 = v15 == 0;
  v17 = !v16;
  if (self->_prefChargingOverrideDisabled != v17)
  {
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      v18 = "yes";
      if (v17)
        v19 = "no";
      else
        v19 = "yes";
      if (!v17)
        v18 = "no";
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _prefsChanged:]", 50, "Charging override disabled: %s -> %s\n", v19, v18);
    }
    self->_prefChargingOverrideDisabled = v17;
  }
  v20 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("hsFamilyEnabled"), &v57);
  if (!v57 || (v21 = self->_prefFamilyEnabledOverride, self->_prefFamilyEnabledOverride = 0, v21, !v57))
  {
    prefFamilyEnabledOverride = self->_prefFamilyEnabledOverride;
    if (!prefFamilyEnabledOverride || (v20 != 0) != -[NSNumber BOOLValue](prefFamilyEnabledOverride, "BOOLValue"))
    {
      if (dword_1007B0A10 <= 50
        && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
      {
        v23 = -[NSNumber BOOLValue](self->_prefFamilyEnabledOverride, "BOOLValue");
        v24 = "no";
        if (v23)
          v25 = "yes";
        else
          v25 = "no";
        if (v20)
          v24 = "yes";
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _prefsChanged:]", 50, "Family hotspot state overridden: %s -> %s\n", v25, v24);
      }
      v26 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v20 != 0));
      v27 = self->_prefFamilyEnabledOverride;
      self->_prefFamilyEnabledOverride = v26;

    }
  }
  v28 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("hsLegacyDisabled"), &v57);
  if (v57)
    v29 = 1;
  else
    v29 = v28 == 0;
  v30 = !v29;
  if (self->_prefLegacyDisabled != v30)
  {
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      v31 = "yes";
      if (v30)
        v32 = "no";
      else
        v32 = "yes";
      if (!v30)
        v31 = "no";
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _prefsChanged:]", 50, "Legacy disabled: %s -> %s\n", v32, v31);
    }
    self->_prefLegacyDisabled = v30;
  }
  TypeID = CFStringGetTypeID();
  v34 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.Sharing"), CFSTR("hsNetworkType"), TypeID, &v57);
  if (!v57 || (v35 = self->_prefNetworkTypeOverride, self->_prefNetworkTypeOverride = 0, v35, !v57))
  {
    if (v34)
    {
      v56 = 0;
      v36 = SFHotspotTypeStringToType(v34, &v56);
      if (v56)
      {
        v37 = v36;
        v38 = -[NSNumber unsignedIntValue](self->_prefNetworkTypeOverride, "unsignedIntValue");
        if (dword_1007B0A10 <= 50)
        {
          v39 = v38;
          if (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50))
          {
            v40 = SFHotspotNetworkTypeString(v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
            v42 = SFHotspotNetworkTypeString(v37);
            v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
            LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _prefsChanged:]", 50, "Network type overriden: %@ -> %@\n", v41, v43);

          }
        }
        v44 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v37));
        prefNetworkTypeOverride = self->_prefNetworkTypeOverride;
        self->_prefNetworkTypeOverride = v44;

      }
    }
  }
  v46 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("hsRapportDisabled"), &v57);
  if (v57)
    v47 = 1;
  else
    v47 = v46 == 0;
  v48 = !v47;
  if (self->_prefRapportDisabled != v48)
  {
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      v49 = "yes";
      if (v48)
        v50 = "no";
      else
        v50 = "yes";
      if (!v48)
        v49 = "no";
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _prefsChanged:]", 50, "Rapport disabled: %s -> %s\n", v50, v49);
    }
    self->_prefRapportDisabled = v48;
  }
  v51 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("hsSignalStrength"), &v57);
  if (v57)
    v52 = 0;
  else
    v52 = v51;
  v53 = 4;
  if (v52 < 4)
    v53 = v52;
  if (v52 >= 1)
    v54 = v53;
  else
    v54 = 0;
  prefSignalStrengthOverride = self->_prefSignalStrengthOverride;
  if (v54 != prefSignalStrengthOverride)
  {
    if (dword_1007B0A10 <= 50)
    {
      if (dword_1007B0A10 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B0A10, 50))
          goto LABEL_121;
        prefSignalStrengthOverride = self->_prefSignalStrengthOverride;
      }
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _prefsChanged:]", 50, "Signal strength overridden: %d -> %d\n", prefSignalStrengthOverride, v54);
    }
LABEL_121:
    self->_prefSignalStrengthOverride = v54;
  }
  if (!a3)
    -[SDHotspotAgent _update](self, "_update");

}

- (void)update
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006EE30;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[SDHotspotAgent _advertiserShouldAdvertise](self, "_advertiserShouldAdvertise"))
    -[SDHotspotAgent _advertiserUpdate](self, "_advertiserUpdate");
  else
    -[SDHotspotAgent _advertiserEnsureStopped](self, "_advertiserEnsureStopped");
  if (-[SDHotspotAgent _companionLinkShouldStart](self, "_companionLinkShouldStart"))
    -[SDHotspotAgent _companionLinkEnsureStarted](self, "_companionLinkEnsureStarted");
  else
    -[SDHotspotAgent _companionLinkEnsureStopped](self, "_companionLinkEnsureStopped");
  if (-[SDHotspotAgent _legacyBrowserShouldStart](self, "_legacyBrowserShouldStart"))
    -[SDHotspotAgent _legacyBrowserEnsureStarted](self, "_legacyBrowserEnsureStarted");
  else
    -[SDHotspotAgent _legacyBrowserEnsureStopped](self, "_legacyBrowserEnsureStopped");
}

- (void)_advertiserUpdate
{
  void *v3;
  unsigned int v4;
  double v5;
  double v6;
  uint64_t prefBatteryLevelOverride;
  BOOL v8;
  int v9;
  int v10;
  NSNumber *prefFamilyEnabledOverride;
  unsigned int v12;
  NSNumber *prefNetworkTypeOverride;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 prefSignalStrengthOverride;
  char v17;
  void *v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  char v22;
  double Current;
  const char *v24;
  const char *v25;
  double advertisementTime;
  void *v27;
  RPCompanionLinkClient *v28;
  RPCompanionLinkClient *companionLinkReceiver;
  RPCompanionLinkClient *v30;
  double v31;
  OS_dispatch_source *v32;
  OS_dispatch_source *advertisementTimer;
  NSObject *v34;
  unsigned int v35;
  _QWORD v36[5];
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor localPowerSource](self->_statusMonitor, "localPowerSource"));
  v4 = objc_msgSend(v3, "charging");
  objc_msgSend(v3, "chargeLevel");
  v6 = v5 * 100.0;
  if (self->_prefBatteryLevelOverride <= 0)
    prefBatteryLevelOverride = (uint64_t)v6;
  else
    prefBatteryLevelOverride = self->_prefBatteryLevelOverride;
  v8 = self->_prefChargingOverrideDisabled || v4 == 0;
  if (v8 || prefBatteryLevelOverride > 20)
  {
    if (prefBatteryLevelOverride >= 21)
    {
      if ((unint64_t)prefBatteryLevelOverride < 0x64)
        v10 = 2;
      else
        v10 = 3;
      if ((unint64_t)prefBatteryLevelOverride >= 0x33)
        v9 = v10;
      else
        v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _advertiserUpdate]", 50, "Updating battery level while charging");
    }
    v9 = 1;
  }
  prefFamilyEnabledOverride = self->_prefFamilyEnabledOverride;
  if (prefFamilyEnabledOverride)
    v12 = -[NSNumber BOOLValue](prefFamilyEnabledOverride, "BOOLValue");
  else
    v12 = -[SDStatusMonitor familyHotspotEnabled](self->_statusMonitor, "familyHotspotEnabled");
  v35 = v12;
  prefNetworkTypeOverride = self->_prefNetworkTypeOverride;
  if (prefNetworkTypeOverride)
    v14 = -[NSNumber integerValue](prefNetworkTypeOverride, "integerValue");
  else
    v14 = -[SDStatusMonitor networkType](self->_statusMonitor, "networkType");
  v15 = -[SDHotspotAgent _nearbyNetworkTypeForHotspotNetworkType:](self, "_nearbyNetworkTypeForHotspotNetworkType:", v14);
  prefSignalStrengthOverride = self->_prefSignalStrengthOverride;
  if (!prefSignalStrengthOverride)
    prefSignalStrengthOverride = -[SDStatusMonitor signalStrength](self->_statusMonitor, "signalStrength");
  if (prefSignalStrengthOverride)
    v17 = prefSignalStrengthOverride - 1;
  else
    v17 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v19 = objc_msgSend(v18, "hotspotInfo");

  if (v35)
    v20 = 128;
  else
    v20 = 0;
  v21 = v9 | v20 | (16 * (v15 & 7)) | (4 * (v17 & 3)) | 0x100u;
  if (v19 != (_DWORD)v21)
  {
    v22 = v21 ^ v19;
    Current = CFAbsoluteTimeGetCurrent();
    if ((v22 & 0x83) != 0)
    {
      if (dword_1007B0A10 <= 50
        && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
      {
        v24 = "yes";
        if ((v22 & 3) != 0)
          v25 = "yes";
        else
          v25 = "no";
        if ((v22 & 0x80) == 0)
          v24 = "no";
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _advertiserUpdate]", 50, "Updating for change: Bat: %s, Fam: %s", v25, v24);
      }
      goto LABEL_53;
    }
    advertisementTime = self->_advertisementTime;
    if (Current > advertisementTime)
    {
      self->_advertisementTime = CFAbsoluteTimeGetCurrent() + 60.0;
LABEL_53:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      objc_msgSend(v27, "setHotspotInfo:", v21);

      if (dword_1007B0A10 <= 50
        && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
      {
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _advertiserUpdate]", 50, "Tethering advertising updated: Bat: %ld, Net: %ld, Sig: %ld, Fam: %s");
      }
      goto LABEL_57;
    }
    if (self->_advertisementTimer)
    {
      if (dword_1007B0A10 <= 50
        && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
      {
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _advertiserUpdate]", 50, "Waiting for advertisement timer");
      }
    }
    else
    {
      v31 = advertisementTime - Current;
      if (advertisementTime - Current <= 0.0)
      {
        if (dword_1007B0A10 <= 50
          && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _advertiserUpdate]", 50, "Non-positive timeout");
        }
        -[SDHotspotAgent _update](self, "_update");
      }
      else
      {
        v32 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        advertisementTimer = self->_advertisementTimer;
        self->_advertisementTimer = v32;

        v34 = self->_advertisementTimer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10006F41C;
        handler[3] = &unk_1007146D8;
        handler[4] = self;
        dispatch_source_set_event_handler(v34, handler);
        CUDispatchTimerSet(self->_advertisementTimer, v31, -1.0, 1.0);
        dispatch_activate((dispatch_object_t)self->_advertisementTimer);
        if (dword_1007B0A10 <= 50
          && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _advertiserUpdate]", 50, "Created advertisement timer for %d seconds");
        }
      }
    }
  }
LABEL_57:
  if (!self->_companionLinkReceiver)
  {
    v28 = objc_opt_new(RPCompanionLinkClient);
    companionLinkReceiver = self->_companionLinkReceiver;
    self->_companionLinkReceiver = v28;

    -[RPCompanionLinkClient setDispatchQueue:](self->_companionLinkReceiver, "setDispatchQueue:", self->_dispatchQueue);
    v30 = self->_companionLinkReceiver;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10006F49C;
    v36[3] = &unk_1007157B0;
    v36[4] = self;
    -[RPCompanionLinkClient registerRequestID:options:handler:](v30, "registerRequestID:options:handler:", CFSTR("com.sharing.hotspot.request"), 0, v36);
    -[RPCompanionLinkClient setInterruptionHandler:](self->_companionLinkReceiver, "setInterruptionHandler:", &stru_1007157D0);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_companionLinkReceiver, "setInvalidationHandler:", &stru_1007157F0);
    -[RPCompanionLinkClient activateWithCompletion:](self->_companionLinkReceiver, "activateWithCompletion:", &stru_100715810);
  }

}

- (void)_advertiserEnsureStopped
{
  void *v3;
  RPCompanionLinkClient *companionLinkReceiver;
  RPCompanionLinkClient *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0A10 <= 50 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _advertiserEnsureStopped]", 50, "Tethering advertising stopped");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  objc_msgSend(v3, "setHotspotInfo:", 0);

  companionLinkReceiver = self->_companionLinkReceiver;
  if (companionLinkReceiver)
  {
    -[RPCompanionLinkClient setInterruptionHandler:](companionLinkReceiver, "setInterruptionHandler:", 0);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_companionLinkReceiver, "setInvalidationHandler:", 0);
    -[RPCompanionLinkClient invalidate](self->_companionLinkReceiver, "invalidate");
    v5 = self->_companionLinkReceiver;
    self->_companionLinkReceiver = 0;

    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _advertiserEnsureStopped]", 50, "Companion link receiver stopped");
    }
  }
}

- (BOOL)_advertiserShouldAdvertise
{
  const char *v3;
  int64_t v4;
  int64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  _BOOL4 v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0A10 <= 40 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 40)))
  {
    if (self->_prefAdvertisingDisabled)
      v3 = "yes";
    else
      v3 = "no";
    v4 = -[SDHotspotAgent _idsTetheringClientDeviceCount](self, "_idsTetheringClientDeviceCount");
    v5 = -[SDHotspotAgent _sysMonitorFamilyCount](self, "_sysMonitorFamilyCount");
    if (-[SDHotspotManager isTetheringSupported](self->_hotspotManager, "isTetheringSupported"))
      v6 = "yes";
    else
      v6 = "no";
    if (self->_systemMonitorActivated)
      v7 = "yes";
    else
      v7 = "no";
    if (-[SDHotspotManager maxConnectionsReached](self->_hotspotManager, "maxConnectionsReached"))
      v8 = "yes";
    else
      v8 = "no";
    if (-[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable"))
      v9 = "yes";
    else
      v9 = "no";
    if (self->_suppressAdvertisement)
      v10 = "yes";
    else
      v10 = "no";
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _advertiserShouldAdvertise]", 40, "Advertiser state: Pref %s, Client Count %ld, Family Count %ld, Supported %s, SysMon %s, Max Cnx %s, D2D Available %s, WombatStream %s", v3, v4, v5, v6, v7, v8, v9, v10);
  }
  if (!self->_systemMonitorActivated || self->_prefAdvertisingDisabled)
    goto LABEL_25;
  v11 = -[SDHotspotManager isTetheringSupported](self->_hotspotManager, "isTetheringSupported");
  if (!v11)
    return v11;
  if (-[SDHotspotManager maxConnectionsReached](self->_hotspotManager, "maxConnectionsReached")
    || self->_suppressAdvertisement)
  {
LABEL_25:
    LOBYTE(v11) = 0;
  }
  else
  {
    LOBYTE(v11) = -[SDHotspotAgent _idsTetheringClientDeviceCount](self, "_idsTetheringClientDeviceCount") >= 1
               && -[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable")
               || -[SDHotspotAgent _sysMonitorFamilyCount](self, "_sysMonitorFamilyCount") > 0;
  }
  return v11;
}

- (unsigned)_nearbyNetworkTypeForHotspotNetworkType:(unsigned __int8)a3
{
  char v3;

  if (((a3 - 1) & 0xF8) != 0)
    v3 = 0;
  else
    v3 = 0x706050004030201uLL >> (8 * (a3 - 1));
  return v3 & 7;
}

- (void)hotspotManagerTetheringSupportChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F980;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)_appMonitorAppList
{
  if (qword_1007C6620 != -1)
    dispatch_once(&qword_1007C6620, &stru_100715830);
  return (id)qword_1007C6618;
}

- (void)_appMonitorEnsureStarted
{
  BKSApplicationStateMonitor *browserAppMonitor;
  BKSApplicationStateMonitor *v4;
  BKSApplicationStateMonitor *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  browserAppMonitor = self->_browserAppMonitor;
  if (!browserAppMonitor)
  {
    v4 = objc_opt_new(BKSApplicationStateMonitor);
    v5 = self->_browserAppMonitor;
    self->_browserAppMonitor = v4;

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10006FB68;
    v6[3] = &unk_100715858;
    v6[4] = self;
    -[BKSApplicationStateMonitor setHandler:](self->_browserAppMonitor, "setHandler:", v6);
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _appMonitorEnsureStarted]", 50, "App monitor started");
    }
    browserAppMonitor = self->_browserAppMonitor;
  }
  -[BKSApplicationStateMonitor updateInterestedBundleIDs:](browserAppMonitor, "updateInterestedBundleIDs:", self->_browserBundleIDs);
}

- (void)_appMonitorEnsureStopped
{
  BKSApplicationStateMonitor *browserAppMonitor;
  BKSApplicationStateMonitor *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  browserAppMonitor = self->_browserAppMonitor;
  if (browserAppMonitor)
  {
    -[BKSApplicationStateMonitor invalidate](browserAppMonitor, "invalidate");
    -[BKSApplicationStateMonitor setHandler:](self->_browserAppMonitor, "setHandler:", 0);
    v4 = self->_browserAppMonitor;
    self->_browserAppMonitor = 0;

    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _appMonitorEnsureStopped]", 50, "App monitor stopped");
    }
  }
}

- (void)_appMonitorUpdate
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  int browserClientsInactive;
  const char *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[NSMutableArray count](self->_browserBundleIDs, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_clientProxyMap, "allValues"));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v9 = objc_msgSend(v8, "browsing");
          if (v9)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
            if (!v10
              || !-[NSMutableArray containsObject:](self->_browserBundleIDs, "containsObject:", v10))
            {

              goto LABEL_19;
            }
            v11 = -[BKSApplicationStateMonitor applicationStateForApplication:](self->_browserAppMonitor, "applicationStateForApplication:", v10);
            if (dword_1007B0A10 <= 50
              && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _appMonitorStringForState:](self, "_appMonitorStringForState:", v11));
              LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _appMonitorUpdate]", 50, "App state updated: %@ state %@", v10, v12);

            }
            if ((_DWORD)v11 == 8)
              goto LABEL_19;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          continue;
        break;
      }
    }
    else
    {
LABEL_19:
      v9 = 0;
    }

    browserClientsInactive = self->_browserClientsInactive;
    self->_browserClientsInactive = v9;
    if (browserClientsInactive != v9 && dword_1007B0A10 <= 50)
    {
      if (dword_1007B0A10 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B0A10, 50))
          return;
        v9 = self->_browserClientsInactive;
      }
      v14 = "yes";
      if (browserClientsInactive)
        v15 = "yes";
      else
        v15 = "no";
      if (!v9)
        v14 = "no";
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _appMonitorUpdate]", 50, "Broswer client inactive changed: %s -> %s", v15, v14);
    }
  }
}

- (id)_appMonitorStringForState:(unsigned int)a3
{
  void *v3;

  if (a3 < 9 && ((0x117u >> a3) & 1) != 0)
    v3 = (void *)*((_QWORD *)&off_100715AF8 + (int)a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected (%ld)"), a3));
  return v3;
}

- (void)addClientID:(id)a3 proxy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sd_connectionBundleID"));
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007001C;
  v13[3] = &unk_100714990;
  v13[4] = self;
  v14 = v6;
  v15 = v9;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(dispatchQueue, v13);

}

- (void)_addClientID:(id)a3 bundleID:(id)a4 proxy:(id)a5
{
  id v8;
  NSObject *dispatchQueue;
  id v10;
  SDHotspotClient *v11;
  NSMutableDictionary *clientProxyMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  dispatchQueue = self->_dispatchQueue;
  v10 = a5;
  dispatch_assert_queue_V2(dispatchQueue);
  v11 = objc_opt_new(SDHotspotClient);
  -[SDHotspotClient setBundleID:](v11, "setBundleID:", v8);
  -[SDHotspotClient setClientProxy:](v11, "setClientProxy:", v10);

  if (dword_1007B0A10 <= 50 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _addClientID:bundleID:proxy:]", 50, "Adding client proxy (ClientID %@ Bundle %@)", v15, v8);
  clientProxyMap = self->_clientProxyMap;
  if (!clientProxyMap)
  {
    v13 = objc_opt_new(NSMutableDictionary);
    v14 = self->_clientProxyMap;
    self->_clientProxyMap = v13;

    clientProxyMap = self->_clientProxyMap;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](clientProxyMap, "setObject:forKeyedSubscript:", v11, v15);

}

- (void)removeClientID:(id)a3
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
  v7[2] = sub_1000701C4;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_removeClientID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clientProxyMap, "objectForKeyedSubscript:", v6));
  if (v4)
  {
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _removeClientID:]", 50, "Removing client proxy (ClientID %@ Bundle %@)", v6, v5);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_clientProxyMap, "removeObjectForKey:", v6);
  }

}

- (void)startBrowsing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SDConnectionManagerIdentifier")));
  if (dword_1007B0A10 <= 50 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent startBrowsing]", 50, "Browsing for client (%@)", v6);

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000703D4;
  block[3] = &unk_100714860;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)_startBrowsingForClientID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  NSMutableArray *browserBundleIDs;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  id v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[SDStatusMonitor deviceSupportsContinuity](self->_statusMonitor, "deviceSupportsContinuity"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clientProxyMap, "objectForKeyedSubscript:", v13));
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "setBrowsing:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _appMonitorAppList](self, "_appMonitorAppList"));
        v8 = objc_msgSend(v7, "containsObject:", v6);

        if ((v8 & 1) != 0)
        {
          browserBundleIDs = self->_browserBundleIDs;
          if (!browserBundleIDs)
          {
            v10 = objc_opt_new(NSMutableArray);
            v11 = self->_browserBundleIDs;
            self->_browserBundleIDs = v10;

            browserBundleIDs = self->_browserBundleIDs;
          }
          -[NSMutableArray addObject:](browserBundleIDs, "addObject:", v6);
          -[SDHotspotAgent _appMonitorEnsureStarted](self, "_appMonitorEnsureStarted");
        }
      }

      if (dword_1007B0A10 < 51
        && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _startBrowsingForClientID:]", 50, "Start Browsing (%@)", v12);

      }
      if (-[NSMutableDictionary count](self->_devices, "count") && !self->_prefRapportDisabled)
      {
        if (dword_1007B0A10 <= 50
          && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _startBrowsingForClientID:]", 50, "Updating client pre-discovered devices");
        }
        -[SDHotspotAgent _discoveryUpdateCombined:](self, "_discoveryUpdateCombined:", 1);
      }
      self->_browserActive = 1;
      -[SDHotspotAgent _update](self, "_update");
    }
    else if (dword_1007B0A10 <= 90
           && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _startBrowsingForClientID:]", 90, "### Missing client for start browsing call");
    }

  }
  else if (dword_1007B0A10 <= 60
         && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 60)))
  {
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _startBrowsingForClientID:]", 60, "### Device doesn't support tethering");
  }

}

- (void)stopBrowsing
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SDConnectionManagerIdentifier")));
  -[SDHotspotAgent stopBrowsingForClientID:](self, "stopBrowsingForClientID:", v4);

}

- (void)stopBrowsingForClientID:(id)a3
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
  v7[2] = sub_10007074C;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_stopBrowsingForClientID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *devicesLegacy;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *devicesCombined;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[SDStatusMonitor deviceSupportsContinuity](self->_statusMonitor, "deviceSupportsContinuity"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clientProxyMap, "objectForKeyedSubscript:", v4));
    objc_msgSend(v5, "setBrowsing:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
    if (v6)
      -[NSMutableArray removeObject:](self->_browserBundleIDs, "removeObject:", v6);

    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _stopBrowsingForClientID:]", 50, "Stop Browsing (%@)", v7);

    }
    if (-[NSMutableArray count](self->_browserBundleIDs, "count"))
    {
      -[SDHotspotAgent _appMonitorEnsureStarted](self, "_appMonitorEnsureStarted");
      -[SDHotspotAgent _appMonitorUpdate](self, "_appMonitorUpdate");
    }
    else
    {
      -[SDHotspotAgent _appMonitorEnsureStopped](self, "_appMonitorEnsureStopped");
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    devicesLegacy = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_clientProxyMap, "allValues"));
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](devicesLegacy, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
LABEL_16:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(devicesLegacy);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "browsing") & 1) != 0)
          break;
        if (v10 == (id)++v12)
        {
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](devicesLegacy, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v10)
            goto LABEL_16;
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:

      if (dword_1007B0A10 <= 50
        && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
      {
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _stopBrowsingForClientID:]", 50, "Stop Browsing (all clients)");
      }
      self->_browserActive = 0;
      self->_browserClientsInactive = 0;
      devicesCombined = self->_devicesCombined;
      self->_devicesCombined = 0;

      devicesLegacy = self->_devicesLegacy;
      self->_devicesLegacy = 0;
    }

    -[SDHotspotAgent _update](self, "_update");
  }
  else if (dword_1007B0A10 <= 60
         && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 60)))
  {
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _stopBrowsingForClientID:]", 60, "### Device doesn't support tethering");
  }

}

- (void)enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
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
  block[2] = sub_100070AC0;
  block[3] = &unk_100714F68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  LogCategory *v8;
  SDHotspotRequest *v9;
  id v10;
  unsigned int v11;
  const char *v12;
  const char *v13;
  unsigned int v14;
  int v15;
  int var0;
  id v17;

  v17 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = arc4random();
  v8 = -[SDHotspotAgent _logCategoryCreateWithLabel:sessionID:](self, "_logCategoryCreateWithLabel:sessionID:", CFSTR("TetheringAgent"), v7);
  v9 = objc_opt_new(SDHotspotRequest);
  -[SDHotspotRequest setRequestType:](v9, "setRequestType:", 1);
  -[SDHotspotRequest setHotspotDevice:](v9, "setHotspotDevice:", v17);
  -[SDHotspotRequest setHotspotInfoHandler:](v9, "setHotspotInfoHandler:", v6);
  -[SDHotspotRequest setLogCategory:](v9, "setLogCategory:", v8);
  -[SDHotspotRequest setSessionID:](v9, "setSessionID:", v7);
  v10 = objc_msgSend(v17, "group");
  v11 = -[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable");
  if (v8->var0 <= 50 && (v8->var0 != -1 || _LogCategory_Initialize(v8, 50)))
  {
    v12 = "no";
    if (v10 == (id)2)
      v13 = "yes";
    else
      v13 = "no";
    if (v11)
      v12 = "yes";
    LogPrintF(v8, "-[SDHotspotAgent _enableHotspotForDevice:withCompletionHandler:]", 50, "Enabling Hotspot device: Family %s, ManateeAvailable %s, %@", v13, v12, v17);
  }
  v14 = objc_msgSend(v17, "supportsCompanionLink");
  if (v10 == (id)2)
    v15 = 1;
  else
    v15 = v11;
  var0 = v8->var0;
  if (v14 && v15)
  {
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize(v8, 50)))
      LogPrintF(v8, "-[SDHotspotAgent _enableHotspotForDevice:withCompletionHandler:]", 50, "Enable with companion link");
    -[SDHotspotAgent _companionLinkActivateWithRequest:](self, "_companionLinkActivateWithRequest:", v9);
  }
  else
  {
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize(v8, 50)))
      LogPrintF(v8, "-[SDHotspotAgent _enableHotspotForDevice:withCompletionHandler:]", 50, "Enable with legacy protocol");
    -[SDHotspotBrowser enableHotspotForDevice:withCompletionHandler:](self->_hotspotBrowser, "enableHotspotForDevice:withCompletionHandler:", v17, v6);
  }

}

- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  if ((_os_feature_enabled_impl("Sharing", "config_low_latency_filter") & 1) != 0)
  {
    dispatchQueue = self->_dispatchQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100070DD8;
    v13[3] = &unk_1007158A8;
    v13[4] = self;
    v16 = a4;
    v14 = v8;
    v15 = v9;
    dispatch_async(dispatchQueue, v13);

  }
  else
  {
    v11 = NSErrorWithOSStatusF(4294960561, "Feature not supported");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    (*((void (**)(id, void *))v9 + 2))(v9, v12);

  }
}

- (void)_additionalInfoForRequest:(id)a3 toMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v5 = a4;
  if (((unint64_t)objc_msgSend(v22, "requestType") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trafficFilterParams"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "srcIPAddress"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("tfsIP"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trafficFilterParams"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v8, "srcPort")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("tfsPrt"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trafficFilterParams"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destIPAddress"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("tfdIP"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trafficFilterParams"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v12, "destPort")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("tfdPrt"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trafficFilterParams"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v14, "ipProtocol")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("tfPro"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trafficFilterParams"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trafficClass"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("tfTC"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trafficFilterParams"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v18, "ipVersion")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("tfIPv"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trafficFilterParams"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "idleTimeout")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("tfTO"));

  }
}

- (void)_companionLinkEnsureStarted
{
  uint64_t v3;
  RPCompanionLinkClient *companionLinkClient;
  RPCompanionLinkClient *v5;
  RPCompanionLinkClient *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[SDHotspotAgent _companionLinkFamilySupported](self, "_companionLinkFamilySupported"))
    v3 = 4098;
  else
    v3 = 2;
  companionLinkClient = self->_companionLinkClient;
  if (!companionLinkClient)
    goto LABEL_12;
  if (-[RPCompanionLinkClient controlFlags](companionLinkClient, "controlFlags") != (id)v3)
  {
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _companionLinkEnsureStarted]", 50, "Companion link flags updated: %#{flags} -> %#{flags}", -[RPCompanionLinkClient controlFlags](self->_companionLinkClient, "controlFlags"), &unk_1005CC2A0, v3, &unk_1005CC2A0);
    }
    -[RPCompanionLinkClient setControlFlags:](self->_companionLinkClient, "setControlFlags:", v3);
  }
  if (!self->_companionLinkClient)
  {
LABEL_12:
    v5 = objc_opt_new(RPCompanionLinkClient);
    v6 = self->_companionLinkClient;
    self->_companionLinkClient = v5;

    -[RPCompanionLinkClient setDispatchQueue:](self->_companionLinkClient, "setDispatchQueue:", self->_dispatchQueue);
    -[RPCompanionLinkClient setControlFlags:](self->_companionLinkClient, "setControlFlags:", v3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100071458;
    v9[3] = &unk_100714A48;
    v9[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_companionLinkClient, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000714F0;
    v8[3] = &unk_100714A70;
    v8[4] = self;
    -[RPCompanionLinkClient setDeviceChangedHandler:](self->_companionLinkClient, "setDeviceChangedHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100071588;
    v7[3] = &unk_100714A48;
    v7[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_companionLinkClient, "setDeviceLostHandler:", v7);
    -[RPCompanionLinkClient setInterruptionHandler:](self->_companionLinkClient, "setInterruptionHandler:", &stru_1007158C8);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_companionLinkClient, "setInvalidationHandler:", &stru_1007158E8);
    -[RPCompanionLinkClient activateWithCompletion:](self->_companionLinkClient, "activateWithCompletion:", &stru_100715908);
  }
}

- (void)_companionLinkEnsureStopped
{
  RPCompanionLinkClient *companionLinkClient;
  NSMutableDictionary *devices;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_companionLinkClient)
  {
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _companionLinkEnsureStopped]", 50, "Companion link stopped");
    }
    -[RPCompanionLinkClient setInterruptionHandler:](self->_companionLinkClient, "setInterruptionHandler:", 0);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_companionLinkClient, "setInvalidationHandler:", 0);
    -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
    companionLinkClient = self->_companionLinkClient;
    self->_companionLinkClient = 0;

    devices = self->_devices;
    self->_devices = 0;

  }
}

- (BOOL)_companionLinkShouldStart
{
  const char *v3;
  int64_t v4;
  int64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  BOOL v10;
  void *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0A10 <= 40 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 40)))
  {
    if (self->_prefLegacyDisabled)
      v3 = "yes";
    else
      v3 = "no";
    v4 = -[SDHotspotAgent _idsTetheringHostDeviceCount](self, "_idsTetheringHostDeviceCount");
    v5 = -[SDHotspotAgent _sysMonitorFamilyCount](self, "_sysMonitorFamilyCount");
    if (-[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable"))
      v6 = "yes";
    else
      v6 = "no";
    if (self->_browserActive)
      v7 = "yes";
    else
      v7 = "no";
    if (self->_systemMonitorActivated)
      v8 = "yes";
    else
      v8 = "no";
    if (self->_browserClientsInactive)
      v9 = "yes";
    else
      v9 = "no";
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _companionLinkShouldStart]", 40, "Companion link state: Pref %s, Host Count %ld, Family Count %ld, ManateeAvailable %s, SysMon %s, Browser %s, Inactive %s", v3, v4, v5, v6, v7, v8, v9);
  }
  if (self->_systemMonitorActivated && !self->_prefRapportDisabled)
  {
    if (-[SDHotspotAgent _idsTetheringHostDeviceCount](self, "_idsTetheringHostDeviceCount") >= 1
      && -[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable")
      || -[SDHotspotAgent _sysMonitorFamilyCount](self, "_sysMonitorFamilyCount") > 0)
    {
      return 1;
    }
    if (-[SDHotspotManager isTetheringSupported](self->_hotspotManager, "isTetheringSupported"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _idsDeviceArray](self, "_idsDeviceArray"));
      v10 = objc_msgSend(v12, "count") != 0;

      return v10;
    }
  }
  return 0;
}

- (BOOL)_companionLinkFamilySupported
{
  return self->_browserActive && !self->_browserClientsInactive;
}

- (void)_companionLinkActivateWithRequest:(id)a3
{
  id v4;
  void *v5;
  int *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  id v18;
  RPCompanionLinkClient *v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  id v22;
  int *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  SDHotspotAgent *v28;
  int *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hotspotDevice"));
  v6 = (int *)objc_msgSend(v4, "logCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifier"));
  if (v7)
  {
    v23 = v6;
    v24 = v5;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_companionLinkClient, "activeDevices"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v15 = objc_msgSend(v14, "isEqualToString:", v7);

        if ((v15 & 1) != 0)
          break;
        if (v10 == (id)++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v16 = v13;

      if (!v16)
        goto LABEL_15;
      v5 = v24;
      if (*v23 <= 50 && (*v23 != -1 || _LogCategory_Initialize(v23, 50)))
        LogPrintF(v23, "-[SDHotspotAgent _companionLinkActivateWithRequest:]", 50, "Activating companion link client for device: %@", v16);
      v19 = objc_opt_new(RPCompanionLinkClient);
      -[RPCompanionLinkClient setAppID:](v19, "setAppID:", CFSTR("com.sharing.hotspot"));
      -[RPCompanionLinkClient setControlFlags:](v19, "setControlFlags:", 6291712);
      -[RPCompanionLinkClient setDestinationDevice:](v19, "setDestinationDevice:", v16);
      -[RPCompanionLinkClient setDispatchQueue:](v19, "setDispatchQueue:", self->_dispatchQueue);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100071E10;
      v31[3] = &unk_1007146D8;
      v31[4] = v24;
      -[RPCompanionLinkClient setInterruptionHandler:](v19, "setInterruptionHandler:", v31);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100071E8C;
      v30[3] = &unk_1007146D8;
      v30[4] = v24;
      -[RPCompanionLinkClient setInvalidationHandler:](v19, "setInvalidationHandler:", v30);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100071F08;
      v25[3] = &unk_100715930;
      v29 = v23;
      v25[4] = v24;
      v22 = v4;
      v26 = v22;
      v27 = v16;
      v28 = self;
      v18 = v16;
      -[RPCompanionLinkClient activateWithCompletion:](v19, "activateWithCompletion:", v25);
      objc_msgSend(v22, "setCompanionLinkClient:", v19);

    }
    else
    {
LABEL_10:

LABEL_15:
      v5 = v24;
      if (*v23 <= 90 && (*v23 != -1 || _LogCategory_Initialize(v23, 90)))
        LogPrintF(v23, "-[SDHotspotAgent _companionLinkActivateWithRequest:]", 90, "### Failed to find companion link destination for device: %@", v24);
      v17 = NSErrorWithOSStatusF(4294896130, "Missing companion link device for remote hotspot device");
      v18 = (id)objc_claimAutoreleasedReturnValue(v17);
      v19 = (RPCompanionLinkClient *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hotspotInfoHandler"));
      (*((void (**)(RPCompanionLinkClient *, _QWORD, id))v19 + 2))(v19, 0, v18);
    }

  }
  else
  {
    if (*v6 <= 90 && (*v6 != -1 || _LogCategory_Initialize(v6, 90)))
      LogPrintF(v6, "-[SDHotspotAgent _companionLinkActivateWithRequest:]", 90, "### Device being enabled missing identifier: %@", v5);
    v20 = NSErrorWithOSStatusF(4294960554, "Remote hotspot device missing identifer");
    v18 = (id)objc_claimAutoreleasedReturnValue(v20);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hotspotInfoHandler"));
    ((void (**)(_QWORD, _QWORD, id))v21)[2](v21, 0, v18);

  }
}

- (void)_companionLinkActivatedRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int16 v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "companionLinkClient"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationDevice"));
  v7 = (unsigned __int16)objc_msgSend(v6, "statusFlags");

  v8 = SFDeviceProductVersion();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_opt_new(NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAltDSID](self->_statusMonitor, "myAltDSID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, CFSTR("altDSID"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self->_statusMonitor, "myAppleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, CFSTR("aplID"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor computerName](self->_statusMonitor, "computerName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, CFSTR("devnm"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v7 & 0x4000) == 0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, CFSTR("icld"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "sessionID")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v15, CFSTR("sID"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "requestType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, CFSTR("reqT"));

  if (v9 && (objc_msgSend(v9, "isEqualToString:", CFSTR("?")) & 1) == 0)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, CFSTR("proVer"));
  if (objc_msgSend(v4, "requestType") == (id)2 || objc_msgSend(v4, "requestType") == (id)3)
    -[SDHotspotAgent _additionalInfoForRequest:toMessage:](self, "_additionalInfoForRequest:toMessage:", v4, v10);
  v17 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", &off_10074B370, RPOptionTimeoutSeconds);
  if (*(int *)objc_msgSend(v4, "logCategory") <= 50
    && (*(_DWORD *)objc_msgSend(v4, "logCategory") != -1
     || _LogCategory_Initialize(objc_msgSend(v4, "logCategory"), 50)))
  {
    LogPrintF(objc_msgSend(v4, "logCategory"), "-[SDHotspotAgent _companionLinkActivatedRequest:]", 50, "Request: %@", v10);
  }
  v18 = RPDestinationIdentifierDirectPeer;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100072324;
  v20[3] = &unk_100715958;
  v20[4] = self;
  v21 = v4;
  v19 = v4;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.sharing.hotspot.request"), v10, v18, v17, v20);

}

- (void)_companionLinkHandleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t Int64Ranged;
  uint64_t v12;
  LogCategory *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  SDStatusMonitor *statusMonitor;
  void *v35;
  unint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  int v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  unsigned int CanConnectOn5GHz;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[5];
  id v59;
  id v60;
  _QWORD *v61;
  LogCategory *v62;
  char v63;
  _QWORD v64[4];
  id v65;
  LogCategory *v66;
  int v67[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v67[0] = 0;
  Int64Ranged = CFDictionaryGetInt64Ranged(v8, CFSTR("sID"), 0, 0xFFFFFFFFLL, v67);
  if (v67[0])
  {
    v12 = arc4random();
    if (dword_1007B0A10 <= 60
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 60)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 60, "Incoming request missing session ID, setting random ID: %x", v12);
    }
  }
  else
  {
    v12 = Int64Ranged;
  }
  v13 = -[SDHotspotAgent _logCategoryCreateWithLabel:sessionID:](self, "_logCategoryCreateWithLabel:sessionID:", CFSTR("TetheringAgent"), v12);
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_100072BDC;
  v64[3] = &unk_100715980;
  v66 = v13;
  v14 = v10;
  v65 = v14;
  v15 = objc_retainBlock(v64);
  if (v13->var0 <= 50 && (v13->var0 != -1 || _LogCategory_Initialize(v13, 50)))
    LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 50, "Received request: %@", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reqT")));
  v17 = v16;
  if (!v16 || (v18 = (unint64_t)objc_msgSend(v16, "integerValue"), (v18 & 0xFFFFFFFFFFFFFFFELL) != 2))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("devnm")));
    if (!v19)
    {
      if (v13->var0 <= 90 && (v13->var0 != -1 || _LogCategory_Initialize(v13, 90)))
        LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 90, "### %@", CFSTR("Request missing name"));
      v26 = NSErrorWithOSStatusF(4294960588, objc_msgSend(CFSTR("Request missing name"), "UTF8String"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v26);
      ((void (*)(_QWORD *, _QWORD, _QWORD, void *))v15[2])(v15, 0, 0, v20);
      goto LABEL_74;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("icld")));
    if (!v20)
    {
      if (v13->var0 <= 90 && (v13->var0 != -1 || _LogCategory_Initialize(v13, 90)))
        LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 90, "### %@", CFSTR("Request missing same iCloud state"));
      v27 = NSErrorWithOSStatusF(4294960588, objc_msgSend(CFSTR("Request missing same iCloud state"), "UTF8String"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      ((void (*)(_QWORD *, _QWORD, _QWORD, void *))v15[2])(v15, 0, 0, v28);
      goto LABEL_73;
    }
    v53 = v19;
    v21 = off_1007B0A80();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)v22;
    if (v22)
      v24 = (const __CFString *)v22;
    else
      v24 = CFSTR("senderModelID");
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v24));

    if (v25)
    {
      CanConnectOn5GHz = SFRemoteDeviceCanConnectOn5GHz(v25);
    }
    else
    {
      if (v13->var0 <= 40 && (v13->var0 != -1 || _LogCategory_Initialize(v13, 40)))
        LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 40, "### %@", CFSTR("Request option missing sender device's modelID"));
      CanConnectOn5GHz = 0;
    }
    v52 = (void *)v25;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("proVer")));
    if (!v56 && v13->var0 <= 40 && (v13->var0 != -1 || _LogCategory_Initialize(v13, 40)))
      LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 40, "### %@", CFSTR("Request option missing sender device's product version"));
    v29 = objc_msgSend(v20, "BOOLValue");
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("altDSID")));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("aplID")));
    v57 = (void *)v31;
    if (v30)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _sysMonitorFamilyMemberForAltDSID:](self, "_sysMonitorFamilyMemberForAltDSID:", v30));
    }
    else if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _sysMonitorFamilyMemberForAppleID:](self, "_sysMonitorFamilyMemberForAppleID:", v31));
    }
    else
    {
      v32 = 0;
    }
    if (v32)
      v33 = 1;
    else
      v33 = v29;
    v54 = (void *)v30;
    v55 = v32;
    if ((v33 & 1) != 0)
    {
      v50 = v9;
      statusMonitor = self->_statusMonitor;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "altDSID"));
      v36 = -[SDStatusMonitor familyHotspotStateForAltDSID:](statusMonitor, "familyHotspotStateForAltDSID:", v35);

      if (v13->var0 <= 50 && (v13->var0 != -1 || _LogCategory_Initialize(v13, 50)))
      {
        v9 = v50;
        if (v29)
        {
          LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 50, "Group: %@", CFSTR("iCloud"));
LABEL_70:
          v28 = v52;
          -[SDHotspotAgent _companionLinkStartTetheringWithResponse:logCategory:modelID:productVersion:canConnectOn5GHz:](self, "_companionLinkStartTetheringWithResponse:logCategory:modelID:productVersion:canConnectOn5GHz:", v15, v13, v52, v56, CanConnectOn5GHz);
LABEL_71:
          v19 = v53;
          goto LABEL_72;
        }
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstName"));
        if (v36 > 2)
          v42 = "?";
        else
          v42 = (&off_100715B40)[v36];
        v49 = (void *)v41;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Family ('%@') - %s"), v41, v42));
        LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 50, "Group: %@", v43);

      }
      if (v36 == 2)
        v44 = 1;
      else
        v44 = v29;
      v9 = v50;
      if (v44 == 1)
        goto LABEL_70;
      if (v36 != -1)
      {
        if (v36)
        {
          v45 = v36 == 1;
          v28 = v52;
          v19 = v53;
          if (v45)
          {
            v58[0] = _NSConcreteStackBlock;
            v58[1] = 3221225472;
            v58[2] = sub_100072C60;
            v58[3] = &unk_1007159A8;
            v61 = v15;
            v62 = v13;
            v58[4] = self;
            v59 = v52;
            v60 = v56;
            v63 = CanConnectOn5GHz;
            -[SDHotspotAgent _userAlertForMember:logCategory:completion:](self, "_userAlertForMember:logCategory:completion:", v55, v13, v58);

          }
          goto LABEL_72;
        }
        v28 = v52;
        if (v13->var0 <= 90 && (v13->var0 != -1 || _LogCategory_Initialize(v13, 90)))
          LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 90, "### Request from family device but user disabled Family Instant Hotspot");
        v47 = NSErrorWithOSStatusF(4294960551, "Family state disabled");
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        ((void (*)(_QWORD *, _QWORD, _QWORD, void *))v15[2])(v15, 0, 0, v48);

        goto LABEL_71;
      }
      if (v13->var0 <= 90 && (v13->var0 != -1 || _LogCategory_Initialize(v13, 90)))
        LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 90, "### Family state unknown");
      v46 = NSErrorWithOSStatusF(4294960534, "Family state unknown");
      v38 = (id)objc_claimAutoreleasedReturnValue(v46);
      ((void (*)(_QWORD *, _QWORD, _QWORD, id))v15[2])(v15, 0, 0, v38);
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Family member missing (%@<%@>)"), v57, v30));
      if (v13->var0 <= 90 && (v13->var0 != -1 || _LogCategory_Initialize(v13, 90)))
        LogPrintF(v13, "-[SDHotspotAgent _companionLinkHandleRequest:options:responseHandler:]", 90, "### %@", v37);
      v38 = objc_retainAutorelease(v37);
      v39 = NSErrorWithOSStatusF(4294960563, objc_msgSend(v38, "UTF8String"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      ((void (*)(_QWORD *, _QWORD, _QWORD, void *))v15[2])(v15, 0, 0, v40);

    }
    v28 = v52;
    v19 = v53;
LABEL_72:

LABEL_73:
LABEL_74:

    goto LABEL_75;
  }
  -[SDHotspotAgent _companionLinkHandleLowLatencyFilterRequestOfType:request:options:responseHandler:](self, "_companionLinkHandleLowLatencyFilterRequestOfType:request:options:responseHandler:", v18, v8, v9, v14);
LABEL_75:

}

- (void)_companionLinkHandleResponse:(id)a3 request:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  NSString *v17;
  NSString *hotspotDeviceIdentifier;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v19)
  {
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("name")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pass")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("chan")));
    v13 = objc_msgSend(objc_alloc((Class)SFRemoteHotspotInfo), "initWithName:password:channel:", v10, v11, v12);
    if (*(int *)objc_msgSend(v8, "logCategory") <= 50
      && (*(_DWORD *)objc_msgSend(v8, "logCategory") != -1
       || _LogCategory_Initialize(objc_msgSend(v8, "logCategory"), 50)))
    {
      LogPrintF(objc_msgSend(v8, "logCategory"), "-[SDHotspotAgent _companionLinkHandleResponse:request:error:]", 50, "Request complete: success with info: %@", v13);
    }
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hotspotInfoHandler"));
    ((void (**)(_QWORD, id, _QWORD))v14)[2](v14, v13, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "companionLinkClient"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "destinationDevice"));
    v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
    hotspotDeviceIdentifier = self->_hotspotDeviceIdentifier;
    self->_hotspotDeviceIdentifier = v17;

    if (*(int *)objc_msgSend(v8, "logCategory") <= 50
      && (*(_DWORD *)objc_msgSend(v8, "logCategory") != -1
       || _LogCategory_Initialize(objc_msgSend(v8, "logCategory"), 50)))
    {
      LogPrintF(objc_msgSend(v8, "logCategory"), "-[SDHotspotAgent _companionLinkHandleResponse:request:error:]", 50, "Set hotspot device identifier to %@", self->_hotspotDeviceIdentifier);
    }

  }
  else
  {
    if (*(int *)objc_msgSend(v8, "logCategory") <= 90
      && (*(_DWORD *)objc_msgSend(v8, "logCategory") != -1
       || _LogCategory_Initialize(objc_msgSend(v8, "logCategory"), 90)))
    {
      LogPrintF(objc_msgSend(v8, "logCategory"), "-[SDHotspotAgent _companionLinkHandleResponse:request:error:]", 90, "### Request complete: failed with error: %@", v9);
    }
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hotspotInfoHandler"));
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v9);
  }

}

- (BOOL)_fillXpcDictionaryDescriptor:(id)a3 descriptor:(id)a4 metaData:(id)a5
{
  id v7;
  id v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  uint64_t NSNumber;
  void *v13;
  CFTypeID v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  BOOL v29;
  char v30;
  xpc_object_t xdict;

  xdict = a4;
  v7 = a5;
  v8 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("tfsIP"), TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  NSNumber = NSDictionaryGetNSNumber(v8, CFSTR("tfsPrt"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  v14 = CFStringGetTypeID();
  v15 = CFDictionaryGetTypedValue(v8, CFSTR("tfdIP"), v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = NSDictionaryGetNSNumber(v8, CFSTR("tfdPrt"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = NSDictionaryGetNSNumber(v8, CFSTR("tfPro"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = NSDictionaryGetNSNumber(v8, CFSTR("tfIPv"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = NSDictionaryGetNSNumber(v8, CFSTR("tfTO"), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  if (v11)
    v25 = v13 == 0;
  else
    v25 = 1;
  v29 = v25 || v16 == 0 || v18 == 0 || v20 == 0 || v22 == 0;
  v30 = v29;
  if (v29)
  {
    if (dword_1007B0A10 <= 90
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _fillXpcDictionaryDescriptor:descriptor:metaData:]", 90, "missing items in inRequest dictionary");
    }
  }
  else
  {
    xpc_dictionary_set_string(v7, netrbClientIfnetTrafficDescriptorLocalIp, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    xpc_dictionary_set_string(v7, netrbClientIfnetTrafficDescriptorRemoteIp, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorLocalPort, (int)objc_msgSend(v13, "intValue"));
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorRemotePort, (int)objc_msgSend(v18, "intValue"));
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorDeviceId, 0);
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorIpProtocol, (int)objc_msgSend(v20, "intValue"));
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorIpVersion, (int)objc_msgSend(v22, "intValue"));
    if (v24 && objc_msgSend(v24, "intValue"))
      xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout, (int)objc_msgSend(v24, "intValue"));
    xpc_dictionary_set_value(xdict, netrbClientLowLatencyFlowParam, v7);
  }

  return v30 ^ 1;
}

- (void)_companionLinkHandleLowLatencyFilterRequestOfType:(int64_t)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v10 = a4;
  v11 = a5;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100073504;
  v19[3] = &unk_1007159D0;
  v12 = a6;
  v20 = 0;
  v21 = v12;
  v13 = objc_retainBlock(v19);
  if (dword_1007B0A10 <= 50 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _companionLinkHandleLowLatencyFilterRequestOfType:request:options:responseHandler:]", 50, "_companionLinkHandleLowLatencyFilterRequestOfType: %d", a3);
  v14 = xpc_dictionary_create(0, 0, 0);
  v15 = xpc_dictionary_create(0, 0, 0);
  if (-[SDHotspotAgent _fillXpcDictionaryDescriptor:descriptor:metaData:](self, "_fillXpcDictionaryDescriptor:descriptor:metaData:", v10, v14, v15))
  {
    v16 = _NETRBClientCreate(0, 0, 0);
    v17 = v16;
    if (v16)
    {
      if (a3 == 2)
        v18 = _NETRBClientAddLowLatencyFlow(v16, v14);
      else
        v18 = _NETRBClientRemoveLowLatencyFlow(v16, v14);
      if ((v18 & 1) != 0)
      {
        if (dword_1007B0A10 <= 40
          && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 40)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _companionLinkHandleLowLatencyFilterRequestOfType:request:options:responseHandler:]", 40, "Low latency filter update succeeded with inRequestType %d");
        }
      }
      else if (dword_1007B0A10 <= 90
             && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
      {
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _companionLinkHandleLowLatencyFilterRequestOfType:request:options:responseHandler:]", 90, "Failed to update low latency filter with inRequestType %d");
      }
      _NETRBClientDestroy(v17);
    }
    else if (dword_1007B0A10 <= 90
           && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _companionLinkHandleLowLatencyFilterRequestOfType:request:options:responseHandler:]", 90, "Unable to create a NETRBClientRef client");
    }
  }

  ((void (*)(_QWORD *))v13[2])(v13);
}

- (void)_companionLinkStartTetheringWithResponse:(id)a3 logCategory:(LogCategory *)a4 modelID:(id)a5 productVersion:(id)a6 canConnectOn5GHz:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  LogCategory *v19;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (a4->var0 <= 50 && (a4->var0 != -1 || _LogCategory_Initialize(a4, 50)))
    LogPrintF(a4, "-[SDHotspotAgent _companionLinkStartTetheringWithResponse:logCategory:modelID:productVersion:canConnectOn5GHz:]", 50, "Turning on Personal Hotspot");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100073634;
  v17[3] = &unk_100715A20;
  v18 = v12;
  v19 = a4;
  v17[4] = self;
  v15 = v12;
  v16 = objc_retainBlock(v17);
  -[SDHotspotManager startTetheringWithCompletionHandler:modelID:productVersion:canConnectOn5GHz:](self->_hotspotManager, "startTetheringWithCompletionHandler:modelID:productVersion:canConnectOn5GHz:", v16, v13, v14, v7);

}

- (void)_discoveryDeviceFound:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  unsigned __int16 v8;
  const char *v9;
  SFRemoteHotspotDevice *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *devices;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = objc_msgSend(v18, "hotspotInfo");
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
    if (v6)
    {
      v7 = (unint64_t)objc_msgSend(v18, "statusFlags") & 0x80000;
      v8 = (unsigned __int16)objc_msgSend(v18, "statusFlags");
      if (v7 | v8 & 0x4000)
      {
        if ((v5 & 0x80) != 0 || (v8 & 0x4000) == 0)
        {
          v10 = objc_opt_new(SFRemoteHotspotDevice);
          -[SFRemoteHotspotDevice setDeviceIdentifier:](v10, "setDeviceIdentifier:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          -[SFRemoteHotspotDevice setDeviceName:](v10, "setDeviceName:", v11);

          -[SFRemoteHotspotDevice setGroup:](v10, "setGroup:", -[SDHotspotAgent _discoveryGroupForDevice:](self, "_discoveryGroupForDevice:", v18));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "model"));
          -[SFRemoteHotspotDevice setModel:](v10, "setModel:", v12);

          -[SFRemoteHotspotDevice setOsSupportsAutoHotspot:](v10, "setOsSupportsAutoHotspot:", 1);
          -[SFRemoteHotspotDevice setSupportsCompanionLink:](v10, "setSupportsCompanionLink:", 1);
          -[SFRemoteHotspotDevice updateWithHotspotInfo:](v10, "updateWithHotspotInfo:", v5);
          if (dword_1007B0A10 <= 50
            && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
          {
            LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceFound:]", 50, "Device found: %@", v18);
          }
          devices = self->_devices;
          if (!devices)
          {
            v14 = objc_opt_new(NSMutableDictionary);
            v15 = self->_devices;
            self->_devices = v14;

            devices = self->_devices;
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[SFRemoteHotspotDevice deviceIdentifier](v10, "deviceIdentifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v10, v16);

          -[SDHotspotAgent _discoveryUpdateCombined:](self, "_discoveryUpdateCombined:", 0);
        }
        else if (dword_1007B0A10 <= 50
               && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceFound:]", 50, "Found family device that has family hotspot disabled: %@", v18);
        }
        goto LABEL_35;
      }
      if (dword_1007B0A10 > 90
        || dword_1007B0A10 == -1 && !_LogCategory_Initialize(&dword_1007B0A10, 90))
      {
LABEL_35:

        goto LABEL_36;
      }
      v17 = v18;
      v9 = "### Found device not in own iCloud or family circle: %@";
    }
    else
    {
      if (dword_1007B0A10 > 90
        || dword_1007B0A10 == -1 && !_LogCategory_Initialize(&dword_1007B0A10, 90))
      {
        goto LABEL_35;
      }
      v17 = v18;
      v9 = "### Device found without identifier: %@";
    }
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceFound:]", 90, v9, v17);
    goto LABEL_35;
  }
  if (dword_1007B0A10 <= 30 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 30)))
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceFound:]", 30, "Found device without hotspot info: %@", v18);
LABEL_36:

}

- (void)_discoveryDeviceChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  SFRemoteHotspotDevice *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *devices;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  id v14;

  v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));
    v6 = objc_msgSend(v14, "hotspotInfo");
    if ((objc_msgSend(v14, "statusFlags") & 0x80000) != 0)
    {
      v7 = 1;
      if (!(_DWORD)v6)
        goto LABEL_14;
    }
    else
    {
      v7 = (objc_msgSend(v14, "statusFlags") >> 14) & ((v6 & 0x80) >> 7);
      if (!(_DWORD)v6)
        goto LABEL_14;
    }
    if (v7)
    {
      v8 = objc_opt_new(SFRemoteHotspotDevice);
      -[SFRemoteHotspotDevice setDeviceIdentifier:](v8, "setDeviceIdentifier:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      -[SFRemoteHotspotDevice setDeviceName:](v8, "setDeviceName:", v9);

      -[SFRemoteHotspotDevice setGroup:](v8, "setGroup:", -[SDHotspotAgent _discoveryGroupForDevice:](self, "_discoveryGroupForDevice:", v14));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
      -[SFRemoteHotspotDevice setModel:](v8, "setModel:", v10);

      -[SFRemoteHotspotDevice setOsSupportsAutoHotspot:](v8, "setOsSupportsAutoHotspot:", 1);
      -[SFRemoteHotspotDevice setSupportsCompanionLink:](v8, "setSupportsCompanionLink:", 1);
      -[SFRemoteHotspotDevice updateWithHotspotInfo:](v8, "updateWithHotspotInfo:", v6);
      if ((-[SFRemoteHotspotDevice componentsAreEqualTo:](v8, "componentsAreEqualTo:", v5) & 1) == 0)
      {
        if (dword_1007B0A10 <= 50
          && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceChanged:]", 50, "Device updated: %@", v14);
        }
        devices = self->_devices;
        if (!devices)
        {
          v12 = objc_opt_new(NSMutableDictionary);
          v13 = self->_devices;
          self->_devices = v12;

          devices = self->_devices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v8, v4);
        -[SDHotspotAgent _discoveryUpdateCombined:](self, "_discoveryUpdateCombined:", 0);
      }

      goto LABEL_38;
    }
LABEL_14:
    if (v5)
    {
      if (dword_1007B0A10 <= 50
        && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
      {
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceChanged:]", 50, "Device lost (change): %@", v14);
      }
      if (((unsigned __int16)objc_msgSend(v14, "statusFlags") & 0x4000) == 0 || (v6 & 0x80) != 0)
      {
        if (dword_1007B0A10 <= 50
          && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceChanged:]", 50, "Removing hotspot device: %@", v5);
        }
      }
      else if (dword_1007B0A10 <= 50
             && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
      {
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceChanged:]", 50, "Removing hotspot device (family disabled): %@", v5);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
      -[SDHotspotAgent _discoveryUpdateCombined:](self, "_discoveryUpdateCombined:", 0);
    }
LABEL_38:

    goto LABEL_39;
  }
  if (dword_1007B0A10 <= 90 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceChanged:]", 90, "### Device changed without identifier: %@", v14);
LABEL_39:

}

- (void)_discoveryDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      if (dword_1007B0A10 <= 50
        && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
      {
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceLost:]", 50, "Device lost: %@", v6);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
      -[SDHotspotAgent _discoveryUpdateCombined:](self, "_discoveryUpdateCombined:", 0);
    }
    else if (dword_1007B0A10 <= 30
           && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 30)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceLost:]", 30, "Device lost never had hotspot info: %@", v6);
    }
  }
  else if (dword_1007B0A10 <= 90
         && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
  {
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryDeviceLost:]", 90, "### Device lost without identifier: %@", v6);
  }

}

- (void)_discoveryUpdateClients
{
  NSMutableDictionary *clientProxyMap;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  clientProxyMap = self->_clientProxyMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100074124;
  v4[3] = &unk_100715A48;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientProxyMap, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)_discoveryUpdateCombined:(BOOL)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *devices;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  int v26;
  const char *v27;
  _BOOL4 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[6];
  _BYTE v38[128];
  _BYTE v39[128];

  v28 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = objc_opt_new(NSMutableDictionary);
  devices = self->_devices;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100074618;
  v37[3] = &unk_100715A70;
  v37[4] = self;
  v37[5] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devices, "enumerateKeysAndObjectsUsingBlock:", v37);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = self->_devicesLegacy;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceIdentifier"));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _idsDeviceIDForBluetoothID:](self, "_idsDeviceIDForBluetoothID:", v12));
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v13));

            if (!v14)
              -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, v13);
          }
          else if (dword_1007B0A10 <= 90
                 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
          {
            LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryUpdateCombined:]", 90, "### Legacy device missing IDS identifier %@", v11);
          }

        }
        else if (dword_1007B0A10 <= 90
               && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryUpdateCombined:]", 90, "### Legacy device missing identifier %@", v11);
        }

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  v15 = -[NSMutableDictionary count](self->_devicesCombined, "count");
  if (v15 == -[NSMutableDictionary count](v4, "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v4, "allValues"));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      while (2)
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "deviceIdentifier"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesCombined, "objectForKeyedSubscript:", v22));
          if (!v23)
          {

LABEL_36:
            v26 = 1;
            goto LABEL_37;
          }
          v24 = v23;
          v25 = objc_msgSend(v23, "componentsAreEqualTo:", v21);

          if (!v25)
            goto LABEL_36;
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        v26 = 0;
        if (v18)
          continue;
        break;
      }
    }
    else
    {
      v26 = 0;
    }
LABEL_37:

  }
  else
  {
    v26 = 1;
  }
  if (dword_1007B0A10 <= 50 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
  {
    if (v26)
      v27 = "yes";
    else
      v27 = "no";
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryUpdateCombined:]", 50, "Devices changed: %s %@proxy %d", v27, v4, -[NSMutableDictionary count](self->_clientProxyMap, "count"));
  }
  objc_storeStrong((id *)&self->_devicesCombined, v4);
  if ((v26 | v28) == 1)
    -[SDHotspotAgent _discoveryUpdateClients](self, "_discoveryUpdateClients");

}

- (void)_discoveryUpdateLegacyDeviceList:(id)a3
{
  NSArray *v4;
  NSArray *devicesLegacy;

  v4 = (NSArray *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0A10 <= 50 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _discoveryUpdateLegacyDeviceList:]", 50, "Legacy devices updated: %@", v4);
  devicesLegacy = self->_devicesLegacy;
  self->_devicesLegacy = v4;

  -[SDHotspotAgent _discoveryUpdateCombined:](self, "_discoveryUpdateCombined:", 0);
}

- (void)updatedFoundDeviceList:(id)a3
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
  v7[2] = sub_10007479C;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (int64_t)_discoveryGroupForDevice:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "statusFlags") & 0x80000) != 0)
    v4 = 1;
  else
    v4 = ((unint64_t)objc_msgSend(v3, "statusFlags") >> 13) & 2;

  return v4;
}

- (void)_idsEnsureStarted
{
  IDSService *v3;
  IDSService *idsService;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_idsService)
  {
    v3 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.continuity.tethering"));
    idsService = self->_idsService;
    self->_idsService = v3;

    -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_dispatchQueue);
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _idsEnsureStarted]", 50, "IDS started");
    }
  }
}

- (void)_idsEnsureStopped
{
  NSArray *idsDeviceArray;
  IDSService *idsService;
  IDSService *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  idsDeviceArray = self->_idsDeviceArray;
  self->_idsDeviceArray = 0;

  idsService = self->_idsService;
  if (idsService)
  {
    -[IDSService removeDelegate:](idsService, "removeDelegate:", self);
    v5 = self->_idsService;
    self->_idsService = 0;

    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _idsEnsureStopped]", 50, "IDS stopped");
    }
  }
}

- (id)_idsDeviceArray
{
  NSArray *idsDeviceArray;
  NSArray *v4;
  NSArray *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  idsDeviceArray = self->_idsDeviceArray;
  if (!idsDeviceArray)
  {
    if (dword_1007B0A10 <= 30
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 30)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _idsDeviceArray]", 30, "Get IDSDevices");
    }
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
    v5 = self->_idsDeviceArray;
    self->_idsDeviceArray = v4;

    idsDeviceArray = self->_idsDeviceArray;
  }
  return idsDeviceArray;
}

- (id)_idsDeviceIDForBluetoothID:(id)a3
{
  id v4;
  NSDictionary *idsDeviceBTDictionary;
  NSMutableDictionary *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  idsDeviceBTDictionary = self->_idsDeviceBTDictionary;
  if (!idsDeviceBTDictionary)
  {
    v6 = objc_opt_new(NSMutableDictionary);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _idsDeviceArray](self, "_idsDeviceArray", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nsuuid"));
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIDOverride"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v16 = self->_idsDeviceBTDictionary;
    self->_idsDeviceBTDictionary = &v6->super;

    idsDeviceBTDictionary = self->_idsDeviceBTDictionary;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](idsDeviceBTDictionary, "objectForKeyedSubscript:", v4));

  return v17;
}

- (int64_t)_idsLegacyClientDeviceCount
{
  int64_t result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  result = self->_idsLegacyClientDeviceCount;
  if (result < 0)
  {
    self->_idsLegacyClientDeviceCount = 0;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _idsDeviceArray](self, "_idsDeviceArray"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (!v5)
      goto LABEL_28;
    v6 = v5;
    v7 = *(_QWORD *)v21;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));

        if (v11)
        {
          if (objc_msgSend(v11, "containsString:", CFSTR("mac")))
          {
            if (!v9)
            {
              v17 = 0;
              v18 = 0;
              v12 = (uint64_t *)&v15;
              v19 = 0;
LABEL_21:
              *v12 = 0;
              v12[1] = 0;
              v12[2] = 0;
LABEL_22:
              ++self->_idsLegacyClientDeviceCount;
              goto LABEL_23;
            }
            objc_msgSend(v9, "operatingSystemVersion");
            if (v17 < 11)
            {
              objc_msgSend(v9, "operatingSystemVersion");
              if (v16 < 15)
                goto LABEL_22;
            }
          }
          if ((objc_msgSend(v11, "containsString:", CFSTR("iphone")) & 1) != 0
            || objc_msgSend(v11, "containsString:", CFSTR("ipad")))
          {
            v12 = &v14;
            if (!v9)
              goto LABEL_21;
            objc_msgSend(v9, "operatingSystemVersion");
            if (v14 < 13)
              goto LABEL_22;
          }
        }
        else if (dword_1007B0A10 <= 90
               && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _idsLegacyClientDeviceCount]", 90, "### IDS device missing model: %@", v9);
        }
LABEL_23:

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v6 = v13;
      if (!v13)
      {
LABEL_28:

        return self->_idsLegacyClientDeviceCount;
      }
    }
  }
  return result;
}

- (int64_t)_idsLegacyHostDeviceCount
{
  int64_t result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  result = self->_idsLegacyHostDeviceCount;
  if (result < 0)
  {
    self->_idsLegacyHostDeviceCount = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _idsDeviceArray](self, "_idsDeviceArray"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (!v5)
      goto LABEL_15;
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "supportsTethering"))
        {
          if (!v9)
          {
            v10 = 0;
LABEL_12:
            ++self->_idsLegacyHostDeviceCount;
            continue;
          }
          objc_msgSend(v9, "operatingSystemVersion");
          if (v10 <= 12)
            goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (!v6)
      {
LABEL_15:

        return self->_idsLegacyHostDeviceCount;
      }
    }
  }
  return result;
}

- (int64_t)_idsTetheringClientDeviceCount
{
  int64_t result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  result = self->_idsTetheringClientDeviceCount;
  if (result < 0)
  {
    self->_idsTetheringClientDeviceCount = 0;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _idsDeviceArray](self, "_idsDeviceArray"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v5)
      goto LABEL_34;
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));

        if (v11)
        {
          if (objc_msgSend(v11, "containsString:", CFSTR("mac")))
          {
            if (v9)
            {
              objc_msgSend(v9, "operatingSystemVersion");
              if (v16 > 14)
                goto LABEL_28;
              objc_msgSend(v9, "operatingSystemVersion");
              if (v15 > 10)
                goto LABEL_28;
            }
            else
            {
              v16 = 0;
              v15 = 0;
            }
          }
          if ((objc_msgSend(v11, "containsString:", CFSTR("iphone")) & 1) != 0
            || objc_msgSend(v11, "containsString:", CFSTR("ipad")))
          {
            if (v9)
            {
              objc_msgSend(v9, "operatingSystemVersion");
              if (v14 <= 12)
                goto LABEL_21;
LABEL_28:
              ++self->_idsTetheringClientDeviceCount;
              goto LABEL_29;
            }
            v14 = 0;
            if ((objc_msgSend(v11, "containsString:", CFSTR("watch")) & 1) != 0)
LABEL_26:
              v13 = 0;
          }
          else
          {
LABEL_21:
            if ((objc_msgSend(v11, "containsString:", CFSTR("watch")) & 1) != 0)
            {
              if (!v9)
                goto LABEL_26;
              objc_msgSend(v9, "operatingSystemVersion");
              if (v13 > 5)
                goto LABEL_28;
            }
          }
          if (!objc_msgSend(v11, "containsString:", CFSTR("realitydevice")))
            goto LABEL_29;
          goto LABEL_28;
        }
        if (dword_1007B0A10 <= 90
          && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 90)))
        {
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _idsTetheringClientDeviceCount]", 90, "### IDS device missing model for client count: %@", v9);
        }
LABEL_29:

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v12;
      if (!v12)
      {
LABEL_34:

        return self->_idsTetheringClientDeviceCount;
      }
    }
  }
  return result;
}

- (int64_t)_idsTetheringHostDeviceCount
{
  int64_t result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  result = self->_idsTetheringHostDeviceCount;
  if (result < 0)
  {
    self->_idsTetheringHostDeviceCount = 0;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _idsDeviceArray](self, "_idsDeviceArray", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "supportsTethering"))
            ++self->_idsTetheringHostDeviceCount;
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    return self->_idsTetheringHostDeviceCount;
  }
  return result;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  NSArray *v5;
  NSArray *idsDeviceArray;
  NSArray *v7;
  NSDictionary *idsDeviceBTDictionary;
  __int128 v9;

  v5 = (NSArray *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0A10 <= 50 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent service:devicesChanged:]", 50, "IDS devicesChanged: %d device(s)\n", -[NSArray count](v5, "count"));
  idsDeviceArray = self->_idsDeviceArray;
  self->_idsDeviceArray = v5;
  v7 = v5;

  idsDeviceBTDictionary = self->_idsDeviceBTDictionary;
  self->_idsDeviceBTDictionary = 0;

  *(_QWORD *)&v9 = -1;
  *((_QWORD *)&v9 + 1) = -1;
  *(_OWORD *)&self->_idsLegacyClientDeviceCount = v9;
  *(_OWORD *)&self->_idsTetheringClientDeviceCount = v9;
  -[SDHotspotAgent _update](self, "_update");
}

- (void)_legacyBrowserEnsureStarted
{
  SDHotspotBrowser *v3;
  SDHotspotBrowser *hotspotBrowser;
  unsigned int v5;
  SDHotspotBrowser *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_hotspotBrowser)
  {
    v3 = objc_opt_new(SDHotspotBrowser);
    hotspotBrowser = self->_hotspotBrowser;
    self->_hotspotBrowser = v3;

    -[SDHotspotBrowser setClientProxy:](self->_hotspotBrowser, "setClientProxy:", self);
    -[SDHotspotBrowser setHotspotManager:](self->_hotspotBrowser, "setHotspotManager:", self->_hotspotManager);
    -[SDHotspotBrowser setIdsService:](self->_hotspotBrowser, "setIdsService:", self->_idsService);
    -[SDHotspotBrowser setD2dEncryptionAvailable:](self->_hotspotBrowser, "setD2dEncryptionAvailable:", -[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable"));
    -[SDHotspotBrowser activate](self->_hotspotBrowser, "activate");
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _legacyBrowserEnsureStarted]", 50, "Legacy browser started");
    }
  }
  -[SDHotspotBrowser setProducerScanEnabled:](self->_hotspotBrowser, "setProducerScanEnabled:", -[SDHotspotAgent _legacyBrowserShouldScan](self, "_legacyBrowserShouldScan"));
  v5 = -[SDHotspotAgent _legacyBrowserShouldBrowse](self, "_legacyBrowserShouldBrowse");
  v6 = self->_hotspotBrowser;
  if (v5)
    -[SDHotspotBrowser startBrowsing](v6, "startBrowsing");
  else
    -[SDHotspotBrowser stopBrowsing](v6, "stopBrowsing");
}

- (void)_legacyBrowserEnsureStopped
{
  SDHotspotBrowser *hotspotBrowser;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_hotspotBrowser)
  {
    if (dword_1007B0A10 <= 50
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 50)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _legacyBrowserEnsureStopped]", 50, "Legacy browser stopped");
    }
    -[SDHotspotBrowser invalidate](self->_hotspotBrowser, "invalidate");
    hotspotBrowser = self->_hotspotBrowser;
    self->_hotspotBrowser = 0;

  }
}

- (BOOL)_legacyBrowserShouldStart
{
  const char *v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  id v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  void *v13;
  id v14;
  const char *v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0A10 <= 40 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 40)))
  {
    if (self->_prefLegacyDisabled)
      v3 = "yes";
    else
      v3 = "no";
    v15 = v3;
    v4 = -[SDHotspotAgent _idsLegacyHostDeviceCount](self, "_idsLegacyHostDeviceCount");
    v5 = -[SDHotspotAgent _idsLegacyClientDeviceCount](self, "_idsLegacyClientDeviceCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _idsDeviceArray](self, "_idsDeviceArray"));
    v7 = objc_msgSend(v6, "count");
    if (self->_systemMonitorActivated)
      v8 = "yes";
    else
      v8 = "no";
    if (self->_idsService)
      v9 = "yes";
    else
      v9 = "no";
    if (self->_hotspotManager)
      v10 = "yes";
    else
      v10 = "no";
    if (-[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable"))
      v11 = "yes";
    else
      v11 = "no";
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _legacyBrowserShouldStart]", 40, "Legacy browser state: Pref %s, Hosts %ld, Clients %ld, Total %ld, SysMon %s, IDS %s, HS %s, ManateeAvailable %s", v15, v4, v5, v7, v8, v9, v10, v11);

  }
  if (!self->_systemMonitorActivated || !self->_idsService || !self->_hotspotManager || self->_prefLegacyDisabled)
    return 0;
  if (-[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable")
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotAgent _idsDeviceArray](self, "_idsDeviceArray")),
        v14 = objc_msgSend(v13, "count"),
        v13,
        !v14))
  {
    if (-[SDHotspotAgent _idsLegacyHostDeviceCount](self, "_idsLegacyHostDeviceCount") <= 0)
      return -[SDHotspotAgent _idsLegacyClientDeviceCount](self, "_idsLegacyClientDeviceCount") > 0;
  }
  return 1;
}

- (BOOL)_legacyBrowserShouldBrowse
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0A10 <= 40 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 40)))
  {
    v3 = "yes";
    if (self->_prefLegacyDisabled)
      v4 = "yes";
    else
      v4 = "no";
    if (self->_browserActive)
      v5 = "yes";
    else
      v5 = "no";
    if (self->_browserClientsInactive)
      v6 = "no";
    else
      v6 = "yes";
    if (!-[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable"))
      v3 = "no";
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _legacyBrowserShouldBrowse]", 40, "Legacy browser should browse: Pref %s, Active %s, Client %s, ManateeAvailable %s, Hosts %ld", v4, v5, v6, v3, -[SDHotspotAgent _idsLegacyHostDeviceCount](self, "_idsLegacyHostDeviceCount"));
  }
  if (self->_prefLegacyDisabled || !self->_browserActive || self->_browserClientsInactive)
    return 0;
  if (-[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable"))
    return -[SDHotspotAgent _idsLegacyHostDeviceCount](self, "_idsLegacyHostDeviceCount") != 0;
  return 1;
}

- (BOOL)_legacyBrowserShouldScan
{
  const char *v3;
  const char *v4;
  const char *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0A10 <= 40 && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 40)))
  {
    v3 = "yes";
    if (self->_prefLegacyDisabled)
      v4 = "yes";
    else
      v4 = "no";
    if (-[SDHotspotManager maxConnectionsReached](self->_hotspotManager, "maxConnectionsReached"))
      v5 = "yes";
    else
      v5 = "no";
    if (!-[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable"))
      v3 = "no";
    LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _legacyBrowserShouldScan]", 40, "Legacy browser should scan: Pref %s, Max Cnx %s, ManateeAvailable %s, Clients %ld", v4, v5, v3, -[SDHotspotAgent _idsLegacyClientDeviceCount](self, "_idsLegacyClientDeviceCount"));
  }
  if (self->_prefLegacyDisabled
    || -[SDHotspotManager maxConnectionsReached](self->_hotspotManager, "maxConnectionsReached"))
  {
    return 0;
  }
  if (-[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable"))
    return -[SDHotspotAgent _idsLegacyClientDeviceCount](self, "_idsLegacyClientDeviceCount") > 0;
  return 1;
}

- (void)_legacyBrowswerUpdateD2DState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_hotspotBrowser)
    -[SDHotspotBrowser setD2dEncryptionAvailable:](self->_hotspotBrowser, "setD2dEncryptionAvailable:", -[SDHotspotAgent _sysMonitorD2DEncryptionIsAvailable](self, "_sysMonitorD2DEncryptionIsAvailable"));
}

- (LogCategory)_logCategoryCreateWithLabel:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  NSObject *dispatchQueue;
  id v6;
  id v7;
  id v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  dispatchQueue = self->_dispatchQueue;
  v6 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%x"), v6, v4);

  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "UTF8String");

  return (LogCategory *)LogCategoryCreateEx("com.apple.sharing", v9, 10, 512, 0, 0);
}

- (void)disableTethering
{
  -[SDHotspotManager disableMISImmediately](self->_hotspotManager, "disableMISImmediately");
}

- (BOOL)isTetheringInUse
{
  return -[SDHotspotManager isTetheringInUse](self->_hotspotManager, "isTetheringInUse");
}

- (NSString)hotspotName
{
  return -[SDHotspotManager hotspotName](self->_hotspotManager, "hotspotName");
}

- (NSString)hotspotPassword
{
  return -[SDHotspotManager hotspotPassword](self->_hotspotManager, "hotspotPassword");
}

- (BOOL)p2pAllowed
{
  return -[SDHotspotManager isP2PAllowed](self->_hotspotManager, "isP2PAllowed");
}

- (void)_sysMonitorEnsureStarted
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_systemMonitor)
  {
    v3 = objc_opt_new(CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100075B50;
    v9[3] = &unk_1007146D8;
    v9[4] = self;
    -[CUSystemMonitor setFamilyUpdatedHandler:](self->_systemMonitor, "setFamilyUpdatedHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100075BCC;
    v8[3] = &unk_1007146D8;
    v8[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100075C50;
    v7[3] = &unk_1007146D8;
    v7[4] = self;
    -[CUSystemMonitor setManateeChangedHandler:](self->_systemMonitor, "setManateeChangedHandler:", v7);
    v5 = self->_systemMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100075CC0;
    v6[3] = &unk_1007146D8;
    v6[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_sysMonitorEnsureStopped
{
  CUSystemMonitor *systemMonitor;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

}

- (int64_t)_sysMonitorFamilyCount
{
  int64_t result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  result = self->_familyCount;
  if (result < 0)
  {
    self->_familyCount = 0;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor familyMembers](self->_systemMonitor, "familyMembers", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "isMe") & 1) == 0)
            ++self->_familyCount;
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    return self->_familyCount;
  }
  return result;
}

- (id)_sysMonitorFamilyMemberForAltDSID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor familyMembers](self->_systemMonitor, "familyMembers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v11, "isMe") & 1) == 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "altDSID"));
          if (v12 && objc_msgSend(v4, "isEqualToString:", v12))
          {
            v13 = v11;

            v8 = v13;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_sysMonitorFamilyMemberForAppleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor familyMembers](self->_systemMonitor, "familyMembers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v11, "isMe") & 1) == 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appleID"));
          if (v12 && objc_msgSend(v4, "isEqualToString:", v12))
          {
            v13 = v11;

            v8 = v13;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_sysMonitorD2DEncryptionIsAvailable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return -[CUSystemMonitor manateeAvailable](self->_systemMonitor, "manateeAvailable");
}

- (void)_userAlertForMember:(id)a3 logCategory:(LogCategory *)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v8 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstName"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "altDSID"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_userAlerts, "objectForKeyedSubscript:", v10));
      if (v11)
      {
        if (a4->var0 <= 50 && (a4->var0 != -1 || _LogCategory_Initialize(a4, 50)))
          LogPrintF(a4, "-[SDHotspotAgent _userAlertForMember:logCategory:completion:]", 50, "Dismissing existing alert for %@", v9);
        objc_msgSend(v11, "invalidate");
        -[NSMutableDictionary removeObjectForKey:](self->_userAlerts, "removeObjectForKey:", v10);
      }
      -[SDHotspotAgent _postUserAlertForName:altDSID:logCategory:completion:](self, "_postUserAlertForName:altDSID:logCategory:completion:", v9, v10, a4, v8);
    }
    else
    {
      if (a4->var0 <= 90 && (a4->var0 != -1 || _LogCategory_Initialize(a4, 90)))
        LogPrintF(a4, "-[SDHotspotAgent _userAlertForMember:logCategory:completion:]", 90, "### Family member missing altDSID %@", v14);
      v13 = NSErrorWithOSStatusF(4294960535, "Family member missing altDSID.");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v8[2](v8, v11);
    }

  }
  else
  {
    if (a4->var0 <= 90 && (a4->var0 != -1 || _LogCategory_Initialize(a4, 90)))
      LogPrintF(a4, "-[SDHotspotAgent _userAlertForMember:logCategory:completion:]", 90, "### Family member missing first name %@", v14);
    v12 = NSErrorWithOSStatusF(4294960552, "Family member missing first name.");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v8[2](v8, v10);
  }

}

- (void)_postUserAlertForName:(id)a3 altDSID:(id)a4 logCategory:(LogCategory *)a5 completion:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  SFUserAlert *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  NSMutableDictionary *userAlerts;
  NSMutableDictionary *v37;
  NSMutableDictionary *v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  SDHotspotAgent *v44;
  id v45;
  id v46;
  LogCategory *v47;

  v10 = a3;
  v40 = a4;
  v39 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Sharing")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLForResource:withExtension:", CFSTR("Assets"), CFSTR("car")));

  if (!v12 && a5->var0 <= 90 && (a5->var0 != -1 || _LogCategory_Initialize(a5, 90)))
    LogPrintF(a5, "-[SDHotspotAgent _postUserAlertForName:altDSID:logCategory:completion:]", 90, "### Missing assets catalog");
  v14 = SFLocalizedStringForKey(CFSTR("FAMILY_HOTSPOT_LOCK_SCREEN_TITLE"), v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v17 = SFLocalizedStringForKey(CFSTR("FAMILY_HOTSPOT_LOCK_SCREEN_MESSAGE"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v10));

  v21 = SFLocalizedStringForKey(CFSTR("FAMILY_HOTSPOT_TITLE"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v10));

  v24 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCFUserNotificationAlertTopMostKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBUserNotificationDismissOnLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationDontDismissOnUnlock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", &off_10074B388, SBUserNotificationSystemSoundIDKey);
  v41 = (void *)v15;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v15, SBUserNotificationLockScreenAlertHeaderKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v19, SBUserNotificationLockScreenAlertMessageKey);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v25, SBUserNotificationIconImageAssetCatalogPathKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", CFSTR("InstantHotSpot"), SBUserNotificationIconImageAssetCatalogImageKey);
  v26 = objc_opt_new(SFUserAlert);
  -[SFUserAlert setDispatchQueue:](v26, "setDispatchQueue:", self->_dispatchQueue);
  -[SFUserAlert setTitle:](v26, "setTitle:", v23);
  v28 = SFLocalizedStringForKey(CFSTR("FAMILY_HOTSPOT_DEFAULT_BUTTON"), v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  -[SFUserAlert setDefaultButtonTitle:](v26, "setDefaultButtonTitle:", v29);

  v31 = SFLocalizedStringForKey(CFSTR("FAMILY_HOTSPOT_ALTERNATE_BUTTON"), v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  -[SFUserAlert setAlternateButtonTitle:](v26, "setAlternateButtonTitle:", v32);

  -[SFUserAlert setTimeout:](v26, "setTimeout:", 30.0);
  -[SFUserAlert setAdditionalInfo:](v26, "setAdditionalInfo:", v24);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000767AC;
  v42[3] = &unk_100715A98;
  v47 = a5;
  v33 = v10;
  v43 = v33;
  v34 = v39;
  v46 = v34;
  v44 = self;
  v35 = v40;
  v45 = v35;
  -[SFUserAlert setResponseHandler:](v26, "setResponseHandler:", v42);
  if (a5->var0 <= 50 && (a5->var0 != -1 || _LogCategory_Initialize(a5, 50)))
    LogPrintF(a5, "-[SDHotspotAgent _postUserAlertForName:altDSID:logCategory:completion:]", 50, "Presenting Personal Hotspot alert for \"%@\", v33);
  -[SFUserAlert present](v26, "present");
  userAlerts = self->_userAlerts;
  if (!userAlerts)
  {
    v37 = objc_opt_new(NSMutableDictionary);
    v38 = self->_userAlerts;
    self->_userAlerts = v37;

    userAlerts = self->_userAlerts;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](userAlerts, "setObject:forKeyedSubscript:", v26, v35);

}

- (void)testNotification
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076914;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_updateAdvertisementSuppression:(BOOL)a3
{
  int v3;
  int suppressAdvertisement;
  const char *v6;
  const char *v7;

  v3 = a3;
  if ((GestaltGetDeviceClass(self, a2) & 0xFFFFFFFD) == 1)
  {
    suppressAdvertisement = self->_suppressAdvertisement;
    if (suppressAdvertisement != v3)
    {
      if (dword_1007B0A10 <= 30)
      {
        if (dword_1007B0A10 != -1)
        {
LABEL_6:
          v6 = "yes";
          if (suppressAdvertisement)
            v7 = "yes";
          else
            v7 = "no";
          if (!v3)
            v6 = "no";
          LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _updateAdvertisementSuppression:]", 30, "Suppress advertisement changed: %s -> %s\n", v7, v6);
          goto LABEL_13;
        }
        if (_LogCategory_Initialize(&dword_1007B0A10, 30))
        {
          suppressAdvertisement = self->_suppressAdvertisement;
          goto LABEL_6;
        }
      }
LABEL_13:
      self->_suppressAdvertisement = v3;
      -[SDHotspotAgent _update](self, "_update");
    }
  }
}

- (void)_registerForWombatActivityNotifications
{
  int *p_wombatActivityReadyToken;
  NSObject *dispatchQueue;
  int wombatActivityReadyToken;
  unsigned int wombatActivityState;
  const char *v7;
  int v8;
  _QWORD handler[5];
  uint64_t state64;

  if (self->_wombatActivityReadyToken == -1)
  {
    p_wombatActivityReadyToken = &self->_wombatActivityReadyToken;
    if (dword_1007B0A10 <= 20
      && (dword_1007B0A10 != -1 || _LogCategory_Initialize(&dword_1007B0A10, 20)))
    {
      LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _registerForWombatActivityNotifications]", 20, "Registering for wombat activity state notifications\n");
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100076BE0;
    handler[3] = &unk_100714EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.wombat-activity", p_wombatActivityReadyToken, dispatchQueue, handler);
    wombatActivityReadyToken = self->_wombatActivityReadyToken;
    state64 = 0;
    notify_get_state(wombatActivityReadyToken, &state64);
    wombatActivityState = state64;
    self->_wombatActivityState = state64;
    if (dword_1007B0A10 <= 30)
    {
      if (dword_1007B0A10 != -1
        || (v8 = _LogCategory_Initialize(&dword_1007B0A10, 30), wombatActivityState = self->_wombatActivityState, v8))
      {
        if (wombatActivityState > 5)
          v7 = "?";
        else
          v7 = (&off_100715B58)[wombatActivityState];
        LogPrintF(&dword_1007B0A10, "-[SDHotspotAgent _registerForWombatActivityNotifications]", 30, "RPWombatActivityState initialized to: %s (0x%x)\n", v7, wombatActivityState);
        wombatActivityState = self->_wombatActivityState;
      }
    }
    self->_suppressAdvertisement = wombatActivityState == 1;
  }
}

- (void)_unregisterWombatActivityNotifications
{
  int wombatActivityReadyToken;

  wombatActivityReadyToken = self->_wombatActivityReadyToken;
  if (wombatActivityReadyToken != -1)
  {
    notify_cancel(wombatActivityReadyToken);
    self->_wombatActivityReadyToken = -1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAlerts, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_prefNetworkTypeOverride, 0);
  objc_storeStrong((id *)&self->_prefFamilyEnabledOverride, 0);
  objc_storeStrong((id *)&self->_hotspotManager, 0);
  objc_storeStrong((id *)&self->_hotspotDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_hotspotBrowser, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_idsDeviceBTDictionary, 0);
  objc_storeStrong((id *)&self->_idsDeviceArray, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_devicesLegacy, 0);
  objc_storeStrong((id *)&self->_devicesCombined, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_companionLinkReceiver, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_clientProxyMap, 0);
  objc_storeStrong((id *)&self->_browserBundleIDs, 0);
  objc_storeStrong((id *)&self->_browserAppMonitor, 0);
  objc_storeStrong((id *)&self->_advertisementTimer, 0);
}

@end
