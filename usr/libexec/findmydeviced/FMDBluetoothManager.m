@implementation FMDBluetoothManager

- (FMDBluetoothManager)init
{
  return -[FMDBluetoothManager initWithMockBluetoothManager:](self, "initWithMockBluetoothManager:", 0);
}

- (FMDBluetoothManager)initWithMockBluetoothManager:(id)a3
{
  id v4;
  FMDBluetoothManager *v5;
  FMDBluetoothManager *v6;
  dispatch_queue_t v7;
  dispatch_queue_t v8;
  id v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FMDBluetoothManager;
  v5 = -[FMDBluetoothManager init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDBluetoothManager setMockBluetoothManager:](v5, "setMockBluetoothManager:", v4);
    v7 = dispatch_queue_create("com.apple.icloud.findmydeviced.bluetoothdiscoveryqueue", 0);
    -[FMDBluetoothManager setBluetoothDiscoveryQueue:](v6, "setBluetoothDiscoveryQueue:", v7);

    v8 = dispatch_queue_create("com.apple.icloud.findmydeviced.bluetoothManagerQueue", 0);
    -[FMDBluetoothManager setBluetoothManagerQueue:](v6, "setBluetoothManagerQueue:", v8);

    v9 = objc_alloc((Class)FMQueueSynchronizer);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerQueue](v6, "bluetoothManagerQueue"));
    v11 = objc_msgSend(v9, "initWithQueue:", v10);
    -[FMDBluetoothManager setBluetoothManagerQueueSynchronizer:](v6, "setBluetoothManagerQueueSynchronizer:", v11);

    v12 = dispatch_queue_create("com.apple.icloud.findmydeviced.bluetoothManagerAccessoriesQueue", 0);
    -[FMDBluetoothManager setAccessoriesQueue:](v6, "setAccessoriesQueue:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDBluetoothManager setBluetoothManagerDevicesByAddress:](v6, "setBluetoothManagerDevicesByAddress:", v13);

    -[FMDBluetoothManager setupDiscovery](v6, "setupDiscovery");
    -[FMDBluetoothManager startMonitoringDevices](v6, "startMonitoringDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManager](v6, "bluetoothManager"));
    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMDBluetoothManager starting BluetoothManager %@", buf, 0xCu);
    }

    v17 = sub_1000031B8();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FMDBluetoothManager initialized", buf, 2u);
    }

  }
  return v6;
}

- (void)connectToDeviceAddress:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManager](self, "bluetoothManager"));
  v6 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerQueue](self, "bluetoothManagerQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005979C;
  v9[3] = &unk_1002C13E8;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

- (id)newDiscovery
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager discoveryCoordinator](self, "discoveryCoordinator"));
  v3 = objc_msgSend(v2, "newDiscovery");

  return v3;
}

- (BOOL)isDiscoveryActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager discoveryCoordinator](self, "discoveryCoordinator"));
  v3 = objc_msgSend(v2, "isDiscoveryActive");

  return v3;
}

- (void)getAccessoriesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  FMDBluetoothManager *v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManager](self, "bluetoothManager"));
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100059928;
  v17[4] = sub_100059938;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v6 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerQueue](self, "bluetoothManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059B80;
  block[3] = &unk_1002C3708;
  v13 = v15;
  v14 = v17;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

}

- (void)startMonitoringDevices
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BluetoothManager startWatchingForDevices", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "deviceNameChanged:", BluetoothMagicPairedDeviceNameChangedNotification, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "addDeviceNotification:", BluetoothDeviceConnectSuccessNotification, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "removeDeviceNotification:", BluetoothDeviceDisconnectSuccessNotification, 0);

}

- (void)deviceNameChanged:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___FMDBluetoothFrameworkDevice);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v8 = objc_msgSend(v7, "copy");

    if (-[NSObject isTemporaryPaired](v8, "isTemporaryPaired"))
    {
      v9 = sub_1000031B8();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BluetoothMagicPairedDeviceNameChangedNotification ignoring temporary device", buf, 2u);
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerDeviceForBluetoothDevice:](self, "bluetoothManagerDeviceForBluetoothDevice:", v8));
      v13 = sub_1000031B8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BluetoothManager deviceNameChanged %@", buf, 0xCu);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10005A524;
      v16[3] = &unk_1002C13E8;
      v17 = (id)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager delegate](self, "delegate"));
      v18 = v12;
      v15 = v12;
      v10 = v17;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);

    }
  }
  else
  {
    v11 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1002298DC();
  }

}

- (void)addDeviceNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  NSObject *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___FMDBluetoothFrameworkDevice);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v8 = objc_msgSend(v7, "copy");

    if (-[NSObject isTemporaryPaired](v8, "isTemporaryPaired"))
    {
      v9 = sub_1000031B8();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BluetoothDeviceConnectSuccessNotification ignoring temporary device", buf, 2u);
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[NSObject address](v8, "address"));
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BluetoothManager addDeviceNotification %@", buf, 0xCu);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerDeviceForBluetoothDevice:](self, "bluetoothManagerDeviceForBluetoothDevice:", v8));
      v15 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager delegate](self, "delegate"));
      v16 = sub_1000031B8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BluetoothManager notifying delegate bluetoothManagerDidConnectDevice %@", buf, 0xCu);
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005A798;
      v20[3] = &unk_1002C13E8;
      v21 = v15;
      v22 = v14;
      v18 = v14;
      v19 = v15;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);

    }
  }
  else
  {
    v11 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100229908();
  }

}

- (void)removeDeviceNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  NSObject *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___FMDBluetoothFrameworkDevice);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v8 = objc_msgSend(v7, "copy");

    if (-[NSObject isTemporaryPaired](v8, "isTemporaryPaired"))
    {
      v9 = sub_1000031B8();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BluetoothDeviceDisconnectSuccessNotification ignoring temporary device", buf, 2u);
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[NSObject address](v8, "address"));
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BluetoothManager removeDeviceNotification %@", buf, 0xCu);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerDeviceForBluetoothDevice:](self, "bluetoothManagerDeviceForBluetoothDevice:", v8));
      v15 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager delegate](self, "delegate"));
      v16 = sub_1000031B8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BluetoothManager notifying delegate bluetoothManagerDidDisconnectDevice %@", buf, 0xCu);
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005AA0C;
      v20[3] = &unk_1002C13E8;
      v21 = v15;
      v22 = v14;
      v18 = v14;
      v19 = v15;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);

    }
  }
  else
  {
    v11 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100229934();
  }

}

- (void)setupDiscovery
{
  FMDBluetoothDiscoveryXPCProxy *v3;
  FMDBluetoothDiscoveryCoordinator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v3 = objc_alloc_init(FMDBluetoothDiscoveryXPCProxy);
  v4 = -[FMDBluetoothDiscoveryCoordinator initWithDiscovery:]([FMDBluetoothDiscoveryCoordinator alloc], "initWithDiscovery:", v3);
  -[FMDBluetoothManager setDiscoveryCoordinator:](self, "setDiscoveryCoordinator:", v4);

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005AC50;
  v15[3] = &unk_1002C3730;
  objc_copyWeak(&v16, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager discoveryCoordinator](self, "discoveryCoordinator"));
  objc_msgSend(v5, "setDidDiscoverDevice:", v15);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005ADA0;
  v13[3] = &unk_1002C3730;
  objc_copyWeak(&v14, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager discoveryCoordinator](self, "discoveryCoordinator"));
  objc_msgSend(v6, "setDidLoseDevice:", v13);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005AEF0;
  v11[3] = &unk_1002C3758;
  objc_copyWeak(&v12, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager discoveryCoordinator](self, "discoveryCoordinator"));
  objc_msgSend(v7, "setDidEndDiscovery:", v11);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005AFE4;
  v9[3] = &unk_1002C1378;
  objc_copyWeak(&v10, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager discoveryCoordinator](self, "discoveryCoordinator"));
  objc_msgSend(v8, "setDidStartDiscovery:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)setAllAudioChannelsActive:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothDiscoveryQueue](self, "bluetoothDiscoveryQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerDevicesByAddress](self, "bluetoothManagerDevicesByAddress"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B16C;
  v7[3] = &unk_1002C3780;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)setInternalDeviceAudioChannels:(id)a3 profile:(int64_t)a4 active:(BOOL)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;

  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothDiscoveryQueue](self, "bluetoothDiscoveryQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "channelNamesForProfile:", a4));

  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_10005B360;
  v21 = &unk_1002C37A8;
  v23 = a5;
  v12 = v8;
  v22 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v18);
  v13 = sub_1000031B8();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_opt_self(v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 134217984;
    v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BluetoothManager setInternalDeviceAudioChannels FMDInternalBluetoothManagerDevice(0x%lX)", buf, 0xCu);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager delegate](self, "delegate", v18, v19, v20, v21));
  objc_msgSend(v17, "bluetoothManagerDidUpdateDevice:", v12);

}

- (void)didDiscoverDevice:(id)a3
{
  -[FMDBluetoothManager updateBeaconsWithDevice:active:](self, "updateBeaconsWithDevice:active:", a3, 1);
}

- (void)didLoseDevice:(id)a3
{
  -[FMDBluetoothManager updateBeaconsWithDevice:active:](self, "updateBeaconsWithDevice:active:", a3, 0);
}

- (void)updateBeaconsWithDevice:(id)a3 active:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothDiscoveryQueue](self, "bluetoothDiscoveryQueue"));
  dispatch_assert_queue_V2(v7);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothDeviceForBLEDevice:](self, "bluetoothDeviceForBLEDevice:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager _bluetoothManagerDeviceForBluetoothDevice:](self, "_bluetoothManagerDeviceForBluetoothDevice:", v14));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bluetoothDevice"));
  v10 = -[FMDBluetoothManager profileForBluetoothManagerDevice:](self, "profileForBluetoothManagerDevice:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDBLEAudioAdvertisementParser configurationDictWithBleDevice:supportedAccessoryProfile:](FMDBLEAudioAdvertisementParser, "configurationDictWithBleDevice:supportedAccessoryProfile:", v6, v10));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005B510;
  v15[3] = &unk_1002C37D0;
  v17 = a4;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager delegate](self, "delegate"));
  objc_msgSend(v13, "bluetoothManagerDidUpdateDevice:", v12);

}

- (id)bluetoothDeviceForBLEDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManager](self, "bluetoothManager"));
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100059928;
  v19 = sub_100059938;
  v20 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerQueueSynchronizer](self, "bluetoothManagerQueueSynchronizer"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005B6DC;
  v11[3] = &unk_1002C1410;
  v7 = v4;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v6, "conditionalSync:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)bluetoothManager
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager mockBluetoothManager](self, "mockBluetoothManager"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerQueue](self, "bluetoothManagerQueue"));
    v5 = (id)objc_claimAutoreleasedReturnValue(+[FMDBluetoothFrameworkBTManagingFactory bluetoothManagerWithQueue:delegate:](FMDBluetoothFrameworkBTManagingFactory, "bluetoothManagerWithQueue:delegate:", v6, self));

  }
  return v5;
}

- (id)bluetoothManagerDeviceForBluetoothDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100059928;
  v16 = sub_100059938;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothDiscoveryQueue](self, "bluetoothDiscoveryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BA90;
  block[3] = &unk_1002C18B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_bluetoothManagerDeviceForBluetoothDevice:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  void *v8;
  FMDInternalBluetoothManagerDevice *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothDiscoveryQueue](self, "bluetoothDiscoveryQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = -[FMDBluetoothManager profileForBluetoothManagerDevice:](self, "profileForBluetoothManagerDevice:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "address"));
  if (!v7
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerDevicesByAddress](self, "bluetoothManagerDevicesByAddress")),
        v9 = (FMDInternalBluetoothManagerDevice *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7)),
        v8,
        !v9))
  {
    v9 = objc_alloc_init(FMDInternalBluetoothManagerDevice);
    -[FMDBluetoothManager setInternalDeviceAudioChannels:profile:active:](self, "setInternalDeviceAudioChannels:profile:active:", v9, v6, 0);
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager bluetoothManagerDevicesByAddress](self, "bluetoothManagerDevicesByAddress"));
      objc_msgSend(v10, "setObject:forKey:", v9, v7);

    }
  }
  -[FMDInternalBluetoothManagerDevice setBluetoothDevice:](v9, "setBluetoothDevice:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "advertisementStatusKeyForProfile:", v6));
  -[FMDInternalBluetoothManagerDevice setAdvertisementStatusKey:](v9, "setAdvertisementStatusKey:", v12);

  return v9;
}

- (int64_t)profileForBluetoothManagerDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = objc_alloc((Class)FMDAccessoryIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "vendorId")));
  v7 = objc_msgSend(v4, "productId");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
  v9 = objc_msgSend(v5, "initWithDeviceVendor:deviceProductId:", v6, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothManager supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
  v11 = objc_msgSend(v10, "profileForAccessoryIdentifier:", v9);

  return (int64_t)v11;
}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  return self->_supportedAccessoryRegistry;
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_supportedAccessoryRegistry, a3);
}

- (FMDBluetoothManagerDelegate)delegate
{
  return (FMDBluetoothManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)bluetoothDiscoveryQueue
{
  return self->_bluetoothDiscoveryQueue;
}

- (void)setBluetoothDiscoveryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothDiscoveryQueue, a3);
}

- (OS_dispatch_queue)bluetoothManagerQueue
{
  return self->_bluetoothManagerQueue;
}

- (void)setBluetoothManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothManagerQueue, a3);
}

- (OS_dispatch_queue)accessoriesQueue
{
  return self->_accessoriesQueue;
}

- (void)setAccessoriesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesQueue, a3);
}

- (FMDBluetoothDiscoveryCoordinator)discoveryCoordinator
{
  return self->_discoveryCoordinator;
}

- (void)setDiscoveryCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryCoordinator, a3);
}

- (NSMutableDictionary)bluetoothManagerDevicesByAddress
{
  return self->_bluetoothManagerDevicesByAddress;
}

- (void)setBluetoothManagerDevicesByAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothManagerDevicesByAddress, a3);
}

- (FMDBluetoothFrameworkBTManaging)mockBluetoothManager
{
  return self->_mockBluetoothManager;
}

- (void)setMockBluetoothManager:(id)a3
{
  objc_storeStrong((id *)&self->_mockBluetoothManager, a3);
}

- (FMQueueSynchronizer)bluetoothManagerQueueSynchronizer
{
  return self->_bluetoothManagerQueueSynchronizer;
}

- (void)setBluetoothManagerQueueSynchronizer:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothManagerQueueSynchronizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothManagerQueueSynchronizer, 0);
  objc_storeStrong((id *)&self->_mockBluetoothManager, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerDevicesByAddress, 0);
  objc_storeStrong((id *)&self->_discoveryCoordinator, 0);
  objc_storeStrong((id *)&self->_accessoriesQueue, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerQueue, 0);
  objc_storeStrong((id *)&self->_bluetoothDiscoveryQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_supportedAccessoryRegistry, 0);
}

@end
