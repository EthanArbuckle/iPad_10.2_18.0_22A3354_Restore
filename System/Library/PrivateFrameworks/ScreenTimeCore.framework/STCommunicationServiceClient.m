@implementation STCommunicationServiceClient

- (STCommunicationServiceClient)init
{
  STCommunicationServiceClient *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STCommunicationServiceClient;
  v2 = -[STCommunicationServiceClient init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC906D8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.communication"), 4096);
    objc_msgSend(v4, "setRemoteObjectInterface:", v3);
    objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_19);
    objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_12);
    objc_msgSend(v4, "resume");
    -[STCommunicationServiceClient setConnection:](v2, "setConnection:", v4);

  }
  return v2;
}

void __36__STCommunicationServiceClient_init__block_invoke()
{
  NSObject *v0;

  +[STLog communicationClient](STLog, "communicationClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __36__STCommunicationServiceClient_init__block_invoke_cold_1();

}

void __36__STCommunicationServiceClient_init__block_invoke_11()
{
  NSObject *v0;

  +[STLog communicationClient](STLog, "communicationClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __36__STCommunicationServiceClient_init__block_invoke_11_cold_1();

}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STCommunicationServiceClient;
  -[STCommunicationServiceClient dealloc](&v4, sel_dealloc);
}

- (void)authenticateForCommunicationConfigurationOverrideWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[8];
  _QWORD v14[4];
  id v15;

  v4 = a3;
  +[STLog communicationClient](STLog, "communicationClient");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Authenticating for communication configuration override", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v14[0] = buf;
  v14[1] = 0x3032000000;
  v14[2] = __Block_byref_object_copy__15;
  v14[3] = __Block_byref_object_dispose__15;
  v15 = 0;
  -[STCommunicationServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__STCommunicationServiceClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E9370AF0;
  v12[4] = buf;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(v14[0] + 40))
  {
    +[STLog communicationClient](STLog, "communicationClient");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STCommunicationServiceClient authenticateForCommunicationConfigurationOverrideWithCompletionHandler:].cold.1((uint64_t)v14, v8);

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, *(_QWORD *)(v14[0] + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationServiceClient setActiveListener:](self, "setActiveListener:", v9);
    objc_msgSend(v9, "setDelegate:", self);
    -[STCommunicationServiceClient setProvidedService:](self, "setProvidedService:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC87D08);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationServiceClient setProvidedServiceInterface:](self, "setProvidedServiceInterface:", v10);

    objc_msgSend(v9, "endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_clientListenerEndpoint, v11);
    objc_msgSend(v9, "resume");
    -[STCommunicationServiceClient setPendingAuthenticationCompletionHandler:](self, "setPendingAuthenticationCompletionHandler:", v4);
    objc_msgSend(v7, "authenticatePasscodeForUserWithEndpoint:completionHandler:", v11, &__block_literal_global_21_0);

  }
  _Block_object_dispose(buf, 8);

}

void __103__STCommunicationServiceClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __103__STCommunicationServiceClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_20()
{
  NSObject *v0;
  uint8_t v1[16];

  +[STLog communicationClient](STLog, "communicationClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_DEFAULT, "Prompted for passcode authentication", v1, 2u);
  }

}

- (id)currentConfigurationWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t v28[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[STLog communicationClient](STLog, "communicationClient");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Requesting current communication configuration", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__15;
  v26 = __Block_byref_object_dispose__15;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  v21 = 0;
  -[STCommunicationServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__STCommunicationServiceClient_currentConfigurationWithError___block_invoke;
  v15[3] = &unk_1E9370AF0;
  v15[4] = buf;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __62__STCommunicationServiceClient_currentConfigurationWithError___block_invoke_2;
  v14[3] = &unk_1E93710B0;
  v14[4] = &v16;
  v14[5] = buf;
  objc_msgSend(v8, "currentCommunicationConfigurationWithCompletionHandler:", v14);
  +[STLog communicationClient](STLog, "communicationClient");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v17[5];
    v11 = *((_QWORD *)v23 + 5);
    *(_DWORD *)v28 = 138543618;
    v29 = v10;
    v30 = 2114;
    v31 = v11;
    _os_log_impl(&dword_1D22E7000, v9, OS_LOG_TYPE_DEFAULT, "Got current communication configuration: %{public}@ - Error: %{public}@", v28, 0x16u);
  }

  if (a3)
    *a3 = objc_retainAutorelease(*((id *)v23 + 5));
  v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __62__STCommunicationServiceClient_currentConfigurationWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__STCommunicationServiceClient_currentConfigurationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)receivePasscodeAuthenticationResult:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint8_t v14[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[STCommunicationServiceClient pendingAuthenticationCompletionHandler](self, "pendingAuthenticationCompletionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[STLog communicationClient](STLog, "communicationClient");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_DEFAULT, "Resolving pending completion with authentication result", v14, 2u);
      }

      ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v6, 0);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[STSetupServiceClient receivePasscode:completionHandler:].cold.2();

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 51, 0);
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v13);

    }
    -[STCommunicationServiceClient setPendingAuthenticationCompletionHandler:](self, "setPendingAuthenticationCompletionHandler:", 0);
    v7[2](v7, 0);
  }
  else
  {
    +[STLog communicationClient](STLog, "communicationClient");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[STCommunicationServiceClient receivePasscodeAuthenticationResult:completionHandler:].cold.1();

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0);
    v7[2](v7, v12);

    v7 = (void (**)(id, _QWORD))v12;
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v12;

  v6 = a4;
  v7 = a3;
  -[STCommunicationServiceClient activeListener](self, "activeListener");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[STCommunicationServiceClient providedServiceInterface](self, "providedServiceInterface");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "setExportedInterface:", v9);
      objc_msgSend(v6, "setExportedObject:", self);
      objc_msgSend(v6, "setInterruptionHandler:", &__block_literal_global_24);
      objc_msgSend(v6, "setInvalidationHandler:", &__block_literal_global_26_0);
      objc_msgSend(v6, "resume");
      v10 = 1;
      goto LABEL_7;
    }
    +[STLog communicationClient](STLog, "communicationClient");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[STSetupServiceClient listener:shouldAcceptNewConnection:].cold.1();

  }
  else
  {
    +[STLog communicationClient](STLog, "communicationClient");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[STSetupServiceClient listener:shouldAcceptNewConnection:].cold.2();
  }
  v10 = 0;
LABEL_7:

  return v10;
}

void __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;

  +[STLog communicationClient](STLog, "communicationClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_cold_1();

}

void __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_25()
{
  NSObject *v0;

  +[STLog communicationClient](STLog, "communicationClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_25_cold_1();

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCListener)activeListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActiveListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSXPCListenerEndpoint)clientListenerEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (id)providedService
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setProvidedService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSXPCInterface)providedServiceInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProvidedServiceInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)pendingAuthenticationCompletionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingAuthenticationCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingAuthenticationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_providedServiceInterface, 0);
  objc_storeStrong(&self->_providedService, 0);
  objc_storeStrong((id *)&self->_clientListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_activeListener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __36__STCommunicationServiceClient_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "communicationService connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __36__STCommunicationServiceClient_init__block_invoke_11_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_DEBUG, "communicationService connection invalidated", v1, 2u);
  OUTLINED_FUNCTION_1_4();
}

- (void)authenticateForCommunicationConfigurationOverrideWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Failed to authenticate for communication configuration override: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)receivePasscodeAuthenticationResult:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "No pending completion handler to resolve with authentication result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "STPasscodeAuthenticationResultReceiverProtocol connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_25_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "STPasscodeAuthenticationResultReceiverProtocol connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

@end
