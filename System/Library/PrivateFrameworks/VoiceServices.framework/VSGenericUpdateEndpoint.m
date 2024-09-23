@implementation VSGenericUpdateEndpoint

- (void)dealloc
{
  objc_super v3;

  -[VSGenericUpdateEndpoint invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VSGenericUpdateEndpoint;
  -[VSGenericUpdateEndpoint dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id handler;
  void *v10;
  VSGenericBlockHolder *v11;
  id v12;
  NSXPCListenerEndpoint *endpoint;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  handler = self->_handler;
  if (handler)
  {
    if (self->_queue)
      objc_msgSend(v7, "_setQueue:");
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F04401C8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v10);

    v11 = -[VSGenericBlockHolder initWithBlock:]([VSGenericBlockHolder alloc], "initWithBlock:", self->_handler);
    objc_msgSend(v8, "setExportedObject:", v11);

    objc_msgSend(v8, "resume");
    v12 = self->_handler;
    self->_handler = 0;

    endpoint = self->_endpoint;
    self->_endpoint = 0;

  }
  return handler != 0;
}

- (void)invalidate
{
  NSXPCListener *listener;
  id handler;
  NSXPCListenerEndpoint *endpoint;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  listener = self->_listener;
  self->_listener = 0;

  handler = self->_handler;
  self->_handler = 0;

  endpoint = self->_endpoint;
  self->_endpoint = 0;

}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_endpoint, CFSTR("_endpoint"));
}

- (VSGenericUpdateEndpoint)initWithCoder:(id)a3
{
  id v4;
  VSGenericUpdateEndpoint *v5;
  uint64_t v6;
  NSXPCListenerEndpoint *endpoint;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSGenericUpdateEndpoint;
  v5 = -[VSGenericUpdateEndpoint init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endpoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v6;

  }
  return v5;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

+ (id)configuredEndpointWithUpdateHandler:(id)a3 withConnection:(id)a4
{
  id v5;
  id v6;
  VSGenericUpdateEndpoint *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(VSGenericUpdateEndpoint);
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v7);
  objc_msgSend(v8, "resume");
  objc_msgSend(v5, "_queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSGenericUpdateEndpoint setQueue:](v7, "setQueue:", v9);
  -[VSGenericUpdateEndpoint setHandler:](v7, "setHandler:", v6);

  -[VSGenericUpdateEndpoint setListener:](v7, "setListener:", v8);
  objc_msgSend(v8, "endpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSGenericUpdateEndpoint setEndpoint:](v7, "setEndpoint:", v10);

  return v7;
}

+ (id)remoteUpdateHanderForEndpoint:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0CB3B38];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithListenerEndpoint:", v6);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F04401C8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  objc_msgSend(v7, "resume");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__VSGenericUpdateEndpoint_remoteUpdateHanderForEndpoint___block_invoke;
  v13[3] = &unk_1EA8B02D8;
  v14 = v7;
  v9 = v7;
  v10 = (void *)MEMORY[0x1DF0E94A4](v13);
  v11 = (void *)MEMORY[0x1DF0E94A4]();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __57__VSGenericUpdateEndpoint_remoteUpdateHanderForEndpoint___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invokeUpdateWithObject:", v3);

}

@end
