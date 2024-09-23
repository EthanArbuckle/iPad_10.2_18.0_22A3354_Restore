@implementation NIServerBluetoothSampleInternalObserver

- (void)didDiscoverDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t *v10;
  char v11;
  void **v12;
  uint64_t *v13;
  char v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  NIBluetoothSample *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSHashTable *v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  NSObject *v36;
  os_unfair_lock_s *lock;
  os_unfair_lock_s *locka;
  NIBluetoothSample *v39;
  void *v40;
  _QWORD block[5];
  id v42;
  NIBluetoothSample *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unsigned int v48;
  void *__p[2];
  char v50;
  _BYTE v51[128];

  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = v4;
  v40 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));
  if (!v6)
  {
    v48 = objc_msgSend(v5, "proximityPairingProductID", lock);
    sub_100008850(&v48, __p);
    if (v50 < 0)
    {
      if (!__p[1])
      {
        v6 = 0;
LABEL_43:
        operator delete(__p[0]);
        goto LABEL_2;
      }
      v12 = (void **)__p[0];
    }
    else
    {
      if (!v50)
      {
        v6 = 0;
        goto LABEL_2;
      }
      v12 = __p;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));
    if ((v50 & 0x80000000) == 0)
      goto LABEL_2;
    goto LABEL_43;
  }
LABEL_2:
  v7 = (double)(int)objc_msgSend(v5, "rssi", lock);
  if (!v6)
    goto LABEL_16;
  v8 = objc_msgSend(v5, "bleChannel");
  switch(v8)
  {
    case '%':
      v9 = objc_msgSend(v5, "transmitPowerOne");
      v48 = 37;
      sub_10000BF04(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      v10 = sub_100231D6C(&v48, (const void **)__p);
      break;
    case '&':
      v9 = objc_msgSend(v5, "transmitPowerTwo");
      v48 = 38;
      sub_10000BF04(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      v10 = sub_100231D6C(&v48, (const void **)__p);
      break;
    case '\'':
      v9 = objc_msgSend(v5, "transmitPowerThree");
      v48 = 39;
      sub_10000BF04(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      v10 = sub_100231D6C(&v48, (const void **)__p);
      break;
    default:
      goto LABEL_16;
  }
  v13 = v10;
  v14 = v11;
  if (v50 < 0)
    operator delete(__p[0]);
  if (v14)
    v7 = v7 - (COERCE_DOUBLE((unint64_t)v13 ^ 0x8000000000000000) + (double)v9 * 0.1);
LABEL_16:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
  v17 = v16 == 0;

  if (!v17)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "idsDeviceID"));

    v15 = (void *)v18;
  }
  if (objc_msgSend(v40, "productID") == 8212)
  {
    if (((unint64_t)objc_msgSend(v40, "deviceFlags") & 0x400000000) != 0)
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "serialNumberLeft"));
    else
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "serialNumberRight"));
    v20 = (__CFString *)v19;
  }
  else
  {
    v20 = &stru_10081D5E0;
  }
  v21 = [NIBluetoothSample alloc];
  v22 = objc_msgSend(v40, "bleChannel");
  v23 = objc_msgSend(v40, "bleAdvertisementTimestampMachContinuous");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "name"));
  v39 = -[NIBluetoothSample initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:](v21, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:", v15, v6, v22, v20, v24, v7, (double)(unint64_t)v23 / 1000000.0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "name"));
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "name"));
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("Bluetooth Device"));

    if ((v27 & 1) == 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "name"));
      -[NIBluetoothSample setName:](v39, "setName:", v28);

    }
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "idsDeviceID"));
  v30 = v29 == 0;

  if (!v30)
    -[NIBluetoothAdvertisementCache addSample:](self->_advertisementCache, "addSample:", v39);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = self->_consumers;
  v32 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v33)
          objc_enumerationMutation(v31);
        v35 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "getQueueForInputingData"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000063F0;
        block[3] = &unk_100809CB0;
        block[4] = v35;
        v42 = v40;
        v43 = v39;
        dispatch_async(v36, block);

      }
      v32 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v32);
  }

  os_unfair_lock_unlock(locka);
}

- (id)_initPrivate
{
  NIServerBluetoothSampleInternalObserver *v2;
  NIServerBluetoothSampleInternalObserver *v3;
  NIServerBluetoothSampleInternalObserver *v4;
  uint64_t v5;
  NSHashTable *consumers;
  uint64_t v7;
  NSHashTable *activeConsumers;
  uint64_t v9;
  NSHashTable *currentHighPriorityConsumer;
  dispatch_queue_t v11;
  OS_dispatch_queue *cbDiscoveryQueue;
  NIBluetoothAdvertisementCache *v13;
  NIBluetoothAdvertisementCache *advertisementCache;
  void ***v15;
  void *v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NIServerBluetoothSampleInternalObserver;
  v2 = -[NIServerBluetoothSampleInternalObserver init](&v24, "init");
  v3 = v2;
  v4 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    consumers = v4->_consumers;
    v4->_consumers = (NSHashTable *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    activeConsumers = v4->_activeConsumers;
    v4->_activeConsumers = (NSHashTable *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    currentHighPriorityConsumer = v4->_currentHighPriorityConsumer;
    v4->_currentHighPriorityConsumer = (NSHashTable *)v9;

    v11 = dispatch_queue_create("com.apple.nearbyd.devicepresence.cbdiscovery", 0);
    cbDiscoveryQueue = v4->_cbDiscoveryQueue;
    v4->_cbDiscoveryQueue = (OS_dispatch_queue *)v11;

    atomic_store(0, (unsigned __int8 *)&v3->_activated);
    atomic_store(0, (unsigned __int8 *)&v3->_homeSessionAggressiveScanningActivated);
    if (-[NIServerBluetoothSampleInternalObserver _advertisementCacheEnabled](v4, "_advertisementCacheEnabled"))
    {
      v13 = objc_alloc_init(NIBluetoothAdvertisementCache);
      advertisementCache = v4->_advertisementCache;
      v4->_advertisementCache = v13;

    }
    -[NIServerBluetoothSampleInternalObserver configureCBDiscovery](v4, "configureCBDiscovery");
    if (_os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider"))
    {
      if (+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE](_TtC19ProximityDaemonCore22AONSenseSampleProvider, "AONSENSE_FRAMEWORK_AVAILABLE"))
      {
        objc_initWeak(&location, v4);
        v18 = _NSConcreteStackBlock;
        v19 = 3221225472;
        v20 = sub_10017A44C;
        v21 = &unk_100809B18;
        objc_copyWeak(&v22, &location);
        v15 = objc_retainBlock(&v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[AONSenseSampleProvider shared](_TtC19ProximityDaemonCore22AONSenseSampleProvider, "shared", v18, v19, v20, v21));
        objc_msgSend(v16, "registerWithQueue:callback:", v4->_cbDiscoveryQueue, v15);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      else
      {
        -[NIServerBluetoothSampleInternalObserver configureCBDiscoveryAirPodsLeech](v4, "configureCBDiscoveryAirPodsLeech");
        if (_os_feature_enabled_impl("Sharing", "AirPodsProxUseBufferedSamples"))
          -[NIServerBluetoothSampleInternalObserver configureCBDiscoveryScreenOff](v4, "configureCBDiscoveryScreenOff");
      }
    }
  }
  return v4;
}

- (BOOL)_advertisementCacheEnabled
{
  void *v2;
  void *v3;
  NSObject *v4;
  unsigned __int8 v5;
  int v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("AdvertisementCacheEnabled")));
  if (v3)
  {
    v4 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#btsampledistributor Advertisement cache enablement override: %@", (uint8_t *)&v7, 0xCu);
    }
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)sharedObserver
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017A634;
  block[3] = &unk_1007FA668;
  block[4] = a1;
  if (qword_100856F90 != -1)
    dispatch_once(&qword_100856F90, block);
  return (id)qword_100856F88;
}

- (void)registerForInternalBluetoothSamples:(id)a3
{
  id v4;

  v4 = a3;
  -[NIServerBluetoothSampleInternalObserver registerForInternalBluetoothSamples:reportCache:](self, "registerForInternalBluetoothSamples:reportCache:", v4, -[NIServerBluetoothSampleInternalObserver _advertisementCacheEnabled](self, "_advertisementCacheEnabled"));

}

- (void)registerForInternalBluetoothSamples:(id)a3 reportCache:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id obj;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v4 = a4;
  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((objc_msgSend(v6, "supportsDevicePresence") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D231C();
    v15 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/DevicePresence/NIServerBlu"
            "etoothSampleDistributor.mm";
      v27 = 1024;
      v28 = 153;
      v29 = 2080;
      v30 = "-[NIServerBluetoothSampleInternalObserver registerForInternalBluetoothSamples:reportCache:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#btsampledistributor %s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  -[NSHashTable addObject:](self->_consumers, "addObject:", v6);
  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothAdvertisementCache allSamples](self->_advertisementCache, "allSamples"));
    obj = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v13 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#btsampledistributor Getting sample from device cache", buf, 2u);
          }
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getQueueForInputingData"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10017A994;
          block[3] = &unk_1007FA518;
          v18 = v6;
          v19 = v12;
          dispatch_async(v14, block);

        }
        v8 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)unregisterForInternalBluetoothSamples:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_consumers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (NIBluetoothDeviceCapabilities)deviceCapabilities
{
  return (NIBluetoothDeviceCapabilities)1;
}

- (void)startLeechingForConsumer:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  unsigned __int8 v6;
  void *v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_activeConsumers, "addObject:", v4);
  if (!-[CBDiscovery discoveryFlags](self->_cbDiscovery, "discoveryFlags"))
    -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0x101202000040);
  if (_os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider")
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE](_TtC19ProximityDaemonCore22AONSenseSampleProvider, "AONSENSE_FRAMEWORK_AVAILABLE"))
  {
    if (!-[CBDiscovery discoveryFlags](self->_cbDiscoveryAirPodsLeech, "discoveryFlags"))
      -[CBDiscovery setDiscoveryFlags:](self->_cbDiscoveryAirPodsLeech, "setDiscoveryFlags:", 0x10120001C080);
    if (_os_feature_enabled_impl("Sharing", "AirPodsProxUseBufferedSamples")
      && !-[CBDiscovery discoveryFlags](self->_cbDiscoveryScreenOffBuffer, "discoveryFlags"))
    {
      -[CBDiscovery setDiscoveryFlags:](self->_cbDiscoveryScreenOffBuffer, "setDiscoveryFlags:", 0x2000000);
    }
  }
  v6 = atomic_load((unsigned __int8 *)&self->_activated);
  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBluetoothSampleInternalObserver activateCBDiscovery](self, "activateCBDiscovery"));
    if (v7 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D2354();

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)startBTScanningWithMaxRateForPrototypeHomeSession:(id)a3
{
  os_unfair_lock_s *p_lock;
  CBDiscovery *homeSessionAggressiveScanner;
  unsigned __int8 v6;
  double v7;
  CBDiscovery *v8;
  _QWORD v9[4];
  id v10[2];
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  homeSessionAggressiveScanner = self->_homeSessionAggressiveScanner;
  if (!homeSessionAggressiveScanner)
  {
    -[NIServerBluetoothSampleInternalObserver configureBTMaxRateScanningForPrototypeHomeSession](self, "configureBTMaxRateScanningForPrototypeHomeSession");
    homeSessionAggressiveScanner = self->_homeSessionAggressiveScanner;
  }
  -[CBDiscovery setDiscoveryFlags:](homeSessionAggressiveScanner, "setDiscoveryFlags:", 0x1200000040);
  -[CBDiscovery setBleScanRate:](self->_homeSessionAggressiveScanner, "setBleScanRate:", 60);
  -[CBDiscovery setUseCase:](self->_homeSessionAggressiveScanner, "setUseCase:", 131093);
  v6 = atomic_load((unsigned __int8 *)&self->_homeSessionAggressiveScanningActivated);
  if ((v6 & 1) == 0)
  {
    if (-[CBDiscovery bluetoothState](self->_homeSessionAggressiveScanner, "bluetoothState") == (id)4)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D23B4();
    }
    else
    {
      objc_initWeak(&location, self);
      v7 = sub_10000883C();
      v8 = self->_homeSessionAggressiveScanner;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10017ACFC;
      v9[3] = &unk_100809B40;
      v10[1] = *(id *)&v7;
      objc_copyWeak(v10, &location);
      -[CBDiscovery activateWithCompletion:](v8, "activateWithCompletion:", v9);
      objc_destroyWeak(v10);
      objc_destroyWeak(&location);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)stopBTScanningWithMaxRateForPrototypeHomeSession
{
  os_unfair_lock_s *p_lock;
  unsigned __int8 v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = atomic_load((unsigned __int8 *)&self->_homeSessionAggressiveScanningActivated);
  if ((v4 & 1) != 0)
  {
    -[CBDiscovery setDiscoveryFlags:](self->_homeSessionAggressiveScanner, "setDiscoveryFlags:", 0);
    -[CBDiscovery setBleScanRate:](self->_homeSessionAggressiveScanner, "setBleScanRate:", 0);
    -[CBDiscovery setUseCase:](self->_homeSessionAggressiveScanner, "setUseCase:", 0);
    -[CBDiscovery removeAllDiscoveryTypes](self->_homeSessionAggressiveScanner, "removeAllDiscoveryTypes");
    atomic_store(0, (unsigned __int8 *)&self->_homeSessionAggressiveScanningActivated);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)stopLeechingForConsumer:(id)a3
{
  id v4;
  NSUInteger v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable removeObject:](self->_activeConsumers, "removeObject:", v4);
  if (-[NSHashTable containsObject:](self->_currentHighPriorityConsumer, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_currentHighPriorityConsumer, "removeObject:", v4);
    -[NIServerBluetoothSampleInternalObserver stopHighPriorityScanning](self, "stopHighPriorityScanning");
  }
  if (!-[NSHashTable count](self->_activeConsumers, "count"))
  {
    v5 = -[NSHashTable count](self->_currentHighPriorityConsumer, "count");
    v6 = qword_10085F520;
    v7 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#btsampledistributor No active leech consumers but we have a high priority consumer so not changing discovery flags", v8, 2u);
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#btsampledistributor No active leech consumers and no active high priority consumers so unsetting discovery flags", buf, 2u);
      }
      -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0);
    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)startHighPriorityScanningForToken:(id)a3 forConsumer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unsigned __int8 *v12;
  unint64_t i;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;

  v6 = a3;
  v25 = a4;
  os_unfair_lock_lock(&self->_lock);
  v7 = objc_alloc_init((Class)CBOOBKeyInfo);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectInRawTokenOPACKDictForKey:", &off_10082BEA8));
  objc_msgSend(v7, "setIrkData:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectInRawTokenOPACKDictForKey:", &off_10082BEC0));
  if (v9)
  {
    objc_msgSend(v7, "setBtAddressData:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 3 * (_QWORD)objc_msgSend(v9, "length")));
    v11 = objc_retainAutorelease(v9);
    v12 = (unsigned __int8 *)objc_msgSend(v11, "bytes");
    for (i = 0; i < (unint64_t)objc_msgSend(v11, "length"); ++i)
      objc_msgSend(v10, "appendFormat:", CFSTR("%02x:"), v12[i]);
    if (!objc_msgSend(v10, "length"))
    {
      v19 = (id)qword_10085F520;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1003D246C((uint64_t)buf, (uint64_t)objc_msgSend(v10, "length"), v19);
      goto LABEL_25;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringToIndex:", (char *)objc_msgSend(v10, "length") - 1));
    v15 = objc_msgSend(v14, "mutableCopy");

    v16 = (id)qword_10085F520;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#btsampledistributor #nibtfinding starting token finding for btaddress: %s", buf, 0xCu);
    }

    v17 = objc_msgSend(v11, "length");
    if (v17 == (id)6)
    {
      v10 = v15;
    }
    else
    {
      if (v17 != (id)7)
      {
        v19 = (id)qword_10085F520;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v10 = objc_retainAutorelease(v15);
          sub_1003D24A8((uint64_t)objc_msgSend(v10, "UTF8String"), (uint64_t)buf, v19);
        }
        else
        {
          v10 = v15;
        }
        goto LABEL_25;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringFromIndex:", 3));
      v10 = objc_msgSend(v18, "mutableCopy");

    }
    v20 = (id)qword_10085F520;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      *(_DWORD *)buf = 136315138;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#btsampledistributor #nibtfinding setting device filter: %s", buf, 0xCu);
    }

    v27 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    -[CBDiscovery setOobKeys:](self->_cbDiscovery, "setOobKeys:", v22);

    v26 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    -[CBDiscovery setDeviceFilter:](self->_cbDiscovery, "setDeviceFilter:", v23);

    -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0x200000000);
    -[CBDiscovery setBleScanRate:](self->_cbDiscovery, "setBleScanRate:", 60);
    -[CBDiscovery setUseCase:](self->_cbDiscovery, "setUseCase:", 589824);
    -[CBDiscovery addDiscoveryType:](self->_cbDiscovery, "addDiscoveryType:", 14);
    -[NSHashTable addObject:](self->_currentHighPriorityConsumer, "addObject:", v25);
    v24 = atomic_load((unsigned __int8 *)&self->_activated);
    if ((v24 & 1) != 0)
      goto LABEL_26;
    v19 = objc_claimAutoreleasedReturnValue(-[NIServerBluetoothSampleInternalObserver activateCBDiscovery](self, "activateCBDiscovery"));
    if (v19 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D2354();
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D2440();
LABEL_27:

  os_unfair_lock_unlock(&self->_lock);
}

- (void)stopHighPriorityScanning
{
  -[CBDiscovery setOobKeys:](self->_cbDiscovery, "setOobKeys:", 0);
  -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0x101202000040);
  -[CBDiscovery setDeviceFilter:](self->_cbDiscovery, "setDeviceFilter:", 0);
  -[CBDiscovery setBleScanRate:](self->_cbDiscovery, "setBleScanRate:", 0);
  -[CBDiscovery setUseCase:](self->_cbDiscovery, "setUseCase:", 0);
  -[CBDiscovery removeAllDiscoveryTypes](self->_cbDiscovery, "removeAllDiscoveryTypes");
  -[NSHashTable removeAllObjects](self->_currentHighPriorityConsumer, "removeAllObjects");
}

- (id)activateCBDiscovery
{
  void *v3;
  double v4;
  CBDiscovery *cbDiscovery;
  double v6;
  CBDiscovery *cbDiscoveryScreenOffBuffer;
  double v8;
  CBDiscovery *cbDiscoveryAirPodsLeech;
  _QWORD v11[4];
  id v12[2];
  _QWORD v13[4];
  id v14[2];
  _QWORD v15[4];
  id v16[2];
  id location;

  if (!self->_cbDiscovery
    || _os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider")
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE](_TtC19ProximityDaemonCore22AONSenseSampleProvider, "AONSENSE_FRAMEWORK_AVAILABLE")&& (_os_feature_enabled_impl("Sharing", "AirPodsProxUseBufferedSamples")&& !self->_cbDiscoveryScreenOffBuffer|| !self->_cbDiscoveryAirPodsLeech)|| -[CBDiscovery bluetoothState](self->_cbDiscovery, "bluetoothState") == (id)4|| _os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider")&& !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE](_TtC19ProximityDaemonCore22AONSenseSampleProvider, "AONSENSE_FRAMEWORK_AVAILABLE")&& (_os_feature_enabled_impl("Sharing", "AirPodsProxUseBufferedSamples")&& -[CBDiscovery bluetoothState](self->_cbDiscoveryScreenOffBuffer, "bluetoothState") == (id)4|| -[CBDiscovery bluetoothState](self->_cbDiscoveryAirPodsLeech, "bluetoothState") == (id)4))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10017, 0));
  }
  else
  {
    objc_initWeak(&location, self);
    v4 = sub_10000883C();
    cbDiscovery = self->_cbDiscovery;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10017B838;
    v15[3] = &unk_100809B40;
    v16[1] = *(id *)&v4;
    objc_copyWeak(v16, &location);
    -[CBDiscovery activateWithCompletion:](cbDiscovery, "activateWithCompletion:", v15);
    if (_os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider")
      && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE](_TtC19ProximityDaemonCore22AONSenseSampleProvider, "AONSENSE_FRAMEWORK_AVAILABLE"))
    {
      if (_os_feature_enabled_impl("Sharing", "AirPodsProxUseBufferedSamples"))
      {
        -[CBDiscovery removeAllDiscoveryTypes](self->_cbDiscoveryScreenOffBuffer, "removeAllDiscoveryTypes");
        -[CBDiscovery addDiscoveryType:](self->_cbDiscoveryScreenOffBuffer, "addDiscoveryType:", 25);
        v6 = sub_10000883C();
        cbDiscoveryScreenOffBuffer = self->_cbDiscoveryScreenOffBuffer;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10017B960;
        v13[3] = &unk_100809B40;
        v14[1] = *(id *)&v6;
        objc_copyWeak(v14, &location);
        -[CBDiscovery activateWithCompletion:](cbDiscoveryScreenOffBuffer, "activateWithCompletion:", v13);
        objc_destroyWeak(v14);
      }
      v8 = sub_10000883C();
      cbDiscoveryAirPodsLeech = self->_cbDiscoveryAirPodsLeech;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10017BA7C;
      v11[3] = &unk_100809B40;
      v12[1] = *(id *)&v8;
      objc_copyWeak(v12, &location);
      -[CBDiscovery activateWithCompletion:](cbDiscoveryAirPodsLeech, "activateWithCompletion:", v11);
      objc_destroyWeak(v12);
    }
    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
    v3 = 0;
  }
  return v3;
}

- (void)configureCBDiscoveryAirPodsLeech
{
  CBDiscovery *v3;
  CBDiscovery *cbDiscoveryAirPodsLeech;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (_os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider")
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE](_TtC19ProximityDaemonCore22AONSenseSampleProvider, "AONSENSE_FRAMEWORK_AVAILABLE"))
  {
    v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    cbDiscoveryAirPodsLeech = self->_cbDiscoveryAirPodsLeech;
    self->_cbDiscoveryAirPodsLeech = v3;

    -[CBDiscovery setDispatchQueue:](self->_cbDiscoveryAirPodsLeech, "setDispatchQueue:", self->_cbDiscoveryQueue);
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10017BD84;
    v12[3] = &unk_1007FA050;
    objc_copyWeak(&v13, &location);
    -[CBDiscovery setDeviceFoundHandler:](self->_cbDiscoveryAirPodsLeech, "setDeviceFoundHandler:", v12);
    if (_os_feature_enabled_impl("Sharing", "AirPodsProxUseBufferedSamples"))
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10017BDE4;
      v10[3] = &unk_100809B68;
      objc_copyWeak(&v11, &location);
      -[CBDiscovery setDevicesBufferedHandler:](self->_cbDiscoveryAirPodsLeech, "setDevicesBufferedHandler:", v10);
      objc_destroyWeak(&v11);
    }
    -[CBDiscovery setInvalidationHandler:](self->_cbDiscoveryAirPodsLeech, "setInvalidationHandler:", &stru_100809B88);
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_10017BFDC;
    v8 = &unk_1007FA078;
    objc_copyWeak(&v9, &location);
    -[CBDiscovery setInterruptionHandler:](self->_cbDiscoveryAirPodsLeech, "setInterruptionHandler:", &v5);
    -[CBDiscovery setErrorHandler:](self->_cbDiscoveryAirPodsLeech, "setErrorHandler:", &stru_100809BC8, v5, v6, v7, v8);
    -[CBDiscovery setDiscoveryFlags:](self->_cbDiscoveryAirPodsLeech, "setDiscoveryFlags:", 0);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)configureCBDiscoveryScreenOff
{
  CBDiscovery *v3;
  CBDiscovery *cbDiscoveryScreenOffBuffer;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  if (_os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider")
    && _os_feature_enabled_impl("Sharing", "AirPodsProxUseBufferedSamples")
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE](_TtC19ProximityDaemonCore22AONSenseSampleProvider, "AONSENSE_FRAMEWORK_AVAILABLE"))
  {
    v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    cbDiscoveryScreenOffBuffer = self->_cbDiscoveryScreenOffBuffer;
    self->_cbDiscoveryScreenOffBuffer = v3;

    -[CBDiscovery setDispatchQueue:](self->_cbDiscoveryScreenOffBuffer, "setDispatchQueue:", self->_cbDiscoveryQueue);
    objc_initWeak(&location, self);
    -[CBDiscovery setInvalidationHandler:](self->_cbDiscoveryScreenOffBuffer, "setInvalidationHandler:", &stru_100809BE8);
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_10017C218;
    v8 = &unk_1007FA078;
    objc_copyWeak(&v9, &location);
    -[CBDiscovery setInterruptionHandler:](self->_cbDiscoveryScreenOffBuffer, "setInterruptionHandler:", &v5);
    -[CBDiscovery setErrorHandler:](self->_cbDiscoveryScreenOffBuffer, "setErrorHandler:", &stru_100809C08, v5, v6, v7, v8);
    -[CBDiscovery setDiscoveryFlags:](self->_cbDiscoveryScreenOffBuffer, "setDiscoveryFlags:", 0);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)configureCBDiscovery
{
  CBDiscovery *v3;
  CBDiscovery *cbDiscovery;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
  cbDiscovery = self->_cbDiscovery;
  self->_cbDiscovery = v3;

  -[CBDiscovery setDispatchQueue:](self->_cbDiscovery, "setDispatchQueue:", self->_cbDiscoveryQueue);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000058A8;
  v11[3] = &unk_1007FA050;
  objc_copyWeak(&v12, &location);
  -[CBDiscovery setDeviceFoundHandler:](self->_cbDiscovery, "setDeviceFoundHandler:", v11);
  -[CBDiscovery setInvalidationHandler:](self->_cbDiscovery, "setInvalidationHandler:", &stru_100809C28);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10017C51C;
  v9[3] = &unk_1007FA078;
  objc_copyWeak(&v10, &location);
  -[CBDiscovery setInterruptionHandler:](self->_cbDiscovery, "setInterruptionHandler:", v9);
  -[CBDiscovery setErrorHandler:](self->_cbDiscovery, "setErrorHandler:", &stru_100809C48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017C5D4;
  v7[3] = &unk_1007FA078;
  objc_copyWeak(&v8, &location);
  -[CBDiscovery setBluetoothStateChangedHandler:](self->_cbDiscovery, "setBluetoothStateChangedHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10017C61C;
  v5[3] = &unk_1007FA078;
  objc_copyWeak(&v6, &location);
  -[CBDiscovery setSystemOverrideHandler:](self->_cbDiscovery, "setSystemOverrideHandler:", v5);
  -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)didDiscoverSample:(id)a3
{
  os_unfair_lock_s *p_lock;
  double v5;
  NSObject *v6;
  void *v7;
  NSHashTable *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  os_unfair_lock_s *v14;
  id v15;
  _QWORD block[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;

  v15 = a3;
  if (_os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(v15, "rssi");
    if (v5 >= 0.0)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D282C();
    }
    else if (-[NIBluetoothAdvertisementCache isSampleInCache:](self->_advertisementCache, "isSampleInCache:", v15))
    {
      v6 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#btsampledistributor Dropping sample that is already in the cache %@", buf, 0xCu);
      }
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

      if (v7)
        -[NIBluetoothAdvertisementCache addSample:](self->_advertisementCache, "addSample:", v15);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = self->_consumers;
      v14 = p_lock;
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getQueueForInputingData"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10017C920;
            block[3] = &unk_1007FA518;
            block[4] = v12;
            v17 = v15;
            dispatch_async(v13, block);

          }
          v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }

      p_lock = v14;
    }
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)configureBTMaxRateScanningForPrototypeHomeSession
{
  CBDiscovery *v3;
  CBDiscovery *homeSessionAggressiveScanner;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = objc_opt_new(CBDiscovery);
  homeSessionAggressiveScanner = self->_homeSessionAggressiveScanner;
  self->_homeSessionAggressiveScanner = v3;

  -[CBDiscovery setDispatchQueue:](self->_homeSessionAggressiveScanner, "setDispatchQueue:", self->_cbDiscoveryQueue);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017CB5C;
  v11[3] = &unk_1007FA050;
  objc_copyWeak(&v12, &location);
  -[CBDiscovery setDeviceFoundHandler:](self->_homeSessionAggressiveScanner, "setDeviceFoundHandler:", v11);
  -[CBDiscovery setInvalidationHandler:](self->_homeSessionAggressiveScanner, "setInvalidationHandler:", &stru_100809C68);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10017CC04;
  v9[3] = &unk_1007FA078;
  objc_copyWeak(&v10, &location);
  -[CBDiscovery setInterruptionHandler:](self->_homeSessionAggressiveScanner, "setInterruptionHandler:", v9);
  -[CBDiscovery setErrorHandler:](self->_homeSessionAggressiveScanner, "setErrorHandler:", &stru_100809C88);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017CCC4;
  v7[3] = &unk_1007FA078;
  objc_copyWeak(&v8, &location);
  -[CBDiscovery setBluetoothStateChangedHandler:](self->_homeSessionAggressiveScanner, "setBluetoothStateChangedHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10017CD14;
  v5[3] = &unk_1007FA078;
  objc_copyWeak(&v6, &location);
  -[CBDiscovery setSystemOverrideHandler:](self->_homeSessionAggressiveScanner, "setSystemOverrideHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)handleCBDiscoveryInterrupted
{
  os_unfair_lock_s *p_lock;
  NSHashTable *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_consumers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getQueueForInputingData"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10017CEEC;
        block[3] = &unk_1007FB340;
        block[4] = v8;
        dispatch_async(v9, block);

      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)handleCBDiscoveryStateChanged
{
  unint64_t v3;
  NSObject *v4;
  const char *v5;
  NSHashTable *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSObject *v11;
  os_unfair_lock_t lock;
  _QWORD block[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;

  v3 = (unint64_t)-[CBDiscovery bluetoothState](self->_cbDiscovery, "bluetoothState");
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > 0xA)
      v5 = "?";
    else
      v5 = off_100809DD8[v3];
    *(_DWORD *)buf = 136315138;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#btsampledistributor CBDiscovery Bluetooth state changed: %s", buf, 0xCu);
  }
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_consumers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getQueueForInputingData"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10017D0F8;
        block[3] = &unk_100809CD8;
        block[4] = v10;
        block[5] = v3;
        dispatch_async(v11, block);

      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

- (void)handleCBDiscoverySystemOverride
{
  NSObject *v3;
  int v4;
  const char *v5;
  int v6;
  const char *v7;

  if ((-[CBDiscovery systemOverrideFlags](self->_cbDiscovery, "systemOverrideFlags") & 1) != 0)
  {
    v3 = (id)qword_10085F520;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:

      return;
    }
    v4 = -[CBDiscovery bleScanRate](self->_cbDiscovery, "bleScanRate");
    if (v4 > 34)
    {
      if (v4 > 49)
      {
        if (v4 == 50)
        {
          v5 = "High";
          goto LABEL_23;
        }
        if (v4 == 60)
        {
          v5 = "Max";
          goto LABEL_23;
        }
      }
      else
      {
        if (v4 == 35)
        {
          v5 = "MediumLow";
          goto LABEL_23;
        }
        if (v4 == 40)
        {
          v5 = "Medium";
          goto LABEL_23;
        }
      }
    }
    else if (v4 > 19)
    {
      if (v4 == 20)
      {
        v5 = "Background";
        goto LABEL_23;
      }
      if (v4 == 30)
      {
        v5 = "Low";
        goto LABEL_23;
      }
    }
    else
    {
      if (!v4)
      {
        v5 = "Default";
        goto LABEL_23;
      }
      if (v4 == 10)
      {
        v5 = "Periodic";
LABEL_23:
        v6 = 136315138;
        v7 = v5;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#btsampledistributor CBDiscovery #nicoex Bluetooth scanning reduced (%s) due to WiFi critical.", (uint8_t *)&v6, 0xCu);
        goto LABEL_24;
      }
    }
    v5 = "?";
    goto LABEL_23;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeSessionAggressiveScanner, 0);
  objc_storeStrong((id *)&self->_advertisementCache, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryScreenOffBuffer, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryAirPodsLeech, 0);
  objc_storeStrong((id *)&self->_cbDiscovery, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryQueue, 0);
  objc_storeStrong((id *)&self->_currentHighPriorityConsumer, 0);
  objc_storeStrong((id *)&self->_activeConsumers, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
}

@end
