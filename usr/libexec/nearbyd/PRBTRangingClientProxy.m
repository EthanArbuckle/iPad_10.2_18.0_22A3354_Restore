@implementation PRBTRangingClientProxy

- (PRBTRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PRBTRangingClientProxy *v10;
  PRBTRangingClientProxy *v11;
  PRRemoteDevice *beacon;
  PRNSXPCConnection *v13;
  PRBTRangingClientProtocol *connWrapper;
  NSObject *v15;
  CLFindMyAccessoryManager *v16;
  CLFindMyAccessoryManager *accessoryManager;
  NSObject *v18;
  void *v20;
  void *v21;
  uint8_t buf[16];
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTRangingClientProxy.mm"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v9)
      goto LABEL_3;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTRangingClientProxy.mm"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)PRBTRangingClientProxy;
  v10 = -[PRBTRangingClientProxy init](&v23, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a4);
    beacon = v11->_beacon;
    v11->_beacon = 0;

    v11->_cleaningUponDidFail = 0;
    *(_WORD *)&v11->_utFinding = 1;
    v11->_ranging = 0;
    v11->_currentTask = 0;
    v13 = -[PRNSXPCConnection initWithConnection:]([PRNSXPCConnection alloc], "initWithConnection:", v7);
    connWrapper = v11->_connWrapper;
    v11->_connWrapper = (PRBTRangingClientProtocol *)v13;

    v15 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#btranging-retry _accessoryManager initWithDelegate", buf, 2u);
    }
    v16 = (CLFindMyAccessoryManager *)objc_msgSend(objc_alloc((Class)CLFindMyAccessoryManager), "initWithDelegate:delegateQueue:", v11, v11->_queue);
    accessoryManager = v11->_accessoryManager;
    v11->_accessoryManager = v16;

  }
  v18 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PRBTRangingClientProxy init", buf, 2u);
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRBTRangingClientProxy dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRBTRangingClientProxy;
  -[PRBTRangingClientProxy dealloc](&v4, "dealloc");
}

- (void)activate
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PRBTRangingClientProxy activate", v3, 2u);
  }
}

- (void)terminate
{
  NSObject *v3;
  PRRemoteDevice *beacon;
  OS_voucher *voucher;
  int v6;
  PRRemoteDevice *v7;

  if (self->_beacon)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      beacon = self->_beacon;
      v6 = 138412290;
      v7 = beacon;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down BT ranging session. Beacon: %@", (uint8_t *)&v6, 0xCu);
    }
    -[PRBTRangingClientProxy deinitCompanion](self, "deinitCompanion");
  }
  -[PRBTRangingClientProtocol invalidate](self->_connWrapper, "invalidate");
  voucher = self->_clientVoucher.voucher;
  self->_clientVoucher.voucher = 0;

}

- (void)handleError:(id)a3
{
  id v4;
  PRBTRangingClientProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 0);
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003F75C;
  v7[3] = &unk_1007FAFB0;
  v6 = v4;
  v8 = v6;
  -[PRBTRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)didFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry didFailWithError: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F91C;
  v8[3] = &unk_1007FA330;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)deinitCompanion
{
  NSObject *v3;
  void *v4;
  id v5;
  CLFindMyAccessoryManager *accessoryManager;
  void *v7;
  int v8;
  id v9;

  if (!self->_utFinding && self->_currentTask == 7)
  {
    v3 = (id)qword_10085F520;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID"));
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString")));
      v8 = 136315138;
      v9 = objc_msgSend(v5, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#btranging-retry command stopAggressiveAdvertising on device %s", (uint8_t *)&v8, 0xCu);

    }
    accessoryManager = self->_accessoryManager;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID"));
    -[CLFindMyAccessoryManager stopAggressiveAdvertisingOnDevice:](accessoryManager, "stopAggressiveAdvertisingOnDevice:", v7);

  }
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  CLFindMyAccessoryManager *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  OS_dispatch_queue *queue;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v8 = (CLFindMyAccessoryManager *)a3;
  v9 = a4;
  v10 = a5;
  if (!v10
    || self->_accessoryManager == v8
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID")),
        v12 = objc_msgSend(v10, "isEqual:", v11),
        v11,
        (v12 & 1) != 0))
  {
    v13 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v10;
      v26 = 2112;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#btranging-retry _accessoryManager didFailWithError for %@ with error:%@", buf, 0x16u);
    }
    v22 = NSLocalizedDescriptionKey;
    v23 = CFSTR("Generic companion ranging error.");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v15 = PRErrorWithCodeAndUserInfo(301, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBC38();
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003FD18;
    v19[3] = &unk_1007FA330;
    objc_copyWeak(&v21, (id *)buf);
    v20 = v16;
    v18 = v16;
    dispatch_async((dispatch_queue_t)queue, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

}

- (void)findMyAccessoryManager:(id)a3 didConnectDevice:(id)a4 error:(id)a5
{
  CLFindMyAccessoryManager *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  OS_dispatch_queue *queue;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v8 = (CLFindMyAccessoryManager *)a3;
  v9 = a4;
  v10 = a5;
  v11 = (id)qword_10085F520;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString")));
    *(_DWORD *)buf = 136315394;
    v21 = objc_msgSend(v12, "UTF8String");
    v22 = 2112;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#btranging-retry _accessoryManager didConnectDevice %s with #error:%@", buf, 0x16u);

  }
  if (!v9
    || self->_accessoryManager == v8
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID")),
        v14 = objc_msgSend(v9, "isEqual:", v13),
        v13,
        (v14 & 1) != 0))
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003FFB4;
    block[3] = &unk_1007FB000;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v9;
    v18 = v10;
    dispatch_async((dispatch_queue_t)queue, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4
{
  CLFindMyAccessoryManager *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  id v11;
  OS_dispatch_queue *queue;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v6 = (CLFindMyAccessoryManager *)a3;
  v7 = a4;
  if (!v7
    || self->_accessoryManager == v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID")),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        (v9 & 1) != 0))
  {
    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString")));
      *(_DWORD *)buf = 136315138;
      v17 = objc_msgSend(v11, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#btranging-retry _accessoryManager didDisconnect device %s", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000407F0;
    v13[3] = &unk_1007FA330;
    objc_copyWeak(&v15, (id *)buf);
    v14 = v7;
    dispatch_async((dispatch_queue_t)queue, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }

}

- (void)findMyAccessoryManager:(id)a3 didFetchTxPower:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
  CLFindMyAccessoryManager *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  OS_dispatch_queue *queue;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v10 = (CLFindMyAccessoryManager *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12
    || self->_accessoryManager == v10
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID")),
        v15 = objc_msgSend(v12, "isEqual:", v14),
        v14,
        (v15 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100040B70;
    block[3] = &unk_1007FB050;
    objc_copyWeak(&v21, &location);
    v18 = v12;
    v19 = v11;
    v20 = v13;
    dispatch_async((dispatch_queue_t)queue, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

- (void)findMyAccessoryManager:(id)a3 didStartUnauthorizedAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5
{
  CLFindMyAccessoryManager *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  OS_dispatch_queue *queue;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = (CLFindMyAccessoryManager *)a3;
  v9 = a4;
  v10 = a5;
  if (!v9
    || self->_accessoryManager == v8
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID")),
        v12 = objc_msgSend(v9, "isEqual:", v11),
        v11,
        (v12 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000410B8;
    v14[3] = &unk_1007FB000;
    objc_copyWeak(&v17, &location);
    v15 = v9;
    v16 = v10;
    dispatch_async((dispatch_queue_t)queue, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)findMyAccessoryManager:(id)a3 didStartAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5
{
  CLFindMyAccessoryManager *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  OS_dispatch_queue *queue;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = (CLFindMyAccessoryManager *)a3;
  v9 = a4;
  v10 = a5;
  if (!v9
    || self->_accessoryManager == v8
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID")),
        v12 = objc_msgSend(v9, "isEqual:", v11),
        v11,
        (v12 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100041530;
    v14[3] = &unk_1007FB000;
    objc_copyWeak(&v17, &location);
    v15 = v9;
    v16 = v10;
    dispatch_async((dispatch_queue_t)queue, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)findMyAccessoryManager:(id)a3 didStopAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5
{
  CLFindMyAccessoryManager *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  OS_dispatch_queue *queue;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = (CLFindMyAccessoryManager *)a3;
  v9 = a4;
  v10 = a5;
  if (!v9
    || self->_accessoryManager == v8
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID")),
        v12 = objc_msgSend(v9, "isEqual:", v11),
        v11,
        (v12 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100041BA4;
    v14[3] = &unk_1007FB000;
    objc_copyWeak(&v17, &location);
    v15 = v9;
    v16 = v10;
    dispatch_async((dispatch_queue_t)queue, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)findMyAccessoryManager:(id)a3 didCompleteAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5
{
  CLFindMyAccessoryManager *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  OS_dispatch_queue *queue;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = (CLFindMyAccessoryManager *)a3;
  v9 = a4;
  v10 = a5;
  if (!v9
    || self->_accessoryManager == v8
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID")),
        v12 = objc_msgSend(v9, "isEqual:", v11),
        v11,
        (v12 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100041F9C;
    v14[3] = &unk_1007FB000;
    objc_copyWeak(&v17, &location);
    v15 = v9;
    v16 = v10;
    dispatch_async((dispatch_queue_t)queue, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)findMyAccessoryManager:(id)a3 didObserveAdvertisementWithDate:(id)a4 address:(id)a5 advertisementData:(id)a6 status:(unsigned __int8)a7 rssi:(int64_t)a8 reserved:(id)a9 uuid:(id)a10 ownershipType:(unint64_t)a11 channel:(unint64_t)a12
{
  CLFindMyAccessoryManager *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  NSObject *v25;
  id v26;
  id v27;
  PRBTRangingClientProtocol *connWrapper;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;

  v17 = (CLFindMyAccessoryManager *)a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  v22 = a10;
  if (v22)
  {
    if (self->_accessoryManager == v17)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_beacon, "UUID"));
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if ((v24 & 1) != 0)
      {
        v25 = (id)qword_10085F520;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString")));
          *(_DWORD *)buf = 136315650;
          v33 = objc_msgSend(v26, "UTF8String");
          v34 = 1024;
          v35 = a8;
          v36 = 1024;
          v37 = a12;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#btranging-retry didObserveAdvertisementWithDate for %s with rssi:%d channel:%d", buf, 0x18u);

        }
        v27 = objc_msgSend(objc_alloc((Class)PRBTRSSI), "initWithTimeStamp:rssi_dbm:channel:", a8, a12, sub_10000883C());
        connWrapper = self->_connWrapper;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000424B8;
        v30[3] = &unk_1007FAFB0;
        v31 = v27;
        v29 = v27;
        -[PRBTRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v30);

      }
    }
  }

}

- (void)informDelegateOwnerRangeStoppedonDevice:(id)a3
{
  id v4;
  PRBTRangingClientProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000425D8;
  v7[3] = &unk_1007FAFB0;
  v8 = v4;
  v6 = v4;
  -[PRBTRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)connectWithClientInfo:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  unsigned int v12;

  v5 = a3;
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", PRProcessNameKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", PRProcessIdentifierKey));
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = objc_msgSend(v8, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRBTRanging: XPC connection created. Process name: %@, pid: %d", (uint8_t *)&v9, 0x12u);

  }
  objc_storeStrong((id *)&self->_clientInfo, a3);
  -[PRBTRangingClientProxy activate](self, "activate");

}

- (void)fetchTxPower:(id)a3 isUT:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  OS_dispatch_queue *queue;
  id v12;
  uint64_t v13;
  OS_voucher *v14;
  OS_voucher *voucher;
  _QWORD block[4];
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  self->_utFinding = objc_msgSend(v9, "BOOLValue");
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 1);
  -[PRBTRangingClientProxy setUUID:](self, "setUUID:", v8);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042944;
  block[3] = &unk_1007FA330;
  objc_copyWeak(&v18, &location);
  v12 = v8;
  v17 = v12;
  dispatch_async((dispatch_queue_t)queue, block);
  v14 = (OS_voucher *)voucher_copy(v13);
  voucher = self->_clientVoucher.voucher;
  self->_clientVoucher.voucher = v14;

  v10[2](v10, 1, 0);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)startUTRanging:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  OS_dispatch_queue *queue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 2);
  self->_ranging = 1;
  -[PRBTRangingClientProxy setUUID:](self, "setUUID:", v6);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042BB8;
  block[3] = &unk_1007FA330;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  dispatch_async((dispatch_queue_t)queue, block);
  v7[2](v7, 1, 0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)stopUTRanging:(id)a3 reply:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  OS_dispatch_queue *queue;
  _QWORD v7[4];
  id v8;
  id location;

  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 0);
  self->_ranging = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042E1C;
  v7[3] = &unk_1007FA078;
  objc_copyWeak(&v8, &location);
  dispatch_async((dispatch_queue_t)queue, v7);
  v5[2](v5, 1, 0);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)startOwnerRanging:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  OS_dispatch_queue *queue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 5);
  self->_ranging = 1;
  self->_utFinding = 0;
  -[PRBTRangingClientProxy setUUID:](self, "setUUID:", v6);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042FFC;
  block[3] = &unk_1007FA330;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  dispatch_async((dispatch_queue_t)queue, block);
  v7[2](v7, 1, 0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)stopOwnerRanging:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  OS_dispatch_queue *queue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 8);
  self->_ranging = 0;
  self->_utFinding = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004329C;
  block[3] = &unk_1007FA330;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  dispatch_async((dispatch_queue_t)queue, block);
  v7[2](v7, 1, 0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)setCurrentTask:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  id v6;
  int v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PRBTRangingClientProxy convertToString:](self, "convertToString:", v3)));
    v7 = 136315138;
    v8 = objc_msgSend(v6, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry setting current task: %s", (uint8_t *)&v7, 0xCu);

  }
  self->_currentTask = v3;
}

- (void)setUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  PRRemoteDevice *v7;
  PRRemoteDevice *beacon;
  int v9;
  id v10;

  v4 = a3;
  if (!self->_beacon)
  {
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString")));
      v9 = 136315138;
      v10 = objc_msgSend(v6, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry setting beacon to: %s", (uint8_t *)&v9, 0xCu);

    }
    v7 = (PRRemoteDevice *)objc_msgSend(objc_alloc((Class)PRRemoteDevice), "initWithBeaconUUID:", v4);
    beacon = self->_beacon;
    self->_beacon = v7;

  }
}

- (id)convertToString:(int)a3
{
  if (a3 > 8)
    return 0;
  else
    return (id)*((_QWORD *)&off_1007FB150 + a3);
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (PRRemoteDevice)beacon
{
  return (PRRemoteDevice *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBeacon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beacon, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);

  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_startOptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connWrapper, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
