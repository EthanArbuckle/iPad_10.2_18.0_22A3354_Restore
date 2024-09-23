@implementation CBDLocalServiceServer

- (CBDLocalServiceServer)init
{
  CBDLocalServiceServer *v2;
  NSXPCListener *v3;
  NSXPCListener *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBDLocalServiceServer;
  v2 = -[CBDLocalServiceServer init](&v6, "init");
  if (v2)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.checkerboardd"));
    listener = v2->_listener;
    v2->_listener = v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
  }
  return v2;
}

- (void)resume
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Start Local XPC", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer listener](self, "listener"));
  objc_msgSend(v5, "resume");

}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = CheckerBoardLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidate Local XPC", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer listener](self, "listener"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer listener](self, "listener"));
    objc_msgSend(v6, "invalidate");

    -[CBDLocalServiceServer setListener:](self, "setListener:", 0);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;

  v5 = a4;
  v6 = CheckerBoardLogHandleForCategory(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315394;
    v24 = "-[CBDLocalServiceServer listener:shouldAcceptNewConnection:]";
    v25 = 2112;
    v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v23, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.checkerboardd")));
  v10 = objc_opt_class(NSNumber, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0 && objc_msgSend(v8, "BOOLValue"))
  {
    -[CBDLocalServiceServer setConnection:](self, "setConnection:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBLocalServiceInterface clientInterface](CBLocalServiceInterface, "clientInterface"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));
    objc_msgSend(v12, "setRemoteObjectInterface:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBLocalServiceInterface serverInterface](CBLocalServiceInterface, "serverInterface"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));
    objc_msgSend(v14, "setExportedInterface:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));
    objc_msgSend(v15, "setExportedObject:", self);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));
    objc_msgSend(v16, "setInterruptionHandler:", &stru_10000C5B0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));
    objc_msgSend(v17, "setInvalidationHandler:", &stru_10000C5D0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));
    objc_msgSend(v18, "resume");

    v19 = 1;
  }
  else
  {
    v20 = CheckerBoardLogHandleForCategory(11);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = CFSTR("com.apple.checkerboardd");
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Incoming connection not entitled. The [%@] entitlement is required.", (uint8_t *)&v23, 0xCu);
    }

    objc_msgSend(v5, "invalidate");
    v19 = 0;
  }

  return v19;
}

- (void)ping:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)setProxyServer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100005AC8;
    v17[3] = &unk_10000C5F8;
    v10 = v7;
    v18 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17));

    v12 = CheckerBoardLogHandleForCategory(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Local XPC - Pass SocksProxy info to client", buf, 2u);
    }

    objc_msgSend(v11, "setProxyServer:completion:", v6, v10);
    v14 = v18;
  }
  else
  {
    v15 = CheckerBoardLogHandleForCategory(11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Local XPC - connection is nil.", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.checkerboardd.localServiceDaemonXPCErrorDomain"), 2, 0));
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }

}

- (void)startDiagnosticsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDLocalServiceServer connection](self, "connection"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005D20;
    v14[3] = &unk_10000C5F8;
    v7 = v4;
    v15 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14));

    v9 = CheckerBoardLogHandleForCategory(11);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Local XPC - send moveToDiagnosticsApp to client", buf, 2u);
    }

    objc_msgSend(v8, "moveToDiagnosticsAppWithcompletion:", v7);
    v11 = v15;
  }
  else
  {
    v12 = CheckerBoardLogHandleForCategory(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Local XPC - connection is nil.", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.checkerboardd.localServiceDaemonXPCErrorDomain"), 2, 0));
    (*((void (**)(id, void *))v4 + 2))(v4, v11);
  }

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
