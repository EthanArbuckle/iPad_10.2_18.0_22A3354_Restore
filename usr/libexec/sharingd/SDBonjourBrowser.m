@implementation SDBonjourBrowser

- (SDBonjourBrowser)initWithDomain:(id)a3 types:(id)a4
{
  id v7;
  id v8;
  SDBonjourBrowser *v9;
  SDBonjourBrowser *v10;
  NSMutableDictionary *airDropRequests;
  NSString *bundleID;
  NSMutableSet *discoveredPeers;
  NSMutableDictionary *iconCache;
  NSNumber *isFinder;
  WPAWDL *proximity;
  NSString *sessionID;
  NSMutableDictionary *serverCache;
  NSMutableDictionary *v19;
  NSMutableDictionary *servers;
  NSMutableDictionary *v21;
  NSMutableDictionary *dnsQueries;
  uint64_t v23;
  SDStatusMonitor *monitor;
  uint64_t v25;
  NSTimer *restartTimer;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  NSMutableSet *v29;
  NSMutableSet *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *v32;
  objc_super v34;

  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SDBonjourBrowser;
  v9 = -[SDBonjourBrowser init](&v34, "init");
  v10 = v9;
  if (v9)
  {
    airDropRequests = v9->_airDropRequests;
    v9->_airDropRequests = 0;

    v10->_awdlIndex = 0;
    bundleID = v10->_bundleID;
    v10->_bundleID = 0;

    v10->_connection = 0;
    discoveredPeers = v10->_discoveredPeers;
    v10->_discoveredPeers = 0;

    objc_storeStrong((id *)&v10->_domain, a3);
    v10->_firstTime = 0.0;
    iconCache = v10->_iconCache;
    v10->_iconCache = 0;

    v10->_identityQueries = 0;
    isFinder = v10->_isFinder;
    v10->_isFinder = 0;

    v10->_maxServices = 0;
    v10->_mode = 0;
    proximity = v10->_proximity;
    v10->_proximity = 0;

    sessionID = v10->_sessionID;
    v10->_sessionID = 0;

    serverCache = v10->_serverCache;
    v10->_serverCache = 0;

    v10->_startTime = 0.0;
    *(_QWORD *)&v10->_transfersInitiated = 0;
    objc_storeStrong((id *)&v10->_types, a4);
    v19 = objc_opt_new(NSMutableDictionary);
    servers = v10->_servers;
    v10->_servers = v19;

    v21 = objc_opt_new(NSMutableDictionary);
    dnsQueries = v10->_dnsQueries;
    v10->_dnsQueries = v21;

    v23 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v10->_monitor;
    v10->_monitor = (SDStatusMonitor *)v23;

    v10->_isNetBIOS = objc_msgSend(v8, "containsObject:", CFSTR("_netbios._udp."));
    v10->_isAirDrop = objc_msgSend(v8, "containsObject:", sub_1000CEC14());
    v10->_isWorkgroups = objc_msgSend(v8, "containsObject:", CFSTR("_workgroups._udp."));
    v25 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v10, "restartBrowser:", 0, 1, 1.0e30));
    restartTimer = v10->_restartTimer;
    v10->_restartTimer = (NSTimer *)v25;

    if (v10->_isAirDrop)
    {
      v27 = objc_opt_new(NSMutableDictionary);
      v28 = v10->_airDropRequests;
      v10->_airDropRequests = v27;

      v29 = objc_opt_new(NSMutableSet);
      v30 = v10->_discoveredPeers;
      v10->_discoveredPeers = v29;

      v31 = objc_opt_new(NSMutableDictionary);
      v32 = v10->_iconCache;
      v10->_iconCache = v31;

      v10->_identityQueries = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    -[SDBonjourBrowser addObservers](v10, "addObservers");
  }

  return v10;
}

- (NSString)bundleID
{
  OS_xpc_object *xpcConnection;
  id v4;
  NSString *v5;
  NSString *bundleID;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection && !self->_bundleID)
  {
    v4 = sub_10019CD60(xpcConnection);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    bundleID = self->_bundleID;
    self->_bundleID = v5;

  }
  return self->_bundleID;
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[SDBonjourBrowser stop](self, "stop");
    -[SDBonjourBrowser notifyClient](self, "notifyClient");
    -[SDBonjourBrowser updateBrowserState](self, "updateBrowserState");
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)restartBrowser:(id)a3
{
  if (self->_startCalled)
  {
    -[SDBonjourBrowser stop](self, "stop", a3);
    -[SDBonjourBrowser notifyClient](self, "notifyClient");
    -[SDBonjourBrowser updateBrowserState](self, "updateBrowserState");
  }
}

- (void)dealloc
{
  __CFDictionary *identityQueries;
  objc_super v4;

  -[SDBonjourBrowser removeObservers](self, "removeObservers");
  identityQueries = self->_identityQueries;
  if (identityQueries)
    CFRelease(identityQueries);
  v4.receiver = self;
  v4.super_class = (Class)SDBonjourBrowser;
  -[SDBonjourBrowser dealloc](&v4, "dealloc");
}

- (void)clearCache
{
  NSMutableDictionary *serverCache;

  serverCache = self->_serverCache;
  self->_serverCache = 0;

}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  if (self->_isAirDrop)
  {
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.AppleIDAccountInfoChanged"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.AppleIDChanged"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "airDropPublished:", CFSTR("com.apple.sharingd.AirDropPublished"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "lockStatusChanged:", CFSTR("com.apple.sharingd.UILockStatusChanged"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "screenStatusChanged:", CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "contactsChanged:", CFSTR("com.apple.sharingd.ContactsChanged"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "consoleUserChanged:", CFSTR("com.apple.sharingd.ConsoleUserChanged"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "linkStateChanged:", CFSTR("com.apple.sharingd.AirDropLinkStateChanged"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "wirelessPowerChanged:", CFSTR("com.apple.sharingd.WirelessPowerChanged"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "wirelessPowerChanged:", CFSTR("com.apple.sharingd.BluetoothPowerChanged"), 0);
  }
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.MulticastDNSChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (unsigned)getInterface:(unsigned int)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  if (self->_isAirDrop)
  {
    if (-[SDStatusMonitor browseAllInterfaces](self->_monitor, "browseAllInterfaces", *(_QWORD *)&a3))
    {
      LODWORD(v4) = 0;
    }
    else
    {
      LODWORD(v4) = self->_awdlIndex;
      if (!(_DWORD)v4)
      {
        v4 = sub_10019D034();
        self->_awdlIndex = v4;
        if (!(_DWORD)v4)
        {
          v5 = airdrop_log(v4);
          v6 = objc_claimAutoreleasedReturnValue(v5);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            sub_100130558();

          LODWORD(v4) = self->_awdlIndex;
        }
      }
    }
  }
  else if (self->_isWorkgroups)
  {
    LODWORD(v4) = -1;
  }
  else if (self->_isNetBIOS)
  {
    LODWORD(v4) = -1;
  }
  else
  {
    LODWORD(v4) = a3;
  }
  return v4;
}

- (BOOL)thisIsTheFinder
{
  NSNumber *isFinder;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  isFinder = self->_isFinder;
  if (!isFinder)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser bundleID](self, "bundleID"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.finder"))));
    v6 = self->_isFinder;
    self->_isFinder = v5;

    isFinder = self->_isFinder;
  }
  return -[NSNumber BOOLValue](isFinder, "BOOLValue");
}

- (BOOL)preferVibrantIcons
{
  return 1;
}

- (BOOL)checkDiscoveryEntitlement
{
  return sub_1000CE8D0(CFSTR("GateAirDropDiscovery"), 0) != 0;
}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a4;
  v7 = a5;
  v8 = airdrop_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_100130584((uint64_t)v6, (uint64_t)v7, v9);

}

- (void)awdlDidUpdateState:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)v5 > 3)
    v6 = 0;
  else
    v6 = *((_QWORD *)&off_1007182E8 + (_QWORD)v5);
  v7 = airdrop_log(v5);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BTLE advertiser %@", (uint8_t *)&v10, 0xCu);
  }

  v9 = objc_msgSend(v4, "state");
  if (v9 == (id)3)
    -[SDBonjourBrowser advertiseHashes](self, "advertiseHashes");
}

- (void)awdl:(id)a3 failedToStartAdvertisingWithError:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a4;
  v5 = airdrop_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1001305F4((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

}

- (void)startConnectionlessAdvertisingWithData:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;

  v4 = a3;
  if (!v4)
  {
    v6 = CFSTR("com.apple.airdrop");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    v4 = (id)objc_claimAutoreleasedReturnValue(+[SDAirDropContactHashManager btleAdvertisementDataForStrings:](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "btleAdvertisementDataForStrings:", v5));

  }
  -[WPAWDL startConnectionlessAWDLServiceAdvertisingWithData:](self->_proximity, "startConnectionlessAWDLServiceAdvertisingWithData:", v4);

}

- (void)stopConnectionlessAdvertising
{
  WPAWDL *proximity;

  -[WPAWDL stopConnectionlessAWDLServiceAdvertising](self->_proximity, "stopConnectionlessAWDLServiceAdvertising");
  -[WPAWDL invalidate](self->_proximity, "invalidate");
  proximity = self->_proximity;
  self->_proximity = 0;

}

- (void)advertiseHashes
{
  WPAWDL *proximity;
  _BOOL8 v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;

  proximity = self->_proximity;
  if (proximity && -[WPAWDL state](proximity, "state") == (id)3)
  {
    v4 = -[SDStatusMonitor enableAirDropAdvertising](self->_monitor, "enableAirDropAdvertising");
    if (v4)
    {
      v5 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myShortHashesForAirDrop](self->_monitor, "myShortHashesForAirDrop"));
      if (v5)
      {
        v6 = airdrop_log(-[SDBonjourBrowser startConnectionlessAdvertisingWithData:](self, "startConnectionlessAdvertisingWithData:", v5));
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138412290;
          v12 = v5;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTLE advertising hashes %@", (uint8_t *)&v11, 0xCu);
        }

      }
      else
      {
        v9 = airdrop_log(0);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No email or phone number hashes to advertise", (uint8_t *)&v11, 2u);
        }

        -[SDBonjourBrowser startConnectionlessAdvertisingWithData:](self, "startConnectionlessAdvertisingWithData:", 0);
      }
      sub_100045388((uint64_t)CFSTR("BluetoothAdvertise"), (uint64_t)CFSTR("Start"), (uint64_t)-[SDBonjourBrowser bundleID](self, "bundleID"), 0);
    }
    else
    {
      v8 = airdrop_log(v4);
      v5 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BTLE advertising disabled", (uint8_t *)&v11, 2u);
      }
    }

  }
}

- (BOOL)shouldStart
{
  _BOOL4 v3;

  if (self->_startCalled)
  {
    if (self->_isAirDrop)
    {
      v3 = -[SDStatusMonitor screenOn](self->_monitor, "screenOn");
      if (v3)
      {
        v3 = -[SDStatusMonitor bluetoothEnabled](self->_monitor, "bluetoothEnabled");
        if (v3)
          LOBYTE(v3) = -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled");
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)updateBrowserState
{
  void *v3;
  unsigned int v4;
  id WeakRetained;
  unsigned int v6;
  uint64_t Connection;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  char v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  int64_t mode;
  int v19;
  DNSServiceFlags v20;
  uint32_t v21;
  id v22;
  DNSServiceErrorType v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSString *v35;
  NSString *browserID;
  _BOOL8 v37;
  uint64_t v38;
  NSObject *v39;
  WPAWDL *v40;
  WPAWDL *proximity;
  _DNSServiceRef_t **p_connection;
  DNSServiceRef sdRef[2];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser domain](self, "domain"));
  v4 = -[SDBonjourBrowser shouldStart](self, "shouldStart");
  if (v3
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate)) != 0
    && (!self->_connection ? (v6 = v4) : (v6 = 0), WeakRetained, v6 == 1))
  {
    Connection = DNSServiceCreateConnection(&self->_connection);
    if ((_DWORD)Connection)
    {
      v9 = browser_log(Connection, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100130718();

    }
    else
    {
      p_connection = &self->_connection;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v12 = self->_types;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v15)
              objc_enumerationMutation(v12);
            v17 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            sdRef[0] = self->_connection;
            mode = self->_mode;
            if (mode == 1)
              v19 = 33570816;
            else
              v19 = 0x4000;
            if (mode == 2)
              v20 = 67125248;
            else
              v20 = v19;
            if (self->_isAirDrop && !-[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode"))
              v20 |= 0x100000u;
            v21 = -[SDBonjourBrowser getInterface:](self, "getInterface:", 0);
            v22 = objc_retainAutorelease(v17);
            v23 = DNSServiceBrowse(sdRef, v20, v21, (const char *)objc_msgSend(v22, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), (DNSServiceBrowseReply)sub_10012C348, self);

            if (v23)
            {

              v30 = browser_log(v28, v29);
              v27 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                sub_1001306B8();
              goto LABEL_37;
            }
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v14)
            continue;
          break;
        }
      }

      v24 = DNSServiceSetDispatchQueue(*p_connection, (dispatch_queue_t)&_dispatch_main_q);
      if ((_DWORD)v24)
      {
        v26 = browser_log(v24, v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_100130658();
LABEL_37:

        DNSServiceRefDeallocate(*p_connection);
        *p_connection = 0;
      }
      else if (self->_isAirDrop)
      {
        v31 = airdrop_log(v24);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(sdRef[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Bonjour discovery started", (uint8_t *)sdRef, 2u);
        }

        sub_100045388((uint64_t)CFSTR("BonjourBrowse"), (uint64_t)CFSTR("Start"), (uint64_t)-[SDBonjourBrowser bundleID](self, "bundleID"), 0);
        self->_startTime = CFAbsoluteTimeGetCurrent();
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "UUIDString"));
        v35 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "substringWithRange:", 24, 12));
        browserID = self->_browserID;
        self->_browserID = v35;

        v37 = -[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode");
        if (!v37)
        {
          if (!self->_proximity)
          {
            v38 = airdrop_log(v37);
            v39 = objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(sdRef[0]) = 0;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "BTLE advertising started", (uint8_t *)sdRef, 2u);
            }

            v40 = (WPAWDL *)objc_msgSend(objc_alloc((Class)WPAWDL), "initWithDelegate:queue:", self, &_dispatch_main_q);
            proximity = self->_proximity;
            self->_proximity = v40;

          }
          -[SDBonjourBrowser advertiseHashes](self, "advertiseHashes");
        }
      }
    }
  }
  else
  {
    if (self->_startTime == 0.0)
      v11 = 1;
    else
      v11 = v4;
    if ((v11 & 1) == 0)
    {
      -[SDBonjourBrowser stop](self, "stop");
      -[SDBonjourBrowser notifyClient](self, "notifyClient");
    }
  }

}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v6[5];
  _QWORD block[5];
  uint8_t buf[16];

  v3 = airdrop_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SDBonjourBrowser: start requested", buf, 2u);
  }

  self->_startCalled = 1;
  if (dword_1007D7F38)
  {
    v5 = sub_10019AAC0(2.0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012C474;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10012C47C;
    v6[3] = &unk_1007146D8;
    v6[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)logAirDropSessionInfo
{
  double startTime;
  double Current;
  double firstTime;
  double v6;
  uint64_t maxServices;
  id v8;
  int64_t v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  double v13;
  __CFString *sessionID;
  __CFString *browserID;
  __CFString *v16;
  uint8_t buf[16];

  startTime = self->_startTime;
  Current = CFAbsoluteTimeGetCurrent();
  firstTime = self->_firstTime;
  v6 = self->_startTime;
  maxServices = self->_maxServices;
  v8 = -[NSMutableSet count](self->_discoveredPeers, "count");
  v9 = -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel");
  v10 = v9;
  v11 = airdrop_log(v9);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Bonjour discovery stopped", buf, 2u);
  }
  if (firstTime == 0.0)
    v13 = -1.0;
  else
    v13 = firstTime - v6;

  browserID = (__CFString *)self->_browserID;
  sessionID = (__CFString *)self->_sessionID;
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser bundleID](self, "bundleID"));
  sub_100044F90(sessionID, browserID, v16, (unint64_t)(startTime * 1000.0), maxServices, (uint64_t)v8, self->_transfersInitiated, self->_transfersCompleted, Current - v6, v13, v10);

}

- (void)stop
{
  NSString *browserID;
  NSMutableDictionary *dnsQueries;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  _DNSServiceRef_t *connection;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  -[SDBonjourBrowser clearCache](self, "clearCache");
  -[NSMutableDictionary removeAllObjects](self->_servers, "removeAllObjects");
  -[SDBonjourBrowser cancelIdentityQueries](self, "cancelIdentityQueries");
  -[SDBonjourBrowser cancelAirDropRequests](self, "cancelAirDropRequests");
  if (self->_isAirDrop && self->_startTime != 0.0)
  {
    -[SDBonjourBrowser logAirDropSessionInfo](self, "logAirDropSessionInfo");
    -[NSMutableSet removeAllObjects](self->_discoveredPeers, "removeAllObjects");
    browserID = self->_browserID;
    self->_browserID = 0;

    self->_maxServices = 0;
    self->_firstTime = 0.0;
    self->_startTime = 0.0;
  }
  dnsQueries = self->_dnsQueries;
  if (dnsQueries)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](dnsQueries, "allValues"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("QueryTimer")));
          objc_msgSend(v10, "invalidate");

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }
    -[NSMutableDictionary removeAllObjects](self->_dnsQueries, "removeAllObjects");

  }
  connection = self->_connection;
  if (connection)
  {
    if (self->_isAirDrop)
    {
      sub_100045388((uint64_t)CFSTR("BonjourBrowse"), (uint64_t)CFSTR("Stop"), (uint64_t)-[SDBonjourBrowser bundleID](self, "bundleID"), 0);
      connection = self->_connection;
    }
    DNSServiceRefDeallocate(connection);
    self->_connection = 0;
  }
  if (self->_proximity)
  {
    v12 = airdrop_log(connection);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BTLE advertising stopped", v14, 2u);
    }

    sub_100045388((uint64_t)CFSTR("BluetoothAdvertise"), (uint64_t)CFSTR("Stop"), (uint64_t)-[SDBonjourBrowser bundleID](self, "bundleID"), 0);
    -[SDBonjourBrowser stopConnectionlessAdvertising](self, "stopConnectionlessAdvertising");
  }
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *restartTimer;
  NSTimer *v6;
  uint8_t v7[16];

  v3 = airdrop_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SDBonjourBrowser: invalidate requested", v7, 2u);
  }

  -[SDBonjourBrowser stop](self, "stop");
  restartTimer = self->_restartTimer;
  if (restartTimer)
  {
    -[NSTimer invalidate](restartTimer, "invalidate");
    v6 = self->_restartTimer;
    self->_restartTimer = 0;

  }
}

- (void)removeInvalidNodes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_serverCache, "allKeys"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));

        v12 = (const __CFString *)SFNodeCopyDisplayName(v11);
        if (v12)
        {
          v13 = v12;
          if (!CFStringGetLength(v12))
            objc_msgSend(v4, "removeObjectForKey:", v10);
          CFRelease(v13);
        }
        else
        {
          objc_msgSend(v4, "removeObjectForKey:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)updateSecondaryNameForNodes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (sub_10004E26C(v8))
          sub_10004E464(v8, v3);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)updateServerCacheIfNeeded
{
  NSMutableDictionary *v3;
  NSMutableDictionary *serverCache;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  SDStatusMonitor *monitor;
  void *v14;
  void *v15;
  id v16;

  if (!self->_serverCache)
  {
    if (self->_isAirDrop)
    {
      if (-[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled")
        && -[SDStatusMonitor bluetoothEnabled](self->_monitor, "bluetoothEnabled"))
      {
        v3 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_servers, "mutableCopy");
        serverCache = self->_serverCache;
        self->_serverCache = v3;

        if (!-[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole"))
        {
          v5 = sub_10004DA00(0, 0);
          if (v5)
          {
            v6 = v5;
            -[NSMutableDictionary removeObjectForKey:](self->_serverCache, "removeObjectForKey:", v5);
            CFRelease(v6);
          }
        }
        -[SDBonjourBrowser removeInvalidNodes:](self, "removeInvalidNodes:", self->_serverCache);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_serverCache, "allValues"));
        -[SDBonjourBrowser updateSecondaryNameForNodes:](self, "updateSecondaryNameForNodes:", v7);

        v8 = -[NSMutableDictionary count](self->_serverCache, "count");
        if ((uint64_t)v8 > self->_maxServices)
        {
          self->_maxServices = (int)v8;
          if (self->_firstTime == 0.0)
            self->_firstTime = CFAbsoluteTimeGetCurrent();
        }
      }
    }
    else if (self->_isWorkgroups || -[SDStatusMonitor showThisComputer](self->_monitor, "showThisComputer"))
    {
      v9 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_servers, "mutableCopy");
      v10 = self->_serverCache;
      self->_serverCache = v9;

    }
    else
    {
      v11 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_servers, "mutableCopy");
      v12 = self->_serverCache;
      self->_serverCache = v11;

      monitor = self->_monitor;
      if (self->_isNetBIOS)
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor netbiosName](monitor, "netbiosName"));
      else
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor bonjourName](monitor, "bonjourName"));
      if (v14)
      {
        v16 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
        if (v15)
          -[NSMutableDictionary removeObjectForKey:](self->_serverCache, "removeObjectForKey:", v15);

        v14 = v16;
      }

    }
  }
}

- (NSArray)nodes
{
  -[SDBonjourBrowser updateServerCacheIfNeeded](self, "updateServerCacheIfNeeded");
  return (NSArray *)-[NSMutableDictionary allValues](self->_serverCache, "allValues");
}

- (void)addService:(id)a3 type:(id)a4 domain:(id)a5 interface:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  __CFString *v11;
  __CFString *v12;
  const void *v13;
  const void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  const __CFURL *v18;
  const __CFURL *v19;
  SDBonjourBrowser *v20;
  id v21;
  const __CFString *v22;
  const __CFString *v23;
  __CFString *v24;
  double Current;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  __CFString *v38;
  void *v39;
  SDAirDropPeerMetric *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  v13 = sub_1000CF14C(v11);
  if (v13)
  {
    v14 = v13;
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_servers, "objectForKeyedSubscript:", v15));

    if (v16)
    {
LABEL_25:
      SFNodeAddBonjourProtocol(v16, v14);

      goto LABEL_26;
    }
    v17 = sub_10019D12C(v12);
    if (self->_isNetBIOS)
    {
      v16 = (void *)SFNodeCreate(0, v15, v15);
      SFNodeAddKind(v16, kSFNodeKindWindows);
      SFNodeSetNetbiosName(v16, v15);
      SFNodeSetWorkgroup(v16, v17);
      v18 = sub_1000CDE00(kSFNodeProtocolSMB, 0, 0, v15, -1, 0, 0, 0);
      if (v18)
      {
        v19 = v18;
        SFNodeSetURL(v16, v18);
        CFRelease(v19);
      }
      v20 = self;
      v21 = v10;
      v22 = v11;
    }
    else
    {
      if (self->_isWorkgroups)
      {
        v16 = (void *)SFNodeCreate(0, v15, v15);
        SFNodeAddKind(v16, kSFNodeKindWorkgroup);
        SFNodeAddWorkgroup(v16, v15);
        goto LABEL_24;
      }
      v16 = (void *)SFNodeCreate(0, v10, v10);
      SFNodeSetServiceName(v16, v10);
      SFNodeSetDomain(v16, v17);
      SFNodeAddKind(v16, kSFNodeKindBonjour);
      v23 = sub_1000CEC14();
      if (CFEqual(v11, v23))
      {
        SFNodeSetDisplayName(v16, &stru_10072FE60);
        SFNodeSetRealName(v16, v15);
        SFNodeAddKind(v16, kSFNodeKindPerson);
        SFNodeAddKind(v16, kSFNodeKindUnknown);
        v24 = (__CFString *)sub_10004DA00(0, 0);
        if (!objc_msgSend(v10, "isEqual:", v24)
          || -[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole"))
        {
          v38 = v24;
          v40 = objc_opt_new(SDAirDropPeerMetric);
          -[SDAirDropPeerMetric setSessionID:](v40, "setSessionID:", self->_browserID);
          objc_setAssociatedObject(v16, CFSTR("SDAirDropPeerMetric"), v40, (void *)0x301);
          Current = CFAbsoluteTimeGetCurrent();
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - self->_startTime));
          -[SDAirDropPeerMetric setBonjourPTRDiscovery:](v40, "setBonjourPTRDiscovery:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
          -[SDAirDropPeerMetric setBonjourTXTRecordDiscovery:](v40, "setBonjourTXTRecordDiscovery:", v27);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropPeerMetric bonjourPTRDiscovery](v40, "bonjourPTRDiscovery"));
          objc_msgSend(v28, "doubleValue");
          v30 = v29;

          v31 = sub_10019AA4C(v6);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v33 = v32;
          if (v32)
            v34 = v32;
          else
            v34 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
          v39 = v34;

          v36 = airdrop_log(v35);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v42 = v10;
            v43 = 2112;
            v44 = v39;
            v45 = 1024;
            v46 = (int)(v30 * 1000.0);
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Bonjour discovered %@ PTR over %@ in %d ms", buf, 0x1Cu);
          }

          -[SDBonjourBrowser startRecordQuery:type:domain:recordType:interface:](self, "startRecordQuery:type:domain:recordType:interface:", v10, v11, v17, 16, v6);
          v24 = v38;
        }

        goto LABEL_24;
      }
      if (CFEqual(v11, CFSTR("_odisk._tcp.")))
      {
        SFNodeAddKind(v16, kSFNodeKindODisk);
        -[SDBonjourBrowser startRecordQuery:type:domain:recordType:interface:](self, "startRecordQuery:type:domain:recordType:interface:", v10, v11, v17, 16, v6);
      }
      if (self->_mode == 1)
        goto LABEL_24;
      v22 = CFSTR("_device-info._tcp.");
      v20 = self;
      v21 = v10;
    }
    -[SDBonjourBrowser startRecordQuery:type:domain:recordType:interface:](v20, "startRecordQuery:type:domain:recordType:interface:", v21, v22, v17, 16, v6);
LABEL_24:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_servers, "setObject:forKeyedSubscript:", v16, v15);
    CFRelease(v17);
    CFRelease(v16);
    goto LABEL_25;
  }
LABEL_26:

}

- (id)queryKey:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6
{
  unsigned int v6;
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  v11 = sub_10019D12C((const __CFString *)a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@%@.%d"), v10, v9, v11, v6));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));
  return v13;
}

- (void)addQueryToDictionary:(_DNSServiceRef_t *)a3 name:(id)a4 type:(id)a5 domain:(id)a6 recordType:(unsigned __int16)a7
{
  uint64_t v7;
  id v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a7;
  v12 = a5;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser queryKey:type:domain:recordType:](self, "queryKey:type:domain:recordType:", a4, v12, a6, v7));
  v13 = objc_opt_new(NSMutableDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", *a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, CFSTR("ServiceRef"));

  LODWORD(v14) = CFEqual(v12, CFSTR("_device-info._tcp."));
  if ((_DWORD)v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "queryRecordTimerCallBack:", v16, 0, 30.0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v15, CFSTR("QueryTimer"));

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dnsQueries, "setObject:forKeyedSubscript:", v13, v16);

}

- (void)startRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6 interface:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t CString;
  uint64_t v19;
  _BOOL4 isAirDrop;
  uint32_t v21;
  DNSServiceFlags v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  DNSServiceRef sdRef;
  char buffer[1009];

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = sub_10019D1FC(v12, v13, v14, 1);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue(v15);
  if (!v17)
  {
    v25 = browser_log(0, v16);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100130778();
    goto LABEL_16;
  }
  bzero(buffer, 0x3F1uLL);
  CString = CFStringGetCString(v17, buffer, 1009, 0x8000100u);
  if (!(_DWORD)CString)
  {
    v27 = browser_log(CString, v19);
    v26 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1001307A4();
    goto LABEL_16;
  }
  sdRef = self->_connection;
  isAirDrop = self->_isAirDrop;
  v21 = -[SDBonjourBrowser getInterface:](self, "getInterface:", v7);
  if (isAirDrop)
    v22 = 1065216;
  else
    v22 = 16640;
  v23 = DNSServiceQueryRecord(&sdRef, v22, v21, buffer, v8, 1u, (DNSServiceQueryRecordReply)sub_10012D4FC, self);
  if ((_DWORD)v23 == -65540)
  {
    v23 = -[SDStatusMonitor enableBugs](self->_monitor, "enableBugs");
    if (!(_DWORD)v23)
      goto LABEL_17;
    goto LABEL_14;
  }
  if ((_DWORD)v23)
  {
LABEL_14:
    v28 = browser_log(v23, v24);
    v26 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1001307D0();
LABEL_16:

    goto LABEL_17;
  }
  -[SDBonjourBrowser addQueryToDictionary:name:type:domain:recordType:](self, "addQueryToDictionary:name:type:domain:recordType:", &sdRef, v12, v13, v14, v8);
LABEL_17:

}

- (void)cleanupRecordQueryForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _DNSServiceRef_t *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_dnsQueries, "objectForKeyedSubscript:"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("QueryTimer")));
    objc_msgSend(v6, "invalidate");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ServiceRef")));
    v8 = (_DNSServiceRef_t *)objc_msgSend(v7, "longValue");

    if (v8)
      DNSServiceRefDeallocate(v8);
    -[NSMutableDictionary removeObjectForKey:](self->_dnsQueries, "removeObjectForKey:", v9);
  }

}

- (void)cleanupRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6
{
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser queryKey:type:domain:recordType:](self, "queryKey:type:domain:recordType:", a3, a4, a5, a6));
  if (v7)
  {
    v8 = v7;
    -[SDBonjourBrowser cleanupRecordQueryForKey:](self, "cleanupRecordQueryForKey:", v7);
    v7 = v8;
  }

}

- (void)cleanupRecordQueryForNetService:(id)a3 recordType:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));

  -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:](self, "cleanupRecordQuery:type:domain:recordType:", v9, v7, v8, v4);
}

- (void)removeService:(id)a3 type:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const void *v13;
  const __CFBag *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_servers, "objectForKeyedSubscript:", v11));

  if (v12)
  {
    if (self->_isNetBIOS)
    {
      -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:](self, "cleanupRecordQuery:type:domain:recordType:", v8, v9, v10, 16);
LABEL_5:
      -[NSMutableDictionary removeObjectForKey:](self->_servers, "removeObjectForKey:", v11);
      goto LABEL_6;
    }
    if (self->_isWorkgroups)
      goto LABEL_5;
    v13 = sub_1000CF14C(v9);
    if (v13)
    {
      SFNodeRemoveBonjourProtocol(v12, v13);
      v14 = (const __CFBag *)SFNodeCopyBonjourProtocols(v12);
      if (!CFBagGetCount(v14))
      {
        if (CFEqual(v9, CFSTR("_odisk._tcp.")))
        {
          -[SDBonjourBrowser ejectDisksIfNeeded:diskNames:](self, "ejectDisksIfNeeded:diskNames:", v8, 0);
          -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:](self, "cleanupRecordQuery:type:domain:recordType:", v8, v9, v10, 16);
        }
        else
        {
          v15 = sub_1000CEC14();
          v16 = CFEqual(v9, v15);
          if ((_DWORD)v16)
          {
            v17 = airdrop_log(v16);
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v20 = 138412290;
              v21 = v8;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Bonjour removed %@", (uint8_t *)&v20, 0xCu);
            }

            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropRequests, "objectForKeyedSubscript:", v11));
            if (v19)
              -[SDBonjourBrowser cleanupAirDropRequest:](self, "cleanupAirDropRequest:", v19);
            -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:](self, "cleanupRecordQuery:type:domain:recordType:", v8, v9, v10, 16);

          }
        }
        -[SDBonjourBrowser cleanupRecordQuery:type:domain:recordType:](self, "cleanupRecordQuery:type:domain:recordType:", v8, CFSTR("_device-info._tcp."), v10, 16);
        -[NSMutableDictionary removeObjectForKey:](self->_servers, "removeObjectForKey:", v11);
      }
      CFRelease(v14);
    }
  }
LABEL_6:

}

- (__SFNode)copyNodeForName:(id)a3
{
  id v4;
  NSMutableDictionary *serverCache;
  void *v6;
  __SFNode *v7;

  v4 = a3;
  -[SDBonjourBrowser updateServerCacheIfNeeded](self, "updateServerCacheIfNeeded");
  serverCache = self->_serverCache;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  v7 = (__SFNode *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](serverCache, "objectForKeyedSubscript:", v6));
  if (v7)
    CFRetain(v7);
  return v7;
}

- (__SFNode)copyNodeForService:(id)a3
{
  NSMutableDictionary *servers;
  void *v4;
  void *v5;
  __SFNode *v6;

  servers = self->_servers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
  v6 = (__SFNode *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](servers, "objectForKeyedSubscript:", v5));

  if (v6)
    CFRetain(v6);
  return v6;
}

- (void)systemInfoChanged:(id)a3 diskInfo:(__CFDictionary *)a4
{
  id v6;
  const __CFString *Value;
  CFNumberRef v8;
  const __CFString *v9;
  const __CFNumber *v10;
  __SFNode *v11;
  uint64_t v12;
  uint64_t valuePtr;

  v6 = a3;
  Value = (const __CFString *)CFDictionaryGetValue(a4, CFSTR("adVF"));
  v8 = sub_10019AC14(0, Value);
  v9 = (const __CFString *)CFDictionaryGetValue(a4, CFSTR("adDT"));
  v10 = sub_10019AC14(0, v9);
  v11 = -[SDBonjourBrowser copyNodeForService:](self, "copyNodeForService:", v6);

  if (v11)
  {
    valuePtr = 0;
    if (v10)
    {
      if (CFNumberGetValue(v10, kCFNumberCFIndexType, &valuePtr))
      {
        v12 = valuePtr;
      }
      else
      {
        v12 = 0;
        valuePtr = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    SFNodeSetSupportedMedia(v11, v12);
    SFNodeSetFlags(v11, v8);
    CFRelease(v11);
  }
  if (v8)
    CFRelease(v8);
  if (v10)
    CFRelease(v10);
}

- (id)colorArrayFromEcolor:(id)a3 icolor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[3];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(",")));
    if (objc_msgSend(v8, "count") == (id)3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
      v10 = objc_msgSend(v9, "intValue");

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
      v12 = objc_msgSend(v11, "intValue");

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 2));
      v14 = objc_msgSend(v13, "intValue");

      v15 = 0;
      if (v10 <= 0xFF
        && (v12 & 0x80000000) == 0
        && (int)v12 <= 255
        && (v14 & 0x80000000) == 0
        && (int)v14 <= 255)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
        v21[0] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
        v21[1] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
        v21[2] = v18;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));

      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      v15 = 0;
      goto LABEL_13;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "integerValue")));
    v20 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  }

LABEL_13:
  return v15;
}

- (void)deviceInfoChanged:(id)a3 model:(id)a4 ecolor:(id)a5 icolor:(id)a6 osxvers:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  __SFNode *v16;
  __SFNode *v17;
  CFNumberRef v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (__CFString *)a7;
  v16 = -[SDBonjourBrowser copyNodeForService:](self, "copyNodeForService:", v19);
  if (v16)
  {
    v17 = v16;
    SFNodeSetModel(v16, v12);
    SFNodeSetColor(v17, -[SDBonjourBrowser colorArrayFromEcolor:icolor:](self, "colorArrayFromEcolor:icolor:", v13, v14));
    v18 = sub_10019AC14(0, v15);
    SFNodeSetFlags(v17, v18);
    if (v18)
      CFRelease(v18);
    CFRelease(v17);
  }
  -[SDBonjourBrowser cleanupRecordQueryForNetService:recordType:](self, "cleanupRecordQueryForNetService:recordType:", v19, 16);

}

- (void)commentChanged:(id)a3 comment:(id)a4
{
  id v6;
  __SFNode *v7;
  __SFNode *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = -[SDBonjourBrowser copyNodeForService:](self, "copyNodeForService:", v9);
  if (v7)
  {
    v8 = v7;
    SFNodeSetSecondaryName(v7, v6);
    CFRelease(v8);
  }
  -[SDBonjourBrowser cleanupRecordQueryForNetService:recordType:](self, "cleanupRecordQueryForNetService:recordType:", v9, 16);

}

- (void)startPictureQuery:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[SDStatusMonitor disablePictureQuery](self->_monitor, "disablePictureQuery"))
  {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    v5 = sub_10019D12C(v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "type"));
    -[SDBonjourBrowser startRecordQuery:type:domain:recordType:interface:](self, "startRecordQuery:type:domain:recordType:interface:", v6, v7, v5, 10, 0);

    CFRelease(v5);
  }

}

- (void)clearCacheAndNotify
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012DF58;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cleanupAirDropRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personID"));
  -[NSMutableDictionary removeObjectForKey:](self->_airDropRequests, "removeObjectForKey:", v5);
  objc_msgSend(v4, "invalidate");

}

- (void)logAirDropDiscoveryInfoForNode:(__SFNode *)a3
{
  id AssociatedObject;
  void *v6;
  __CFString *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double Current;
  double startTime;
  double v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned int v43;
  unsigned int v44;
  double v45;
  unsigned int v46;
  uint8_t buf[4];
  __CFString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  int v56;

  AssociatedObject = objc_getAssociatedObject(a3, CFSTR("SDAirDropPeerMetric"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modelName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "verifiableIdentity"));
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bonjourPTRDiscovery"));
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bonjourTXTRecordDiscovery"));
  objc_msgSend(v13, "doubleValue");
  v45 = v14;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bonjourResolveComplete"));
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tcpConnectionComplete"));
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tlsHandshakeComplete"));
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identityQueryComplete"));
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  Current = CFAbsoluteTimeGetCurrent();
  startTime = self->_startTime;
  v29 = CFAbsoluteTimeGetCurrent() - startTime;
  v31 = (void *)SFNodeCopyRealName(a3, v30);
  v32 = CFSTR("unverifiable");
  v46 = v9;
  if (v9)
    v32 = CFSTR("verifiable");
  v33 = v32;
  v34 = airdrop_log(v33);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountID"));
    *(_DWORD *)buf = 138413315;
    v48 = v33;
    v49 = 2112;
    v50 = v31;
    v51 = 2113;
    v52 = v36;
    v53 = 2113;
    v54 = v7;
    v55 = 1024;
    v56 = (int)(v29 * 1000.0);
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Discovered %@ identity of %@ accountID %{private}@ model %{private}@ in %d ms", buf, 0x30u);

  }
  v37 = (void *)SFNodeCopyServiceName(a3);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlInfoForPeerWithServiceName:](self->_monitor, "awdlInfoForPeerWithServiceName:", v37));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("STATION_AWDL_VERSION")));
  v44 = objc_msgSend(v39, "intValue");

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("STATION_AWDL_PLATFORM")));
  v41 = objc_msgSend(v40, "intValue");

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("STATION_RSSI")));
  v43 = objc_msgSend(v42, "intValue");

  sub_100044BF4((__CFString *)self->_sessionID, (__CFString *)self->_browserID, v7, v46, v44, v41, v43, v12, v45, v17, v20, v23, v26, Current - startTime - v12, v29);
}

+ (void)updateFriendRPIdentityForAccountID:(id)a3 withAirDropClientInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  id inited;
  uint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *val;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id location;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  _QWORD v58[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v5, "length"))
  {
    v58[0] = CNContactEmailAddressesKey;
    v58[1] = CNContactPhoneNumbersKey;
    v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 2));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactsWithPhoneNumberOrEmail:keys:", v5, v8));
    if (objc_msgSend(v9, "count"))
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v10 = v9;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v50;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            v15 = objc_msgSend(v7, "contactIsBlocked:", v14);
            if ((_DWORD)v15)
            {
              v25 = airdrop_log(v15);
              v26 = objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                v55 = v14;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Skipped RPIdentity update because contact %{private}@ is blocked", buf, 0xCu);
              }

              goto LABEL_37;
            }
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
          if (v11)
            continue;
          break;
        }
      }

      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactWithPreferredIdentifierForContacts:", v10));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSFOperationReceiverDeviceIRKDataKey));
      if (v44)
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSFOperationReceiverEdPKDataKey));
        if (v16)
        {
          v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSFOperationReceiverIDSDeviceIDKey));
          if (v43)
          {
            v42 = objc_claimAutoreleasedReturnValue(-[NSObject identifier](v10, "identifier"));
            if (v42)
            {
              val = objc_alloc_init((Class)RPClient);
              v17 = objc_alloc_init((Class)RPIdentity);
              objc_msgSend(v17, "setAccountID:", v5);
              objc_msgSend(v17, "setContactID:", v42);
              objc_msgSend(v17, "setDeviceIRKData:", v44);
              objc_msgSend(v17, "setEdPKData:", v16);
              objc_msgSend(v17, "setIdsDeviceID:", v43);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSFOperationSendersKnownAliasKey));
              objc_msgSend(v17, "setSendersKnownAlias:", v18);

              objc_msgSend(v17, "setType:", 6);
              location = 0;
              inited = objc_initWeak(&location, val);
              v20 = airdrop_log(inited);
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 141558275;
                v55 = 1752392040;
                v56 = 2113;
                v57 = v5;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Updating RPIdentity for %{private, mask.hash}@", buf, 0x16u);
              }

              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_10012E970;
              v45[3] = &unk_1007182A0;
              v22 = v17;
              v46 = v22;
              objc_copyWeak(&v47, &location);
              -[NSObject addOrUpdateIdentity:completion:](val, "addOrUpdateIdentity:completion:", v22, v45);
              objc_destroyWeak(&v47);

              objc_destroyWeak(&location);
              v23 = val;
            }
            else
            {
              v33 = airdrop_log(0);
              v34 = objc_claimAutoreleasedReturnValue(v33);
              v23 = v34;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                sub_10013085C((uint64_t)v10, v34, v35, v36, v37, v38, v39, v40);
                v23 = v34;
              }
            }

            v32 = v42;
          }
          else
          {
            v31 = airdrop_log(0);
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 141558275;
              v55 = 1752392040;
              v56 = 2113;
              v57 = v5;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Didn't update RPIdentity because idsDeviceID is missing for %{private, mask.hash}@", buf, 0x16u);
            }
          }

          v30 = v43;
        }
        else
        {
          v29 = airdrop_log(0);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141558275;
            v55 = 1752392040;
            v56 = 2113;
            v57 = v5;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Didn't update RPIdentity because edPKData is missing for %{private, mask.hash}@", buf, 0x16u);
          }
        }

      }
      else
      {
        v28 = airdrop_log(0);
        v16 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 141558275;
          v55 = 1752392040;
          v56 = 2113;
          v57 = v5;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Didn't update RPIdentity because deviceIRKData is missing for %{private, mask.hash}@", buf, 0x16u);
        }
      }

    }
    else
    {
      v27 = airdrop_log(0);
      v10 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558275;
        v55 = 1752392040;
        v56 = 2113;
        v57 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to update RPIdentity because there are no contacts for %{private, mask.hash}@", buf, 0x16u);
      }
    }
LABEL_37:

  }
  else
  {
    v24 = airdrop_log(0);
    v8 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100130830();
  }

}

- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __SecTrust *v15;
  __SecTrust *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id AssociatedObject;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;

  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_servers, "objectForKeyedSubscript:", v11));

  switch(a4)
  {
    case 4:
    case 10:
      goto LABEL_20;
    case 5:
      break;
    case 9:
      if (v12)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationReceiverMediaCapabilitiesKey));
        if (v14)
          SFNodeSetMediaCapabilities(v12, v14);
        v15 = (__SecTrust *)objc_msgSend(v9, "secTrustRef");
        if (v15)
        {
          v16 = v15;
          v36 = v14;
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationReceiverRecordDataKey));
          v18 = sub_10004FF2C(v17, v16, (uint64_t)v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationReceiverModelNameKey));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationReceiverComputerNameKey));
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationReceiverIDSDeviceIDKey));
          SFNodeSetModel(v12, v20);
          SFNodeSetComputerName(v12, v21);
          v34 = (void *)v22;
          v23 = SFNodeSetIDSDeviceIdentifier(v12, v22);
          v35 = (void *)v20;
          if (v21)
          {
            AssociatedObject = objc_getAssociatedObject(v12, CFSTR("SDAirDropPeerMetric"));
            v25 = objc_claimAutoreleasedReturnValue(AssociatedObject);
            -[NSObject setModelName:](v25, "setModelName:", v20);
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19 != 0));
            -[NSObject setVerifiableIdentity:](v25, "setVerifiableIdentity:", v26);

            -[NSObject setAccountID:](v25, "setAccountID:", v19);
            -[SDBonjourBrowser logAirDropDiscoveryInfoForNode:](self, "logAirDropDiscoveryInfoForNode:", v12);
            -[NSMutableSet addObject:](self->_discoveredPeers, "addObject:", v11);
          }
          else
          {
            v30 = airdrop_log(v23);
            v25 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v11;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Identity discovery denied for %@", buf, 0xCu);
            }
          }

          v14 = v36;
          if (v19 && (sub_10004E26C((uint64_t)v12) & 1) == 0)
            +[SDBonjourBrowser updateFriendRPIdentityForAccountID:withAirDropClientInfo:](SDBonjourBrowser, "updateFriendRPIdentityForAccountID:withAirDropClientInfo:", v19, v10);
          -[SDBonjourBrowser startIdentityQueryForNode:](self, "startIdentityQueryForNode:", v12);

        }
        else
        {
          v29 = airdrop_log(0);
          v17 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_100130934();
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser nodes](self, "nodes"));
        sub_10004EA58((uint64_t)v12, v31, self->_iconCache, -[SDBonjourBrowser preferVibrantIcons](self, "preferVibrantIcons"));

        -[SDBonjourBrowser clearCache](self, "clearCache");
        -[SDBonjourBrowser notifyClient](self, "notifyClient");

      }
LABEL_20:
      -[SDBonjourBrowser cleanupAirDropRequest:](self, "cleanupAirDropRequest:", v9);
      break;
    default:
      v27 = airdrop_log(v13);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v32 = NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        *(_DWORD *)buf = 138413058;
        v38 = v33;
        v39 = 2112;
        v40 = sub_10012EE5C(a4);
        v41 = 1024;
        v42 = a4;
        v43 = 2112;
        v44 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@: UNHANDLED EVENT %@ [%d] %@", buf, 0x26u);

      }
      break;
  }

}

- (void)startAirDropRequestForNode:(__SFNode *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SDAirDropClient *v9;
  uint64_t v10;

  v10 = SFNodeCopyEmailHash(a3);
  v6 = SFNodeCopyPhoneHash(a3);
  if (!(v10 | v6))
  {
    v7 = (void *)SFNodeCopyRealName(a3, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropRequests, "objectForKeyedSubscript:", v7));

    if (!v8)
    {
      v9 = -[SDAirDropClient initWithPerson:items:forDiscovery:]([SDAirDropClient alloc], "initWithPerson:items:forDiscovery:", a3, 0, 1);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_airDropRequests, "setObject:forKeyedSubscript:", v9, v7);
      -[SDAirDropClient setDelegate:](v9, "setDelegate:", self);
      -[SDAirDropClient activate](v9, "activate");

    }
  }

}

- (void)cancelAirDropRequests
{
  NSMutableDictionary *airDropRequests;
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

  airDropRequests = self->_airDropRequests;
  if (airDropRequests)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](airDropRequests, "allValues"));
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "invalidate");
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    -[NSMutableDictionary removeAllObjects](self->_airDropRequests, "removeAllObjects");

  }
}

- (void)personInfoChanged:(id)a3 flags:(id)a4 atag:(id)a5 cname:(id)a6 phash:(id)a7 ehash:(id)a8 nhash:(id)a9
{
  id v12;
  __CFString *v13;
  id v14;
  __SFNode *v15;
  __SFNode *v16;
  CFNumberRef v17;
  CFNumberRef v18;
  id AssociatedObject;
  void *v20;
  double Current;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  double v28;
  int v29;
  void *v30;
  __int16 v31;
  int v32;

  v12 = a3;
  v13 = (__CFString *)a4;
  v14 = a5;
  v15 = -[SDBonjourBrowser copyNodeForService:](self, "copyNodeForService:", v12);
  if (v15)
  {
    v16 = v15;
    v17 = sub_10019AC14(0, v13);
    if (v17)
    {
      v18 = v17;
      SFNodeSetFlags(v16, v17);
      CFRelease(v18);
    }
    if (-[SDStatusMonitor enableStrangers](self->_monitor, "enableStrangers"))
      SFNodeSetUserName(v16, v14);
    AssociatedObject = objc_getAssociatedObject(v16, CFSTR("SDAirDropPeerMetric"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    Current = CFAbsoluteTimeGetCurrent();
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bonjourTXTRecordDiscovery"));
    objc_msgSend(v22, "doubleValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - v23));

    v25 = airdrop_log(objc_msgSend(v20, "setBonjourTXTRecordDiscovery:", v24));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      objc_msgSend(v24, "doubleValue");
      v29 = 138412546;
      v30 = v27;
      v31 = 1024;
      v32 = (int)(v28 * 1000.0);
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Bonjour discovered %@ TXT record in %d ms", (uint8_t *)&v29, 0x12u);

    }
    -[SDBonjourBrowser startAirDropRequestForNode:](self, "startAirDropRequestForNode:", v16);
    CFRelease(v16);

  }
}

- (void)handleIdentity:(id)a3 withQueryID:(id)a4 emailOrPhone:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const void *Value;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    v15 = airdrop_log(v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100130960((uint64_t)v12, (uint64_t)v14, v16);

    CFDictionaryRemoveValue(self->_identityQueries, v11);
  }
  else
  {
    Value = CFDictionaryGetValue(self->_identityQueries, v11);
    if (Value)
    {
      v18 = (uint64_t)Value;
      v19 = (void *)SFNodeCopyAppleID(Value);
      if (v19)
        v20 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor verifiedIdentityForAppleID:](self->_monitor, "verifiedIdentityForAppleID:", v19));
      else
        v20 = 0;
      v21 = v10;
      if (v20 != v21 && (objc_msgSend(v20, "isEqual:", v21) & 1) == 0)
      {
        if (v21)
        {
          -[SDStatusMonitor cacheIdentity:](self->_monitor, "cacheIdentity:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "emailOrPhone"));
          SFNodeSetAppleID(v18, v22);

        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser nodes](self, "nodes"));
        sub_10004EA58(v18, v23, self->_iconCache, -[SDBonjourBrowser preferVibrantIcons](self, "preferVibrantIcons"));

        -[SDBonjourBrowser clearCacheAndNotify](self, "clearCacheAndNotify");
      }
      CFDictionaryRemoveValue(self->_identityQueries, v11);

    }
  }

}

- (void)startIdentityQueryForNode:(__SFNode *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v5 = SFNodeCopyEmailHash(a3);
  v6 = SFNodeCopyPhoneHash(a3);
  if (v5 | v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor emailOrPhoneForEmailHash:phoneHash:](self->_monitor, "emailOrPhoneForEmailHash:phoneHash:", v5, v6));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor verifiedIdentityForAppleID:](self->_monitor, "verifiedIdentityForAppleID:", v7));
      if (v8)
      {
        SFNodeSetAppleID(a3, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser nodes](self, "nodes"));
        sub_10004EA58((uint64_t)a3, v9, self->_iconCache, -[SDBonjourBrowser preferVibrantIcons](self, "preferVibrantIcons"));

        -[SDBonjourBrowser clearCacheAndNotify](self, "clearCacheAndNotify");
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

        CFDictionarySetValue(self->_identityQueries, v11, a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10012F5C0;
        v14[3] = &unk_1007182C8;
        v14[4] = self;
        v15 = v11;
        v16 = v7;
        v13 = v11;
        objc_msgSend(v12, "verifiedIdentityForEmailOrPhone:completion:", v16, v14);

      }
    }
    else
    {
      SFNodeSetAppleID(a3, 0);
    }

  }
  else
  {
    SFNodeSetAppleID(a3, 0);
  }

}

- (void)cancelIdentityQueries
{
  __CFDictionary *identityQueries;

  identityQueries = self->_identityQueries;
  if (identityQueries)
    CFDictionaryRemoveAllValues(identityQueries);
}

- (void)contactsChanged:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self->_startTime != 0.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      -[SDBonjourBrowser cancelIdentityQueries](self, "cancelIdentityQueries");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_servers, "allValues"));
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
            -[SDBonjourBrowser startIdentityQueryForNode:](self, "startIdentityQueryForNode:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser nodes](self, "nodes"));
            sub_10004EA58(v10, v11, self->_iconCache, -[SDBonjourBrowser preferVibrantIcons](self, "preferVibrantIcons"));

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }
      -[SDBonjourBrowser clearCacheAndNotify](self, "clearCacheAndNotify");

    }
  }
}

- (void)airDropPublished:(id)a3
{
  -[SDBonjourBrowser updateBrowserState](self, "updateBrowserState", a3);
}

- (void)lockStatusChanged:(id)a3
{
  -[SDBonjourBrowser updateBrowserState](self, "updateBrowserState", a3);
}

- (void)consoleUserChanged:(id)a3
{
  -[SDBonjourBrowser updateBrowserState](self, "updateBrowserState", a3);
}

- (void)screenStatusChanged:(id)a3
{
  -[SDBonjourBrowser updateBrowserState](self, "updateBrowserState", a3);
}

- (void)somethingChanged:(id)a3
{
  -[SDBonjourBrowser restartAfterDelay:](self, "restartAfterDelay:", a3, 1.0);
}

- (void)wirelessPowerChanged:(id)a3
{
  -[SDBonjourBrowser restartAfterDelay:](self, "restartAfterDelay:", a3, 0.25);
}

- (void)linkStateChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = airdrop_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AWDL link state changed", v6, 2u);
  }

  -[SDBonjourBrowser restartAfterDelay:](self, "restartAfterDelay:", 1.0);
}

- (void)notifyClient
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "bonjourNodesDidChange:", self);

}

- (void)notifyClientIfDone:(unsigned int)a3
{
  char v3;

  v3 = a3;
  -[SDBonjourBrowser clearCache](self, "clearCache");
  if ((v3 & 1) == 0 || self->_isAirDrop)
    -[SDBonjourBrowser notifyClient](self, "notifyClient");
}

- (BOOL)validAirDropInterface:(unsigned int)a3
{
  if (self->_awdlIndex == a3 || -[SDStatusMonitor browseAllInterfaces](self->_monitor, "browseAllInterfaces"))
    return 1;
  if (a3)
    return 0;
  return -[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole");
}

- (void)handleBrowseCallBack:(unsigned int)a3 interface:(unsigned int)a4 error:(int)a5 name:(const char *)a6 type:(const char *)a7 domain:(const char *)a8
{
  uint64_t v9;
  NSObject *v10;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  __CFString *v19;

  if (a5)
  {
    v9 = browser_log(self, a2);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001309F8();

    -[SDBonjourBrowser restartAfterDelay:](self, "restartAfterDelay:", 2.0);
  }
  else
  {
    v13 = *(_QWORD *)&a4;
    v14 = *(_QWORD *)&a3;
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a7));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a8));
    if (v19)
      v17 = v15 == 0;
    else
      v17 = 1;
    v18 = v17 || v16 == 0;
    if (!v18
      && (!self->_isAirDrop
       || sub_10005009C(v19)
       && -[SDBonjourBrowser validAirDropInterface:](self, "validAirDropInterface:", v13)))
    {
      if ((v14 & 2) != 0)
        -[SDBonjourBrowser addService:type:domain:interface:](self, "addService:type:domain:interface:", v19, v15, v16, v13);
      else
        -[SDBonjourBrowser removeService:type:domain:](self, "removeService:type:domain:", v19, v15, v16);
    }
    -[SDBonjourBrowser notifyClientIfDone:](self, "notifyClientIfDone:", v14);

  }
}

- (id)odiskMountPoints:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor odiskMountPointsForServer:](self->_monitor, "odiskMountPointsForServer:", v4));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = sub_10019C9C8(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if (v13)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)serviceFromServiceName:(id)a3
{
  __CFNetService *v3;
  __CFNetService *v4;
  CFStringRef Name;
  void *v6;
  CFStringRef Type;
  void *v8;
  CFStringRef Domain;
  void *v10;
  id v11;

  v3 = (__CFNetService *)_CFNetServiceCreateFromServiceName(0, a3);
  if (v3)
  {
    v4 = v3;
    Name = CFNetServiceGetName(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(Name);
    Type = CFNetServiceGetType(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(Type);
    Domain = CFNetServiceGetDomain(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(Domain);
    v11 = objc_msgSend(objc_alloc((Class)NSNetService), "initWithDomain:type:name:", v10, v8, v6);
    CFRelease(v4);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)valueForKey:(id)a3 inTXTRecord:(const void *)a4 withLength:(unsigned __int16)a5
{
  id ValuePtr;
  id v6;
  id v7;
  uint8_t valueLen;

  valueLen = 0;
  ValuePtr = (id)TXTRecordGetValuePtr(a5, a4, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &valueLen);
  if (ValuePtr)
  {
    v6 = ValuePtr;
    v7 = objc_alloc((Class)NSString);
    ValuePtr = objc_msgSend(v7, "initWithBytes:length:encoding:", v6, valueLen, 4);
  }
  return ValuePtr;
}

- (void)processTXTRecordUpdate:(const char *)a3 rdlen:(unsigned __int16)a4 rdata:(const void *)a5
{
  uint64_t v6;
  _UNKNOWN **v8;
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
  unsigned int Count;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CFDictionary *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableSet *v29;
  uint8_t valueLen;
  void *value;
  char key[16];
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
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v6 = a4;
  v8 = NSLocale_ptr;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser serviceFromServiceName:](self, "serviceFromServiceName:", v9));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type"));
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("_device-info._tcp.")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("model"), a5, v6));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("osxvers"), a5, v6));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("ecolor"), a5, v6));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("icolor"), a5, v6));
      -[SDBonjourBrowser deviceInfoChanged:model:ecolor:icolor:osxvers:](self, "deviceInfoChanged:model:ecolor:icolor:osxvers:", v10, v12, v14, v15, v13);

    }
    else
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("_netbios._udp.")))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("comment"), a5, v6));
        -[SDBonjourBrowser commentChanged:comment:](self, "commentChanged:comment:", v10, v16);

        goto LABEL_23;
      }
      if (!objc_msgSend(v11, "isEqualToString:", sub_1000CEC14()))
      {
        v28 = v11;
        Count = TXTRecordGetCount(v6, a5);
        v29 = objc_opt_new(NSMutableSet);
        if (Count)
        {
          v21 = 0;
          v22 = Count;
          do
          {
            value = 0;
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            *(_OWORD *)key = 0u;
            v33 = 0u;
            valueLen = 0;
            if (!TXTRecordGetItemAtIndex(v6, a5, v21, 0x100u, key, &valueLen, (const void **)&value))
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[26], "stringWithUTF8String:", key));
              if (v23)
              {
                v24 = sub_10019D474(valueLen, (const UInt8 *)value);
                v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                if (v25)
                {
                  if (objc_msgSend(v23, "isEqual:", CFSTR("sys")))
                  {
                    -[SDBonjourBrowser systemInfoChanged:diskInfo:](self, "systemInfoChanged:diskInfo:", v10, v25);
                  }
                  else
                  {
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("adVN")));
                    if (v26)
                      -[NSMutableSet addObject:](v29, "addObject:", v26);

                  }
                }

                v8 = NSLocale_ptr;
              }

            }
            ++v21;
          }
          while (v22 != v21);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        -[SDBonjourBrowser ejectDisksIfNeeded:diskNames:](self, "ejectDisksIfNeeded:diskNames:", v27, v29);

        v11 = v28;
        goto LABEL_23;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("flags"), a5, v6));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("atag"), a5, v6));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("ehash"), a5, v6));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("nhash"), a5, v6));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("phash"), a5, v6));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDBonjourBrowser valueForKey:inTXTRecord:withLength:](self, "valueForKey:inTXTRecord:withLength:", CFSTR("cname"), a5, v6));
      -[SDBonjourBrowser personInfoChanged:flags:atag:cname:phash:ehash:nhash:](self, "personInfoChanged:flags:atag:cname:phash:ehash:nhash:", v10, v12, v13, v19, v18, v14, v17);

    }
LABEL_23:

  }
}

- (void)handleQueryCallBack:(unsigned int)a3 error:(int)a4 fullname:(const char *)a5 rrtype:(unsigned __int16)a6 rdlen:(unsigned __int16)a7 rdata:(const void *)a8
{
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;

  if (a4)
  {
    v8 = browser_log(self, a2);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100130AB8();

  }
  else
  {
    v10 = *(_QWORD *)&a3;
    if ((a3 & 2) != 0)
    {
      if (a6 == 16)
      {
        -[SDBonjourBrowser processTXTRecordUpdate:rdlen:rdata:](self, "processTXTRecordUpdate:rdlen:rdata:", a5, a7, a8);
      }
      else
      {
        v12 = browser_log(self, a2);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_100130A58();

      }
    }
    -[SDBonjourBrowser notifyClientIfDone:](self, "notifyClientIfDone:", v10);
  }
}

- (void)queryRecordTimerCallBack:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  -[SDBonjourBrowser cleanupRecordQueryForKey:](self, "cleanupRecordQueryForKey:", v4);

}

- (void)restartAfterDelay:(double)a3
{
  id v4;

  if (self->_startCalled)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
    -[NSTimer setFireDate:](self->_restartTimer, "setFireDate:", v4);

  }
}

- (NSString)description
{
  id v3;
  id v4;
  unint64_t mode;
  const __CFString *v6;
  id v7;
  const char *v8;
  id v9;
  WPAWDL *proximity;
  unint64_t v11;
  const char *v12;
  id v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v19 = 0;
  NSAppendPrintF(&v19, "BonjourBrowser\n");
  v3 = v19;
  v18 = v3;
  NSAppendPrintF(&v18, "--------------\n");
  v4 = v18;

  v17 = v4;
  mode = self->_mode;
  if (mode > 2)
    v6 = CFSTR("?");
  else
    v6 = (const __CFString *)*((_QWORD *)&off_100718380 + mode);
  NSAppendPrintF(&v17, "Mode:                                %@\n", v6);
  v7 = v17;

  v16 = v7;
  if (self->_proximity)
    v8 = "yes";
  else
    v8 = "no";
  NSAppendPrintF(&v16, "WirelessProx object:                 %s\n", v8);
  v9 = v16;

  proximity = self->_proximity;
  if (proximity)
  {
    v15 = v9;
    v11 = (unint64_t)-[WPAWDL state](proximity, "state");
    if (v11 > 5)
      v12 = "?";
    else
      v12 = off_100718398[v11];
    NSAppendPrintF(&v15, "WirelessProx state:                  %s\n", v12);
    v13 = v15;

    v9 = v13;
  }
  return (NSString *)v9;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)objc_loadWeakRetained((id *)&self->_helperConnection);
}

- (void)setHelperConnection:(id)a3
{
  objc_storeWeak((id *)&self->_helperConnection, a3);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSArray)types
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (SDBonjourBrowserDelegate)delegate
{
  return (SDBonjourBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 152, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (int)transfersInitiated
{
  return self->_transfersInitiated;
}

- (void)setTransfersInitiated:(int)a3
{
  self->_transfersInitiated = a3;
}

- (int)transfersCompleted
{
  return self->_transfersCompleted;
}

- (void)setTransfersCompleted:(int)a3
{
  self->_transfersCompleted = a3;
}

- (BOOL)startCalled
{
  return self->_startCalled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_types, 0);
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_storeStrong((id *)&self->_airDropRequests, 0);
  objc_storeStrong((id *)&self->_serverCache, 0);
  objc_storeStrong((id *)&self->_dnsQueries, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_servers, 0);
  objc_storeStrong((id *)&self->_discoveredPeers, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_restartTimer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_browserID, 0);
  objc_storeStrong((id *)&self->_isFinder, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_proximity, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
