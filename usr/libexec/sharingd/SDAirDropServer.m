@implementation SDAirDropServer

- (SDAirDropServer)init
{
  SDAirDropServer *v2;
  SDAirDropServer *v3;
  WPAWDL *proximity;
  NSTimer *awdlTimer;
  SDAirDropPublisher *publisher;
  CUCoalescer *coalescer;
  NSNumber *portNumber;
  SDAirDropInformation *information;
  OS_os_transaction *transaction;
  NSTimer *bluetoothTimer;
  NSMutableSet *v12;
  NSMutableSet *discoveredHashes;
  NSMutableDictionary *v14;
  NSMutableDictionary *properties;
  uint64_t v16;
  SDStatusMonitor *monitor;
  uint64_t v18;
  NSString *discoverableMode;
  NSUUID *scanningIdentifier;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  __int16 v25[8];
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SDAirDropServer;
  v2 = -[SDAirDropServer init](&v26, "init");
  v3 = v2;
  if (v2)
  {
    v2->_identity = 0;
    v2->_server = 0;
    v2->_startTime = 0.0;
    proximity = v2->_proximity;
    v2->_proximity = 0;

    awdlTimer = v3->_awdlTimer;
    v3->_awdlTimer = 0;

    publisher = v3->_publisher;
    v3->_publisher = 0;

    coalescer = v3->_coalescer;
    v3->_coalescer = 0;

    portNumber = v3->_portNumber;
    v3->_portNumber = 0;

    information = v3->_information;
    v3->_information = 0;

    transaction = v3->_transaction;
    v3->_transaction = 0;

    v3->_contactsOnly = 0;
    bluetoothTimer = v3->_bluetoothTimer;
    v3->_bluetoothTimer = 0;

    objc_storeStrong((id *)&v3->_queue, &_dispatch_main_q);
    v12 = objc_opt_new(NSMutableSet);
    discoveredHashes = v3->_discoveredHashes;
    v3->_discoveredHashes = v12;

    v14 = objc_opt_new(NSMutableDictionary);
    properties = v3->_properties;
    v3->_properties = v14;

    v16 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v16;

    v3->_screenOn = -[SDStatusMonitor screenOn](v3->_monitor, "screenOn");
    v18 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](v3->_monitor, "discoverableMode"));
    discoverableMode = v3->_discoverableMode;
    v3->_discoverableMode = (NSString *)v18;

    v3->_connections = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    scanningIdentifier = v3->_scanningIdentifier;
    v3->_scanningIdentifier = 0;

    v22 = airdrop_log(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AirDrop server initialized", (uint8_t *)v25, 2u);
    }

  }
  return v3;
}

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;

  CFRelease(self->_connections);
  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropServer;
  -[SDAirDropServer dealloc](&v4, "dealloc");
}

- (void)handleTerminalCallBack
{
  uint64_t v3;
  NSObject *v4;
  _CFHTTPServer *server;
  NSNumber *portNumber;
  SDAirDropPublisher *publisher;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = airdrop_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AirDrop server invalidation complete", buf, 2u);
  }

  server = self->_server;
  if (server)
  {
    CFRelease(server);
    self->_server = 0;
  }
  portNumber = self->_portNumber;
  self->_portNumber = 0;

  if (self->_publisher)
  {
    sub_100045388((uint64_t)CFSTR("BonjourAdvertise"), (uint64_t)CFSTR("Stop"), (uint64_t)self->_clientBundleID, self->_clientPid);
    -[SDAirDropPublisher setDelegate:](self->_publisher, "setDelegate:", 0);
    -[SDAirDropPublisher invalidate](self->_publisher, "invalidate");
    publisher = self->_publisher;
    self->_publisher = 0;

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B479C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startTimers
{
  NSTimer *v3;
  NSTimer *awdlTimer;
  NSTimer *v5;
  NSTimer *bluetoothTimer;

  if (!CFDictionaryGetCount(self->_connections))
  {
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "awdlTimeoutFired:", 0, 0, 20.0));
    awdlTimer = self->_awdlTimer;
    self->_awdlTimer = v3;

    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "bluetoothTimeoutFired:", 0, 0, 15.0));
    bluetoothTimer = self->_bluetoothTimer;
    self->_bluetoothTimer = v5;

  }
}

- (void)invalidateTimers
{
  NSTimer *awdlTimer;
  NSTimer *v4;
  NSTimer *bluetoothTimer;
  NSTimer *v6;

  awdlTimer = self->_awdlTimer;
  if (awdlTimer)
  {
    -[NSTimer invalidate](awdlTimer, "invalidate");
    v4 = self->_awdlTimer;
    self->_awdlTimer = 0;

  }
  bluetoothTimer = self->_bluetoothTimer;
  if (bluetoothTimer)
  {
    -[NSTimer invalidate](bluetoothTimer, "invalidate");
    v6 = self->_bluetoothTimer;
    self->_bluetoothTimer = 0;

  }
}

- (void)didOpenConnection:(_CFHTTPServerConnection *)a3
{
  uint64_t v5;
  NSObject *v6;
  __CFDictionary *Mutable;
  const void *v8;
  void *v9;
  SDAirDropServer *v10;
  SDAirDropServer *v11;
  int v12;
  _CFHTTPServerConnection *v13;

  v5 = airdrop_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New AirDrop connection %p", (uint8_t *)&v12, 0xCu);
  }

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v8 = (const void *)kSFOperationContactsOnlyKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_contactsOnly));
  CFDictionarySetValue(Mutable, v8, v9);

  CFDictionarySetValue(Mutable, kSFOperationHTTPServerConnectionKey, a3);
  CFDictionarySetValue(self->_connections, a3, a3);
  v10 = (SDAirDropServer *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor finderServer](self->_monitor, "finderServer"));
  v11 = v10;
  if (!v10)
    v10 = self;
  -[SDAirDropServer notifyClient:withResults:](v10, "notifyClient:withResults:", 1, Mutable);
  -[SDAirDropServer invalidateTimers](self, "invalidateTimers");
  CFRelease(Mutable);

}

- (void)didCloseConnection:(_CFHTTPServerConnection *)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  int v12;
  _CFHTTPServerConnection *v13;

  v5 = airdrop_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Closed AirDrop connection %p", (uint8_t *)&v12, 0xCu);
  }

  v7 = sub_10004DFE4(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "didCloseConnection");
  CFDictionaryRemoveValue(self->_connections, a3);
  if (!-[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole")
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser")),
        v11 = objc_msgSend(v10, "isAirDropEnabled"),
        v10,
        (v11 & 1) == 0))
  {
    -[SDAirDropServer startTimers](self, "startTimers");
  }

}

- (void)didReceiveError:(__CFError *)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFErrorDomain Domain;
  int v14;
  CFIndex Code;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint8_t v20[8];
  uint64_t v21;
  __CFError *v22;

  v5 = airdrop_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000B73F8((uint64_t)a3, v6, v7, v8, v9, v10, v11, v12);

  -[SDAirDropServer handleTerminalCallBack](self, "handleTerminalCallBack");
  Domain = CFErrorGetDomain(a3);
  v14 = CFEqual(Domain, _kCFHTTPServerErrorDomain);
  Code = CFErrorGetCode(a3);
  if ((v14 && Code == 1002 || CFErrorGetCode(a3) == 48)
    && (v16 = -[NSNumber isEqual:](self->_portNumber, "isEqual:", &off_10074B5C8), (_DWORD)v16))
  {
    v17 = airdrop_log(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Trying again with random port number", v20, 2u);
    }

    -[SDAirDropServer startHTTPServer:](self, "startHTTPServer:", 0);
  }
  else
  {
    v21 = kSFOperationErrorKey;
    v22 = a3;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    -[SDAirDropServer notifyClient:withResults:](self, "notifyClient:withResults:", 10, v19);

  }
}

- (void)publishedInfoChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (self->_startTime != 0.0)
  {
    v12 = v4;
    if (objc_msgSend(v4, "count"))
    {
      -[NSMutableDictionary removeAllObjects](self->_properties, "removeAllObjects");
      -[NSMutableDictionary addEntriesFromDictionary:](self->_properties, "addEntriesFromDictionary:", v12);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSFOperationLegacyDeviceKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor wirelessCarPlay](self->_monitor, "wirelessCarPlay")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v5, kSFOperationWirelessCarPlayKey);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v6, kSFOperationWirelessEnabledKey);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor bluetoothEnabled](self->_monitor, "bluetoothEnabled")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v7, kSFOperationBluetoothEnabledKey);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor airplaneModeEnabled](self->_monitor, "airplaneModeEnabled")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v8, kSFOperationAirplaneModeEnabledKey);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[SDStatusMonitor ultraWideBandState](self->_monitor, "ultraWideBandState")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v9, kSFOperationUltraWideBandEnabledKey);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor computerToComputer](self->_monitor, "computerToComputer")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v10, kSFOperationComputerToComputerKey);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor wirelessAccessPoint](self->_monitor, "wirelessAccessPoint")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v11, kSFOperationWirelessAccessPointKey);

    -[SDAirDropServer notifyClient:withResults:](self, "notifyClient:withResults:", 12, self->_properties);
    v4 = v12;
  }

}

- (void)awdlTimeoutFired:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = airdrop_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AirDrop server idle timeout", v6, 2u);
  }

  -[SDAirDropServer stop](self, "stop");
  -[SDAirDropServer updateServerState](self, "updateServerState");
}

- (void)wirelessChanged:(id)a3
{
  -[SDAirDropServer publishedInfoChanged:](self, "publishedInfoChanged:", 0);
}

- (void)bluetoothChanged:(id)a3
{
  -[SDAirDropServer publishedInfoChanged:](self, "publishedInfoChanged:", 0);
}

- (void)airDropStatusChanged:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3))
  {
    v4 = -[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole");
    if (v4)
    {
      v5 = airdrop_log(v4);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AirDrop status changed", v7, 2u);
      }

      -[CUCoalescer trigger](self->_coalescer, "trigger");
    }
  }
}

- (void)appleIDAccountInfoChanged:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3);
  if (!v4)
  {
    v5 = airdrop_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Apple ID account info changed", v7, 2u);
    }

    -[CUCoalescer trigger](self->_coalescer, "trigger");
  }
}

- (void)appleIDChanged:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3);
  if (!v4)
  {
    v5 = airdrop_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Apple ID account changed", v7, 2u);
    }

    -[CUCoalescer trigger](self->_coalescer, "trigger");
  }
}

- (void)systemWillSleep:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];

  v4 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3);
  if (!v4 && self->_startTime != 0.0)
  {
    v5 = airdrop_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = getuid();
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping AirDrop server for user %d on sleep", (uint8_t *)v7, 8u);
    }

    -[SDAirDropServer stop](self, "stop");
  }
}

- (void)systemHasPoweredOn:(id)a3
{
  id WeakRetained;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _DWORD v10[2];

  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3) && self->_startTime == 0.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser");

      if (v6)
      {
        v8 = airdrop_log(v7);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10[0] = 67109120;
          v10[1] = getuid();
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting AirDrop server for user %d on wake", (uint8_t *)v10, 8u);
        }

        -[SDAirDropServer start](self, "start");
      }
    }
  }
}

- (void)consoleUserChanged:(id)a3
{
  _BOOL8 v4;
  double startTime;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uid_t v13;

  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3))
  {
    v4 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser");
    startTime = self->_startTime;
    if (v4)
    {
      if (startTime == 0.0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

        if (WeakRetained)
        {
          v8 = airdrop_log(v7);
          v9 = objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v12 = 67109120;
            v13 = getuid();
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting AirDrop server for user %d on login", (uint8_t *)&v12, 8u);
          }

          -[SDAirDropServer start](self, "start");
        }
      }
    }
    else if (startTime != 0.0)
    {
      v10 = airdrop_log(v4);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 67109120;
        v13 = getuid();
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Stopping AirDrop server for user %d on logout", (uint8_t *)&v12, 8u);
      }

      -[SDAirDropServer stop](self, "stop");
    }
  }
}

- (void)finderAirDropEnabled:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;

  v4 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3);
  if (!v4)
  {
    v5 = airdrop_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[SDStatusMonitor finderAirDropEnabled](self->_monitor, "finderAirDropEnabled");
      v8 = CFSTR("exited");
      if (v7)
        v8 = CFSTR("entered");
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finder %@ AirDrop", (uint8_t *)&v9, 0xCu);
    }

    -[CUCoalescer trigger](self->_coalescer, "trigger");
  }
}

- (void)discoverableModeChanged:(id)a3
{
  NSString *v4;
  NSString *discoverableMode;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSString *v9;
  int v10;
  NSString *v11;

  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3))
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](self->_monitor, "discoverableMode"));
    discoverableMode = self->_discoverableMode;
    self->_discoverableMode = v4;

    v7 = airdrop_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_discoverableMode;
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Discoverable mode changed to %@", (uint8_t *)&v10, 0xCu);
    }

    -[SDAirDropServer stop](self, "stop");
    -[SDAirDropServer updateServerState](self, "updateServerState");
  }
}

- (void)keyBagFirstUnlock:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = airdrop_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Device first unlock", v6, 2u);
  }

  -[SDAirDropServer updateServerState](self, "updateServerState");
}

- (void)screenStateChange:(id)a3
{
  _BOOL4 screenOn;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;

  if (!-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder", a3))
  {
    screenOn = self->_screenOn;
    if (screenOn != -[SDStatusMonitor screenOn](self->_monitor, "screenOn"))
    {
      v5 = -[SDStatusMonitor screenOn](self->_monitor, "screenOn");
      self->_screenOn = v5;
      v6 = airdrop_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_screenOn)
          v8 = CFSTR("on");
        else
          v8 = CFSTR("off");
        v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Screen turned %@", (uint8_t *)&v9, 0xCu);
      }

      -[SDAirDropServer updateServerState](self, "updateServerState");
    }
  }
}

- (BOOL)discoverableByEveryone
{
  return -[NSString isEqual:](self->_discoverableMode, "isEqual:", kSFOperationDiscoverableModeEveryone);
}

- (BOOL)discoverableByContactsOnly
{
  return -[NSString isEqual:](self->_discoverableMode, "isEqual:", kSFOperationDiscoverableModeContactsOnly);
}

- (void)stopScanningAndStartServer
{
  -[SDAirDropServer stopProximityScanner](self, "stopProximityScanner");
  -[SDAirDropServer invalidateTimers](self, "invalidateTimers");
  -[SDAirDropServer startTimers](self, "startTimers");
  -[SDAirDropServer startServer](self, "startServer");
}

- (void)handleFoundHashes:(id)a3 rssi:(id)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  _BOOL8 v13;
  _BOOL4 v14;
  uint64_t v15;
  _BOOL4 v16;
  int v17;
  id v18;

  v6 = a3;
  -[SDAirDropServer logDiscoveryWithHash:rssi:](self, "logDiscoveryWithHash:rssi:", v6, a4);
  v7 = -[SDAirDropServer discoverableByEveryone](self, "discoverableByEveryone");
  if (v7)
  {
    v8 = airdrop_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      v10 = "In Everyone mode, start server";
      v11 = v9;
      v12 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (-[SDAirDropServer discoverableByContactsOnly](self, "discoverableByContactsOnly"))
  {
    v13 = -[SDStatusMonitor contactsContainsShortHashes:](self->_monitor, "contactsContainsShortHashes:", v6);
    v14 = v13;
    v15 = airdrop_log(v13);
    v9 = objc_claimAutoreleasedReturnValue(v15);
    v16 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v17 = 138412290;
        v18 = v6;
        v10 = "Hashes %@ exist in contacts, start server";
        v11 = v9;
        v12 = 12;
        goto LABEL_8;
      }
LABEL_9:

      -[SDAirDropServer stopScanningAndStartServer](self, "stopScanningAndStartServer");
      goto LABEL_10;
    }
    if (v16)
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Hashes %@ not recognized", (uint8_t *)&v17, 0xCu);
    }

  }
LABEL_10:

}

- (void)logDiscoveryWithHash:(id)a3 rssi:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[NSMutableSet containsObject:](self->_discoveredHashes, "containsObject:", v6);
  v9 = (int)v8;
  v10 = airdrop_log(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000B745C((uint64_t)v6, (uint64_t)v7, v12);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BTLE discovered hashes %@ rssi %@", (uint8_t *)&v13, 0x16u);
    }

    -[NSMutableSet addObject:](self->_discoveredHashes, "addObject:", v6);
  }

}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "subdataWithRange:", 1, 8));
  -[SDAirDropServer handleFoundHashes:rssi:](self, "handleFoundHashes:rssi:", v8, v7);

}

- (void)awdlDidUpdateState:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "state");
  if ((unint64_t)v4 > 3)
    v5 = 0;
  else
    v5 = *((_QWORD *)&off_1007168B8 + (_QWORD)v4);
  v6 = airdrop_log(v4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTLE scanner %@", (uint8_t *)&v8, 0xCu);
  }

  if (objc_msgSend(v3, "state") == (id)3)
    objc_msgSend(v3, "startConnectionlessAWDLServiceScanning");

}

- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4
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
    sub_1000B74DC((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

}

- (void)updateServerState
{
  id WeakRetained;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  _BOOL8 v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 screenOn;
  void *v19;
  char IsVirtualMachine;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  int v24;
  _BYTE v25[10];
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  unsigned int v29;

  if (-[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder"))
    return;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v5 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser");
    v6 = -[SDStatusMonitor deviceWasUnlockedOnce](self->_monitor, "deviceWasUnlockedOnce");
    v7 = -[SDAirDropServer discoverableByContactsOnly](self, "discoverableByContactsOnly");
    v8 = v7;
    if (v7)
    {
      v9 = 1;
    }
    else
    {
      v7 = -[SDAirDropServer discoverableByEveryone](self, "discoverableByEveryone");
      v9 = v7;
    }
    if ((v5 & v9) == 1 && (self->_screenOn ? (v12 = v6) : (v12 = 0), v12 == 1))
    {
      -[SDAirDropServer _createOSTransactionIfNeeded](self, "_createOSTransactionIfNeeded");
      self->_contactsOnly = v8;
      v13 = -[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode");
      if ((v13 & 1) != 0)
      {
LABEL_15:
        v14 = airdrop_log(v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Auto-trigger server", (uint8_t *)&v24, 2u);
        }

        -[SDAirDropServer startServer](self, "startServer");
        return;
      }
      if (-[SDStatusMonitor showMeInWormhole](self->_monitor, "showMeInWormhole"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
        if (objc_msgSend(v19, "isAirDropEnabled"))
        {

          goto LABEL_15;
        }
        IsVirtualMachine = SFDeviceIsVirtualMachine();

        if ((IsVirtualMachine & 1) != 0)
          goto LABEL_15;
      }
      else
      {
        v13 = SFDeviceIsVirtualMachine();
        if ((_DWORD)v13)
          goto LABEL_15;
      }
      v21 = airdrop_log(-[SDAirDropServer startProximityScanner](self, "startProximityScanner"));
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_contactsOnly)
          v23 = CFSTR("Contacts Only");
        else
          v23 = CFSTR("Everyone");
        v24 = 138412290;
        *(_QWORD *)v25 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Scanning mode %@", (uint8_t *)&v24, 0xCu);
      }

    }
    else
    {
      v16 = airdrop_log(v7);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        screenOn = self->_screenOn;
        v24 = 67109888;
        *(_DWORD *)v25 = v5;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = v9;
        v26 = 1024;
        v27 = screenOn;
        v28 = 1024;
        v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Scanning mode off: console=%d, discoverable=%d, screenOn=%d, unlockedOnce=%d", (uint8_t *)&v24, 0x1Au);
      }

      -[SDAirDropServer stop](self, "stop");
    }
  }
  else
  {
    v10 = airdrop_log(v4);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000B7540();

  }
}

- (void)airDropUnpublished:(id)a3
{
  SDAirDropServer *v4;
  id WeakRetained;
  void *v6;
  unsigned int v7;
  NSObject *queue;
  SDAirDropServer *v9;
  _QWORD block[5];

  v4 = (SDAirDropServer *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (v4 == self || self->_server)
    goto LABEL_9;
  v9 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (!WeakRetained || !self->_screenOn)
  {

    v4 = v9;
LABEL_9:

    return;
  }
  v7 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser");

  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B5F00;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "keyBagFirstUnlock:", CFSTR("com.apple.sharingd.KeyBagFirstUnlock"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "wirelessChanged:", CFSTR("com.apple.sharingd.WirelessCarPlayChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "appleIDAccountInfoChanged:", CFSTR("com.apple.sharingd.AppleIDAccountInfoChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "appleIDChanged:", CFSTR("com.apple.sharingd.AppleIDChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "airDropUnpublished:", CFSTR("com.apple.sharingd.AirDropUnpublished"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "airDropStatusChanged:", CFSTR("com.apple.sharingd.AirDropStatusChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "wirelessChanged:", CFSTR("com.apple.sharingd.WirelessModeChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "wirelessChanged:", CFSTR("com.apple.sharingd.WirelessPowerChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "screenStateChange:", CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "bluetoothChanged:", CFSTR("com.apple.sharingd.BluetoothPowerChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "discoverableModeChanged:", CFSTR("com.apple.sharingd.DiscoverableModeChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)notifyClient:(int64_t)a3 withResults:(id)a4
{
  SDAirDropServerDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "airDropServer:event:withResults:", self, a3, v7);

}

- (void)bonjourPublisher:(id)a3 propertiesDidChange:(id)a4
{
  -[SDAirDropServer publishedInfoChanged:](self, "publishedInfoChanged:", a4);
}

- (id)sslSettings
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  id v6;
  __SecCertificate *v7;
  __SecCertificate *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD v15[2];

  if (-[SDStatusMonitor disableTLS](self->_monitor, "disableTLS"))
    return 0;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, _kCFStreamSSLShouldSetPeerID);
  v6 = -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, _kCFHTTPServerStreamSSLSettings);
  if (self->_identity)
  {
    v7 = -[SDStatusMonitor copyMyAppleIDIntermediateCertificate](self->_monitor, "copyMyAppleIDIntermediateCertificate");
    if (v7)
    {
      v8 = v7;
      v15[0] = self->_identity;
      v15[1] = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, _kCFHTTPServerServerTrustChain);

      CFRelease(v8);
    }
    else
    {
      v12 = airdrop_log(0);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000B756C();

    }
  }
  else
  {
    v10 = airdrop_log(v6);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AirDrop using self-signed certificate", v14, 2u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, _kCFHTTPServerAllowAnonymousServer);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, _kCFHTTPServerRequireClientCertificate);

  return v4;
}

- (void)startHTTPServer:(unsigned __int16)a3
{
  _CFHTTPServer *Service;
  unsigned int v5;
  __CFString **v6;
  _CFHTTPServer *server;
  CFRunLoopRef Main;
  NSNumber *v9;
  NSNumber *portNumber;
  NSNumber *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSNumber *v16;
  SDAirDropPublisher *v17;
  SDAirDropPublisher *publisher;
  uint64_t v19;
  NSObject *v20;
  _OWORD v21[2];
  id (*v22)(void *, uint64_t);
  _QWORD v23[5];
  uint8_t buf[4];
  NSNumber *v25;

  if (!self->_server && self->_startTime != 0.0)
  {
    v23[0] = 0;
    v23[1] = self;
    v23[2] = &_CFRetain;
    v23[3] = &_CFRelease;
    v23[4] = 0;
    v21[0] = unk_100716868;
    v21[1] = *(_OWORD *)off_100716878;
    v22 = sub_1000B6630;
    Service = (_CFHTTPServer *)_CFHTTPServerCreateService(0, v23, v21, 0, 0, a3);
    self->_server = Service;
    if (Service)
    {
      _CFHTTPServerSetProperty(Service, _kCFHTTPServerSSLSettings, -[SDAirDropServer sslSettings](self, "sslSettings"));
      _CFHTTPServerSetProperty(self->_server, _kCFHTTPServerIdleTimeout, &off_10074B5E0);
      _CFHTTPServerSetProperty(self->_server, _kCFHTTPServerWatchdogTimeout, &off_10074B5F8);
      if (!sub_10019CA64() && !-[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode")
        || SFDeviceIsVirtualMachine())
      {
        v5 = -[SDStatusMonitor registerAllInterfaces](self->_monitor, "registerAllInterfaces");
        v6 = (__CFString **)&_kCFHTTPServerAllInterfacesIdentifier;
        if (!v5)
          v6 = &off_100714DD0;
        _CFHTTPServerSetProperty(self->_server, _kCFHTTPServerBoundInterfaceIdentifier, *v6);
      }
      _CFHTTPServerSetProperty(self->_server, _kCFHTTPServerReuseLocalAddress, kCFBooleanTrue);
      server = self->_server;
      Main = CFRunLoopGetMain();
      _CFHTTPServerScheduleWithRunLoopAndMode(server, Main, kCFRunLoopDefaultMode);
      v9 = (NSNumber *)_CFHTTPServerCopyProperty(self->_server, _kCFHTTPServerServicePort);
      portNumber = self->_portNumber;
      self->_portNumber = v9;

      v11 = self->_portNumber;
      v13 = airdrop_log(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = v14;
      if (v11)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_portNumber;
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AirDrop server scheduled on port %@", buf, 0xCu);
        }

        sub_100045388((uint64_t)CFSTR("BonjourAdvertise"), (uint64_t)CFSTR("Start"), (uint64_t)self->_clientBundleID, self->_clientPid);
        v17 = -[SDAirDropPublisher initWithPort:identity:]([SDAirDropPublisher alloc], "initWithPort:identity:", self->_portNumber, self->_identity);
        publisher = self->_publisher;
        self->_publisher = v17;

        -[SDAirDropPublisher setDelegate:](self->_publisher, "setDelegate:", self);
        -[SDAirDropPublisher start](self->_publisher, "start");
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1000B75C4();

      }
    }
    else
    {
      v19 = airdrop_log(0);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1000B7598();

    }
  }
}

- (void)startProximityScanner
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  CFIndex Count;
  uint64_t v9;
  NSObject *v10;
  NSUUID *v11;
  NSUUID *scanningIdentifier;
  NSUUID *v13;
  WPAWDL *v14;
  WPAWDL *proximity;
  WPAWDL *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  _BOOL4 v19;
  __int16 v20;
  CFIndex v21;

  v3 = +[SFAirDropUserDefaults_objc askToAirdropEnabled](SFAirDropUserDefaults_objc, "askToAirdropEnabled");
  v4 = (int)v3;
  if ((!(_DWORD)v3 || self->_scanningIdentifier) && self->_proximity
    || (v3 = (id)CFDictionaryGetCount(self->_connections)) != 0)
  {
    v5 = airdrop_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_scanningIdentifier != 0;
      Count = CFDictionaryGetCount(self->_connections);
      *(_DWORD *)buf = 67109376;
      v19 = v7;
      v20 = 2048;
      v21 = Count;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BTLE scanning not starting: scanningIdentifier=%d, count=%ld", buf, 0x12u);
    }
    goto LABEL_7;
  }
  v9 = airdrop_log(0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BTLE scanning started", buf, 2u);
  }

  sub_100045388((uint64_t)CFSTR("BluetoothScanning"), (uint64_t)CFSTR("Start"), (uint64_t)self->_clientBundleID, self->_clientPid);
  if (v4)
  {
    v11 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    scanningIdentifier = self->_scanningIdentifier;
    self->_scanningIdentifier = v11;

    v6 = objc_claimAutoreleasedReturnValue(+[SDAirDropBLEController shared](_TtC16DaemoniOSLibrary22SDAirDropBLEController, "shared"));
    v13 = self->_scanningIdentifier;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000B6850;
    v17[3] = &unk_100716898;
    v17[4] = self;
    -[NSObject startScanningWithIdentifier:deviceUpdatesHandler:](v6, "startScanningWithIdentifier:deviceUpdatesHandler:", v13, v17);
LABEL_7:

    return;
  }
  v14 = (WPAWDL *)objc_msgSend(objc_alloc((Class)WPAWDL), "initWithDelegate:queue:", self, self->_queue);
  proximity = self->_proximity;
  self->_proximity = v14;

  v16 = self->_proximity;
  if (v16 && -[WPAWDL state](v16, "state") == (id)3)
    -[WPAWDL startConnectionlessAWDLServiceScanning](self->_proximity, "startConnectionlessAWDLServiceScanning");
}

- (void)stopProximityScanner
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void **p_scanningIdentifier;
  void *v9;
  uint8_t v10[16];

  v3 = +[SFAirDropUserDefaults_objc askToAirdropEnabled](SFAirDropUserDefaults_objc, "askToAirdropEnabled");
  v4 = (int)v3;
  if ((_DWORD)v3 && self->_scanningIdentifier || self->_proximity)
  {
    v5 = airdrop_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BTLE scanning stopped", v10, 2u);
    }

    sub_100045388((uint64_t)CFSTR("BluetoothScanning"), (uint64_t)CFSTR("Stop"), (uint64_t)self->_clientBundleID, self->_clientPid);
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropBLEController shared](_TtC16DaemoniOSLibrary22SDAirDropBLEController, "shared"));
      p_scanningIdentifier = (void **)&self->_scanningIdentifier;
      objc_msgSend(v7, "stopScanningWithIdentifier:", self->_scanningIdentifier);

    }
    else
    {
      p_scanningIdentifier = (void **)&self->_proximity;
      -[WPAWDL stopConnectionlessAWDLServiceScanning](self->_proximity, "stopConnectionlessAWDLServiceScanning");
      -[WPAWDL invalidate](self->_proximity, "invalidate");
    }
    v9 = *p_scanningIdentifier;
    *p_scanningIdentifier = 0;

    -[NSMutableSet removeAllObjects](self->_discoveredHashes, "removeAllObjects");
  }
}

- (void)foundDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  LOBYTE(v8) = (unsigned __int16)objc_msgSend(v4, "airdropHash1") >> 8;
  BYTE1(v8) = objc_msgSend(v4, "airdropHash1", v8);
  BYTE2(v8) = (unsigned __int16)objc_msgSend(v4, "airdropHash2") >> 8;
  BYTE3(v8) = objc_msgSend(v4, "airdropHash2");
  BYTE4(v8) = (unsigned __int16)objc_msgSend(v4, "airdropHash3") >> 8;
  BYTE5(v8) = objc_msgSend(v4, "airdropHash3");
  BYTE6(v8) = (unsigned __int16)objc_msgSend(v4, "airdropHash4") >> 8;
  HIBYTE(v8) = objc_msgSend(v4, "airdropHash4");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v8, 8));
  v6 = objc_msgSend(v4, "bleRSSI");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
  -[SDAirDropServer handleFoundHashes:rssi:](self, "handleFoundHashes:rssi:", v5, v7);

}

- (void)startServer
{
  __SecIdentity *identity;
  NSObject *queue;
  _QWORD block[5];

  if (!self->_server && self->_startTime == 0.0)
  {
    if (!-[SDStatusMonitor disableTLS](self->_monitor, "disableTLS"))
    {
      identity = self->_identity;
      if (identity)
        CFRelease(identity);
      self->_identity = -[SDStatusMonitor copyMyAppleIDSecIdentity](self->_monitor, "copyMyAppleIDSecIdentity");
    }
    self->_startTime = CFAbsoluteTimeGetCurrent();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6B44;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)airDropInformation:(id)a3 didChange:(id)a4
{
  -[SDAirDropServer notifyClient:withResults:](self, "notifyClient:withResults:", 12, a4);
}

- (BOOL)thisIsTheFinder
{
  return -[NSString isEqualToString:](self->_clientBundleID, "isEqualToString:", CFSTR("com.apple.finder"));
}

- (void)start
{
  _BOOL8 v3;
  SDAirDropInformation *v4;
  SDAirDropInformation *information;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *queue;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD block[5];
  uint8_t buf[16];

  v3 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder");
  if (v3)
  {
    -[SDAirDropServer _createOSTransactionIfNeeded](self, "_createOSTransactionIfNeeded");
    -[SDStatusMonitor setFinderServer:](self->_monitor, "setFinderServer:", self);
    v4 = objc_alloc_init(SDAirDropInformation);
    information = self->_information;
    self->_information = v4;

    -[SDAirDropInformation setDelegate:](self->_information, "setDelegate:", self);
    -[SDAirDropInformation start](self->_information, "start");
  }
  else
  {
    v6 = airdrop_log(v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AirDrop server started", buf, 2u);
    }

    if (dword_1007D7F38)
    {
      v8 = sub_10019AAC0(2.0);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B6CB8;
      block[3] = &unk_1007146D8;
      block[4] = self;
      dispatch_after(v8, queue, block);
    }
    else
    {
      v10 = self->_queue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000B6CC0;
      v11[3] = &unk_1007146D8;
      v11[4] = self;
      dispatch_async(v10, v11);
    }
  }
}

- (void)stop
{
  _BOOL8 v3;
  SDAirDropInformation *information;
  CFAbsoluteTime Current;
  uint64_t v6;
  NSObject *v7;
  OS_os_transaction *transaction;
  uint8_t v9[16];

  v3 = -[SDAirDropServer thisIsTheFinder](self, "thisIsTheFinder");
  if (v3)
  {
    -[SDStatusMonitor setFinderServer:](self->_monitor, "setFinderServer:", 0);
    -[SDAirDropInformation setDelegate:](self->_information, "setDelegate:", 0);
    -[SDAirDropInformation stop](self->_information, "stop");
    information = self->_information;
    self->_information = 0;

  }
  else
  {
    if (self->_startTime != 0.0)
    {
      Current = CFAbsoluteTimeGetCurrent();
      sub_100044A24(Current - self->_startTime);
      self->_startTime = 0.0;
    }
    if (self->_server)
    {
      v6 = airdrop_log(v3);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Invalidating AirDrop server", v9, 2u);
      }

      _CFHTTPServerInvalidate(self->_server);
    }
    -[SDAirDropServer stopProximityScanner](self, "stopProximityScanner");
    -[SDAirDropServer invalidateTimers](self, "invalidateTimers");
  }
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)activate
{
  SDAirDropServer *v3;
  CUCoalescer *v4;
  CUCoalescer *coalescer;
  _QWORD v6[5];

  if (!self->_coalescer)
  {
    v3 = self;
    v4 = objc_opt_new(CUCoalescer);
    coalescer = self->_coalescer;
    self->_coalescer = v4;

    -[CUCoalescer setDispatchQueue:](self->_coalescer, "setDispatchQueue:", v3->_queue);
    -[CUCoalescer setMaxDelay:](self->_coalescer, "setMaxDelay:", 0.4);
    -[CUCoalescer setMinDelay:](self->_coalescer, "setMinDelay:", 0.3);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B6E88;
    v6[3] = &unk_1007146D8;
    v6[4] = v3;
    -[CUCoalescer setActionHandler:](self->_coalescer, "setActionHandler:", v6);
    -[SDAirDropServer addObservers](v3, "addObservers");
    -[SDAirDropServer start](v3, "start");

  }
}

- (void)invalidate
{
  OS_os_transaction *transaction;

  if (self->_transaction)
  {
    -[SDAirDropServer stop](self, "stop");
    -[SDAirDropServer removeObservers](self, "removeObservers");
    -[CUCoalescer invalidate](self->_coalescer, "invalidate");
    transaction = self->_transaction;
    self->_transaction = 0;

  }
}

- (NSString)description
{
  id v3;
  id v4;
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  const char *v15;
  id v16;
  WPAWDL *proximity;
  unint64_t v18;
  const char *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  const char *v24;
  id v25;
  CFAbsoluteTime Current;
  id v27;
  __CFDictionary *connections;
  int Count;
  id v30;
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
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  v46 = 0;
  NSAppendPrintF(&v46, "AirDropServer\n");
  v3 = v46;
  v45 = v3;
  NSAppendPrintF(&v45, "--------------\n");
  v4 = v45;

  v44 = v4;
  NSAppendPrintF(&v44, "Discoverable mode:                   %@\n", self->_discoverableMode);
  v5 = v44;

  v43 = v5;
  if (self->_screenOn)
    v6 = "yes";
  else
    v6 = "no";
  NSAppendPrintF(&v43, "Screen On:                           %s\n", v6);
  v7 = v43;

  v42 = v7;
  if (self->_contactsOnly)
    v8 = "yes";
  else
    v8 = "no";
  NSAppendPrintF(&v42, "Discoverable by contacts only:       %s\n", v8);
  v9 = v42;

  v41 = v9;
  if (-[SDAirDropServer discoverableByEveryone](self, "discoverableByEveryone"))
    v10 = "yes";
  else
    v10 = "no";
  NSAppendPrintF(&v41, "Discoverable by everyone:            %s\n", v10);
  v11 = v41;

  v40 = v11;
  if (-[SDStatusMonitor deviceWasUnlockedOnce](self->_monitor, "deviceWasUnlockedOnce"))
    v12 = "yes";
  else
    v12 = "no";
  NSAppendPrintF(&v40, "Unlocked once:                       %s\n", v12);
  v13 = v40;

  v39 = v13;
  NSAppendPrintF(&v39, "Port Number:                         %@\n", self->_portNumber);
  v14 = v39;

  v38 = v14;
  if (self->_proximity)
    v15 = "yes";
  else
    v15 = "no";
  NSAppendPrintF(&v38, "WirelessProx object:                 %s\n", v15);
  v16 = v38;

  proximity = self->_proximity;
  if (proximity)
  {
    v37 = v16;
    v18 = (unint64_t)-[WPAWDL state](proximity, "state");
    v19 = v18 > 5 ? "?" : off_1007168D8[v18];
    NSAppendPrintF(&v37, "WirelessProx state:                  %s\n", v19);
    v20 = v37;

    v36 = v20;
    NSAppendPrintF(&v36, "Discovered hashes count:             %d\n", -[NSMutableSet count](self->_discoveredHashes, "count"));
    v16 = v36;

    if (-[NSMutableSet count](self->_discoveredHashes, "count"))
    {
      v35 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_discoveredHashes, "allObjects"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", ")));
      NSAppendPrintF(&v35, "Discovered hashes:                   %@\n", v22);
      v23 = v35;

      v16 = v23;
    }
  }
  v34 = v16;
  if (self->_server)
    v24 = "yes";
  else
    v24 = "no";
  NSAppendPrintF(&v34, "HTTP Server:                         %s\n", v24);
  v25 = v34;

  if (self->_server)
  {
    v33 = v25;
    Current = CFAbsoluteTimeGetCurrent();
    NSAppendPrintF(&v33, "HTTP Server up time:                 %ll{dur}\n", (unint64_t)(Current - self->_startTime));
    v27 = v33;

    v25 = v27;
  }
  connections = self->_connections;
  if (connections && CFDictionaryGetCount(connections))
  {
    v32 = v25;
    Count = CFDictionaryGetCount(self->_connections);
    NSAppendPrintF(&v32, "HTTP Server connections:             %d\n", Count);
    v30 = v32;

    v25 = v30;
  }
  return (NSString *)v25;
}

- (void)_createOSTransactionIfNeeded
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;

  if (!self->_transaction)
  {
    v3 = (OS_os_transaction *)os_transaction_create("SDAirDropServer");
    transaction = self->_transaction;
    self->_transaction = v3;

  }
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (SDAirDropServerDelegate)delegate
{
  return (SDAirDropServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_scanningIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_discoveredHashes, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_discoverableMode, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_bluetoothTimer, 0);
  objc_storeStrong((id *)&self->_awdlTimer, 0);
  objc_storeStrong((id *)&self->_portNumber, 0);
  objc_storeStrong((id *)&self->_proximity, 0);
}

@end
