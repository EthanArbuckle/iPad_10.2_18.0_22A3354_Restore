@implementation PRBLEDiscoverySession

- (PRBLEDiscoverySession)init
{
  PRBLEDiscoverySession *v2;
  NSMutableSet *v3;
  NSMutableSet *activationPendingPeers;
  NSMutableSet *v5;
  NSMutableSet *peers;
  CBSpatialInteractionSession *cbSession;
  PRBluetoothDeviceCache *v8;
  PRBluetoothDeviceCache *deviceCache;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PRBLEDiscoverySession;
  v2 = -[PRBLEDiscoverySession init](&v11, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableSet);
    activationPendingPeers = v2->_activationPendingPeers;
    v2->_activationPendingPeers = v3;

    v5 = objc_opt_new(NSMutableSet);
    peers = v2->_peers;
    v2->_peers = v5;

    cbSession = v2->_cbSession;
    v2->_cbSession = 0;

    v2->_cbSessionState = 0;
    v8 = objc_opt_new(PRBluetoothDeviceCache);
    deviceCache = v2->_deviceCache;
    v2->_deviceCache = v8;

    v2->_wifiAdvertisingAllowed = 0;
  }
  return v2;
}

- (void)_configureCBSpatialSession
{
  CBSpatialInteractionSession *v3;
  CBSpatialInteractionSession *cbSession;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v3 = (CBSpatialInteractionSession *)objc_alloc_init((Class)CBSpatialInteractionSession);
  cbSession = self->_cbSession;
  self->_cbSession = v3;

  -[CBSpatialInteractionSession setDispatchQueue:](self->_cbSession, "setDispatchQueue:", self->_clientQueue);
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000CF30;
  v20[3] = &unk_1007FA050;
  objc_copyWeak(&v21, &location);
  -[CBSpatialInteractionSession setDeviceLostHandler:](self->_cbSession, "setDeviceLostHandler:", v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000CF90;
  v18[3] = &unk_1007FA050;
  objc_copyWeak(&v19, &location);
  -[CBSpatialInteractionSession setDeviceFoundHandler:](self->_cbSession, "setDeviceFoundHandler:", v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000CFF0;
  v16[3] = &unk_1007FA078;
  objc_copyWeak(&v17, &location);
  -[CBSpatialInteractionSession setInterruptionHandler:](self->_cbSession, "setInterruptionHandler:", v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000D058;
  v14[3] = &unk_1007FA0A0;
  objc_copyWeak(&v15, &location);
  -[CBSpatialInteractionSession setErrorHandler:](self->_cbSession, "setErrorHandler:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D0B8;
  v12[3] = &unk_1007FA078;
  objc_copyWeak(&v13, &location);
  -[CBSpatialInteractionSession setBluetoothStateChangedHandler:](self->_cbSession, "setBluetoothStateChangedHandler:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D100;
  v10[3] = &unk_1007FA078;
  objc_copyWeak(&v11, &location);
  -[CBSpatialInteractionSession setAdvertisingAddressChangedHandler:](self->_cbSession, "setAdvertisingAddressChangedHandler:", v10);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_10000D148;
  v8 = &unk_1007FA078;
  objc_copyWeak(&v9, &location);
  -[CBSpatialInteractionSession setSystemOverrideHandler:](self->_cbSession, "setSystemOverrideHandler:", &v5);
  -[CBSpatialInteractionSession setUwbTokenFlags:](self->_cbSession, "setUwbTokenFlags:", 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (BOOL)marconiBypassEnabled
{
  if (qword_1008533F0 != -1)
    dispatch_once(&qword_1008533F0, &stru_1007FA0E0);
  return 0;
}

- (void)setDeviceRelationshipFlags:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C8E98();
      return;
    case 1:
      v5 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C8F14(a3, v5, v6, v7, v8, v9, v10, v11);
      self->_activationPendingRelationshipSpecifier.var0.__val_ = a3;
      self->_activationPendingRelationshipSpecifier.__engaged_ = 1;
      return;
    case 2:
      v12 = qword_10085F520;
      if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        if ((a3 & 2) == 0)
          goto LABEL_10;
        goto LABEL_9;
      }
      sub_1003C8F78(a3, v12, v13, v14, v15, v16, v17, v18);
      if ((a3 & 2) != 0)
LABEL_9:
        -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") | 0xE0);
LABEL_10:
      if ((a3 & 5) == 0)
        -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") | 0x400);
      return;
    default:
      return;
  }
}

- (void)activateWithDelegate:(id)a3 delegateQueue:(id)a4 sessionIRK:(id)a5 sessionIdentifier:(id)a6 controlFlags:(NIBluetoothDiscoveryControlFlags)a7 tokenFlags:(unsigned int)a8
{
  id v15;
  id v16;
  id v17;
  CBSpatialInteractionSession *cbSession;
  NSObject *v19;
  unsigned int v20;
  double v21;
  CBSpatialInteractionSession *v22;
  _QWORD v23[5];
  id v24[2];
  id buf;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((self->_cbSessionState - 1) >= 2)
  {
    objc_storeWeak((id *)&self->_delegate, a3);
    objc_storeStrong((id *)&self->_clientQueue, a4);
    cbSession = self->_cbSession;
    self->_cbSession = 0;

    -[PRBLEDiscoverySession _configureCBSpatialSession](self, "_configureCBSpatialSession");
    -[CBSpatialInteractionSession setUwbTokenFlags:](self->_cbSession, "setUwbTokenFlags:", -[CBSpatialInteractionSession uwbTokenFlags](self->_cbSession, "uwbTokenFlags") | a8);
    -[CBSpatialInteractionSession setClientIrkData:](self->_cbSession, "setClientIrkData:", v16);
    -[CBSpatialInteractionSession setClientIdentifierData:](self->_cbSession, "setClientIdentifierData:", v17);
    -[CBSpatialInteractionSession setBleRSSIThresholdHint:](self->_cbSession, "setBleRSSIThresholdHint:", 4294967206);
    -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", 25);
    if (a7.var0)
      -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") | 2);
    if ((*(_WORD *)&a7 & 0x100) != 0)
    {
      -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") | 0x800);
      self->_wifiAdvertisingAllowed = 1;
    }
    v19 = (id)qword_10085F520;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags");
      LODWORD(buf) = 67109888;
      HIDWORD(buf) = a7.var0;
      v26 = 1024;
      v27 = (unint64_t)(*(_WORD *)&a7 & 0x100) >> 8;
      v28 = 1024;
      v29 = a8;
      v30 = 1024;
      v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ble,Activate. Supports UWB: [%d], Supports WiFi ToF: [%d], TokenFlags: [0x%08x]. ControlFlags: [0x%08x]", (uint8_t *)&buf, 0x1Au);
    }

    -[NSMutableSet removeAllObjects](self->_activationPendingPeers, "removeAllObjects");
    self->_activationPendingControlFlags = -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags");
    self->_activationPendingRssiThresholdHint = -[CBSpatialInteractionSession bleRSSIThresholdHint](self->_cbSession, "bleRSSIThresholdHint");
    self->_activationPendingScanBurstPeriod = 0.0;
    if (self->_activationPendingRelationshipSpecifier.__engaged_)
      self->_activationPendingRelationshipSpecifier.__engaged_ = 0;
    objc_initWeak(&buf, self);
    self->_cbSessionState = 1;
    v21 = sub_10000883C();
    v22 = self->_cbSession;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000D6E8;
    v23[3] = &unk_1007FA108;
    v24[1] = *(id *)&v21;
    objc_copyWeak(v24, &buf);
    v23[4] = self;
    -[CBSpatialInteractionSession activateWithCompletion:](v22, "activateWithCompletion:", v23);
    objc_destroyWeak(v24);
    objc_destroyWeak(&buf);
  }

}

- (void)_executeActivationPendingOperations
{
  NSObject *v3;
  NSMutableSet *activationPendingPeers;
  NSObject *v5;
  unsigned int activationPendingControlFlags;
  unsigned int v7;
  NSObject *v8;
  double activationPendingScanBurstPeriod;
  NSObject *v10;
  int activationPendingRssiThresholdHint;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t val;
  NSMutableSet *v16;
  unsigned __int8 v17;
  int v18;
  unsigned int v19;
  _QWORD v20[5];
  uint8_t buf[4];
  _QWORD v22[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    activationPendingPeers = self->_activationPendingPeers;
    *(_DWORD *)buf = 138477827;
    v22[0] = activationPendingPeers;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: add peers %{private}@", buf, 0xCu);
  }
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    activationPendingControlFlags = self->_activationPendingControlFlags;
    v7 = -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags");
    *(_DWORD *)buf = 67109376;
    LODWORD(v22[0]) = activationPendingControlFlags;
    WORD2(v22[0]) = 1024;
    *(_DWORD *)((char *)v22 + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: act on control flags 0x%08x (current 0x%08x)", buf, 0xEu);
  }

  v8 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    activationPendingScanBurstPeriod = self->_activationPendingScanBurstPeriod;
    *(_DWORD *)buf = 134217984;
    *(double *)v22 = activationPendingScanBurstPeriod;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: scan burst period %0.1f s", buf, 0xCu);
  }
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    activationPendingRssiThresholdHint = self->_activationPendingRssiThresholdHint;
    v12 = -[CBSpatialInteractionSession bleRSSIThresholdHint](self->_cbSession, "bleRSSIThresholdHint");
    *(_DWORD *)buf = 67109376;
    LODWORD(v22[0]) = activationPendingRssiThresholdHint;
    WORD2(v22[0]) = 1024;
    *(_DWORD *)((char *)v22 + 6) = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: RSSI hint %d dBm (current %d dBm)", buf, 0xEu);
  }

  v13 = qword_10085F520;
  if (self->_activationPendingRelationshipSpecifier.__engaged_)
  {
    v14 = (id)qword_10085F520;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (!self->_activationPendingRelationshipSpecifier.__engaged_)
        sub_10000BA44();
      val = self->_activationPendingRelationshipSpecifier.var0.__val_;
      *(_DWORD *)buf = 67109120;
      LODWORD(v22[0]) = val;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: relationship specifier 0x%08x", buf, 8u);
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: no relationship specifier pending", buf, 2u);
  }
  v16 = self->_activationPendingPeers;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000DD9C;
  v20[3] = &unk_1007FA130;
  v20[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", v20);
  -[NSMutableSet removeAllObjects](self->_activationPendingPeers, "removeAllObjects");
  if (self->_activationPendingRelationshipSpecifier.__engaged_)
  {
    -[PRBLEDiscoverySession setDeviceRelationshipFlags:](self, "setDeviceRelationshipFlags:", self->_activationPendingRelationshipSpecifier.var0.__val_);
    if (self->_activationPendingRelationshipSpecifier.__engaged_)
      self->_activationPendingRelationshipSpecifier.__engaged_ = 0;
  }
  if (((unsigned __int16)-[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") & 0x800) != (self->_activationPendingControlFlags & 0x800))
  {
    if ((self->_activationPendingControlFlags & 0x800) != 0)
      -[PRBLEDiscoverySession setWifiRangingActiveAdvertisement](self, "setWifiRangingActiveAdvertisement");
    else
      -[PRBLEDiscoverySession clearWifiRangingActiveAdvertisement](self, "clearWifiRangingActiveAdvertisement");
  }
  if ((self->_activationPendingControlFlags & 0x1000) != 0)
    -[PRBLEDiscoverySession allowScreenOffOperation:](self, "allowScreenOffOperation:", 1);
  v17 = -[CBSpatialInteractionSession bleRSSIThresholdHint](self->_cbSession, "bleRSSIThresholdHint");
  v18 = self->_activationPendingRssiThresholdHint;
  if (v18 != v17)
    -[PRBLEDiscoverySession setBleRSSIThresholdHint:](self, "setBleRSSIThresholdHint:", (char)v18);
  v19 = self->_activationPendingControlFlags;
  if ((v19 & 8) == 0)
  {
    -[PRBLEDiscoverySession startAdvertising](self, "startAdvertising");
    v19 = self->_activationPendingControlFlags;
  }
  if ((v19 & 0x10) == 0)
  {
    if (self->_activationPendingScanBurstPeriod <= 0.0)
      -[PRBLEDiscoverySession startScanning](self, "startScanning");
    else
      -[PRBLEDiscoverySession startScanningWithBurstPeriod:](self, "startScanningWithBurstPeriod:");
  }
}

- (void)stopAndClearState
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,stopAndClearState", v4, 2u);
  }
  -[PRBLEDiscoverySession stopScanningAndRemovePeers:](self, "stopScanningAndRemovePeers:", 1);
  -[PRBLEDiscoverySession stopAdvertising](self, "stopAdvertising");
  -[PRBluetoothDeviceCache reset](self->_deviceCache, "reset");
}

- (void)invalidate
{
  NSObject *v3;
  CBSpatialInteractionSession *cbSession;
  void *v5;
  uint8_t v6[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,Invalidate", v6, 2u);
  }
  self->_cbSessionState = 4;
  -[PRBLEDiscoverySession _cancelScanRateAdjustmentTimer](self, "_cancelScanRateAdjustmentTimer");
  -[CBSpatialInteractionSession invalidate](self->_cbSession, "invalidate");
  cbSession = self->_cbSession;
  self->_cbSession = 0;

  -[NSMutableSet removeAllObjects](self->_peers, "removeAllObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
  objc_msgSend(v5, "removePayloadChangeObserver:", self);

}

- (id)addPeerDiscoveryToken:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  CBSpatialInteractionSession *cbSession;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21[2];
  uint8_t buf[4];
  void *v23;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      v5 = (id)qword_10085F520;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = CUPrintNSObjectMasked(v4, v6);
        objc_claimAutoreleasedReturnValue(v7);
        sub_1003C9148();
      }

      break;
    case 1:
      v14 = (id)qword_10085F520;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = CUPrintNSObjectMasked(v4, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        *(_DWORD *)buf = 138477827;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ble,addPeerToken %{private}@ waiting for activation complete", buf, 0xCu);

      }
      -[NSMutableSet addObject:](self->_activationPendingPeers, "addObject:", v4);
      break;
    case 2:
      v8 = (id)qword_10085F520;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CUPrintNSObjectMasked(v4, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        *(_DWORD *)buf = 138477827;
        v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ble,addPeerToken %{private}@ started", buf, 0xCu);

      }
      -[NSMutableSet addObject:](self->_peers, "addObject:", v4);
      objc_initWeak((id *)buf, self);
      v12 = sub_10000883C();
      cbSession = self->_cbSession;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000E1B4;
      v19[3] = &unk_1007FA108;
      v21[1] = *(id *)&v12;
      objc_copyWeak(v21, (id *)buf);
      v20 = v4;
      -[CBSpatialInteractionSession addPeerToken:completion:](cbSession, "addPeerToken:completion:", v20, v19);

      objc_destroyWeak(v21);
      objc_destroyWeak((id *)buf);
      break;
    default:
      break;
  }

  return 0;
}

- (id)removePeerDiscoveryToken:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  CBSpatialInteractionSession *cbSession;
  _QWORD v24[4];
  id v25;
  id v26[2];
  uint8_t buf[4];
  void *v28;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      v5 = (id)qword_10085F520;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = CUPrintNSObjectMasked(v4, v6);
        objc_claimAutoreleasedReturnValue(v7);
        sub_1003C91A8();
      }
      goto LABEL_15;
    case 1:
      v17 = (id)qword_10085F520;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = CUPrintNSObjectMasked(v4, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        *(_DWORD *)buf = 138477827;
        v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ble,removePeerToken %{private}@ removing from tokens that are waiting for activation complete", buf, 0xCu);

      }
      -[NSMutableSet removeObject:](self->_activationPendingPeers, "removeObject:", v4);
      break;
    case 2:
      v8 = (id)qword_10085F520;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CUPrintNSObjectMasked(v4, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        *(_DWORD *)buf = 138477827;
        v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ble,removePeerToken %{private}@ started", buf, 0xCu);

      }
      v12 = objc_claimAutoreleasedReturnValue(-[PRBluetoothDeviceCache deviceForTokenData:](self->_deviceCache, "deviceForTokenData:", v4));
      v5 = v12;
      if (v12 && -[NSObject systemKeyRelationship](v12, "systemKeyRelationship"))
      {
        v13 = (id)qword_10085F520;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v15 = CUPrintNSObjectMasked(v4, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          *(_DWORD *)buf = 138477827;
          v28 = v16;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ble,removePeerToken %{private}@ of device with system key relationship. Exit early", buf, 0xCu);

        }
      }
      else
      {
        -[NSMutableSet removeObject:](self->_peers, "removeObject:", v4);
        objc_initWeak((id *)buf, self);
        v21 = sub_10000883C();
        cbSession = self->_cbSession;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10000E6E0;
        v24[3] = &unk_1007FA108;
        v26[1] = *(id *)&v21;
        objc_copyWeak(v26, (id *)buf);
        v25 = v4;
        -[CBSpatialInteractionSession removePeerToken:completion:](cbSession, "removePeerToken:completion:", v25, v24);

        objc_destroyWeak(v26);
        objc_destroyWeak((id *)buf);
      }
LABEL_15:

      break;
    default:
      break;
  }

  return 0;
}

- (void)startAdvertising
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C9208();
      break;
    case 1:
      v6 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ble,startAdvertising waiting for activation complete", (uint8_t *)&v7, 2u);
      }
      self->_activationPendingControlFlags &= ~8u;
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aggregatedData"));

      v5 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138412290;
        v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,startAdvertising with UWB config: %@", (uint8_t *)&v7, 0xCu);
      }
      -[CBSpatialInteractionSession setAdvertiseRate:](self->_cbSession, "setAdvertiseRate:", 40);
      -[CBSpatialInteractionSession setUwbConfigData:](self->_cbSession, "setUwbConfigData:", v4);
      -[CBSpatialInteractionSession setAdvertiseRate:timeout:](self->_cbSession, "setAdvertiseRate:timeout:", 50, 2.0);
      -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", (unint64_t)-[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") & 0xFFFFFFF7);

      break;
    default:
      return;
  }
}

- (void)stopAdvertising
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C9284();
      break;
    case 1:
      v3 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,stopAdvertising waiting for activation complete", buf, 2u);
      }
      self->_activationPendingControlFlags |= 8u;
      break;
    case 2:
      v4 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,stopAdvertising", v5, 2u);
      }
      -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") | 8);
      break;
    default:
      return;
  }
}

- (void)startScanning
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C9300();
      break;
    case 1:
      v3 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,startScanning waiting for activation complete", buf, 2u);
      }
      self->_activationPendingControlFlags &= ~0x10u;
      self->_activationPendingScanBurstPeriod = 0.0;
      break;
    case 2:
      v4 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,startScanning", v5, 2u);
      }
      -[CBSpatialInteractionSession setScanRate:](self->_cbSession, "setScanRate:", 40);
      -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", (unint64_t)-[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") & 0xFFFFFFEF);
      break;
    default:
      return;
  }
}

- (void)startAdvertisingBurstForDeviceDiscovery
{
  unsigned int cbSessionState;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  _QWORD v16[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  cbSessionState = self->_cbSessionState;
  if (cbSessionState > 4)
    return;
  if (cbSessionState != 2)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003C937C();
    return;
  }
  if ((-[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") & 8) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "doubleForKey:", CFSTR("DeviceDiscoveryBurstLength"));
    v6 = v5;
    objc_msgSend(v4, "doubleForKey:", CFSTR("DeviceDiscoveryBurstAdvertiseRateMs"));
    v8 = v7;
    if (v7 == 30.0)
    {
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134217984;
        v16[0] = 0x403E000000000000;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ble,Overriding advertising burst rate with %f ms", (uint8_t *)&v15, 0xCu);
      }
    }
    else if (v7 == 60.0)
    {
      v10 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134217984;
        v16[0] = 0x404E000000000000;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ble,Overriding advertising burst rate with %f ms", (uint8_t *)&v15, 0xCu);
      }
      v11 = 45;
      goto LABEL_17;
    }
    v11 = 50;
LABEL_17:
    v12 = 2.0;
    if (v6 > 0.0)
    {
      v13 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134217984;
        *(double *)v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ble,Overriding advertising burst length with %f seconds", (uint8_t *)&v15, 0xCu);
      }
      v12 = v6;
    }
    v14 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 67109376;
      LODWORD(v16[0]) = v11;
      WORD2(v16[0]) = 2048;
      *(double *)((char *)v16 + 6) = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ble,startAdvertisingBurstForDeviceDiscovery. Rate: %d. Timeout: %0.1f s.", (uint8_t *)&v15, 0x12u);
    }
    -[CBSpatialInteractionSession setAdvertiseRate:timeout:](self->_cbSession, "setAdvertiseRate:timeout:", v11, v12);

    return;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003C93F8();
}

- (void)clearWifiRangingActiveAdvertisement
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C9424();
      break;
    case 1:
      v3 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,clearWifiRangingActiveAdvertisement waiting for activation complete", buf, 2u);
      }
      self->_activationPendingControlFlags &= ~0x800u;
      break;
    case 2:
      v4 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,clearWifiRangingActiveAdvertisement", v5, 2u);
      }
      -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", (unint64_t)-[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") & 0xFFFFF7FF);
      break;
    default:
      return;
  }
}

- (void)setWifiRangingActiveAdvertisement
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_wifiAdvertisingAllowed)
  {
    switch(self->_cbSessionState)
    {
      case 0:
      case 3:
      case 4:
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003C94CC();
        break;
      case 1:
        v3 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,setWifiRangingActiveAdvertisement waiting for activation complete", buf, 2u);
        }
        self->_activationPendingControlFlags |= 0x800u;
        break;
      case 2:
        v4 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v5 = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,setWifiRangingActiveAdvertisement", v5, 2u);
        }
        -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") | 0x800);
        break;
      default:
        return;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003C94A0();
  }
}

- (void)startScanningWithBurstPeriod:(double)a3
{
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *scanRateAdjustmentTimer;
  OS_dispatch_source **p_scanRateAdjustmentTimer;
  OS_dispatch_source *v10;
  dispatch_time_t v11;
  OS_dispatch_source *v12;
  _QWORD v13[4];
  id v14[2];
  uint8_t buf[4];
  double v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C9548();
      break;
    case 1:
      v5 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v16 = a3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,startScanningWithBurstPeriod [%0.1f s] waiting for activation complete", buf, 0xCu);
      }
      self->_activationPendingControlFlags &= ~0x10u;
      self->_activationPendingScanBurstPeriod = a3;
      break;
    case 2:
      v6 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v16 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ble,startScanningWithBurstPeriod [%0.1f s]", buf, 0xCu);
      }
      -[CBSpatialInteractionSession setScanRate:](self->_cbSession, "setScanRate:", 40);
      -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", (unint64_t)-[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") & 0xFFFFFFEF);
      -[PRBLEDiscoverySession _cancelScanRateAdjustmentTimer](self, "_cancelScanRateAdjustmentTimer");
      v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_clientQueue);
      p_scanRateAdjustmentTimer = &self->_scanRateAdjustmentTimer;
      scanRateAdjustmentTimer = self->_scanRateAdjustmentTimer;
      self->_scanRateAdjustmentTimer = v7;

      v10 = self->_scanRateAdjustmentTimer;
      v11 = dispatch_time(0, llround(a3 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      objc_initWeak((id *)buf, self);
      v12 = self->_scanRateAdjustmentTimer;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000F4CC;
      v13[3] = &unk_1007FA158;
      objc_copyWeak(v14, (id *)buf);
      v14[1] = *(id *)&a3;
      dispatch_source_set_event_handler((dispatch_source_t)v12, v13);
      dispatch_resume((dispatch_object_t)*p_scanRateAdjustmentTimer);
      objc_destroyWeak(v14);
      objc_destroyWeak((id *)buf);
      break;
    default:
      return;
  }
}

- (void)_cancelScanRateAdjustmentTimer
{
  OS_dispatch_source *scanRateAdjustmentTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  scanRateAdjustmentTimer = self->_scanRateAdjustmentTimer;
  if (scanRateAdjustmentTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scanRateAdjustmentTimer);
    v4 = self->_scanRateAdjustmentTimer;
    self->_scanRateAdjustmentTimer = 0;

  }
}

- (void)stopScanningAndRemovePeers:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C95C4();
      break;
    case 1:
      v8 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v9 = "NO";
        if (v3)
          v9 = "YES";
        *(_DWORD *)buf = 136315138;
        v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ble,stopScanningAndRemovePeers[%s] waiting for activation complete", buf, 0xCu);
      }
      self->_activationPendingControlFlags |= 0x10u;
      if (v3)
        -[NSMutableSet removeAllObjects](self->_activationPendingPeers, "removeAllObjects");
      break;
    case 2:
      v5 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v6 = "NO";
        if (v3)
          v6 = "YES";
        *(_DWORD *)buf = 136315138;
        v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,stopScanningAndRemovePeers[%s]", buf, 0xCu);
      }
      -[PRBLEDiscoverySession _cancelScanRateAdjustmentTimer](self, "_cancelScanRateAdjustmentTimer");
      -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") | 0x10);
      if (v3)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRBLEDiscoverySession currentPeers](self, "currentPeers"));
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_10000F854;
        v10[3] = &unk_1007FA180;
        v10[4] = self;
        objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

      }
      break;
    default:
      return;
  }
}

- (id)currentPeers
{
  return -[NSMutableSet allObjects](self->_peers, "allObjects");
}

- (int64_t)currentPeerCount
{
  return (int64_t)-[NSMutableSet count](self->_peers, "count");
}

- (optional<unsigned)nonConnectableAdvertisingAddress
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint8_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _BOOL8 v9;
  uint8_t v10[24];
  optional<unsigned long long> result;

  if (self->_cbSessionState == 2)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession advertisingAddressData](self->_cbSession, "advertisingAddressData"));
    v3 = v2;
    if (v2)
    {
      if (objc_msgSend(v2, "length") == (id)6)
      {
        objc_msgSend(v3, "getBytes:length:", v10, 6);
        v4 = ((unint64_t)v10[4] << 8) | ((unint64_t)v10[3] << 16) | ((unint64_t)v10[2] << 24) | ((unint64_t)v10[1] << 32) | ((unint64_t)v10[0] << 40);
        v5 = v10[5];
        v6 = 1;
LABEL_12:

        goto LABEL_13;
      }
      v7 = (id)qword_10085F520;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1003C9688(v10, (uint64_t)objc_msgSend(v3, "length"), v7);

    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003C965C();
    }
    v5 = 0;
    v6 = 0;
    v4 = 0;
    goto LABEL_12;
  }
  v5 = 0;
  v6 = 0;
  v4 = 0;
LABEL_13:
  v8 = v4 & 0xFFFFFFFFFF00 | v5;
  v9 = v6;
  result.__engaged_ = v9;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)v8;
  return result;
}

- (id)deviceCache
{
  return self->_deviceCache;
}

- (void)allowScreenOffOperation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  unsigned int activationPendingControlFlags;
  unsigned int v8;
  NSObject *v9;
  const char *v10;
  CBSpatialInteractionSession *cbSession;
  unsigned int v12;
  int v13;
  const char *v14;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C96DC();
      break;
    case 1:
      v5 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v6 = "NO";
        if (v3)
          v6 = "YES";
        v13 = 136315138;
        v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,allowScreenOffOperation[%s] waiting for activation complete", (uint8_t *)&v13, 0xCu);
      }
      activationPendingControlFlags = self->_activationPendingControlFlags;
      if (v3)
        v8 = activationPendingControlFlags | 0x1000;
      else
        v8 = activationPendingControlFlags & 0xFFFFEFFF;
      self->_activationPendingControlFlags = v8;
      break;
    case 2:
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v10 = "NO";
        if (v3)
          v10 = "YES";
        v13 = 136315138;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ble,allowScreenOffOperation[%s]", (uint8_t *)&v13, 0xCu);
      }
      cbSession = self->_cbSession;
      v12 = -[CBSpatialInteractionSession controlFlags](cbSession, "controlFlags");
      if (v3)
        -[CBSpatialInteractionSession setControlFlags:](cbSession, "setControlFlags:", v12 | 0x1000);
      else
        -[CBSpatialInteractionSession setControlFlags:](cbSession, "setControlFlags:", v12 & 0xFFFFEFFF);
      break;
    default:
      return;
  }
}

- (void)setBleRSSIThresholdHint:(char)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C9774();
      break;
    case 1:
      v5 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 67109120;
        v8 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,setBleRSSIThresholdHint[%d dBm] waiting for activation complete", (uint8_t *)&v7, 8u);
      }
      self->_activationPendingRssiThresholdHint = v3;
      break;
    case 2:
      v6 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 67109120;
        v8 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ble,setBleRSSIThresholdHint[%d dBm]", (uint8_t *)&v7, 8u);
      }
      -[CBSpatialInteractionSession setBleRSSIThresholdHint:](self->_cbSession, "setBleRSSIThresholdHint:", v3);
      break;
    default:
      return;
  }
}

- (void)didDiscoverDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  PRBluetoothDevice *v9;
  PRBluetoothDeviceCache *deviceCache;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  int v15;
  id v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,Discovered device: %@", (uint8_t *)&v15, 0xCu);
  }
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btAddressData"));
    if (v6
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btAddressData")),
          v8 = objc_msgSend(v7, "length") == (id)6,
          v7,
          v6,
          v8))
    {
      v9 = -[PRBluetoothDevice initWithCBDevice:]([PRBluetoothDevice alloc], "initWithCBDevice:", v4);
      deviceCache = self->_deviceCache;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDevice discoveryTokenData](v9, "discoveryTokenData"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDeviceCache deviceForTokenData:](deviceCache, "deviceForTokenData:", v11));

      -[PRBluetoothDeviceCache cacheDevice:](self->_deviceCache, "cacheDevice:", v9);
      if (self->_cbSessionState == 2)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v14 = WeakRetained;
        if (v12)
          objc_msgSend(WeakRetained, "discoveredDevice:didUpdate:", v12, v9);
        else
          objc_msgSend(WeakRetained, "didDiscoverDevice:", v9);

      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003C97F0();
    }
  }

}

- (void)didLoseDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  int v13;
  id v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,Lost device: %@", (uint8_t *)&v13, 0xCu);
  }
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btAddressData"));
    if (v6
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btAddressData")),
          v8 = objc_msgSend(v7, "length") == (id)6,
          v7,
          v6,
          v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btAddressData"));
      v10 = sub_10001014C(v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDeviceCache deviceForIdentifier:](self->_deviceCache, "deviceForIdentifier:", v10));
      if (self->_cbSessionState == 2)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "didLoseDevice:", v11);

      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003C981C();
    }
  }

}

- (void)didFailWithError:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003C9848((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)bluetoothStateChanged
{
  unint64_t v3;
  NSObject *v4;
  const char *v5;
  id WeakRetained;
  int v7;
  const char *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = (unint64_t)-[CBSpatialInteractionSession bluetoothState](self->_cbSession, "bluetoothState");
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > 0xA)
      v5 = "?";
    else
      v5 = off_1007FA1C8[v3];
    v7 = 136315138;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,Bluetooth state changed: %s", (uint8_t *)&v7, 0xCu);
  }
  if (self->_cbSessionState == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bluetoothDidChangeState:", -[CBSpatialInteractionSession bluetoothState](self->_cbSession, "bluetoothState"));

  }
}

- (void)bluetoothServiceInterrupted
{
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_cbSessionState == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bluetoothServiceInterrupted");

  }
}

- (void)systemOverrideNotification
{
  NSObject *v3;
  unsigned int v4;
  unsigned __int8 v5;
  int v6;
  const char *v7;
  int v8;
  const char *v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_cbSessionState == 2)
  {
    v3 = (id)qword_10085F520;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_48:

      return;
    }
    v4 = -[CBSpatialInteractionSession systemOverrideFlags](self->_cbSession, "systemOverrideFlags");
    v5 = -[CBSpatialInteractionSession systemOverrideFlags](self->_cbSession, "systemOverrideFlags");
    v6 = -[CBSpatialInteractionSession scanRate](self->_cbSession, "scanRate");
    if (v6 > 34)
    {
      if (v6 > 49)
      {
        if (v6 == 50)
        {
          v7 = "High";
          goto LABEL_23;
        }
        if (v6 == 60)
        {
          v7 = "Max";
          goto LABEL_23;
        }
      }
      else
      {
        if (v6 == 35)
        {
          v7 = "MediumLow";
          goto LABEL_23;
        }
        if (v6 == 40)
        {
          v7 = "Medium";
          goto LABEL_23;
        }
      }
    }
    else if (v6 > 19)
    {
      if (v6 == 20)
      {
        v7 = "Background";
        goto LABEL_23;
      }
      if (v6 == 30)
      {
        v7 = "Low";
        goto LABEL_23;
      }
    }
    else
    {
      if (!v6)
      {
        v7 = "Default";
        goto LABEL_23;
      }
      if (v6 == 10)
      {
        v7 = "Periodic";
        goto LABEL_23;
      }
    }
    v7 = "?";
LABEL_23:
    v8 = -[CBSpatialInteractionSession advertiseRate](self->_cbSession, "advertiseRate");
    if (v8 > 39)
    {
      if (v8 <= 44)
      {
        if (v8 == 40)
        {
          v9 = "Medium";
          goto LABEL_47;
        }
        if (v8 == 42)
        {
          v9 = "MediumMid";
          goto LABEL_47;
        }
      }
      else
      {
        switch(v8)
        {
          case '-':
            v9 = "MediumHigh";
            goto LABEL_47;
          case '2':
            v9 = "High";
            goto LABEL_47;
          case '<':
            v9 = "Max";
            goto LABEL_47;
        }
      }
    }
    else if (v8 <= 14)
    {
      if (!v8)
      {
        v9 = "Default";
        goto LABEL_47;
      }
      if (v8 == 10)
      {
        v9 = "Periodic";
        goto LABEL_47;
      }
    }
    else
    {
      switch(v8)
      {
        case 15:
          v9 = "PeriodicHigh";
          goto LABEL_47;
        case 20:
          v9 = "Background";
          goto LABEL_47;
        case 30:
          v9 = "Low";
LABEL_47:
          v10[0] = 67109890;
          v10[1] = v4;
          v11 = 1024;
          v12 = v5 & 1;
          v13 = 2080;
          v14 = v7;
          v15 = 2080;
          v16 = v9;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,[BLE Discovery] #nicoex System override flags: %x. WiFi critical: %d. Scan rate (%s), advertise rate (%s)", (uint8_t *)v10, 0x22u);
          goto LABEL_48;
      }
    }
    v9 = "?";
    goto LABEL_47;
  }
}

- (void)bluetoothAdvertisingAddressChanged
{
  id v3;
  char v4;
  id v5;
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_cbSessionState == 2)
  {
    v3 = -[PRBLEDiscoverySession nonConnectableAdvertisingAddress](self, "nonConnectableAdvertisingAddress");
    if (v4)
    {
      v5 = v3;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "bluetoothAdvertisingAddressChanged:", v5);

    }
  }
}

- (id)payloadChangeObserverQueue
{
  return self->_clientQueue;
}

- (void)payloadDidChange
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  void *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_cbSessionState == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aggregatedData"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession uwbConfigData](self->_cbSession, "uwbConfigData"));
    v6 = objc_msgSend(v5, "isEqualToData:", v4);

    if (v6)
    {
      v7 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ble,Payload did change called, but no change to apply", (uint8_t *)&v11, 2u);
      }
    }
    else
    {
      v8 = -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags");
      v9 = qword_10085F520;
      v10 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
      if ((v8 & 8) != 0)
      {
        if (v10)
        {
          v11 = 138412290;
          v12 = v4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ble,Payload did change: %@. Session updated, but not currently advertising", (uint8_t *)&v11, 0xCu);
        }
        -[CBSpatialInteractionSession setUwbConfigData:](self->_cbSession, "setUwbConfigData:", v4);
      }
      else
      {
        if (v10)
        {
          v11 = 138412290;
          v12 = v4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ble,Payload did change: %@. Session updated, and control flags toggled for it to take effect", (uint8_t *)&v11, 0xCu);
        }
        -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") | 8);
        -[CBSpatialInteractionSession setUwbConfigData:](self->_cbSession, "setUwbConfigData:", v4);
        -[CBSpatialInteractionSession setControlFlags:](self->_cbSession, "setControlFlags:", (unint64_t)-[CBSpatialInteractionSession controlFlags](self->_cbSession, "controlFlags") & 0xFFFFFFF7);
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanRateAdjustmentTimer, 0);
  objc_storeStrong((id *)&self->_activationPendingPeers, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_deviceCache, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cbSession, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 80) = 0;
  *((_BYTE *)self + 88) = 0;
  return self;
}

@end
