@implementation GTServiceDaemon

- (GTServiceDaemon)init
{
  GTServiceDaemon *v2;
  os_log_t v3;
  OS_os_log *log;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSString *daemonId;
  uint64_t v9;
  NSString *deviceUDID;
  NSMutableDictionary *v11;
  NSMutableDictionary *portToConnection;
  NSMutableDictionary *v13;
  NSMutableDictionary *portToDispatcher;
  GTConnectionMap *v15;
  GTConnectionMap *connectionMap;
  dispatch_queue_t v17;
  OS_dispatch_queue *serialQueue;
  GTServiceVendor *v19;
  GTServiceVendor *serviceVendor;
  uint8_t v22[16];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)GTServiceDaemon;
  v2 = -[GTServiceDaemon init](&v23, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.gputools.transport", "ServiceDaemon");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Agent Launched", v22, 2u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    daemonId = v2->_daemonId;
    v2->_daemonId = (NSString *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](GTDeviceProperties, "uniqueDeviceID"));
    deviceUDID = v2->_deviceUDID;
    v2->_deviceUDID = (NSString *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    portToConnection = v2->_portToConnection;
    v2->_portToConnection = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    portToDispatcher = v2->_portToDispatcher;
    v2->_portToDispatcher = v13;

    v15 = objc_alloc_init(GTConnectionMap);
    connectionMap = v2->_connectionMap;
    v2->_connectionMap = v15;

    v17 = dispatch_queue_create("com.apple.gputoolsserviced.main", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v17;

    v19 = -[GTServiceVendor initWithConnectionProvider:]([GTServiceVendor alloc], "initWithConnectionProvider:", v2);
    serviceVendor = v2->_serviceVendor;
    v2->_serviceVendor = v19;

    -[GTServiceDaemon registerServices](v2, "registerServices");
  }
  return v2;
}

- (void)registerServices
{
  GTServiceProvider *v3;
  GTServiceProvider *serviceProvider;
  GTServiceProperties *v5;
  GTServiceProviderXPCDispatcher *v6;
  NSMutableDictionary *portToDispatcher;
  void *v8;
  GTServiceProperties *v9;
  GTLaunchService *v10;
  GTLaunchServiceXPCDispatcher *v11;
  NSMutableDictionary *v12;
  void *v13;
  GTServiceProperties *v14;
  GTDeviceCapabilities *v15;
  GTDeviceCapabilitiesXPCDispatcher *v16;
  NSMutableDictionary *v17;
  void *v18;
  GTServiceProperties *v19;
  GTURLAccessProvider *v20;
  GTURLAccessProviderXPCDispatcher *v21;
  NSMutableDictionary *v22;
  void *v23;
  GTServiceProperties *v24;
  GTLoopbackService *v25;
  GTLoopbackServiceXPCDispatcher *v26;
  NSMutableDictionary *v27;
  void *v28;
  GTProcessInfo *v29;

  v29 = objc_opt_new(GTProcessInfo);
  v3 = objc_alloc_init(GTServiceProvider);
  serviceProvider = self->_serviceProvider;
  self->_serviceProvider = v3;

  v5 = -[GTServiceProperties initWithProtocol:]([GTServiceProperties alloc], "initWithProtocol:", &OBJC_PROTOCOL___GTServiceProvider);
  -[GTServiceProperties setVersion:](v5, "setVersion:", 2);
  -[GTServiceProvider registerDefaultServiceProvider:forProcess:](self->_serviceProvider, "registerDefaultServiceProvider:forProcess:", v5, v29);
  -[GTServiceVendor addLocalService:forPort:](self->_serviceVendor, "addLocalService:forPort:", self->_serviceProvider, -[GTServiceProperties servicePort](v5, "servicePort"));
  v6 = -[GTServiceProviderXPCDispatcher initWithService:properties:]([GTServiceProviderXPCDispatcher alloc], "initWithService:properties:", self->_serviceProvider, v5);
  -[GTServiceProviderXPCDispatcher setConnections:](v6, "setConnections:", self->_portToConnection);
  portToDispatcher = self->_portToDispatcher;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[GTServiceProperties servicePort](v5, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](portToDispatcher, "setObject:forKeyedSubscript:", v6, v8);

  v9 = -[GTServiceProperties initWithProtocol:]([GTServiceProperties alloc], "initWithProtocol:", &OBJC_PROTOCOL___GTLaunchService);
  -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", v9, v29);
  v10 = -[GTLaunchService initWithServiceProvider:]([GTLaunchService alloc], "initWithServiceProvider:", self->_serviceProvider);
  -[GTServiceVendor addLocalService:forPort:](self->_serviceVendor, "addLocalService:forPort:", v10, -[GTServiceProperties servicePort](v9, "servicePort"));
  v11 = -[GTLaunchServiceXPCDispatcher initWithService:properties:]([GTLaunchServiceXPCDispatcher alloc], "initWithService:properties:", v10, v9);
  v12 = self->_portToDispatcher;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[GTServiceProperties servicePort](v9, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  v14 = -[GTServiceProperties initWithProtocol:]([GTServiceProperties alloc], "initWithProtocol:", &OBJC_PROTOCOL___GTDeviceCapabilities);
  -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", v14, v29);
  v15 = objc_alloc_init(GTDeviceCapabilities);
  -[GTServiceVendor addLocalService:forPort:](self->_serviceVendor, "addLocalService:forPort:", v15, -[GTServiceProperties servicePort](v14, "servicePort"));
  v16 = -[GTDeviceCapabilitiesXPCDispatcher initWithService:properties:]([GTDeviceCapabilitiesXPCDispatcher alloc], "initWithService:properties:", v15, v14);
  v17 = self->_portToDispatcher;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[GTServiceProperties servicePort](v14, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

  v19 = -[GTServiceProperties initWithProtocol:]([GTServiceProperties alloc], "initWithProtocol:", &OBJC_PROTOCOL___GTURLAccessProvider);
  -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", v19, v29);
  v20 = -[GTURLAccessProvider initWithServiceProvider:connectionProvider:serviceVendor:]([GTURLAccessProvider alloc], "initWithServiceProvider:connectionProvider:serviceVendor:", self->_serviceProvider, self, self->_serviceVendor);
  -[GTServiceVendor addLocalService:forPort:](self->_serviceVendor, "addLocalService:forPort:", v20, -[GTServiceProperties servicePort](v19, "servicePort"));
  v21 = -[GTURLAccessProviderXPCDispatcher initWithService:properties:]([GTURLAccessProviderXPCDispatcher alloc], "initWithService:properties:", v20, v19);
  v22 = self->_portToDispatcher;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[GTServiceProperties servicePort](v19, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v21, v23);

  v24 = -[GTServiceProperties initWithProtocol:]([GTServiceProperties alloc], "initWithProtocol:", &OBJC_PROTOCOL___GTLoopbackService);
  -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", v24, v29);
  v25 = objc_alloc_init(GTLoopbackService);
  -[GTServiceVendor addLocalService:forPort:](self->_serviceVendor, "addLocalService:forPort:", v25, -[GTServiceProperties servicePort](v24, "servicePort"));
  v26 = -[GTLoopbackServiceXPCDispatcher initWithService:properties:]([GTLoopbackServiceXPCDispatcher alloc], "initWithService:properties:", v25, v24);
  v27 = self->_portToDispatcher;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[GTServiceProperties servicePort](v24, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v26, v28);

}

- (void)enterRunLoop
{
  _xpc_connection_s *mach_service;
  _QWORD handler[5];

  mach_service = xpc_connection_create_mach_service("com.apple.gputools.service", (dispatch_queue_t)self->_serialQueue, 1uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100019FEC;
  handler[3] = &unk_100030E60;
  handler[4] = self;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_activate(mach_service);
  dispatch_main();
}

- (void)handleConnection:(id)a3
{
  id v4;
  char *v5;
  OS_os_log *log;
  NSObject *v7;
  GTEntitlementCheckingConnection *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  char *v14;

  v4 = a3;
  v5 = xpc_copy_description(v4);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Connection: New:%s", buf, 0xCu);
  }
  free(v5);
  v7 = dispatch_queue_create("com.apple.gputoolsserviced.connectionTarget", 0);
  xpc_connection_set_target_queue((xpc_connection_t)v4, v7);
  v8 = -[GTEntitlementCheckingConnection initWithTransactionScopedXPCConnection:messageQueue:]([GTEntitlementCheckingConnection alloc], "initWithTransactionScopedXPCConnection:messageQueue:", v4, self->_serialQueue);

  -[GTConnectionMap insert:](self->_connectionMap, "insert:", v8);
  objc_initWeak((id *)buf, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100019F50;
  v11[3] = &unk_100030E88;
  objc_copyWeak(&v12, (id *)buf);
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100019FA4;
  v9[3] = &unk_100030E88;
  objc_copyWeak(&v10, (id *)buf);
  v9[4] = self;
  -[GTLocalXPCConnection activateWithMessageHandler:andErrorHandler:](v8, "activateWithMessageHandler:andErrorHandler:", v11, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

- (void)handleDisconnection:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  OS_os_log *log;
  void *v8;
  int v9;
  char *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connection"));
  v6 = xpc_copy_description(v5);

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Connection: Disconnect:%s", (uint8_t *)&v9, 0xCu);
  }
  free(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_portToConnection, "allKeysForObject:", v4));
  -[GTServiceProvider disconnectServicePorts:](self->_serviceProvider, "disconnectServicePorts:", v8);
  -[NSMutableDictionary removeObjectsForKeys:](self->_portToConnection, "removeObjectsForKeys:", v8);
  -[GTServiceDaemon broadcastDisconnection:connectionId:](self, "broadcastDisconnection:connectionId:", v4, -[GTConnectionMap remove:](self->_connectionMap, "remove:", v4));

}

- (void)broadcastDisconnection:(id)a3 connectionId:(unint64_t)a4
{
  id v6;
  OS_os_log *log;
  xpc_object_t empty;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  unint64_t v31;

  v6 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v31 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Broadcast Disconnection of Connection ID %lu", buf, 0xCu);
  }
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_flag(empty, "_flags", 1);
  xpc_dictionary_set_flag(empty, "_flags", 2);
  xpc_dictionary_set_string(empty, "_cmd", "broadcastDisconnect");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = self->_portToDispatcher;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_portToDispatcher, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i)));
        objc_msgSend(v14, "dispatchMessage:replyConnection:", empty, v6);

      }
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v11);
  }

  MessagePathPush(empty, a4);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTConnectionMap connections](self->_connectionMap, "connections", 0));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), "sendMessage:", empty);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (BOOL)deviceIsHandledLocally:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  BOOL v7;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = sub_100019F1C(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6
    || -[NSString isEqualToString:](self->_deviceUDID, "isEqualToString:", v6)
    || (xpc_dictionary_get_flag(v4, "_flags", 4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
    v10 = filteredArrayByService(v9, (Protocol *)&OBJC_PROTOCOL___GTSimulatorDeviceBrowser);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (objc_msgSend(v11, "count"))
    {
      v7 = 0;
    }
    else
    {
      v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v6);
      v7 = v12 != 0;

    }
  }

  return v7;
}

- (void)handleMessage:(id)a3 fromConnection:(id)a4
{
  id v6;
  id v7;
  BOOL IsValid;
  id v9;
  OS_os_log *v10;
  uint64_t v11;
  GTConnectionMap *connectionMap;
  unsigned int v13;
  id v14;
  OS_os_log *log;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t uint64;
  NSMutableDictionary *portToConnection;
  void *v21;
  NSMutableDictionary *portToDispatcher;
  void *v23;
  OS_os_log *v24;
  xpc_object_t reply;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  NSErrorUserInfoKey v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;

  v6 = a3;
  v7 = a4;
  v31 = 0;
  IsValid = MessageIsValid(v6, &v31);
  v9 = v31;
  if (IsValid)
  {
    self->_currentRemoteRelayPort = xpc_dictionary_get_uint64(v6, "_remoteDeviceRelayPort");
    self->_currentRemoteRelayPid = xpc_dictionary_get_uint64(v6, "_remoteDeviceRelayPid");
    if (xpc_dictionary_get_flag(v6, "_flags", 3))
    {
      -[GTServiceDaemon handleMessageDaemon:fromConnection:](self, "handleMessageDaemon:fromConnection:", v6, v7);
      goto LABEL_26;
    }
    if (xpc_dictionary_get_flag(v6, "_flags", 1))
    {
      -[GTServiceDaemon handleMessageBroadcast:fromConnection:](self, "handleMessageBroadcast:fromConnection:", v6, v7);
      goto LABEL_26;
    }
    if (MessageIsStreamReply(v6))
    {
      v11 = MessagePathPop(v6);
      connectionMap = self->_connectionMap;
      v30 = 0;
      v13 = -[GTConnectionMap retrieveConnection:forId:](connectionMap, "retrieveConnection:forId:", &v30, v11);
      v14 = v30;
      if (!v13)
      {
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v35 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "Missing connection for ID: %llu", buf, 0xCu);
        }
        goto LABEL_25;
      }
      goto LABEL_17;
    }
    if (!-[GTServiceDaemon deviceIsHandledLocally:](self, "deviceIsHandledLocally:", v6))
    {
      v16 = sub_100019F1C(v6);
      v14 = (id)objc_claimAutoreleasedReturnValue(v16);
      v17 = objc_claimAutoreleasedReturnValue(-[GTServiceDaemon connectionForDeviceUDID:](self, "connectionForDeviceUDID:", v14));
      if (v17)
      {
        v18 = (void *)v17;
        -[GTServiceDaemon updateAndRelayMessage:fromConnection:toConnection:](self, "updateAndRelayMessage:fromConnection:toConnection:", v6, v7, v17);
        goto LABEL_24;
      }

    }
    uint64 = xpc_dictionary_get_uint64(v6, "_port");
    portToConnection = self->_portToConnection;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", uint64));
    v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToConnection, "objectForKeyedSubscript:", v21));

    if (v14)
    {
LABEL_17:
      -[GTServiceDaemon updateAndRelayMessage:fromConnection:toConnection:](self, "updateAndRelayMessage:fromConnection:toConnection:", v6, v7, v14);
LABEL_25:

      goto LABEL_26;
    }
    portToDispatcher = self->_portToDispatcher;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", uint64));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToDispatcher, "objectForKeyedSubscript:", v23));

    if (v18)
    {
      objc_msgSend(v18, "dispatchMessage:replyConnection:", v6, v7);
    }
    else
    {
      v24 = self->_log;
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v35 = uint64;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_DEBUG, "Message unhandled - servicePort:%llu", buf, 0xCu);
      }
      if (MessageHasReply(v6))
      {
        reply = gt_xpc_dictionary_create_reply(v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue(reply);
        v32 = NSLocalizedDescriptionKey;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Target destination for message doesn't exist")));
        v33 = v27;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 2, v28));

        xpc_dictionary_set_nserror(v26, "_error", v29);
        objc_msgSend(v7, "sendMessage:", v26);

      }
    }
LABEL_24:

    goto LABEL_25;
  }
  v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "Invalid message", buf, 2u);
  }
LABEL_26:

}

- (void)handleMessageDaemon:(id)a3 fromConnection:(id)a4
{
  id v5;
  xpc_object_t reply;
  GTProcessInfo *v7;
  xpc_object_t xdict;

  xdict = a3;
  v5 = a4;
  if (xpc_dictionary_get_uint64(xdict, "_daemon") == 1)
  {
    reply = xpc_dictionary_create_reply(xdict);
    v7 = objc_opt_new(GTProcessInfo);
    xpc_dictionary_set_nsobject(reply, "processInfo", (uint64_t)v7);

LABEL_5:
    objc_msgSend(v5, "sendMessage:", reply);

    goto LABEL_6;
  }
  if (MessageHasReply(xdict))
  {
    reply = xpc_dictionary_create_reply(xdict);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)handleMessageBroadcast:(id)a3 fromConnection:(id)a4
{
  id v6;
  id v7;
  OS_os_log *log;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  OS_os_log *v23;
  uint8_t v24[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v6 = a3;
  v7 = a4;
  if (MessageVisit(v6, -[NSString UTF8String](self->_daemonId, "UTF8String")))
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Handle broadcast", buf, 2u);
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = self->_portToDispatcher;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_portToDispatcher, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i)));
          objc_msgSend(v14, "dispatchMessage:replyConnection:", v6, v7);

        }
        v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v11);
    }

    *(_QWORD *)buf = 0;
    if (-[GTConnectionMap retrieveId:forConnection:](self->_connectionMap, "retrieveId:forConnection:", buf, v7))
    {
      -[GTServiceDaemon updateMessage:sourceConnection:](self, "updateMessage:sourceConnection:", v6, v7);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTConnectionMap connections](self->_connectionMap, "connections"));
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "connection"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));

            if (v21 != v22)
              -[GTServiceDaemon relayMessage:fromConnection:toConnection:](self, "relayMessage:fromConnection:toConnection:", v6, v7, v20);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        }
        while (v17);
      }

    }
    else
    {
      v23 = self->_log;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "Missing ID for active connection", v24, 2u);
      }
    }
  }

}

- (void)updateMessagePath:(id)a3 sourceConnection:(id)a4
{
  id v6;
  id v7;
  OS_os_log *log;
  uint8_t v9[8];
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  if (MessageRecordsPathHistory(v6))
  {
    v10 = 0;
    if (-[GTConnectionMap retrieveId:forConnection:](self->_connectionMap, "retrieveId:forConnection:", &v10, v7))
    {
      MessagePathPush(v6, v10);
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "Missing ID for active connection", v9, 2u);
      }
    }
  }

}

- (void)patchMessage:(id)a3
{
  id v4;
  xpc_object_t value;
  void *v6;
  uint64_t v7;
  void *nsobject;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  OS_os_log *log;
  id v29;
  uint8_t buf[4];
  id v31;

  v4 = a3;
  if (xpc_dictionary_get_flag(v4, "_flags", 5))
  {
    value = xpc_dictionary_get_value(v4, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v6)
    {
      v7 = objc_opt_class(GTCaptureResponse);
      nsobject = xpc_dictionary_get_nsobject(v4, "response", v7);
      if (nsobject)
      {
        v9 = objc_alloc((Class)NSSet);
        v10 = objc_opt_class(NSDictionary);
        v11 = objc_opt_class(NSString);
        v12 = objc_opt_class(NSURL);
        v13 = objc_opt_class(NSData);
        v14 = objc_msgSend(v9, "initWithObjects:", v10, v11, v12, v13, objc_opt_class(NSError), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(nsobject, "data"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v14, v15, 0));
        v17 = objc_msgSend(v16, "mutableCopy");

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("archiveURL")));
          v19 = v18;
          if (v18)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "host"));
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("localhost"));

            if (v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v19, 1));
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](GTDeviceProperties, "uniqueDeviceID"));
              objc_msgSend(v22, "setHost:", v23);

              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URL"));
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("archiveURL"));

              v29 = 0;
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v29));
              v26 = v29;
              objc_msgSend(nsobject, "setData:", v25);

              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(nsobject, "data"));
              if (!v27)
              {
                log = self->_log;
                if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v31 = v26;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "Failed to patch message, %@", buf, 0xCu);
                }
                objc_msgSend(nsobject, "setError:", v26);
              }
              xpc_dictionary_set_nsobject(v4, "response", (uint64_t)nsobject);

            }
          }

        }
      }

    }
  }

}

- (void)updateMessage:(id)a3 sourceConnection:(id)a4
{
  id v6;

  v6 = a3;
  -[GTServiceDaemon updateMessagePath:sourceConnection:](self, "updateMessagePath:sourceConnection:", v6, a4);
  -[GTServiceDaemon patchMessage:](self, "patchMessage:", v6);

}

- (void)relayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t reply;
  id v12;
  _QWORD v13[4];
  id v14;
  GTServiceDaemon *v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (MessageHasReply(v8))
  {
    reply = gt_xpc_dictionary_create_reply(v8);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100019E6C;
    v13[3] = &unk_100030ED8;
    v14 = (id)objc_claimAutoreleasedReturnValue(reply);
    v15 = self;
    v16 = v10;
    v17 = v9;
    v12 = v14;
    objc_msgSend(v16, "sendMessage:replyHandler:", v8, v13);

  }
  else
  {
    objc_msgSend(v10, "sendMessage:", v8);
  }

}

- (void)updateAndRelayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[GTServiceDaemon updateMessage:sourceConnection:](self, "updateMessage:sourceConnection:", v10, v9);
  -[GTServiceDaemon relayMessage:fromConnection:toConnection:](self, "relayMessage:fromConnection:toConnection:", v10, v9, v8);

}

- (id)connectionForDeviceUDID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSMutableDictionary *portToConnection;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GTRelayedXPCConnection *v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
    v5 = filteredArrayByService(v4, (Protocol *)&OBJC_PROTOCOL___GTRemoteDeviceRelay);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (!objc_msgSend(v6, "count"))
    {
      v12 = 0;
LABEL_18:

      return v12;
    }
    if (objc_msgSend(v6, "count") == (id)1)
    {
      portToConnection = self->_portToConnection;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceProperties"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "servicePort")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToConnection, "objectForKeyedSubscript:", v10));

      v12 = -[GTRelayedXPCConnection initWithConnection:relayPort:relayPid:]([GTRelayedXPCConnection alloc], "initWithConnection:relayPort:relayPid:", v11, self->_currentRemoteRelayPort, LODWORD(self->_currentRemoteRelayPid));
LABEL_17:

      goto LABEL_18;
    }
    v13 = filteredArrayByPort(v6, (id)self->_currentRemoteRelayPort);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (objc_msgSend(v11, "count"))
    {
      if (objc_msgSend(v11, "count") != (id)1)
      {
        v20 = filteredArrayByPID(v11, self->_currentRemoteRelayPid);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (objc_msgSend(v19, "count"))
        {
          objc_msgSend(v19, "count");
          v21 = self->_portToConnection;
          v22 = v19;
        }
        else
        {
          v21 = self->_portToConnection;
          v22 = v11;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "serviceProperties"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v24, "servicePort")));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v25));

        v12 = -[GTRelayedXPCConnection initWithConnection:relayPort:relayPid:]([GTRelayedXPCConnection alloc], "initWithConnection:relayPort:relayPid:", v26, self->_currentRemoteRelayPort, LODWORD(self->_currentRemoteRelayPid));
        goto LABEL_16;
      }
      v14 = self->_portToConnection;
      v15 = v11;
    }
    else
    {
      v14 = self->_portToConnection;
      v15 = v6;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceProperties"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v17, "servicePort")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v18));

    v12 = -[GTRelayedXPCConnection initWithConnection:relayPort:relayPid:]([GTRelayedXPCConnection alloc], "initWithConnection:relayPort:relayPid:", v19, self->_currentRemoteRelayPort, LODWORD(self->_currentRemoteRelayPid));
LABEL_16:

    goto LABEL_17;
  }
  v12 = 0;
  return v12;
}

- (id)connectionForServicePort:(unint64_t)a3
{
  NSMutableDictionary *portToConnection;
  void *v4;
  void *v5;

  portToConnection = self->_portToConnection;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToConnection, "objectForKeyedSubscript:", v4));

  return v5;
}

- (unint64_t)currentRemoteRelayPid
{
  return self->_currentRemoteRelayPid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceVendor, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_connectionMap, 0);
  objc_storeStrong((id *)&self->_portToConnection, 0);
  objc_storeStrong((id *)&self->_portToDispatcher, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_daemonId, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
