@implementation SDActivityAdvertiser

+ (SDActivityAdvertiser)sharedAdvertiser
{
  if (qword_1007C6678 != -1)
    dispatch_once(&qword_1007C6678, &stru_100715E30);
  return (SDActivityAdvertiser *)(id)qword_1007C6670;
}

- (SDActivityAdvertiser)init
{
  SDActivityAdvertiser *v2;
  SDActivityAdvertiser *v3;
  NSTimer *goodbyeTimer;
  NSData *advertisementData;
  id currentErrorHandler;
  NSData *currentAdvertisementPayload;
  NSDictionary *currentAdvertisementOptions;
  uint64_t v9;
  SDStatusMonitor *monitor;
  NSMutableSet *v11;
  NSMutableSet *shouldNotAdvertiseRequesters;
  IDSContinuity *v13;
  IDSContinuity *continuity;
  objc_super v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SDActivityAdvertiser;
  v2 = -[SDActivityController init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    goodbyeTimer = v2->_goodbyeTimer;
    v2->_goodbyeTimer = 0;

    advertisementData = v3->_advertisementData;
    v3->_advertisementData = 0;

    v3->_advertisingEnabled = 0;
    v3->_isAdvertising = 0;
    currentErrorHandler = v3->_currentErrorHandler;
    v3->_currentErrorHandler = 0;

    currentAdvertisementPayload = v3->_currentAdvertisementPayload;
    v3->_currentAdvertisementPayload = 0;

    currentAdvertisementOptions = v3->_currentAdvertisementOptions;
    v3->_currentAdvertisementOptions = 0;

    v3->_powerAssertionID = 0;
    v3->_powerAssertionClientPID = 0;
    v9 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v9;

    v11 = objc_opt_new(NSMutableSet);
    shouldNotAdvertiseRequesters = v3->_shouldNotAdvertiseRequesters;
    v3->_shouldNotAdvertiseRequesters = v11;

    v13 = (IDSContinuity *)objc_msgSend(objc_alloc((Class)IDSContinuity), "initWithDelegate:queue:", v3, &_dispatch_main_q);
    continuity = v3->_continuity;
    v3->_continuity = v13;

    v3->_versionByte = sub_1000CEA34(CFSTR("BluetoothAdvertiseScanVersionByte"), 0);
    v3->_goodbyeTimerInterval = (double)sub_1000CEA34(CFSTR("BluetoothAdvertiseGoodByeDuration"), 2);
    -[SDActivityAdvertiser addObservers](v3, "addObservers");
    v16.receiver = v3;
    v16.super_class = (Class)SDActivityAdvertiser;
    -[SDXPCDaemon _activate](&v16, "_activate");
  }
  return v3;
}

- (BOOL)restart
{
  NSData *currentAdvertisementPayload;
  NSData *v4;
  NSData *rawAdvertisementData;
  OS_os_transaction *v6;
  OS_os_transaction *advertisingTransaction;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  NSDictionary *currentAdvertisementOptions;
  uint64_t v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  const char *v24;
  id v25;
  unsigned int v26;
  const __CFString *v27;
  OS_os_transaction *v28;
  _BYTE v29[12];
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const __CFString *v39;

  currentAdvertisementPayload = self->_currentAdvertisementPayload;
  if (self->_advertisingEnabled
    && -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser")
    && -[IDSContinuity state](self->_continuity, "state") == (id)3
    && !-[NSMutableSet count](self->_shouldNotAdvertiseRequesters, "count")
    && -[SDActivityController shouldStart](self, "shouldStart"))
  {
    if (!self->_rawAdvertisementData)
    {
      v4 = (NSData *)objc_claimAutoreleasedReturnValue(-[SDActivityAdvertiser encryptedAdvertisingInformation](self, "encryptedAdvertisingInformation"));
      rawAdvertisementData = self->_rawAdvertisementData;
      self->_rawAdvertisementData = v4;

    }
    if (!currentAdvertisementPayload)
      -[SDActivityAdvertiser startGoodbyeTimer](self, "startGoodbyeTimer");
    v6 = (OS_os_transaction *)os_transaction_create("SDActivityAdvertiser");
    advertisingTransaction = self->_advertisingTransaction;
    self->_advertisingTransaction = v6;

    v8 = handoff_log();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = SFAdvertisementDescriptionFromPayloadData(self->_currentAdvertisementPayload);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = SFHexStringForData(self->_rawAdvertisementData);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(v12);
      currentAdvertisementOptions = self->_currentAdvertisementOptions;
      *(_DWORD *)v29 = 138412802;
      *(_QWORD *)&v29[4] = v11;
      v30 = 2112;
      v31 = v13;
      v32 = 2112;
      v33 = currentAdvertisementOptions;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Started advertising %@ as %@ with options %@", v29, 0x20u);

    }
    -[SDActivityAdvertiser preventIdleSleepAssertion](self, "preventIdleSleepAssertion");
    -[IDSContinuity startAdvertisingOfType:withData:withOptions:](self->_continuity, "startAdvertisingOfType:withData:withOptions:", 0, self->_rawAdvertisementData, 0);
    return 1;
  }
  else
  {
    if (!currentAdvertisementPayload && self->_goodbyeTimer)
    {
      v16 = handoff_log();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Goodbye packet advertising interrupted", v29, 2u);
      }

      -[SDActivityAdvertiser invalidateGoodbyeTimer](self, "invalidateGoodbyeTimer");
    }
    if (self->_isAdvertising)
      v18 = CFSTR("Stopped");
    else
      v18 = CFSTR("Skipping request for");
    v19 = v18;
    v20 = handoff_log();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_advertisingEnabled)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      if (-[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser"))
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      if (((unint64_t)-[IDSContinuity state](self->_continuity, "state") & 0x8000000000000000) != 0
        || (uint64_t)-[IDSContinuity state](self->_continuity, "state") > 3)
      {
        v24 = "UnexpectedState";
      }
      else
      {
        v24 = off_100715E50[(_QWORD)-[IDSContinuity state](self->_continuity, "state")];
      }
      v25 = -[NSMutableSet count](self->_shouldNotAdvertiseRequesters, "count");
      v26 = -[SDActivityController shouldStart](self, "shouldStart");
      *(_DWORD *)v29 = 138413570;
      if (v26)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      *(_QWORD *)&v29[4] = v19;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = (void *)v23;
      v34 = 2080;
      v35 = v24;
      v36 = 2048;
      v37 = v25;
      v38 = 2112;
      v39 = v27;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ advertising: advertisingEnabled %@, currentConsoleUser %@, state %s, shouldNotAdvertiseRequestersCount %lu, shouldStart %@", v29, 0x3Eu);
    }

    if (self->_isAdvertising)
      -[IDSContinuity stopAdvertisingOfType:](self->_continuity, "stopAdvertisingOfType:", 0);
    -[SDActivityAdvertiser releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion", *(_QWORD *)v29);
    v28 = self->_advertisingTransaction;
    self->_advertisingTransaction = 0;

    return 0;
  }
}

- (void)stop
{
  NSData *currentAdvertisementPayload;
  NSDictionary *currentAdvertisementOptions;
  id currentErrorHandler;

  self->_advertisingEnabled = 0;
  -[SDActivityAdvertiser invalidateGoodbyeTimer](self, "invalidateGoodbyeTimer");
  -[SDActivityAdvertiser restart](self, "restart");
  currentAdvertisementPayload = self->_currentAdvertisementPayload;
  self->_currentAdvertisementPayload = 0;

  currentAdvertisementOptions = self->_currentAdvertisementOptions;
  self->_currentAdvertisementOptions = 0;

  currentErrorHandler = self->_currentErrorHandler;
  self->_currentErrorHandler = 0;

}

- (void)stopForReason:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = handoff_log();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = SFCompactStringFromCollection(self->_shouldNotAdvertiseRequesters);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 136315650;
    v10 = "-[SDActivityAdvertiser stopForReason:]";
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@ + \"%@\", (uint8_t *)&v9, 0x20u);

  }
  -[NSMutableSet addObject:](self->_shouldNotAdvertiseRequesters, "addObject:", v4);
  if (-[NSMutableSet count](self->_shouldNotAdvertiseRequesters, "count") == (id)1)
    -[SDActivityAdvertiser restart](self, "restart");

}

- (void)resumeForReason:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = handoff_log();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = SFCompactStringFromCollection(self->_shouldNotAdvertiseRequesters);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 136315650;
    v10 = "-[SDActivityAdvertiser resumeForReason:]";
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@ - \"%@\", (uint8_t *)&v9, 0x20u);

  }
  if (-[NSMutableSet containsObject:](self->_shouldNotAdvertiseRequesters, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_shouldNotAdvertiseRequesters, "removeObject:", v4);
    if (!-[NSMutableSet count](self->_shouldNotAdvertiseRequesters, "count"))
      -[SDActivityAdvertiser restart](self, "restart");
  }

}

- (void)activityServiceDevicesChanged:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD block[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = sub_1000C0734(*(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cachedDecryptionKeyForDeviceIdentifier:", v13));

          if (v14)
          {
            objc_msgSend(v11, "setValidKey:", objc_msgSend(v14, "isValidKey"));
            objc_msgSend(v11, "setKeyCounter:", objc_msgSend(v14, "lastUsedCounter"));
          }
          objc_msgSend(v4, "addObject:", v11);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000864A8;
  block[3] = &unk_100714860;
  block[4] = self;
  v18 = v4;
  v15 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

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
  return CFSTR("com.apple.sharing.handoff.advertising");
}

- (id)exportedInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFActivityAdvertiserProtocol));
  v15[0] = objc_opt_class(NSSet, v3);
  v15[1] = objc_opt_class(NSArray, v4);
  v15[2] = objc_opt_class(SFPeerDevice, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, "pairedSFPeerDevicesWithOptions:completionHandler:", 0, 1);

  v14[0] = objc_opt_class(NSDictionary, v8);
  v14[1] = objc_opt_class(NSString, v9);
  v14[2] = objc_opt_class(NSNumber, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, "advertiseAdvertisementPayload:options:withErrorHandler:", 1, 0);

  return v2;
}

- (id)remoteObjectInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFActivityAdvertiserClient));
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(SFPeerDevice, v3), "activityPayloadForAdvertisementPayload:command:requestedByDevice:withCompletionHandler:", 2, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(SFPeerDevice, v4), "didSendPayloadForActivityIdentifier:toDevice:error:", 1, 0);
  v10[0] = objc_opt_class(NSSet, v5);
  v10[1] = objc_opt_class(SFPeerDevice, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, "pairedDevicesChanged:", 0, 0);

  return v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  v3 = handoff_log(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100088B20();

}

- (void)connectionInvalidated:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = handoff_log(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100088B4C();

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[SDActivityAdvertiser stop](self, "stop");
}

- (void)didSendPayloadForActivityIdentifier:(id)a3 toDevice:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008696C;
  v11[3] = &unk_100715EA0;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v8 = v14;
  v9 = v13;
  v10 = v12;
  -[SDActivityAdvertiser _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v11);

}

- (void)activityPayloadForAdvertisementPayload:(id)a3 command:(id)a4 requestedByDevice:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100086A68;
  v14[3] = &unk_100715EC8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v10 = v18;
  v11 = v17;
  v12 = v16;
  v13 = v15;
  -[SDActivityAdvertiser _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v14);

}

- (NSString)state
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  float goodbyeTimerInterval;
  id v10;
  const __CFString *v11;
  id v12;
  const __CFString *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  id v21;
  int powerAssertionClientPID;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
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
  id v42;

  v42 = 0;
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v42, "%@\n", v5);
  v6 = v42;

  v41 = v6;
  NSAppendPrintF(&v41, "-------------\n");
  v7 = v41;

  v40 = v7;
  NSAppendPrintF(&v40, "Version Byte: %u\n", self->_versionByte);
  v8 = v40;

  v39 = v8;
  goodbyeTimerInterval = self->_goodbyeTimerInterval;
  NSAppendPrintF(&v39, "Goodbye Timer Interval: %.2f\n", goodbyeTimerInterval);
  v10 = v39;

  v38 = v10;
  if (self->_advertisingEnabled)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  NSAppendPrintF(&v38, "Advertising Enabled: %@\n", v11);
  v12 = v38;

  v37 = v12;
  if (-[SDActivityController shouldStart](self, "shouldStart"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  NSAppendPrintF(&v37, "Should Start: %@\n", v13);
  v14 = v37;

  v36 = v14;
  v15 = SFCompactStringFromCollection(self->_shouldNotAdvertiseRequesters);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  NSAppendPrintF(&v36, "Should Not Advertise Requesters: %@\n", v16);
  v17 = v36;

  v35 = v17;
  if (self->_isAdvertising)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  NSAppendPrintF(&v35, "Is Advertising: %@\n", v18);
  v19 = v35;

  v34 = v19;
  if (self->_powerAssertionID)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  NSAppendPrintF(&v34, "Has Power Assertion:%@\n", v20);
  v21 = v34;

  powerAssertionClientPID = self->_powerAssertionClientPID;
  if (powerAssertionClientPID)
  {
    v33 = v21;
    NSAppendPrintF(&v33, "Power Assertion PID: %d\n", powerAssertionClientPID);
    v23 = v33;

    v21 = v23;
  }
  v32 = v21;
  v24 = SFAdvertisementDescriptionFromPayloadData(self->_currentAdvertisementPayload);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  NSAppendPrintF(&v32, "Current Advertisement Payload: %@\n", v25);
  v26 = v32;

  v31 = v26;
  v27 = SFCompactStringFromCollection(self->_currentAdvertisementOptions);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  NSAppendPrintF(&v31, "Current Advertisement Options: %@\n", v28);
  v29 = v31;

  return (NSString *)v29;
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "resetStateRequested:", CFSTR("com.apple.sharingd.ResetState"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "systemWillSleep:", CFSTR("com.apple.sharingd.SystemWillSleep"), 0);

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

  v4 = handoff_log(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = getuid();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping for user %d on sleep", (uint8_t *)v6, 8u);
  }

  -[SDActivityAdvertiser stop](self, "stop");
}

- (void)consoleUserChanged:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];

  v4 = -[SDStatusMonitor currentConsoleUser](self->_monitor, "currentConsoleUser", a3);
  if (!v4)
  {
    v7 = handoff_log(v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = getuid();
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stopping for user %d on logout", (uint8_t *)v9, 8u);
    }

    -[SDActivityAdvertiser stop](self, "stop");
  }
}

- (void)preventIdleSleepAssertion
{
  unsigned int *p_powerAssertionID;
  uint64_t powerAssertionID;
  CFDictionaryRef v5;
  int powerAssertionClientPID;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t isKindOfClass;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  int v28;
  __int16 v29;
  int v30;
  _QWORD v31[3];
  _QWORD v32[3];

  p_powerAssertionID = &self->_powerAssertionID;
  powerAssertionID = self->_powerAssertionID;
  if ((_DWORD)powerAssertionID)
  {
    v5 = IOPMAssertionCopyProperties(powerAssertionID);
    powerAssertionClientPID = self->_powerAssertionClientPID;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("AssertionOnBehalfOfPID")));
    v9 = objc_opt_class(NSNumber, v8);
    isKindOfClass = objc_opt_isKindOfClass(v7, v9);
    if ((isKindOfClass & 1) != 0)
    {
      isKindOfClass = (uint64_t)objc_msgSend(v7, "intValue");
      v12 = isKindOfClass;
      if ((_DWORD)isKindOfClass == powerAssertionClientPID)
      {
        v13 = handoff_log(isKindOfClass, v11);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_100088B78();

LABEL_19:
        goto LABEL_20;
      }
    }
    else
    {
      v12 = 0;
    }
    v25 = handoff_log(isKindOfClass, v11);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 67109376;
      v28 = v12;
      v29 = 1024;
      v30 = powerAssertionClientPID;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Creating new power assertion for PID change (%d -> %d)", (uint8_t *)&v27, 0xEu);
    }

    -[SDActivityAdvertiser releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
    self->_powerAssertionClientPID = powerAssertionClientPID;
    -[SDActivityAdvertiser preventIdleSleepAssertion](self, "preventIdleSleepAssertion");
    goto LABEL_19;
  }
  v15 = handoff_log(powerAssertionID, a2);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_powerAssertionClientPID;
    v27 = 67109120;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Grabbing power assertion to keep advertising until told to stop (client PID: %d)", (uint8_t *)&v27, 8u);
  }

  v31[0] = CFSTR("FrameworkBundleID");
  v31[1] = CFSTR("AssertType");
  v32[0] = CFSTR("com.apple.Sharing");
  v32[1] = CFSTR("PreventUserIdleSystemSleep");
  v31[2] = CFSTR("AssertName");
  v32[2] = CFSTR("Handoff");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
  v5 = (CFDictionaryRef)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v18));

  if (self->_powerAssertionClientPID)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    -[__CFDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, CFSTR("AssertionOnBehalfOfPID"));

  }
  v20 = IOPMAssertionCreateWithProperties(v5, p_powerAssertionID);
  if ((_DWORD)v20)
  {
    v22 = v20;
    v23 = handoff_log(v20, v21);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10007FA2C(v22, v24);

    *p_powerAssertionID = 0;
  }
LABEL_20:

}

- (void)releaseIdleSleepAssertion
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if (self->_powerAssertionID)
  {
    v3 = handoff_log();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing power assertion", v5, 2u);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_powerAssertionID = 0;
    self->_powerAssertionClientPID = 0;
  }
}

- (void)startGoodbyeTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087380;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)invalidateGoodbyeTimer
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *goodbyeTimer;

  if (self->_goodbyeTimer)
  {
    v3 = handoff_log(self, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100088C68((uint64_t)self, v4);

    -[NSTimer invalidate](self->_goodbyeTimer, "invalidate");
    goodbyeTimer = self->_goodbyeTimer;
    self->_goodbyeTimer = 0;

  }
}

- (void)goodbyeTimeoutFired:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v4 = -[SDActivityAdvertiser invalidateGoodbyeTimer](self, "invalidateGoodbyeTimer", a3);
  if (!self->_currentAdvertisementPayload)
  {
    v6 = handoff_log(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100088CF0((uint64_t)self, v7);

    -[SDActivityAdvertiser stop](self, "stop");
  }
}

- (BOOL)updateAdvertiser
{
  NSData *v3;
  NSData *advertisementData;
  NSData *rawAdvertisementData;

  v3 = (NSData *)objc_claimAutoreleasedReturnValue(-[SDActivityAdvertiser createAdvertisingInformation](self, "createAdvertisingInformation"));
  advertisementData = self->_advertisementData;
  self->_advertisementData = v3;

  rawAdvertisementData = self->_rawAdvertisementData;
  self->_rawAdvertisementData = 0;

  return -[SDActivityAdvertiser restart](self, "restart");
}

- (id)createAdvertisingInformation
{
  void *v3;
  id v4;
  char *v5;
  void *v6;
  unsigned int v7;
  char v8;
  NSDictionary *currentAdvertisementOptions;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSData **p_currentAdvertisementPayload;
  uint64_t v15;
  id v16;
  NSData *v17;
  _BYTE *v18;
  char v19;
  uint64_t v20;
  NSObject *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 14));
  objc_msgSend(v3, "setLength:", 14);
  v4 = objc_retainAutorelease(v3);
  v5 = (char *)objc_msgSend(v4, "mutableBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_currentAdvertisementOptions, "objectForKeyedSubscript:", SFActivityAdvertiserOptionFlagCopyPasteKey));
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    v8 = 8;
  else
    v8 = 0;
  *v5 = v8;
  currentAdvertisementOptions = self->_currentAdvertisementOptions;
  v10 = off_1007B0F10();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](currentAdvertisementOptions, "objectForKeyedSubscript:", v11));
  v13 = objc_msgSend(v12, "BOOLValue");

  v5[4] = v13;
  p_currentAdvertisementPayload = &self->_currentAdvertisementPayload;
  v16 = -[NSData length](*p_currentAdvertisementPayload, "length");
  v17 = *p_currentAdvertisementPayload;
  if (v16 == (id)9)
  {
    v18 = -[NSData bytes](v17, "bytes");
    v19 = v18[8];
    *(_QWORD *)(v5 + 5) = *(_QWORD *)v18;
    v5[13] = v19;
  }
  else if (v17)
  {
    v20 = handoff_log(v17, v15);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100088D78((id *)p_currentAdvertisementPayload, v21);

  }
  return v4;
}

- (id)encryptedAdvertisingInformation
{
  id v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  unsigned __int8 *v12;

  v2 = objc_retainAutorelease(-[NSData mutableCopy](self->_advertisementData, "mutableCopy"));
  v3 = (unsigned __int8 *)objc_msgSend(v2, "mutableBytes");
  v4 = v3 + 4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v3 + 4, 10));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
  v7 = *v3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100087778;
  v10[3] = &unk_100715EF0;
  v11 = v5;
  v12 = v3;
  v8 = v5;
  objc_msgSend(v6, "getTagAndCounterWhileEncryptingBytesInPlace:forAdvertisementWithVersion:handler:", v4, v7, v10);

  return v2;
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
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  os_activity_scope_state_s v19;
  _BYTE v20[24];

  v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidUpdateState", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter(v5, &v19);
  v8 = handoff_log(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (((unint64_t)objc_msgSend(v4, "state") & 0x8000000000000000) != 0
      || (uint64_t)objc_msgSend(v4, "state") > 3)
    {
      v10 = "UnexpectedState";
    }
    else
    {
      v10 = off_100715E50[(_QWORD)objc_msgSend(v4, "state")];
    }
    sub_100088EBC((uint64_t)v10, (uint64_t)v20, v9);
  }

  v11 = objc_msgSend(v4, "state");
  switch((unint64_t)v11)
  {
    case 0uLL:
      v13 = handoff_log(v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100088E64();
      goto LABEL_17;
    case 1uLL:
      v18 = handoff_log(v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_100088E90();
      goto LABEL_17;
    case 2uLL:
      v15 = handoff_log(v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_100088E38();
LABEL_17:

      break;
    case 3uLL:
      v16 = handoff_log(v11, v12);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        sub_100088E0C();

      -[SDActivityAdvertiser restart](self, "restart");
      break;
    default:
      break;
  }
  os_activity_scope_leave(&v19);

}

- (void)continuity:(id)a3 didStartAdvertisingOfType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  os_activity_scope_state_s v14;

  v6 = a3;
  v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidStartAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v7, &v14);
  if (!a4)
    self->_isAdvertising = 1;
  v10 = handoff_log(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100088EF8(a4, v11, v12);

  if (self->_isAdvertising)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    objc_msgSend(v13, "update");

  }
  os_activity_scope_leave(&v14);

}

- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  os_activity_scope_state_s v14;

  v6 = a3;
  v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidStopAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v7, &v14);
  if (!a4)
    self->_isAdvertising = 0;
  v10 = handoff_log(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100088F80(a4, v11, v12);

  if (!self->_isAdvertising)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    objc_msgSend(v13, "update");

  }
  os_activity_scope_leave(&v14);

}

- (void)continuity:(id)a3 continuityDidStopAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  -[SDActivityAdvertiser continuity:didStopAdvertisingOfType:withError:](self, "continuity:didStopAdvertisingOfType:withError:", a3, a4, a5);
}

- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSData *rawAdvertisementData;
  void *v27;
  uint8_t v28[16];
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidStopAdvertisingOfTypeWithError", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  if (!a4)
    self->_isAdvertising = 0;
  v13 = handoff_log(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_100089008(a4, (uint64_t)v9, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
  v16 = (void *)WPErrorDomain;
  v17 = v15;
  v18 = v16;
  if (v17 == v18)
  {

  }
  else
  {
    v19 = v18;
    if ((v17 == 0) == (v18 != 0))
    {

LABEL_15:
      goto LABEL_16;
    }
    v20 = objc_msgSend(v17, "isEqual:", v18);

    if (!v20)
      goto LABEL_15;
  }
  v21 = objc_msgSend(v9, "code");

  if (v21 == (id)28)
  {
    v24 = handoff_log(v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Advertising stopped due to address rotation, updating counter and restarting advertising", v28, 2u);
    }

    rawAdvertisementData = self->_rawAdvertisementData;
    self->_rawAdvertisementData = 0;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
    objc_msgSend(v27, "bumpEncryptionKeyCounterValue");

    -[SDActivityAdvertiser restart](self, "restart");
  }
LABEL_16:
  os_activity_scope_leave(&state);

}

- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
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
  void (**currentErrorHandler)(id, id);
  os_activity_scope_state_s v18;
  uint8_t buf[24];

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidFailToStartAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v10, &v18);
  if (!a4)
    self->_isAdvertising = 0;
  v13 = handoff_log(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    if ((unint64_t)a4 > 3)
      v15 = "UnexpectedType";
    else
      v15 = off_100715F10[a4];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
    sub_1000890A0((uint64_t)v15, v16, buf, v14);
  }

  currentErrorHandler = (void (**)(id, id))self->_currentErrorHandler;
  if (currentErrorHandler)
    currentErrorHandler[2](currentErrorHandler, v9);
  os_activity_scope_leave(&v18);

}

- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4 withErrorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SDActivityAdvertiser *v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000880DC;
  v11[3] = &unk_100715F60;
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = a5;
  v8 = v15;
  v9 = v13;
  v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

- (void)loginIDWithOptions:(id)a3 completionHandler:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100088510;
  v5[3] = &unk_1007159D0;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)peerForUUID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088600;
  block[3] = &unk_100714F68;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)pairedSFPeerDevicesWithOptions:(id)a3 completionHandler:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100088778;
  v5[3] = &unk_100714F40;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentErrorHandler, 0);
  objc_storeStrong((id *)&self->_currentAdvertisementOptions, 0);
  objc_storeStrong((id *)&self->_currentAdvertisementPayload, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_rawAdvertisementData, 0);
  objc_storeStrong((id *)&self->_advertisingTransaction, 0);
  objc_storeStrong((id *)&self->_shouldNotAdvertiseRequesters, 0);
  objc_storeStrong((id *)&self->_goodbyeTimer, 0);
  objc_storeStrong((id *)&self->_continuity, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
