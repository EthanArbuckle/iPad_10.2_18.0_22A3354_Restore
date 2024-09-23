@implementation POPlatformSSOListener

- (id)initForLogin:(BOOL)a3 authenticationProcess:(id)a4
{
  _BOOL4 v5;
  id v7;
  const __CFString *v8;
  POPlatformSSOListener *v9;
  POPlatformSSOListener *v10;
  objc_super v12;

  v5 = a3;
  v7 = a4;
  if (v5)
    v8 = CFSTR("com.apple.PlatformSSO.login.service-xpc");
  else
    v8 = CFSTR("com.apple.PlatformSSO.service-xpc");
  v12.receiver = self;
  v12.super_class = (Class)POPlatformSSOListener;
  v9 = -[POAgentListener initWithMachServiceName:](&v12, sel_initWithMachServiceName_, v8);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_process, a4);

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  POAgentProcess *v9;
  void *v10;
  POAgentProcess *v11;
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

  v9 = [POAgentProcess alloc];
  -[POPlatformSSOListener process](self, "process");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[POAgentProcess initWithXPCConnection:authenticationProcess:](v9, "initWithXPCConnection:authenticationProcess:", v7, v10);

  objc_msgSend(MEMORY[0x24BE72EB8], "interfaceWithInternalProtocol:", &unk_2557890B0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v12);

  objc_msgSend(v7, "setExportedObject:", v11);
  objc_msgSend(v7, "resume");
  objc_initWeak(&location, v11);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __60__POPlatformSSOListener_listener_shouldAcceptNewConnection___block_invoke;
  v18 = &unk_24EC02630;
  objc_copyWeak(&v19, &location);
  -[POAgentCoreProcess setInvalidationHandler:](v11, "setInvalidationHandler:", &v15);
  -[POAgentCoreProcess invalidationHandler](v11, "invalidationHandler", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvalidationHandler:", v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return 1;
}

void __60__POPlatformSSOListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
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

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_22307D000, v0, v1, "%{public}@, %{public}@");
  OUTLINED_FUNCTION_1();
}

@end
