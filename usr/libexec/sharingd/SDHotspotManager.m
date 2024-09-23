@implementation SDHotspotManager

- (SDHotspotManager)initWithDelegate:(id)a3
{
  id v4;
  SDHotspotManager *v5;
  SDHotspotManager *v6;
  NSTimer *networkTimer;
  id hostAPNetwork;
  NSMutableArray *v9;
  NSMutableArray *handlers;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  SDMISManager *v13;
  SDMISManager *misManager;
  NSObject *v15;
  _QWORD block[4];
  SDHotspotManager *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SDHotspotManager;
  v5 = -[SDHotspotManager init](&v19, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_startedHostAP = 0;
    networkTimer = v6->_networkTimer;
    v6->_networkTimer = 0;

    hostAPNetwork = v6->_hostAPNetwork;
    v6->_hostAPNetwork = 0;

    v6->_flippedHotspotSwitch = 0;
    v9 = objc_opt_new(NSMutableArray);
    handlers = v6->_handlers;
    v6->_handlers = v9;

    v11 = dispatch_queue_create("com.apple.SDHotspotManager-work", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(SDMISManager);
    misManager = v6->_misManager;
    v6->_misManager = v13;

    -[SDMISManager setDelegate:](v6->_misManager, "setDelegate:", v6);
    -[SDHotspotManager addObservers](v6, "addObservers");
    v15 = v6->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001738F4;
    block[3] = &unk_1007146D8;
    v18 = v6;
    dispatch_async(v15, block);

  }
  return v6;
}

- (void)dealloc
{
  SDMISManager *misManager;
  objc_super v4;

  -[SDHotspotManager removeObservers](self, "removeObservers");
  misManager = self->_misManager;
  self->_misManager = 0;

  v4.receiver = self;
  v4.super_class = (Class)SDHotspotManager;
  -[SDHotspotManager dealloc](&v4, "dealloc");
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "debugInfoRequest:", CFSTR("com.apple.sharingd.DebugInfoRequested"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "firstUnlockStateChanged:", CFSTR("com.apple.sharingd.KeyBagFirstUnlock"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "simStateChanged:", CFSTR("com.apple.sharingd.SIMStateChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "personalHotspotAllowedChanged:", CFSTR("com.apple.sharingd.PersonalHotspotAllowedChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleHostAPChanged:", CFSTR("com.apple.sharingd.HotspotHostAPStateChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)debugInfoRequest:(id)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  NSMutableArray *v25;

  v25 = objc_opt_new(NSMutableArray);
  if (-[SDHotspotManager netRBTetheringSupported](self, "netRBTetheringSupported"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NetRB Tethering Supported:%@"), v4));
  -[NSMutableArray addObject:](v25, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v6, "deviceWasUnlockedOnce"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("First Unlocked:%@"), v7));
  -[NSMutableArray addObject:](v25, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v10 = objc_msgSend(v9, "wifiManager");

  if (v10)
  {
    if (WiFiManagerClientIsTetheringSupported(v10))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wifi Tethering Supported:%@"), v11));
    -[NSMutableArray addObject:](v25, "addObject:", v12);

    if (WiFiManagerClientGetMISDiscoveryState(v10))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wifi Discovery State:%@"), v13));
    -[NSMutableArray addObject:](v25, "addObject:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hostAPNetwork](self, "hostAPNetwork"));
  if (v15)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HostAp Network Up:%@"), v16));
  -[NSMutableArray addObject:](v25, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connected Hosts:%d"), -[SDMISManager connectedHosts](self->_misManager, "connectedHosts")));
  -[NSMutableArray addObject:](v25, "addObject:", v18);

  if (-[SDHotspotManager flippedHotspotSwitch](self, "flippedHotspotSwitch"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("We turned switch on:%@"), v19));
  -[NSMutableArray addObject:](v25, "addObject:", v20);

  v22 = (objc_class *)objc_opt_class(self, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  sub_1000455A8(v24, (uint64_t)v25);

}

- (void)firstUnlockStateChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173D70;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)simStateChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173DD0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)personalHotspotAllowedChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173E30;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (BOOL)netRBTetheringSupported
{
  int v4;
  int v5;

  v5 = 0;
  v4 = 0;
  -[SDMISManager getState:andReason:](self->_misManager, "getState:andReason:", &v5, &v4);
  return (v5 & 0xFFFFFFFE) == 0x3FE && v4 != 4;
}

- (void)onqueue_updateTetheringSupported
{
  unsigned int v3;
  void *v4;
  id v5;
  _BOOL4 v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  id WeakRetained;
  char v28;
  id v29;
  __int16 v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;

  v3 = -[SDHotspotManager isTetheringSupported](self, "isTetheringSupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v5 = objc_msgSend(v4, "wifiManager");

  if (v5)
    v6 = WiFiManagerClientIsTetheringSupported(v5) == 0;
  else
    v6 = 1;
  if (self->_misManager)
    v7 = !-[SDHotspotManager netRBTetheringSupported](self, "netRBTetheringSupported");
  else
    v7 = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v9 = objc_msgSend(v8, "deviceWasUnlockedOnce");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v11 = objc_msgSend(v10, "simStateReady");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v13 = objc_msgSend(v12, "personalHotspotAllowed");

  v30 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v14, "cellularDataEnabled:airplaneMode:", &v30, (char *)&v30 + 1);

  v16 = 0;
  if ((v13 ^ 1 | v6) != 1 && !v7 && v9 && v11 && !HIBYTE(v30))
    v16 = (_BYTE)v30 != 0;
  v17 = tethering_log(v15);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("NO");
    if (v16)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    if (v6)
      v21 = CFSTR("NO");
    else
      v21 = CFSTR("YES");
    *(_DWORD *)buf = 138414082;
    v32 = v20;
    if (v7)
      v22 = CFSTR("NO");
    else
      v22 = CFSTR("YES");
    v33 = 2112;
    v34 = v21;
    if (v9)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v35 = 2112;
    if (v11)
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v36 = v22;
    if (v13)
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    v37 = 2112;
    if (HIBYTE(v30))
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    v38 = v23;
    if ((_BYTE)v30)
      v19 = CFSTR("YES");
    v39 = 2112;
    v40 = v24;
    v41 = 2112;
    v42 = v25;
    v43 = 2112;
    v44 = v26;
    v45 = 2112;
    v46 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updated tethering support result = %@, wifiResult = %@, netRBResult = %@, firstUnlocked = %@, simStateReady = %@, allowed = %@, airplaneMode = %@, cell data enabled = %@", buf, 0x52u);
  }

  -[SDHotspotManager setTetheringSupported:](self, "setTetheringSupported:", v16);
  if (v3 != -[SDHotspotManager isTetheringSupported](self, "isTetheringSupported"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v28 = objc_opt_respondsToSelector(WeakRetained, "hotspotManagerTetheringSupportChanged:");

    if ((v28 & 1) != 0)
    {
      v29 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v29, "hotspotManagerTetheringSupportChanged:", self);

    }
  }
}

- (void)onqueue_updateHostAPNetwork
{
  id hostAPNetwork;
  id *p_hostAPNetwork;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t v28[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CFTypeRef cf;
  _BYTE v34[128];

  p_hostAPNetwork = &self->_hostAPNetwork;
  hostAPNetwork = self->_hostAPNetwork;
  self->_hostAPNetwork = 0;

  cf = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v6 = objc_msgSend(v5, "defaultWiFiDevice");

  if (v6)
  {
    v8 = WiFiDeviceClientCopyHostedNetworks(v6, &cf);
    if ((_DWORD)v8)
    {
      v9 = v8;
      v10 = tethering_log(v8);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10017674C(v9, v11, v12, v13, v14, v15, v16, v17);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v11 = (id)cf;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v22)
              objc_enumerationMutation(v11);
            v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            if (-[SDHotspotManager isNetworkHostAP:](self, "isNetworkHostAP:", v24))
            {
              objc_storeStrong(p_hostAPNetwork, v24);
              v26 = tethering_log(v25);
              v27 = objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v28 = 0;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Host AP network up", v28, 2u);
              }

            }
          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v21);
      }
    }

    if (cf)
      CFRelease(cf);
  }
  else
  {
    v18 = tethering_log(v7);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100176720();

  }
}

- (void)onqueue_handleSwitchCondtionsChanged
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  uint8_t buf[4];
  const __CFString *v9;

  v7 = 0;
  v3 = -[SDMISManager getState:andReason:](self->_misManager, "getState:andReason:", (char *)&v7 + 4, &v7);
  if (HIDWORD(v7) == 1023)
  {
    if (-[SDHotspotManager shouldTurnOffTethering](self, "shouldTurnOffTethering"))
      -[SDMISManager setState:](self->_misManager, "setState:", 1022);
  }
  else
  {
    self->_flippedHotspotSwitch = 0;
    v4 = tethering_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_flippedHotspotSwitch)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Flipped switch on state being reset to %@", buf, 0xCu);
    }

  }
}

- (BOOL)shouldTurnOffTethering
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  NSTimer *networkTimer;
  const __CFString *v14;
  BOOL v15;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  NSTimer *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "wifiManager");

  v6 = tethering_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[SDMISManager connectedHosts](self->_misManager, "connectedHosts");
    if (-[SDMISManager hostIsOnlyUSBEthernet](self->_misManager, "hostIsOnlyUSBEthernet"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    if (self->_flippedHotspotSwitch)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    if (WiFiManagerClientGetMISDiscoveryState(v4))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hostAPNetwork](self, "hostAPNetwork"));
    networkTimer = self->_networkTimer;
    if (v12)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v18[0] = 67110658;
    v18[1] = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = networkTimer;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "connected hosts = %d, only usb = %@, flipped switch on = %@, wifiClient = %@, discovery state = %@, hostAPNetwork = %@, network timer = %@", (uint8_t *)v18, 0x44u);

  }
  if (-[SDMISManager connectedHosts](self->_misManager, "connectedHosts")
    && !-[SDMISManager hostIsOnlyUSBEthernet](self->_misManager, "hostIsOnlyUSBEthernet"))
  {
    return 0;
  }
  v15 = 0;
  if (self->_flippedHotspotSwitch && v4)
  {
    if (WiFiManagerClientGetMISDiscoveryState(v4))
      return 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hostAPNetwork](self, "hostAPNetwork"));
    if (v17)
      v15 = 0;
    else
      v15 = self->_networkTimer == 0;

  }
  return v15;
}

- (BOOL)isTethering
{
  int v3;
  int v4;

  v4 = 1021;
  v3 = 0;
  -[SDMISManager getState:andReason:](self->_misManager, "getState:andReason:", &v4, &v3);
  return v4 == 1023;
}

- (BOOL)isP2PAllowed
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v3 = objc_msgSend(v2, "wifiManager");

  return v3 && WiFiManagerClientIsP2PAllowed(v3) != 0;
}

- (BOOL)isTetheringInUse
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CFTypeRef cf;
  _BYTE v29[128];

  cf = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "defaultWiFiDevice");

  if (v4)
  {
    v6 = WiFiDeviceClientCopyHostedNetworks(v4, &cf);
    if ((_DWORD)v6 == 5)
    {
      v16 = 0;
    }
    else
    {
      v7 = v6;
      if ((_DWORD)v6)
      {
        v17 = tethering_log(v6);
        v8 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_10017674C(v7, v8, v18, v19, v20, v21, v22, v23);
      }
      else
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = (id)cf;
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              if (-[SDHotspotManager isNetworkHostAP:](self, "isNetworkHostAP:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), (_QWORD)v24))
              {
                v16 = 1;
                goto LABEL_21;
              }
            }
            v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
            if (v10)
              continue;
            break;
          }
        }
      }
      v16 = 0;
LABEL_21:

    }
    if (cf)
      CFRelease(cf);
    return v16 != 0;
  }
  else
  {
    v13 = tethering_log(v5);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100176720();

    return 0;
  }
}

- (void)startTetheringWithCompletionHandler:(id)a3 modelID:(id)a4 productVersion:(id)a5 canConnectOn5GHz:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *workQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001749B8;
  block[3] = &unk_100719280;
  block[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = v10;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(workQueue, block);

}

- (void)onqueue_startTetheringWithCompletionHandler:(id)a3 modelID:(id)a4 productVersion:(id)a5 canConnectOn5GHz:(BOOL)a6
{
  _BOOL4 v6;
  void (**v10)(id, void *, void *, void *, _QWORD);
  id v11;
  id v12;
  _BOOL8 v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  __CFDictionary *Mutable;
  __CFDictionary *v33;
  CFBooleanRef v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableArray *handlers;
  id v51;
  uint64_t v52;
  NSErrorUserInfoKey v53;
  const __CFString *v54;
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  __CFDictionary *v58;

  v6 = a6;
  v10 = (void (**)(id, void *, void *, void *, _QWORD))a3;
  v11 = a4;
  v12 = a5;
  v52 = 0;
  v13 = -[SDHotspotManager isTetheringSupported](self, "isTetheringSupported");
  if (v13)
  {
    v14 = tethering_log(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating password if needed", buf, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hotspotPassword](self, "hotspotPassword"));
    v17 = tethering_log(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Checking WiFi power", buf, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v20 = objc_msgSend(v19, "wirelessEnabled");

    if ((v20 & 1) == 0)
    {
      v22 = tethering_log(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Turning on Wifi", buf, 2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      objc_msgSend(v24, "setWirelessEnabled:", 1);

    }
    v25 = tethering_log(v21);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Fetching WiFi manager", buf, 2u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v28 = objc_msgSend(v27, "wifiManager");

    if (v28)
    {
      v30 = tethering_log(v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Checking MIS state", buf, 2u);
      }

      if (!WiFiManagerClientGetMISDiscoveryState(v28))
        self->_startedHostAP = 1;
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        v33 = Mutable;
        CFDictionaryAddValue(Mutable, CFSTR("SOFTAP_ENABLE"), kCFBooleanTrue);
        if (v6)
          v34 = kCFBooleanFalse;
        else
          v34 = kCFBooleanTrue;
        CFDictionaryAddValue(v33, CFSTR("SOFTAP_FORCE_2_4G_CHANNEL"), v34);
        CFDictionaryAddValue(v33, CFSTR("SOFTAP_IMMEDIATE_DISABLE"), kCFBooleanFalse);
        if (v11)
          CFDictionaryAddValue(v33, CFSTR("SOFTAP_SOFTAP_CAP_MODEL"), v11);
        if (v12)
          CFDictionaryAddValue(v33, CFSTR("SOFTAP_SOFTAP_OS_VER"), v12);
        v36 = tethering_log(v35);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = CFSTR("YES");
          if (!self->_startedHostAP)
            v38 = CFSTR("NO");
          *(_DWORD *)buf = 138412546;
          v56 = v38;
          v57 = 2112;
          v58 = v33;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Setting MIS Discovery state to YES, we started it = %@ with params: %@", buf, 0x16u);
        }

        WiFiManagerClientSetMISDiscoveryStateExt(v28, v33);
        CFRelease(v33);
      }
      else
      {
        v40 = tethering_log(0);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          sub_1001767B0();

      }
      -[SDMISManager getState:andReason:](self->_misManager, "getState:andReason:", (char *)&v52 + 4, &v52);
      if (HIDWORD(v52) == 1022)
      {
        -[SDMISManager setState:](self->_misManager, "setState:", 1023);
        self->_flippedHotspotSwitch = 1;
      }
      -[SDHotspotManager onqueue_updateHostAPNetwork](self, "onqueue_updateHostAPNetwork");
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hostAPNetwork](self, "hostAPNetwork"));

      v44 = tethering_log(v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
      if (v42)
      {
        if (v46)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Network already up", buf, 2u);
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hotspotName](self, "hotspotName"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hotspotPassword](self, "hotspotPassword"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hotspotChannel](self, "hotspotChannel"));
        v10[2](v10, v47, v48, v49, 0);

        -[SDHotspotManager turnOffDiscovery](self, "turnOffDiscovery");
        self->_startedHostAP = 0;
      }
      else
      {
        if (v46)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Bringing up the network, queuing handler", buf, 2u);
        }

        handlers = self->_handlers;
        v51 = objc_msgSend(v10, "copy");
        -[NSMutableArray addObject:](handlers, "addObject:", v51);

        -[SDHotspotManager restartNetworkTimer](self, "restartNetworkTimer");
      }
    }
  }
  else
  {
    v53 = NSLocalizedDescriptionKey;
    v54 = CFSTR("Tethering is not supported");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, v16));
    ((void (**)(id, void *, void *, void *, void *))v10)[2](v10, 0, 0, 0, v39);

  }
}

- (void)stopTethering
{
  void *v3;
  id v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  uint64_t v7;
  NSObject *v8;
  const void *v9[2];
  void *keys[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "wifiManager");

  if (v4)
  {
    *(_OWORD *)keys = *(_OWORD *)&off_1007192C0;
    v9[0] = kCFBooleanFalse;
    v9[1] = kCFBooleanTrue;
    v5 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, v9, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v5)
    {
      v6 = v5;
      WiFiManagerClientSetMISDiscoveryStateExt(v4, v5);
      CFRelease(v6);
    }
    else
    {
      v7 = tethering_log(0);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1001767DC();

    }
  }
  -[SDMISManager setState:](self->_misManager, "setState:", 1022);
}

- (void)turnOffDiscovery
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, 3000000000);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_1007192A0);
}

- (void)disableMISImmediately
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  uint64_t v9;
  NSObject *v10;
  const void *v11[2];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v3 = objc_msgSend(v2, "wifiManager");

  if (v3)
  {
    v5 = tethering_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disabling MIS", buf, 2u);
    }

    *(_OWORD *)buf = *(_OWORD *)&off_1007192C0;
    v11[0] = kCFBooleanFalse;
    v11[1] = kCFBooleanTrue;
    v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)buf, v11, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v7)
    {
      v8 = v7;
      WiFiManagerClientSetMISDiscoveryStateExt(v3, v7);
      CFRelease(v8);
    }
    else
    {
      v9 = tethering_log(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001767DC();

    }
    WiFiManagerClientSetMISState(v3, 0);
  }
}

- (void)onqueue_cleanUpFailedNetworkBringUp
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  uint64_t v9;
  NSObject *v10;
  const void *v11[2];
  void *keys[2];
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v13 = NSLocalizedDescriptionKey;
  v14 = CFSTR("Could not bring up Personal Hotspot WiFi network");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 50, v3));
  -[SDHotspotManager notifyHostAPError:](self, "notifyHostAPError:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v6 = objc_msgSend(v5, "wifiManager");

  if (v6)
  {
    *(_OWORD *)keys = *(_OWORD *)&off_1007192C0;
    v11[0] = kCFBooleanFalse;
    v11[1] = kCFBooleanTrue;
    v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, v11, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v7)
    {
      v8 = v7;
      WiFiManagerClientSetMISDiscoveryStateExt(v6, v7);
      CFRelease(v8);
    }
    else
    {
      v9 = tethering_log(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001767DC();

    }
  }
  -[SDHotspotManager onqueue_handleSwitchCondtionsChanged](self, "onqueue_handleSwitchCondtionsChanged");
}

- (void)restartNetworkTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001755FC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)networkTimerFired:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *workQueue;
  _QWORD block[5];

  v4 = tethering_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100176808();

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100175734;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)invalidateNetworkTimer
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *networkTimer;
  uint8_t v6[16];

  if (self->_networkTimer)
  {
    v3 = tethering_log(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating network timer", v6, 2u);
    }

    -[NSTimer invalidate](self->_networkTimer, "invalidate");
    networkTimer = self->_networkTimer;
    self->_networkTimer = 0;

  }
}

- (void)onqueue_captureTailspin
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSDate *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_queue_global_t global_queue;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[16];

  v3 = sub_1000CE8D0(CFSTR("EnableSoftAPTailspin"), 0);
  if ((_DWORD)v3 && !self->_capturingTailspin)
  {
    self->_capturingTailspin = 1;
    v4 = tethering_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Capturing tailspin", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    objc_msgSend(v6, "setLocale:", v7);

    v8 = objc_opt_new(NSDate);
    v25 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 2097404, v8));

    v10 = objc_msgSend(v9, "year");
    v11 = objc_msgSend(v9, "month");
    v12 = objc_msgSend(v9, "day");
    v13 = objc_msgSend(v9, "hour");
    v14 = objc_msgSend(v9, "minute");
    v15 = objc_msgSend(v9, "second");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "abbreviation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02ld-%02ld-%02ld_%02ld:%02ld:%02ld_%@"), v10, v11, v12, v13, v14, v15, v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/var/tmp/InstantHotspot_%@.tailspin"), v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v20, "createFileAtPath:contents:attributes:", v19, 0, 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v19));
    if (v21)
    {
      global_queue = dispatch_get_global_queue(-32768, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v24 = objc_msgSend(v21, "fileDescriptor");
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100175AA4;
      v26[3] = &unk_100716158;
      v26[4] = self;
      v27 = v21;
      tailspin_dump_output(v24, v23, v26);

    }
  }
}

- (NSString)hotspotName
{
  void *v3;
  void *v4;
  uint64_t SSID;
  __CFString *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hostAPNetwork](self, "hostAPNetwork"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hostAPNetwork](self, "hostAPNetwork"));
    SSID = WiFiNetworkGetSSID();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(SSID);

  }
  else
  {
    v6 = &stru_10072FE60;
  }
  return (NSString *)v6;
}

- (BOOL)setHotspotPassword:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v5 = objc_msgSend(v4, "wifiManager");

  if (v5)
  {
    v7 = tethering_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting new password", v10, 2u);
    }

    LOBYTE(v5) = WiFiManagerClientSetMisPassword(v5, v3) == 1;
  }

  return (char)v5;
}

- (id)_createDefaultPassword
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CFErrorRef v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  CFErrorRef err;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyz")));
  v16[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("1234567890")));
  v16[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));

  err = 0;
  v14[0] = kSecPasswordMinLengthKey;
  v14[1] = kSecPasswordMaxLengthKey;
  v15[0] = &off_10074B988;
  v15[1] = &off_10074B988;
  v14[2] = kSecPasswordAllowedCharactersKey;
  v14[3] = kSecPasswordRequiredCharactersKey;
  v15[2] = CFSTR("abcdefghijklmnopqrstuvwxyz1234567890");
  v15[3] = v5;
  v6 = (void *)SecPasswordGenerate(2, &err, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  if (!objc_msgSend(v6, "length"))
  {
    v8 = err;
    if (err)
    {
      v9 = (__CFString *)CFErrorCopyDescription(err);
      CFRelease(err);
    }
    else
    {
      v9 = CFSTR("unknown error");
    }
    v10 = tethering_log(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100176834((uint64_t)v9, v11);

    goto LABEL_10;
  }
  if (!-[SDHotspotManager setHotspotPassword:](self, "setHotspotPassword:", v6))
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = v6;
LABEL_11:

  return v7;
}

- (NSString)hotspotPassword
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  NSString *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = (__CFString *)objc_msgSend(v3, "wifiManager");

  if (v4)
  {
    v4 = (__CFString *)WiFiManagerClientCopyMisPassword(v4);
    if (!-[__CFString length](v4, "length"))
    {
      v5 = objc_claimAutoreleasedReturnValue(-[SDHotspotManager _createDefaultPassword](self, "_createDefaultPassword"));

      v4 = (__CFString *)v5;
    }
  }
  if (v4)
    v6 = v4;
  else
    v6 = &stru_10072FE60;
  v7 = v6;

  return v7;
}

- (id)hotspotChannel
{
  void *v3;
  void *v4;
  uint64_t Channel;
  _UNKNOWN **v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hostAPNetwork](self, "hostAPNetwork"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hostAPNetwork](self, "hostAPNetwork"));
    Channel = WiFiNetworkGetChannel();
    v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(Channel);

  }
  else
  {
    v6 = &off_10074B9A0;
  }
  return v6;
}

- (void)setMaxConnectionsReached:(BOOL)a3
{
  id v3;

  self->_maxConnectionsReached = a3;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SDHotspotManagerConnectionStateChanged"), 0);

}

- (void)notifyHostAPActivated
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_handlers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hotspotName](self, "hotspotName", (_QWORD)v12));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hotspotPassword](self, "hotspotPassword"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotManager hotspotChannel](self, "hotspotChannel"));
        (*(void (**)(uint64_t, void *, void *, void *, _QWORD))(v8 + 16))(v8, v9, v10, v11, 0);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_handlers, "removeAllObjects");
}

- (void)notifyHostAPError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_handlers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_handlers, "removeAllObjects", (_QWORD)v10);
}

- (void)misStateChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176244;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (BOOL)isNetworkHostAP:(__WiFiNetwork *)a3
{
  uint64_t Property;
  void *v4;
  void *v5;
  BOOL v6;

  Property = WiFiNetworkGetProperty(a3, kWiFiNetworkRoleKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue(Property);
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "intValue") == 3;
  else
    v6 = 0;

  return v6;
}

- (void)handleHostAPChanged:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100176340;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)onqueue_handleHostAPChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  const __CFString *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HostAPEventData")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HostApEnabled")));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    -[SDHotspotManager onqueue_updateHostAPNetwork](self, "onqueue_updateHostAPNetwork");
    -[SDHotspotManager invalidateNetworkTimer](self, "invalidateNetworkTimer");
    v9 = -[SDHotspotManager startedHostAP](self, "startedHostAP");
    if (v9)
    {
      v10 = tethering_log(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "We brought up the network", (uint8_t *)&v20, 2u);
      }

      -[SDHotspotManager turnOffDiscovery](self, "turnOffDiscovery");
      -[SDHotspotManager setStartedHostAP:](self, "setStartedHostAP:", 0);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HostApDisableHotspotAdvertise")));
    v13 = objc_msgSend(v12, "BOOLValue");

    -[SDHotspotManager setMaxConnectionsReached:](self, "setMaxConnectionsReached:", v13);
    v14 = tethering_log(-[SDHotspotManager notifyHostAPActivated](self, "notifyHostAPActivated"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[SDHotspotManager isP2PAllowed](self, "isP2PAllowed");
      v17 = CFSTR("NO");
      if (v16)
        v17 = CFSTR("YES");
      v20 = 138412290;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SoftAP up, P2P enabled %@", (uint8_t *)&v20, 0xCu);
    }

  }
  else
  {
    v18 = tethering_log(v8);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Clearing cached wifinetwork", (uint8_t *)&v20, 2u);
    }

    -[SDHotspotManager setHostAPNetwork:](self, "setHostAPNetwork:", 0);
    -[SDHotspotManager setMaxConnectionsReached:](self, "setMaxConnectionsReached:", 0);
    -[SDHotspotManager onqueue_handleSwitchCondtionsChanged](self, "onqueue_handleSwitchCondtionsChanged");
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1007192D0);

}

- (BOOL)isTetheringSupported
{
  return self->_tetheringSupported;
}

- (void)setTetheringSupported:(BOOL)a3
{
  self->_tetheringSupported = a3;
}

- (BOOL)maxConnectionsReached
{
  return self->_maxConnectionsReached;
}

- (SDHotspotManagerDelegate)delegate
{
  return (SDHotspotManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNumber)p2pAllowedCache
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setP2pAllowedCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)startedHostAP
{
  return self->_startedHostAP;
}

- (void)setStartedHostAP:(BOOL)a3
{
  self->_startedHostAP = a3;
}

- (BOOL)capturingTailspin
{
  return self->_capturingTailspin;
}

- (void)setCapturingTailspin:(BOOL)a3
{
  self->_capturingTailspin = a3;
}

- (BOOL)flippedHotspotSwitch
{
  return self->_flippedHotspotSwitch;
}

- (void)setFlippedHotspotSwitch:(BOOL)a3
{
  self->_flippedHotspotSwitch = a3;
}

- (id)hostAPNetwork
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setHostAPNetwork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSTimer)networkTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNetworkTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)handlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_networkTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_hostAPNetwork, 0);
  objc_storeStrong((id *)&self->_p2pAllowedCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_misManager, 0);
}

@end
