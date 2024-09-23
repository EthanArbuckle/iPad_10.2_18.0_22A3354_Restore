@implementation STStatusDomainPublisherXPCClientListener

- (STStatusDomainPublisherXPCClientListener)initWithServerHandle:(id)a3
{
  id v4;
  STStatusDomainPublisherXPCClientListener *v5;
  STStatusDomainPublisherXPCClientListener *v6;
  id v7;
  uint64_t v8;
  NSXPCListener *xpcListener;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STStatusDomainPublisherXPCClientListener;
  v5 = -[STStatusDomainPublisherXPCClientListener init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_serverHandle, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v8 = objc_msgSend(v7, "initWithMachServiceName:", *MEMORY[0x1E0DB0E20]);
    xpcListener = v6->_xpcListener;
    v6->_xpcListener = (NSXPCListener *)v8;

    -[NSXPCListener setDelegate:](v6->_xpcListener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_xpcListener, "resume");
  }

  return v6;
}

- (void)dealloc
{
  STStatusDomainPublisherXPCClientListener *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (STStatusDomainPublisherXPCClientListener *)self->_xpcListener;
  -[STStatusDomainPublisherXPCClientListener invalidate](self, "invalidate");
  v3.receiver = v2;
  v3.super_class = (Class)STStatusDomainPublisherXPCClientListener;
  -[STStatusDomainPublisherXPCClientListener dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  STStatusDomainPublisherXPCClientHandle *v6;
  STStatusDomainPublisherXPCClientHandle *v7;

  v5 = a4;
  v6 = [STStatusDomainPublisherXPCClientHandle alloc];
  if (self)
    self = (STStatusDomainPublisherXPCClientListener *)objc_loadWeakRetained((id *)&self->_serverHandle);
  v7 = -[STStatusDomainPublisherXPCClientHandle initWithXPCConnection:serverHandle:](v6, "initWithXPCConnection:serverHandle:", v5, self);

  return v7 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_serverHandle);
}

@end
