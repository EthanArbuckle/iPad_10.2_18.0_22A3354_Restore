@implementation NIServerFindingDiscoveryProvider

- (NIServerFindingDiscoveryProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 enableBluetooth:(BOOL)a5 launchOnDemand:(BOOL)a6 scanRate:(int)a7 discoveryTimeout:(double)a8 oobRefreshPeriod:(double)a9 consumer:(id)a10 queue:(id)a11
{
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  id v19;
  id v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  char *v24;
  char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableSet *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  NSMutableDictionary *v38;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  NSMutableDictionary *v42;
  void *v43;
  NSMutableDictionary *v44;
  void *v45;
  objc_super v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;

  v14 = a6;
  v15 = a5;
  v16 = a4;
  v19 = a10;
  v20 = a11;
  if (!v19)
    __assert_rtn("-[NIServerFindingDiscoveryProvider initWithIdentifier:isFinder:enableBluetooth:launchOnDemand:scanRate:discoveryTimeout:oobRefreshPeriod:consumer:queue:]", "NIServerFindingDiscovery.mm", 802, "consumer");
  v21 = (id)qword_10085F520;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = sub_1002B69E0(v16);
    if (a7 > 34)
    {
      if (a7 > 49)
      {
        if (a7 == 50)
        {
          v23 = "High";
          goto LABEL_23;
        }
        if (a7 == 60)
        {
          v23 = "Max";
          goto LABEL_23;
        }
      }
      else
      {
        if (a7 == 35)
        {
          v23 = "MediumLow";
          goto LABEL_23;
        }
        if (a7 == 40)
        {
          v23 = "Medium";
          goto LABEL_23;
        }
      }
    }
    else if (a7 > 19)
    {
      if (a7 == 20)
      {
        v23 = "Background";
        goto LABEL_23;
      }
      if (a7 == 30)
      {
        v23 = "Low";
        goto LABEL_23;
      }
    }
    else
    {
      if (!a7)
      {
        v23 = "Default";
        goto LABEL_23;
      }
      if (a7 == 10)
      {
        v23 = "Periodic";
LABEL_23:
        *(_DWORD *)buf = 136316418;
        v49 = v22;
        v50 = 1024;
        v51 = v15;
        v52 = 1024;
        v53 = v14;
        v54 = 2080;
        v55 = v23;
        v56 = 2048;
        v57 = a8;
        v58 = 2048;
        v59 = a9;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] init. Enable BT: %d. Launch on demand: %d. Scan rate: %s. Discovery timeout: %0.1f s. OOB refresh: %0.1f s", buf, 0x36u);
        goto LABEL_24;
      }
    }
    v23 = "?";
    goto LABEL_23;
  }
LABEL_24:

  v47.receiver = self;
  v47.super_class = (Class)NIServerFindingDiscoveryProvider;
  v24 = -[NIServerFindingDiscoveryProvider init](&v47, "init");
  v25 = v24;
  if (v24)
  {
    std::string::operator=((std::string *)(v24 + 8), (const std::string *)a3);
    v25[32] = v16;
    objc_storeWeak((id *)v25 + 5, v19);
    objc_storeStrong((id *)v25 + 6, a11);
    v25[56] = v15;
    v25[57] = v14;
    *((_DWORD *)v25 + 15) = a7;
    v26 = (void *)*((_QWORD *)v25 + 8);
    *((_QWORD *)v25 + 8) = 0;

    v25[72] = 0;
    v27 = (void *)*((_QWORD *)v25 + 10);
    *((_QWORD *)v25 + 10) = 0;

    v25[88] = 0;
    v28 = (void *)*((_QWORD *)v25 + 12);
    *((_QWORD *)v25 + 12) = 0;

    v29 = (void *)*((_QWORD *)v25 + 13);
    *((_QWORD *)v25 + 13) = 0;

    v30 = (void *)*((_QWORD *)v25 + 25);
    *((_QWORD *)v25 + 25) = 0;

    v25[112] = 0;
    v31 = (void *)*((_QWORD *)v25 + 15);
    *((_QWORD *)v25 + 15) = 0;

    v32 = objc_opt_new(NSMutableSet);
    v33 = (void *)*((_QWORD *)v25 + 16);
    *((_QWORD *)v25 + 16) = v32;

    v34 = objc_opt_new(NSMutableDictionary);
    v35 = (void *)*((_QWORD *)v25 + 17);
    *((_QWORD *)v25 + 17) = v34;

    v36 = objc_opt_new(NSMutableDictionary);
    v37 = (void *)*((_QWORD *)v25 + 18);
    *((_QWORD *)v25 + 18) = v36;

    v38 = objc_opt_new(NSMutableDictionary);
    v39 = (void *)*((_QWORD *)v25 + 19);
    *((_QWORD *)v25 + 19) = v38;

    *((double *)v25 + 20) = fmax(a8, 30.0);
    v40 = objc_opt_new(NSMutableDictionary);
    v41 = (void *)*((_QWORD *)v25 + 21);
    *((_QWORD *)v25 + 21) = v40;

    v42 = objc_opt_new(NSMutableDictionary);
    v43 = (void *)*((_QWORD *)v25 + 22);
    *((_QWORD *)v25 + 22) = v42;

    v44 = objc_opt_new(NSMutableDictionary);
    v45 = (void *)*((_QWORD *)v25 + 23);
    *((_QWORD *)v25 + 23) = v44;

    *((double *)v25 + 24) = a9;
  }

  return (NIServerFindingDiscoveryProvider *)v25;
}

- (void)activate
{
  CBController *v3;
  OS_dispatch_queue *consumerQueue;
  NSString *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  double v9;
  OS_dispatch_queue *v10;
  CBAdvertiser *v11;
  CBController *controller;
  NSString *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  double v17;
  CBController *v18;
  _QWORD v19[4];
  id v20[2];
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24[2];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  uint8_t buf[4];
  const char *v33;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  objc_initWeak(&location, self);
  if (!self->_consumerQueue)
  {
    v3 = objc_opt_new(CBController);
    consumerQueue = self->_consumerQueue;
    self->_consumerQueue = v3;

    -[OS_dispatch_queue setDispatchQueue:](self->_consumerQueue, "setDispatchQueue:", *(_QWORD *)&self->_isFinder);
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("nearbyd%s"), sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0)));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[OS_dispatch_queue setLabel:](self->_consumerQueue, "setLabel:", v6);

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1002DE440;
    v29[3] = &unk_1007FA078;
    objc_copyWeak(&v30, &location);
    -[OS_dispatch_queue setInterruptionHandler:](self->_consumerQueue, "setInterruptionHandler:", v29);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1002DE488;
    v27[3] = &unk_1007FA0A0;
    objc_copyWeak(&v28, &location);
    -[OS_dispatch_queue setErrorHandler:](self->_consumerQueue, "setErrorHandler:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1002DE4E8;
    v25[3] = &unk_1007FA078;
    objc_copyWeak(&v26, &location);
    -[OS_dispatch_queue setBluetoothStateChangedHandler:](self->_consumerQueue, "setBluetoothStateChangedHandler:", v25);
    self->_enableBluetooth = 0;
    v7 = (id)qword_10085F520;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315138;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] activate controller", buf, 0xCu);
    }

    v9 = sub_10000883C();
    v10 = self->_consumerQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1002DE530;
    v23[3] = &unk_100809B40;
    v24[1] = *(id *)&v9;
    objc_copyWeak(v24, &location);
    -[OS_dispatch_queue activateWithCompletion:](v10, "activateWithCompletion:", v23);
    objc_destroyWeak(v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
  }
  if (!self->_controller)
  {
    v11 = objc_opt_new(CBAdvertiser);
    controller = self->_controller;
    self->_controller = v11;

    -[CBController setDispatchQueue:](self->_controller, "setDispatchQueue:", *(_QWORD *)&self->_isFinder);
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("nearbyd%s"), sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0)));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[CBController setLabel:](self->_controller, "setLabel:", v14);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002DE6A4;
    v21[3] = &unk_1007FA078;
    objc_copyWeak(&v22, &location);
    -[CBController setAdvertisingAddressChangedHandler:](self->_controller, "setAdvertisingAddressChangedHandler:", v21);
    self->_activatedController = 0;
    v15 = (id)qword_10085F520;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315138;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] activate address observer", buf, 0xCu);
    }

    v17 = sub_10000883C();
    v18 = self->_controller;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002DE6EC;
    v19[3] = &unk_100809B40;
    v20[1] = *(id *)&v17;
    objc_copyWeak(v20, &location);
    -[CBController activateWithCompletion:](v18, "activateWithCompletion:", v19);
    objc_destroyWeak(v20);
    objc_destroyWeak(&v22);
  }
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  OS_dispatch_queue *consumerQueue;
  OS_dispatch_queue *v4;
  CBController *controller;
  CBController *v6;
  CBAdvertiser *addressObserver;
  CBAdvertiser *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *advertisingTimeoutTimers;
  NSMutableDictionary *discoveryTimeoutTimers;
  _QWORD v13[5];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  consumerQueue = self->_consumerQueue;
  if (consumerQueue)
  {
    -[OS_dispatch_queue invalidate](consumerQueue, "invalidate");
    v4 = self->_consumerQueue;
    self->_consumerQueue = 0;

  }
  controller = self->_controller;
  if (controller)
  {
    -[CBController invalidate](controller, "invalidate");
    v6 = self->_controller;
    self->_controller = 0;

  }
  addressObserver = self->_addressObserver;
  if (addressObserver)
  {
    -[CBAdvertiser invalidate](addressObserver, "invalidate");
    v8 = self->_addressObserver;
    self->_addressObserver = 0;

  }
  v9 = *(void **)&self->_activatedAddressObserver;
  if (v9)
  {
    objc_msgSend(v9, "invalidate");
    v10 = *(void **)&self->_activatedAddressObserver;
    *(_QWORD *)&self->_activatedAddressObserver = 0;

    advertisingTimeoutTimers = self->_advertisingTimeoutTimers;
    self->_advertisingTimeoutTimers = 0;

  }
  self->_enableBluetooth = 0;
  self->_activatedController = 0;
  LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
  discoveryTimeoutTimers = self->_discoveryTimeoutTimers;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002DE96C;
  v13[3] = &unk_10080CB18;
  v13[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveryTimeoutTimers, "enumerateKeysAndObjectsUsingBlock:", v13);
  -[NIServerFindingDiscoveryProvider _resetDiscoveryStateForAllPeers](self, "_resetDiscoveryStateForAllPeers");
  -[NIServerFindingDiscoveryProvider _resetAdvertisingStateForAllPeers](self, "_resetAdvertisingStateForAllPeers");
  objc_msgSend(*(id *)&self->_activatedScanner, "removeAllObjects");
  -[NIServerFindingDiscoveryProvider _updateLaunchOnDemandScannerAndRequestScan:](self, "_updateLaunchOnDemandScannerAndRequestScan:", 0);
}

- (id)setPeersEligibleForDiscovery:(id)a3 requestScan:(BOOL)a4
{
  _BOOL8 v4;
  NSSet *v6;
  NSObject *v7;
  const char *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  OS_dispatch_source *disableScanDupeConfigTimer;
  NSSet *v15;
  NSMutableArray *v16;
  NSMutableDictionary *discoveredPeers;
  NSSet *v18;
  NSMutableArray *v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  NSSet *v31;
  NSMutableArray *v32;
  _QWORD v33[4];
  NSSet *v34;
  NSMutableArray *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  void *v43;

  v4 = a4;
  v6 = (NSSet *)a3;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    v9 = -[NSSet count](v6, "count");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v6, "allObjects"));
    v11 = sub_1002B6FA8(v10, 10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 136315907;
    v37 = v8;
    v38 = 1024;
    v39 = v4;
    v40 = 1024;
    v41 = v9;
    v42 = 2113;
    v43 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] setPeersEligibleForDiscovery. requestScan: %d. Peers (%d): %{private}@", buf, 0x22u);

  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v6)
    v6 = objc_opt_new(NSSet);
  v13 = objc_opt_new(NSMutableArray);
  disableScanDupeConfigTimer = self->_disableScanDupeConfigTimer;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1002DED88;
  v33[3] = &unk_100814C28;
  v15 = v6;
  v34 = v15;
  v16 = v13;
  v35 = v16;
  -[OS_dispatch_source enumerateKeysAndObjectsUsingBlock:](disableScanDupeConfigTimer, "enumerateKeysAndObjectsUsingBlock:", v33);
  -[OS_dispatch_source removeObjectsForKeys:](self->_disableScanDupeConfigTimer, "removeObjectsForKeys:", v16);
  -[NSMutableSet removeObjectsForKeys:](self->_eligibleDiscoveryPeers, "removeObjectsForKeys:", v16);
  -[NSMutableArray removeAllObjects](v16, "removeAllObjects");
  discoveredPeers = self->_discoveredPeers;
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_1002DEDE8;
  v30 = &unk_100814C50;
  v18 = v15;
  v31 = v18;
  v19 = v16;
  v32 = v19;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredPeers, "enumerateKeysAndObjectsUsingBlock:", &v27);
  -[NSMutableDictionary removeObjectsForKeys:](self->_discoveredPeers, "removeObjectsForKeys:", v19, v27, v28, v29, v30);
  v20 = -[NSSet mutableCopy](v18, "mutableCopy");
  v21 = *(void **)&self->_activatedScanner;
  *(_QWORD *)&self->_activatedScanner = v20;

  if (!LOBYTE(self->_consumer))
  {
    v24 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#find-disc,BT not enabled. Skipping configuring scanner.", buf, 2u);
    }
    goto LABEL_14;
  }
  v22 = sub_1002B66E4(LOBYTE(self->_identifier.__r_.var0) == 0);
  if (v22 == 19)
  {
    v23 = objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _configureSpatialInteractionScannerAndRequestScan:](self, "_configureSpatialInteractionScannerAndRequestScan:", v4));
  }
  else
  {
    if (v22 != 26)
    {
LABEL_13:
      -[NIServerFindingDiscoveryProvider _updateLaunchOnDemandScannerAndRequestScan:](self, "_updateLaunchOnDemandScannerAndRequestScan:", v4);
LABEL_14:
      v25 = 0;
      goto LABEL_15;
    }
    v23 = objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _configureNearbyActionNoWakeScannerAndRequestScan:](self, "_configureNearbyActionNoWakeScannerAndRequestScan:", v4));
  }
  v25 = (void *)v23;
  if (!v23)
    goto LABEL_13;
LABEL_15:

  return v25;
}

- (id)startAdvertisingToPeer:(id)a3 advertisement:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  unsigned __int8 v23;
  NSObject *v24;
  const char *v26;
  int v27;
  _QWORD block[5];
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  double v36;
  __int16 v37;
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    *(_DWORD *)buf = 136315907;
    v32 = v11;
    v33 = 2113;
    v34 = v8;
    v35 = 2048;
    v36 = a5;
    v37 = 2113;
    v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] startAdvertisingToPeer: %{private}@. Timeout: %0.1f s. Advertisement: %{private}@", buf, 0x2Au);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v8)
  {
    v26 = "token";
    v27 = 1067;
    goto LABEL_19;
  }
  if (!v9)
  {
    v26 = "advertisement";
    v27 = 1068;
LABEL_19:
    __assert_rtn("-[NIServerFindingDiscoveryProvider startAdvertisingToPeer:advertisement:timeout:]", "NIServerFindingDiscovery.mm", v27, v26);
  }
  if (LOBYTE(self->_consumer))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_FindingAdvertiser sharedInstance](_FindingAdvertiser, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startAdvertisingAsFinder:toPeer:withAdvertisement:", LOBYTE(self->_identifier.__r_.var0), v8, v9));

    if (v13)
    {
      v14 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E8E08((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
      goto LABEL_16;
    }
  }
  else
  {
    v21 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-disc,BT not enabled. Skipping configuring advertiser.", buf, 2u);
    }
  }
  if (a5 > 0.0)
    -[NIServerFindingDiscoveryProvider _configureAdvertisementTimeout:forToken:](self, "_configureAdvertisementTimeout:forToken:", v8, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_discoveryTimeoutTimers, "objectForKey:", v8));
  v23 = objc_msgSend(v9, "isEqual:", v22);

  if ((v23 & 1) == 0)
  {
    v24 = *(NSObject **)&self->_isFinder;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002DF154;
    block[3] = &unk_100809CB0;
    block[4] = self;
    v29 = v9;
    v30 = v8;
    dispatch_async(v24, block);

  }
  -[NSMutableDictionary setObject:forKey:](self->_discoveryTimeoutTimers, "setObject:forKey:", v9, v8);
  v13 = 0;
LABEL_16:

  return v13;
}

- (id)stopAdvertisingToPeer:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    v24 = 136315395;
    v25 = v6;
    v26 = 2113;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] stopAdvertisingToPeer: %{private}@", (uint8_t *)&v24, 0x16u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v4)
    __assert_rtn("-[NIServerFindingDiscoveryProvider stopAdvertisingToPeer:]", "NIServerFindingDiscovery.mm", 1105, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_FindingAdvertiser sharedInstance](_FindingAdvertiser, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stopAdvertisingAsFinder:toPeer:", LOBYTE(self->_identifier.__r_.var0), v4));

  if (v8)
  {
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E8E6C((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = v8;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "objectForKey:", v4));
    v18 = v17 == 0;

    if (!v18)
    {
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "objectForKey:", v4));
      dispatch_source_cancel(v19);

      objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "removeObjectForKey:", v4);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_advertisingPeers, "objectForKey:", v4));
    v21 = v20 == 0;

    if (!v21)
    {
      v22 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_advertisingPeers, "objectForKey:", v4));
      dispatch_source_cancel(v22);

      -[NSMutableDictionary removeObjectForKey:](self->_advertisingPeers, "removeObjectForKey:", v4);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_discoveryTimeoutTimers, "removeObjectForKey:", v4);
  }

  return v8;
}

- (NSSet)peersEligibleForDiscovery
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  return (NSSet *)*(id *)&self->_activatedScanner;
}

- (NSDictionary)discoveredPeers
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  return (NSDictionary *)self->_disableScanDupeConfigTimer;
}

- (NSDictionary)advertisingPeers
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  return (NSDictionary *)self->_discoveryTimeoutTimers;
}

- (array<unsigned)advertisingAddress
{
  void *v3;
  uint64_t v4;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _cbAdvertisingAddress](self, "_cbAdvertisingAddress"));
  v4 = (uint64_t)+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:](NIServerFindingAdvertisement, "convertCBAddressToRoseAddress:", v3);

  return (array<unsigned char, 6UL>)v4;
}

- (id)processAdvertisement:(id)a3 receivedOOBFromPeer:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (qword_10085D668 != -1)
    dispatch_once(&qword_10085D668, &stru_100814D88);
  v8 = byte_10085D670;
  v9 = (id)qword_10085F520;
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      v14 = 136315651;
      v15 = v11;
      v16 = 2113;
      v17 = v7;
      v18 = 2113;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] IGNORING processAdvertisementReceivedOOB (disabled in defaults). Peer: %{private}@. Adv: %{private}@", (uint8_t *)&v14, 0x20u);
    }

  }
  else
  {
    if (v10)
    {
      v12 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      v14 = 136315651;
      v15 = v12;
      v16 = 2113;
      v17 = v7;
      v18 = 2113;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] processAdvertisementReceivedOOB. Peer: %{private}@. Adv: %{private}@", (uint8_t *)&v14, 0x20u);
    }

    -[NIServerFindingDiscoveryProvider _processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:](self, "_processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:", v6, v7, 0, 0);
  }

  return 0;
}

- (id)processLostEventReceivedOOBFromPeer:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (qword_10085D668 != -1)
    dispatch_once(&qword_10085D668, &stru_100814D88);
  v5 = byte_10085D670;
  v6 = (id)qword_10085F520;
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315395;
      v16 = v8;
      v17 = 2113;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] IGNORING processLostEventReceivedOOB (disabled in defaults). Peer: %{private}@", buf, 0x16u);
    }

  }
  else
  {
    if (v7)
    {
      v9 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315395;
      v16 = v9;
      v17 = 2113;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] processLostEventReceivedOOB. Peer: %{private}@", buf, 0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OS_dispatch_source objectForKey:](self->_disableScanDupeConfigTimer, "objectForKey:", v4));
    -[NIServerFindingDiscoveryProvider _resetDiscoveryStateForPeer:](self, "_resetDiscoveryStateForPeer:", v4);
    if (v10)
    {
      v11 = *(NSObject **)&self->_isFinder;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1002DF8A4;
      v13[3] = &unk_1007FA518;
      v13[4] = self;
      v14 = v4;
      dispatch_async(v11, v13);

    }
  }

  return 0;
}

- (id)printableState
{
  void *v3;
  const char *v4;
  int consumer_high;
  const char *v6;
  void *v7;
  OS_dispatch_queue *consumerQueue;
  void *v9;
  unint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  CBController *controller;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  CBAdvertiser *addressObserver;
  void *v25;
  int v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  id v32;
  const char *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  const char *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  OS_dispatch_source *disableScanDupeConfigTimer;
  void *v53;
  void *v54;
  NSMutableSet *eligibleDiscoveryPeers;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  NSMutableDictionary *discoveryTimeoutTimers;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[5];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  NSMutableArray *v90;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = sub_1002DAF54;
  v89 = sub_1002DAF64;
  v90 = objc_opt_new(NSMutableArray);
  v3 = (void *)v86[5];
  v4 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
  consumer_high = HIDWORD(self->_consumer);
  if (consumer_high > 34)
  {
    if (consumer_high > 49)
    {
      if (consumer_high == 50)
      {
        v6 = "High";
        goto LABEL_21;
      }
      if (consumer_high == 60)
      {
        v6 = "Max";
        goto LABEL_21;
      }
    }
    else
    {
      if (consumer_high == 35)
      {
        v6 = "MediumLow";
        goto LABEL_21;
      }
      if (consumer_high == 40)
      {
        v6 = "Medium";
        goto LABEL_21;
      }
    }
LABEL_20:
    v6 = "?";
    goto LABEL_21;
  }
  if (consumer_high > 19)
  {
    if (consumer_high == 20)
    {
      v6 = "Background";
      goto LABEL_21;
    }
    if (consumer_high == 30)
    {
      v6 = "Low";
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!consumer_high)
  {
    v6 = "Default";
    goto LABEL_21;
  }
  if (consumer_high != 10)
    goto LABEL_20;
  v6 = "Periodic";
LABEL_21:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Discovery provider (%s). EnableBT: %d. LaunchOnDemand: %d. ScanRate: %s. DiscTimeout: %0.1f s. OOBRefresh: %0.1f s"), v4, LOBYTE(self->_consumer), BYTE1(self->_consumer), v6, self->_didDiscoverPeerTimestamps, self->_advertisingOOBRefreshTimers));
  objc_msgSend(v3, "addObject:", v7);

  consumerQueue = self->_consumerQueue;
  if (consumerQueue && self->_enableBluetooth)
  {
    v9 = (void *)v86[5];
    v10 = (unint64_t)-[OS_dispatch_queue bluetoothState](consumerQueue, "bluetoothState");
    if (v10 > 0xA)
      v11 = "?";
    else
      v11 = off_100814DA8[v10];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    BT state: %s"), v11));
    objc_msgSend(v9, "addObject:", v13);
  }
  else
  {
    v12 = (void *)v86[5];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    BT state unknown. Controller: %d. Activated: %d"), consumerQueue != 0, self->_enableBluetooth));
    objc_msgSend(v12, "addObject:", v13);
  }

  controller = self->_controller;
  if (controller && self->_activatedController)
  {
    v15 = (void *)v86[5];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBController advertisingAddressDataNonConnectable](controller, "advertisingAddressDataNonConnectable"));
    v17 = CUPrintNSDataAddress();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBController advertisingAddressDataConnectable](self->_controller, "advertisingAddressDataConnectable"));
    v20 = CUPrintNSDataAddress();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Addresses: NCA %@, CA %@."), v18, v21));
    objc_msgSend(v15, "addObject:", v22);

  }
  else
  {
    v23 = (void *)v86[5];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Address unknown. Observer: %d. Activated: %d"), controller != 0, self->_activatedController));
    objc_msgSend(v23, "addObject:", v16);
  }

  addressObserver = self->_addressObserver;
  if (addressObserver)
  {
    v25 = (void *)v86[5];
    if (LOBYTE(self->_nearbyActionNoWakeScanner))
    {
      v26 = -[CBAdvertiser bleScanRate](addressObserver, "bleScanRate");
      if (v26 > 34)
      {
        if (v26 > 49)
        {
          if (v26 == 50)
          {
            v27 = "High";
            goto LABEL_62;
          }
          if (v26 == 60)
          {
            v27 = "Max";
            goto LABEL_62;
          }
        }
        else
        {
          if (v26 == 35)
          {
            v27 = "MediumLow";
            goto LABEL_62;
          }
          if (v26 == 40)
          {
            v27 = "Medium";
            goto LABEL_62;
          }
        }
      }
      else if (v26 > 19)
      {
        if (v26 == 20)
        {
          v27 = "Background";
          goto LABEL_62;
        }
        if (v26 == 30)
        {
          v27 = "Low";
          goto LABEL_62;
        }
      }
      else
      {
        if (!v26)
        {
          v27 = "Default";
          goto LABEL_62;
        }
        if (v26 == 10)
        {
          v27 = "Periodic";
LABEL_62:
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiser oobKeys](self->_addressObserver, "oobKeys"));
          v32 = objc_msgSend(v30, "count");
          if (self->_spatialInteractionScanner)
            v33 = "Y";
          else
            v33 = "N";
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    T26 scan rate: %s. OOB keys: %d. Disabling scan dupes pending: %s"), v27, v32, v33));
          objc_msgSend(v25, "addObject:", v34);

          goto LABEL_66;
        }
      }
      v27 = "?";
      goto LABEL_62;
    }
    if (self->_spatialInteractionScanner)
      v31 = "Y";
    else
      v31 = "N";
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    T26 scanner still activating. Disabling scan dupes pending: %s"), v31));
    objc_msgSend(v25, "addObject:", v30);
  }
  else
  {
    v28 = (void *)v86[5];
    if (self->_spatialInteractionScanner)
      v29 = "Y";
    else
      v29 = "N";
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    T26 scanner nil. Disabling scan dupes pending: %s"), v29));
    objc_msgSend(v28, "addObject:", v30);
  }
LABEL_66:

  if (*(_QWORD *)&self->_activatedAddressObserver)
  {
    v35 = (void *)v86[5];
    if (LOBYTE(self->_nearbyActionNoWakeScanner))
    {
      v36 = sub_1002B6B04(self->_advertisingTimeoutTimers);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    T19 scanner activation time: %@"), v37));
      objc_msgSend(v35, "addObject:", v38);

      v39 = (void *)v86[5];
      v40 = objc_msgSend(*(id *)&self->_activatedAddressObserver, "scanRate");
      if (v40 > 34)
      {
        if (v40 > 49)
        {
          if (v40 == 50)
          {
            v41 = "High";
            goto LABEL_91;
          }
          if (v40 == 60)
          {
            v41 = "Max";
            goto LABEL_91;
          }
        }
        else
        {
          if (v40 == 35)
          {
            v41 = "MediumLow";
            goto LABEL_91;
          }
          if (v40 == 40)
          {
            v41 = "Medium";
            goto LABEL_91;
          }
        }
      }
      else if (v40 > 19)
      {
        if (v40 == 20)
        {
          v41 = "Background";
          goto LABEL_91;
        }
        if (v40 == 30)
        {
          v41 = "Low";
          goto LABEL_91;
        }
      }
      else
      {
        if (!v40)
        {
          v41 = "Default";
          goto LABEL_91;
        }
        if (v40 == 10)
        {
          v41 = "Periodic";
LABEL_91:
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    T19 scan rate: %s"), v41));
          objc_msgSend(v39, "addObject:", v43);

          goto LABEL_92;
        }
      }
      v41 = "?";
      goto LABEL_91;
    }
    v42 = CFSTR("    T19 scanner still activating");
  }
  else
  {
    v35 = (void *)v86[5];
    v42 = CFSTR("    T19 scanner nil");
  }
  objc_msgSend(v35, "addObject:", v42);
LABEL_92:
  v44 = (void *)v86[5];
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Eligible discovery peers (%d)"), objc_msgSend(*(id *)&self->_activatedScanner, "count")));
  objc_msgSend(v44, "addObject:", v45);

  v46 = (void *)v86[5];
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->_activatedScanner, "allObjects"));
  v48 = sub_1002B6FA8(v47, 10, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  objc_msgSend(v46, "addObjectsFromArray:", v49);

  v50 = (void *)v86[5];
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Discovered peers (%d)"), -[OS_dispatch_source count](self->_disableScanDupeConfigTimer, "count")));
  objc_msgSend(v50, "addObject:", v51);

  disableScanDupeConfigTimer = self->_disableScanDupeConfigTimer;
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_1002E0444;
  v84[3] = &unk_100814C78;
  v84[4] = &v85;
  -[OS_dispatch_source enumerateKeysAndObjectsUsingBlock:](disableScanDupeConfigTimer, "enumerateKeysAndObjectsUsingBlock:", v84);
  v53 = (void *)v86[5];
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Timestamps for didDiscoverPeer (%d)"), -[NSMutableSet count](self->_eligibleDiscoveryPeers, "count")));
  objc_msgSend(v53, "addObject:", v54);

  eligibleDiscoveryPeers = self->_eligibleDiscoveryPeers;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_1002E0504;
  v83[3] = &unk_100814CA0;
  v83[4] = &v85;
  -[NSMutableSet enumerateKeysAndObjectsUsingBlock:](eligibleDiscoveryPeers, "enumerateKeysAndObjectsUsingBlock:", v83);
  v56 = (void *)v86[5];
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Discovery timeout timers (%d)"), -[NSMutableDictionary count](self->_discoveredPeers, "count")));
  objc_msgSend(v56, "addObject:", v57);

  v58 = (void *)v86[5];
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_discoveredPeers, "allKeys"));
  v60 = sub_1002B6FA8(v59, 10, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  objc_msgSend(v58, "addObjectsFromArray:", v61);

  v62 = (void *)v86[5];
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Advertising peers (%d)"), -[NSMutableDictionary count](self->_discoveryTimeoutTimers, "count")));
  objc_msgSend(v62, "addObject:", v63);

  discoveryTimeoutTimers = self->_discoveryTimeoutTimers;
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_1002E05E0;
  v82[3] = &unk_100814C78;
  v82[4] = &v85;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveryTimeoutTimers, "enumerateKeysAndObjectsUsingBlock:", v82);
  v65 = (void *)v86[5];
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Advertising OOB refresh timers (%d)"), objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "count")));
  objc_msgSend(v65, "addObject:", v66);

  v67 = (void *)v86[5];
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "allKeys"));
  v69 = sub_1002B6FA8(v68, 10, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  objc_msgSend(v67, "addObjectsFromArray:", v70);

  v71 = (void *)v86[5];
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Advertising timeout timers (%d)"), -[NSMutableDictionary count](self->_advertisingPeers, "count")));
  objc_msgSend(v71, "addObject:", v72);

  v73 = (void *)v86[5];
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_advertisingPeers, "allKeys"));
  v75 = sub_1002B6FA8(v74, 10, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
  objc_msgSend(v73, "addObjectsFromArray:", v76);

  v77 = (void *)v86[5];
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[_FindingAdvertiser sharedInstance](_FindingAdvertiser, "sharedInstance"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "printableState"));
  objc_msgSend(v77, "addObjectsFromArray:", v79);

  v80 = (id)v86[5];
  _Block_object_dispose(&v85, 8);

  return v80;
}

- (void)_resetDiscoveryStateForPeer:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  -[OS_dispatch_source removeObjectForKey:](self->_disableScanDupeConfigTimer, "removeObjectForKey:", v6);
  -[NSMutableSet removeObjectForKey:](self->_eligibleDiscoveryPeers, "removeObjectForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_discoveredPeers, "objectForKey:", v6));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_discoveredPeers, "objectForKey:", v6));
    dispatch_source_cancel(v5);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_discoveredPeers, "removeObjectForKey:", v6);
  if (!-[OS_dispatch_source count](self->_disableScanDupeConfigTimer, "count")
    && sub_1002B66E4(LOBYTE(self->_identifier.__r_.var0) == 0) == 26)
  {
    -[NIServerFindingDiscoveryProvider _nearbyActionNoWakeDisableScanDupesIfNecessary](self, "_nearbyActionNoWakeDisableScanDupesIfNecessary");
  }

}

- (void)_resetDiscoveryStateForAllPeers
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  -[OS_dispatch_source removeAllObjects](self->_disableScanDupeConfigTimer, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_eligibleDiscoveryPeers, "removeAllObjects");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_discoveredPeers, "enumerateKeysAndObjectsUsingBlock:", &stru_100814CE0);
  -[NSMutableDictionary removeAllObjects](self->_discoveredPeers, "removeAllObjects");
}

- (void)_resetAdvertisingStateForAllPeers
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  -[NSMutableDictionary removeAllObjects](self->_discoveryTimeoutTimers, "removeAllObjects");
  objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "enumerateKeysAndObjectsUsingBlock:", &stru_100814D00);
  objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "removeAllObjects");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_advertisingPeers, "enumerateKeysAndObjectsUsingBlock:", &stru_100814D20);
  -[NSMutableDictionary removeAllObjects](self->_advertisingPeers, "removeAllObjects");
}

- (void)_processReceivedAdvertisement:(id)a3 fromPeer:(id)a4 overBluetooth:(BOOL)a5 cbDevice:(id)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  double v15;
  _BOOL4 v16;
  int v17;
  NSObject *v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  double v24;
  double v25;
  id WeakRetained;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *spatialInteractionScanner;
  CBSpatialInteractionSession *v31;
  NSObject *v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  _BYTE v46[10];
  __int16 v47;
  id v48;

  v7 = a5;
  v34 = a3;
  v10 = a4;
  v33 = a6;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OS_dispatch_source objectForKey:](self->_disableScanDupeConfigTimer, "objectForKey:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet objectForKey:](self->_eligibleDiscoveryPeers, "objectForKey:", v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  if (v11)
  {
    v14 = objc_msgSend(v34, "isEqual:", v11) ^ 1;
    if (v12)
      goto LABEL_3;
LABEL_13:
    v16 = 1;
    goto LABEL_14;
  }
  v14 = 1;
  if (!v12)
    goto LABEL_13;
LABEL_3:
  objc_msgSend(v13, "timeIntervalSinceDate:", v12);
  v16 = v15 >= 2.0;
  if (v15 >= 2.0)
    v17 = 1;
  else
    v17 = v14;
  if (v17 != 1)
  {
    v18 = (id)qword_10085F520;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      v20 = "OOB";
      *(_DWORD *)buf = 136315907;
      v40 = v19;
      v41 = 2080;
      if (v7)
        v20 = "BT";
      v42 = v20;
      v43 = 2113;
      v44 = v10;
      v45 = 2113;
      *(_QWORD *)v46 = v33;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#find-disc,[%s] Found device (%s) for token %{private}@, but ignoring. Device: %{private}@", buf, 0x2Au);
    }
LABEL_38:

    goto LABEL_39;
  }
LABEL_14:
  v21 = (id)qword_10085F520;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    v23 = "OOB";
    *(_DWORD *)buf = 136316419;
    v40 = v22;
    v41 = 2080;
    if (v7)
      v23 = "BT";
    v42 = v23;
    v43 = 2113;
    v44 = v10;
    v45 = 1024;
    *(_DWORD *)v46 = v14;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v16;
    v47 = 2113;
    v48 = v33;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] Found device (%s) for token %{private}@. IsNew: %d. BeenTooLong: %d. Device: %{private}@", buf, 0x36u);
  }

  if (v7 && sub_1002B66E4((int)objc_msgSend(v34, "isFinder")) == 19)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[NSObject timeIntervalSinceDate:](v18, "timeIntervalSinceDate:", self->_advertisingTimeoutTimers);
    v25 = v24;
    if (v24 < 0.1)
    {
      v32 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v40 = *(const char **)&v25;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#find-disc,DO NOT PROCESS: Stale advertisment thats a cached dupe from previously configured scanner (delivery time from when scanner was configured = %f)", buf, 0xCu);
      }
      goto LABEL_38;
    }

  }
  if (objc_msgSend(*(id *)&self->_activatedScanner, "containsObject:", v10))
  {
    -[OS_dispatch_source setObject:forKey:](self->_disableScanDupeConfigTimer, "setObject:forKey:", v34, v10);
    -[NSMutableSet setObject:forKey:](self->_eligibleDiscoveryPeers, "setObject:forKey:", v13, v10);
    -[NIServerFindingDiscoveryProvider _configureDiscoveryTimeout:forToken:](self, "_configureDiscoveryTimeout:forToken:", v10, *(double *)&self->_didDiscoverPeerTimestamps);
    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    v27 = WeakRetained;
    if (v7)
    {
      objc_msgSend(WeakRetained, "didDiscoverPeer:advertisement:overBluetooth:", v10, v34, 1);
    }
    else
    {
      v28 = *(NSObject **)&self->_isFinder;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002E0D98;
      block[3] = &unk_100809CB0;
      v36 = WeakRetained;
      v37 = v10;
      v38 = v34;
      dispatch_async(v28, block);

    }
    if (sub_1002B66E4(LOBYTE(self->_identifier.__r_.var0) == 0) == 26)
    {
      if (((unint64_t)-[CBAdvertiser discoveryFlags](self->_addressObserver, "discoveryFlags") & 0x200100000) == 0)
      {
        v29 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: enabling scan dupes", buf, 2u);
        }
        -[CBAdvertiser setDiscoveryFlags:](self->_addressObserver, "setDiscoveryFlags:", (unint64_t)-[CBAdvertiser discoveryFlags](self->_addressObserver, "discoveryFlags") | 0x200100000);
      }
      spatialInteractionScanner = self->_spatialInteractionScanner;
      if (spatialInteractionScanner)
      {
        dispatch_source_cancel(spatialInteractionScanner);
        v31 = self->_spatialInteractionScanner;
        self->_spatialInteractionScanner = 0;

      }
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E8ED0();
  }
LABEL_39:

}

- (void)_cbDeviceFoundHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v4)
    __assert_rtn("-[NIServerFindingDiscoveryProvider _cbDeviceFoundHandler:]", "NIServerFindingDiscovery.mm", 1429, "device");
  if ((self->_addressObserver || *(_QWORD *)&self->_activatedAddressObserver)
    && LOBYTE(self->_nearbyActionNoWakeScanner))
  {
    v5 = sub_1002B66E4(LOBYTE(self->_identifier.__r_.var0) == 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _getDiscoveryTokenFromCBDevice:advertisementType:](self, "_getDiscoveryTokenFromCBDevice:advertisementType:", v4, v5));
    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _getAdvertisementFromCBDevice:advertisementType:](self, "_getAdvertisementFromCBDevice:advertisementType:", v4, v5));
      if (v7)
      {
        -[NIServerFindingDiscoveryProvider _processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:](self, "_processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:", v7, v6, 1, v4);
      }
      else
      {
        v9 = (id)qword_10085F520;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
          sub_1003E8F28((uint64_t)v10, (uint64_t)v4, (uint64_t)&v11, v9);
        }

      }
    }
    else
    {
      v7 = (id)qword_10085F520;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
        v11 = 136315395;
        v12 = v8;
        v13 = 2113;
        v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#find-disc,[%s] Found device (BT) but cannot resolve discovery token. Device: %{private}@", (uint8_t *)&v11, 0x16u);
      }
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E8EFC();
  }

}

- (void)_cbAdvertisingAddressChangedHandler
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableDictionary *discoveryTimeoutTimers;
  NSObject *v11;
  id WeakRetained;
  NSMutableDictionary *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NIServerFindingDiscoveryProvider *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  int v20;
  __int16 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (self->_controller && self->_activatedController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _cbAdvertisingAddress](self, "_cbAdvertisingAddress"));
    v4 = (uint64_t)+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:](NIServerFindingAdvertisement, "convertCBAddressToRoseAddress:", v3);
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      v7 = CUPrintNSDataAddress(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 136315395;
      v23 = v6;
      v24 = 2113;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] BT address changed: %{private}@", buf, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_discoveryTimeoutTimers, "allKeys"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002E12AC;
    v19[3] = &unk_100814D48;
    v19[4] = self;
    v20 = v4;
    v21 = WORD2(v4);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v19);
    if (LOBYTE(self->_consumer))
    {
      discoveryTimeoutTimers = self->_discoveryTimeoutTimers;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1002E1360;
      v18[3] = &unk_10080CB18;
      v18[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveryTimeoutTimers, "enumerateKeysAndObjectsUsingBlock:", v18);
    }
    else
    {
      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-disc,BT not enabled. Skipping updating advertiser on address change.", buf, 2u);
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    v13 = self->_discoveryTimeoutTimers;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002E1400;
    v15[3] = &unk_100814C28;
    v16 = WeakRetained;
    v17 = self;
    v14 = WeakRetained;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v13, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E8F70();
  }
}

- (id)_cbAdvertisingAddress
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  int v11;
  __int16 v12;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v12 = 0;
  v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v11, 6));
  v4 = v3;
  if (self->_controller && self->_activatedController)
  {
    v5 = sub_1002B66E4(LOBYTE(self->_identifier.__r_.var0));
    if (v5 == 19)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBController advertisingAddressDataNonConnectable](self->_controller, "advertisingAddressDataNonConnectable"));
    }
    else
    {
      if (v5 != 26)
      {
        v8 = 0;
        goto LABEL_12;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBController advertisingAddressDataConnectable](self->_controller, "advertisingAddressDataConnectable"));
    }
    v8 = v6;
    if (v6 && (unint64_t)objc_msgSend(v6, "length") > 5)
    {
      v9 = v8;
      v8 = v9;
LABEL_13:
      v7 = v9;

      goto LABEL_14;
    }
LABEL_12:
    v9 = v4;
    goto LABEL_13;
  }
  v7 = v3;
LABEL_14:

  return v7;
}

- (void)_cbBluetoothStateChangedHandler
{
  OS_dispatch_queue *consumerQueue;
  unint64_t v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  consumerQueue = self->_consumerQueue;
  if (consumerQueue && self->_enableBluetooth)
  {
    v4 = (unint64_t)-[OS_dispatch_queue bluetoothState](consumerQueue, "bluetoothState");
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      if (v4 > 0xA)
        v7 = "?";
      else
        v7 = off_100814DA8[v4];
      v11 = 136315394;
      v12 = v6;
      v13 = 2080;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] BT state changed: %s", (uint8_t *)&v11, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    v9 = WeakRetained;
    switch(v4)
    {
      case 1uLL:
      case 4uLL:
        objc_msgSend(WeakRetained, "bluetoothDiscoveryBecameUnavailable");
        break;
      case 2uLL:
      case 3uLL:
        v10 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003E8FC8(v4, v10);
        break;
      case 5uLL:
        objc_msgSend(WeakRetained, "bluetoothDiscoveryBecameAvailable");
        break;
      default:
        break;
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E8F9C();
  }
}

- (void)_cbInterruptionHandler
{
  NSObject *v3;
  const char *v4;
  id WeakRetained;
  int v6;
  const char *v7;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (self->_consumerQueue && self->_enableBluetooth)
  {
    v3 = (id)qword_10085F520;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      v6 = 136315138;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] BT interrupted", (uint8_t *)&v6, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    objc_msgSend(WeakRetained, "bluetoothDiscoveryBecameUnavailable");

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E9050();
  }
}

- (void)_cbErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    sub_1003E907C((uint64_t)v6, (uint64_t)v4, (uint64_t)&v7, v5);
  }

}

- (id)_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers
{
  NSMutableArray *v3;
  void *v4;
  NSMutableArray *v5;
  _QWORD v7[4];
  NSMutableArray *v8;

  v3 = objc_opt_new(NSMutableArray);
  v4 = *(void **)&self->_activatedScanner;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E19B4;
  v7[3] = &unk_10080CC70;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (void)_nearbyActionNoWakeDisableScanDupesIfNecessary
{
  NSObject *spatialInteractionScanner;
  CBSpatialInteractionSession *v4;
  CBSpatialInteractionSession *v5;
  CBSpatialInteractionSession *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  spatialInteractionScanner = self->_spatialInteractionScanner;
  if (spatialInteractionScanner)
  {
    dispatch_source_cancel(spatialInteractionScanner);
    v4 = self->_spatialInteractionScanner;
    self->_spatialInteractionScanner = 0;

  }
  v5 = (CBSpatialInteractionSession *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)&self->_isFinder);
  v6 = self->_spatialInteractionScanner;
  self->_spatialInteractionScanner = v5;

  v7 = self->_spatialInteractionScanner;
  v8 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  v9 = self->_spatialInteractionScanner;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002E1B98;
  v10[3] = &unk_1007FA078;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v9, v10);
  dispatch_resume((dispatch_object_t)self->_spatialInteractionScanner);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_configureNearbyActionNoWakeScannerAndRequestScan:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  CBAdvertiser *addressObserver;
  void *v7;
  NSObject *v8;
  CBAdvertiser *v9;
  NSObject *v10;
  unsigned int v11;
  CBDiscovery *v12;
  CBAdvertiser *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  double v18;
  CBAdvertiser *v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23[2];
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  id buf;
  __int16 v28;
  _BOOL4 v29;

  v3 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v5 = objc_msgSend(*(id *)&self->_activatedScanner, "count");
  addressObserver = self->_addressObserver;
  if (v5 && v3)
  {
    if (addressObserver)
    {
      if (LOBYTE(self->_nearbyActionNoWakeScanner))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers](self, "_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers"));
        -[CBAdvertiser setOobKeys:](self->_addressObserver, "setOobKeys:", v7);

        if (((unint64_t)-[CBAdvertiser discoveryFlags](self->_addressObserver, "discoveryFlags") & 0x200100000) == 0)
        {
          v8 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: enabling scan dupes", (uint8_t *)&buf, 2u);
          }
          -[CBAdvertiser setDiscoveryFlags:](self->_addressObserver, "setDiscoveryFlags:", (unint64_t)-[CBAdvertiser discoveryFlags](self->_addressObserver, "discoveryFlags") | 0x200100000);
        }
        if (!-[OS_dispatch_source count](self->_disableScanDupeConfigTimer, "count"))
          -[NIServerFindingDiscoveryProvider _nearbyActionNoWakeDisableScanDupesIfNecessary](self, "_nearbyActionNoWakeDisableScanDupesIfNecessary");
      }
      else
      {
        v20 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: scanner still activating", (uint8_t *)&buf, 2u);
        }
      }
    }
    else
    {
      v12 = objc_opt_new(CBDiscovery);
      v13 = self->_addressObserver;
      self->_addressObserver = v12;

      -[CBAdvertiser setDispatchQueue:](self->_addressObserver, "setDispatchQueue:", *(_QWORD *)&self->_isFinder);
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("nearbyd%s"), sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0)));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      -[CBAdvertiser setLabel:](self->_addressObserver, "setLabel:", v15);

      -[CBAdvertiser setUseCase:](self->_addressObserver, "setUseCase:", 458753);
      objc_initWeak(&buf, self);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1002E20C0;
      v25[3] = &unk_1007FA050;
      objc_copyWeak(&v26, &buf);
      -[CBAdvertiser setDeviceFoundHandler:](self->_addressObserver, "setDeviceFoundHandler:", v25);
      -[CBAdvertiser setBleScanRate:](self->_addressObserver, "setBleScanRate:", HIDWORD(self->_consumer));
      -[CBAdvertiser setBleRSSIThresholdHint:](self->_addressObserver, "setBleRSSIThresholdHint:", 4294967176);
      -[CBAdvertiser setDiscoveryFlags:](self->_addressObserver, "setDiscoveryFlags:", (unint64_t)-[CBAdvertiser discoveryFlags](self->_addressObserver, "discoveryFlags") | 0x80242100000);
      -[CBAdvertiser addDiscoveryType:](self->_addressObserver, "addDiscoveryType:", 16);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers](self, "_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers"));
      -[CBAdvertiser setOobKeys:](self->_addressObserver, "setOobKeys:", v16);

      LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
      v17 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: activating scanner (enabling scan dupes)", v24, 2u);
      }
      v18 = sub_10000883C();
      v19 = self->_addressObserver;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1002E2120;
      v22[3] = &unk_100809B40;
      v23[1] = *(id *)&v18;
      objc_copyWeak(v23, &buf);
      -[CBAdvertiser activateWithCompletion:](v19, "activateWithCompletion:", v22);
      objc_destroyWeak(v23);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    if (addressObserver)
    {
      -[CBAdvertiser invalidate](addressObserver, "invalidate");
      v9 = self->_addressObserver;
      self->_addressObserver = 0;

      LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
    }
    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(*(id *)&self->_activatedScanner, "count");
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v11;
      v28 = 1024;
      v29 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: not configuring scanner. Eligible discovery peers: %d. Request scan: %d.", (uint8_t *)&buf, 0xEu);
    }

  }
  return 0;
}

- (id)_configureSpatialInteractionScannerAndRequestScan:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSMutableDictionary *advertisingTimeoutTimers;
  CBSpatialInteractionSession *v8;
  void *v9;
  NSString *v10;
  void *v11;
  NSObject *v12;
  double v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  _QWORD v18[4];
  id v19[2];
  uint8_t buf[8];
  _QWORD v21[4];
  id v22;
  id location;
  __int16 v24;
  _BOOL4 v25;

  v3 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v5 = *(void **)&self->_activatedAddressObserver;
  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    v6 = *(void **)&self->_activatedAddressObserver;
    *(_QWORD *)&self->_activatedAddressObserver = 0;

    advertisingTimeoutTimers = self->_advertisingTimeoutTimers;
    self->_advertisingTimeoutTimers = 0;

    LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
  }
  if (objc_msgSend(*(id *)&self->_activatedScanner, "count") && v3)
  {
    v8 = objc_opt_new(CBSpatialInteractionSession);
    v9 = *(void **)&self->_activatedAddressObserver;
    *(_QWORD *)&self->_activatedAddressObserver = v8;

    objc_msgSend(*(id *)&self->_activatedAddressObserver, "setDispatchQueue:", *(_QWORD *)&self->_isFinder);
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("nearbyd%s"), sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0)));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(*(id *)&self->_activatedAddressObserver, "setLabel:", v11);

    objc_msgSend(*(id *)&self->_activatedAddressObserver, "setControlFlags:", 12296);
    objc_msgSend(*(id *)&self->_activatedAddressObserver, "setScanRate:", HIDWORD(self->_consumer));
    objc_msgSend(*(id *)&self->_activatedAddressObserver, "setBleRSSIThresholdOrder:", 132);
    objc_msgSend(*(id *)&self->_activatedAddressObserver, "setBleRSSIThresholdHint:", 4294967176);
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002E2628;
    v21[3] = &unk_1007FA050;
    objc_copyWeak(&v22, &location);
    objc_msgSend(*(id *)&self->_activatedAddressObserver, "setDeviceFoundHandler:", v21);
    LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
    v12 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: activating scanner", buf, 2u);
    }
    v13 = sub_10000883C();
    v14 = *(void **)&self->_activatedAddressObserver;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1002E2688;
    v18[3] = &unk_100809B40;
    v19[1] = *(id *)&v13;
    objc_copyWeak(v19, &location);
    objc_msgSend(v14, "activateWithCompletion:", v18);
    objc_destroyWeak(v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = (id)qword_10085F520;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(*(id *)&self->_activatedScanner, "count");
      LODWORD(location) = 67109376;
      HIDWORD(location) = v16;
      v24 = 1024;
      v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: not configuring scanner. Eligible discovery peers: %d. Request scan: %d.", (uint8_t *)&location, 0xEu);
    }

  }
  return 0;
}

- (void)_updateLaunchOnDemandScannerAndRequestScan:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  void *v23;

  v3 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (BYTE1(self->_consumer) && sub_1002B66E4(LOBYTE(self->_identifier.__r_.var0) == 0) == 26)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_1002DAF54;
    v20 = sub_1002DAF64;
    v21 = xpc_array_create(0, 0);
    if (v3)
    {
      v5 = *(void **)&self->_activatedScanner;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1002E2DAC;
      v15[3] = &unk_10080B670;
      v15[4] = &v16;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);
    }
    v6 = xpc_array_create(0, 0);
    v7 = xpc_array_create(0, 0);
    if (objc_msgSend(*(id *)&self->_activatedScanner, "count") && v3)
    {
      xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, "ScreenOff");
      xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, "BLEAdvertisementData");
      xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, "PrecisionFinding");
    }
    v8 = (void *)xpc_copy_event("com.apple.bluetooth.discovery", "PrecisionFindingDiscovery");
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      v9 = (id)qword_10085F520;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CUPrintXPC(v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        *(_DWORD *)buf = 138739971;
        v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-disc,Configuring launch on demand. XPC event before update: %{sensitive}@", buf, 0xCu);

      }
    }
    xpc_dictionary_set_value(v8, "oobKeys", (xpc_object_t)v17[5]);
    xpc_dictionary_set_value(v8, "discoveryFlags", v6);
    xpc_dictionary_set_value(v8, "discoveryTypes", v7);
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      v12 = (id)qword_10085F520;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = CUPrintXPC(v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_DWORD *)buf = 138739971;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-disc,XPC event after update: %{sensitive}@", buf, 0xCu);

      }
    }
    xpc_set_event("com.apple.bluetooth.discovery", "PrecisionFindingDiscovery", v8);

    _Block_object_dispose(&v16, 8);
  }
}

- (void)_configureAdvertisementOOBRefreshTimerForToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD handler[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_identifier.__r_.var0))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "objectForKey:", v4));
    v6 = v5;
    if (v5)
    {
      dispatch_source_cancel(v5);
      objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "removeObjectForKey:", v4);
    }
    v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)&self->_isFinder);

    v8 = dispatch_time(0, (unint64_t)(*(double *)&self->_advertisingOOBRefreshTimers * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002E30A8;
    handler[3] = &unk_1007FA330;
    objc_copyWeak(&v12, &location);
    v9 = v4;
    v11 = v9;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(v7);
    objc_msgSend(*(id *)&self->_discoveryTimeoutSeconds, "setObject:forKey:", v7, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)_configureAdvertisementTimeout:(double)a3 forToken:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD handler[4];
  id v13;
  id v14;
  id location;

  v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (a3 <= 0.0)
    __assert_rtn("-[NIServerFindingDiscoveryProvider _configureAdvertisementTimeout:forToken:]", "NIServerFindingDiscovery.mm", 1941, "timeoutSeconds > 0.0");
  v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_advertisingPeers, "objectForKey:", v6));
  v8 = v7;
  if (v7)
  {
    dispatch_source_cancel(v7);
    -[NSMutableDictionary removeObjectForKey:](self->_advertisingPeers, "removeObjectForKey:", v6);
  }
  v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)&self->_isFinder);

  v10 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1002E3340;
  handler[3] = &unk_1007FA330;
  objc_copyWeak(&v14, &location);
  v11 = v6;
  v13 = v11;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(v9);
  -[NSMutableDictionary setObject:forKey:](self->_advertisingPeers, "setObject:forKey:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_configureDiscoveryTimeout:(double)a3 forToken:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD handler[4];
  id v13;
  id v14;
  id location;

  v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_discoveredPeers, "objectForKey:", v6));
  v8 = v7;
  if (v7)
  {
    dispatch_source_cancel(v7);
    -[NSMutableDictionary removeObjectForKey:](self->_discoveredPeers, "removeObjectForKey:", v6);
  }
  v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)&self->_isFinder);

  v10 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1002E35A0;
  handler[3] = &unk_1007FA330;
  objc_copyWeak(&v14, &location);
  v11 = v6;
  v13 = v11;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(v9);
  -[NSMutableDictionary setObject:forKey:](self->_discoveredPeers, "setObject:forKey:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (id)_getDiscoveryTokenFromCBDevice:(id)a3 advertisementType:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NIDiscoveryToken *v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = v6;
  if (!v6)
    __assert_rtn("-[NIServerFindingDiscoveryProvider _getDiscoveryTokenFromCBDevice:advertisementType:]", "NIServerFindingDiscovery.mm", 2023, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btAddressData"));

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E91E4();
    goto LABEL_9;
  }
  if (a4 == 26)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nearbyActionNoWakeAuthTagData"));

    if (v13)
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x3032000000;
      v21 = sub_1002DAF54;
      v22 = sub_1002DAF64;
      v23 = 0;
      v14 = *(void **)&self->_activatedScanner;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1002E38A4;
      v15[3] = &unk_10080CA50;
      v16 = v7;
      v17 = &v18;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);
      self = (NIServerFindingDiscoveryProvider *)(id)v19[5];

      _Block_object_dispose(&v18, 8);
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E923C();
    goto LABEL_9;
  }
  if (a4 == 19)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spatialInteractionTokenData"));

    if (v9)
    {
      v10 = [NIDiscoveryToken alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spatialInteractionTokenData"));
      self = -[NIDiscoveryToken initWithBytes:](v10, "initWithBytes:", v11);

      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E9210();
LABEL_9:
    self = 0;
  }
LABEL_10:

  return self;
}

- (id)_getAdvertisementFromCBDevice:(id)a3 advertisementType:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int var0_low;
  id v11;
  NIServerSpatialInteractionPayload *v12;
  void *v13;
  void *v14;
  id v15;
  NIServerSpatialInteractionPayload *v16;
  void *v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  _WORD *v20;
  void *v21;
  int v23;
  __int16 v24;

  v6 = a3;
  v7 = v6;
  if (!v6)
    __assert_rtn("-[NIServerFindingDiscoveryProvider _getAdvertisementFromCBDevice:advertisementType:]", "NIServerFindingDiscovery.mm", 2065, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btAddressData"));
  v9 = (uint64_t)+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:](NIServerFindingAdvertisement, "convertCBAddressToRoseAddress:", v8);
  v23 = v9;
  v24 = WORD2(v9);

  if (a4 == 19)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spatialInteractionUWBConfigData"));
    v15 = objc_msgSend(v14, "length");

    if ((unint64_t)v15 > 4)
    {
      v16 = [NIServerSpatialInteractionPayload alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spatialInteractionUWBConfigData"));
      v12 = -[NIServerSpatialInteractionPayload initWithData:](v16, "initWithData:", v17);

      if (-[NIServerSpatialInteractionPayload findingEnabled](v12, "findingEnabled"))
      {
        v18 = -[NIServerSpatialInteractionPayload findingConfig](v12, "findingConfig");
        v19 = -[NIServerSpatialInteractionPayload findingConfig2](v12, "findingConfig2");
        v20 = operator new(2uLL);
        *v20 = v18 | (v19 << 8);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v20, 2));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingAdvertisement advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:](NIServerFindingAdvertisement, "advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:", LOBYTE(self->_identifier.__r_.var0) == 0, &v23, -[NIServerSpatialInteractionPayload findingStatus](v12, "findingStatus"), v21, 0));

        operator delete(v20);
        goto LABEL_5;
      }
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E9294();

    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003E9268();
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (a4 != 26)
    goto LABEL_14;
  var0_low = LOBYTE(self->_identifier.__r_.var0);
  v11 = objc_msgSend(v7, "nearbyActionNWPrecisionFindingStatus");
  v12 = (NIServerSpatialInteractionPayload *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nearbyActionNoWakeConfigData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingAdvertisement advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:](NIServerFindingAdvertisement, "advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:", var0_low == 0, &v23, v11, v12, 0));
LABEL_5:

LABEL_15:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisingTimeoutTimers, 0);
  objc_storeStrong((id *)&self->_advertisingPeers, 0);
  objc_storeStrong((id *)&self->_discoveryTimeoutSeconds, 0);
  objc_storeStrong((id *)&self->_discoveryTimeoutTimers, 0);
  objc_storeStrong((id *)&self->_discoveredPeers, 0);
  objc_storeStrong((id *)&self->_eligibleDiscoveryPeers, 0);
  objc_storeStrong((id *)&self->_disableScanDupeConfigTimer, 0);
  objc_storeStrong((id *)&self->_activatedScanner, 0);
  objc_storeStrong((id *)&self->_spatialInteractionScanner, 0);
  objc_storeStrong((id *)&self->_activatedAddressObserver, 0);
  objc_storeStrong((id *)&self->_addressObserver, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_consumerQueue, 0);
  objc_storeStrong((id *)&self->_isFinder, 0);
  objc_destroyWeak((id *)&self->_identifier.var0);
  if (*((char *)&self->_identifier.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_identifier.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
