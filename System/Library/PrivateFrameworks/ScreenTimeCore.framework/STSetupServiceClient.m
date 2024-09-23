@implementation STSetupServiceClient

- (STSetupServiceClient)init
{
  STSetupServiceClient *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSetupServiceClient;
  v2 = -[STSetupServiceClient init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC90618);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.setup"), 4096);
    objc_msgSend(v4, "setRemoteObjectInterface:", v3);
    objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_18);
    objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_13);
    objc_msgSend(v4, "resume");
    -[STSetupServiceClient setConnection:](v2, "setConnection:", v4);

  }
  return v2;
}

void __28__STSetupServiceClient_init__block_invoke()
{
  NSObject *v0;

  +[STLog communicationClient](STLog, "communicationClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __28__STSetupServiceClient_init__block_invoke_cold_1();

}

void __28__STSetupServiceClient_init__block_invoke_12()
{
  NSObject *v0;

  +[STLog communicationClient](STLog, "communicationClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __28__STSetupServiceClient_init__block_invoke_12_cold_1();

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STSetupServiceClient;
  -[STSetupServiceClient dealloc](&v3, sel_dealloc);
}

- (id)currentConfigurationForUser:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[STLog setupClient](STLog, "setupClient");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D22E7000, v7, OS_LOG_TYPE_DEFAULT, "Requesting current configuration for user: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__14;
  v31 = __Block_byref_object_dispose__14;
  v32 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14;
  v22 = __Block_byref_object_dispose__14;
  v23 = 0;
  -[STSetupServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__STSetupServiceClient_currentConfigurationForUser_error___block_invoke;
  v17[3] = &unk_1E9370AF0;
  v17[4] = &buf;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __58__STSetupServiceClient_currentConfigurationForUser_error___block_invoke_2;
  v16[3] = &unk_1E9371B58;
  v16[4] = &v18;
  v16[5] = &buf;
  objc_msgSend(v10, "currentConfigurationForUser:completionHandler:", v6, v16);
  +[STLog setupClient](STLog, "setupClient");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v19[5];
    v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v24 = 138543618;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1D22E7000, v11, OS_LOG_TYPE_DEFAULT, "Got current configuration: %{public}@ - Error: %{public}@", v24, 0x16u);
  }

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v14 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&buf, 8);

  return v14;
}

void __58__STSetupServiceClient_currentConfigurationForUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__STSetupServiceClient_currentConfigurationForUser_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)applyUpdatedConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  BOOL v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t v17[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[STLog setupClient](STLog, "setupClient");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D22E7000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to apply configuration: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__14;
  v24 = __Block_byref_object_dispose__14;
  v25 = 0;
  -[STSetupServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__STSetupServiceClient_applyUpdatedConfiguration_error___block_invoke;
  v16[3] = &unk_1E9370AF0;
  v16[4] = &buf;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __56__STSetupServiceClient_applyUpdatedConfiguration_error___block_invoke_2;
  v15[3] = &unk_1E9370AF0;
  v15[4] = &buf;
  objc_msgSend(v10, "applyUpdatedConfiguration:completionHandler:", v6, v15);
  +[STLog setupClient](STLog, "setupClient");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v17 = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1D22E7000, v11, OS_LOG_TYPE_DEFAULT, "Applied configuration: %{public}@ - Error: %{public}@", v17, 0x16u);
  }

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;

  _Block_object_dispose(&buf, 8);
  return v13;
}

void __56__STSetupServiceClient_applyUpdatedConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__STSetupServiceClient_applyUpdatedConfiguration_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)collectPasscodeFromUserWithCompletionHandler:(id)a3
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
  +[STLog setupClient](STLog, "setupClient");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Requesting user passcode collection", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v14[0] = buf;
  v14[1] = 0x3032000000;
  v14[2] = __Block_byref_object_copy__14;
  v14[3] = __Block_byref_object_dispose__14;
  v15 = 0;
  -[STSetupServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__STSetupServiceClient_collectPasscodeFromUserWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E9370AF0;
  v12[4] = buf;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(v14[0] + 40))
  {
    +[STLog setupClient](STLog, "setupClient");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STSetupServiceClient collectPasscodeFromUserWithCompletionHandler:].cold.1((uint64_t)v14, v8);

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, *(_QWORD *)(v14[0] + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSetupServiceClient setActiveListener:](self, "setActiveListener:", v9);
    objc_msgSend(v9, "setDelegate:", self);
    -[STSetupServiceClient setProvidedService:](self, "setProvidedService:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC87998);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSetupServiceClient setProvidedServiceInterface:](self, "setProvidedServiceInterface:", v10);

    objc_msgSend(v9, "endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_clientListenerEndpoint, v11);
    objc_msgSend(v9, "resume");
    -[STSetupServiceClient setPendingProvidePasscodeCompletionHandler:](self, "setPendingProvidePasscodeCompletionHandler:", v4);
    objc_msgSend(v7, "promptForPasscodeFromUserWithEndpoint:completionHandler:", v11, &__block_literal_global_23_0);

  }
  _Block_object_dispose(buf, 8);

}

void __69__STSetupServiceClient_collectPasscodeFromUserWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__STSetupServiceClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_22()
{
  NSObject *v0;
  uint8_t v1[16];

  +[STLog setupClient](STLog, "setupClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_DEFAULT, "Prompted for passcode collection", v1, 2u);
  }

}

- (void)receivePasscode:(id)a3 completionHandler:(id)a4
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
  -[STSetupServiceClient pendingProvidePasscodeCompletionHandler](self, "pendingProvidePasscodeCompletionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[STLog setupClient](STLog, "setupClient");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_DEFAULT, "Resolving pending completion with passcode", v14, 2u);
      }

      ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v6, 0);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[STSetupServiceClient receivePasscode:completionHandler:].cold.2();

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 48, 0);
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v13);

    }
    -[STSetupServiceClient setPendingProvidePasscodeCompletionHandler:](self, "setPendingProvidePasscodeCompletionHandler:", 0);
    v7[2](v7, 0);
  }
  else
  {
    +[STLog setupClient](STLog, "setupClient");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[STSetupServiceClient receivePasscode:completionHandler:].cold.1();

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
  -[STSetupServiceClient activeListener](self, "activeListener");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[STSetupServiceClient providedServiceInterface](self, "providedServiceInterface");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "setExportedInterface:", v9);
      objc_msgSend(v6, "setExportedObject:", self);
      objc_msgSend(v6, "setInterruptionHandler:", &__block_literal_global_25);
      objc_msgSend(v6, "setInvalidationHandler:", &__block_literal_global_27);
      objc_msgSend(v6, "resume");
      v10 = 1;
      goto LABEL_7;
    }
    +[STLog setupClient](STLog, "setupClient");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[STSetupServiceClient listener:shouldAcceptNewConnection:].cold.1();

  }
  else
  {
    +[STLog setupClient](STLog, "setupClient");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[STSetupServiceClient listener:shouldAcceptNewConnection:].cold.2();
  }
  v10 = 0;
LABEL_7:

  return v10;
}

void __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;

  +[STLog setupClient](STLog, "setupClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_cold_1();

}

void __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_26()
{
  NSObject *v0;

  +[STLog setupClient](STLog, "setupClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_26_cold_1();

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCListenerEndpoint)clientListenerEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (NSXPCListener)activeListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActiveListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
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

- (id)pendingProvidePasscodeCompletionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingProvidePasscodeCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingProvidePasscodeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_providedServiceInterface, 0);
  objc_storeStrong(&self->_providedService, 0);
  objc_storeStrong((id *)&self->_activeListener, 0);
  objc_storeStrong((id *)&self->_clientListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __28__STSetupServiceClient_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "setupService connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __28__STSetupServiceClient_init__block_invoke_12_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_DEBUG, "setupService connection invalidated", v1, 2u);
  OUTLINED_FUNCTION_1_4();
}

- (void)collectPasscodeFromUserWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Failed to collect passcode: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)receivePasscode:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "No pending completion handler to resolve with passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)receivePasscode:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "Resolving pending completion with error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "Rejecting connection: Unable to find provided service interface.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "Rejecting connection: Listener did not match active listener", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "STPasscodeReceiverProtocol connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "STPasscodeReceiverProtocol connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

@end
