@implementation NEVPNTunnelPlugin

- (NEVPNTunnelPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5
{
  NEVPNTunnelPlugin *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEVPNTunnelPlugin;
  result = -[NEPlugin initWithAgent:delegateQueue:andDelegate:](&v6, "initWithAgent:delegateQueue:andDelegate:", a3, a4, a5);
  if (result)
    result->_pluginStatus = 0;
  return result;
}

- (void)handlePluginFailedWithError:(id)a3
{
  id v4;
  id v5;

  self->_pluginStatus = 0;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NEPlugin delegate](self, "delegate"));
  objc_msgSend(v5, "plugin:didSetStatus:andDisconnectError:", self, 0, v4);

}

- (void)createVirtualInterfaceWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014EA8;
  block[3] = &unk_1000BECA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)handleIPCDetached
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014E68;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setStatus:(int)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014DE4;
  block[3] = &unk_1000BED20;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014CD4;
  block[3] = &unk_1000BECA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEVPNPluginDriver);
}

- (id)managerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEVPNPluginManager);
}

@end
