@implementation NEPlugin

- (NEPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  NEPlugin *v12;
  NEPlugin *v13;
  const char *v14;
  NEAgent *agent;
  id v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  NSString *v20;
  NSString *internalDescription;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NEPlugin;
  v12 = -[NEPlugin init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_agent, a3);
    objc_storeStrong((id *)&v13->_delegateQueue, a4);
    agent = v13->_agent;
    if (agent)
      objc_setProperty_atomic(agent, v14, v13->_delegateQueue, 32);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v16 = objc_alloc((Class)NSString);
    v17 = (objc_class *)objc_opt_class(v13);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (NSString *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@(%@)"), v19, v9);
    internalDescription = v13->_internalDescription;
    v13->_internalDescription = v20;

    v13->_started = 0;
  }

  return v13;
}

- (id)description
{
  return -[NEPlugin internalDescription](self, "internalDescription");
}

- (id)remotePluginObject
{
  NEPluginDriver *pluginDriver;
  NEPluginDriver *v3;
  void *v4;

  pluginDriver = self->_pluginDriver;
  if (pluginDriver)
  {
    v3 = pluginDriver;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NEPlugin pluginConnection](self, "pluginConnection"));
    v3 = (NEPluginDriver *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));

  }
  return v3;
}

- (id)remotePluginObjectWithErrorHandler:(id)a3
{
  NEPluginDriver *pluginDriver;
  NEPluginDriver *v4;
  id v6;
  void *v7;

  pluginDriver = self->_pluginDriver;
  if (pluginDriver)
  {
    v4 = pluginDriver;
  }
  else
  {
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEPlugin pluginConnection](self, "pluginConnection"));
    v4 = (NEPluginDriver *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6));

  }
  return v4;
}

- (NSXPCInterface)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEPluginDriver);
}

- (NSXPCInterface)managerInterface
{
  return 0;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NEPluginDelegate)delegate
{
  return (NEPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (int)extension_pid
{
  return self->_extension_pid;
}

- (void)setExtension_pid:(int)a3
{
  self->_extension_pid = a3;
}

- (NSXPCConnection)pluginConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPluginConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)internalDescription
{
  return self->_internalDescription;
}

- (void)setInternalDescription:(id)a3
{
  objc_storeStrong((id *)&self->_internalDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDescription, 0);
  objc_storeStrong((id *)&self->_pluginConnection, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_pluginDriver, 0);
}

@end
