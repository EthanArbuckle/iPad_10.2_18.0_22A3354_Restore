@implementation ServerServiceManager

+ (id)instance
{
  if (qword_1000C90E0 != -1)
    dispatch_once(&qword_1000C90E0, &stru_1000ADF00);
  return (id)qword_1000C90D8;
}

- (void)setPersist:(BOOL)a3
{
  -[ServerServiceManager setShouldPersist:](self, "setShouldPersist:", a3);
  -[ServerServiceManager refreshPersistanceAssertion](self, "refreshPersistanceAssertion");
}

+ (void)initialize
{
  void *v2;

  if ((id)objc_opt_class(ServerServiceManager, a2) == a1)
  {
    v2 = (void *)qword_1000C90D0;
    qword_1000C90D0 = (uint64_t)&off_1000B3BA8;

  }
}

- (ServerServiceManager)init
{
  ServerServiceManager *v2;
  id v3;
  void *v4;
  CBPeripheralManager *v5;
  CBPeripheralManager *peripheralManager;
  uint64_t v7;
  NSMapTable *serverServiceMap;
  OS_os_transaction *persistanceAssertion;
  NSMutableArray *v10;
  NSMutableArray *pendingUpdates;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v13.receiver = self;
  v13.super_class = (Class)ServerServiceManager;
  v2 = -[ServerServiceManager init](&v13, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)CBPeripheralManager);
    v14[0] = CBCentralManagerOptionReceiveSystemEvents;
    v14[1] = CBManagerNeedsRestrictedStateOperation;
    v15[0] = &__kCFBooleanTrue;
    v15[1] = &__kCFBooleanTrue;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
    v5 = (CBPeripheralManager *)objc_msgSend(v3, "initWithDelegate:queue:options:", v2, &_dispatch_main_q, v4);
    peripheralManager = v2->_peripheralManager;
    v2->_peripheralManager = v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    serverServiceMap = v2->_serverServiceMap;
    v2->_serverServiceMap = (NSMapTable *)v7;

    v2->_shouldPersist = 0;
    persistanceAssertion = v2->_persistanceAssertion;
    v2->_persistanceAssertion = 0;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingUpdates = v2->_pendingUpdates;
    v2->_pendingUpdates = v10;

  }
  return v2;
}

- (void)createServices
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)qword_1000C90D0;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = NSClassFromString(*(NSString **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7));
        if (v8)
        {
          v9 = objc_alloc_init(v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap", (_QWORD)v12));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "service"));
          objc_msgSend(v10, "setObject:forKey:", v9, v11);

          objc_msgSend(v9, "start");
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)destroyServices
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &stru_1000ADF40);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  objc_msgSend(v4, "removeAllObjects");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
  objc_msgSend(v5, "removeAllObjects");

}

- (void)refreshPersistanceAssertion
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  if (objc_msgSend(v3, "state") == (id)4)
  {

LABEL_6:
    -[ServerServiceManager setPersistanceAssertion:](self, "setPersistanceAssertion:", 0);
    return;
  }
  v4 = -[ServerServiceManager shouldPersist](self, "shouldPersist");

  if (!v4)
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager persistanceAssertion](self, "persistanceAssertion"));

  if (!v5)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.%@"), objc_opt_class(self, v6));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
    v8 = (void *)os_transaction_create(objc_msgSend(v9, "UTF8String"));
    -[ServerServiceManager setPersistanceAssertion:](self, "setPersistanceAssertion:", v8);

  }
}

- (void)addService:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  objc_msgSend(v5, "addService:", v4);

}

- (void)removeService:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  objc_msgSend(v5, "removeService:", v4);

}

- (void)respondToRequest:(id)a3 withResult:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006F270(v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  objc_msgSend(v8, "respondToRequest:withResult:", v6, a4);

}

- (void)updateValue:(id)a3 forCharacteristic:(id)a4 onSubscribedCentrals:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006F3EC(v11, v9, (uint64_t)v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
  if (objc_msgSend(v12, "count"))
  {

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
    v14 = objc_msgSend(v13, "updateValue:forCharacteristic:onSubscribedCentrals:", v8, v9, v10);

    if ((v14 & 1) != 0)
      goto LABEL_8;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ATTUpdate updateWithValue:characteristic:centrals:](ATTUpdate, "updateWithValue:characteristic:centrals:", v8, v9, v10));
  objc_msgSend(v15, "addObject:", v16);

  v17 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006F360(v17, self);
LABEL_8:

}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManagerStateString](self, "peripheralManagerStateString"));
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PeripheralManager state is now %@", buf, 0xCu);

  }
  -[ServerServiceManager refreshPersistanceAssertion](self, "refreshPersistanceAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100046300;
  v10[3] = &unk_1000ADF68;
  v9 = v4;
  v11 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  if (objc_msgSend(v9, "state") == (id)5)
    -[ServerServiceManager createServices](self, "createServices");
  else
    -[ServerServiceManager destroyServices](self, "destroyServices");

}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));

  if (v11)
    objc_msgSend(v11, "peripheralManager:didAddService:error:", v12, v8, v9);

}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristic"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "service"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v10));

  if (v11)
  {
    v12 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_10006F49C(v12, v7, self);
    objc_msgSend(v11, "peripheralManager:didReceiveReadRequest:", v6, v7);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
    objc_msgSend(v13, "respondToRequest:withResult:", v7, 10);

  }
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  ServerServiceManager *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "characteristic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "service"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v11));

  if (v12)
  {
    v26 = v12;
    v27 = v7;
    v28 = v6;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      v29 = self;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
          {
            v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v17);
            v20 = v18;
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "central"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager nameForCentral:](self, "nameForCentral:", v30));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "characteristic"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUID"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));
            *(_DWORD *)buf = 138412802;
            v36 = v21;
            v37 = 2112;
            v38 = v23;
            v39 = 2112;
            v40 = v24;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Central \"%@\" sent a write request on characteristic \"%@\": %@", buf, 0x20u);

            self = v29;
          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v15);
    }

    v12 = v26;
    v6 = v28;
    objc_msgSend(v26, "peripheralManager:didReceiveWriteRequests:", v28, v13);
    v7 = v27;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
    objc_msgSend(v25, "respondToRequest:withResult:", v8, 10);

  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "service"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

  if (v13)
  {
    v14 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager nameForCentral:](self, "nameForCentral:", v9));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
      v18 = 138412546;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Central \"%@\" is now subscribed to characteristic \"%@\", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(v13, "peripheralManager:central:didSubscribeToCharacteristic:", v8, v9, v10);
  }

}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "service"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

  if (v13)
  {
    v14 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager nameForCentral:](self, "nameForCentral:", v9));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
      v18 = 138412546;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Central \"%@\" is now unsubscribed from characteristic \"%@\", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(v13, "peripheralManager:central:didUnsubscribeFromCharacteristic:", v8, v9, v10);
  }

}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006F590(v5, self);
  while (1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      break;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "characteristic"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centrals"));
    v14 = objc_msgSend(v10, "updateValue:forCharacteristic:onSubscribedCentrals:", v11, v12, v13);

    if ((v14 & 1) == 0)
    {

      break;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager pendingUpdates](self, "pendingUpdates"));
    objc_msgSend(v15, "removeObjectAtIndex:", 0);

  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUpdateANCSAuthorization:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager serverServiceMap](self, "serverServiceMap"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100046C58;
  v13[3] = &unk_1000ADF90;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

}

- (id)nameForCentral:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peripheralForIdentifier:", v3));

  if (v5)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v7 = (void *)v6;

  return v7;
}

- (id)peripheralManagerStateString
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServerServiceManager peripheralManager](self, "peripheralManager"));
  v3 = (char *)objc_msgSend(v2, "state");

  if ((unint64_t)(v3 - 1) > 9)
    return CFSTR("unknown");
  else
    return *(&off_1000ADFB0 + (_QWORD)(v3 - 1));
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (void)setPeripheralManager:(id)a3
{
  objc_storeStrong((id *)&self->_peripheralManager, a3);
}

- (NSMapTable)serverServiceMap
{
  return self->_serverServiceMap;
}

- (void)setServerServiceMap:(id)a3
{
  objc_storeStrong((id *)&self->_serverServiceMap, a3);
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

- (OS_os_transaction)persistanceAssertion
{
  return self->_persistanceAssertion;
}

- (void)setPersistanceAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_persistanceAssertion, a3);
}

- (NSMutableArray)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUpdates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_persistanceAssertion, 0);
  objc_storeStrong((id *)&self->_serverServiceMap, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
}

@end
