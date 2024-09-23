@implementation BTLEXpcServer

+ (id)instance
{
  if (qword_1000C90F0 != -1)
    dispatch_once(&qword_1000C90F0, &stru_1000AE040);
  return (id)qword_1000C90E8;
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BTLEXpcServer serverConnection](self, "serverConnection"));
  objc_msgSend(v8, "sendMsg:args:", v7, v6);

}

- (void)sendEnableBTSyncMsg:(unsigned __int16)a3 forPeer:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTLEXpcServer serverConnection](self, "serverConnection"));
  v11[0] = CFSTR("kPeerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "msgIdentifier"));

  v11[1] = CFSTR("kPeriod");
  v12[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v4));
  v12[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  objc_msgSend(v7, "sendMsg:args:", CFSTR("EnableBTSync"), v10);

}

- (void)sendSetConnectionParametersMsg:(id)a3 forPeer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[10];
  _QWORD v22[10];

  v6 = a4;
  v7 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTLEXpcServer serverConnection](self, "serverConnection"));
  v21[0] = CFSTR("kPeerIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "msgIdentifier"));

  v22[0] = v20;
  v21[1] = CFSTR("kMinInterval");
  objc_msgSend(v7, "minInterval");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v22[1] = v19;
  v21[2] = CFSTR("kPreferredInterval");
  objc_msgSend(v7, "preferredInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v22[2] = v8;
  v21[3] = CFSTR("kMaxInterval");
  objc_msgSend(v7, "maxInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v22[3] = v9;
  v21[4] = CFSTR("kMinCELength");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "minCELength")));
  v22[4] = v10;
  v21[5] = CFSTR("kMaxCELength");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "maxCELength")));
  v22[5] = v11;
  v21[6] = CFSTR("kPreferredPeripheralLatency");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "preferredPeripheralLatency")));
  v22[6] = v12;
  v21[7] = CFSTR("kMaxPeripheralLatency");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "maxPeripheralLatency")));
  v22[7] = v13;
  v21[8] = CFSTR("kMaxDeferment");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "maxDeferment")));
  v22[8] = v14;
  v21[9] = CFSTR("kTimeout");
  v15 = objc_msgSend(v7, "timeout");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15));
  v22[9] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 10));
  objc_msgSend(v18, "sendMsg:args:", CFSTR("SetConnectionParameters"), v17);

}

- (void)sendDevMgmtPipeConnectedMsg:(id)a3
{
  __CFString *v4;
  CFUUIDRef v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  CFTypeRef v9;

  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
  v5 = CFUUIDCreateFromString(kCFAllocatorDefault, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTLEXpcServer serverConnection](self, "serverConnection"));
  v8 = CFSTR("kPeerIdentifier");
  v9 = CFAutorelease(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  objc_msgSend(v6, "sendMsg:args:", CFSTR("DevMgmtPipeConnected"), v7);

}

- (void)sendDevMgmtPipeDisconnectedMsg:(id)a3
{
  __CFString *v4;
  CFUUIDRef v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  CFTypeRef v9;

  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
  v5 = CFUUIDCreateFromString(kCFAllocatorDefault, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTLEXpcServer serverConnection](self, "serverConnection"));
  v8 = CFSTR("kPeerIdentifier");
  v9 = CFAutorelease(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  objc_msgSend(v6, "sendMsg:args:", CFSTR("DevMgmtPipeDisconnected"), v7);

}

- (void)sendANCSNotificationSourceRegisteredMsg:(id)a3
{
  __CFString *v4;
  CFUUIDRef v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  CFTypeRef v9;

  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
  v5 = CFUUIDCreateFromString(kCFAllocatorDefault, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTLEXpcServer serverConnection](self, "serverConnection"));
  v8 = CFSTR("kPeerIdentifier");
  v9 = CFAutorelease(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  objc_msgSend(v6, "sendMsg:args:", CFSTR("ANCSNotificationSourceRegistered"), v7);

}

- (BTLEXpcServer)init
{
  BTLEXpcServer *v2;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcServer;
  _xpc_connection_s *v5;
  NSObject *v6;
  uint8_t v8[8];
  _QWORD handler[4];
  BTLEXpcServer *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BTLEXpcServer;
  v2 = -[BTLEXpcServer init](&v11, "init");
  if (v2)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.BTServer.le", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    xpcServer = v2->_xpcServer;
    v2->_xpcServer = mach_service;

    v5 = v2->_xpcServer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004B6F8;
    handler[3] = &unk_1000AD928;
    v10 = v2;
    xpc_connection_set_event_handler(v5, handler);
    v6 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting XPC server", v8, 2u);
    }
    xpc_connection_resume(v2->_xpcServer);

  }
  return v2;
}

- (void)handleEvent:(id)a3
{
  id v4;
  xpc_type_t type;
  xpc_type_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    -[BTLEXpcServer handleConnection:](self, "handleConnection:", v4);
  }
  else
  {
    v6 = type;
    v7 = qword_1000C9178;
    v8 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
    if (v6 == (xpc_type_t)&_xpc_type_error)
    {
      if (v8)
        sub_10006FFB0((uint64_t)v4, v7, v9, v10, v11, v12, v13, v14);
    }
    else if (v8)
    {
      sub_100070018((uint64_t)v4, v7, v9, v10, v11, v12, v13, v14);
    }
  }

}

- (void)handleConnection:(id)a3
{
  _xpc_connection_s *v4;
  void *v5;
  void *v6;
  BTLEXpcConnection *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;

  v4 = (_xpc_connection_s *)a3;
  v5 = (void *)xpc_connection_copy_entitlement_value();
  v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v6))
  {
    v7 = -[BTLEXpcConnection initWithConnection:]([BTLEXpcConnection alloc], "initWithConnection:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTLEXpcConnection bundleIdentifier](v7, "bundleIdentifier"));
    v9 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v12[0] = 67109378;
      v12[1] = xpc_connection_get_pid(v4);
      v13 = 2112;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "XPC client set server connection pid %d, bundleID %@", (uint8_t *)v12, 0x12u);

    }
    if ((objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.bluetoothd")) & 1) != 0
      || objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.BTServer")))
    {
      -[BTLEXpcServer setServerConnection:](self, "setServerConnection:", v7);
    }

  }
  else
  {
    v11 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070080(v11);
    xpc_connection_cancel(v4);
  }

}

- (void)handleXpcDisconnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BTLEXpcServer serverConnection](self, "serverConnection"));

  if (v5 == v4)
    -[BTLEXpcServer setServerConnection:](self, "setServerConnection:", 0);
}

- (OS_xpc_object)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
  objc_storeStrong((id *)&self->_xpcServer, a3);
}

- (BTLEXpcConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
}

@end
