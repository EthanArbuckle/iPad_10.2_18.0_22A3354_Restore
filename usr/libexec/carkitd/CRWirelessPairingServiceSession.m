@implementation CRWirelessPairingServiceSession

- (CRWirelessPairingServiceSession)initWithBluetoothManager:(id)a3 preferences:(id)a4
{
  id v7;
  id v8;
  CRWirelessPairingServiceSession *v9;
  CRWirelessPairingServiceSession *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *sessionQueue;
  OS_os_transaction *sessionTransaction;
  NSTimer *connectionTimer;
  NSData *bluetoothAddress;
  id promptResponseHandler;
  id localOOBDataHandler;
  id bluetoothConnectedHandler;
  id sessionDetachHandler;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CRWirelessPairingServiceSession;
  v9 = -[CRWirelessPairingServiceSession init](&v23, "init");
  v10 = v9;
  if (v9)
  {
    v9->_intent = 0;
    v9->_btSession = 0;
    v9->_pairingAgent = 0;
    v9->_active = 0;
    objc_storeStrong((id *)&v9->_bluetoothManager, a3);
    objc_storeStrong((id *)&v10->_carPlayPreferences, a4);
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.carkit.pairing.btSession", v12);
    sessionQueue = v10->_sessionQueue;
    v10->_sessionQueue = (OS_dispatch_queue *)v13;

    sessionTransaction = v10->_sessionTransaction;
    v10->_sessionTransaction = 0;

    connectionTimer = v10->_connectionTimer;
    v10->_connectionTimer = 0;

    bluetoothAddress = v10->_bluetoothAddress;
    v10->_bluetoothAddress = 0;

    promptResponseHandler = v10->_promptResponseHandler;
    v10->_promptResponseHandler = 0;

    localOOBDataHandler = v10->_localOOBDataHandler;
    v10->_localOOBDataHandler = 0;

    bluetoothConnectedHandler = v10->_bluetoothConnectedHandler;
    v10->_bluetoothConnectedHandler = 0;

    sessionDetachHandler = v10->_sessionDetachHandler;
    v10->_sessionDetachHandler = 0;

  }
  return v10;
}

- (void)invalidate
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = CarPairingLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10006D524();

  -[CRWirelessPairingServiceSession _mainQueue_invalidateSession](self, "_mainQueue_invalidateSession");
}

- (BOOL)isPairingAvailable
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession carPlayPreferences](self, "carPlayPreferences"));
  v3 = objc_msgSend(v2, "isCarPlayAllowed");

  if ((v3 & 1) == 0)
  {
    v5 = CarPairingLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10006D550();

  }
  return v3;
}

- (void)handlePairingPromptResponse:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession promptResponseHandler](self, "promptResponseHandler"));
  v6 = (void (**)(_QWORD, _QWORD))v5;
  if (v5)
  {
    v7 = CarPairingLogging(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      v13 = 138543362;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "handlePairingPromptResponse %{public}@", (uint8_t *)&v13, 0xCu);
    }

    v6[2](v6, v3);
    -[CRWirelessPairingServiceSession setPromptResponseHandler:](self, "setPromptResponseHandler:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    v11 = v10;
    if (v3)
      v12 = 2;
    else
      v12 = 1;
    objc_msgSend(v10, "setCarKeyPairingResult:", v12);

  }
}

- (void)initializeForVehicleAddress:(id)a3 keyIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040BBC;
  block[3] = &unk_1000B6918;
  objc_copyWeak(&v18, &location);
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)requestPairingForIntent:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100040D7C;
  v8[3] = &unk_1000B6990;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)setupVehicleDataC192:(id)a3 r192:(id)a4 c256:(id)a5 r256:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041728;
  block[3] = &unk_1000B6A30;
  objc_copyWeak(&v28, &location);
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)cancelPairing
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100041E08;
  v2[3] = &unk_1000B5728;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)setActive:(BOOL)a3
{
  id v4;

  self->_active = a3;
  if (a3)
  {
    v4 = (id)os_transaction_create("com.apple.carkit.WirelessPairingServiceSession");
    -[CRWirelessPairingServiceSession setSessionTransaction:](self, "setSessionTransaction:", v4);

  }
  else
  {
    -[CRWirelessPairingServiceSession setSessionTransaction:](self, "setSessionTransaction:", 0);
  }
}

- (BTLocalDeviceImpl)_localDeviceForSession:(BTSessionImpl *)a3
{
  uint64_t Default;
  uint64_t v4;
  NSObject *v5;
  BTLocalDeviceImpl *v7;

  v7 = 0;
  Default = BTLocalDeviceGetDefault(a3, &v7);
  if (!(_DWORD)Default)
    return v7;
  v4 = CarPairingLogging(Default);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10006D874();

  return 0;
}

- (id)_localDeviceAddressFromSession:(BTSessionImpl *)a3
{
  BTLocalDeviceImpl *v3;
  uint64_t AddressString;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  __int16 v11;
  _BYTE v12[64];

  v3 = -[CRWirelessPairingServiceSession _localDeviceForSession:](self, "_localDeviceForSession:", a3);
  if (v3)
  {
    AddressString = BTLocalDeviceGetAddressString(v3, v12, 64);
    if ((_DWORD)AddressString)
    {
      v5 = CarPairingLogging(AddressString);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10006D900();
    }
    else
    {
      v11 = 0;
      v10 = 0;
      v7 = BTDeviceAddressFromString(v12, &v10);
      if (!(_DWORD)v7)
      {
        v3 = (BTLocalDeviceImpl *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v10, 6));
        return v3;
      }
      v8 = CarPairingLogging(v7);
      v6 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10006D8A0();
    }

    v3 = 0;
  }
  return v3;
}

- (BTDeviceImpl)_remoteDeviceFromSession:(BTSessionImpl *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  BTDeviceImpl *v11;
  int v12;
  __int16 v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession bluetoothAddress](self, "bluetoothAddress"));

  if (!v5)
    return 0;
  v13 = 0;
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession bluetoothAddress](self, "bluetoothAddress"));
  objc_msgSend(v6, "getBytes:length:", &v12, 6);

  v11 = 0;
  v7 = BTDeviceFromAddress(a3, &v12, &v11);
  if ((_DWORD)v7)
  {
    v8 = CarPairingLogging(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006D960();

    return 0;
  }
  return v11;
}

- (id)_addressStringForDevice:(BTDeviceImpl *)a3
{
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  if (BTDeviceGetAddressString(a3, v4, 32))
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
}

- (unsigned)_intendedServiceMask
{
  if ((id)-[CRWirelessPairingServiceSession intent](self, "intent") == (id)2)
    return 128;
  else
    return -1;
}

- (void)_mainQueue_performWithSession:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!self->_btSession)
  {
    location = sub_100042560;
    v5 = dispatch_semaphore_create(0);
    -[CRWirelessPairingServiceSession setWaitingOnSession:](self, "setWaitingOnSession:", v5);

    v6 = BTSessionAttachWithQueue("com.apple.carkitd.pairing", &location, self, &_dispatch_main_q);
    if (v6)
    {
      v8 = CarPairingLogging(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10006D9C0();

    }
    else
    {
      -[CRWirelessPairingServiceSession _mainQueue_blockSessionQueue](self, "_mainQueue_blockSessionQueue");
    }
  }
  objc_initWeak(&location, self);
  v10 = objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042620;
  block[3] = &unk_1000B57A0;
  objc_copyWeak(&v14, &location);
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_mainQueue_blockSessionQueue
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004277C;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_mainQueue_unblockSessionQueue
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = CarPairingLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10006DA18();

  v6 = objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession waitingOnSession](self, "waitingOnSession"));
  dispatch_semaphore_signal(v6);

}

- (void)_mainQueue_invalidateSession
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000428C0;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_mainQueue_handleEvent:(int)a3 forSession:(BTSessionImpl *)a4
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CRWirelessPairingServiceSession *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ((a3 - 1) >= 3)
  {
    if (a3)
      return;
    v15 = CarPairingLogging(v7);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_10006DA9C();

    self->_btSession = a4;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100042C64;
    v17[3] = &unk_1000B51B8;
    v17[4] = self;
    v14 = self;
    -[CRWirelessPairingServiceSession setSessionDetachHandler:](v14, "setSessionDetachHandler:", v17);
    -[CRWirelessPairingServiceSession _mainQueue_unblockSessionQueue](v14, "_mainQueue_unblockSessionQueue");
    goto LABEL_12;
  }
  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10006DAF4();

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession sessionDetachHandler](self, "sessionDetachHandler"));
  if (v10)
  {
    v12 = CarPairingLogging(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10006DAC8();

    v14 = (CRWirelessPairingServiceSession *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession sessionDetachHandler](self, "sessionDetachHandler"));
    ((void (*)(void))v14->_pairingAgent)();
LABEL_12:

  }
}

- (void)_mainQueue_performWithPairingAgent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100042D90;
  v6[3] = &unk_1000B6A80;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[CRWirelessPairingServiceSession _mainQueue_performWithSession:](self, "_mainQueue_performWithSession:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_mainQueue_requestLocalOOBDataWithCompletion:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100043010;
  v10[3] = &unk_1000B6AD0;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  -[CRWirelessPairingServiceSession _mainQueue_performWithPairingAgent:](self, "_mainQueue_performWithPairingAgent:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_mainQueue_handleLocalOOBDataC192:(char *)a3 r192:(char *)a4 c256:(char *)a5 r256:(char *)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v16;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, 16));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a4, 16));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a5, 16));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a6, 16));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession localOOBDataHandler](self, "localOOBDataHandler"));

  if (v14)
  {
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession localOOBDataHandler](self, "localOOBDataHandler"));
    ((void (**)(_QWORD, id, void *, void *, void *))v15)[2](v15, v16, v11, v12, v13);

    -[CRWirelessPairingServiceSession setLocalOOBDataHandler:](self, "setLocalOOBDataHandler:", 0);
  }

}

- (void)_mainQueue_connectDevice:(BTDeviceImpl *)a3 session:(BTSessionImpl *)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  void (**v26)(id, _QWORD);
  id v27[2];
  id buf;

  v8 = (void (**)(id, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v9 = -[CRWirelessPairingServiceSession _intendedServiceMask](self, "_intendedServiceMask");
  v10 = BTServiceAddCallbacks(a4, sub_1000429E8, self);
  if ((_DWORD)v10)
  {
    v11 = CarPairingLogging(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10006DC04();

    if (v8)
LABEL_5:
      v8[2](v8, 0);
  }
  else
  {
    v13 = BTDeviceConnectServices(a3, v9);
    v14 = (_DWORD)v13 == 0;
    v15 = CarPairingLogging(v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "started connecting BT using OOB pairing data, service mask: %u", (uint8_t *)&buf, 8u);
      }

      objc_initWeak(&buf, self);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100043544;
      v25[3] = &unk_1000B6AF8;
      objc_copyWeak(v27, &buf);
      v27[1] = a4;
      v26 = v8;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000435E0;
      v23[3] = &unk_1000B5628;
      v18 = objc_retainBlock(v25);
      v24 = v18;
      -[CRWirelessPairingServiceSession setBluetoothConnectedHandler:](self, "setBluetoothConnectedHandler:", v23);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100043658;
      v21[3] = &unk_1000B6B20;
      v19 = v18;
      v22 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v21, 30.0));
      -[CRWirelessPairingServiceSession setConnectionTimer:](self, "setConnectionTimer:", v20);

      objc_destroyWeak(v27);
      objc_destroyWeak(&buf);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10006DBA4();

      if (v8)
        goto LABEL_5;
    }
  }

}

- (void)_mainQueue_handleDidConnectDevice:(BTDeviceImpl *)a3 service:(unsigned int)a4
{
  _QWORD v6[6];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004371C;
  v6[3] = &unk_1000B6B48;
  v6[4] = self;
  v6[5] = a3;
  -[CRWirelessPairingServiceSession _mainQueue_performWithSession:](self, "_mainQueue_performWithSession:", v6);
}

- (void)_mainQueue_delegateDidFinishWithResult:(unint64_t)a3 error:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6 = objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession delegate](self, "delegate"));
  v7 = (void *)v6;
  if (v6)
  {
    if (!a3 && (objc_opt_respondsToSelector(v6, "pairingServiceSessionDidFinishPairing:") & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession delegate](self, "delegate"));
      objc_msgSend(v8, "pairingServiceSessionDidFinishPairing:", self);
LABEL_7:

      goto LABEL_8;
    }
    if ((objc_opt_respondsToSelector(v7, "pairingServiceSession:didFailPairingAttemptWithError:") & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceSession delegate](self, "delegate"));
      objc_msgSend(v8, "pairingServiceSession:didFailPairingAttemptWithError:", self, v9);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothAddress, a3);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (CRWirelessPairingServiceSessionDelegate)delegate
{
  return (CRWirelessPairingServiceSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRBluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (CRCarPlayPreferences)carPlayPreferences
{
  return self->_carPlayPreferences;
}

- (OS_dispatch_semaphore)waitingOnSession
{
  return self->_waitingOnSession;
}

- (void)setWaitingOnSession:(id)a3
{
  objc_storeStrong((id *)&self->_waitingOnSession, a3);
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (OS_os_transaction)sessionTransaction
{
  return self->_sessionTransaction;
}

- (void)setSessionTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTransaction, a3);
}

- (NSTimer)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTimer, a3);
}

- (id)promptResponseHandler
{
  return self->_promptResponseHandler;
}

- (void)setPromptResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)localOOBDataHandler
{
  return self->_localOOBDataHandler;
}

- (void)setLocalOOBDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)bluetoothConnectedHandler
{
  return self->_bluetoothConnectedHandler;
}

- (void)setBluetoothConnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)sessionDetachHandler
{
  return self->_sessionDetachHandler;
}

- (void)setSessionDetachHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionDetachHandler, 0);
  objc_storeStrong(&self->_bluetoothConnectedHandler, 0);
  objc_storeStrong(&self->_localOOBDataHandler, 0);
  objc_storeStrong(&self->_promptResponseHandler, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_waitingOnSession, 0);
  objc_storeStrong((id *)&self->_carPlayPreferences, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end
