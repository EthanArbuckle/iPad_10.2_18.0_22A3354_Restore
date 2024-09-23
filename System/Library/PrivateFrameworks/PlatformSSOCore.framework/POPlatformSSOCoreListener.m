@implementation POPlatformSSOCoreListener

- (id)initForLogin:(BOOL)a3 identifierProvider:(id)a4 jwksStroageProvider:(id)a5
{
  _BOOL4 v7;
  id v9;
  id v10;
  const __CFString *v11;
  POPlatformSSOCoreListener *v12;
  id *p_isa;
  objc_super v15;

  v7 = a3;
  v9 = a4;
  v10 = a5;
  if (v7)
    v11 = CFSTR("com.apple.PlatformSSO.login.service-xpc");
  else
    v11 = CFSTR("com.apple.PlatformSSO.service-xpc");
  v15.receiver = self;
  v15.super_class = (Class)POPlatformSSOCoreListener;
  v12 = -[POAgentListener initWithMachServiceName:](&v15, sel_initWithMachServiceName_, v11);
  p_isa = (id *)&v12->super.super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userIdentifierProvider, a4);
    objc_storeStrong(p_isa + 8, a5);
  }

  return p_isa;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  POAgentCoreProcess *v9;
  void *v10;
  void *v11;
  POAgentCoreProcess *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  if (PO_LOG_POAgentListener_once != -1)
    dispatch_once(&PO_LOG_POAgentListener_once, &__block_literal_global_9);
  v8 = PO_LOG_POAgentListener_log;
  if (os_log_type_enabled((os_log_t)PO_LOG_POAgentListener_log, OS_LOG_TYPE_DEBUG))
    -[POPlatformSSOCoreListener listener:shouldAcceptNewConnection:].cold.1((uint64_t)v6, (uint64_t)v7, v8);
  v9 = [POAgentCoreProcess alloc];
  -[POPlatformSSOCoreListener userIdentifierProvider](self, "userIdentifierProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[POPlatformSSOCoreListener jwksStorageProvider](self, "jwksStorageProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[POAgentCoreProcess initWithXPCConnection:identifierProvider:jwksStroageProvider:](v9, "initWithXPCConnection:identifierProvider:jwksStroageProvider:", v7, v10, v11);

  +[POInternalProtocols interfaceWithInternalProtocol:](POInternalProtocols, "interfaceWithInternalProtocol:", &unk_25736E050);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v13);

  objc_msgSend(v7, "setExportedObject:", v12);
  objc_msgSend(v7, "resume");
  objc_initWeak(&location, v12);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __64__POPlatformSSOCoreListener_listener_shouldAcceptNewConnection___block_invoke;
  v19 = &unk_251500548;
  objc_copyWeak(&v20, &location);
  -[POAgentCoreProcess setInvalidationHandler:](v12, "setInvalidationHandler:", &v16);
  -[POAgentCoreProcess invalidationHandler](v12, "invalidationHandler", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvalidationHandler:", v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return 1;
}

void __64__POPlatformSSOCoreListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInvalidated");

}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (POJWKSStorageProvider)jwksStorageProvider
{
  return (POJWKSStorageProvider *)objc_getProperty(self, a2, 64, 1);
}

- (void)setJwksStorageProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jwksStorageProvider, 0);
  objc_storeStrong((id *)&self->_userIdentifierProvider, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_24440D000, log, OS_LOG_TYPE_DEBUG, "%{public}@, %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
