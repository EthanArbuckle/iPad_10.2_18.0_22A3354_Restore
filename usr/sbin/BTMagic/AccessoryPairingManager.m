@implementation AccessoryPairingManager

- (AccessoryPairingManager)init
{
  AccessoryPairingManager *v2;
  id v3;
  void *v4;
  CBCentralManager *v5;
  CBCentralManager *centralManager;
  NSMutableArray *v7;
  NSMutableArray *accessoryQueue;
  id v9;
  objc_super v11;
  uint64_t v12;
  void *v13;

  v11.receiver = self;
  v11.super_class = (Class)AccessoryPairingManager;
  v2 = -[AccessoryPairingManager init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)CBCentralManager);
    v12 = CBManagerNeedsRestrictedStateOperation;
    v13 = &__kCFBooleanTrue;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v5 = (CBCentralManager *)objc_msgSend(v3, "initWithDelegate:queue:options:", v2, 0, v4);
    centralManager = v2->_centralManager;
    v2->_centralManager = v5;

    v2->_previousCentralManagerState = (int64_t)-[CBCentralManager state](v2->_centralManager, "state");
    v7 = objc_opt_new(NSMutableArray);
    accessoryQueue = v2->_accessoryQueue;
    v2->_accessoryQueue = v7;

    -[AccessoryPairingManager takePersistenceAssertion](v2, "takePersistenceAssertion");
    v9 = +[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CPDistributedNotificationCenter centerNamed:](CPDistributedNotificationCenter, "centerNamed:", IAP2GeneralDistributedNotificationServerName));
  objc_msgSend(v3, "stopDeliveringNotifications");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)AccessoryPairingManager;
  -[AccessoryPairingManager dealloc](&v5, "dealloc");
}

- (void)takePersistenceAssertion
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager persistenceAssertion](self, "persistenceAssertion"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, objc_opt_class(self));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    v8 = qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
      sub_10000908C((uint64_t)v7, v8);
    v9 = objc_retainAutorelease(v7);
    v10 = (void *)os_transaction_create(objc_msgSend(v9, "UTF8String"));
    -[AccessoryPairingManager setPersistenceAssertion:](self, "setPersistenceAssertion:", v10);

  }
}

- (void)releasePersistenceAssertion
{
  NSObject *v3;

  v3 = qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
    sub_100009100(v3);
  xpc_transaction_exit_clean(-[AccessoryPairingManager setPersistenceAssertion:](self, "setPersistenceAssertion:", 0));
}

- (void)processAccessoryQueue
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager centralManager](self, "centralManager"));
  v4 = (uint64_t)objc_msgSend(v3, "state");

  if (v4 > 3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager accessoryQueue](self, "accessoryQueue"));
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));

      if (v15)
      {
        v16 = (void *)qword_100015A68;
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));
          v27 = 138412290;
          v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Already processing accessory \"%@\", (uint8_t *)&v27, 0xCu);

        }
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager accessoryQueue](self, "accessoryQueue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
        -[AccessoryPairingManager setCurrentAccessory:](self, "setCurrentAccessory:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager accessoryQueue](self, "accessoryQueue"));
        objc_msgSend(v22, "removeObjectAtIndex:", 0);

        v23 = (void *)qword_100015A68;
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));
          v27 = 138412290;
          v28 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Processing accessory \"%@\", (uint8_t *)&v27, 0xCu);

        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));
        objc_msgSend(v26, "startPairing");

      }
    }
    else
    {
      v19 = qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No accessories left to process", (uint8_t *)&v27, 2u);
      }
      -[AccessoryPairingManager releasePersistenceAssertion](self, "releasePersistenceAssertion");
    }
  }
  else
  {
    v5 = qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_10000913C(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)enqueueDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _BYTE *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  AccessoryPairingWizard *v22;
  NSObject *v23;
  void *v24;
  AccessoryPairingManager *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", IAPAppBTPairingConnectionIDKey));
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", IAPAppBTPairingTypesSupportedKey)));
  v8 = objc_msgSend(v7, "bytes");
  if (!objc_msgSend(v7, "length"))
    goto LABEL_13;
  v25 = self;
  v26 = v4;
  v9 = 0;
  v10 = 2;
  do
  {
    if (v8[v9] == 1)
    {
      v15 = (void *)qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = sub_1000045C4(1);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        *(_DWORD *)buf = 134218242;
        v28 = v6;
        v29 = 2112;
        v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Connected accessory 0x%llx supports %@ pairing", buf, 0x16u);

      }
    }
    else if (v8[v9])
    {
      v19 = qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v8[v9];
        *(_DWORD *)buf = 134218240;
        v28 = v6;
        v29 = 1024;
        LODWORD(v30) = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Connected accessory 0x%llx supports unknown pairing type %x", buf, 0x12u);
      }
    }
    else
    {
      v11 = (void *)qword_100015A68;
      v10 = 0;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = sub_1000045C4(0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_DWORD *)buf = 134218242;
        v28 = v6;
        v29 = 2112;
        v30 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connected accessory 0x%llx supports %@ pairing", buf, 0x16u);

        v10 = 0;
      }
    }
    ++v9;
  }
  while (v9 < (unint64_t)objc_msgSend(v7, "length", v25, v26));
  v4 = v26;
  if ((_DWORD)v10 != 2)
  {
    v22 = -[AccessoryPairingWizard initWithAccessoryInfo:pairingMethod:delegate:]([AccessoryPairingWizard alloc], "initWithAccessoryInfo:pairingMethod:delegate:", v26, v10, v25);
    v23 = qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Queueing newly connected accessory 0x%llx for pairing", buf, 0xCu);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager accessoryQueue](v25, "accessoryQueue"));
    objc_msgSend(v24, "addObject:", v22);

  }
  else
  {
LABEL_13:
    v21 = qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Ignoring connected accessory 0x%llx as it doesn't implement any supported pairing methods", buf, 0xCu);
    }
  }

}

- (void)dequeueDevice:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", IAPAppBTPairingConnectionIDKey));
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));
  v7 = objc_msgSend(v6, "connectionID");

  if (v7 == v5)
  {
    v8 = qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dequeing accessory 0x%llx in the middle of pairing", buf, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));
    objc_msgSend(v9, "failPairing");
LABEL_11:

    return;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager accessoryQueue](self, "accessoryQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100003C10;
  v14[3] = &unk_100010500;
  v14[4] = v5;
  v11 = objc_msgSend(v10, "indexOfObjectPassingTest:", v14);

  v12 = qword_100015A68;
  v13 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT);
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13)
    {
      *(_DWORD *)buf = 134217984;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dequeueing disconnected accessory 0x%llx", buf, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager accessoryQueue](self, "accessoryQueue"));
    objc_msgSend(v9, "removeObjectAtIndex:", v11);
    goto LABEL_11;
  }
  if (v13)
  {
    *(_DWORD *)buf = 134217984;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received accessory disconnection event for unqueued accessory 0x%llx", buf, 0xCu);
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v4 = a3;
  v5 = (unint64_t)objc_msgSend(v4, "state");
  if (v5 <= 0xA)
  {
    if (((1 << v5) & 0x430) != 0)
    {
      if (-[AccessoryPairingManager previousCentralManagerState](self, "previousCentralManagerState") <= 3)
      {
        v6 = qword_100015A68;
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ready to process connected accessories", v19, 2u);
        }
        -[AccessoryPairingManager processConnectedAccessories](self, "processConnectedAccessories");
      }
    }
    else if (v5 == 1)
    {
      v7 = qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_1000091F8(v7, v8, v9, v10, v11, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));

      if (v15)
      {
        v16 = (void *)qword_100015A68;
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
          sub_10000916C(v16, self);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));
        objc_msgSend(v17, "failPairing");

      }
    }
    else if (((1 << v5) & 0xC) != 0)
    {
      v18 = (void *)qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_100009228(v18, v4);
      exit(0);
    }
  }
  -[AccessoryPairingManager setPreviousCentralManagerState:](self, "setPreviousCentralManagerState:", objc_msgSend(v4, "state"));

}

- (void)processConnectedAccessories
{
  uint64_t v2;
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004004;
  block[3] = &unk_100010528;
  block[4] = self;
  if (qword_100015A80 != -1)
    dispatch_once(&qword_100015A80, block);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = IAPAppConnectedAccessories();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v20;
    v8 = IAPAppBTPairingIsSupported;
    v9 = IAPAppConnectionIDKey;
    *(_QWORD *)&v5 = 138412290;
    v17 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8, v17));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));
        if (objc_msgSend(v12, "BOOLValue") && objc_msgSend(v13, "unsignedLongLongValue"))
        {
          v14 = IAPBluetoothDeviceAllocAccessoryPairingInfo(objc_msgSend(v13, "unsignedLongLongValue"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v16 = qword_100015A68;
          if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v25 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Discovered connected accessory with info %@", buf, 0xCu);
          }
          -[AccessoryPairingManager enqueueDevice:](self, "enqueueDevice:", v15);

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v6);
  }

  -[AccessoryPairingManager processAccessoryQueue](self, "processAccessoryQueue");
}

- (void)handleAccessoryDidDisconnectNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received accessory disconnection notification with info %@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  -[AccessoryPairingManager dequeueDevice:](self, "dequeueDevice:", v8);

}

- (void)accessoryPairingWizardDidFinish:(id)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint8_t v13[24];

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));

  v8 = (void *)qword_100015A68;
  if (v7 == v6)
  {
    v9 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v9)
      {
        v10 = v8;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));
        *(_DWORD *)v13 = 138412290;
        *(_QWORD *)&v13[4] = v11;
        v12 = "Successfully completed pairing accessory \"%@\";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 0xCu);

      }
    }
    else if (v9)
    {
      v10 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingManager currentAccessory](self, "currentAccessory"));
      *(_DWORD *)v13 = 138412290;
      *(_QWORD *)&v13[4] = v11;
      v12 = "Failed to pair accessory \"%@\";
      goto LABEL_9;
    }
    -[AccessoryPairingManager setCurrentAccessory:](self, "setCurrentAccessory:", 0, *(_OWORD *)v13);
    -[AccessoryPairingManager processAccessoryQueue](self, "processAccessoryQueue");
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
    sub_1000092C0((uint64_t)v6, v8, self);
LABEL_11:

}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (int64_t)previousCentralManagerState
{
  return self->_previousCentralManagerState;
}

- (void)setPreviousCentralManagerState:(int64_t)a3
{
  self->_previousCentralManagerState = a3;
}

- (AccessoryPairingWizard)currentAccessory
{
  return self->_currentAccessory;
}

- (void)setCurrentAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_currentAccessory, a3);
}

- (NSMutableArray)accessoryQueue
{
  return self->_accessoryQueue;
}

- (void)setAccessoryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryQueue, a3);
}

- (OS_os_transaction)persistenceAssertion
{
  return self->_persistenceAssertion;
}

- (void)setPersistenceAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceAssertion, 0);
  objc_storeStrong((id *)&self->_accessoryQueue, 0);
  objc_storeStrong((id *)&self->_currentAccessory, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end
