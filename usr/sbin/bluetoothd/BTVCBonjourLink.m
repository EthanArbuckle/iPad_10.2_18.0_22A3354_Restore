@implementation BTVCBonjourLink

- (BTVCBonjourLink)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  BTVCBonjourLink *v9;
  BTVCBonjourLink *v10;
  BTVCBonjourService *v11;
  BTVCBonjourService *btvcBonjourService;
  uint64_t v13;
  NSMutableDictionary *advertiserTypesAdvData;
  NSMutableDictionary *v15;
  NSMutableDictionary *scannerTypesToScan;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BTVCBonjourLink;
  v9 = -[BTVCBonjourLink init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_dispatch_queue, a4);
    v11 = -[BTVCBonjourService initWithQueue:]([BTVCBonjourService alloc], "initWithQueue:", v8);
    btvcBonjourService = v10->_btvcBonjourService;
    v10->_btvcBonjourService = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    advertiserTypesAdvData = v10->_advertiserTypesAdvData;
    v10->_advertiserTypesAdvData = (NSMutableDictionary *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    scannerTypesToScan = v10->_scannerTypesToScan;
    v10->_scannerTypesToScan = v15;

    v10->_state = 3;
    -[BTVCBonjourLink _listenForBTVCBonjourEvents](v10, "_listenForBTVCBonjourEvents");
  }

  return v10;
}

- (BTVCBonjourLink)init
{
  NSString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("%@ is not a valid initializer for %@"), v4, v7);

  return 0;
}

- (void)invalidate
{
  NSObject *v3;
  BTVCBonjourLinkDelegate *delegate;
  uint8_t v5[16];

  v3 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] Invalidate by client", v5, 2u);
  }
  delegate = self->_delegate;
  self->_delegate = 0;

}

- (void)_listenForBTVCBonjourEvents
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] _listenForBTVCBonjourEvents\n", buf, 2u);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100573BF4;
  v16[3] = &unk_100938238;
  objc_copyWeak(&v17, &location);
  -[BTVCBonjourService setDeviceDidStartScanning:](self->_btvcBonjourService, "setDeviceDidStartScanning:", v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100573D00;
  v14[3] = &unk_100938288;
  objc_copyWeak(&v15, &location);
  -[BTVCBonjourService setDeviceFoundHandler:](self->_btvcBonjourService, "setDeviceFoundHandler:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100573F70;
  v12[3] = &unk_100938288;
  objc_copyWeak(&v13, &location);
  -[BTVCBonjourService setDeviceLostHandler:](self->_btvcBonjourService, "setDeviceLostHandler:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005741B0;
  v10[3] = &unk_1009382D8;
  objc_copyWeak(&v11, &location);
  -[BTVCBonjourService setAdvertisingStateUpdateHandler:](self->_btvcBonjourService, "setAdvertisingStateUpdateHandler:", v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005743DC;
  v8[3] = &unk_100938300;
  objc_copyWeak(&v9, &location);
  -[BTVCBonjourService setDeviceDidConnectHandler:](self->_btvcBonjourService, "setDeviceDidConnectHandler:", v8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10057450C;
  v6[3] = &unk_100938328;
  objc_copyWeak(&v7, &location);
  -[BTVCBonjourService setDeviceDidDisconnectHandler:](self->_btvcBonjourService, "setDeviceDidDisconnectHandler:", v6);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100574618;
  v4[3] = &unk_100938350;
  objc_copyWeak(&v5, &location);
  -[BTVCBonjourService setDeviceDidReceiveDataHandler:](self->_btvcBonjourService, "setDeviceDidReceiveDataHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4
{
  id v6;
  NSObject *v7;
  BTVCBonjourLink *v8;
  NSObject *v9;
  NSMutableDictionary *advertiserTypesAdvData;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BTVCBonjourService *btvcBonjourService;
  _QWORD v16[4];
  id v17[2];
  id location;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;

  v6 = a4;
  v7 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[BTVCBonjourLink startAdvertisingOfType:withData:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  v8 = self;
  objc_sync_enter(v8);
  v9 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v22 = (const char *)a3;
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] startAdvertisingOfType %ld with data %@\n", buf, 0x16u);
  }
  advertiserTypesAdvData = v8->_advertiserTypesAdvData;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](advertiserTypesAdvData, "setObject:forKeyedSubscript:", v6, v11);

  location = 0;
  objc_initWeak(&location, v8);
  v19[0] = CFSTR("BTVCBonjourLinkType");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v19[1] = CFSTR("BTVCBonjourPayloadKey");
  v20[0] = v12;
  v20[1] = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

  v14 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[BTVCBonjourLink startAdvertisingOfType:withData:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] %s _btvcBonjourService startAdvertisingWithData", buf, 0xCu);
  }
  btvcBonjourService = v8->_btvcBonjourService;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100574A30;
  v16[3] = &unk_100938378;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a3;
  -[BTVCBonjourService startAdvertisingWithData:completionHandler:](btvcBonjourService, "startAdvertisingWithData:completionHandler:", v13, v16);
  objc_destroyWeak(v17);

  objc_destroyWeak(&location);
  objc_sync_exit(v8);

}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  NSObject *v5;
  BTVCBonjourLink *v6;
  NSMutableDictionary *advertiserTypesAdvData;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  BTVCBonjourService *btvcBonjourService;
  _QWORD v20[4];
  id v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _BYTE buf[24];

  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BTVCBonjourLink stopAdvertisingOfType:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  advertiserTypesAdvData = v6->_advertiserTypesAdvData;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](advertiserTypesAdvData, "objectForKeyedSubscript:", v8));
  LODWORD(advertiserTypesAdvData) = v9 == 0;

  v10 = qword_100999980;
  v11 = os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)advertiserTypesAdvData)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] No Advertising for type %ld, not stopping anything!\n", buf, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] stopAdvertisingOfType %ld", buf, 0xCu);
    }
    v22[0] = CFSTR("BTVCBonjourLinkType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v22[1] = CFSTR("BTVCBonjourPayloadKey");
    v23[0] = v12;
    v13 = v6->_advertiserTypesAdvData;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14));
    v23[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));

    v17 = v6->_advertiserTypesAdvData;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v18);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v6);
    btvcBonjourService = v6->_btvcBonjourService;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100574E04;
    v20[3] = &unk_100938378;
    objc_copyWeak(v21, (id *)buf);
    v21[1] = (id)a3;
    -[BTVCBonjourService stopAdvertisingForData:completionHandler:](btvcBonjourService, "stopAdvertisingForData:completionHandler:", v16, v20);
    objc_destroyWeak(v21);
    objc_destroyWeak((id *)buf);

  }
  objc_sync_exit(v6);

}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10 useCaseList:(id)a11
{
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  BTVCBonjourLink *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSMutableDictionary *scannerTypesToScan;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;

  v29 = a4;
  v31 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a11;
  v20 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[BTVCBonjourLink startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
  }
  v21 = self;
  objc_sync_enter(v21);
  v22 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] startScanningForType 1\n", buf, 2u);
  }
  v32 = CFSTR("scanMode");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a7, v29));
  v33 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));

  v25 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] startScanningForType _scannerTypesToScan\n", buf, 2u);
  }
  scannerTypesToScan = v21->_scannerTypesToScan;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary setObject:forKey:](scannerTypesToScan, "setObject:forKey:", v24, v27);

  v28 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = (const char *)a3;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] [Discovery] starting for type %ld\n", buf, 0xCu);
  }
  -[BTVCBonjourService startDiscovery](v21->_btvcBonjourService, "startDiscovery");

  objc_sync_exit(v21);
}

- (void)stopScanningForType:(int64_t)a3
{
  BTVCBonjourLink *v4;
  NSObject *v5;
  NSMutableDictionary *scannerTypesToScan;
  void *v7;
  void *v8;
  _BOOL4 v9;
  BTVCBonjourService *btvcBonjourService;
  int v11;
  int64_t v12;

  v4 = self;
  objc_sync_enter(v4);
  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] [Discovery] stopping for type %ld\n", (uint8_t *)&v11, 0xCu);
  }
  scannerTypesToScan = v4->_scannerTypesToScan;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary removeObjectForKey:](scannerTypesToScan, "removeObjectForKey:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4->_scannerTypesToScan, "allKeys"));
  v9 = objc_msgSend(v8, "count") == 0;

  btvcBonjourService = v4->_btvcBonjourService;
  if (v9)
    -[BTVCBonjourService stopDiscovery](btvcBonjourService, "stopDiscovery");
  else
    -[BTVCBonjourService startDiscovery](btvcBonjourService, "startDiscovery");
  objc_sync_exit(v4);

}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v5 = a3;
  v6 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] Connecting to peer %@", (uint8_t *)&v7, 0xCu);
  }
  -[BTVCBonjourService connectToDevice:](self->_btvcBonjourService, "connectToDevice:", v5);

}

- (void)disconnectFromPeer:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] Disconnecting from peer %@", (uint8_t *)&v6, 0xCu);
  }
  -[BTVCBonjourService disconnectFromDevice:](self->_btvcBonjourService, "disconnectFromDevice:", v4);

}

- (void)sendData:(id)a3 toPeer:(id)a4
{
  id v6;
  id v7;
  BTVCBonjourService *btvcBonjourService;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  btvcBonjourService = self->_btvcBonjourService;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10057557C;
  v11[3] = &unk_1009383A0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[BTVCBonjourService sendData:toDevice:completionHandler:](btvcBonjourService, "sendData:toDevice:completionHandler:", v10, v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_dispatch_queue, 0);
  objc_storeStrong((id *)&self->_scannerTypesToScan, 0);
  objc_storeStrong((id *)&self->_advertiserTypesAdvData, 0);
  objc_storeStrong((id *)&self->_btvcBonjourService, 0);
}

@end
