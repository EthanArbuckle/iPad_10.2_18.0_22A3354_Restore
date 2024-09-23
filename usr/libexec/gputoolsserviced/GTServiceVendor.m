@implementation GTServiceVendor

- (GTServiceVendor)initWithConnectionProvider:(id)a3
{
  id v5;
  GTServiceVendor *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *portToService;
  GTXPCConnection *serviceDaemonConnection;
  GTServiceVendor *v10;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)GTServiceVendor;
    v6 = -[GTServiceVendor init](&v12, "init");
    if (v6)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      portToService = v6->_portToService;
      v6->_portToService = v7;

      objc_storeStrong((id *)&v6->_connectionProvider, a3);
      serviceDaemonConnection = v6->_serviceDaemonConnection;
      v6->_serviceDaemonConnection = 0;

    }
    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setServiceDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDaemonConnection, a3);
}

- (void)addLocalService:(id)a3 forPort:(unint64_t)a4
{
  NSMutableDictionary *portToService;
  id v6;
  id v7;

  if (a3)
  {
    portToService = self->_portToService;
    v6 = a3;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](portToService, "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (id)_connectionForServicePort:(unint64_t)a3
{
  GTXPCConnection *v4;
  GTXPCConnection *serviceDaemonConnection;
  GTXPCConnection *v6;

  v4 = (GTXPCConnection *)objc_claimAutoreleasedReturnValue(-[GTConnectionProvider connectionForServicePort:](self->_connectionProvider, "connectionForServicePort:", a3));
  serviceDaemonConnection = v4;
  if (!v4)
    serviceDaemonConnection = self->_serviceDaemonConnection;
  v6 = serviceDaemonConnection;

  return v6;
}

- (id)getSimulatorDeviceBrowserService:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *portToService;
  void *v7;
  void *v8;
  GTSimulatorDeviceBrowserXPCProxy *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    portToService = self->_portToService;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "servicePort")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToService, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      v9 = v8;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceVendor _connectionForServicePort:](self, "_connectionForServicePort:", objc_msgSend(v5, "servicePort")));
      v9 = -[GTSimulatorDeviceBrowserXPCProxy initWithConnection:remoteProperties:]([GTSimulatorDeviceBrowserXPCProxy alloc], "initWithConnection:remoteProperties:", v10, v5);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDaemonConnection, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_portToService, 0);
}

@end
