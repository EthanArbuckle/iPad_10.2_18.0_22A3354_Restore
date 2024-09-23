@implementation STDynamicActivityAttributionListener

- (STDynamicActivityAttributionListener)initWithServerHandle:(id)a3
{
  id v4;
  STDynamicActivityAttributionListener *v5;
  STDynamicActivityAttributionListener *v6;
  uint64_t v7;
  NSXPCListener *xpcListener;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STDynamicActivityAttributionListener;
  v5 = -[STDynamicActivityAttributionListener init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_serverHandle, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.systemstatus.activityattribution"));
    xpcListener = v6->_xpcListener;
    v6->_xpcListener = (NSXPCListener *)v7;

    -[NSXPCListener setDelegate:](v6->_xpcListener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_xpcListener, "resume");
  }

  return v6;
}

- (void)dealloc
{
  STDynamicActivityAttributionListener *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (STDynamicActivityAttributionListener *)self->_xpcListener;
  -[STDynamicActivityAttributionListener invalidate](self, "invalidate");
  v3.receiver = v2;
  v3.super_class = (Class)STDynamicActivityAttributionListener;
  -[STDynamicActivityAttributionListener dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  STDynamicActivityAttributionXPCClientHandle *v6;
  STDynamicActivityAttributionXPCClientHandle *v7;

  v5 = a4;
  v6 = [STDynamicActivityAttributionXPCClientHandle alloc];
  if (self)
    self = (STDynamicActivityAttributionListener *)objc_loadWeakRetained((id *)&self->_serverHandle);
  v7 = -[STDynamicActivityAttributionXPCClientHandle initWithXPCConnection:serverHandle:](v6, "initWithXPCConnection:serverHandle:", v5, self);

  return v7 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_serverHandle);
}

@end
