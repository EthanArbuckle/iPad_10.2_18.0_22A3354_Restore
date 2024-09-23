@implementation LoggingManager

- (LoggingManager)init
{
  LoggingManager *v2;
  LoggingManager *v3;
  NSTimer *loggingTimeoutTimer;
  uint64_t v5;
  NSMutableArray *requestedUUIDs;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcServer;
  OS_xpc_object *xpcConnection;
  _xpc_connection_s *v10;
  LoggingManager *v11;
  _xpc_connection_s *v12;
  _QWORD handler[4];
  LoggingManager *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)LoggingManager;
  v2 = -[LoggingManager init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    loggingTimeoutTimer = v2->loggingTimeoutTimer;
    v2->loggingTimeoutTimer = 0;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    requestedUUIDs = v3->_requestedUUIDs;
    v3->_requestedUUIDs = (NSMutableArray *)v5;

    mach_service = xpc_connection_create_mach_service("com.apple.BTLELoggingManager.xpc", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    xpcServer = v3->_xpcServer;
    v3->_xpcServer = mach_service;

    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = 0;

    v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcServer](v3, "xpcServer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100030138;
    handler[3] = &unk_1000AD928;
    v11 = v3;
    v15 = v11;
    xpc_connection_set_event_handler(v10, handler);

    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcServer](v11, "xpcServer"));
    xpc_connection_resume(v12);

  }
  return v3;
}

+ (id)instance
{
  if (qword_1000C9090 != -1)
    dispatch_once(&qword_1000C9090, &stru_1000ADAE8);
  return (id)qword_1000C9088;
}

- (BOOL)wasUUIDRequestedForLogRetrieval:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LoggingManager requestedUUIDs](self, "requestedUUIDs"));
  objc_sync_enter(v5);
  LOBYTE(self) = -[NSMutableArray containsObject:](self->_requestedUUIDs, "containsObject:", v4);
  objc_sync_exit(v5);

  return (char)self;
}

- (BOOL)isXpcConnected
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcConnection](self, "xpcConnection"));
  v3 = v2 != 0;

  return v3;
}

- (void)handleServerEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_connection)
  {
    -[LoggingManager handleConnection:](self, "handleConnection:", v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006D2D8();
  }

}

- (void)handleConnection:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  _QWORD handler[5];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = v4;
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LoggingManager - XPC connection: %p %@", buf, 0x16u);
  }
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcServer](self, "xpcServer"));
  xpc_connection_suspend(v6);

  -[LoggingManager setXpcConnection:](self, "setXpcConnection:", v4);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcConnection](self, "xpcConnection"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100030410;
  handler[3] = &unk_1000AD928;
  handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);

  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcConnection](self, "xpcConnection"));
  xpc_connection_resume(v8);

}

- (void)handleDisconnection
{
  void *v3;
  NSObject *v4;
  void *v5;
  _xpc_connection_s *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcConnection](self, "xpcConnection"));
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LoggingManager - XPC disconnection: %@", (uint8_t *)&v8, 0xCu);

  }
  -[LoggingManager setXpcConnection:](self, "setXpcConnection:", 0);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcServer](self, "xpcServer"));
  xpc_connection_resume(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  objc_msgSend(v7, "stopTapToRadar");

  -[LoggingManager cleanup](self, "cleanup");
}

- (void)handleConnectionEvent:(id)a3
{
  id v4;
  xpc_type_t type;

  v4 = a3;
  type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[LoggingManager handleMsg:](self, "handleMsg:", v4);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      -[LoggingManager handleDisconnection](self, "handleDisconnection");
    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006D338();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006D398();
  }

}

- (void)handleMsg:(id)a3
{
  id v4;
  const char *string;
  xpc_object_t value;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;

  v4 = a3;
  string = xpc_dictionary_get_string(v4, "kMsgId");
  value = xpc_dictionary_get_value(v4, "kMsgArgs");
  v7 = (void *)objc_claimAutoreleasedReturnValue(value);

  v8 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcConnection](self, "xpcConnection"));
    v11 = 134218242;
    v12 = v10;
    v13 = 2080;
    v14 = string;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "LoggingManager - Received XPC message from %p: %s", (uint8_t *)&v11, 0x16u);

  }
  if (!strcmp(string, "RetrieveLogs") && v7)
  {
    -[LoggingManager handleLogRetrievalRequest:](self, "handleLogRetrievalRequest:", v7);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006D3F8();
  }

}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _xpc_connection_s *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = objc_retainAutorelease(v6);
  xpc_dictionary_set_string(v8, "kMsgId", (const char *)objc_msgSend(v9, "UTF8String"));
  if (v7)
    xpc_dictionary_set_value(v8, "kMsgArgs", v7);
  v10 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcConnection](self, "xpcConnection"));
    v14 = 134218242;
    v15 = v12;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "LoggingManager - sending XPC message to %p: %@", (uint8_t *)&v14, 0x16u);

  }
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcConnection](self, "xpcConnection"));
  xpc_connection_send_message(v13, v8);

}

- (void)handleLogRetrievalRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  size_t v9;
  unsigned __int8 v10;
  const char *string;
  id v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  size_t count;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v22;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (char *)objc_claimAutoreleasedReturnValue(-[LoggingManager xpcConnection](self, "xpcConnection"));
    *(_DWORD *)buf = 134217984;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LoggingManager - handleLogRetrievalRequest Received RetrieveLogs XPC message from %p", buf, 0xCu);

  }
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_array)
  {
    if (xpc_array_get_count(v4))
    {
      v9 = 0;
      v10 = 0;
      do
      {
        string = xpc_array_get_string(v4, v9);
        if (string)
        {
          v12 = objc_alloc((Class)NSUUID);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
          v14 = objc_msgSend(v12, "initWithUUIDString:", v13);

          if (v14)
          {
            v15 = self->_requestedUUIDs;
            objc_sync_enter(v15);
            -[NSMutableArray addObject:](self->_requestedUUIDs, "addObject:", v14);
            objc_sync_exit(v15);

            v16 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
            objc_msgSend(v16, "setOpportunisticConnection:forAccessoryUUID:", 0, v14);

          }
          else
          {
            v18 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v22 = string;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "LoggingManager - handleLogRetrievalRequest Invalid UUID %s", buf, 0xCu);
            }
          }

        }
        else
        {
          v17 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v22) = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "LoggingManager - handleLogRetrievalRequest Unexpected XPC object at index %u", buf, 8u);
          }
        }
        count = xpc_array_get_count(v4);
        v9 = ++v10;
      }
      while (count > v10);
    }
  }
  else
  {
    v8 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006D458(v8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030BC0;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)logRetrievalComplete
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSURLResourceKey v7;
  id v8;
  os_log_t *v9;
  id v10;
  uint64_t v11;
  NSURLFileResourceType v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unsigned int v17;
  os_log_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  os_log_t *v22;
  NSObject *v23;
  void *v24;
  id v25;
  xpc_object_t v26;
  os_log_t v27;
  NSObject *v28;
  size_t count;
  void *v30;
  void *v31;
  void *v32;
  xpc_object_t xarray;
  id v35;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[4];
  uint64_t v43;
  uint8_t buf[4];
  size_t v45;
  _BYTE v46[128];
  NSURLResourceKey v47;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  objc_msgSend(v2, "stopTapToRadar");

  xarray = xpc_array_create_empty();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uarpLogPath"));
  v6 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));

  v7 = NSURLFileResourceTypeKey;
  v47 = NSURLFileResourceTypeKey;
  v31 = (void *)v6;
  v32 = v3;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  v9 = (os_log_t *)&qword_1000C9178;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v39;
    v12 = NSURLFileResourceTypeRegular;
    do
    {
      v13 = 0;
      v35 = v10;
      do
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v13);
        v15 = objc_autoreleasePoolPush();
        v37 = 0;
        objc_msgSend(v14, "getResourceValue:forKey:error:", &v37, v7, 0);
        v16 = v37;
        v17 = objc_msgSend(v16, "isEqualToString:", v12);
        v18 = *v9;
        if (v17)
        {
          v19 = v12;
          v20 = v11;
          v21 = v7;
          v22 = v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v18;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
            *(_DWORD *)buf = 138412290;
            v45 = (size_t)v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "LoggingManager - file path: %@", buf, 0xCu);

          }
          v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path")));
          v26 = xpc_string_create((const char *)objc_msgSend(v25, "UTF8String"));

          xpc_array_append_value(xarray, v26);
          v9 = v22;
          v7 = v21;
          v11 = v20;
          v12 = v19;
          v10 = v35;
        }
        else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          sub_10006D498(v42, v18, v14, &v43);
        }

        objc_autoreleasePoolPop(v15);
        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v10);
  }

  v27 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    count = xpc_array_get_count(xarray);
    *(_DWORD *)buf = 134217984;
    v45 = count;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "LoggingManager - logRetrievalComplete Preparing to dispatch %lu file(s)", buf, 0xCu);

  }
  -[LoggingManager sendMsg:args:](self, "sendMsg:args:", CFSTR("RetrievedLogs"), xarray);
  -[LoggingManager cleanup](self, "cleanup");

}

- (void)cleanup
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSTimer **p_loggingTimeoutTimer;
  NSTimer *loggingTimeoutTimer;
  NSTimer *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = self->_requestedUUIDs;
  objc_sync_enter(v3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_requestedUUIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance", (_QWORD)v13));
        objc_msgSend(v9, "setOpportunisticConnection:forAccessoryUUID:", 1, v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_requestedUUIDs, "removeAllObjects");
  objc_sync_exit(v3);

  loggingTimeoutTimer = self->loggingTimeoutTimer;
  p_loggingTimeoutTimer = &self->loggingTimeoutTimer;
  -[NSTimer invalidate](loggingTimeoutTimer, "invalidate");
  v12 = *p_loggingTimeoutTimer;
  *p_loggingTimeoutTimer = 0;

}

- (OS_xpc_object)xpcServer
{
  return self->_xpcServer;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSMutableArray)requestedUUIDs
{
  return self->_requestedUUIDs;
}

- (void)setRequestedUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_requestedUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedUUIDs, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->loggingTimeoutTimer, 0);
}

@end
