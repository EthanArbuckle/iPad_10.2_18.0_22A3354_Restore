@implementation NIServerAccessoryGATTServiceManager

- (id)_initInternal
{
  NIServerAccessoryGATTServiceManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  CBCentralManager *v7;
  CBCentralManager *cbManager;
  NSMutableDictionary *v9;
  NSMutableDictionary *listeners;
  NSMutableDictionary *v11;
  NSMutableDictionary *peerDevices;
  void *v13;
  unsigned int v14;
  OS_dispatch_queue *v15;
  _QWORD v17[4];
  NIServerAccessoryGATTServiceManager *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NIServerAccessoryGATTServiceManager;
  v2 = -[NIServerAccessoryGATTServiceManager init](&v19, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.nearbyd.accessory.gatt-service", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (CBCentralManager *)objc_msgSend(objc_alloc((Class)CBCentralManager), "initWithDelegate:queue:", v2, v2->_queue);
    cbManager = v2->_cbManager;
    v2->_cbManager = v7;

    v9 = objc_opt_new(NSMutableDictionary);
    listeners = v2->_listeners;
    v2->_listeners = v9;

    v11 = objc_opt_new(NSMutableDictionary);
    peerDevices = v2->_peerDevices;
    v2->_peerDevices = v11;

    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
          v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("EnableStateDump")),
          v13,
          v14))
    {
      v15 = v2->_queue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10018CB9C;
      v17[3] = &unk_10080A8A0;
      v18 = v2;
      os_state_add_handler(v15, v17);

    }
  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018CC64;
  block[3] = &unk_1007FA668;
  block[4] = a1;
  if (qword_100857870 != -1)
    dispatch_once(&qword_100857870, block);
  return (id)qword_100857868;
}

- (void)addServiceListener:(id)a3 withIdentifier:(id)a4 forBluetoothPeer:(id)a5 withConfiguration:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018CD80;
  block[3] = &unk_10080A8C8;
  block[4] = self;
  v20 = v11;
  v21 = v12;
  v22 = v10;
  v23 = v13;
  v15 = v13;
  v16 = v10;
  v17 = v12;
  v18 = v11;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)probeAuthorizationForServiceListenerWithIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018D25C;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)removeServiceListenerWithIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018DA10;
  v7[3] = &unk_1007FA518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (id)printableState
{
  OS_dispatch_queue *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10018DDE4;
  v10 = sub_10018DDF4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10018DDFC;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  NSMutableDictionary *listeners;
  void *v8;
  void *v9;
  NSMutableDictionary *peerDevices;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  NSMutableArray *v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10018DDE4;
  v19 = sub_10018DDF4;
  v20 = objc_opt_new(NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_autoreleasePoolPush();
  v4 = sub_10000883C();
  v5 = (void *)v16[5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d listeners"), -[NSMutableDictionary count](self->_listeners, "count")));
  objc_msgSend(v5, "addObject:", v6);

  listeners = self->_listeners;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10018E01C;
  v14[3] = &unk_10080A918;
  v14[4] = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](listeners, "enumerateKeysAndObjectsUsingBlock:", v14);
  v8 = (void *)v16[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d peers"), -[NSMutableDictionary count](self->_peerDevices, "count")));
  objc_msgSend(v8, "addObject:", v9);

  peerDevices = self->_peerDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10018E1D4;
  v13[3] = &unk_10080A968;
  v13[4] = &v15;
  *(double *)&v13[5] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerDevices, "enumerateKeysAndObjectsUsingBlock:", v13);
  objc_autoreleasePoolPop(v3);
  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (void)_connectToPeer:(id)a3
{
  id v4;
  char *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CBCentralManager *cbManager;
  void *v26;
  void *v27;
  void **v28;
  uint64_t v29;
  id (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  id v36;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (char *)-[CBCentralManager state](self->_cbManager, "state");
  if ((unint64_t)(v5 - 2) < 3)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D36A4();
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10017, 0));
    -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v4, v9);

  }
  else if ((unint64_t)v5 >= 2)
  {
    if (v5 != (char *)5)
      __assert_rtn("-[NIServerAccessoryGATTServiceManager _connectToPeer:]", "NIServerAccessoryGATTServiceManager.mm", 413, "cbState == CBManagerStatePoweredOn");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v4));
    v11 = objc_msgSend(v10, "connectionState");

    if (v11 == 6)
    {
      v12 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#bt-accessory,ConnectToPeer [%@]: already finished", buf, 0xCu);
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager sharedPairingAgent](self->_cbManager, "sharedPairingAgent"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "retrievePairedPeers"));

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10018EC0C;
      v33[3] = &unk_10080A990;
      v15 = v4;
      v34 = v15;
      if (objc_msgSend(v14, "indexOfObjectPassingTest:", v33) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003D3704();
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0));
        -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v15, v16);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:](self->_cbManager, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1));
        v28 = _NSConcreteStackBlock;
        v29 = 3221225472;
        v30 = sub_10018EC5C;
        v31 = &unk_10080A9B8;
        v17 = v15;
        v32 = v17;
        v18 = objc_msgSend(v16, "indexOfObjectPassingTest:", &v28);
        v19 = qword_10085F520;
        if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003D3764();
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0, v28, v29, v30, v31));
          -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v17, v20);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#bt-accessory,ConnectToPeer [%@]: Paired and connected. Establishing a local connection", buf, 0xCu);
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v18, v28, v29, v30, v31));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v17));
          objc_msgSend(v22, "setPeripheral:", v21);

          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v17));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "peripheral"));
          objc_msgSend(v24, "setDelegate:", self);

          cbManager = self->_cbManager;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v17));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "peripheral"));
          -[CBCentralManager connectPeripheral:options:](cbManager, "connectPeripheral:options:", v27, 0);

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v17));
          objc_msgSend(v20, "changeConnectionState:", 2);
        }

      }
    }
  }
  else
  {
    v6 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#bt-accessory,ConnectToPeer [%@]: wait for CBManager state update", buf, 0xCu);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v4));
    objc_msgSend(v7, "changeConnectionState:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v4));
    objc_msgSend(v8, "cacheCharacteristics");

  }
}

- (void)_peer:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v12 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v12));
  objc_msgSend(v7, "changeConnectionState:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v12));
  objc_msgSend(v8, "cacheCharacteristics");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "listeners"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10018EDF0;
  v13[3] = &unk_10080A9E0;
  v13[4] = self;
  v11 = v6;
  v14 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

- (BOOL)_isListener:(id)a3 backgroundAuthorizedForPeer:(id)a4 useCache:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_listeners, "objectForKeyedSubscript:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));

  v13 = objc_opt_class(v11, v12);
  if (v13 == objc_opt_class(NINearbyAccessoryConfiguration, v14))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryConfigData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
    if (v5)
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cachedConfigCharacteristics"));
    else
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resultConfigCharacteristics"));
    v19 = objc_msgSend(v18, "containsObject:", v16);

    v15 = (v19 & 1) != 0;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_cleanupExcessiveDetachedPeers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  NSMutableArray *v8;
  NSMutableDictionary *peerDevices;
  NSMutableArray *v10;
  NSObject *v11;
  unsigned int v12;
  _QWORD v13[4];
  NSMutableArray *v14;
  uint8_t buf[4];
  unsigned int v16;
  __int16 v17;
  unsigned int v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("NIAccessoryMaxDetachedPeersOverride")));

  if (v4 && (v6 = objc_opt_class(NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
    v7 = objc_msgSend(v4, "unsignedIntValue");
  else
    v7 = 2;
  v8 = objc_opt_new(NSMutableArray);
  peerDevices = self->_peerDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10018F2A0;
  v13[3] = &unk_10080AA08;
  v10 = v8;
  v14 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerDevices, "enumerateKeysAndObjectsUsingBlock:", v13);
  if ((unint64_t)-[NSMutableArray count](v10, "count") > v7)
  {
    v11 = (id)qword_10085F520;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[NSMutableArray count](v10, "count");
      *(_DWORD *)buf = 67109376;
      v16 = v12;
      v17 = 1024;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#bt-accessory,Cleaning up detached peers. %d found, exceeds max of %d", buf, 0xEu);
    }

    -[NSMutableDictionary removeObjectsForKeys:](self->_peerDevices, "removeObjectsForKeys:", v10);
  }

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  const char *v7;
  NSMutableDictionary *peerDevices;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (unint64_t)objc_msgSend(v4, "state");
    if (v6 > 0xA)
      v7 = "?";
    else
      v7 = off_10080AAC0[v6];
    *(_DWORD *)buf = 136315138;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#bt-accessory,centralManagerDidUpdateState: %s", buf, 0xCu);
  }

  peerDevices = self->_peerDevices;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10018F478;
  v9[3] = &unk_10080AA08;
  v9[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerDevices, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v6));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peripheral"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v6));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peripheral"));

      if (v11 == v5)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v6));
        v13 = objc_msgSend(v12, "connectionState");

        v14 = qword_10085F520;
        if (v13 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#bt-accessory,centralManager:didConnectPeripheral [%@]: Success", buf, 0xCu);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("48fe3e40-0817-4bb2-8633-3073689c2dba")));
          v18 = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
          objc_msgSend(v5, "discoverServices:", v16);

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v6));
          objc_msgSend(v17, "changeConnectionState:", 3);

        }
        else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          sub_1003D3824();
        }
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D37C4();
LABEL_11:

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peripheral"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peripheral"));

      if (v14 == v7)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
        v16 = objc_msgSend(v15, "connectionState");

        v17 = qword_10085F520;
        if (v16 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            v19 = 138412546;
            v20 = v9;
            v21 = 2112;
            v22 = v8;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#bt-accessory,centralManager:didFailToConnectPeripheral [%@]: Error: %@", (uint8_t *)&v19, 0x16u);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0));
          -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v9, v18);

        }
        else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          sub_1003D38E4();
        }
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D3884();
LABEL_11:

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peripheral"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v9));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peripheral"));

      if (v14 == v7)
      {
        v15 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 138412546;
          v18 = v9;
          v19 = 2112;
          v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#bt-accessory,centralManager:didDisconnectPeripheral [%@]: Error: %@", (uint8_t *)&v17, 0x16u);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0));
        -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v9, v16);

        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D3944();
LABEL_10:

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
  if (!v9)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D39A4();
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peripheral"));
  if (!v11)
  {

    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peripheral"));

  if (v13 != v6)
    goto LABEL_10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
  v15 = objc_msgSend(v14, "connectionState");

  if (v15 == 3)
  {
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D3A64();
LABEL_8:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0));
      -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v8, v16);

      goto LABEL_12;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "services"));
    v18 = objc_msgSend(v17, "indexOfObjectPassingTest:", &stru_10080AA48);

    v19 = qword_10085F520;
    if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D3A04();
      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didDiscoverServices [%@]: Success", buf, 0xCu);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("95e8d9d5-d8ef-4721-9a4e-807375f53328")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("1176cf7b-bed2-4690-bd69-5f34001e820c"), v20));
    v26[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "services"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v18));
    objc_msgSend(v6, "discoverCharacteristics:forService:", v22, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v8));
    objc_msgSend(v25, "changeConnectionState:", 4);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003D3AC4();
  }
LABEL_12:

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  unsigned int v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  unsigned int v36;
  const char *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  NIServerAccessoryGATTServiceManager *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  NIServerAccessoryGATTServiceManager *v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  unsigned int v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  const char *v56;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peripheral"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peripheral"));

      if (v16 == v8)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
        v18 = objc_msgSend(v17, "connectionState");

        if (v18 == 4)
        {
          if (v10)
          {
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
              sub_1003D3BE4();
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0));
            -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v11, v19);

          }
          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("48fe3e40-0817-4bb2-8633-3073689c2dba")));
            if ((objc_msgSend(v20, "isEqual:", v21) & 1) == 0)
              __assert_rtn("-[NIServerAccessoryGATTServiceManager peripheral:didDiscoverCharacteristicsForService:error:]", "NIServerAccessoryGATTServiceManager.mm", 662, "[service.UUID isEqual:[CBUUID UUIDWithString:kNearbyInteractionServiceUUID]]");

            v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
            objc_msgSend(v22, "setNumCharacteristicsLeftToRead:", 0);

            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
            objc_msgSend(v23, "setReadingMultiConfigCharacteristics:", 0);

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "characteristics"));
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_100190788;
            v45[3] = &unk_10080AA70;
            v25 = v8;
            v46 = v25;
            v47 = self;
            v26 = v11;
            v48 = v26;
            objc_msgSend(v24, "enumerateObjectsUsingBlock:", v45);

            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v26));
            v28 = objc_msgSend(v27, "readingMultiConfigCharacteristics");

            if ((v28 & 1) == 0)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "characteristics"));
              v41[0] = _NSConcreteStackBlock;
              v41[1] = 3221225472;
              v41[2] = sub_10019088C;
              v41[3] = &unk_10080AA70;
              v42 = v25;
              v43 = self;
              v44 = v26;
              objc_msgSend(v29, "enumerateObjectsUsingBlock:", v41);

            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v26));
            v31 = objc_msgSend(v30, "numCharacteristicsLeftToRead");

            if (v31)
            {
              v32 = (id)qword_10085F520;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "characteristics"));
                v39 = objc_msgSend(v40, "count");
                v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v26));
                v34 = objc_msgSend(v33, "numCharacteristicsLeftToRead");
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v26));
                v36 = objc_msgSend(v35, "readingMultiConfigCharacteristics");
                v37 = "single-config";
                *(_DWORD *)buf = 138413058;
                v50 = v26;
                v51 = 1024;
                if (v36)
                  v37 = "multi-config";
                v52 = v39;
                v53 = 1024;
                v54 = v34;
                v55 = 2080;
                v56 = v37;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: %d total characteristics discovered, and triggered reads on %d %s characteristics", buf, 0x22u);

              }
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v26));
              objc_msgSend(v38, "changeConnectionState:", 5);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                sub_1003D3B84();
              v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0));
              -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v26, v38);
            }

          }
        }
        else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          sub_1003D3C44();
        }
        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D3B24();
LABEL_12:

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  int v38;
  unsigned int v39;
  NSObject *v40;
  __int128 v41;
  unsigned __int8 v42;
  int v43;
  uint64_t v44;
  int v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  NSMutableSet *v50;
  int v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  unsigned int v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  __int128 v70;
  unsigned int v71;
  NSMutableSet *v72;
  int v73;
  unsigned int v74;
  _QWORD v75[5];
  id v76;
  void *__p;
  _BYTE *v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  unsigned int v84;
  __int16 v85;
  unsigned int v86;
  __int16 v87;
  unsigned int v88;
  __int16 v89;
  int v90;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  if (!v12)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D3CA4();
    goto LABEL_12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peripheral"));
  if (!v14)
  {

    goto LABEL_10;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peripheral"));

  if (v16 != v8)
    goto LABEL_10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  v18 = objc_msgSend(v17, "connectionState");

  if (v18 != 5)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D3E24();
    goto LABEL_12;
  }
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D3DC4();
LABEL_8:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0));
    -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v11, v19);

    goto LABEL_12;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
  objc_msgSend(v20, "setNumCharacteristicsLeftToRead:", objc_msgSend(v20, "numCharacteristicsLeftToRead") - 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("1176cf7b-bed2-4690-bd69-5f34001e820c")));
  v23 = objc_msgSend(v21, "isEqual:", v22);

  if (!v23)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("95e8d9d5-d8ef-4721-9a4e-807375f53328")));
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "resultConfigCharacteristics"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
      objc_msgSend(v30, "addObject:", v31);

      v32 = (id)qword_10085F520;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "resultConfigCharacteristics"));
        v35 = objc_msgSend(v34, "count");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
        *(_DWORD *)buf = 138412802;
        v80 = v11;
        v81 = 1024;
        v82 = v35;
        v83 = 1024;
        v84 = objc_msgSend(v36, "numCharacteristicsLeftToRead");
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Read %d single-config characteristics, %d left to go", buf, 0x18u);

      }
    }
    goto LABEL_58;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
  v25 = objc_msgSend(v24, "length");

  if (v25 >= 65282)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D3D04();
    goto LABEL_8;
  }
  buf[0] = 0;
  sub_100191910(&__p, v25, buf);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
  v73 = v25;
  objc_msgSend(v37, "getBytes:length:", __p, v78 - (_BYTE *)__p);

  v38 = v25;
  if (v25 > 0)
  {
    v39 = *(unsigned __int8 *)__p;
    v40 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v80 = v11;
      v81 = 1024;
      v82 = 1;
      v83 = 1024;
      v84 = v38;
      v85 = 1024;
      v86 = v39;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Read config count (%d)", buf, 0x1Eu);
    }
    v72 = objc_opt_new(NSMutableSet);
    if (v39)
    {
      v71 = v39;
      v42 = v39 - 1;
      v43 = 1;
      *(_QWORD *)&v41 = 138413570;
      v70 = v41;
      while (v43 < v38)
      {
        v44 = v43 + 1;
        v45 = *((unsigned __int8 *)__p + v43);
        if (*((_BYTE *)__p + v43))
        {
          if (v43 + v45 >= v38)
          {
            v62 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v70;
              v80 = v11;
              v81 = 1024;
              v82 = v43 + 1;
              v83 = 1024;
              v84 = v73;
              v85 = 1024;
              v86 = v71 - v42;
              v87 = 1024;
              v88 = v71;
              v89 = 1024;
              v90 = v45;
              _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Config %d of %d: Could not read data (len: %d)", buf, 0x2Au);
            }
            goto LABEL_53;
          }
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)__p + v44, *((unsigned __int8 *)__p + v43)));
          -[NSMutableSet addObject:](v72, "addObject:", v46);

          LODWORD(v44) = v44 + v45;
          v47 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v70;
            v80 = v11;
            v81 = 1024;
            v82 = v44;
            v83 = 1024;
            v84 = v73;
            v85 = 1024;
            v86 = v71 - v42;
            v87 = 1024;
            v88 = v71;
            v89 = 1024;
            v90 = v45;
            v48 = v47;
            v38 = v73;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Config %d of %d: Read data (len: %d)", buf, 0x2Au);
          }
          else
          {
            v38 = v73;
          }
        }
        v43 = v44;
        if (!v42--)
          goto LABEL_41;
      }
      v61 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413314;
        v80 = v11;
        v81 = 1024;
        v82 = v43;
        v83 = 1024;
        v84 = v73;
        v85 = 1024;
        v86 = v71 - v42;
        v87 = 1024;
        v88 = v71;
        _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Config %d of %d: Could not read length", buf, 0x24u);
      }
    }
    else
    {
      LODWORD(v44) = 1;
LABEL_41:
      if ((int)v44 >= v38)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "resultConfigCharacteristics"));
        objc_msgSend(v54, "unionSet:", v72);

        v55 = (id)qword_10085F520;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v74 = -[NSMutableSet count](v72, "count");
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "resultConfigCharacteristics"));
          v58 = objc_msgSend(v57, "count");
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
          v60 = objc_msgSend(v59, "numCharacteristicsLeftToRead");
          *(_DWORD *)buf = 138413058;
          v80 = v11;
          v81 = 1024;
          v82 = v74;
          v83 = 1024;
          v84 = v58;
          v85 = 1024;
          v86 = v60;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Read %d unique configs from this multi-config characteristic. %d unique configs so far. %d characteristics left to read", buf, 0x1Eu);

        }
        v51 = 0;
        goto LABEL_54;
      }
      v52 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v80 = v11;
        v81 = 1024;
        v82 = v44;
        v83 = 1024;
        v84 = v73;
        _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Did not consume all bytes", buf, 0x18u);
      }
    }
LABEL_53:
    v55 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0, v70));
    -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v11, v55);
    v51 = 1;
LABEL_54:

    v50 = v72;
    goto LABEL_55;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D3D64();
  v50 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5882, 0));
  -[NIServerAccessoryGATTServiceManager _peer:didFailWithError:](self, "_peer:didFailWithError:", v11, v50);
  v51 = 1;
LABEL_55:

  if (__p)
  {
    v78 = __p;
    operator delete(__p);
  }
  if (!v51)
  {
LABEL_58:
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11, v70));
    v64 = objc_msgSend(v63, "numCharacteristicsLeftToRead") == 0;

    if (v64)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
      objc_msgSend(v65, "changeConnectionState:", 6);

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "cachedConfigCharacteristics"));
      objc_msgSend(v67, "removeAllObjects");

      v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "listeners"));
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_10019163C;
      v75[3] = &unk_10080A9E0;
      v75[4] = self;
      v76 = v11;
      objc_msgSend(v69, "enumerateObjectsUsingBlock:", v75);

    }
  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerDevices, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_cbManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
