@implementation NEAgentSession

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSXPCConnection *delegateConnection;
  uint64_t v11;
  NSObject *v12;
  _QWORD *v13;
  SEL v14;
  id v15;
  void *v16;
  SEL v17;
  id v18;
  void *v19;
  SEL v20;
  _QWORD v22[5];
  uint8_t buf[16];

  v6 = a4;
  v9 = v6;
  delegateConnection = self->_delegateConnection;
  if (delegateConnection)
  {
    v11 = ne_log_obj(v6, v7, v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Received a second delegate connection", buf, 2u);
    }

  }
  else
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000461C;
    v22[3] = &unk_100008420;
    v22[4] = self;
    v13 = objc_retainBlock(v22);
    v15 = objc_msgSend(objc_getProperty(self, v14, 8, 1), "driverInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v9, "setExportedInterface:", v16);

    v18 = objc_msgSend(objc_getProperty(self, v17, 8, 1), "managerInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v9, "setRemoteObjectInterface:", v19);

    objc_msgSend(v9, "setExportedObject:", objc_getProperty(self, v20, 8, 1));
    objc_msgSend(v9, "setInvalidationHandler:", v13);
    objc_msgSend(v9, "setInterruptionHandler:", v13);
    objc_storeStrong((id *)&self->_delegateConnection, a4);
    objc_msgSend(v9, "resume");

  }
  return delegateConnection == 0;
}

- (void)setupWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  const char *v14;
  id v15;
  NSObject *Property;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  int64_t v25;

  v12 = a3;
  v13 = a6;
  v15 = a7;
  if (self)
    Property = objc_getProperty(self, v14, 16, 1);
  else
    Property = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000041F4;
  v20[3] = &unk_100008470;
  v24 = a4;
  v25 = a5;
  v20[4] = self;
  v21 = v12;
  v22 = v13;
  v23 = v15;
  v17 = v13;
  v18 = v12;
  v19 = v15;
  dispatch_async(Property, v20);

}

- (void)disposeWithCompletionHandler:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 16, 1);
  else
    Property = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004068;
  v8[3] = &unk_100008498;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (id)managerObject
{
  NEAgentSession *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t v10[16];

  v2 = self;
  if (self)
    self = (NEAgentSession *)objc_getProperty(self, a2, 32, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentSession remoteObjectProxy](self, "remoteObjectProxy"));
  if (!v5)
  {
    v6 = ne_log_obj(0, v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to get the remote manager object", v10, 2u);
    }

    sub_100003E78(v2, v8);
  }
  return v5;
}

- (id)managerObjectWithErrorHandler:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t v14[16];

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "remoteObjectProxyWithErrorHandler:", v5));
  if (!v9)
  {
    v10 = ne_log_obj(0, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get the remote manager object", v14, 2u);
    }

    sub_100003E78(self, v12);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_delegateListener, 0);
  objc_storeStrong((id *)&self->_delegateConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
