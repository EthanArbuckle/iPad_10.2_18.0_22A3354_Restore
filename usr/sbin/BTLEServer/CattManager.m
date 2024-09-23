@implementation CattManager

+ (id)instance
{
  if (qword_1000C9070 != -1)
    dispatch_once(&qword_1000C9070, &stru_1000AD890);
  return (id)qword_1000C9068;
}

- (void)registerServices
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
    v6 = objc_msgSend(v5, "state");

    if (v6 == (id)5)
    {
      v7 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Register service for CATT", v10, 2u);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager options](self, "options"));
      objc_msgSend(v8, "registerForConnectionEventsWithOptions:", v9);

    }
  }
}

- (void)setOpportunisticConnection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  void *v13;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating connection option for \"%@\" to be opportunistic", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  v10 = CBConnectPeripheralOptionOpportunistic;
  v11 = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  objc_msgSend(v8, "updatePeripheral:options:", v4, v9);

}

- (void)removeOpportunisticConnection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing opportunistic connection option for \"%@\". Setting low connection latency", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  objc_msgSend(v8, "setDesiredConnectionLatency:forPeripheral:", 0, v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  v11 = CBConnectPeripheralOptionOpportunistic;
  v12 = &__kCFBooleanFalse;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  objc_msgSend(v9, "updatePeripheral:options:", v4, v10);

}

- (CattManager)init
{
  CattManager *v2;
  id v3;
  void *v4;
  CBCentralManager *v5;
  CBCentralManager *centralManager;
  NSMutableArray *v7;
  NSMutableArray *cattPeripheral;
  NSMutableArray *v9;
  NSMutableArray *services;
  NSMutableDictionary *v11;
  NSMutableDictionary *clientServiceManagerMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *options;
  NSMutableArray *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v20.receiver = self;
  v20.super_class = (Class)CattManager;
  v2 = -[CattManager init](&v20, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)CBCentralManager);
    v21[0] = CBCentralManagerOptionReceiveSystemEvents;
    v21[1] = CBManagerNeedsRestrictedStateOperation;
    v22[0] = &__kCFBooleanTrue;
    v22[1] = &__kCFBooleanTrue;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
    v5 = (CBCentralManager *)objc_msgSend(v3, "initWithDelegate:queue:options:", v2, &_dispatch_main_q, v4);
    centralManager = v2->_centralManager;
    v2->_centralManager = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cattPeripheral = v2->_cattPeripheral;
    v2->_cattPeripheral = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    services = v2->_services;
    v2->_services = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientServiceManagerMap = v2->_clientServiceManagerMap;
    v2->_clientServiceManagerMap = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    options = v2->_options;
    v2->_options = v13;

    v15 = v2->_services;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDoAPServiceString));
    -[NSMutableArray addObject:](v15, "addObject:", v16);

    v17 = v2->_services;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDUnifiedAccessoryRestoreProtocolServiceString));
    -[NSMutableArray addObject:](v17, "addObject:", v18);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_options, "setObject:forKeyedSubscript:", v2->_services, CBConnectionEventMatchingOptionServiceUUIDs);
  }
  return v2;
}

- (void)connectPeripheral:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  v6 = objc_msgSend(v5, "state");

  if (v6 == (id)5)
  {
    v7 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connecting CATT peripheral \"%@\"...", (uint8_t *)&v11, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
    objc_msgSend(v10, "connectPeripheral:options:", v4, 0);

  }
}

- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  if (objc_msgSend(v7, "state") == (id)5)
  {
    v8 = objc_msgSend(v6, "state");

    if (v8)
    {
      v9 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Disconnecting CATT peripheral \"%@\"...", buf, 0xCu);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4, CBCancelPeripheralConnectionOptionForce));
      v17 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      objc_msgSend(v12, "cancelPeripheralConnection:options:", v6, v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      objc_msgSend(v15, "removeObjectForKey:", v6);

    }
  }
  else
  {

  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManagerStateString](self, "centralManagerStateString"));
    v15 = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CentralManager state is now %@", (uint8_t *)&v15, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  v9 = objc_msgSend(v8, "state");

  if (v9 != (id)5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
    if (objc_msgSend(v10, "state") == (id)4)
    {

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
      v12 = objc_msgSend(v11, "state");

      if (v12 != (id)1)
        goto LABEL_9;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
    objc_msgSend(v13, "removeAllObjects");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    objc_msgSend(v14, "removeAllObjects");

    goto LABEL_9;
  }
  -[CattManager registerServices](self, "registerServices");
LABEL_9:

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ClientServiceManager *v17;
  void *v18;
  int v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v19 = 138412290;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" is now connected", (uint8_t *)&v19, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
  v12 = objc_msgSend(v11, "containsObject:", v7);

  if (v12)
  {
    objc_msgSend(v7, "setDelegate:", self);
    if (objc_msgSend(v7, "hasTag:", CFSTR("FitnessClassic")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "customProperty:", CFSTR("Fitness")));

      if (!v13)
        objc_msgSend(v7, "setCustomProperty:value:", CFSTR("Fitness"), CFSTR("1"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "customProperty:", CFSTR("UpdateHealth")));

      if (!v14)
        objc_msgSend(v7, "setCustomProperty:value:", CFSTR("UpdateHealth"), CFSTR("1"));
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v7));

    if (!v16)
    {
      v17 = -[ClientServiceManager initWithPeripheral:]([ClientServiceManager alloc], "initWithPeripheral:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v7);

    }
  }

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;

  v7 = a4;
  v8 = a5;
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" failed to connect: %@", (uint8_t *)&v13, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
  objc_msgSend(v12, "removeObject:", v7);

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" is now disconnected: %@", (uint8_t *)&v14, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  objc_msgSend(v12, "removeObjectForKey:", v7);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
  objc_msgSend(v13, "removeObject:", v7);

}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int64_t v19;

  v8 = a3;
  v9 = a5;
  v10 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    v16 = 138412546;
    v17 = v12;
    v18 = 2048;
    v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" connection event:%tu", (uint8_t *)&v16, 0x16u);

  }
  if (a4 == 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
    objc_msgSend(v13, "addObject:", v9);

    -[CattManager connectPeripheral:](self, "connectPeripheral:", v9);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    objc_msgSend(v14, "removeObjectForKey:", v9);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
    objc_msgSend(v15, "removeObject:", v9);

  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  objc_msgSend(v9, "peripheral:didModifyServices:", v7, v6);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  objc_msgSend(v9, "peripheral:didDiscoverServices:", v7, v6);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

  objc_msgSend(v12, "peripheral:didDiscoverCharacteristicsForService:error:", v10, v9, v8);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

  objc_msgSend(v12, "peripheral:didUpdateValueForCharacteristic:error:", v10, v9, v8);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

  objc_msgSend(v12, "peripheral:didWriteValueForCharacteristic:error:", v10, v9, v8);
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

  objc_msgSend(v12, "peripheral:didUpdateNotificationStateForCharacteristic:error:", v10, v9, v8);
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

  objc_msgSend(v12, "peripheral:didDiscoverDescriptorsForCharacteristic:error:", v10, v9, v8);
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

  objc_msgSend(v12, "peripheral:didUpdateValueForDescriptor:error:", v10, v9, v8);
}

- (id)centralManagerStateString
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  v3 = (char *)objc_msgSend(v2, "state");

  if ((unint64_t)(v3 - 1) > 9)
    return CFSTR("unknown");
  else
    return *(&off_1000AD8B0 + (_QWORD)(v3 - 1));
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (NSMutableDictionary)clientServiceManagerMap
{
  return self->_clientServiceManagerMap;
}

- (void)setClientServiceManagerMap:(id)a3
{
  objc_storeStrong((id *)&self->_clientServiceManagerMap, a3);
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (NSMutableArray)cattPeripheral
{
  return self->_cattPeripheral;
}

- (void)setCattPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_cattPeripheral, a3);
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_cattPeripheral, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_clientServiceManagerMap, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end
