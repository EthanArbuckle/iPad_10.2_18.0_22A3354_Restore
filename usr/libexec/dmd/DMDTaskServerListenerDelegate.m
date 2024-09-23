@implementation DMDTaskServerListenerDelegate

- (DMDTaskServerListenerDelegate)initWithTaskServer:(id)a3
{
  id v5;
  DMDTaskServerListenerDelegate *v6;
  DMDTaskServerListenerDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMDTaskServerListenerDelegate;
  v6 = -[DMDTaskServerListenerDelegate init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_taskServer, a3);

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.dmd-access")));
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && objc_msgSend(v6, "BOOLValue"))
  {
    v8 = objc_msgSend(objc_alloc((Class)CATXPCTransport), "initWithXPCConnection:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerListenerDelegate taskServer](self, "taskServer"));
    objc_msgSend(v9, "connectWithClientTransport:", v8);

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CATTaskServer)taskServer
{
  return self->_taskServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskServer, 0);
}

@end
