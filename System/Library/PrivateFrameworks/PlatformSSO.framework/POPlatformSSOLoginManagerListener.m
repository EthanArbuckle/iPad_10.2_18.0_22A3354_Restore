@implementation POPlatformSSOLoginManagerListener

- (POPlatformSSOLoginManagerListener)initWithAuthenticationProcess:(id)a3
{
  id v5;
  POPlatformSSOLoginManagerListener *v6;
  POPlatformSSOLoginManagerListener *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POPlatformSSOLoginManagerListener;
  v6 = -[POAgentListener initWithMachServiceName:](&v9, sel_initWithMachServiceName_, CFSTR("com.apple.PlatformSSO.service-login-manager-xpc"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_process, a3);

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  POExtensionAgentProcess *v9;
  void *v10;
  POExtensionAgentProcess *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  PO_LOG_POAgentListener();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POPlatformSSOListener listener:shouldAcceptNewConnection:].cold.1();

  v9 = [POExtensionAgentProcess alloc];
  -[POPlatformSSOLoginManagerListener process](self, "process");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[POExtensionAgentProcess initWithXPCConnection:authenticationProcess:](v9, "initWithXPCConnection:authenticationProcess:", v7, v10);

  objc_msgSend(MEMORY[0x24BE72EB8], "interfaceWithInternalProtocol:", &unk_25578A2F0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v12);

  objc_msgSend(v7, "setExportedObject:", v11);
  objc_msgSend(v7, "resume");
  objc_initWeak(&location, v11);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __72__POPlatformSSOLoginManagerListener_listener_shouldAcceptNewConnection___block_invoke;
  v18 = &unk_24EC02630;
  objc_copyWeak(&v19, &location);
  -[POExtensionAgentProcess setInvalidationHandler:](v11, "setInvalidationHandler:", &v15);
  -[POExtensionAgentProcess invalidationHandler](v11, "invalidationHandler", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvalidationHandler:", v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return 1;
}

void __72__POPlatformSSOLoginManagerListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInvalidated");

}

- (POAgentAuthenticationProcess)process
{
  return (POAgentAuthenticationProcess *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_process, 0);
}

@end
