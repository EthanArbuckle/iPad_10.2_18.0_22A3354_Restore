@implementation ConnectionManager

+ (id)instance
{
  if (qword_1000C90A0 != -1)
    dispatch_once(&qword_1000C90A0, &stru_1000ADB48);
  return (id)qword_1000C9098;
}

- (void)connectOnce:(id)a3
{
  -[ConnectionManager connectOnce:connectionTimeoutEnabled:](self, "connectOnce:connectionTimeoutEnabled:", a3, 1);
}

- (void)connectOnce:(id)a3 connectionTimeoutEnabled:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "connectionTimeout:", v9, 0, 5.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v9);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
    objc_msgSend(v6, "addObject:", v9);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  objc_msgSend(v8, "removeObject:", v9);

  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");

}

- (void)connectAlways:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PeripheralConnectionInfo *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = objc_msgSend(v6, "isEqualToArray:", v4);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
          v16 = (PeripheralConnectionInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v14));

          if (!v16)
            v16 = objc_alloc_init(PeripheralConnectionInfo);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    -[ConnectionManager setConnectAlwaysIdentifiersMap:](self, "setConnectAlwaysIdentifiersMap:", v8);
    -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
    -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");

    v4 = v17;
  }

}

- (BOOL)isAlwaysConnecting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (id)peripheralForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripherals](self, "peripherals", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)cancelPeripheralConnectionForConnectOnceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  objc_msgSend(v5, "removeObject:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  objc_msgSend(v6, "removeObjectForKey:", v4);

  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");
}

- (void)performMFiAuth:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  unsigned int v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  void *v39;
  id v40;
  uint8_t buf[4];
  _BYTE v42[14];

  v4 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Perform MFIAuth for %@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  v7 = objc_msgSend(v6, "state");

  if (v7 == (id)5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    v40 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "retrievePeripheralsWithIdentifiers:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    if (objc_msgSend(v11, "hasTag:", CFSTR("needsMFiAuthentication4.0")))
    {
      -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      v13 = (id)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
      objc_msgSend(v12, "connectPeripheral:options:", v13, 0);
    }
    else
    {
      v33 = v10;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0xFE13")));
      v39 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "retrieveConnectedPeripheralsWithServices:", v20));

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v12 = v21;
      v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v35 != v24)
              objc_enumerationMutation(v12);
            v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
            v28 = objc_msgSend(v27, "isEqual:", v4);

            if (v28)
            {
              -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", v26);
              v30 = (id)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
              objc_msgSend(v30, "connectPeripheral:options:", v32, 0);
              v13 = v12;
              goto LABEL_21;
            }
          }
          v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v23)
            continue;
          break;
        }
      }

      -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", 0);
      v29 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Register for connection event for this Fitness machine service", buf, 2u);
      }
      v13 = objc_alloc_init((Class)NSMutableDictionary);
      v30 = objc_alloc_init((Class)NSMutableArray);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0000FE13-0000-1000-8000-00805F9B34FB")));
      objc_msgSend(v30, "addObject:", v31);

      objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CBConnectionEventMatchingOptionServiceUUIDs);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      objc_msgSend(v32, "registerForConnectionEventsWithOptions:", v13);
LABEL_21:
      v10 = v33;

    }
  }
  else
  {
    v14 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      v17 = objc_msgSend(v16, "state");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v42 = v17;
      *(_WORD *)&v42[4] = 2112;
      *(_QWORD *)&v42[6] = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Manager state is %d, deferring MFI Auth for %@", buf, 0x12u);

    }
    -[NSMutableSet addObject:](self->_mfiAuthPendingPeripherals, "addObject:", v4);
  }

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
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int64_t v20;

  v8 = a3;
  v9 = a5;
  v10 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    v17 = 138412546;
    v18 = v12;
    v19 = 2048;
    v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" connection event:%tu", (uint8_t *)&v17, 0x16u);

  }
  if (a4 == 1)
  {
    -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
    objc_msgSend(v13, "connectPeripheral:options:", v14, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    objc_msgSend(v15, "registerForConnectionEventsWithOptions:", 0);

  }
  else
  {
    v16 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006D5E8(v16, v9);
    -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", 0);
  }

}

- (ConnectionManager)init
{
  ConnectionManager *v2;
  id v3;
  void *v4;
  CBCentralManager *v5;
  CBCentralManager *centralManager;
  NSMutableDictionary *v7;
  NSMutableDictionary *connectOnceIdentifiersMap;
  NSMutableSet *v9;
  NSMutableSet *connectOnceNoTimeoutIdentifiers;
  NSMutableDictionary *connectAlwaysIdentifiersMap;
  NSMutableSet *v12;
  NSMutableSet *denylistedIdentifiers;
  OS_os_transaction *connectionAssertion;
  NSArray *peripherals;
  NSMutableArray *v16;
  NSMutableArray *L2CAPChannels;
  CBPeripheral *mfiPeripheral;
  CBL2CAPChannel *peerChannel;
  CBL2CAPChannel *mfiAuthChannel;
  NSMutableDictionary *v21;
  NSMutableDictionary *clientServiceManagerMap;
  NSMutableSet *v23;
  NSMutableSet *mfiAuthPendingPeripherals;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;
  _QWORD v32[2];
  _QWORD v33[2];

  v31.receiver = self;
  v31.super_class = (Class)ConnectionManager;
  v2 = -[ConnectionManager init](&v31, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)CBCentralManager);
    v32[0] = CBCentralManagerOptionReceiveSystemEvents;
    v32[1] = CBManagerNeedsRestrictedStateOperation;
    v33[0] = &__kCFBooleanTrue;
    v33[1] = &__kCFBooleanTrue;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
    v5 = (CBCentralManager *)objc_msgSend(v3, "initWithDelegate:queue:options:", v2, &_dispatch_main_q, v4);
    centralManager = v2->_centralManager;
    v2->_centralManager = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectOnceIdentifiersMap = v2->_connectOnceIdentifiersMap;
    v2->_connectOnceIdentifiersMap = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    connectOnceNoTimeoutIdentifiers = v2->_connectOnceNoTimeoutIdentifiers;
    v2->_connectOnceNoTimeoutIdentifiers = v9;

    connectAlwaysIdentifiersMap = v2->_connectAlwaysIdentifiersMap;
    v2->_connectAlwaysIdentifiersMap = 0;

    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    denylistedIdentifiers = v2->_denylistedIdentifiers;
    v2->_denylistedIdentifiers = v12;

    connectionAssertion = v2->_connectionAssertion;
    v2->_connectionAssertion = 0;

    peripherals = v2->_peripherals;
    v2->_peripherals = 0;

    v16 = objc_opt_new(NSMutableArray);
    L2CAPChannels = v2->_L2CAPChannels;
    v2->_L2CAPChannels = v16;

    mfiPeripheral = v2->_mfiPeripheral;
    v2->_mfiPeripheral = 0;

    peerChannel = v2->_peerChannel;
    v2->_peerChannel = 0;

    mfiAuthChannel = v2->_mfiAuthChannel;
    v2->_mfiAuthChannel = 0;

    v2->_authInProgress = 0;
    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientServiceManagerMap = v2->_clientServiceManagerMap;
    v2->_clientServiceManagerMap = v21;

    v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mfiAuthPendingPeripherals = v2->_mfiAuthPendingPeripherals;
    v2->_mfiAuthPendingPeripherals = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, "peripheralPairingDidFail:", CFSTR("PeripheralPairingDidFailNotification"), 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v2, "authDidSucceed:", CFSTR("AuthenticationServiceAuthDidSucceedNotification"), 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v2, "authDidFail:", CFSTR("AuthenticationServiceAuthDidFailNotification"), 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v2, "peerIsUsingBuiltinService:", CFSTR("PeerIsUsingBuiltinServiceNotification"), 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v29, "addObserver:selector:name:object:", v2, "peerDidIdleTimeout:", CFSTR("PeerDidIdleTimeoutNotification"), 0);

  }
  return v2;
}

- (BOOL)allowInRestrictedMode:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasTag:", CFSTR("A1603")) & 1) != 0
    || (objc_msgSend(v3, "hasTag:", CFSTR("A2051")) & 1) != 0
    || (objc_msgSend(v3, "hasTag:", CFSTR("A3085")) & 1) != 0
    || (objc_msgSend(v3, "hasTag:", CFSTR("A2538")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "hasTag:", CFSTR("FastConnection"));
  }

  return v4;
}

- (BOOL)requireServicesAndMFi:(id)a3
{
  return objc_msgSend(a3, "hasTag:", CFSTR("A2538"));
}

- (void)refreshPeripherals
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  unsigned int v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if (objc_msgSend(v3, "state") == (id)5)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    v5 = objc_msgSend(v4, "state");

    if (v5 != (id)10)
      return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  objc_msgSend(v6, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
  objc_msgSend(v6, "addObjectsFromArray:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  v36 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "retrievePeripheralsWithIdentifiers:", v14));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripherals](self, "peripherals"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v15, "containsObject:", v21) & 1) == 0)
          -[ConnectionManager disconnectPeripheral:force:](self, "disconnectPeripheral:force:", v21, 0);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v18);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v22 = v15;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
        v29 = objc_msgSend(v28, "state");

        if (v29 != (id)10)
          goto LABEL_22;
        v30 = -[ConnectionManager allowInRestrictedMode:](self, "allowInRestrictedMode:", v27);
        v31 = qword_1000C9178;
        v32 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
        if (v30)
        {
          if (v32)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Bluetooth is restricted. Allowing connection to Apple Pencil.", buf, 2u);
          }
LABEL_22:
          -[ConnectionManager connectPeripheral:](self, "connectPeripheral:", v27);
          goto LABEL_23;
        }
        if (v32)
        {
          v33 = v31;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
          *(_DWORD *)buf = 138412290;
          v46 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Bluetooth is restricted. Outgoing connection to %@ not allowed.", buf, 0xCu);

        }
LABEL_23:
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v35 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      v24 = v35;
    }
    while (v35);
  }

  -[ConnectionManager setPeripherals:](self, "setPeripherals:", v22);
}

- (void)connectPeripheral:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unsigned int v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _BYTE v29[24];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if (objc_msgSend(v5, "state") == (id)5)
  {
    v6 = objc_msgSend(v4, "state");

    if (v6)
      goto LABEL_22;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    if (objc_msgSend(v7, "state") != (id)10)
    {

LABEL_21:
      goto LABEL_22;
    }
    v8 = objc_msgSend(v4, "state");

    if (v8)
      goto LABEL_22;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if ((v11 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));

    if (v17)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CBConnectPeripheralOptionEnableAutoReconnect);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    v19 = objc_msgSend(v18, "state");

    if (v19 == (id)10)
    {
      v20 = -[ConnectionManager allowInRestrictedMode:](self, "allowInRestrictedMode:", v4);
      v21 = (void *)qword_1000C9178;
      v22 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
      if (!v20)
      {
        if (!v22)
          goto LABEL_21;
        v27 = v21;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        *(_DWORD *)v29 = 138412290;
        *(_QWORD *)&v29[4] = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Ignoring connection to \"%@\" since bluetooth state is restricted", v29, 0xCu);

        goto LABEL_20;
      }
      if (v22)
      {
        v23 = v21;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        *(_DWORD *)v29 = 138412546;
        *(_QWORD *)&v29[4] = v24;
        *(_WORD *)&v29[12] = 2112;
        *(_QWORD *)&v29[14] = v5;
        v25 = "Allowing connection to Apple Pencil \"%@\" options %@...";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, v29, 0x16u);

      }
    }
    else
    {
      v26 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v26;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        *(_DWORD *)v29 = 138412546;
        *(_QWORD *)&v29[4] = v24;
        *(_WORD *)&v29[12] = 2112;
        *(_QWORD *)&v29[14] = v5;
        v25 = "Connecting peripheral \"%@\" options %@...";
        goto LABEL_18;
      }
    }
    v27 = objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager", *(_OWORD *)v29, *(_QWORD *)&v29[16]));
    -[NSObject connectPeripheral:options:](v27, "connectPeripheral:options:", v4, v5);
LABEL_20:

    goto LABEL_21;
  }
  v12 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)v29 = 138412290;
    *(_QWORD *)&v29[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not connecting peripheral \"%@\" as it is denylisted", v29, 0xCu);

  }
LABEL_22:

}

- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if (objc_msgSend(v7, "state") == (id)5)
  {
    v8 = objc_msgSend(v6, "state");

    if (!v8)
      goto LABEL_12;
LABEL_6:
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v21 = 138412290;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Disconnecting peripheral \"%@\"...", (uint8_t *)&v21, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    objc_msgSend(v14, "cancelPeripheralConnection:force:", v6, v4);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    objc_msgSend(v15, "removeObjectForKey:", v6);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    objc_msgSend(v16, "removeObject:", v17);

    if (-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v6))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
        objc_msgSend(v19, "destroyConnectionWithUUID:", v20);

      }
    }
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if (objc_msgSend(v9, "state") != (id)10)
  {

    goto LABEL_12;
  }
  v10 = objc_msgSend(v6, "state");

  if (v10)
    goto LABEL_6;
LABEL_12:

}

- (void)refreshConnectionAssertion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if (objc_msgSend(v3, "state") == (id)4)
  {

LABEL_3:
    -[ConnectionManager setConnectionAssertion:](self, "setConnectionAssertion:", 0);
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  if (objc_msgSend(v4, "count"))
    goto LABEL_7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  if (objc_msgSend(v5, "count"))
  {

LABEL_7:
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    goto LABEL_3;
LABEL_8:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionAssertion](self, "connectionAssertion"));

  if (!v6)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.%@"), objc_opt_class(self, v7));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v8));
    v9 = (void *)os_transaction_create(objc_msgSend(v12, "UTF8String"));
    -[ConnectionManager setConnectionAssertion:](self, "setConnectionAssertion:", v9);

  }
}

- (void)connectionTimeout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (v7 == v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripheralForIdentifier:](self, "peripheralForIdentifier:", v5));
    v9 = v8;
    if (v8 && objc_msgSend(v8, "state") == (id)1)
    {
      v10 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006D674(v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
      objc_msgSend(v11, "removeObjectForKey:", v5);

      -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
      -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");
    }

  }
}

- (void)analyzeConnectionError:(id)a3 peripheral:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  NSString *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (v11 == CBErrorDomain && objc_msgSend(v8, "code") == (id)6)
  {

    goto LABEL_7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v13 = v12;
  if (v12 == (void *)CBInternalErrorDomain)
  {
    v14 = objc_msgSend(v8, "code");

    if (v14 == (id)31)
    {
LABEL_7:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
      objc_msgSend(v15, "timeIntervalSinceDate:", v16);
      v18 = v17;

      if (v18 < 10.0)
        goto LABEL_20;
    }
  }
  else
  {

  }
  if (objc_msgSend(v10, "tryCount"))
  {
    v19 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v31 = 138412546;
      v32 = v21;
      v33 = 2048;
      v34 = objc_msgSend(v10, "tryCount");
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" did not use any built-in service, strike #%lu", (uint8_t *)&v31, 0x16u);

    }
    v22 = objc_msgSend(v9, "hasTag:", CFSTR("DoNotStopAutoConnecting"));
    if ((unint64_t)objc_msgSend(v10, "tryCount") >= 5 && (v22 & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v23, "postNotificationName:object:", CFSTR("PeerIsNotUsingBuiltinServiceNotification"), v9);

    }
  }
  v24 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (v24 != CBErrorDomain)
    goto LABEL_19;
  v25 = objc_msgSend(v8, "code");

  if (v25 == (id)14)
  {
    v26 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v31 = 138412290;
      v32 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" removed pairing info, stop always connect", (uint8_t *)&v31, 0xCu);

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v29, "postNotificationName:object:", CFSTR("PeerIsNotUsingBuiltinServiceNotification"), v9);

    v24 = (NSString *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    -[NSString removeObjectForKey:](v24, "removeObjectForKey:", v30);

LABEL_19:
  }
LABEL_20:

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
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSMutableSet *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManagerStateString](self, "centralManagerStateString"));
    *(_DWORD *)buf = 138412290;
    v68 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CentralManager state is now %@", buf, 0xCu);

  }
  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  v9 = objc_msgSend(v8, "state");

  if (v9 == (id)10)
  {
    v56 = v4;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripherals](self, "peripherals"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          if (-[ConnectionManager allowInRestrictedMode:](self, "allowInRestrictedMode:", v16))
          {
            v17 = v16;

            v13 = v17;
          }
          else
          {
            v18 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v68 = v16;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Disconnecting peripheral : %@ since bluetooth is in restricted mode", buf, 0xCu);
            }
            -[ConnectionManager disconnectPeripheral:force:](self, "disconnectPeripheral:force:", v16, 1);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", v33));

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", v36));

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
      objc_msgSend(v38, "removeAllObjects");

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      objc_msgSend(v39, "setObject:forKey:", v37, v40);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", v42));

    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKey:", v45));

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
      objc_msgSend(v47, "removeAllObjects");

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      objc_msgSend(v48, "setObject:forKey:", v46, v49);

    }
    -[ConnectionManager setDenylistedIdentifiers:](self, "setDenylistedIdentifiers:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKey:", v13));

    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v13));

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      objc_msgSend(v54, "removeAllObjects");

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      objc_msgSend(v55, "setObject:forKey:", v53, v13);

    }
    -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");

LABEL_37:
    v4 = v56;
    goto LABEL_38;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  v20 = objc_msgSend(v19, "state");

  if (v20 == (id)5)
  {
    v56 = v4;
    -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v21 = self->_mfiAuthPendingPeripherals;
    v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v58 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
          v27 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Deferred MFI Auth for %@", buf, 0xCu);
          }
          -[ConnectionManager performMFiAuth:](self, "performMFiAuth:", v26);
        }
        v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v23);
    }

    -[NSMutableSet removeAllObjects](self->_mfiAuthPendingPeripherals, "removeAllObjects");
    goto LABEL_37;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  objc_msgSend(v28, "removeAllObjects");

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  objc_msgSend(v29, "removeAllObjects");

  -[ConnectionManager setConnectAlwaysIdentifiersMap:](self, "setConnectAlwaysIdentifiersMap:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  objc_msgSend(v30, "removeAllObjects");

  -[ConnectionManager setPeripherals:](self, "setPeripherals:", 0);
  -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", 0);
  -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  objc_msgSend(v31, "removeAllObjects");

LABEL_38:
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  unsigned int v49;
  void *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  ClientServiceManager *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  uint8_t buf[4];
  void *v66;

  v6 = a3;
  v7 = a4;
  v8 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    *(_DWORD *)buf = 138412290;
    v66 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" is now connected", buf, 0xCu);

  }
  if (!-[ConnectionManager authInProgress](self, "authInProgress")
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier")),
        v14 = objc_msgSend(v12, "isEqual:", v13),
        v13,
        v12,
        v11,
        !v14))
  {
    if (-[ConnectionManager authInProgress](self, "authInProgress"))
      goto LABEL_18;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
    if (!v18)
    {
      if (!objc_msgSend(v7, "hasTag:", CFSTR("needsMFiAuthentication4.0")))
        goto LABEL_18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "retrievePairingInfoForPeripheral:", v7));

      v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("kCBMsgArgRemoteAddress"))));
      v20 = (unsigned __int8 *)objc_msgSend(v62, "bytes");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), *v20, v20[1], v20[2], v20[3], v20[4], v20[5]));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
      objc_msgSend(v22, "setDelegate:", self);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifierForConnectionWithUUID:", v24));

      if (v25 == v21)
      {
        v30 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Connection exists!", buf, 2u);
        }
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "createConnectionWithType:andIdentifier:", 2, v21));
        -[ConnectionManager setConnectionUUID:](self, "setConnectionUUID:", v27);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
        objc_msgSend(v28, "setConnectionAuthenticated:state:", v29, 1);

      }
      v31 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Previously connected peripheral ..", buf, 2u);
      }

    }
LABEL_18:
    v32 = objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
    if (v32)
    {
      v33 = (void *)v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
        objc_msgSend(v38, "setDelegate:", self);

        v39 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v39;
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "name"));
          *(_DWORD *)buf = 138412290;
          v66 = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Perform mfi auth for \"%@\"...", buf, 0xCu);

        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "sharedPairingAgent"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "retrievePairedPeers"));

        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_100033DFC;
        v63[3] = &unk_1000ADB78;
        v46 = v7;
        v64 = v46;
        if (objc_msgSend(v45, "indexOfObjectPassingTest:", v63) != (id)0x7FFFFFFFFFFFFFFFLL
          || !-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v46))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          objc_msgSend(v47, "openL2CAPChannel:", 128);

          -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          v49 = -[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v48);

          if (!v49)
          {

            goto LABEL_36;
          }
        }

      }
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripherals](self, "peripherals"));
    v51 = objc_msgSend(v50, "containsObject:", v7);

    if (!v51)
    {
      -[ConnectionManager disconnectPeripheral:force:](self, "disconnectPeripheral:force:", v7, 0);
      goto LABEL_36;
    }
    objc_msgSend(v7, "setDelegate:", self);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v7));

    if (!v53)
    {
      v54 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
        *(_DWORD *)buf = 138412290;
        v66 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Initializing ClientServiceManager for \"%@\"...", buf, 0xCu);

      }
      v57 = -[ClientServiceManager initWithPeripheral:]([ClientServiceManager alloc], "initWithPeripheral:", v7);
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v57, v7);

    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", v60));

    if (v16)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSObject setDate:](v16, "setDate:", v61);

      -[NSObject setTryCount:](v16, "setTryCount:", (char *)-[NSObject tryCount](v16, "tryCount") + 1);
    }
    goto LABEL_33;
  }
  v15 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    *(_DWORD *)buf = 138412290;
    v66 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Authentication in progress for \"%@\" Return.", buf, 0xCu);

LABEL_33:
  }
LABEL_36:

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    v24 = 138412546;
    v25 = v13;
    v26 = 2112;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" failed to connect: %@", (uint8_t *)&v24, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  objc_msgSend(v14, "removeObjectForKey:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  objc_msgSend(v16, "removeObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v19));

  if (v20)
  {
    -[ConnectionManager analyzeConnectionError:peripheral:info:](self, "analyzeConnectionError:peripheral:info:", v10, v9, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));

    if (v23)
      -[ConnectionManager connectPeripheral:](self, "connectPeripheral:", v9);
  }
  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 timestamp:(double)a5 isReconnecting:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  double v37;
  __int16 v38;
  _BOOL4 v39;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
    v32 = 138413058;
    v33 = v17;
    v34 = 2112;
    v35 = v14;
    v36 = 2048;
    v37 = CFAbsoluteTimeGetCurrent() - a5;
    v38 = 1024;
    v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" is disconnected: %@ %lf seconds ago, is reconnecting: %d", (uint8_t *)&v32, 0x26u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  objc_msgSend(v18, "removeObjectForKey:", v13);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  objc_msgSend(v19, "removeObjectForKey:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  objc_msgSend(v21, "removeObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v24));

  if (v25)
  {
    -[ConnectionManager analyzeConnectionError:peripheral:info:](self, "analyzeConnectionError:peripheral:info:", v14, v13, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v27));

    if (v28)
    {
      if (!v8)
        -[ConnectionManager connectPeripheral:](self, "connectPeripheral:", v13);
    }
  }
  if (-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v13))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
      objc_msgSend(v30, "destroyConnectionWithUUID:", v31);

    }
  }
  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");

}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  unsigned __int8 *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  id v46;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error in opening CBL2CAP channel: %@", buf, 0xCu);
    }
    -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 0);
    -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", 0);
    if (-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v8))
      -[ConnectionManager disconnectPeripheral:force:](self, "disconnectPeripheral:force:", v8, 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager L2CAPChannels](self, "L2CAPChannels"));
    objc_msgSend(v12, "addObject:", v9);

    v13 = (void *)voucher_copy();
    -[ConnectionManager setMfiVoucher:](self, "setMfiVoucher:", v13);

    -[ConnectionManager setPeerChannel:](self, "setPeerChannel:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inputStream"));
    objc_msgSend(v14, "setDelegate:", self);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "outputStream"));
    objc_msgSend(v15, "setDelegate:", self);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inputStream"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v16, "scheduleInRunLoop:forMode:", v17, NSDefaultRunLoopMode);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "outputStream"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v18, "scheduleInRunLoop:forMode:", v19, NSDefaultRunLoopMode);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inputStream"));
    objc_msgSend(v20, "open");

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "outputStream"));
    objc_msgSend(v21, "open");

    if (objc_msgSend(v8, "hasTag:", CFSTR("needsMFiAuthentication4.0")))
    {
      -[ConnectionManager setMfiAuthChannel:](self, "setMfiAuthChannel:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "retrievePairingInfoForPeripheral:", v8));

      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("kCBMsgArgRemoteAddress"))));
      v25 = (unsigned __int8 *)objc_msgSend(v24, "bytes");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), *v25, v25[1], v25[2], v25[3], v25[4], v25[5]));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
      objc_msgSend(v27, "setDelegate:", self);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "createConnectionWithType:andIdentifier:", 2, v26));
      -[ConnectionManager setConnectionUUID:](self, "setConnectionUUID:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000348B8;
      v43[3] = &unk_1000ADBA0;
      v44 = v9;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:", 3, 14, 0, v43, v31, 1));
      -[ConnectionManager setEndpointUUID:](self, "setEndpointUUID:", v32);

    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
      objc_msgSend(v33, "setDelegate:", self);

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "UUIDString"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "createConnectionWithType:andIdentifier:", 2, v36));
      -[ConnectionManager setConnectionUUID:](self, "setConnectionUUID:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100034934;
      v41[3] = &unk_1000ADBA0;
      v42 = v9;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:", 3, 4, 0, v41, v39, 1));
      -[ConnectionManager setEndpointUUID:](self, "setEndpointUUID:", v40);

    }
  }

}

- (void)transportClient:(id)a3 authStatusDidChange:(BOOL)a4 forConnectionWithUUID:(id)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFDictionary *v33;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *DistributedCenter;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  const char *v60;

  v5 = a4;
  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
    v11 = -[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v10);

    if (v11)
    {
      -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "inputStream"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      objc_msgSend(v13, "removeFromRunLoop:forMode:", v14, NSDefaultRunLoopMode);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "outputStream"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      objc_msgSend(v16, "removeFromRunLoop:forMode:", v17, NSDefaultRunLoopMode);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "inputStream"));
      objc_msgSend(v19, "setDelegate:", 0);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "outputStream"));
      objc_msgSend(v21, "setDelegate:", 0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "inputStream"));
      objc_msgSend(v23, "close");

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "outputStream"));
      objc_msgSend(v25, "close");

    }
  }
  v26 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v27 = "not authenticated";
    if (v5)
      v27 = "authenticated";
    *(_DWORD *)buf = 138412546;
    v58 = v7;
    v59 = 2080;
    v60 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "AuthStatusDidChange %@ %s", buf, 0x16u);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
  v29 = v28;
  if (v5)
  {

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral", CFSTR("peerIdentifier")));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "UUIDString"));
      v56 = v32;
      v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.bluetooth.accessory-authentication.success"), 0, 0, 0);
      DistributedCenter = CFNotificationCenterGetDistributedCenter();
      CFNotificationCenterPostNotification(DistributedCenter, CFSTR("com.apple.bluetooth.accessory-authentication.success"), 0, v33, 0);
      -[ConnectionManager setMfiVoucher:](self, "setMfiVoucher:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
      LODWORD(v31) = objc_msgSend(v36, "hasTag:", CFSTR("A2538"));

      if ((_DWORD)v31)
      {
        v37 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          *(_DWORD *)buf = 138412290;
          v58 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Posting Find My specific auth successful notification for: %@", buf, 0xCu);

        }
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
        objc_msgSend(v40, "postNotificationName:object:userInfo:", CFSTR("A2538_AuthenticationDidSucceed"), v41, 0);

      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
      v43 = objc_msgSend(v42, "hasTag:", CFSTR("needsMFiAuthentication4.0"));

      if (v43)
      {
        v44 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v45 = v44;
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          *(_DWORD *)buf = 138412290;
          v58 = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Posting auth successful notification for: %@", buf, 0xCu);

        }
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
        objc_msgSend(v47, "postNotificationName:object:userInfo:", CFSTR("AuthenticationServiceAuthDidSucceedNotification"), v48, 0);

      }
LABEL_22:

      goto LABEL_25;
    }
    v54 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006D700(v54);
  }
  else
  {
    v49 = objc_msgSend(v28, "hasTag:", CFSTR("needsMFiAuthentication4.0"));

    if (v49)
    {
      v50 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v51 = v50;
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
        *(_DWORD *)buf = 138412290;
        v58 = v52;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Posting auth failed notification for: %@", buf, 0xCu);

      }
      v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
      -[__CFDictionary postNotificationName:object:userInfo:](v33, "postNotificationName:object:userInfo:", CFSTR("AuthenticationServiceAuthDidFailNotification"), v53, 0);

      goto LABEL_22;
    }
  }
LABEL_25:

}

- (void)transportClientServerDisconnected:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  unsigned __int8 *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];

  v22 = a3;
  v4 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "transportClientServerDisconnected!!", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v11))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "retrievePairingInfoForPeripheral:", v11));

          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("kCBMsgArgRemoteAddress"))));
          v15 = (unsigned __int8 *)objc_msgSend(v14, "bytes");
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), *v15, v15[1], v15[2], v15[3], v15[4], v15[5], v22));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
          objc_msgSend(v17, "setDelegate:", self);

          v18 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "createConnectionWithType:andIdentifier:", 2, v16));
          -[ConnectionManager setConnectionUUID:](self, "setConnectionUUID:", v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
          objc_msgSend(v20, "setConnectionAuthenticated:state:", v21, 1);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

}

- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forEndpointWithUUID:(id)a5 previousProperties:(id)a6 connectionUUID:(id)a7
{
  id v7;
  NSObject *v8;

  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006D740((uint64_t)v7, v8);

}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

  objc_msgSend(v12, "peripheral:didUpdateValueForDescriptor:error:", v10, v9, v8);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;

  v5 = a3;
  if (a4 != 16)
  {
    if (a4 != 8)
    {
      if (a4 == 2)
      {
        v6 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NSStreamEventHasBytesAvailable", buf, 2u);
        }
        bzero(buf, 0x1000uLL);
        v7 = objc_msgSend(v5, "read:maxLength:", buf, 4096);
        if (v7)
        {
          v8 = (uint64_t)v7;
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, v7));
          v10 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
            sub_10006D7B4((uint64_t)v9, v8, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager endpointUUID](self, "endpointUUID"));
          objc_msgSend(v11, "processIncomingData:forEndpointWithUUID:", v9, v12);

          goto LABEL_27;
        }
      }
      goto LABEL_28;
    }
    v13 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "streamError"));
      *(_DWORD *)buf = 138412290;
      v42 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NSStreamEventErrorOccurred : %@. Teardown auth", buf, 0xCu);

    }
  }
  v16 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NSStreamEventEndEncountered", buf, 2u);
  }
  -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 0);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[ConnectionManager L2CAPChannels](self, "L2CAPChannels"));
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "inputStream"));
        if (objc_msgSend(v22, "isEqual:", v5))
        {

        }
        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "outputStream"));
          v24 = objc_msgSend(v23, "isEqual:", v5);

          if (!v24)
            continue;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "inputStream"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
        objc_msgSend(v25, "removeFromRunLoop:forMode:", v26, NSDefaultRunLoopMode);

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "outputStream"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
        objc_msgSend(v27, "removeFromRunLoop:forMode:", v28, NSDefaultRunLoopMode);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "inputStream"));
        objc_msgSend(v29, "setDelegate:", 0);

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "outputStream"));
        objc_msgSend(v30, "setDelegate:", 0);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "inputStream"));
        objc_msgSend(v31, "close");

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "outputStream"));
        objc_msgSend(v32, "close");

        -[ConnectionManager setMfiVoucher:](self, "setMfiVoucher:", 0);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v18);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
  if (v33)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
    objc_msgSend(v9, "destroyConnectionWithUUID:", v11);
LABEL_27:

  }
LABEL_28:

}

- (void)peripheralPairingDidFail:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100035C58;
    v8[3] = &unk_1000AD740;
    v8[4] = self;
    v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  }
}

- (void)authDidSucceed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v4, "removeObject:", v5);

}

- (void)authDidFail:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  objc_msgSend(v5, "addObject:", v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035D98;
  v8[3] = &unk_1000AD740;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

}

- (void)peerIsUsingBuiltinService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
    objc_msgSend(v6, "setTryCount:", 0);

}

- (void)peerDidIdleTimeout:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035EBC;
  v4[3] = &unk_1000AD740;
  v4[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (id)centralManagerStateString
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  v3 = (char *)objc_msgSend(v2, "state");

  if ((unint64_t)(v3 - 1) > 9)
    return CFSTR("unknown");
  else
    return off_1000ADBC0[(_QWORD)(v3 - 1)];
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (NSMutableDictionary)connectOnceIdentifiersMap
{
  return self->_connectOnceIdentifiersMap;
}

- (void)setConnectOnceIdentifiersMap:(id)a3
{
  objc_storeStrong((id *)&self->_connectOnceIdentifiersMap, a3);
}

- (NSMutableSet)connectOnceNoTimeoutIdentifiers
{
  return self->_connectOnceNoTimeoutIdentifiers;
}

- (void)setConnectOnceNoTimeoutIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_connectOnceNoTimeoutIdentifiers, a3);
}

- (NSMutableDictionary)connectAlwaysIdentifiersMap
{
  return self->_connectAlwaysIdentifiersMap;
}

- (void)setConnectAlwaysIdentifiersMap:(id)a3
{
  objc_storeStrong((id *)&self->_connectAlwaysIdentifiersMap, a3);
}

- (NSMutableSet)denylistedIdentifiers
{
  return self->_denylistedIdentifiers;
}

- (void)setDenylistedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_denylistedIdentifiers, a3);
}

- (OS_os_transaction)connectionAssertion
{
  return self->_connectionAssertion;
}

- (void)setConnectionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_connectionAssertion, a3);
}

- (NSArray)peripherals
{
  return self->_peripherals;
}

- (void)setPeripherals:(id)a3
{
  objc_storeStrong((id *)&self->_peripherals, a3);
}

- (NSMutableArray)L2CAPChannels
{
  return self->_L2CAPChannels;
}

- (void)setL2CAPChannels:(id)a3
{
  objc_storeStrong((id *)&self->_L2CAPChannels, a3);
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

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionUUID, a3);
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUUID, a3);
}

- (CBPeripheral)mfiPeripheral
{
  return self->_mfiPeripheral;
}

- (void)setMfiPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_mfiPeripheral, a3);
}

- (CBL2CAPChannel)peerChannel
{
  return self->_peerChannel;
}

- (void)setPeerChannel:(id)a3
{
  objc_storeStrong((id *)&self->_peerChannel, a3);
}

- (CBL2CAPChannel)mfiAuthChannel
{
  return self->_mfiAuthChannel;
}

- (void)setMfiAuthChannel:(id)a3
{
  objc_storeStrong((id *)&self->_mfiAuthChannel, a3);
}

- (BOOL)authInProgress
{
  return self->_authInProgress;
}

- (void)setAuthInProgress:(BOOL)a3
{
  self->_authInProgress = a3;
}

- (OS_voucher)mfiVoucher
{
  return self->_mfiVoucher;
}

- (void)setMfiVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_mfiVoucher, a3);
}

- (NSMutableSet)mfiAuthPendingPeripherals
{
  return self->_mfiAuthPendingPeripherals;
}

- (void)setMfiAuthPendingPeripherals:(id)a3
{
  objc_storeStrong((id *)&self->_mfiAuthPendingPeripherals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mfiAuthPendingPeripherals, 0);
  objc_storeStrong((id *)&self->_mfiVoucher, 0);
  objc_storeStrong((id *)&self->_mfiAuthChannel, 0);
  objc_storeStrong((id *)&self->_peerChannel, 0);
  objc_storeStrong((id *)&self->_mfiPeripheral, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_clientServiceManagerMap, 0);
  objc_storeStrong((id *)&self->_L2CAPChannels, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);
  objc_storeStrong((id *)&self->_connectionAssertion, 0);
  objc_storeStrong((id *)&self->_denylistedIdentifiers, 0);
  objc_storeStrong((id *)&self->_connectAlwaysIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_connectOnceNoTimeoutIdentifiers, 0);
  objc_storeStrong((id *)&self->_connectOnceIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end
