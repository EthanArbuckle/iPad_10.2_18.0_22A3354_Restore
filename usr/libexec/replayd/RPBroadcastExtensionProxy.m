@implementation RPBroadcastExtensionProxy

- (RPBroadcastExtensionProxy)initWithBroadcastUploadExtension:(id)a3
{
  id v4;
  RPBroadcastExtensionProxy *v5;
  void *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  RPBroadcastExtensionProxy *v15;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPBroadcastExtensionProxy;
  v5 = -[RPBroadcastExtensionProxy init](&v9, "init");
  if (v5)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "-[RPBroadcastExtensionProxy initWithBroadcastUploadExtension:]";
      v12 = 1024;
      v13 = 41;
      v14 = 2048;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
    -[RPBroadcastExtensionProxy setListener:](v5, "setListener:", v6);

    -[NSXPCListener resume](v5->_listener, "resume");
    -[NSXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCListener endpoint](v5->_listener, "endpoint"));
    -[RPBroadcastExtensionProxy setListenerEndpoint:](v5, "setListenerEndpoint:", v7);

    -[RPBroadcastExtensionProxy setBroadcastUploadExtension:](v5, "setBroadcastUploadExtension:", v4);
  }

  return v5;
}

- (RPBroadcastExtensionProxy)initWithBroadcastUploadListenerEndpoint:(id)a3
{
  id v4;
  RPBroadcastExtensionProxy *v5;
  id v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  RPBroadcastExtensionProxy *v14;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RPBroadcastExtensionProxy;
  v5 = -[RPBroadcastExtensionProxy init](&v8, "init");
  if (v5)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[RPBroadcastExtensionProxy initWithBroadcastUploadListenerEndpoint:]";
      v11 = 1024;
      v12 = 53;
      v13 = 2048;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    if (!v5->_connection)
    {
      v6 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v4);
      -[RPBroadcastExtensionProxy setupNewConnection:](v5, "setupNewConnection:", v6);

    }
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  RPBroadcastExtensionProxy *v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastExtensionProxy dealloc]";
    v6 = 1024;
    v7 = 63;
    v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPBroadcastExtensionProxy;
  -[RPBroadcastExtensionProxy dealloc](&v3, "dealloc");
}

- (void)establishConnectionWithHandler:(id)a3
{
  id v4;
  id v5;
  NSExtension *broadcastUploadExtension;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]";
    v14 = 1024;
    v15 = 67;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d establishing connection to extension", buf, 0x12u);
  }
  -[RPBroadcastExtensionProxy setConnectionReadyHandler:](self, "setConnectionReadyHandler:", v4);
  v5 = objc_alloc_init((Class)NSExtensionItem);
  broadcastUploadExtension = self->_broadcastUploadExtension;
  v11 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C650;
  v9[3] = &unk_100081140;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[NSExtension beginExtensionRequestWithInputItems:completion:](broadcastUploadExtension, "beginExtensionRequestWithInputItems:completion:", v7, v9);

}

- (void)invalidateConnection
{
  NSXPCConnection *connection;
  id serviceInfoHandler;
  id broadcastURLHandler;
  id errorHandler;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  RPBroadcastExtensionProxy *v13;
  __int16 v14;
  NSXPCConnection *v15;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v8 = 136446978;
    v9 = "-[RPBroadcastExtensionProxy invalidateConnection]";
    v10 = 1024;
    v11 = 100;
    v12 = 2048;
    v13 = self;
    v14 = 2048;
    v15 = connection;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p invalidating connection=%p with extension", (uint8_t *)&v8, 0x26u);
  }
  -[RPBroadcastExtensionProxy setConnectionReadyHandler:](self, "setConnectionReadyHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[RPBroadcastExtensionProxy setConnection:](self, "setConnection:", 0);
  -[RPBroadcastExtensionProxy setListener:](self, "setListener:", 0);
  serviceInfoHandler = self->_serviceInfoHandler;
  self->_serviceInfoHandler = 0;

  broadcastURLHandler = self->_broadcastURLHandler;
  self->_broadcastURLHandler = 0;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPBroadcastExtensionProxy broadcastUploadExtension](self, "broadcastUploadExtension"));
  objc_msgSend(v7, "_kill:", 9);

  -[RPBroadcastExtensionProxy setBroadcastUploadExtension:](self, "setBroadcastUploadExtension:", 0);
}

- (void)setupNewConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  -[RPBroadcastExtensionProxy setConnection:](self, "setConnection:", v4);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPBroadcastDaemonProtocol));
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPBroadcastExtensionProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10000CC08;
  v10 = &unk_100081168;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &v7);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &stru_1000811A8, v7, v8, v9, v10);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  -[RPBroadcastExtensionProxy setupNewConnection:](self, "setupNewConnection:", a4);
  return 1;
}

- (void)updateServiceInfo:(id)a3
{
  id v4;
  void (**serviceInfoHandler)(id, id);
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPBroadcastExtensionProxy updateServiceInfo:]";
    v8 = 1024;
    v9 = 145;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received serviceInfo", (uint8_t *)&v6, 0x12u);
  }
  serviceInfoHandler = (void (**)(id, id))self->_serviceInfoHandler;
  if (serviceInfoHandler)
    serviceInfoHandler[2](serviceInfoHandler, v4);

}

- (void)updateBroadcastURL:(id)a3
{
  id v4;
  void (**broadcastURLHandler)(id, id);
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPBroadcastExtensionProxy updateBroadcastURL:]";
    v8 = 1024;
    v9 = 152;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received broadcastURL", (uint8_t *)&v6, 0x12u);
  }
  broadcastURLHandler = (void (**)(id, id))self->_broadcastURLHandler;
  if (broadcastURLHandler)
    broadcastURLHandler[2](broadcastURLHandler, v4);

}

- (void)ping
{
  void (**connectionReadyHandler)(id, _QWORD);
  void *v4;
  _BOOL4 enableMixedRealityCamera;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  RPBroadcastExtensionProxy *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPBroadcastExtensionProxy ping]";
    v8 = 1024;
    v9 = 159;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received ping from extension, notifying handler that connection is ready", (uint8_t *)&v6, 0x12u);
  }
  connectionReadyHandler = (void (**)(id, _QWORD))self->_connectionReadyHandler;
  if (connectionReadyHandler)
    connectionReadyHandler[2](connectionReadyHandler, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  self->_enableMixedRealityCamera = 0;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    enableMixedRealityCamera = self->_enableMixedRealityCamera;
    v6 = 136447234;
    v7 = "-[RPBroadcastExtensionProxy ping]";
    v8 = 1024;
    v9 = 169;
    v10 = 2048;
    v11 = self;
    v12 = 2048;
    v13 = v4;
    v14 = 1024;
    v15 = enableMixedRealityCamera;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p connection=%p enableMixedRealityCamera=%d", (uint8_t *)&v6, 0x2Cu);
  }

}

- (void)finishBroadcastWithError:(id)a3
{
  id v4;
  void (**errorHandler)(id, id);
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPBroadcastExtensionProxy finishBroadcastWithError:]";
    v8 = 1024;
    v9 = 173;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received finish request from service due to error %@", (uint8_t *)&v6, 0x1Cu);
  }
  errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler)
    errorHandler[2](errorHandler, v4);

}

- (void)processPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10000D27C;
  v14 = &unk_1000811D0;
  objc_copyWeak(&v15, &location);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &v11));
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "processPayload:completion:", v6, v7, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (id)serviceInfoHandler
{
  return self->_serviceInfoHandler;
}

- (void)setServiceInfoHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)broadcastURLHandler
{
  return self->_broadcastURLHandler;
}

- (void)setBroadcastURLHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)enableMixedRealityCamera
{
  return self->_enableMixedRealityCamera;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSExtension)broadcastUploadExtension
{
  return self->_broadcastUploadExtension;
}

- (void)setBroadcastUploadExtension:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastUploadExtension, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)connectionReadyHandler
{
  return self->_connectionReadyHandler;
}

- (void)setConnectionReadyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong(&self->_connectionReadyHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_broadcastUploadExtension, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_broadcastURLHandler, 0);
  objc_storeStrong(&self->_serviceInfoHandler, 0);
}

@end
