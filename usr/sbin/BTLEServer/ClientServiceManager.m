@implementation ClientServiceManager

- (ClientServiceManager)initWithPeripheral:(id)a3
{
  id v5;
  ClientServiceManager *v6;
  ClientServiceManager *v7;
  uint64_t v8;
  NSMapTable *clientServiceMap;
  NSMutableSet *v10;
  NSMutableSet *startingClientServices;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ClientServiceManager;
  v6 = -[ClientServiceManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peripheral, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    clientServiceMap = v7->_clientServiceMap;
    v7->_clientServiceMap = (NSMapTable *)v8;

    v7->_startPriority = 0;
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    startingClientServices = v7->_startingClientServices;
    v7->_startingClientServices = v10;

    -[CBPeripheral discoverServices:](v7->_peripheral, "discoverServices:", 0);
  }

  return v7;
}

- (id)clientServiceForUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
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
  v15 = sub_100039BE8;
  v16 = sub_100039BF8;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100039C00;
  v9[3] = &unk_1000ADCF0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)clientServiceDidStart:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
  objc_msgSend(v5, "removeObject:", v4);

  -[ClientServiceManager startClientServices](self, "startClientServices");
}

- (void)clientService:(id)a3 desiresConnectionParameters:(id)a4
{
  id v5;
  void *v6;
  id v7;

  if (a4)
  {
    v5 = a4;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager peripheral](self, "peripheral"));
    objc_msgSend(v7, "sendSetConnectionParametersMsg:forPeer:", v5, v6);

  }
}

+ (void)initialize
{
  void *v2;

  if ((id)objc_opt_class(ClientServiceManager, a2) == a1)
  {
    v2 = (void *)qword_1000C90A8;
    qword_1000C90A8 = (uint64_t)&off_1000B3B90;

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &stru_1000ADD30);

  v4.receiver = self;
  v4.super_class = (Class)ClientServiceManager;
  -[ClientServiceManager dealloc](&v4, "dealloc");
}

- (void)startClientServices
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    while (1)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v12 = 0;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100039F48;
      v8[3] = &unk_1000ADCF0;
      v8[4] = self;
      v8[5] = &v9;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

      if (!*((_BYTE *)v10 + 24))
        break;
      -[ClientServiceManager setStartPriority:](self, "setStartPriority:", (char *)-[ClientServiceManager startPriority](self, "startPriority") + 1);
      _Block_object_dispose(&v9, 8);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
      v7 = objc_msgSend(v6, "count");

      if (v7)
        return;
    }
    _Block_object_dispose(&v9, 8);
  }
}

- (void)analyzeError:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", CBATTErrorDomain);

  if (v5 && objc_msgSend(v8, "code") == (id)15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager peripheral](self, "peripheral"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("PeripheralPairingDidFailNotification"), v7);

  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v27 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v30;
    *(_QWORD *)&v7 = 138412546;
    v26 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap", v26));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

        if (v13)
        {
          v14 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
            *(_DWORD *)buf = v26;
            v34 = v16;
            v35 = 2112;
            v36 = v17;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" invalidated service \"%@\", buf, 0x16u);

          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("8341F2B4-C013-4F04-8197-C4CDB42E26DC")));
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
            objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", &stru_1000ADD50);

            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
            objc_msgSend(v22, "removeAllObjects");

            v23 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
            objc_msgSend(v23, "removeAllObjects");
          }
          else
          {
            objc_msgSend(v13, "stop");
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager startingClientServices](self, "startingClientServices"));
            objc_msgSend(v24, "removeObject:", v13);

            v23 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
            objc_msgSend(v23, "removeObjectForKey:", v11);
          }

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v8);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager peripheral](self, "peripheral"));
  objc_msgSend(v25, "discoverServices:", 0);

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  Class v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[4];
  void *v50;
  _BYTE buf[24];
  char v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v39 = a3;
  v34 = a4;
  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "services"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didDiscoverServices for \"%@\", %@...", buf, 0x16u);

  }
  if (v34)
  {
    v10 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006DAA4(v10, v39, (uint64_t)v34);
    -[ClientServiceManager analyzeError:](self, "analyzeError:", v34);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "services"));
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v37)
    {
      v36 = *(_QWORD *)v46;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v46 != v36)
          {
            v12 = v11;
            objc_enumerationMutation(obj);
            v11 = v12;
          }
          v38 = v11;
          v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v13));
          v16 = v15 == 0;

          if (v16)
          {
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v17 = (id)qword_1000C90A8;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v42;
              do
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v42 != v19)
                    objc_enumerationMutation(v17);
                  v21 = NSClassFromString(*(NSString **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i));
                  if (v21)
                  {
                    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
                    v23 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class UUID](v21, "UUID"));
                    v24 = objc_msgSend(v22, "isEqual:", v23);

                    if (v24)
                    {
                      v25 = objc_msgSend([v21 alloc], "initWithManager:peripheral:service:", self, v39, v13);
                      v26 = (void *)qword_1000C9178;
                      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
                      {
                        v27 = v26;
                        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "name"));
                        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)&buf[4] = v28;
                        *(_WORD *)&buf[12] = 2114;
                        *(_QWORD *)&buf[14] = v29;
                        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" supports service \"%{public}@\", buf, 0x16u);

                      }
                      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
                      objc_msgSend(v30, "setObject:forKey:", v25, v13);

                    }
                  }
                }
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
              }
              while (v18);
            }

          }
          v11 = v38 + 1;
        }
        while ((id)(v38 + 1) != v37);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v37);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v52 = 0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10003A990;
    v40[3] = &unk_1000ADD78;
    v40[4] = buf;
    objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v40);

    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      -[ClientServiceManager setStartPriority:](self, "setStartPriority:", 0);
      -[ClientServiceManager startClientServices](self, "startClientServices");
    }
    else
    {
      v32 = (id)qword_1000C9178;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "name"));
        *(_DWORD *)v49 = 138412290;
        v50 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Didn't find any primary service on peripheral \"%@\", v49, 0xCu);

      }
    }
    _Block_object_dispose(buf, 8);
  }

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v9));

  if (v12)
  {
    if (v10)
    {
      v13 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        v17 = 138412802;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        v21 = 2112;
        v22 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error discovering characteristics for service \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v17, 0x20u);

      }
      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }
    if ((objc_opt_respondsToSelector(v12, "peripheral:didDiscoverCharacteristicsForService:error:") & 1) != 0)
      objc_msgSend(v12, "peripheral:didDiscoverCharacteristicsForService:error:", v8, v9, v10);
  }

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
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "service"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

  if (v13)
  {
    if (v10)
    {
      v14 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        v18 = 138412802;
        v19 = v16;
        v20 = 2112;
        v21 = v17;
        v22 = 2112;
        v23 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error updating value for characteristic \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v18, 0x20u);

      }
      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }
    if ((objc_opt_respondsToSelector(v13, "peripheral:didUpdateValueForCharacteristic:error:") & 1) != 0)
      objc_msgSend(v13, "peripheral:didUpdateValueForCharacteristic:error:", v8, v9, v10);
  }

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
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
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "service"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

  if (v13)
  {
    if (v10)
    {
      v14 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        v18 = 138412802;
        v19 = v16;
        v20 = 2112;
        v21 = v17;
        v22 = 2112;
        v23 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error writing value for characteristic \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v18, 0x20u);

      }
      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }
    if ((objc_opt_respondsToSelector(v13, "peripheral:didWriteValueForCharacteristic:error:") & 1) != 0)
      objc_msgSend(v13, "peripheral:didWriteValueForCharacteristic:error:", v8, v9, v10);
  }

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
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
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "service"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

  if (v13)
  {
    if (v10)
    {
      v14 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        v18 = 138412802;
        v19 = v16;
        v20 = 2112;
        v21 = v17;
        v22 = 2112;
        v23 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error updating notifications for characteristic \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v18, 0x20u);

      }
      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }
    if ((objc_opt_respondsToSelector(v13, "peripheral:didUpdateNotificationStateForCharacteristic:error:") & 1) != 0)
      objc_msgSend(v13, "peripheral:didUpdateNotificationStateForCharacteristic:error:", v8, v9, v10);
  }

}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
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
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "service"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

  if (v13)
  {
    if (v10)
    {
      v14 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        v18 = 138412802;
        v19 = v16;
        v20 = 2112;
        v21 = v17;
        v22 = 2112;
        v23 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error discovering descriptors for characteristic \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v18, 0x20u);

      }
      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }
    if ((objc_opt_respondsToSelector(v13, "peripheral:didDiscoverDescriptorsForCharacteristic:error:") & 1) != 0)
      objc_msgSend(v13, "peripheral:didDiscoverDescriptorsForCharacteristic:error:", v8, v9, v10);
  }

}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientServiceManager clientServiceMap](self, "clientServiceMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "characteristic"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "service"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v13));

  if (v14)
  {
    if (v10)
    {
      v15 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        v19 = 138412802;
        v20 = v17;
        v21 = 2112;
        v22 = v18;
        v23 = 2112;
        v24 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error updating value for descriptor \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v19, 0x20u);

      }
      -[ClientServiceManager analyzeError:](self, "analyzeError:", v10);
    }
    if ((objc_opt_respondsToSelector(v14, "peripheral:didUpdateValueForDescriptor:error:") & 1) != 0)
      objc_msgSend(v14, "peripheral:didUpdateValueForDescriptor:error:", v8, v9, v10);
  }

}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (NSMapTable)clientServiceMap
{
  return self->_clientServiceMap;
}

- (void)setClientServiceMap:(id)a3
{
  objc_storeStrong((id *)&self->_clientServiceMap, a3);
}

- (unint64_t)startPriority
{
  return self->_startPriority;
}

- (void)setStartPriority:(unint64_t)a3
{
  self->_startPriority = a3;
}

- (NSMutableSet)startingClientServices
{
  return self->_startingClientServices;
}

- (void)setStartingClientServices:(id)a3
{
  objc_storeStrong((id *)&self->_startingClientServices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingClientServices, 0);
  objc_storeStrong((id *)&self->_clientServiceMap, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end
