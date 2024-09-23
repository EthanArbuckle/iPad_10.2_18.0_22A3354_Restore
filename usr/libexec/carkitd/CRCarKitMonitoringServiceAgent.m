@implementation CRCarKitMonitoringServiceAgent

- (CRCarKitMonitoringServiceAgent)init
{
  CRCarKitMonitoringServiceAgent *v2;
  void *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRCarKitMonitoringServiceAgent;
  v2 = -[CRCarKitMonitoringServiceAgent init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[CRCarKitMonitoringServiceAgent setConnections:](v2, "setConnections:", v3);

    v4 = dispatch_queue_create("com.apple.carkitd.monitoring_transactions", 0);
    -[CRCarKitMonitoringServiceAgent setConnectionsQueue:](v2, "setConnectionsQueue:", v4);

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id from;
  id location;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;

  v19 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.carkit")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRCarKitMonitoringServerService));
    objc_msgSend(v6, "setExportedInterface:", v10);
    objc_msgSend(v6, "setExportedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRCarKitMonitoringClientService));
    objc_msgSend(v6, "setRemoteObjectInterface:", v11);
    objc_initWeak(&location, v6);
    objc_initWeak(&from, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100048504;
    v20[3] = &unk_1000B6558;
    objc_copyWeak(&v21, &from);
    objc_copyWeak(&v22, &location);
    v12 = objc_retainBlock(v20);
    objc_msgSend(v6, "setInterruptionHandler:", v12);
    v13 = CarGeneralLogging(objc_msgSend(v6, "setInvalidationHandler:", v12));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "processIdentifier")));
      *(_DWORD *)buf = 138412802;
      v26 = v6;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Receiving monitoring service connection %@ to service %@ from %@", buf, 0x20u);

    }
    objc_msgSend(v6, "resume");

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    v17 = CarGeneralLogging(v9);
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006E1C0(v6, v10);
  }

  return v8;
}

- (id)userInfoDictionaryForConnection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  if (!v4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5 = CarGeneralLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating a monitoring transaction for %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = (void *)os_transaction_create("com.apple.carkitd.monitoring");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("os-transaction"));

    objc_msgSend(v3, "setUserInfo:", v4);
  }

  return v4;
}

- (BOOL)connection:(id)a3 isMonitoringSerial:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitMonitoringServiceAgent userInfoDictionaryForConnection:](self, "userInfoDictionaryForConnection:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("certificateSerial")));

  if (v8)
    v9 = objc_msgSend(v8, "isEqualToData:", v6);
  else
    v9 = 0;

  return v9;
}

- (void)startMonitoringCertificateSerial:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = CarGeneralLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "start monitoring for %@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  objc_initWeak((id *)buf, self);
  v11 = objc_claimAutoreleasedReturnValue(-[CRCarKitMonitoringServiceAgent connectionsQueue](self, "connectionsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004899C;
  block[3] = &unk_1000B6D80;
  objc_copyWeak(&v17, (id *)buf);
  v12 = v10;
  v15 = v12;
  v13 = v6;
  v16 = v13;
  dispatch_sync(v11, block);

  v7[2](v7);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)stopMonitoringCertificateSerial:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = CarGeneralLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "stop monitoring for %@", (uint8_t *)&v10, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  objc_msgSend(v9, "invalidate");
  v6[2](v6);

}

- (void)handleUpdatedVehicle:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  void *v23;
  id *v24;
  dispatch_queue_global_t global_queue;
  NSObject *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD v34[4];
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD block[6];
  uint8_t v41[4];
  unsigned int v42;
  uint8_t v43[128];
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v6 = a4;
  v27 = a3;
  v28 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "certificateSerialNumber"));
  v9 = CarGeneralLogging(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "going to tell clients that %@ has enabled state %i", buf, 0x12u);

  }
  v12 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v45 = sub_100048EF8;
  v46 = sub_100048F08;
  v47 = 0;
  v13 = objc_claimAutoreleasedReturnValue(-[CRCarKitMonitoringServiceAgent connectionsQueue](self, "connectionsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048F10;
  block[3] = &unk_1000B5750;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(v13, block);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v19 = -[CRCarKitMonitoringServiceAgent connection:isMonitoringSerial:](self, "connection:isMonitoringSerial:", v18, v8);
        if (v19)
        {
          v20 = CarGeneralLogging(v19);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_msgSend(v18, "processIdentifier");
            *(_DWORD *)v41 = 67109120;
            v42 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "policy monitor sending vehicle update to process %d", v41, 8u);
          }

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", &stru_1000B6DA0));
          dispatch_group_enter(v12);
          if (v6)
          {
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472;
            v34[2] = sub_100048FB0;
            v34[3] = &unk_1000B51B8;
            v35 = v12;
            objc_msgSend(v23, "willEnableCertificateSerial:reply:", v8, v34);
            v24 = (id *)&v35;
          }
          else
          {
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100048FB8;
            v32[3] = &unk_1000B51B8;
            v33 = v12;
            objc_msgSend(v23, "willDisableCertificateSerial:reply:", v8, v32);
            v24 = (id *)&v33;
          }

        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v15);
  }

  if (v28)
  {
    global_queue = dispatch_get_global_queue(17, 0);
    v26 = objc_claimAutoreleasedReturnValue(global_queue);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100048FC0;
    v29[3] = &unk_1000B5650;
    v30 = v12;
    v31 = v28;
    dispatch_async(v26, v29);

  }
  _Block_object_dispose(buf, 8);

}

- (void)_addConnection:(id)a3 forCertificateSerial:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRCarKitMonitoringServiceAgent userInfoDictionaryForConnection:](self, "userInfoDictionaryForConnection:", v7));
  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("certificateSerial"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitMonitoringServiceAgent connections](self, "connections"));
  objc_msgSend(v8, "addObject:", v7);

}

- (void)_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitMonitoringServiceAgent userInfoDictionaryForConnection:](self, "userInfoDictionaryForConnection:", v4));
  objc_msgSend(v5, "removeAllObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitMonitoringServiceAgent connections](self, "connections"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  v9 = CarGeneralLogging(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing connection %@", (uint8_t *)&v12, 0xCu);
    }

    v10 = objc_claimAutoreleasedReturnValue(-[CRCarKitMonitoringServiceAgent connections](self, "connections"));
    -[NSObject removeObject:](v10, "removeObject:", v4);
  }
  else if (v11)
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Connection %@ not being monitored by service agent", (uint8_t *)&v12, 0xCu);
  }

}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (OS_dispatch_queue)connectionsQueue
{
  return self->_connectionsQueue;
}

- (void)setConnectionsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionsQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end
