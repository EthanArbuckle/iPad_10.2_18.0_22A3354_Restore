@implementation SDProximityPairingBufferedScanner

- (BOOL)_btSessionUsable
{
  return 1;
}

- (SDProximityPairingBufferedScanner)initWithQueue:(id)a3
{
  id v6;
  SDProximityPairingBufferedScanner *v7;
  SDProximityPairingBufferedScanner *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDProximityPairingBufferedScanner.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dispatchQueue"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SDProximityPairingBufferedScanner;
  v7 = -[SDProximityPairingBufferedScanner init](&v11, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_dispatchQueue, a3);

  return v8;
}

- (void)dealloc
{
  CBDiscovery *cbDiscoveryScreenOffPairing;
  NSMutableDictionary *devices;
  id bufferedDeviceFoundHandler;
  OS_dispatch_queue *dispatchQueue;
  id invalidationHandler;
  SDProximityPairingBufferedScanner *v8;
  SEL v9;
  objc_super v10;

  if (self->_btSession)
  {
    v8 = (SDProximityPairingBufferedScanner *)FatalErrorF("BTSession still active during dealloc", a2);
    -[SDProximityPairingBufferedScanner invalidate](v8, v9);
  }
  else
  {
    -[CBDiscovery invalidate](self->_cbDiscoveryScreenOffPairing, "invalidate");
    cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
    self->_cbDiscoveryScreenOffPairing = 0;

    devices = self->_devices;
    self->_devices = 0;

    bufferedDeviceFoundHandler = self->_bufferedDeviceFoundHandler;
    self->_bufferedDeviceFoundHandler = 0;

    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;

    }
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v10.receiver = self;
    v10.super_class = (Class)SDProximityPairingBufferedScanner;
    -[SDProximityPairingBufferedScanner dealloc](&v10, "dealloc");
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A7658;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  id v3;
  NSObject *v4;
  NSMutableDictionary *devices;
  id v6;
  NSObject *v7;
  id bufferedDeviceFoundHandler;
  id invalidationHandler;
  uint8_t v10[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v3 = sub_1001A7758();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating\n", buf, 2u);
    }

    self->_invalidateCalled = 1;
    devices = self->_devices;
    self->_devices = 0;

    -[SDProximityPairingBufferedScanner _btSessionEnsureStopped](self, "_btSessionEnsureStopped");
    -[SDProximityPairingBufferedScanner _ensureCbDiscoveryStopped](self, "_ensureCbDiscoveryStopped");
    v6 = sub_1001A7758();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Invalidated\n", v10, 2u);
    }

    bufferedDeviceFoundHandler = self->_bufferedDeviceFoundHandler;
    self->_bufferedDeviceFoundHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
}

- (void)ensureStarted
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A77F0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_ensureStarted
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!self->_cbDiscoveryScreenOffPairing)
  {
    v3 = sub_1001A7758();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBDiscoveryScreenOff starting", v5, 2u);
    }

    -[SDProximityPairingBufferedScanner configureCBDiscoveryScreenOffPairing](self, "configureCBDiscoveryScreenOffPairing");
    -[SDProximityPairingBufferedScanner startCBDiscoveryScreenOffPairing](self, "startCBDiscoveryScreenOffPairing");
  }
  if (-[SDProximityPairingBufferedScanner _btSessionUsable](self, "_btSessionUsable"))
    -[SDProximityPairingBufferedScanner _btSessionEnsureStarted](self, "_btSessionEnsureStarted");
}

- (void)_ensureCbDiscoveryStopped
{
  CBDiscovery *cbDiscoveryScreenOffPairing;
  CBDiscovery *v4;

  cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
  if (cbDiscoveryScreenOffPairing)
  {
    -[CBDiscovery invalidate](cbDiscoveryScreenOffPairing, "invalidate");
    v4 = self->_cbDiscoveryScreenOffPairing;
    self->_cbDiscoveryScreenOffPairing = 0;

  }
}

- (void)turnOffScreenOffScanningIfNoAirPodsOntheAccount
{
  SDProximityPairingBufferedScanner *v2;
  NSMutableDictionary *devices;
  CBDiscovery *cbDiscoveryScreenOffPairing;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  unsigned int v13;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  SDProximityPairingBufferedScanner *v21;
  char v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v2 = self;
  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = v2->_devices;
  v2->_devices = 0;

  cbDiscoveryScreenOffPairing = v2->_cbDiscoveryScreenOffPairing;
  if (!cbDiscoveryScreenOffPairing)
    return;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](cbDiscoveryScreenOffPairing, "discoveredDevices"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v21 = v2;
    v22 = 0;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "productID", v21);
        if (v11 - 8194 <= 0x22 && ((1 << (v11 - 2)) & 0x472863101) != 0)
        {
          v13 = objc_msgSend(v10, "productID");
          if (v13 != 8202 && v13 != 8223)
          {
            v15 = sub_1001A7758();
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CBDiscoveryScreenOff found AirPods on account", buf, 2u);
            }

            v22 = 1;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);

    v2 = v21;
    if ((v22 & 1) != 0)
    {
      v17 = sub_1001A7758();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "CBDiscoveryScreenOff screen off scan enabled", buf, 2u);
      }

      return;
    }
  }
  else
  {

  }
  v19 = sub_1001A7758();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CBDiscoveryScreenOff being invalidated because device has no paired AirPods", buf, 2u);
  }

  -[SDProximityPairingBufferedScanner _ensureCbDiscoveryStopped](v2, "_ensureCbDiscoveryStopped");
}

- (int)_btSessionEnsureStarted
{
  id v3;
  NSObject *v4;
  SDProximityPairingBufferedScanner *v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[4];
  int v14;

  if (self->_btStarted)
    return 0;
  v3 = sub_1001A7758();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BTSession attach\n", v12, 2u);
  }

  *(_QWORD *)v12 = sub_1001A7C88;
  v5 = self;
  v6 = off_1007B3348((uint64_t)"SDProximityPairingBufferedScanner", (uint64_t)v12, (uint64_t)v5, v5->_dispatchQueue);
  if (v6)
  {
    v7 = v6;
    CFRelease(v5);
    v8 = v7 + 310000;
    if (v7 != -310000)
    {
      v9 = sub_1001A7758();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v14 = v7 + 310000;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "### BTSession attach failed: %d\n", buf, 8u);
      }

    }
  }
  else
  {
    v8 = 0;
    self->_btStarted = 1;
  }
  return v8;
}

- (void)_btSessionEnsureStopped
{
  BTSessionImpl **p_btSession;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  p_btSession = &self->_btSession;
  if (self->_btSession)
  {
    v4 = sub_1001A7758();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BTSession detach\n", v6, 2u);
    }

    off_1007B3350((uint64_t)p_btSession);
    *p_btSession = 0;
  }
  self->_btStarted = 0;
}

- (void)configureCBDiscoveryScreenOffPairing
{
  CBDiscovery *cbDiscoveryScreenOffPairing;
  CBDiscovery *v4;
  CBDiscovery *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
  if (!cbDiscoveryScreenOffPairing)
  {
    v4 = (CBDiscovery *)objc_alloc_init(off_1007B3340());
    v5 = self->_cbDiscoveryScreenOffPairing;
    self->_cbDiscoveryScreenOffPairing = v4;

    cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
  }
  -[CBDiscovery setDispatchQueue:](cbDiscoveryScreenOffPairing, "setDispatchQueue:", self->_dispatchQueue);
  location = 0;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A81E4;
  v12[3] = &unk_1007193F8;
  objc_copyWeak(&v13, &location);
  -[CBDiscovery setDevicesBufferedHandler:](self->_cbDiscoveryScreenOffPairing, "setDevicesBufferedHandler:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A8248;
  v10[3] = &unk_1007145D0;
  objc_copyWeak(&v11, &location);
  -[CBDiscovery setInvalidationHandler:](self->_cbDiscoveryScreenOffPairing, "setInvalidationHandler:", v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001A8284;
  v8[3] = &unk_1007145D0;
  objc_copyWeak(&v9, &location);
  -[CBDiscovery setInterruptionHandler:](self->_cbDiscoveryScreenOffPairing, "setInterruptionHandler:", v8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001A82C0;
  v6[3] = &unk_100718A78;
  objc_copyWeak(&v7, &location);
  -[CBDiscovery setErrorHandler:](self->_cbDiscoveryScreenOffPairing, "setErrorHandler:", v6);
  -[CBDiscovery setDiscoveryFlags:](self->_cbDiscoveryScreenOffPairing, "setDiscoveryFlags:", 0);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)proxPairingLoggerAndInvalidationHandler:(id)a3 withLogLevel:(unsigned __int8)a4 andError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v10 = sub_1001A7758();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, (os_log_type_t)a4))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)a4, "CBDiscoveryScreenOff handler called: %@ with error: %@", (uint8_t *)&v14, 0x16u);
  }

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ActivateWithCompletion Handler")) & 1) == 0)
  {
    v12 = sub_1001A7758();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, (os_log_type_t)a4))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)a4, "CBDiscoveryScreenOff Invalidating failed CBDiscovery object", (uint8_t *)&v14, 2u);
    }

    -[SDProximityPairingBufferedScanner _ensureCbDiscoveryStopped](self, "_ensureCbDiscoveryStopped");
  }

}

- (void)startCBDiscoveryScreenOffPairing
{
  id v3;
  NSObject *v4;
  CBDiscovery *cbDiscoveryScreenOffPairing;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];

  if (!-[CBDiscovery discoveryFlags](self->_cbDiscoveryScreenOffPairing, "discoveryFlags"))
  {
    -[CBDiscovery setDiscoveryFlags:](self->_cbDiscoveryScreenOffPairing, "setDiscoveryFlags:", 0x2000000);
    -[CBDiscovery setDiscoveryFlags:](self->_cbDiscoveryScreenOffPairing, "setDiscoveryFlags:", (unint64_t)-[CBDiscovery discoveryFlags](self->_cbDiscoveryScreenOffPairing, "discoveryFlags") | 0x800000);
  }
  -[CBDiscovery removeAllDiscoveryTypes](self->_cbDiscoveryScreenOffPairing, "removeAllDiscoveryTypes");
  -[CBDiscovery addDiscoveryType:](self->_cbDiscoveryScreenOffPairing, "addDiscoveryType:", 29);
  -[CBDiscovery setBleScanRate:](self->_cbDiscoveryScreenOffPairing, "setBleScanRate:", 20);
  -[CBDiscovery setBleScanRateScreenOff:](self->_cbDiscoveryScreenOffPairing, "setBleScanRateScreenOff:", 20);
  -[CBDiscovery setLabel:](self->_cbDiscoveryScreenOffPairing, "setLabel:", CFSTR("Prox Pairing Screen Off Buffered Samples"));
  v3 = sub_1001A7758();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Going to Activate scanner", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001A85B8;
  v6[3] = &unk_100718A78;
  objc_copyWeak(&v7, (id *)buf);
  -[CBDiscovery activateWithCompletion:](cbDiscoveryScreenOffPairing, "activateWithCompletion:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (BOOL)isAirPods:(unsigned int)a3
{
  return (a3 - 8194 < 0x23) & (0x452863001uLL >> (a3 - 2));
}

- (BOOL)sampleIsTooOld:(id)a3
{
  id v3;
  double v4;
  id v5;

  v3 = a3;
  v4 = (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
  v5 = objc_msgSend(v3, "bleAdvertisementTimestampMachContinuous");

  return (double)(unint64_t)v5 / 1000000.0 < v4 + -5.0;
}

- (void)foundBufferedPairingDevices:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];

  v4 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v40;
    v36 = WPPairingKeyDeviceAddress;
    v35 = WPPairingKeyAdvertisingChannel;
    *(_QWORD *)&v6 = 138412290;
    v33 = v6;
    v9 = NSLocale_ptr;
    v34 = v4;
    v37 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      v38 = v7;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v10);
        if (((unint64_t)objc_msgSend(v11, "discoveryFlags", v33) & 0x1C080) != 0
          && -[SDProximityPairingBufferedScanner isAirPods:](self, "isAirPods:", objc_msgSend(v11, "productID"))
          && !-[SDProximityPairingBufferedScanner sampleIsTooOld:](self, "sampleIsTooOld:", v11))
        {
          v12 = sub_1001A7758();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v33;
            v44 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "CBDiscoveryScreenOff handling buffered device: %@", buf, 0xCu);
          }

          v14 = sub_1001A7758();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleAppleManufacturerData"));
            *(_DWORD *)buf = 138412546;
            v44 = v16;
            v45 = 2112;
            v46 = v17;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CBDiscoveryScreenOff handling buffered device: %@ with Apple payload: <%@>", buf, 0x16u);

          }
          v18 = objc_alloc((Class)NSUUID);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v20 = objc_msgSend(v18, "initWithUUIDString:", v19);

          v21 = objc_alloc_init((Class)NSMutableDictionary);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "btAddressData"));
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v36);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[15], "numberWithInt:", objc_msgSend(v11, "bleChannel")));
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, v35);

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v20));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleAppleManufacturerData"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingBufferedScanner pairingParsePayload:identifier:bleDevice:peerInfo:](self, "pairingParsePayload:identifier:bleDevice:peerInfo:", v25, v20, v24, v21));

          if (v26)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[15], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v11, "bleAdvertisementTimestampMachContinuous")/ 1000000.0));
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("sampleTimestamp"));

            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9[15], "numberWithInt:", objc_msgSend(v11, "bleChannel")));
            if (v28)
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("ch"));
            v29 = (int)objc_msgSend(v11, "bleRSSI");
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleAppleManufacturerData"));
            -[SDProximityPairingBufferedScanner _foundDevice:advertisementData:rssi:fields:](self, "_foundDevice:advertisementData:rssi:fields:", v20, v30, v29, v26);

            v4 = v34;
          }
          else
          {
            v31 = sub_1001A7758();
            v28 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleAppleManufacturerData"));
              *(_DWORD *)buf = 138412546;
              v44 = v32;
              v45 = 2112;
              v46 = v20;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "pairingParsePayload failed to parse Pairing payload: <%@> for device: %@", buf, 0x16u);

            }
          }

          v8 = v37;
          v7 = v38;
          v9 = NSLocale_ptr;
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v7);
  }

}

- (unsigned)statusToHeadsetStatus:(unsigned __int8)a3 forProductID:(unsigned __int16)a4
{
  unsigned int v4;
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax"));

  if (v5 == v6)
  {
    v13 = (v4 >> 5) & 3;
    if (v13 == 3)
      v12 = 8;
    else
      v12 = dword_1005CCCD0[v13];
  }
  else
  {
    v7 = v4 & 1;
    v8 = (v4 >> 1) & 3;
    if (v8 == 1)
      v7 = v4 & 1 | 4;
    if (v8 == 2)
      v7 = v4 & 1 | 2;
    if (v8 == 3)
      v7 = v4 & 1 | 8;
    v9 = (v4 >> 3) & 3;
    v10 = v7 | 0x40;
    v11 = v7 | 0x10;
    if (v9 == 1)
      v7 |= 0x20u;
    if (v9 == 2)
      v7 = v11;
    if (v9 == 3)
      v7 = v10;
    v12 = (4 * v4) & 0x180 ^ 0x100 | v7;
  }
  if ((v4 & 0x80u) == 0)
    v14 = v12;
  else
    v14 = v12 | 0x200;

  return v14;
}

- (id)modelWithProductID:(unsigned __int16)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", a3);
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothModel"));
LABEL_3:
    v7 = (__CFString *)v6;
    goto LABEL_4;
  }
  if ((int)v3 <= 788)
  {
    switch((_DWORD)v3)
    {
      case 0x266:
        v7 = CFSTR("ATVRemote1,1");
        goto LABEL_4;
      case 0x26D:
        v7 = CFSTR("ATVRemote1,2");
        goto LABEL_4;
      case 0x314:
        v7 = CFSTR("ATVRemote1,3");
        goto LABEL_4;
    }
LABEL_17:
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device1,%u"), v3));
    goto LABEL_3;
  }
  v7 = CFSTR("AirPods1,1");
  switch((int)v3)
  {
    case 8194:
      break;
    case 8195:
      v7 = CFSTR("PowerBeats3,1");
      break;
    case 8196:
    case 8199:
    case 8200:
    case 8209:
    case 8210:
    case 8211:
    case 8212:
    case 8213:
    case 8214:
    case 8216:
    case 8217:
    case 8219:
    case 8220:
    case 8221:
    case 8222:
    case 8223:
    case 8224:
    case 8225:
    case 8226:
    case 8227:
    case 8228:
      goto LABEL_17;
    case 8197:
      v7 = CFSTR("BeatsX1,1");
      break;
    case 8198:
      v7 = CFSTR("BeatsSolo3,1");
      break;
    case 8201:
      v7 = CFSTR("BeatsStudio3,2");
      break;
    case 8202:
      v7 = CFSTR("Device1,8202");
      break;
    case 8203:
      v7 = CFSTR("PowerbeatsPro1,1");
      break;
    case 8204:
      v7 = CFSTR("BeatsSoloPro1,1");
      break;
    case 8205:
      v7 = CFSTR("Powerbeats4,1");
      break;
    case 8206:
      v7 = CFSTR("AirPodsPro1,1");
      break;
    case 8207:
      v7 = CFSTR("AirPods1,3");
      break;
    case 8208:
      v7 = CFSTR("Device1,8208");
      break;
    case 8215:
      v7 = CFSTR("BeatsStudioPro1,1");
      break;
    case 8218:
      v7 = CFSTR("Device1,8218");
      break;
    case 8229:
      v7 = CFSTR("Device1,8229");
      break;
    default:
      if ((_DWORD)v3 == 789)
      {
        v7 = CFSTR("ATVRemote1,4");
      }
      else
      {
        if ((_DWORD)v3 != 21760)
          goto LABEL_17;
        v7 = CFSTR("Device1,21760");
      }
      break;
  }
LABEL_4:

  return v7;
}

- (void)parseStatus3:(unsigned __int8)a3 productID:(unsigned int)a4 caseLEDColor:(unsigned __int8 *)a5 caseLEDStatus:(char *)a6
{
  uint64_t v8;
  unsigned int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  char v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  id v22;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  if (a4 == 8203)
    goto LABEL_2;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b507](SFHeadphoneProduct, "b507"));
  if (objc_msgSend(v11, "productID") == (_DWORD)v8)
    goto LABEL_6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494"));
  if (objc_msgSend(v12, "productID") == (_DWORD)v8)
  {

LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607"));
  v19 = objc_msgSend(v18, "productID");

  if (v19 == (_DWORD)v8
    || (v20 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463")),
        v21 = objc_msgSend(v20, "productID"),
        v20,
        v21 == (_DWORD)v8))
  {
LABEL_2:
    v10 = 1;
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498"));
  v10 = objc_msgSend(v11, "productID") == v8;
LABEL_7:

LABEL_8:
  v13 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v8);
  if (v10)
  {
    v14 = (v9 >> 4) & 3;
    if (v14 == 2)
      v15 = 1;
    else
      v15 = 2 * (v14 != 1);
    if (v9 >= 0x40)
      v16 = 4 * ((v9 & 0xC0) == 64);
    else
      v16 = 3;
  }
  else
  {
    v22 = v13;
    v17 = (id)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax"));

    v13 = v22;
    v16 = (v9 >> 5) & 3;
    if (v22 == v17)
      v15 = (v9 & 0x10) != 0;
    else
      v15 = v9 >> 7;
  }
  *a5 = v16;
  *a6 = v15;

}

- (BOOL)pairingUpdatePairedInfoMB:(id)a3 fields:(id)a4 bleDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  double Current;
  double v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  int v33;
  int v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;
  _OWORD v39[2];
  uint8_t buf[33];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[23];
  _QWORD v54[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (unint64_t)objc_msgSend(v10, "paired");
  if (!v10 || (Current = CFAbsoluteTimeGetCurrent(), objc_msgSend(v10, "pairCheckTime"), Current - v13 > 1.0))
  {
    if (self->_btSession)
    {
      v54[0] = 0;
      v54[1] = 0;
      v38 = 0;
      objc_msgSend(v8, "getUUIDBytes:", v54);
      v14 = off_1007B3358((uint64_t)self->_btSession, (uint64_t)v54, (uint64_t)&v38);
      v15 = v14 == 0;
      if (!v14)
      {
        memset(v53, 0, sizeof(v53));
        v52 = 0u;
        v51 = 0u;
        v50 = 0u;
        v49 = 0u;
        v48 = 0u;
        v47 = 0u;
        v46 = 0u;
        v45 = 0u;
        v44 = 0u;
        v43 = 0u;
        v42 = 0u;
        v41 = 0u;
        memset(v39, 0, sizeof(v39));
        v36 = 0;
        v35 = 0;
        memset(buf, 0, sizeof(buf));
        if (!off_1007B3360(v38, (uint64_t)buf, 248) && buf[0])
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buf));
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("name"));

        }
        v37 = 0;
        if (off_1007B3368(v38, (uint64_t)&v37))
          v11 = v11;
        else
          v11 = v37 != 0;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("paired"));

        v34 = 0;
        off_1007B3370(v38, (uint64_t)&v34);
        objc_msgSend(v10, "setTempPaired:", v34 != 0);
        v33 = 0;
        if (off_1007B3378(v38, (uint64_t)&v33))
        {
          v33 = 0;
        }
        else if (v33)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("CnSv"));

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bluetoothAddress"));
        if (v21)
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("publicAddress"));
        }
        else
        {
          LOBYTE(v39[0]) = 0;
          if (!off_1007B3380(v38, (uint64_t)v39, 32)
            && LOBYTE(v39[0])
            && !off_1007B3388((uint64_t)v39, (uint64_t)&v35))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v35, 6));
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, CFSTR("publicAddress"));

          }
        }

      }
      v22 = sub_1001A7758();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
        v25 = (void *)v24;
        v26 = "yes";
        *(_QWORD *)&buf[4] = v54;
        *(_DWORD *)buf = 136315650;
        if (!(_DWORD)v11)
          v26 = "no";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Updated paired info for %s: Name '%@', Paired %s\n", buf, 0x20u);

      }
      v11 = (_DWORD)v11 != 0;
      if (v10)
LABEL_29:
        objc_msgSend(v10, "setPairCheckTime:", CFAbsoluteTimeGetCurrent());
    }
    else
    {
      if (self->_btStarted)
      {
        v18 = sub_1001A7758();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "### No BTSession to look up device %@\n", buf, 0xCu);
        }

      }
      v15 = 0;
      if (v10)
        goto LABEL_29;
    }
    if (v15)
      goto LABEL_38;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bluetoothAddress"));
  if (v27)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("publicAddress"));
  if (objc_msgSend(v10, "connectedServices"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "connectedServices")));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("CnSv"));

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));

  if (v29)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, CFSTR("name"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("paired"));

LABEL_38:
  return v11;
}

- (BOOL)pairingUpdatePairedInfo:(id)a3 fields:(id)a4 bleDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[SDProximityPairingBufferedScanner _btSessionUsable](self, "_btSessionUsable"))
    v11 = -[SDProximityPairingBufferedScanner pairingUpdatePairedInfoMB:fields:bleDevice:](self, "pairingUpdatePairedInfoMB:fields:bleDevice:", v8, v9, v10);
  else
    v11 = 0;

  return v11;
}

- (void)pairingParseAccessoryStatusPayloadPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  id v7;
  const char *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  int v14;
  double v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;

  v7 = a5;
  if (a4 - a3 < 1
    || ((v9 = *a3,
         v8 = a3 + 1,
         v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9 & 7)),
         objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("locP")),
         v10,
         (v9 & 4) != 0)
      ? (v11 = &__kCFBooleanTrue)
      : (v11 = &__kCFBooleanFalse),
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("lc")),
        a4 - v8 < 1))
  {
    LOBYTE(v12) = 0;
    goto LABEL_11;
  }
  v12 = *(unsigned __int8 *)v8;
  if (v12 != 254)
  {
    if (v12 == 255)
      goto LABEL_20;
    if ((v12 & 0x80) != 0)
    {
      v13 = 2;
LABEL_12:
      v14 = v12 & 0x7F;
      if (v14 >= 0x64)
        v14 = 100;
      v15 = (double)v14 / 100.0;
      goto LABEL_15;
    }
LABEL_11:
    v13 = 1;
    goto LABEL_12;
  }
  v15 = 0.8;
  v13 = 2;
LABEL_15:
  v16 = objc_alloc_init((Class)SFBatteryInfo);
  v17 = v16;
  v18 = 1.0;
  if (v15 <= 1.0)
    v18 = v15;
  if (v18 < 0.0001)
    v18 = 0.0001;
  objc_msgSend(v16, "setBatteryLevel:", v18);
  objc_msgSend(v17, "setBatteryState:", v13);
  objc_msgSend(v17, "setBatteryType:", 1);
  v20 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("batteryInfo"));

LABEL_20:
}

- (id)pairingParsePayload:(id)a3 identifier:(id)a4 bleDevice:(id)a5 peerInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned __int8 *v14;
  unint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  unsigned __int8 *v27;
  char *v28;
  int v29;
  int v30;
  unsigned __int8 *v31;
  int v32;
  uint64_t v33;
  id v34;
  id v35;
  int v36;
  unsigned int v37;
  SDProximityPairingBufferedScanner *v38;
  id v39;
  unsigned __int8 *v40;
  char *v41;
  char *v42;
  char *v43;
  unsigned __int8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  unsigned int v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  unsigned __int8 *v65;
  uint64_t Int64;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  uint64_t v73;
  unsigned __int8 *v74;
  unsigned int v75;
  unsigned __int8 *v76;
  int v77;
  int v78;
  unsigned __int8 *v79;
  id v80;
  unsigned int v81;
  id v82;
  uint64_t v83;
  int v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  void *v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  int v93;
  double v94;
  double v95;
  unsigned int v96;
  unsigned __int8 v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  double v103;
  unsigned int v104;
  double v105;
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  unsigned int v109;
  double v110;
  uint64_t v111;
  id v112;
  unsigned int v113;
  int v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  const __CFString *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  void *v134;
  double v135;
  id v136;
  double v137;
  id v138;
  double v139;
  uint64_t v140;
  id v141;
  double v142;
  uint64_t v143;
  const __CFString *v144;
  void *v145;
  void *v146;
  unsigned int v147;
  uint64_t v148;
  id v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  id v154;
  uint64_t v155;
  void *v156;
  const __CFString *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  int v166;
  double v167;
  uint64_t v168;
  double v169;
  char v170;
  int v171;
  uint64_t v172;
  int v173;
  uint64_t v174;
  double v175;
  id v176;
  void *v177;
  double v178;
  id v179;
  void *v180;
  double v181;
  uint64_t v182;
  id v183;
  void *v184;
  double v185;
  uint64_t v186;
  uint64_t v187;
  int v188;
  uint64_t v189;
  int v190;
  double v191;
  uint64_t v192;
  _UNKNOWN **v193;
  void *v194;
  uint64_t v195;
  unsigned int v196;
  uint64_t v197;
  unsigned int v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  _UNKNOWN **v207;
  id v208;
  unsigned int v209;
  void *v210;
  void *v211;
  void *v212;
  const __CFString *v213;
  id v214;
  void *v215;
  uint64_t v216;
  int v217;
  id v218;
  unsigned int v219;
  void *v220;
  const __CFString *v221;
  id v222;
  int v223;
  void *v224;
  void *v225;
  void *v226;
  const __CFString *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  char v232;
  void *v233;
  void *v234;
  uint64_t v235;
  id v236;
  double v237;
  uint64_t v238;
  id v239;
  double v240;
  id v241;
  double v242;
  uint64_t v243;
  id v244;
  double v245;
  uint64_t v246;
  void *v247;
  _UNKNOWN **v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  id v254;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  char *v259;
  char *v260;
  char *v261;
  __int128 v262;
  uint64_t v263;
  unsigned __int8 *v264;
  char v265;
  unsigned int v266;
  unsigned __int8 v267;
  __int128 v268;
  int v269;
  unsigned int v270;
  unsigned __int16 v271;
  unsigned int v272;
  unsigned __int8 v273;
  unsigned __int8 v274;
  unsigned int v275;
  unsigned int v276;
  unsigned __int8 *v277;
  unsigned __int8 *v278;
  unsigned int v279;
  unsigned __int8 v280;
  unsigned int v281;
  id v282;
  id v283;
  id v284;
  id v285;
  id v286;
  void *v287;
  id v288;
  SDProximityPairingBufferedScanner *v289;
  unsigned int v290;
  id v291;
  void *v292;
  __int16 v293;
  int v294;
  __int16 v295;
  uint8_t buf[4];
  void *v297;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_retainAutorelease(a3);
  v14 = (unsigned __int8 *)objc_msgSend(v13, "bytes");
  v15 = (unint64_t)objc_msgSend(v13, "length");

  v16 = objc_alloc_init((Class)NSMutableDictionary);
  v17 = v16;
  if ((uint64_t)v15 < 7)
  {
    v291 = 0;
    v26 = 0;
    goto LABEL_352;
  }
  v292 = v16;
  v18 = v14[4];
  v19 = *(unsigned __int16 *)(v14 + 5);
  v290 = 1;
  v20 = (v19 - 8194) > 0xD || ((1 << (v19 - 2)) & 0x3001) == 0;
  if (v20)
  {
    v34 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v19);
    objc_msgSend(v34, "isAirPods");

    if ((_DWORD)v19 == 8203)
    {
      v290 = 1;
    }
    else
    {
      v35 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v19);
      v290 = objc_msgSend(v35, "hasSplitBattery");

    }
  }
  v291 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v18));
  objc_msgSend(v292, "setObject:forKeyedSubscript:", v21, CFSTR("subType"));

  if (!(_DWORD)v18 && v15 == 14)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[SDProximityPairingBufferedScanner statusToHeadsetStatus:forProductID:](self, "statusToHeadsetStatus:forProductID:", v14[7], v19)));
    objc_msgSend(v292, "setObject:forKeyedSubscript:", v22, CFSTR("hsStatus"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingBufferedScanner modelWithProductID:](self, "modelWithProductID:", v19));
    objc_msgSend(v292, "setObject:forKeyedSubscript:", v23, CFSTR("model"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v19));
    objc_msgSend(v292, "setObject:forKeyedSubscript:", v24, CFSTR("pid"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v14 + 8, 6));
    objc_msgSend(v292, "setObject:forKeyedSubscript:", v25, CFSTR("publicAddress"));

    objc_msgSend(v292, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ns"));
    v17 = v292;
LABEL_351:
    v26 = v17;
    goto LABEL_352;
  }
  v26 = 0;
  v27 = &v14[v15];
  v28 = (char *)(v14 + 7);
  v17 = v292;
  switch((int)v18)
  {
    case 0:
    case 7:
      v282 = v10;
      v289 = self;
      if ((_DWORD)v18)
      {
        if (v15 < 0xD)
          goto LABEL_354;
        v261 = 0;
        v272 = v14[7];
        v29 = v14[8];
        v269 = v14[9];
        v30 = v14[10];
        v31 = v14 + 12;
        v279 = v14[11];
        if ((_DWORD)v18 == 7)
        {
          v32 = 0;
          v33 = 0;
          goto LABEL_41;
        }
        v73 = 7;
      }
      else
      {
        v261 = (char *)(v14 + 7);
        if (v15 < 0x13)
          goto LABEL_354;
        v272 = v14[13];
        v29 = v14[14];
        v269 = v14[15];
        v30 = v14[16];
        v31 = v14 + 18;
        v73 = 13;
        v279 = v14[17];
      }
      v74 = &v14[v73];
      v33 = *v31;
      v31 = v74 + 6;
      v32 = 1;
LABEL_41:
      v285 = v12;
      v287 = v11;
      if ((_DWORD)v19 == 8203)
      {
        v75 = 1;
      }
      else
      {
        v76 = v27;
        v77 = v29;
        v78 = v30;
        v79 = v31;
        v80 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v19);
        v75 = objc_msgSend(v80, "hasSplitCaseColors");

        v31 = v79;
        v30 = v78;
        v29 = v77;
        v27 = v76;
      }
      v278 = v27;
      if ((v32 & v75) == 1)
      {
        v10 = v282;
        if (v27 - v31 < 1)
        {
          v264 = v31;
          v81 = 0;
        }
        else
        {
          v81 = *v31;
          v264 = v31 + 1;
        }
        v98 = v33 >> 4;
        v99 = v81 >> 5;
        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v33 & 0xF));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v100, CFSTR("cc"));

        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v98));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v101, CFSTR("ccR"));

        v102 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v99));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v102, CFSTR("ccC"));
      }
      else
      {
        v264 = v31;
        v82 = (id)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax"));

        v10 = v282;
        if (v291 == v82)
          v83 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33 & 0x1F));
        else
          v83 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v33));
        v102 = v83;
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v83, CFSTR("cc"));
      }

      LODWORD(v102) = -[SDProximityPairingBufferedScanner statusToHeadsetStatus:forProductID:](v289, "statusToHeadsetStatus:forProductID:", v272, v19);
      v103 = 0.0;
      if (v29 == 255)
      {
        *(_QWORD *)&v268 = 0;
        v105 = 0.0;
      }
      else
      {
        v104 = v29 & 0x7F;
        if (v104 >= 0x64)
          v104 = 100;
        v105 = (double)v104 / 100.0;
        v106 = 1;
        if ((v29 & 0x80u) != 0)
          v106 = 2;
        *(_QWORD *)&v268 = v106;
      }
      if (v269 == 255)
      {
        v108 = 0;
      }
      else
      {
        v107 = v269 & 0x7F;
        if (v107 >= 0x64)
          v107 = 100;
        v103 = (double)v107 / 100.0;
        if ((v269 & 0x80u) == 0)
          v108 = 1;
        else
          v108 = 2;
      }
      if (v30 == 255)
      {
        v263 = 0;
        v110 = 0.0;
      }
      else
      {
        v109 = v30 & 0x7F;
        if (v109 >= 0x64)
          v109 = 100;
        v110 = (double)v109 / 100.0;
        v111 = 1;
        if ((v30 & 0x80u) != 0)
          v111 = 2;
        v263 = v111;
      }
      *((_QWORD *)&v268 + 1) = v108;
      if ((v19 - 8194) < 0xE && ((0x3201u >> (v19 - 2)) & 1) != 0)
      {
        v113 = 1;
      }
      else
      {
        v112 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v19);
        v113 = objc_msgSend(v112, "hasLid");

      }
      if ((v279 & 0x80u) == 0)
        v114 = 1;
      else
        v114 = v113;
      if (v114)
        v102 = v102;
      else
        v102 = v102 | 0x400;
      v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v102));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v115, CFSTR("hsStatus"));

      if ((v113 & ((v279 & 8) >> 3)) != 0)
        v116 = &__kCFBooleanTrue;
      else
        v116 = &__kCFBooleanFalse;
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v116, CFSTR("lc"));
      v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v279 & 7));
      if ((v102 & 0x100) != 0)
      {
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v117, CFSTR("locP"));

        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v287, "advertisementFields"));
        v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("locS")));

        if (!v119)
          goto LABEL_113;
        v120 = CFSTR("locS");
      }
      else
      {
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v117, CFSTR("locS"));

        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v287, "advertisementFields"));
        v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("locP")));

        if (!v119)
          goto LABEL_113;
        v120 = CFSTR("locP");
      }
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v119, v120);
LABEL_113:
      v11 = v287;

      buf[0] = 0;
      LOBYTE(v294) = 0;
      -[SDProximityPairingBufferedScanner parseStatus3:productID:caseLEDColor:caseLEDStatus:](v289, "parseStatus3:productID:caseLEDColor:caseLEDStatus:", v279, v19, buf, &v294);
      v122 = (id)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax"));

      if (v291 == v122)
      {
        v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v272 & 0x1F));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v123, CFSTR("hbT"));
        v12 = v285;
        goto LABEL_118;
      }
      v12 = v285;
      if ((_DWORD)v19 == 8207 || (_DWORD)v19 == 8194)
      {
        v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v279 >> 4) & 1));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v123, CFSTR("csVs"));
LABEL_118:

      }
      if (objc_msgSend(v291, "supportsDigitalEngraving") && v278 - v264 >= 17)
      {
        v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v264, 17));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v124, CFSTR("engravingData"));

      }
      v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", buf[0]));
      v17 = v292;
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v125, CFSTR("csLC"));

      v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v294));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v126, CFSTR("csLS"));

      v127 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingBufferedScanner modelWithProductID:](v289, "modelWithProductID:", v19));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v127, CFSTR("model"));

      v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v19));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v128, CFSTR("pid"));

      objc_msgSend(v292, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ns"));
      if ((_DWORD)v18)
        v129 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", WPPairingKeyDeviceAddress));
      else
        v129 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v261, 6));
      v130 = (void *)v129;
      v131 = *((_QWORD *)&v268 + 1);
      v132 = v268;
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v129, CFSTR("publicAddress"));

      v64 = objc_alloc_init((Class)NSMutableArray);
      if (!v290)
      {
        v136 = objc_alloc_init((Class)SFBatteryInfo);
        v134 = v136;
        v137 = 1.0;
        if (v105 <= 1.0)
          v137 = v105;
        if (v137 < 0.0001)
          v137 = 0.0001;
        objc_msgSend(v136, "setBatteryLevel:", v137);
        objc_msgSend(v134, "setBatteryState:", (_QWORD)v268);
        objc_msgSend(v134, "setBatteryType:", 4);
        goto LABEL_157;
      }
      if (v263)
      {
        v133 = objc_alloc_init((Class)SFBatteryInfo);
        v134 = v133;
        v135 = 1.0;
        if (v110 <= 1.0)
          v135 = v110;
        if (v135 < 0.0001)
          v135 = 0.0001;
        objc_msgSend(v133, "setBatteryLevel:", v135);
        objc_msgSend(v134, "setBatteryState:", v263);
        objc_msgSend(v134, "setBatteryType:", 1);
        objc_msgSend(v64, "addObject:", v134);
        if (v268 == 0)
        {
          LOBYTE(v102) = 0x80;
          v131 = 2;
          v132 = 2;
          v103 = 1.0;
          v105 = 1.0;
          goto LABEL_140;
        }
      }
      else
      {
        v134 = 0;
      }
      if (!(_QWORD)v268)
      {
LABEL_148:
        if (!v131)
        {
LABEL_158:
          v144 = CFSTR("batteryInfo");
          v145 = v292;
          v146 = v64;
          goto LABEL_349;
        }
        v141 = objc_alloc_init((Class)SFBatteryInfo);

        v142 = 1.0;
        if (v103 <= 1.0)
          v142 = v103;
        if (v142 < 0.0001)
          v142 = 0.0001;
        objc_msgSend(v141, "setBatteryLevel:", v142);
        objc_msgSend(v141, "setBatteryState:", v131);
        if ((v102 & 0x80) != 0)
          v143 = 3;
        else
          v143 = 2;
        objc_msgSend(v141, "setBatteryType:", v143);
        v134 = v141;
LABEL_157:
        objc_msgSend(v64, "addObject:", v134);
        goto LABEL_158;
      }
LABEL_140:
      v138 = objc_alloc_init((Class)SFBatteryInfo);

      v139 = 1.0;
      if (v105 <= 1.0)
        v139 = v105;
      if (v139 < 0.0001)
        v139 = 0.0001;
      objc_msgSend(v138, "setBatteryLevel:", v139);
      objc_msgSend(v138, "setBatteryState:", v132);
      if ((v102 & 0x80) != 0)
        v140 = 2;
      else
        v140 = 3;
      objc_msgSend(v138, "setBatteryType:", v140);
      objc_msgSend(v64, "addObject:", v138);
      v134 = v138;
      goto LABEL_148;
    case 1:
      if (v15 < 0xA)
        goto LABEL_354;
      v36 = v14[7];
      v37 = v14[8];
      v273 = v14[9];
      v38 = self;
      v284 = v12;
      if (v15 == 26)
      {
        v39 = v11;
        v275 = 0;
        v257 = 0;
        v266 = 0;
        v270 = 0;
        v40 = v14 + 10;
        v41 = (char *)(v14 + 11);
        v42 = (char *)(v14 + 12);
        v43 = (char *)(v14 + 13);
        v259 = (char *)(v14 + 17);
        v260 = (char *)(v14 + 14);
      }
      else
      {
        if (v15 < 0x17)
        {
LABEL_354:
          v26 = 0;
          goto LABEL_50;
        }
        v39 = v11;
        v275 = v14[10];
        v40 = v14 + 13;
        LODWORD(v257) = v14[12];
        HIDWORD(v257) = v14[11];
        v41 = (char *)(v14 + 14);
        v42 = (char *)(v14 + 15);
        v43 = (char *)(v14 + 16);
        v259 = (char *)(v14 + 20);
        v260 = (char *)(v14 + 17);
        v266 = v14[23];
        v270 = v14[24];
      }
      v84 = *v43;
      v85 = *v42;
      v86 = *v41;
      v87 = *v40;
      HIDWORD(v256) = v36;
      v281 = -[SDProximityPairingBufferedScanner statusToHeadsetStatus:forProductID:](v38, "statusToHeadsetStatus:forProductID:");
      v265 = v87;
      if (-[SDProximityPairingBufferedScanner pairingUpdatePairedInfo:fields:bleDevice:](v38, "pairingUpdatePairedInfo:fields:bleDevice:", v10, v292, v39))
      {
        if (v15 == 26 || !sub_1001AB87C(v19))
        {
          LODWORD(v256) = 0;
        }
        else
        {
          if ((v87 & 0x20) != 0)
            v88 = 2;
          else
            v88 = 1;
          LODWORD(v256) = v88;
        }
        v94 = 0.0;
        if (v86 == -1)
        {
          *((_QWORD *)&v262 + 1) = 0;
          v95 = 0.0;
        }
        else
        {
          v147 = v86 & 0x7F;
          if (v147 >= 0x64)
            v147 = 100;
          v95 = (double)v147 / 100.0;
          v148 = 1;
          if (v86 < 0)
            v148 = 2;
          *((_QWORD *)&v262 + 1) = v148;
        }
        v195 = v87 & 3;
        if (v85 == -1)
        {
          *(_QWORD *)&v262 = 0;
        }
        else
        {
          v196 = v85 & 0x7F;
          if (v196 >= 0x64)
            v196 = 100;
          v94 = (double)v196 / 100.0;
          v197 = 1;
          if (v85 < 0)
            v197 = 2;
          *(_QWORD *)&v262 = v197;
        }
        v11 = v39;
        if (v84 == -1)
        {
          v258 = 0;
          v191 = 0.0;
        }
        else
        {
          v198 = v84 & 0x7F;
          if (v198 >= 0x64)
            v198 = 100;
          v191 = (double)v198 / 100.0;
          v199 = 1;
          if (v84 < 0)
            v199 = 2;
          v258 = v199;
        }
        v12 = v284;
        v193 = NSLocale_ptr;
        v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", (v87 >> 2) & 3, v256));
        v194 = v292;
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v200, CFSTR("asCount"));

        v201 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v195));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v201, CFSTR("aState"));

        v202 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v259, 3));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v202, CFSTR("lbic"));

        v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v260, 3));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v203, CFSTR("lch"));

        objc_msgSend(v292, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("paired"));
        v204 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v256));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v204, CFSTR("obcState"));

        v96 = v290;
      }
      else
      {
        v93 = v37 & 0xF;
        v94 = 0.0;
        if (v93 == 15)
        {
          *((_QWORD *)&v262 + 1) = 0;
          v95 = 0.0;
          v11 = v39;
          v12 = v284;
          v96 = v290;
          v97 = v273;
        }
        else
        {
          if (v93 >= 0xA)
            v93 = 10;
          v95 = (double)v93 / 10.0;
          v97 = v273;
          v187 = 1;
          if ((v273 & 0x10) != 0)
            v187 = 2;
          *((_QWORD *)&v262 + 1) = v187;
          v11 = v39;
          v12 = v284;
          v96 = v290;
        }
        v188 = v37 >> 4;
        if (v37 >> 4 == 15)
        {
          *(_QWORD *)&v262 = 0;
        }
        else
        {
          if (v188 >= 0xA)
            v188 = 10;
          v94 = (double)v188 / 10.0;
          v189 = 1;
          if ((v97 & 0x20) != 0)
            v189 = 2;
          *(_QWORD *)&v262 = v189;
        }
        v190 = v97 & 0xF;
        if (v190 == 15)
        {
          v258 = 0;
          v191 = 0.0;
        }
        else
        {
          if (v190 >= 0xA)
            v190 = 10;
          v191 = (double)v190 / 10.0;
          v192 = 1;
          if ((v97 & 0x40) != 0)
            v192 = 2;
          v258 = v192;
        }
        v193 = NSLocale_ptr;
        v194 = v292;
      }
      v205 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingBufferedScanner modelWithProductID:](v38, "modelWithProductID:", v19));
      objc_msgSend(v194, "setObject:forKeyedSubscript:", v205, CFSTR("model"));

      v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193[15], "numberWithUnsignedShort:", v19));
      objc_msgSend(v194, "setObject:forKeyedSubscript:", v206, CFSTR("pid"));

      v20 = v15 == 26;
      v207 = v193;
      if (v20)
        goto LABEL_304;
      buf[0] = 0;
      LOBYTE(v294) = 0;
      -[SDProximityPairingBufferedScanner parseStatus3:productID:caseLEDColor:caseLEDStatus:](v38, "parseStatus3:productID:caseLEDColor:caseLEDStatus:", v275, v19, buf, &v294);
      if ((_DWORD)v19 == 8203
        || (v208 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v19),
            v209 = objc_msgSend(v208, "hasSplitCaseColors"),
            v208,
            v209))
      {
        v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207[15], "numberWithUnsignedChar:", BYTE4(v257) & 0xF));
        v194 = v292;
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v210, CFSTR("cc"));

        v207 = NSLocale_ptr;
        v211 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", HIDWORD(v257) >> 4));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v211, CFSTR("ccR"));

        v212 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v257 >> 5));
        v213 = CFSTR("ccC");
      }
      else
      {
        v214 = (id)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax"));

        v215 = v207[15];
        v194 = v292;
        if (v291 == v214)
          v216 = objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "numberWithInt:", BYTE4(v257) & 0x1F));
        else
          v216 = objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "numberWithUnsignedChar:", HIDWORD(v257)));
        v212 = (void *)v216;
        v213 = CFSTR("cc");
      }
      objc_msgSend(v194, "setObject:forKeyedSubscript:", v212, v213);
      v217 = v281;

      v218 = (id)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax"));
      if (v291 == v218)
      {
        v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207[15], "numberWithInt:", BYTE4(v256) & 0x1F));
        v221 = CFSTR("hbT");
      }
      else
      {
        v219 = 1;
        if ((int)v19 > 8205)
        {
          if ((_DWORD)v19 == 8206)
            goto LABEL_289;
          if ((_DWORD)v19 != 8207)
            goto LABEL_287;
        }
        else if ((_DWORD)v19 != 8194)
        {
          if ((_DWORD)v19 == 8203)
            goto LABEL_289;
          goto LABEL_287;
        }
        v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207[15], "numberWithInt:", (v275 >> 4) & 1));
        v221 = CFSTR("csVs");
      }
      objc_msgSend(v194, "setObject:forKeyedSubscript:", v220, v221);

      if ((v19 - 8194) >= 0xE || ((0x3201u >> (v19 - 2)) & 1) == 0)
      {
LABEL_287:
        v222 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v19);
        v219 = objc_msgSend(v222, "hasLid");

        goto LABEL_289;
      }
      v219 = 1;
LABEL_289:
      if ((v275 & 0x80u) == 0)
        v223 = 1;
      else
        v223 = v219;
      if (!v223)
        v217 = v281 | 0x400;
      v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207[15], "numberWithInt:", v275 & 7));
      v281 = v217;
      if ((v217 & 0x100) != 0)
      {
        objc_msgSend(v194, "setObject:forKeyedSubscript:", v224, CFSTR("locP"));

        v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "advertisementFields"));
        v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "objectForKeyedSubscript:", CFSTR("locS")));

        if (v226)
        {
          v227 = CFSTR("locS");
          goto LABEL_299;
        }
      }
      else
      {
        objc_msgSend(v194, "setObject:forKeyedSubscript:", v224, CFSTR("locS"));

        v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "advertisementFields"));
        v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "objectForKeyedSubscript:", CFSTR("locP")));

        if (v226)
        {
          v227 = CFSTR("locP");
LABEL_299:
          objc_msgSend(v194, "setObject:forKeyedSubscript:", v226, v227);
        }
      }

      if ((v219 & ((v275 & 8) >> 3)) != 0)
        v229 = &__kCFBooleanTrue;
      else
        v229 = &__kCFBooleanFalse;
      objc_msgSend(v194, "setObject:forKeyedSubscript:", v229, CFSTR("lc"));
      v207 = NSLocale_ptr;
      v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", buf[0]));
      objc_msgSend(v194, "setObject:forKeyedSubscript:", v230, CFSTR("csLC"));

      v231 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v294));
      objc_msgSend(v194, "setObject:forKeyedSubscript:", v231, CFSTR("csLS"));

LABEL_304:
      v232 = v281;
      v233 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207[15], "numberWithUnsignedInt:", v281));
      objc_msgSend(v194, "setObject:forKeyedSubscript:", v233, CFSTR("hsStatus"));

      if ((v273 & 0x80) != 0)
      {
        v234 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207[15], "numberWithUnsignedInt:", 2048));
        objc_msgSend(v194, "setObject:forKeyedSubscript:", v234, CFSTR("df"));

      }
      v64 = objc_alloc_init((Class)NSMutableArray);
      v235 = v262;
      if (!v96)
      {
        if (!*((_QWORD *)&v262 + 1))
        {
          v134 = 0;
          goto LABEL_342;
        }
        v239 = objc_alloc_init((Class)SFBatteryInfo);
        v134 = v239;
        v240 = 1.0;
        if (v95 <= 1.0)
          v240 = v95;
        if (v240 < 0.0001)
          v240 = 0.0001;
        objc_msgSend(v239, "setBatteryLevel:", v240);
        objc_msgSend(v134, "setBatteryState:", *((_QWORD *)&v262 + 1));
        objc_msgSend(v134, "setBatteryType:", 4);
LABEL_339:
        objc_msgSend(v64, "addObject:", v134);
LABEL_342:
        objc_msgSend(v194, "setObject:forKeyedSubscript:", v64, CFSTR("batteryInfo"));
        if ((v265 & 0x40) != 0)
          v247 = &__kCFBooleanTrue;
        else
          v247 = &__kCFBooleanFalse;
        objc_msgSend(v194, "setObject:forKeyedSubscript:", v247, CFSTR("srConnected"));
        v248 = v207;
        v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207[15], "numberWithInt:", v266 & 0xF));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v249, CFSTR("srAudioRoutingScore1"));

        v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248[15], "numberWithInt:", v266 >> 4));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v250, CFSTR("srAudioRoutingScore2"));

        v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248[15], "numberWithInt:", v270 & 3));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v251, CFSTR("audioIdleTime"));

        v252 = v248[15];
        v17 = v292;
        v253 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v252, "numberWithInt:", (v270 >> 2) & 3));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v253, CFSTR("budsOutofCaseTime"));

        if ((v270 & 0x10) != 0)
          v146 = &__kCFBooleanTrue;
        else
          v146 = &__kCFBooleanFalse;
        v144 = CFSTR("primaryiCloudSignIn");
        v145 = v292;
LABEL_349:
        objc_msgSend(v145, "setObject:forKeyedSubscript:", v146, v144);

LABEL_350:
        goto LABEL_351;
      }
      if (v258)
      {
        v236 = objc_alloc_init((Class)SFBatteryInfo);
        v134 = v236;
        v237 = 1.0;
        if (v191 <= 1.0)
          v237 = v191;
        if (v237 < 0.0001)
          v237 = 0.0001;
        objc_msgSend(v236, "setBatteryLevel:", v237);
        objc_msgSend(v134, "setBatteryState:", v258);
        objc_msgSend(v134, "setBatteryType:", 1);
        objc_msgSend(v64, "addObject:", v134);
        v238 = *((_QWORD *)&v262 + 1);
        if (v262 == 0)
        {
          v232 = 0x80;
          v235 = 2;
          v238 = 2;
          v94 = 1.0;
          v95 = 1.0;
          goto LABEL_322;
        }
      }
      else
      {
        v134 = 0;
        v238 = *((_QWORD *)&v262 + 1);
      }
      if (!v238)
      {
LABEL_330:
        if (!v235)
        {
          v207 = NSLocale_ptr;
          goto LABEL_342;
        }
        v244 = objc_alloc_init((Class)SFBatteryInfo);

        v245 = 1.0;
        if (v94 <= 1.0)
          v245 = v94;
        if (v245 < 0.0001)
          v245 = 0.0001;
        objc_msgSend(v244, "setBatteryLevel:", v245);
        objc_msgSend(v244, "setBatteryState:", v235);
        if (v232 < 0)
          v246 = 3;
        else
          v246 = 2;
        objc_msgSend(v244, "setBatteryType:", v246);
        v134 = v244;
        v207 = NSLocale_ptr;
        goto LABEL_339;
      }
LABEL_322:
      v241 = objc_alloc_init((Class)SFBatteryInfo);

      v242 = 1.0;
      if (v95 <= 1.0)
        v242 = v95;
      if (v242 < 0.0001)
        v242 = 0.0001;
      objc_msgSend(v241, "setBatteryLevel:", v242);
      objc_msgSend(v241, "setBatteryState:", v238);
      if (v232 < 0)
        v243 = 2;
      else
        v243 = 3;
      objc_msgSend(v241, "setBatteryType:", v243);
      objc_msgSend(v64, "addObject:", v241);
      v134 = v241;
      goto LABEL_330;
    case 2:
    case 3:
      goto LABEL_352;
    case 4:
      v283 = v10;
      if (v15 >= 0x1B)
      {
        v44 = v14[7];
        v280 = v14[9];
        v45 = v14[10];
        v46 = v14[11];
        v274 = v14[12];
        v276 = v14[8];
        *(_DWORD *)buf = *(_DWORD *)(v14 + 13);
        LOWORD(v297) = *(_WORD *)(v14 + 17);
        v294 = *(_DWORD *)(v14 + 19);
        v295 = *(_WORD *)(v14 + 23);
        v271 = *(_WORD *)(v14 + 25);
        v267 = v44;
        v47 = -[SDProximityPairingBufferedScanner statusToHeadsetStatus:forProductID:](self, "statusToHeadsetStatus:forProductID:");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v46));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v48, CFSTR("cc"));

        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v47));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v49, CFSTR("hsStatus"));

        if ((v45 & 8) != 0)
          v50 = &__kCFBooleanTrue;
        else
          v50 = &__kCFBooleanFalse;
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v50, CFSTR("lc"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v45 & 7));
        if ((v47 & 0x100) != 0)
        {
          objc_msgSend(v292, "setObject:forKeyedSubscript:", v51, CFSTR("locP"));

          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "advertisementFields"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("locS")));

          if (!v53)
            goto LABEL_63;
          v54 = CFSTR("locS");
        }
        else
        {
          objc_msgSend(v292, "setObject:forKeyedSubscript:", v51, CFSTR("locS"));

          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "advertisementFields"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("locP")));

          if (!v53)
            goto LABEL_63;
          v54 = CFSTR("locP");
        }
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v53, v54);
LABEL_63:

        v293 = 0;
        -[SDProximityPairingBufferedScanner parseStatus3:productID:caseLEDColor:caseLEDStatus:](self, "parseStatus3:productID:caseLEDColor:caseLEDStatus:", v45, v19, (char *)&v293 + 1, &v293);
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsPro](SFHeadphoneProduct, "airPodsPro"));
        v288 = v11;
        if (objc_msgSend(v90, "productID") == (_DWORD)v19)
        {
          v91 = 1;
        }
        else
        {
          v92 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698"));
          if (objc_msgSend(v92, "productID") == (_DWORD)v19)
          {
            v91 = 1;
          }
          else
          {
            v149 = v12;
            v150 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698"));
            v91 = objc_msgSend(v150, "altProductID") == v19;

            v12 = v149;
          }

        }
        v286 = v12;

        v151 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPods](SFHeadphoneProduct, "airPods"));
        if (objc_msgSend(v151, "productID") == (_DWORD)v19)
        {
          v152 = 1;
        }
        else
        {
          v153 = (void *)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsSecondGeneration](SFHeadphoneProduct, "airPodsSecondGeneration"));
          v152 = objc_msgSend(v153, "productID") == (_DWORD)v19 || v91;

        }
        v154 = (id)objc_claimAutoreleasedReturnValue(+[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax"));

        if (v291 == v154)
        {
          v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v267 & 0x1F));
          v157 = CFSTR("hbT");
        }
        else
        {
          if (!v152)
          {
LABEL_182:
            v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", HIBYTE(v293)));
            objc_msgSend(v292, "setObject:forKeyedSubscript:", v158, CFSTR("csLC"));

            v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v293));
            objc_msgSend(v292, "setObject:forKeyedSubscript:", v159, CFSTR("csLS"));

            v160 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingBufferedScanner modelWithProductID:](self, "modelWithProductID:", v19));
            objc_msgSend(v292, "setObject:forKeyedSubscript:", v160, CFSTR("model"));

            v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v19));
            objc_msgSend(v292, "setObject:forKeyedSubscript:", v161, CFSTR("pid"));

            v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v271));
            objc_msgSend(v292, "setObject:forKeyedSubscript:", v162, CFSTR("pid2"));

            v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 6));
            objc_msgSend(v292, "setObject:forKeyedSubscript:", v163, CFSTR("publicAddress"));

            v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v294, 6));
            objc_msgSend(v292, "setObject:forKeyedSubscript:", v164, CFSTR("publicAddress2"));

            if ((v274 & 1) != 0)
              objc_msgSend(v292, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("notMyCase"));
            v11 = v288;
            -[SDProximityPairingBufferedScanner pairingUpdatePairedInfo:fields:bleDevice:](self, "pairingUpdatePairedInfo:fields:bleDevice:", v283, v292, v288);
            v165 = objc_alloc_init((Class)NSMutableArray);
            v166 = v280 & 0xF;
            v167 = 0.0;
            v17 = v292;
            if (v166 == 15)
            {
              v168 = 0;
              v169 = 0.0;
            }
            else
            {
              if (v166 >= 0xA)
                v166 = 10;
              v169 = (double)v166 / 10.0;
              if ((v280 & 0x40) != 0)
                v168 = 2;
              else
                v168 = 1;
            }
            v170 = v47;
            v171 = v276 & 0xF;
            if (v171 == 15)
            {
              v172 = 0;
            }
            else
            {
              if (v171 >= 0xA)
                v171 = 10;
              v167 = (double)v171 / 10.0;
              if ((v280 & 0x10) != 0)
                v172 = 2;
              else
                v172 = 1;
            }
            v173 = v276 >> 4;
            if (v276 >> 4 == 15)
            {
              v174 = 0;
              v175 = 0.0;
            }
            else
            {
              if (v173 >= 0xA)
                v173 = 10;
              v175 = (double)v173 / 10.0;
              if ((v280 & 0x20) != 0)
                v174 = 2;
              else
                v174 = 1;
            }
            if (v168)
            {
              v176 = objc_alloc_init((Class)SFBatteryInfo);
              v177 = v176;
              v178 = 1.0;
              if (v169 <= 1.0)
                v178 = v169;
              if (v178 < 0.0001)
                v178 = 0.0001;
              objc_msgSend(v176, "setBatteryLevel:", v178);
              objc_msgSend(v177, "setBatteryState:", v168);
              objc_msgSend(v177, "setBatteryType:", 1);
              objc_msgSend(v165, "addObject:", v177);
              if (!(v174 | v172))
              {
                v170 = 0x80;
                v172 = 2;
                v167 = 1.0;
                v174 = 2;
                v175 = 1.0;
              }

              v17 = v292;
            }
            if (v172)
            {
              v179 = objc_alloc_init((Class)SFBatteryInfo);
              v180 = v179;
              v181 = 1.0;
              if (v167 <= 1.0)
                v181 = v167;
              if (v181 < 0.0001)
                v181 = 0.0001;
              objc_msgSend(v179, "setBatteryLevel:", v181);
              objc_msgSend(v180, "setBatteryState:", v172);
              if (v170 < 0)
                v182 = 2;
              else
                v182 = 3;
              objc_msgSend(v180, "setBatteryType:", v182);
              objc_msgSend(v165, "addObject:", v180);

            }
            if (v174)
            {
              v183 = objc_alloc_init((Class)SFBatteryInfo);
              v184 = v183;
              v185 = 1.0;
              if (v175 <= 1.0)
                v185 = v175;
              if (v185 < 0.0001)
                v185 = 0.0001;
              objc_msgSend(v183, "setBatteryLevel:", v185);
              objc_msgSend(v184, "setBatteryState:", v174);
              if (v170 < 0)
                v186 = 3;
              else
                v186 = 2;
              objc_msgSend(v184, "setBatteryType:", v186);
              objc_msgSend(v165, "addObject:", v184);

            }
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v165, CFSTR("batteryInfo"));

            v10 = v283;
            v12 = v286;
            goto LABEL_351;
          }
          if (v91)
            v155 = (v45 >> 4) & 1 | 2;
          else
            v155 = (v45 >> 4) & 1;
          v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v155));
          v157 = CFSTR("csVs");
        }
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v156, v157);

        goto LABEL_182;
      }
      v26 = 0;
LABEL_50:
      v17 = v292;
LABEL_352:
      v254 = v26;

      return v254;
    case 5:
      v277 = &v14[v15];
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v19));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v55, CFSTR("pid"));

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingBufferedScanner modelWithProductID:](self, "modelWithProductID:", v19));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v56, CFSTR("model"));

      if (v15 >= 8)
      {
        v28 = (char *)(v14 + 8);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v14[7]));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v57, CFSTR("osFl"));

      }
      v58 = (unint64_t)v28;
      v59 = v277 - (unsigned __int8 *)v28;
      if (v59 < 1)
        goto LABEL_351;
      v60 = *(unsigned __int8 *)v58;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v60 & 3));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v61, CFSTR("osBS"));

      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v60 >> 2) & 3));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v62, CFSTR("osBP"));

      if ((uint64_t)&v277[~v58] < 1)
        goto LABEL_351;
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)(v58 + 1)));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v63, CFSTR("osCl"));

      if (v59 - 2 < 18)
        goto LABEL_351;
      v64 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v58 + 3, 18));
      objc_msgSend(v292, "setObject:forKeyedSubscript:", v64, CFSTR("engravingData"));
      goto LABEL_350;
    case 6:
      v65 = &v14[v15];
      Int64 = CFDictionaryGetInt64(v12, WPPairingKeyAccessoryStatusDecrypted, 0);
      -[SDProximityPairingBufferedScanner pairingUpdatePairedInfo:fields:bleDevice:](self, "pairingUpdatePairedInfo:fields:bleDevice:", v10, v292, v11);
      if (Int64)
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[SDProximityPairingBufferedScanner modelWithProductID:](self, "modelWithProductID:", v19));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v67, CFSTR("model"));

        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v19));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v68, CFSTR("pid"));

        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", WPPairingKeyDeviceAddress));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v69, CFSTR("publicAddress"));

        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
        objc_msgSend(v292, "setObject:forKeyedSubscript:", v70, CFSTR("paired"));

        v71 = sub_1001A7758();
        v72 = objc_claimAutoreleasedReturnValue(v71);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v297 = v292;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "AccessoryStatus found: %@\n", buf, 0xCu);
        }

        -[SDProximityPairingBufferedScanner pairingParseAccessoryStatusPayloadPtr:end:fields:](self, "pairingParseAccessoryStatusPayloadPtr:end:fields:", v28, v65, v292);
      }
      goto LABEL_351;
    default:
      v11 = v12;
      v12 = v292;
      goto LABEL_50;
  }
}

- (void)_foundDevice:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 fields:(id)a6
{
  id v10;
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  SDProximityPairingBufferedScanner *v25;
  CFTypeID v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  CFTypeID v32;
  NSMutableDictionary *devices;
  NSMutableDictionary *v34;
  NSMutableDictionary *v35;
  id v36;
  NSObject *v37;
  void (**v38)(id, id);
  void *v39;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v42;
  CFTypeID v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  CFTypeID v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unsigned __int8 v52;
  uint64_t Int64Ranged;
  void *v54;
  void *v55;
  CFTypeID v56;
  uint64_t v57;
  void *v58;
  SDProximityPairingBufferedScanner *v59;
  CFTypeID v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  unsigned __int8 v66;
  uint64_t Int64;
  void *v68;
  uint64_t v69;
  id v70;
  NSObject *v71;
  void (**bufferedDeviceFoundHandler)(id, id);
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  unsigned __int8 v78;
  uint8_t buf[4];
  id v80;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((unint64_t)(a5 - 20) >= 0x6B)
    v13 = a5;
  else
    v13 = a5 - 126;
  if ((unint64_t)(v13 - 1) >= 0xFFFFFFFFFFFFFFA5)
    v14 = v13;
  else
    v14 = 0;
  v78 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(gSFNearbyAgent, "idsDeviceForBluetoothDeviceID:conflictDetected:", v10, &v78));
  v16 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v10));
  if (v16)
  {
    v17 = (id)v16;
    if (v15)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueIDOverride"));
      if (v18)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("idsID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v78));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("idsIDCD"));

    }
    else
    {
      v18 = 0;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "advertisementFields"));
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v39, CFSTR("idsID"), TypeID, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

    if (v18)
      objc_msgSend(v42, "isEqual:", v18);
    v75 = v42;
    v76 = (void *)v18;
    v43 = CFStringGetTypeID();
    v44 = CFDictionaryGetTypedValue(v12, CFSTR("model"), v43, 0);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = v45;
    if (v15)
    {
      if (!v45)
      {
        v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "modelIdentifier"));
        if (v46)
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v46, CFSTR("model"));
      }
    }
    v77 = v10;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "advertisementFields"));
    v48 = CFStringGetTypeID();
    v49 = CFDictionaryGetTypedValue(v47, CFSTR("model"), v48, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

    if (v46)
      objc_msgSend(v50, "isEqual:", v46);
    objc_msgSend(v17, "setLastSeen:", CFAbsoluteTimeGetCurrent());
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "advertisementData"));
    v52 = objc_msgSend(v51, "isEqual:", v11);

    if ((v52 & 1) == 0)
      objc_msgSend(v17, "setAdvertisementData:", v11);
    Int64Ranged = CFDictionaryGetInt64Ranged(v12, CFSTR("CnSv"), 0, 0xFFFFFFFFLL, 0);
    if (objc_msgSend(v17, "connectedServices") != (_DWORD)Int64Ranged)
      objc_msgSend(v17, "setConnectedServices:", Int64Ranged);
    v74 = (void *)v46;
    if (v14)
      objc_msgSend(v17, "updateRSSI:", v14);
    v54 = v15;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bluetoothAddress"));
    if (!v55)
    {
      v56 = CFDataGetTypeID();
      v57 = CFDictionaryGetTypedValue(v12, CFSTR("publicAddress"), v56, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v57);
      if (v55)
        objc_msgSend(v17, "setBluetoothAddress:", v55);
    }
    v58 = v50;
    v59 = self;
    v60 = CFStringGetTypeID();
    v61 = CFDictionaryGetTypedValue(v12, CFSTR("name"), v60, 0);
    v62 = objc_claimAutoreleasedReturnValue(v61);
    v63 = (void *)v62;
    v64 = v11;
    if (v54 && !v62)
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "name"));
    if (v63)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v66 = objc_msgSend(v65, "isEqual:", v63);

      if ((v66 & 1) == 0)
        objc_msgSend(v17, "setName:", v63);
    }
    Int64 = CFDictionaryGetInt64(v12, CFSTR("paired"), 0);
    if (v54)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("paired"));
    if (!objc_msgSend(v17, "paired") || Int64)
    {
      v11 = v64;
      if ((objc_msgSend(v17, "paired") & 1) == 0 && Int64)
        objc_msgSend(v17, "setPaired:", 1);
    }
    else
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("paired"));
      v11 = v64;
    }
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "counterpartIdentifier"));
    if (v68)
    {

      if (!v12)
      {
LABEL_69:
        sub_1001AC0C4(v69, v17);
        v70 = sub_1001A7758();
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v17;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Updated %@\n", buf, 0xCu);
        }

        bufferedDeviceFoundHandler = (void (**)(id, id))v59->_bufferedDeviceFoundHandler;
        if (bufferedDeviceFoundHandler)
          bufferedDeviceFoundHandler[2](bufferedDeviceFoundHandler, v17);

        v24 = v76;
        v10 = v77;
        v15 = v54;
        goto LABEL_74;
      }
    }
    else
    {
      v69 = -[SDProximityPairingBufferedScanner _updateCounterpart:](v59, "_updateCounterpart:", v17);
      if (!v12)
        goto LABEL_69;
    }
    v69 = (uint64_t)objc_msgSend(v17, "setAdvertisementFields:", v12);
    goto LABEL_69;
  }
  v20 = CFDictionaryGetInt64(v12, CFSTR("paired"), 0);
  v21 = CFStringGetTypeID();
  v22 = CFDictionaryGetTypedValue(v12, CFSTR("name"), v21, 0);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)v23;
  if (v15)
  {
    if (!v23)
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
    v25 = self;
    v26 = CFStringGetTypeID();
    v27 = CFDictionaryGetTypedValue(v12, CFSTR("model"), v26, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if (v28 || (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "modelIdentifier"))) != 0)
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v28, CFSTR("model"));

    }
    v29 = v11;
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueIDOverride"));
    if (v30)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, CFSTR("idsID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v78));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, CFSTR("idsIDCD"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("paired"));
    v11 = v29;
    self = v25;
  }
  else
  {
    if (!v20)
      goto LABEL_22;
    v73 = sub_1001A7758();
    v30 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v10;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "### No IDS device found for paired ID %@\n", buf, 0xCu);
    }
  }

  v20 = 1;
LABEL_22:
  v17 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v17, "setAdvertisementData:", v11);
  if (v12)
    objc_msgSend(v17, "setAdvertisementFields:", v12);
  v32 = CFDataGetTypeID();
  objc_msgSend(v17, "setBluetoothAddress:", CFDictionaryGetTypedValue(v12, CFSTR("publicAddress"), v32, 0));
  objc_msgSend(v17, "setConnectedServices:", CFDictionaryGetInt64Ranged(v12, CFSTR("CnSv"), 0, 0xFFFFFFFFLL, 0));
  objc_msgSend(v17, "setFoundTicks:", mach_absolute_time());
  objc_msgSend(v17, "setIdentifier:", v10);
  objc_msgSend(v17, "setLastSeen:", CFAbsoluteTimeGetCurrent());
  if (v24)
    objc_msgSend(v17, "setName:", v24);
  objc_msgSend(v17, "setPaired:", v20);
  if (v14)
    objc_msgSend(v17, "updateRSSI:", v14);
  sub_1001AC0C4(-[SDProximityPairingBufferedScanner _updateCounterpart:](self, "_updateCounterpart:", v17), v17);
  devices = self->_devices;
  if (!devices)
  {
    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v35 = self->_devices;
    self->_devices = v34;

    devices = self->_devices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v17, v10);
  v36 = sub_1001A7758();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v80 = v17;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Found %@\n", buf, 0xCu);
  }

  v38 = (void (**)(id, id))self->_bufferedDeviceFoundHandler;
  if (v38)
    v38[2](v38, v17);
LABEL_74:

}

- (BOOL)_updateCounterpart:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_devices;
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17));
          v12 = v11;
          if (v11 == v4)
          {
            v13 = 0;
          }
          else
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothAddress"));
            if (objc_msgSend(v13, "isEqual:", v5))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
              objc_msgSend(v4, "setCounterpartIdentifier:", v14);

              v15 = 1;
              goto LABEL_14;
            }
          }

        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }
    v15 = 0;
LABEL_14:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)bufferedDeviceFoundHandler
{
  return self->_bufferedDeviceFoundHandler;
}

- (void)setBufferedDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bufferedDeviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryScreenOffPairing, 0);
  objc_storeStrong((id *)&self->_wpPairing, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
