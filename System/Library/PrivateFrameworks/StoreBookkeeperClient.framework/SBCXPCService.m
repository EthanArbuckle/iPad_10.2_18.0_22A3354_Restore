@implementation SBCXPCService

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (BOOL)isConnectionConfigured
{
  return self->_connectionConfigured;
}

- (SBCClientConfiguration)clientConfiguration
{
  return self->_clientConfiguration;
}

- (SBCXPCService)initWithClientConfiguration:(id)a3
{
  id v5;
  SBCXPCService *v6;
  SBCXPCService *v7;
  SBCXPCServiceInterface *v8;
  SBCXPCServiceInterface *XPCServiceInterface;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBCXPCService;
  v6 = -[SBCXPCService init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientConfiguration, a3);
    v8 = (SBCXPCServiceInterface *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "XPCServiceInterfaceClass"));
    XPCServiceInterface = v7->_XPCServiceInterface;
    v7->_XPCServiceInterface = v8;

    v7->_connectionConfigured = 0;
  }

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = os_log_create("com.apple.amp.StoreBookkeeperClient", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228272000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating", buf, 2u);
  }

  -[SBCXPCService closeServiceConnection](self, "closeServiceConnection");
  v4.receiver = self;
  v4.super_class = (Class)SBCXPCService;
  -[SBCXPCService dealloc](&v4, sel_dealloc);
}

- (id)newServiceConnection
{
  return -[SBCXPCServiceInterface newServiceConnection](self->_XPCServiceInterface, "newServiceConnection");
}

- (void)closeServiceConnection
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (SBCXPCServiceInterface)XPCServiceInterface
{
  return self->_XPCServiceInterface;
}

- (void)setConnectionConfigured:(BOOL)a3
{
  self->_connectionConfigured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCServiceInterface, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

+ (Class)XPCServiceInterfaceClass
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBCXPCService.m"), 52, CFSTR("Subclass %@ must implement +%@"), v5, v6);

  return 0;
}

+ (id)XPCInterfaceDebugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(a1, "XPCServiceInterfaceClass"), "serviceInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(a1, "XPCServiceInterfaceClass"), "serviceClientInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Service Name: '%@'\n\nService Protocol:\n\n%@\n\nClient Protocol:\n\n%@\n"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)newListener
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "XPCServiceInterfaceClass"), "newListener");
}

@end
