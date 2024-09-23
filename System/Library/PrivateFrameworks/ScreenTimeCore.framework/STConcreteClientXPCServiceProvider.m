@implementation STConcreteClientXPCServiceProvider

- (id)providePasscodeAuthenticationProviderService
{
  void *v3;
  STConcretePasscodeAuthenticationProviderService *v4;
  void *v5;
  STConcretePasscodeAuthenticationProviderService *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STConcreteClientXPCServiceProvider setActiveListener:](self, "setActiveListener:", v3);
  objc_msgSend(v3, "setDelegate:", self);
  v4 = [STConcretePasscodeAuthenticationProviderService alloc];
  objc_msgSend(v3, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STConcretePasscodeAuthenticationProviderService initWithClientListenerEndpoint:](v4, "initWithClientListenerEndpoint:", v5);

  -[STConcreteClientXPCServiceProvider setProvidedService:](self, "setProvidedService:", v6);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC80FE0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STConcreteClientXPCServiceProvider setProvidedServiceInterface:](self, "setProvidedServiceInterface:", v7);

  objc_msgSend(v3, "resume");
  return v6;
}

- (id)providePasscodeProviderService
{
  void *v3;
  STConcretePasscodeProviderService *v4;
  void *v5;
  STConcretePasscodeProviderService *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STConcreteClientXPCServiceProvider setActiveListener:](self, "setActiveListener:", v3);
  objc_msgSend(v3, "setDelegate:", self);
  v4 = [STConcretePasscodeProviderService alloc];
  objc_msgSend(v3, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STConcretePasscodeProviderService initWithClientListenerEndpoint:](v4, "initWithClientListenerEndpoint:", v5);

  -[STConcreteClientXPCServiceProvider setProvidedService:](self, "setProvidedService:", v6);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC811D0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STConcreteClientXPCServiceProvider setProvidedServiceInterface:](self, "setProvidedServiceInterface:", v7);

  objc_msgSend(v3, "resume");
  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[STConcreteClientXPCServiceProvider activeListener](self, "activeListener");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[STConcreteClientXPCServiceProvider providedService](self, "providedService");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[STConcreteClientXPCServiceProvider providedServiceInterface](self, "providedServiceInterface");
      v18 = objc_claimAutoreleasedReturnValue();
      v17 = v18 != 0;
      if (v18)
      {
        objc_msgSend(v6, "setExportedInterface:", v18);
        objc_msgSend(v6, "setExportedObject:", v9);
        objc_msgSend(v6, "resume");
        +[STLog xpcServiceProvider](STLog, "xpcServiceProvider");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          -[STConcreteClientXPCServiceProvider providedService](self, "providedService");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 138543362;
          v37 = v20;
          _os_log_impl(&dword_1D22E7000, v19, OS_LOG_TYPE_DEFAULT, "Accepted connection for service: %{public}@", (uint8_t *)&v36, 0xCu);

        }
      }
      else
      {
        +[STLog xpcServiceProvider](STLog, "xpcServiceProvider");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[STConcreteClientXPCServiceProvider listener:shouldAcceptNewConnection:].cold.2(v19, v28, v29, v30, v31, v32, v33, v34);
      }

    }
    else
    {
      +[STLog xpcServiceProvider](STLog, "xpcServiceProvider");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[STConcreteClientXPCServiceProvider listener:shouldAcceptNewConnection:].cold.1(v18, v21, v22, v23, v24, v25, v26, v27);
      v17 = 0;
    }

  }
  else
  {
    +[STLog xpcServiceProvider](STLog, "xpcServiceProvider");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[STConcreteClientXPCServiceProvider listener:shouldAcceptNewConnection:].cold.3(v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = 0;
  }

  return v17;
}

- (NSXPCListener)activeListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActiveListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)providedService
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setProvidedService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSXPCInterface)providedServiceInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProvidedServiceInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providedServiceInterface, 0);
  objc_storeStrong(&self->_providedService, 0);
  objc_storeStrong((id *)&self->_activeListener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, a1, a3, "Rejecting connection: Unable to find provided service.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_4();
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, a1, a3, "Rejecting connection: Unable to find provided service interface.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_4();
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, a1, a3, "Rejecting connection: Listener did not match active listener", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_4();
}

@end
