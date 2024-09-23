@implementation BCXPCUbiquityDisableServiceProxy

- (BCXPCUbiquityDisableServiceProxy)init
{
  BCXPCUbiquityDisableServiceProxy *v2;
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCXPCUbiquityDisableServiceProxy;
  v2 = -[BCXPCUbiquityDisableServiceProxy init](&v7, "init");
  if (v2)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.ibooks.XPCUbiquityDisableService"));
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BCSyncICloudSettingsProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BCXPCUbiquityDisableServiceProxy;
  -[BCXPCUbiquityDisableServiceProxy dealloc](&v3, "dealloc");
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCXPCUbiquityDisableServiceProxy connection](self, "connection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_575AC;
  v9[3] = &unk_28C140;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (void)syncIsLiverpoolAndUbiquityEnabledWithReply:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5768C;
  v6[3] = &unk_28C140;
  v7 = a3;
  v4 = v7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCXPCUbiquityDisableServiceProxy synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v6));
  objc_msgSend(v5, "isLiverpoolAndUbiquityEnabledWithReply:", v4);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
