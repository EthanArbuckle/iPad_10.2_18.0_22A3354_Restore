@implementation DMDConfigurationSourceTaskOperation

- (DMDConfigurationSourceTaskOperation)initWithController:(id)a3
{
  id v4;
  DMDConfigurationSourceTaskOperation *v5;
  void *v6;
  uint64_t v7;
  NSXPCListenerEndpoint *anonymousEndpoint;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *machServiceName;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMDConfigurationSourceTaskOperation;
  v5 = -[DMDConfigurationSourceTaskOperation init](&v14, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "source"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "listenerEndpoint"));
    anonymousEndpoint = v5->_anonymousEndpoint;
    v5->_anonymousEndpoint = (NSXPCListenerEndpoint *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "source"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "machServiceName"));
    v11 = (NSString *)objc_msgSend(v10, "copy");
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = v11;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DMDConfigurationSourceTaskOperation;
  -[DMDConfigurationSourceTaskOperation dealloc](&v3, "dealloc");
}

- (void)fetchRemoteProxy:(id)a3
{
  id v3;
  _QWORD v4[4];
  DMDConfigurationSourceTaskOperation *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100032678;
  v4[3] = &unk_1000BAC00;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[DMDConfigurationSourceTaskOperation _tryConnectingToNamedService:completion:](v5, "_tryConnectingToNamedService:completion:", 0, v4);

}

- (void)_tryConnectingToNamedService:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation machServiceName](self, "machServiceName"));
    if (v7)
    {
      v8 = objc_alloc((Class)NSXPCConnection);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation machServiceName](self, "machServiceName"));
      v10 = objc_msgSend(v8, "initWithMachServiceName:options:", v9, 0);
LABEL_6:
      v12 = v10;
      -[DMDConfigurationSourceTaskOperation setConnection:](self, "setConnection:", v10);

      goto LABEL_8;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation anonymousEndpoint](self, "anonymousEndpoint"));
    if (v7)
    {
      v11 = objc_alloc((Class)NSXPCConnection);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation anonymousEndpoint](self, "anonymousEndpoint"));
      v10 = objc_msgSend(v11, "initWithListenerEndpoint:", v9);
      goto LABEL_6;
    }
  }
  -[DMDConfigurationSourceTaskOperation setConnection:](self, "setConnection:", 0);
LABEL_8:

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation connection](self, "connection"));
  if (v13)
  {
    v14 = DMFConfigurationSourceClientXPCInterface();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation connection](self, "connection"));
    objc_msgSend(v16, "setRemoteObjectInterface:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation connection](self, "connection"));
    objc_msgSend(v17, "resume");

    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = sub_100032B30;
    v34 = sub_100032B40;
    v35 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation connection](self, "connection"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100032B48;
    v27[3] = &unk_1000BAC28;
    v19 = v6;
    v28 = v19;
    v29 = &v30;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v27));
    v21 = (void *)v31[5];
    v31[5] = v20;

    v22 = (void *)v31[5];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100032B88;
    v24[3] = &unk_1000BAC50;
    v26 = &v30;
    v25 = v19;
    objc_msgSend(v22, "probe:", v24);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 4099, 0));
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v23);

  }
}

- (DMDConfigurationSourceController)controller
{
  return (DMDConfigurationSourceController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSXPCListenerEndpoint)anonymousEndpoint
{
  return self->_anonymousEndpoint;
}

- (void)setAnonymousEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousEndpoint, a3);
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_machServiceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_anonymousEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
