@implementation SDAutoFillAgent

- (SDAutoFillAgent)init
{
  SDAutoFillAgent *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDAutoFillAgent;
  v2 = -[SDAutoFillAgent init](&v7, "init");
  if (v2)
  {
    v3 = CUMainQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SDAutoFillAgent _commonEnsureStopped](self, "_commonEnsureStopped");
  v3.receiver = self;
  v3.super_class = (Class)SDAutoFillAgent;
  -[SDAutoFillAgent dealloc](&v3, "dealloc");
}

- (NSString)description
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  SFDeviceDiscovery *deviceDiscovery;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  void *v22;
  void *v23;
  SFBLEScanner *proximityDiscovery;
  NSMutableDictionary *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *k;
  void *v30;
  SFRemoteAutoFillService *requestingService;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("-- SDAutoFillAgent --\n"));
  v4 = "enabled";
  if (self->_prefGrantingEnabled)
    v5 = "enabled";
  else
    v5 = "disabled";
  if (self->_prefRequestingEnabled)
    v6 = "enabled";
  else
    v6 = "disabled";
  if (!self->_scanningEnabled)
    v4 = "disabled";
  objc_msgSend(v3, "appendFormat:", CFSTR("Granting: %s, Requesting: %s, Scanning: %s\n"), v5, v6, v4);
  if (self->_deviceDiscovery)
    deviceDiscovery = self->_deviceDiscovery;
  else
    deviceDiscovery = (SFDeviceDiscovery *)CFSTR("off");
  objc_msgSend(v3, "appendFormat:", CFSTR("Device Discovery: %@, %ld devices\n"), deviceDiscovery, -[NSMutableDictionary count](self->_devices, "count"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = self->_devices;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v13));
        objc_msgSend(v3, "appendFormat:", CFSTR("    %@"), v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v13));
        if (v15)
          objc_msgSend(v3, "appendString:", CFSTR(", TRIG"));
        objc_msgSend(v3, "appendString:", CFSTR("\n"));
      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v10);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = self->_triggeredDevices;
  v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v21));

        if (!v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v21));
          objc_msgSend(v3, "appendFormat:", CFSTR("    Orphaned triggered device: %@"), v23);

        }
      }
      v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v18);
  }

  if (self->_proximityDiscovery)
    proximityDiscovery = self->_proximityDiscovery;
  else
    proximityDiscovery = (SFBLEScanner *)CFSTR("off");
  objc_msgSend(v3, "appendFormat:", CFSTR("Proximity discovery: %@, %ld devices\n"), proximityDiscovery, -[NSMutableDictionary count](self->_proximityDevices, "count"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = self->_proximityDevices;
  v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)k)));
        objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), v30);

      }
      v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v27);
  }

  requestingService = self->_requestingService;
  if (!requestingService)
    requestingService = (SFRemoteAutoFillService *)CFSTR("off");
  objc_msgSend(v3, "appendFormat:", CFSTR("Requesting service: %@\n"), requestingService);
  return (NSString *)v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009DBE0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _activate]", 30, "Activate\n");
  -[SDAutoFillAgent prefsChanged](self, "prefsChanged");
  -[SDAutoFillAgent _ensureKeychainCleaned:](self, "_ensureKeychainCleaned:", 0);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009DCC4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _invalidate]", 30, "Invalidate\n");
  -[SDAutoFillAgent _commonEnsureStopped](self, "_commonEnsureStopped");
  -[SDAutoFillAgent _discoveryEnsureStopped](self, "_discoveryEnsureStopped");
  -[SDAutoFillAgent _proximityEnsureStopped](self, "_proximityEnsureStopped");
  -[SDAutoFillAgent _rtiEnsureStopped](self, "_rtiEnsureStopped");
  -[SDAutoFillAgent _serviceEnsureStopped](self, "_serviceEnsureStopped");
  -[SDAutoFillAgent _siriRemoteMonitorEnsureStopped](self, "_siriRemoteMonitorEnsureStopped");
  -[SDAutoFillAgent _deactivateUIDelayTimer](self, "_deactivateUIDelayTimer");
}

- (void)prefsChanged
{
  uint64_t Int64;
  uint64_t v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  BOOL v9;
  _BOOL4 v10;
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
  BOOL v29;
  _BOOL4 v30;
  const char *v31;
  const char *v32;
  _BOOL4 prefGrantingEnabled;
  const char *v34;
  const char *v35;
  int v36;

  v36 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("rafGrantingEnabled"), &v36);
  v5 = Int64 != 0;
  if (v36)
    v5 = SFDeviceClassCodeGet(Int64, v4) == 1;
  if (self->_prefGrantingEnabled != v5)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      v6 = "yes";
      if (v5)
        v7 = "no";
      else
        v7 = "yes";
      if (!v5)
        v6 = "no";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent prefsChanged]", 30, "Enabled: %s -> %s\n", v7, v6);
    }
    self->_prefGrantingEnabled = v5;
    if (!v5
      && dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent prefsChanged]", 30, "### Granting disabled via default\n");
    }
  }
  v8 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("rafRateLimitDisabled"), &v36);
  if (v36)
    v9 = 1;
  else
    v9 = v8 == 0;
  v10 = !v9;
  if (self->_prefRateLimitDisabled != v10)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      v11 = "yes";
      if (v10)
        v12 = "no";
      else
        v12 = "yes";
      if (!v10)
        v11 = "no";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent prefsChanged]", 30, "Rate limiting disabled: %s -> %s\n", v12, v11);
    }
    self->_prefRateLimitDisabled = v10;
  }
  v13 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("rafRequestingEnabled"), &v36);
  if (v36)
    v14 = 1;
  else
    v14 = v13 == 0;
  v15 = !v14;
  if (self->_prefRequestingEnabled != v15)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      v16 = "yes";
      if (v15)
        v17 = "no";
      else
        v17 = "yes";
      if (!v15)
        v16 = "no";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent prefsChanged]", 30, "Requesting enabled: %s -> %s\n", v17, v16);
    }
    self->_prefRequestingEnabled = v15;
  }
  v18 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("rafRequiresProx"), &v36);
  if (v36)
    v19 = 1;
  else
    v19 = v18 == 0;
  v20 = !v19;
  if (self->_prefRequiresProx != v20)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      v21 = "yes";
      if (v20)
        v22 = "no";
      else
        v22 = "yes";
      if (!v20)
        v21 = "no";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent prefsChanged]", 30, "Requires prox: %s -> %s\n", v22, v21);
    }
    self->_prefRequiresProx = v20;
  }
  v23 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("rafAllowPairedTV"), &v36);
  if (v36)
    v24 = 0;
  else
    v24 = v23 == 0;
  v25 = !v24;
  if (self->_prefPairedTVAllowed != v25)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      v26 = "yes";
      if (v25)
        v27 = "no";
      else
        v27 = "yes";
      if (!v25)
        v26 = "no";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent prefsChanged]", 30, "Paired TVs allowed: %s -> %s\n", v27, v26);
    }
    self->_prefPairedTVAllowed = v25;
  }
  v28 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("saClientEnabled"), &v36);
  if (v36)
    v29 = 1;
  else
    v29 = v28 == 0;
  v30 = !v29;
  if (self->_proximityEnabled != v30)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      v31 = "yes";
      if (v30)
        v32 = "no";
      else
        v32 = "yes";
      if (!v30)
        v31 = "no";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent prefsChanged]", 30, "Proximity monitoring enabled: %s -> %s\n", v32, v31);
    }
    self->_proximityEnabled = v30;
  }
  if (self->_remoteMonitoringEnabled)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent prefsChanged]", 30, "Siri remote monitoring enabled: %s -> %s\n", "yes", "no");
    }
    self->_remoteMonitoringEnabled = 0;
  }
  prefGrantingEnabled = self->_prefGrantingEnabled;
  if (prefGrantingEnabled != self->_scanningEnabled)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      v34 = "no";
      if (prefGrantingEnabled)
        v35 = "no";
      else
        v35 = "yes";
      if (prefGrantingEnabled)
        v34 = "yes";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent prefsChanged]", 30, "Scanning enabled: %s -> %s\n", v35, v34);
    }
    self->_scanningEnabled = prefGrantingEnabled;
  }
  -[SDAutoFillAgent _update](self, "_update");
}

- (void)setPreventNotifications:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009E32C;
  v4[3] = &unk_100715BB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_update
{
  _BOOL4 v3;
  _BOOL4 v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_prefGrantingEnabled || self->_prefRequestingEnabled || self->_scanningEnabled)
    -[SDAutoFillAgent _commonEnsureStarted](self, "_commonEnsureStarted");
  else
    -[SDAutoFillAgent _commonEnsureStopped](self, "_commonEnsureStopped");
  v3 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn")
    && -[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked")
    && self->_scanningEnabled;
  if (!-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (!v3)
    {
LABEL_15:
      -[SDAutoFillAgent _discoveryEnsureStopped](self, "_discoveryEnsureStopped");
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (v3)
  {
LABEL_14:
    -[SDAutoFillAgent _discoveryEnsureStarted](self, "_discoveryEnsureStarted");
    goto LABEL_16;
  }
  if (!self->_scanningEnabled)
    goto LABEL_15;
LABEL_16:
  -[SDAutoFillAgent _rtiEnsureStopped](self, "_rtiEnsureStopped");
  -[SDAutoFillAgent _bulletinsEnsureStarted](self, "_bulletinsEnsureStarted");
  v4 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn")
    && -[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked")
    && self->_proximityEnabled;
  if (-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (!v4)
    {
      if (self->_proximityEnabled)
        goto LABEL_27;
      goto LABEL_26;
    }
LABEL_25:
    -[SDAutoFillAgent _proximityEnsureStarted](self, "_proximityEnsureStarted");
    goto LABEL_27;
  }
  if (v4)
    goto LABEL_25;
LABEL_26:
  -[SDAutoFillAgent _proximityEnsureStopped](self, "_proximityEnsureStopped");
LABEL_27:
  if (self->_remoteMonitoringEnabled)
    -[SDAutoFillAgent _siriRemoteMonitorEnsureStarted](self, "_siriRemoteMonitorEnsureStarted");
  else
    -[SDAutoFillAgent _siriRemoteMonitorEnsureStopped](self, "_siriRemoteMonitorEnsureStopped");
  if (-[SDAutoFillAgent _serviceShouldRequestAutoFill](self, "_serviceShouldRequestAutoFill"))
    -[SDAutoFillAgent _serviceEnsureStarted](self, "_serviceEnsureStarted");
  else
    -[SDAutoFillAgent _serviceEnsureStopped](self, "_serviceEnsureStopped");
}

- (void)_commonEnsureStarted
{
  SDStatusMonitor *v3;
  SDStatusMonitor *statusMonitor;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_statusMonitor)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_screenStateChanged:", CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_uiLockStatusChanged:", CFSTR("com.apple.sharingd.UILockStatusChanged"), 0);
    v3 = (SDStatusMonitor *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v3;

  }
}

- (void)_commonEnsureStopped
{
  void *v3;
  SDStatusMonitor *statusMonitor;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_statusMonitor)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.UILockStatusChanged"), 0);
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0;

  }
  self->_cleanKeysState = 0;
}

- (void)_ensureKeychainCleaned:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  BOOL v6;
  CFDictionaryRef (__cdecl **v7)(CFErrorRef);
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  _DWORD *v27;
  void *j;
  uint64_t v29;
  uint64_t v30;
  int v31;
  NSString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  NSString *v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  id v46;
  SDAutoFillAgent *v47;
  id v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  CFTypeRef result;
  NSErrorUserInfoKey v59;
  const __CFString *v60;
  CFStringRef v61;
  uint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  NSErrorUserInfoKey v65;
  const __CFString *v66;
  _QWORD v67[5];
  _QWORD v68[5];

  v3 = a3;
  result = 0;
  v5 = objc_alloc_init((Class)NSMutableArray);
  if (self->_cleanKeysState)
    v6 = !v3;
  else
    v6 = 0;
  if (v6)
  {

    goto LABEL_49;
  }
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _ensureKeychainCleaned:]", 30, "Cleaning up old keys");
  self->_cleanKeysState = 1;
  v67[0] = kSecAttrAccessGroup;
  v67[1] = kSecClass;
  v68[0] = CFSTR("com.apple.sharing.safaripasswordsharing");
  v68[1] = kSecClassKey;
  v67[2] = kSecMatchLimit;
  v67[3] = kSecReturnAttributes;
  v68[2] = kSecMatchLimitAll;
  v68[3] = &__kCFBooleanTrue;
  v67[4] = kSecReturnPersistentRef;
  v68[4] = &__kCFBooleanTrue;
  v7 = &CFErrorCopyUserInfo_ptr;
  v8 = SecItemCopyMatching((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 5), &result);
  v47 = self;
  if ((_DWORD)v8)
  {
    if (dword_1007B0F80 > 60
      || (v39 = v8, dword_1007B0F80 == -1) && !_LogCategory_Initialize(&dword_1007B0F80, 60))
    {
      obj = 0;
      v38 = 3;
      goto LABEL_46;
    }
    v40 = (int)v39;
    v65 = NSLocalizedDescriptionKey;
    v41 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v39, 0, 0));
    v42 = objc_claimAutoreleasedReturnValue(v41);
    v23 = (id)v42;
    v43 = CFSTR("?");
    if (v42)
      v43 = (const __CFString *)v42;
    v66 = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v40, v44));
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _ensureKeychainCleaned:]", 60, "### Error fetching keys: %@", v45);

    obj = 0;
    v38 = 3;
    goto LABEL_45;
  }
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)result;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v55;
    v13 = kSecAttrEndDate;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(NSDictionary, v10);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          v17 = v15;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v13));
          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            v20 = objc_msgSend(v19, "compare:", v18);

            v6 = v20 == (id)1;
            v7 = &CFErrorCopyUserInfo_ptr;
            if (v6)
            {
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", kSecValuePersistentRef));
              if (v21)
              {
                v22 = (void *)v21;
                objc_msgSend(v5, "addObject:", v21);
                if (dword_1007B0F80 <= 10
                  && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 10)))
                {
                  LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _ensureKeychainCleaned:]", 10, "Should delete item with end date: %@ and persistent ref: %@", v18, v22);
                }

              }
            }
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v11);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  if (!v24)
  {
    v38 = 4;
LABEL_45:

    self = v47;
    goto LABEL_46;
  }
  v25 = v24;
  v46 = v5;
  v26 = *(_QWORD *)v51;
  v27 = &unk_1007B0000;
  v48 = v23;
  do
  {
    for (j = 0; j != v25; j = (char *)j + 1)
    {
      if (*(_QWORD *)v51 != v26)
        objc_enumerationMutation(v23);
      v29 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
      v61 = kSecValuePersistentRef;
      v62 = v29;
      v30 = SecItemDelete((CFDictionaryRef)objc_msgSend(v7[496], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
      if ((_DWORD)v30)
      {
        v31 = v27[992];
        if (v31 <= 60 && (v31 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
        {
          v59 = NSLocalizedDescriptionKey;
          v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v30, 0, 0));
          v33 = objc_claimAutoreleasedReturnValue(v32);
          v34 = (void *)v33;
          v35 = CFSTR("?");
          if (v33)
            v35 = (const __CFString *)v33;
          v60 = v35;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[496], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, (int)v30, v36));
          LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _ensureKeychainCleaned:]", 60, "### Deleting %@ error: %@", v29, v37);

          v27 = (_DWORD *)&unk_1007B0000;
          v7 = &CFErrorCopyUserInfo_ptr;

          v23 = v48;
        }
      }
    }
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  }
  while (v25);

  self = v47;
  v47->_cleanKeysState = 4;
  if (!(_DWORD)v30)
  {
    v5 = v46;
    goto LABEL_48;
  }
  v38 = 3;
  v5 = v46;
LABEL_46:
  self->_cleanKeysState = v38;
LABEL_48:

LABEL_49:
}

- (void)_postSetupNotificationForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    v10[0] = CFSTR("deviceID");
    v10[1] = CFSTR("needsSetup");
    v11[0] = v5;
    v6 = objc_msgSend(v3, "needsSetup");
    v7 = &__kCFBooleanFalse;
    if (v6)
      v7 = &__kCFBooleanTrue;
    v11[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.sharing.ProxAutoFill"), CFSTR("com.apple.sharingd"), v8, 1);
    if (dword_1007B0F80 <= 50
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 50)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _postSetupNotificationForDevice:]", 50, "Posted %@: %##@\n", CFSTR("com.apple.sharing.ProxAutoFill"), v8);
    }

  }
}

- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *i;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  unsigned int v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  SDAutoFillAgent *v38;
  id v39;
  void (**v40)(id, void *);
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  NSErrorUserInfoKey v47;
  const __CFString *v48;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
  v9 = v8;
  if (v8)
  {
    v38 = self;
    v39 = v8;
    v40 = v7;
    v41 = v6;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queryItems"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (!v11)
    {
      v13 = 0;
      v14 = 0;
      goto LABEL_23;
    }
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v43;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
        if (v18 == CFSTR("bt")
          || (v19 = v18) != 0
          && (v20 = -[__CFString isEqual:](v18, "isEqual:", CFSTR("bt")),
              v19,
              v19,
              v20))
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
          v22 = v13;
          v13 = (void *)v21;
LABEL_15:

          continue;
        }
        v23 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
        if (v23 != CFSTR("pin"))
        {
          v24 = v23;
          if (!v23)
            continue;
          v25 = -[__CFString isEqual:](v23, "isEqual:", CFSTR("pin"));

          if (!v25)
            continue;
        }
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
        v22 = v14;
        v14 = (void *)v26;
        goto LABEL_15;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (!v12)
      {
LABEL_23:

        v27 = objc_alloc_init((Class)NSMutableDictionary);
        v28 = v27;
        if (v14)
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v14, CFSTR("pin"));
        v7 = v40;
        if (v13)
        {
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v13, CFSTR("deviceAddress"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v38->_btDevices, "objectForKeyedSubscript:", v13));
          v30 = v29;
          if (v29)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));

            if (v31)
            {
              if (dword_1007B0F80 <= 10
                && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 10)))
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
                LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent triggerProximityAutoFillDetectedWithURL:completion:]", 10, "Already found device, adding identifier to extra info: %@\n", v32);

              }
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "UUIDString"));
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v37, CFSTR("deviceIdentifier"));

            }
          }
        }
        else
        {
          v30 = 0;
        }
        v6 = v41;
        if (dword_1007B0F80 <= 30
          && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
        {
          LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent triggerProximityAutoFillDetectedWithURL:completion:]", 30, "Triggering AutoFill from URL: %@", v41);
        }
        -[SDAutoFillAgent _uiStart:extraInfo:](v38, "_uiStart:extraInfo:", 0, v28);
        if (v40)
          v40[2](v40, 0);

        v9 = v39;
        goto LABEL_46;
      }
    }
  }
  if (dword_1007B0F80 <= 60 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent triggerProximityAutoFillDetectedWithURL:completion:]", 60, "### Failed to get components from url: %@\n", v6);
  if (v7)
  {
    v47 = NSLocalizedDescriptionKey;
    v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v13 = (void *)v34;
    v35 = CFSTR("?");
    if (v34)
      v35 = (const __CFString *)v34;
    v48 = v35;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6705, v30));
    v7[2](v7, v14);
LABEL_46:

  }
}

- (void)_screenStateChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009F360;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_uiLockStatusChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009F49C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_bulletinsEnsureStarted
{
  SDNotificationManager *v3;
  SDNotificationManager *notificationManager;

  if (!self->_notificationManager)
  {
    v3 = (SDNotificationManager *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](SDNotificationManager, "sharedManager"));
    notificationManager = self->_notificationManager;
    self->_notificationManager = v3;

    -[SDNotificationManager activate](self->_notificationManager, "activate");
  }
}

- (void)_bulletinsEnsureStopped
{
  SDNotificationManager *notificationManager;

  notificationManager = self->_notificationManager;
  self->_notificationManager = 0;

}

- (void)notificiationDidDismiss:(id)a3
{
  id v4;
  SFRemoteAutoFillSession *grantingSession;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    grantingSession = self->_grantingSession;
    if (grantingSession)
    {
      v10 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFRemoteAutoFillSession peerDevice](grantingSession, "peerDevice"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      v9 = objc_msgSend(v8, "isEqual:", v10);

      v4 = v10;
      if (v9)
      {
        -[SDAutoFillAgent _sessionStop:](self, "_sessionStop:", 0);
        v4 = v10;
      }
    }
  }

}

- (void)_discoveryEnsureStarted
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *deviceDiscovery;
  SFDeviceDiscovery *v5;
  RPCompanionLinkClient *v6;
  RPCompanionLinkClient *clinkClient;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_deviceDiscovery)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _discoveryEnsureStarted]", 30, "Discovery start\n");
    }
    v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 13);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", 8208);
    -[SFDeviceDiscovery setDispatchQueue:](self->_deviceDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_deviceDiscovery, "setPurpose:", CFSTR("AutoFill"));
    -[SFDeviceDiscovery setRssiThreshold:](self->_deviceDiscovery, "setRssiThreshold:", -60);
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 20);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009F95C;
    v14[3] = &unk_100714FD8;
    v14[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10009F968;
    v13[3] = &unk_100714FD8;
    v13[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009F974;
    v12[3] = &unk_100715000;
    v12[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v12);
    v5 = self->_deviceDiscovery;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009F980;
    v11[3] = &unk_1007147C8;
    v11[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v11);
    if (!self->_clinkClient)
    {
      if (dword_1007B0F80 <= 30
        && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
      {
        LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _discoveryEnsureStarted]", 30, "CompanionLink start\n");
      }
      v6 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
      clinkClient = self->_clinkClient;
      self->_clinkClient = v6;

      -[RPCompanionLinkClient setControlFlags:](self->_clinkClient, "setControlFlags:", (unint64_t)-[RPCompanionLinkClient controlFlags](self->_clinkClient, "controlFlags") | 0x2004);
      -[RPCompanionLinkClient setDispatchQueue:](self->_clinkClient, "setDispatchQueue:", self->_dispatchQueue);
      -[RPCompanionLinkClient setInterruptionHandler:](self->_clinkClient, "setInterruptionHandler:", &stru_1007162D8);
      -[RPCompanionLinkClient setInvalidationHandler:](self->_clinkClient, "setInvalidationHandler:", &stru_1007162F8);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10009FB1C;
      v10[3] = &unk_100714A48;
      v10[4] = self;
      -[RPCompanionLinkClient setDeviceFoundHandler:](self->_clinkClient, "setDeviceFoundHandler:", v10);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10009FB28;
      v9[3] = &unk_100714A48;
      v9[4] = self;
      -[RPCompanionLinkClient setDeviceLostHandler:](self->_clinkClient, "setDeviceLostHandler:", v9);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10009FB34;
      v8[3] = &unk_100714A70;
      v8[4] = self;
      -[RPCompanionLinkClient setDeviceChangedHandler:](self->_clinkClient, "setDeviceChangedHandler:", v8);
      -[RPCompanionLinkClient activateWithCompletion:](self->_clinkClient, "activateWithCompletion:", &stru_100716318);
    }
  }
}

- (void)_discoveryEnsureStopped
{
  SFDeviceDiscovery *deviceDiscovery;
  NSMutableDictionary *btDevices;
  NSMutableDictionary *devices;
  NSMutableDictionary *grantedDevices;
  NSMutableSet *ignoredTVs;
  NSMutableDictionary *triggeredDevices;
  ASCAgentProxy *ascAgentProxy;
  RPCompanionLinkClient *clinkClient;
  RPCompanionLinkClient *v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_deviceDiscovery)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _discoveryEnsureStopped]", 30, "Discovery stop\n");
    }
    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

  }
  -[NSMutableDictionary removeAllObjects](self->_btDevices, "removeAllObjects");
  btDevices = self->_btDevices;
  self->_btDevices = 0;

  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0;

  -[NSMutableDictionary removeAllObjects](self->_grantedDevices, "removeAllObjects");
  grantedDevices = self->_grantedDevices;
  self->_grantedDevices = 0;

  -[NSMutableSet removeAllObjects](self->_ignoredTVs, "removeAllObjects");
  ignoredTVs = self->_ignoredTVs;
  self->_ignoredTVs = 0;

  -[NSMutableDictionary removeAllObjects](self->_triggeredDevices, "removeAllObjects");
  triggeredDevices = self->_triggeredDevices;
  self->_triggeredDevices = 0;

  ascAgentProxy = self->_ascAgentProxy;
  if (ascAgentProxy)
  {
    self->_ascAgentProxy = 0;

  }
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    -[RPCompanionLinkClient invalidate](clinkClient, "invalidate");
    v11 = self->_clinkClient;
    self->_clinkClient = 0;

  }
}

- (void)_deviceChanged:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  NSMutableDictionary *triggeredDevices;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableSet *ignoredTVs;
  NSMutableSet *v14;
  NSMutableSet *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v4 || !self->_deviceDiscovery)
    goto LABEL_30;
  v5 = objc_msgSend(v16, "deviceActionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsBluetoothDeviceIDsForRIServers"));
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if (v5 == 19 && v8 && !self->_prefPairedTVAllowed)
  {
    if ((-[NSMutableSet containsObject:](self->_ignoredTVs, "containsObject:", v4) & 1) == 0)
    {
      if (dword_1007B0F80 <= 10
        && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 10)))
      {
        LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _deviceChanged:]", 10, "Ignoring paired TV\n");
      }
      ignoredTVs = self->_ignoredTVs;
      if (!ignoredTVs)
      {
        v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v15 = self->_ignoredTVs;
        self->_ignoredTVs = v14;

        ignoredTVs = self->_ignoredTVs;
      }
      -[NSMutableSet addObject:](ignoredTVs, "addObject:", v4);
    }
    goto LABEL_30;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v4));
  if (!v9)
  {
    if (!gSDProxCardsSuppressed)
    {
LABEL_14:
      if (!-[SDAutoFillAgent _uiShowing](self, "_uiShowing")
        && (-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C809) == 0
        && objc_msgSend(v16, "needsSetup")
        && v5 == 19)
      {
        triggeredDevices = self->_triggeredDevices;
        if (!triggeredDevices)
        {
          v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v12 = self->_triggeredDevices;
          self->_triggeredDevices = v11;

          triggeredDevices = self->_triggeredDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](triggeredDevices, "setObject:forKeyedSubscript:", v16, v4);
        -[SDAutoFillAgent _uiStartIfEnabled:extraInfo:](self, "_uiStartIfEnabled:extraInfo:", v16, 0);
      }
      goto LABEL_31;
    }
LABEL_30:
    v9 = 0;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "needsSetup") & 1) == 0)
  {
    -[SDAutoFillAgent _deviceStoppedRequesting:](self, "_deviceStoppedRequesting:", v16);
    goto LABEL_31;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggeredDevices, "setObject:forKeyedSubscript:", v16, v4);
  if (v5 != 19)
    -[SDAutoFillAgent _deviceStoppedRequesting:](self, "_deviceStoppedRequesting:", v16);
  if (self->_prefRateLimitDisabled && !gSDProxCardsSuppressed)
    goto LABEL_14;
LABEL_31:
  -[SDAutoFillAgent _update](self, "_update");

}

- (void)_deviceFound:(id)a3
{
  void *v4;
  BOOL v5;
  NSMutableDictionary *devices;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *btDevices;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_deviceDiscovery)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5 && objc_msgSend(v19, "deviceActionType") == 19)
  {
    if (dword_1007B0F80 <= 10
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 10)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _deviceFound:]", 10, "Found device: %@\n", v19);
    }
    devices = self->_devices;
    if (!devices)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v8 = self->_devices;
      self->_devices = v7;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v19, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bleDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advertisementFields"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bdAddr")));

    if (v11)
    {
      v12 = SFHexStringForData(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet symbolCharacterSet](NSCharacterSet, "symbolCharacterSet"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14));

      btDevices = self->_btDevices;
      if (!btDevices)
      {
        v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v18 = self->_btDevices;
        self->_btDevices = v17;

        btDevices = self->_btDevices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](btDevices, "setObject:forKeyedSubscript:", v19, v15);

    }
    -[SDAutoFillAgent _update](self, "_update");
    -[SDAutoFillAgent _deviceChanged:](self, "_deviceChanged:", v19);

  }
}

- (void)_deviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0F80 <= 10 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 10)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _deviceLost:]", 10, "Lost device: %@\n", v12);
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
    -[SDAutoFillAgent _deviceStoppedRequesting:](self, "_deviceStoppedRequesting:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bleDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "advertisementFields"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bdAddr")));

    if (v7)
    {
      v8 = SFHexStringForData(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet symbolCharacterSet](NSCharacterSet, "symbolCharacterSet"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10));

      -[NSMutableDictionary removeObjectForKey:](self->_btDevices, "removeObjectForKey:", v11);
    }
    -[SDAutoFillAgent _update](self, "_update");

  }
}

- (void)_deviceStoppedRequesting:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _deviceStoppedRequesting:]", 30, "Device stopped requesting %@", v6);
  -[SDAutoFillAgent _uiStop:](self, "_uiStop:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_grantedDevices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      if (dword_1007B0F80 <= 50
        && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 50)))
      {
        LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _deviceStoppedRequesting:]", 50, "Untriggering %@", v6);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v4);
      -[NSMutableDictionary removeObjectForKey:](self->_grantedDevices, "removeObjectForKey:", v4);
    }
  }

}

- (void)_clientClinkDeviceFound:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B0F80 <= 30
    && ((v6 = v3, dword_1007B0F80 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B0F80, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _clientClinkDeviceFound:]", 30, "Clink Found: %@\n", v4);

  }
  else
  {

  }
}

- (void)_clientClinkDeviceLost:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B0F80 <= 30
    && ((v6 = v3, dword_1007B0F80 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B0F80, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _clientClinkDeviceLost:]", 30, "Clink Lost: %@\n", v4);

  }
  else
  {

  }
}

- (void)_clientClinkDeviceChanged:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B0F80 <= 30
    && ((v6 = v3, dword_1007B0F80 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B0F80, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _clientClinkDeviceChanged:]", 30, "Clink Changed: %@\n", v4);

  }
  else
  {

  }
}

- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaRouteID"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    v22 = v4;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDeviceIdentifier"));
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if ((v14 & 1) != 0)
          goto LABEL_20;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mediaRouteIdentifier"));
        v16 = objc_msgSend(v15, "isEqualToString:", v7);

        if ((v16 & 1) != 0)
          goto LABEL_20;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
        if ((objc_msgSend(v17, "isEqualToString:", v5) & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "model"));
          v19 = objc_msgSend(v18, "isEqualToString:", v23);

          if (v19)
          {
            if (dword_1007B0F80 <= 90
              && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 90)))
            {
              LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _rpCompanionLinkDeviceForSFDevice:]", 90, "### No IDS or route identifier match between %@ and %@ \n", v22, v12);
            }
LABEL_20:
            v20 = v12;
            v4 = v22;
            goto LABEL_21;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v20 = 0;
      v4 = v22;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_21:

  return v20;
}

- (int)helperStart:(id)a3
{
  id v4;
  NSMutableSet *helpers;
  NSMutableSet *v6;
  NSMutableSet *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helperStart:]", 30, "Helper start\n");
  objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v4, "setAgent:", self);
  helpers = self->_helpers;
  if (!helpers)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_helpers;
    self->_helpers = v6;

    helpers = self->_helpers;
  }
  -[NSMutableSet addObject:](helpers, "addObject:", v4);
  objc_msgSend(v4, "activateWithCompletion:", 0);
  -[SDAutoFillAgent _update](self, "_update");

  return 0;
}

- (void)helperStop:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helperStop:]", 30, "Helper stop\n");
  -[NSMutableSet removeObject:](self->_helpers, "removeObject:", v4);
  -[SDAutoFillAgent _sessionStop:](self, "_sessionStop:", 0);
  -[SDAutoFillAgent _update](self, "_update");

}

- (int)helper:(id)a3 didPickUsername:(id)a4 password:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**credentialsHandler)(id, id, id, id);
  void *v15;
  uint64_t v16;
  void *v17;
  NSMutableDictionary *grantedDevices;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:didPickUsername:password:error:]", 30, "Helper: DidPickUsernamePassword");
  if ((-[NSMutableSet containsObject:](self->_helpers, "containsObject:", v10) & 1) == 0
    && dword_1007B0F80 <= 60
    && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:didPickUsername:password:error:]", 60, "### Message from unrecognized helper\n");
  }
  credentialsHandler = (void (**)(id, id, id, id))self->_credentialsHandler;
  if (credentialsHandler)
  {
    credentialsHandler[2](credentialsHandler, v11, v12, v13);
  }
  else if (dword_1007B0F80 <= 60
         && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:didPickUsername:password:error:]", 60, "### Helper passing credential, but no handler?");
  }
  if (!v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SFRemoteAutoFillSession peerDevice](self->_grantingSession, "peerDevice"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v17 = (void *)v16;
    if (v15 && v16)
    {
      if (dword_1007B0F80 <= 30
        && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
      {
        LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:didPickUsername:password:error:]", 30, "Adding %@ to granted devices\n", v17);
      }
      grantedDevices = self->_grantedDevices;
      if (!grantedDevices)
      {
        v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v20 = self->_grantedDevices;
        self->_grantedDevices = v19;

        grantedDevices = self->_grantedDevices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](grantedDevices, "setObject:forKeyedSubscript:", v15, v17);
    }

  }
  return 0;
}

- (int)helper:(id)a3 tryPIN:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:tryPIN:]", 30, "Helper: TryPIN %@", v7);
  if ((-[NSMutableSet containsObject:](self->_helpers, "containsObject:", v6) & 1) == 0
    && dword_1007B0F80 <= 60
    && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:tryPIN:]", 60, "### Message from unrecognized helper\n");
  }
  -[SFRemoteAutoFillSession tryPIN:](self->_grantingSession, "tryPIN:", v7);

  return 0;
}

- (int)helper:(id)a3 userNotificationDidActivate:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:userNotificationDidActivate:]", 30, "Helper: NotificationDidActivate");
  if ((-[NSMutableSet containsObject:](self->_helpers, "containsObject:", v6) & 1) == 0
    && dword_1007B0F80 <= 60
    && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:userNotificationDidActivate:]", 60, "### Message from unrecognized helper\n");
  }
  -[SDAutoFillAgent _sessionStart:](self, "_sessionStart:", v7);

  return 0;
}

- (int)helper:(id)a3 userNotificationDidDismiss:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:userNotificationDidDismiss:]", 30, "Helper: NotificationDidDismiss");
  if ((-[NSMutableSet containsObject:](self->_helpers, "containsObject:", v6) & 1) == 0
    && dword_1007B0F80 <= 60
    && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent helper:userNotificationDidDismiss:]", 60, "### Message from unrecognized helper\n");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  -[SDAutoFillAgent notificiationDidDismiss:](self, "notificiationDidDismiss:", v8);

  return 0;
}

- (void)_helpersClientPairingSucceeded:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
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

  v4 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_helpers;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "clientPairingSucceeded:completion:") & 1) != 0)
          objc_msgSend(v12, "clientPairingSucceeded:completion:", v4, v6, (_QWORD)v13);
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_helpersClientPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_helpers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "clientPromptForPIN:throttleSeconds:") & 1) != 0)
          objc_msgSend(v11, "clientPromptForPIN:throttleSeconds:", v5, v4, (_QWORD)v12);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_proximityEnsureStarted
{
  SFBLEScanner *v3;
  SFBLEScanner *proximityDiscovery;
  SDProximityController *v5;
  SDProximityController *proximityController;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_proximityDiscovery)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _proximityEnsureStarted]", 30, "Proximity discovery start\n");
    }
    v3 = (SFBLEScanner *)objc_msgSend(objc_alloc((Class)SFBLEScanner), "initWithType:", 7);
    proximityDiscovery = self->_proximityDiscovery;
    self->_proximityDiscovery = v3;

    -[SFBLEScanner setChangeFlags:](self->_proximityDiscovery, "setChangeFlags:", 13);
    -[SFBLEScanner setDispatchQueue:](self->_proximityDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFBLEScanner setRssiThreshold:](self->_proximityDiscovery, "setRssiThreshold:", -60);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A12AC;
    v9[3] = &unk_100715048;
    v9[4] = self;
    -[SFBLEScanner setDeviceFoundHandler:](self->_proximityDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A12B8;
    v8[3] = &unk_100715048;
    v8[4] = self;
    -[SFBLEScanner setDeviceLostHandler:](self->_proximityDiscovery, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A12C4;
    v7[3] = &unk_1007150B0;
    v7[4] = self;
    -[SFBLEScanner setDeviceChangedHandler:](self->_proximityDiscovery, "setDeviceChangedHandler:", v7);
    -[SFBLEScanner activateWithCompletion:](self->_proximityDiscovery, "activateWithCompletion:", &stru_100716338);
    if (!self->_proximityController)
    {
      v5 = (SDProximityController *)objc_claimAutoreleasedReturnValue(+[SDProximityController sharedController](SDProximityController, "sharedController"));
      proximityController = self->_proximityController;
      self->_proximityController = v5;

    }
  }
}

- (void)_proximityEnsureStopped
{
  SFBLEScanner *proximityDiscovery;
  NSMutableDictionary *proximityDevices;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityDiscovery)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _proximityEnsureStopped]", 30, "Proximity discovery stop\n");
    }
    -[SFBLEScanner invalidate](self->_proximityDiscovery, "invalidate");
    proximityDiscovery = self->_proximityDiscovery;
    self->_proximityDiscovery = 0;

  }
  -[NSMutableDictionary removeAllObjects](self->_proximityDevices, "removeAllObjects");
  proximityDevices = self->_proximityDevices;
  self->_proximityDevices = 0;

}

- (void)_proximityChanged:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  int v16;
  NSMutableDictionary *proximityDevices;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v4 || !self->_proximityDiscovery)
  {
    v6 = 0;
    v14 = 0;
    v5 = 0;
LABEL_34:
    v7 = 0;
    goto LABEL_31;
  }
  v5 = objc_alloc_init((Class)SFDevice);
  objc_msgSend(v5, "updateWithBLEDevice:", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));
  if (!objc_msgSend(&off_10074FA48, "containsObject:", v6))
  {
    v14 = 0;
    goto LABEL_34;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "proxPairProximityEstimator"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleProximityInfoForType:device:", CFSTR("rafp"), v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SFProximityEstimator proximityEstimatorWithProximityInfo:](SFProximityEstimator, "proximityEstimatorWithProximityInfo:", v9));
    objc_msgSend(v20, "setProxPairProximityEstimator:", v7);

  }
  objc_msgSend(v7, "updateWithSFBLEDevice:", v20);
  v10 = objc_msgSend(v20, "triggered");
  -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityController deviceIdToCurrentPreset](self->_proximityController, "deviceIdToCurrentPreset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v4));
  v13 = objc_msgSend(v12, "isEqual:", &off_10074B568);

  if (v13
    && dword_1007B0F80 <= 50
    && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 50)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _proximityChanged:]", 50, "#ni_estimator autofill triggered");
  }
  if (!_os_feature_enabled_impl("Sharing", "ni_estimator"))
    v13 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_proximityDevices, "objectForKeyedSubscript:", v4));
  if (!v14)
  {
    if (!v13)
    {
      v14 = 0;
      goto LABEL_31;
    }
    v15 = v20;
    if (dword_1007B0F80 <= 30)
    {
      if (dword_1007B0F80 != -1 || (v16 = _LogCategory_Initialize(&dword_1007B0F80, 30), v15 = v20, v16))
      {
        LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _proximityChanged:]", 30, "Proximity remote %@ entered at %d\n", v4, objc_msgSend(v15, "rssiEstimate"));
        v15 = v20;
      }
    }
    proximityDevices = self->_proximityDevices;
    if (!proximityDevices)
    {
      v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v19 = self->_proximityDevices;
      self->_proximityDevices = v18;

      v15 = v20;
      proximityDevices = self->_proximityDevices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](proximityDevices, "setObject:forKeyedSubscript:", v15, v4);
LABEL_30:
    -[SDAutoFillAgent _update](self, "_update");
    goto LABEL_31;
  }
  if ((v13 & 1) == 0)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _proximityChanged:]", 30, "Proximity remote %@ exited at %d\n", v4, objc_msgSend(v20, "rssiEstimate"));
    }
    -[NSMutableDictionary removeObjectForKey:](self->_proximityDevices, "removeObjectForKey:", v4);
    goto LABEL_30;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_proximityDevices, "setObject:forKeyedSubscript:", v20, v4);
LABEL_31:

}

- (void)_proximityFound:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityDiscovery)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    if (dword_1007B0F80 <= 10
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 10)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _proximityFound:]", 10, "Found proximity device: %@\n", v6);
    }
    -[SDAutoFillAgent _proximityChanged:](self, "_proximityChanged:", v6);
  }

}

- (void)_proximityLost:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityDiscovery)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    if (dword_1007B0F80 <= 10
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 10)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _proximityLost:]", 10, "Lost proximity device: %@\n", v6);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_proximityDevices, "removeObjectForKey:", v4);
    -[SDAutoFillAgent _update](self, "_update");
  }

}

- (void)_rtiEnsureStarted
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_rtiActivated)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDSharedRemoteTextInputClient sharedClient](SDSharedRemoteTextInputClient, "sharedClient"));
    objc_msgSend(v3, "addDelegate:", self);

    self->_rtiActivated = 1;
  }
}

- (void)_rtiEnsureStopped
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_rtiActivated)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDSharedRemoteTextInputClient sharedClient](SDSharedRemoteTextInputClient, "sharedClient"));
    objc_msgSend(v3, "removeDelegate:", self);

    self->_rtiActivated = 0;
  }
}

- (void)handleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  int v4;
  _BOOL8 v6;
  const char *v7;
  const char *v8;
  NSData *v9;
  NSData *appIconData;
  NSString *v11;
  NSString *requestingAppLocalizedName;
  NSString *v13;
  NSString *requestingAppUnlocalizedName;
  NSArray *v15;
  NSArray *requestingAssociatedDomains;
  NSString *v17;
  NSString *requestingBundleID;
  id v19;

  v4 = a3;
  v19 = a4;
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent handleInputDidBeginWithFlags:sessionInfo:]", 30, "RTI: input did begin with flags: %d", v4);
  v6 = v4 & 1;
  if (v6 != self->_autoFillContext)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      v7 = "no";
      if (v6)
        v8 = "no";
      else
        v8 = "yes";
      if (v6)
        v7 = "yes";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent handleInputDidBeginWithFlags:sessionInfo:]", 30, "In AutoFill context: %s -> %s", v8, v7);
    }
    v9 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("remoteAppIconData")));
    appIconData = self->_appIconData;
    self->_appIconData = v9;

    self->_autoFillContext = v6;
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("remoteLocalizedAppName")));
    requestingAppLocalizedName = self->_requestingAppLocalizedName;
    self->_requestingAppLocalizedName = v11;

    v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("remoteUnlocalizedAppName")));
    requestingAppUnlocalizedName = self->_requestingAppUnlocalizedName;
    self->_requestingAppUnlocalizedName = v13;

    v15 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("remoteAssociatedDomains")));
    requestingAssociatedDomains = self->_requestingAssociatedDomains;
    self->_requestingAssociatedDomains = v15;

    v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("remoteBundleID")));
    requestingBundleID = self->_requestingBundleID;
    self->_requestingBundleID = v17;

  }
  -[SDAutoFillAgent _update](self, "_update");

}

- (void)handleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  int v4;
  const char *v6;
  NSData *appIconData;
  NSString *requestingBundleID;
  NSString *requestingAppLocalizedName;
  NSString *requestingAppUnlocalizedName;
  NSArray *requestingAssociatedDomains;
  id v12;

  v4 = a3;
  v12 = a4;
  if (dword_1007B0F80 <= 30)
  {
    if (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30))
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent handleInputDidEndWithFlags:sessionInfo:]", 30, "RTI: input did end with flags: %d", v4);
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      if (self->_autoFillContext)
        v6 = "yes";
      else
        v6 = "no";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent handleInputDidEndWithFlags:sessionInfo:]", 30, "In AutoFill context: %s -> %s", v6, "no");
    }
  }
  appIconData = self->_appIconData;
  self->_appIconData = 0;

  self->_autoFillContext = 0;
  requestingBundleID = self->_requestingBundleID;
  self->_requestingBundleID = 0;

  requestingAppLocalizedName = self->_requestingAppLocalizedName;
  self->_requestingAppLocalizedName = 0;

  requestingAppUnlocalizedName = self->_requestingAppUnlocalizedName;
  self->_requestingAppUnlocalizedName = 0;

  requestingAssociatedDomains = self->_requestingAssociatedDomains;
  self->_requestingAssociatedDomains = 0;

  -[SDAutoFillAgent _update](self, "_update");
}

- (void)_siriRemoteMonitorEnsureStarted
{
  self->_siriRemoteMonitorState = 2;
}

- (void)_siriRemoteMonitorEnsureStopped
{
  self->_siriRemoteMonitorState = 0;
}

- (void)_serviceEnsureStarted
{
  if (!self->_requestingService)
  {
    if (dword_1007B0F80 <= 60
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceEnsureStarted]", 60, "### Requesting AutoFill from daemon is not supported on current platform\n");
    }
    self->_requestingServiceState = 2;
  }
}

- (void)_serviceEnsureStopped
{
  SFRemoteAutoFillService *requestingService;

  if (self->_requestingService)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceEnsureStopped]", 30, "Requesting service stop\n");
    }
    -[SDAutoFillAgent _serviceStopRequestingAutoFill](self, "_serviceStopRequestingAutoFill");
    -[SFRemoteAutoFillService invalidate](self->_requestingService, "invalidate");
    requestingService = self->_requestingService;
    self->_requestingService = 0;

    self->_requestingServiceState = 0;
  }
}

- (void)_serviceHandleError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B0F80 <= 60
    && ((v6 = v3, dword_1007B0F80 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B0F80, 60), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceHandleError:]", 60, "### Requesting service error: %@", v4);

  }
  else
  {

  }
}

- (void)_serviceHandleUsername:(id)a3 password:(id)a4 error:(id)a5
{
  unint64_t v7;
  id v8;
  const char *v9;
  const char *v10;
  void *v11;
  unint64_t v12;

  v12 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  v8 = a5;
  if (v8
    && dword_1007B0F80 <= 60
    && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceHandleUsername:password:error:]", 60, "### Received credentials error: %@\n", v8);
  }
  if (v12 | v7)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      v9 = "yes";
      if (v12)
        v10 = "yes";
      else
        v10 = "no";
      if (!v7)
        v9 = "no";
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceHandleUsername:password:error:]", 30, "Received username: %s, password: %s", v10, v9);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDSharedRemoteTextInputClient sharedClient](SDSharedRemoteTextInputClient, "sharedClient"));
    objc_msgSend(v11, "handleUsername:password:", v12, v7);

  }
  else if (dword_1007B0F80 <= 30
         && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceHandleUsername:password:error:]", 30, "Received no credentials to handle");
  }

}

- (BOOL)_serviceShouldRequestAutoFill
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v3, "isPasswordProximityAutoFillRequestingAllowed");

  return self->_testingService;
}

- (void)_serviceStartRequestingAutoFillIfReady
{
  const char *v3;

  if (self->_siriRemoteMonitorState != 4)
  {
    if (dword_1007B0F80 > 30 || dword_1007B0F80 == -1 && !_LogCategory_Initialize(&dword_1007B0F80, 30))
      return;
    v3 = "Siri remote not yet ready for advertising commands\n";
LABEL_14:
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceStartRequestingAutoFillIfReady]", 30, v3);
    return;
  }
  if (self->_requestingServiceState != 4)
  {
    if (dword_1007B0F80 > 30 || dword_1007B0F80 == -1 && !_LogCategory_Initialize(&dword_1007B0F80, 30))
      return;
    v3 = "Requesting service not yet ready for advertising commands\n";
    goto LABEL_14;
  }
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceStartRequestingAutoFillIfReady]", 30, "Start requesting AutoFill\n");
  -[SFRemoteAutoFillService startRequestingAutoFill](self->_requestingService, "startRequestingAutoFill");
  -[SDAutoFillAgent _serviceTimeoutStart](self, "_serviceTimeoutStart");
}

- (void)_serviceStopRequestingAutoFill
{
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceStopRequestingAutoFill]", 30, "Stop requesting AutoFill\n");
  -[SDAutoFillAgent _serviceTimeoutStop](self, "_serviceTimeoutStop");
  -[SFRemoteAutoFillService stopRequestingAutoFill](self->_requestingService, "stopRequestingAutoFill");
}

- (void)_serviceTimeoutStart
{
  OS_dispatch_source *requestingServiceTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD handler[5];

  requestingServiceTimer = self->_requestingServiceTimer;
  if (requestingServiceTimer)
  {
    v4 = requestingServiceTimer;
    dispatch_source_cancel(v4);
    v5 = self->_requestingServiceTimer;
    self->_requestingServiceTimer = 0;

  }
  self->_requestingServiceTimedOut = 0;
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceTimeoutStart]", 30, "Requesting service timeout start\n");
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v7 = self->_requestingServiceTimer;
  self->_requestingServiceTimer = v6;

  v8 = self->_requestingServiceTimer;
  v9 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v10 = self->_requestingServiceTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A2320;
  handler[3] = &unk_1007146D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_requestingServiceTimer);
}

- (void)_serviceTimeoutStop
{
  OS_dispatch_source *requestingServiceTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _serviceTimeoutStop]", 30, "Requesting service timeout stop\n");
  requestingServiceTimer = self->_requestingServiceTimer;
  if (requestingServiceTimer)
  {
    v4 = requestingServiceTimer;
    dispatch_source_cancel(v4);
    v5 = self->_requestingServiceTimer;
    self->_requestingServiceTimer = 0;

  }
  self->_requestingServiceTimedOut = 0;
}

- (void)_sessionStart:(id)a3
{
  id v4;
  id v5;
  SFRemoteAutoFillSession *grantingSession;
  SFRemoteAutoFillSession *v7;
  SFRemoteAutoFillSession *v8;
  NSString *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _sessionStart:]", 30, "Granting session start\n");
    }
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));
    if (!v5)
    {
      v5 = objc_alloc_init((Class)SFDevice);
      objc_msgSend(v5, "setIdentifier:", v4);
    }
    grantingSession = self->_grantingSession;
    if (grantingSession)
      -[SFRemoteAutoFillSession invalidate](grantingSession, "invalidate");
    v7 = (SFRemoteAutoFillSession *)objc_alloc_init((Class)SFRemoteAutoFillSession);
    v8 = self->_grantingSession;
    self->_grantingSession = v7;

    -[SFRemoteAutoFillSession setDispatchQueue:](self->_grantingSession, "setDispatchQueue:", self->_dispatchQueue);
    -[SFRemoteAutoFillSession setPeerDevice:](self->_grantingSession, "setPeerDevice:", v5);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000A276C;
    v18[3] = &unk_1007147C8;
    v18[4] = self;
    -[SFRemoteAutoFillSession setCompletedHandler:](self->_grantingSession, "setCompletedHandler:", v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A2778;
    v16[3] = &unk_100714860;
    v16[4] = self;
    v17 = v4;
    -[SFRemoteAutoFillSession setPairingFinishedHandler:](self->_grantingSession, "setPairingFinishedHandler:", v16);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A288C;
    v15[3] = &unk_100716360;
    v15[4] = self;
    -[SFRemoteAutoFillSession setPromptForPickerHandler:](self->_grantingSession, "setPromptForPickerHandler:", v15);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A29B8;
    v14[3] = &unk_100716388;
    v14[4] = self;
    -[SFRemoteAutoFillSession setPromptForPINHandler:](self->_grantingSession, "setPromptForPINHandler:", v14);
    -[SFRemoteAutoFillSession activate](self->_grantingSession, "activate");
LABEL_11:

    goto LABEL_12;
  }
  if (dword_1007B0F80 <= 60 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
  {
    v19 = NSLocalizedDescriptionKey;
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v5 = (id)v10;
    v11 = CFSTR("?");
    if (v10)
      v11 = (const __CFString *)v10;
    v20 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6705, v12));
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _sessionStart:]", 60, "### Granting session start: %@\n", v13);

    goto LABEL_11;
  }
LABEL_12:

}

- (void)_sessionStop:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  SFRemoteAutoFillSession *grantingSession;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFRemoteAutoFillSession peerDevice](self->_grantingSession, "peerDevice"));
    if (v5 && (objc_msgSend(v4, "code") == (id)-6723 || objc_msgSend(v4, "code") == (id)-71160))
    {
      -[SDAutoFillAgent _uiStop:](self, "_uiStop:", v5);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = self->_helpers;
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "clientDismissUserNotification");
          }
          v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

    }
    if (dword_1007B0F80 <= 60
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 60)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _sessionStop:]", 60, "### Session completed with error: %{error}\n", v4);
    }

  }
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _sessionStop:]", 30, "Granting session stop");
  -[SFRemoteAutoFillSession invalidate](self->_grantingSession, "invalidate");
  grantingSession = self->_grantingSession;
  self->_grantingSession = 0;

}

- (void)_sessionHandlePairingSucceededResponse:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B0F80 <= 30
    && ((v6 = v3, dword_1007B0F80 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B0F80, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _sessionHandlePairingSucceededResponse:]", 30, "Client handled pairing succeeded response: %@\n", v4);

  }
  else
  {

  }
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (dword_1007B0F80 <= 50 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 50)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent proximityDeviceDidTrigger:]", 50, "#ni_estimator autofill delegate triggered for device: %@", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_proximityDevices, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A2D4C;
    block[3] = &unk_100714860;
    block[4] = self;
    v8 = v4;
    dispatch_async(dispatchQueue, block);

  }
}

- (void)testKeychain:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1007B0F80 <= 50 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 50)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent testKeychain:]", 50, "Testing AutoFill keychain (%@)\n", v4);
  -[SDAutoFillAgent _ensureKeychainCleaned:](self, "_ensureKeychainCleaned:", 1);

}

- (void)testRemote:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B0F80 <= 50
    && ((v6 = v3, dword_1007B0F80 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B0F80, 50), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent testRemote:]", 50, "Testing AutoFill Siri Remote (%@) not supported on current platform\n", v4);

  }
  else
  {

  }
}

- (void)testService:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (dword_1007B0F80 <= 50)
  {
    if (dword_1007B0F80 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B0F80, 50), v4 = v7, v5))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent testService:]", 50, "Testing AutoFill Service (%@)\n", v4);
      v4 = v7;
    }
  }
  if ((objc_msgSend(v4, "isEqualToIgnoringCase:", CFSTR("-start")) & 1) != 0)
  {
    v6 = 1;
LABEL_9:
    self->_testingService = v6;
    -[SDAutoFillAgent _update](self, "_update");
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToIgnoringCase:", CFSTR("-stop")))
  {
    v6 = 0;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)testUI:(id)a3
{
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  NSObject *dispatchQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  SDAutoFillAgent *v14;
  id v15;

  v4 = a3;
  if (dword_1007B0F80 <= 50 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 50)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent testUI:]", 50, "Testing AutoFill UI (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  v6 = objc_alloc((Class)NSUUID);
  if (objc_msgSend(v4, "isEqual:", CFSTR("-fail")))
    v7 = CFSTR("00000000-0000-0000-0000-000000000002");
  else
    v7 = CFSTR("00000000-0000-0000-0000-000000000001");
  v8 = objc_msgSend(v6, "initWithUUIDString:", v7);
  objc_msgSend(v5, "setIdentifier:", v8);

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A30D0;
  block[3] = &unk_100715138;
  v13 = v4;
  v14 = self;
  v15 = v5;
  v10 = v5;
  v11 = v4;
  dispatch_async(dispatchQueue, block);

}

- (void)_activateUIDelayTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *uiDelayTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  if (!self->_uiDelayTimer)
  {
    if (dword_1007B0F80 <= 30
      && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    {
      LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _activateUIDelayTimer]", 30, "Activate UI delay timer\n");
    }
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    uiDelayTimer = self->_uiDelayTimer;
    self->_uiDelayTimer = v3;

    v5 = self->_uiDelayTimer;
    v6 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
    v7 = self->_uiDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000A3308;
    handler[3] = &unk_1007146D8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_uiDelayTimer);
  }
}

- (void)_deactivateUIDelayTimer
{
  OS_dispatch_source *uiDelayTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  SFDevice *uiDelayDevice;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _deactivateUIDelayTimer]", 30, "Deactivate UI delay timer\n");
  uiDelayTimer = self->_uiDelayTimer;
  if (uiDelayTimer)
  {
    v4 = uiDelayTimer;
    dispatch_source_cancel(v4);
    v5 = self->_uiDelayTimer;
    self->_uiDelayTimer = 0;

  }
  self->_uiDelayActive = 0;
  uiDelayDevice = self->_uiDelayDevice;
  self->_uiDelayDevice = 0;

}

- (void)passwordPickerStart:(id)a3 bundleID:(id)a4 localizedAppName:(id)a5 unlocalizedAppName:(id)a6 associatedDomains:(id)a7 appIconData:(id)a8 deviceName:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id credentialsHandler;
  id v23;
  ASCAgentProxy *v24;
  ASCAgentProxy *ascAgentProxy;
  ASCAgentProxy *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v15 = a10;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  v21 = objc_retainBlock(v15);
  credentialsHandler = self->_credentialsHandler;
  self->_credentialsHandler = v21;

  v23 = objc_msgSend(objc_alloc((Class)ASCCredentialRequestContext), "initWithRequestTypes:", 1);
  objc_msgSend(v23, "setProxiedAppName:", v19);

  objc_msgSend(v23, "setProxiedAssociatedDomains:", v18);
  objc_msgSend(v23, "setProxiedBundleIdentifier:", v20);

  objc_msgSend(v23, "setProxiedIconData:", v17);
  objc_msgSend(v23, "setProxiedIconScale:", &off_10074B580);
  objc_msgSend(v23, "setProxiedOriginDeviceName:", v16);

  v24 = (ASCAgentProxy *)objc_alloc_init((Class)ASCAgentProxy);
  ascAgentProxy = self->_ascAgentProxy;
  self->_ascAgentProxy = v24;

  v26 = self->_ascAgentProxy;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000A3604;
  v28[3] = &unk_1007163F0;
  v27 = v15;
  v29 = v27;
  -[ASCAgentProxy performAuthorizationRequestsForContext:withCompletionHandler:](v26, "performAuthorizationRequestsForContext:withCompletionHandler:", v23, v28);
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent passwordPickerStart:bundleID:localizedAppName:unlocalizedAppName:associatedDomains:appIconData:deviceName:completion:]", 30, "Starting AutoFill UI");

}

- (void)_uiStartIfEnabled:(id)a3 extraInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000A3838;
  v19 = sub_1000A3848;
  v20 = 0;
  v20 = objc_alloc_init(off_1007B0FF0());
  v8 = (void *)v16[5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A3850;
  v11[3] = &unk_100716418;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v8, "getRemoteAutoFillAvailabilityWithCompletionHandler:", v11);

  _Block_object_dispose(&v15, 8);
}

- (void)_uiStartIfNeeded:(id)a3 extraInfo:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;

  v21 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gSDProxCardsSuppressed
    || self->_preventNotifications
    || -[SDAutoFillAgent _uiShowing](self, "_uiShowing")
    || (-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C809) != 0)
  {
    goto LABEL_36;
  }
  if (objc_msgSend(v21, "deviceClassCode") != 6)
    goto LABEL_15;
  if (self->_prefRequiresProx)
  {
    if (!-[NSMutableDictionary count](self->_proximityDevices, "count"))
    {
      if (dword_1007B0F80 <= 10
        && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 10)))
      {
        LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _uiStartIfNeeded:extraInfo:]", 10, "No proximity devices, un-triggering TV device %@\n", v8);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v8);
      goto LABEL_36;
    }
    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
  v10 = SFDeviceToRPCompanionLinkDevice(v21, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoFillAgent _rpCompanionLinkDeviceForSFDevice:](self, "_rpCompanionLinkDeviceForSFDevice:", v21));
    if (!v11)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "idsBluetoothDeviceIDsForSharing"));
      v20 = objc_msgSend(v19, "containsObject:", v8);

      if ((v20 & 1) == 0)
        goto LABEL_36;
      goto LABEL_15;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeUserAltDSID"));
  v13 = objc_alloc_init(off_1007B0FF8());
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_primaryAppleAccount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aa_altDSID"));
  if ((objc_msgSend(v15, "isEqualToString:", v12) & 1) != 0)
  {

LABEL_15:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager activeTVAutoFillPrompts](self->_notificationManager, "activeTVAutoFillPrompts"));
    v17 = objc_msgSend(v16, "containsObject:", v8);

    if ((v17 & 1) == 0)
    {
      if (self->_uiDelayActive)
      {
        if (dword_1007B0F80 <= 30
          && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
        {
          LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _uiStartIfNeeded:extraInfo:]", 30, "UI delay timer active, deferring notification for %@", v21);
        }
        objc_storeStrong((id *)&self->_uiDelayDevice, a3);
      }
      else
      {
        if (dword_1007B0F80 <= 50
          && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 50)))
        {
          LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _uiStartIfNeeded:extraInfo:]", 50, "Triggering ProximityAutoFill with %@", v21);
        }
        -[SDAutoFillAgent _uiStart:extraInfo:](self, "_uiStart:extraInfo:", v21, v7);
      }
    }
    goto LABEL_36;
  }
  if (dword_1007B0F80 <= 30 && (dword_1007B0F80 != -1 || _LogCategory_Initialize(&dword_1007B0F80, 30)))
    LogPrintF(&dword_1007B0F80, "-[SDAutoFillAgent _uiStartIfNeeded:extraInfo:]", 30, "### Active user profiles do not match \n");

LABEL_36:
}

- (void)_uiStart:(id)a3 extraInfo:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = v6;
  if (v6)
  {
    -[SDNotificationManager tvAutoFillPostIfNeeded:](self->_notificationManager, "tvAutoFillPostIfNeeded:", v6);
    v5 = v6;
  }

}

- (void)_uiStop:(id)a3
{
  id v4;
  SFRemoteAutoFillSession *grantingSession;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;

  v4 = a3;
  grantingSession = self->_grantingSession;
  v14 = v4;
  if (!grantingSession)
  {
LABEL_8:
    -[SDNotificationManager tvAutoFillRemove:](self->_notificationManager, "tvAutoFillRemove:", v14);
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFRemoteAutoFillSession peerDevice](grantingSession, "peerDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  v9 = v7;
  v10 = v8;
  if (v9 != v10)
  {
    v11 = v10;
    if ((v9 == 0) == (v10 != 0))
    {

    }
    else
    {
      v12 = objc_msgSend(v9, "isEqual:", v10);

      v13 = v14;
      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    goto LABEL_8;
  }

LABEL_9:
  v13 = v14;
LABEL_10:

}

- (BOOL)_uiShowing
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager activeTVAutoFillPrompts](self->_notificationManager, "activeTVAutoFillPrompts"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "count") != 0;
  else
    v4 = 0;

  return v4;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)preventNotifications
{
  return self->_preventNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_uiDelayTimer, 0);
  objc_storeStrong((id *)&self->_uiDelayDevice, 0);
  objc_storeStrong((id *)&self->_triggeredDevices, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_requestingServiceTimer, 0);
  objc_storeStrong((id *)&self->_requestingService, 0);
  objc_storeStrong((id *)&self->_requestingBundleID, 0);
  objc_storeStrong((id *)&self->_requestingAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_requestingAppUnlocalizedName, 0);
  objc_storeStrong((id *)&self->_requestingAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_proximityDiscovery, 0);
  objc_storeStrong((id *)&self->_proximityDevices, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_ignoredTVs, 0);
  objc_storeStrong((id *)&self->_helpers, 0);
  objc_storeStrong((id *)&self->_grantedDevices, 0);
  objc_storeStrong((id *)&self->_grantingSession, 0);
  objc_storeStrong((id *)&self->_btDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong(&self->_credentialsHandler, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong((id *)&self->_ascAgentProxy, 0);
  objc_storeStrong((id *)&self->_appIconData, 0);
}

@end
