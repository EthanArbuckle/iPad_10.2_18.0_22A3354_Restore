@implementation STStatusDomainXPCClientListener

- (STStatusDomainXPCClientListener)initWithServerHandle:(id)a3
{
  id v4;
  STStatusDomainXPCClientListener *v5;
  STStatusDomainXPCClientListener *v6;
  id v7;
  uint64_t v8;
  NSXPCListener *xpcListener;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STStatusDomainXPCClientListener;
  v5 = -[STStatusDomainXPCClientListener init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_serverHandle, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v8 = objc_msgSend(v7, "initWithMachServiceName:", *MEMORY[0x1E0DB0E38]);
    xpcListener = v6->_xpcListener;
    v6->_xpcListener = (NSXPCListener *)v8;

    -[NSXPCListener setDelegate:](v6->_xpcListener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_xpcListener, "resume");
  }

  return v6;
}

- (void)dealloc
{
  STStatusDomainXPCClientListener *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (STStatusDomainXPCClientListener *)self->_xpcListener;
  -[STStatusDomainXPCClientListener invalidate](self, "invalidate");
  v3.receiver = v2;
  v3.super_class = (Class)STStatusDomainXPCClientListener;
  -[STStatusDomainXPCClientListener dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  STStatusDomainXPCClientHandle *v6;
  STStatusDomainXPCClientHandle *v7;

  v5 = a4;
  v6 = [STStatusDomainXPCClientHandle alloc];
  if (self)
    self = (STStatusDomainXPCClientListener *)objc_loadWeakRetained((id *)&self->_serverHandle);
  v7 = -[STStatusDomainXPCClientHandle initWithXPCConnection:serverHandle:](v6, "initWithXPCConnection:serverHandle:", v5, self);

  return v7 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_serverHandle);
}

@end
