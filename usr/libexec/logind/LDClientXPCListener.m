@implementation LDClientXPCListener

- (LDClientXPCListener)init
{
  LDClientXPCListener *v2;
  NSMutableArray *v3;
  NSMutableArray *clientConnections;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LDClientXPCListener;
  v2 = -[LDClientXPCListener init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = v3;

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LDClientXPCConnection connectionWithConnection:](LDClientXPCConnection, "connectionWithConnection:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LKLoginDaemonProtocol));
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", v8);
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005084;
  v13[3] = &unk_100008688;
  objc_copyWeak(&v15, &location);
  v10 = v8;
  v14 = v10;
  objc_msgSend(v7, "setInvalidationHandler:", v13);
  objc_msgSend(v7, "resume");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LDClientXPCListener clientConnections](self, "clientConnections"));
  objc_msgSend(v11, "addObject:", v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

@end
