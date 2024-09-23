@implementation STCommunicationClient

- (STCommunicationClient)init
{
  STCommunicationClient *v2;
  STCommunicationServiceClient *v3;
  STCommunicationServiceClient *communicationServiceClient;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STCommunicationClient;
  v2 = -[STCommunicationClient init](&v8, sel_init);
  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(STCommunicationServiceClient);
    communicationServiceClient = v2->_communicationServiceClient;
    v2->_communicationServiceClient = v3;

  }
  else
  {
    v5 = +[STCommunicationClient _newConnection](STCommunicationClient, "_newConnection");
    connection = v2->_connection;
    v2->_connection = v5;

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

+ (id)_newConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.communication"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC90438);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

- (id)currentConfigurationWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t v29[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[STLog communicationClient](STLog, "communicationClient");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Requesting current communication configuration", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STCommunicationServiceClient currentConfigurationWithError:](self->_communicationServiceClient, "currentConfigurationWithError:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v18[5];
    v18[5] = v6;
  }
  else
  {
    -[STCommunicationClient connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__STCommunicationClient_currentConfigurationWithError___block_invoke;
    v16[3] = &unk_1E9370AF0;
    v16[4] = buf;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __55__STCommunicationClient_currentConfigurationWithError___block_invoke_2;
    v15[3] = &unk_1E93710B0;
    v15[4] = &v17;
    v15[5] = buf;
    objc_msgSend(v7, "currentCommunicationConfigurationWithCompletionHandler:", v15);
  }

  +[STLog communicationClient](STLog, "communicationClient");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v18[5];
    v12 = *((_QWORD *)v24 + 5);
    *(_DWORD *)v29 = 138543618;
    v30 = v11;
    v31 = 2114;
    v32 = v12;
    _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_DEFAULT, "Got current communication configuration: %{public}@ - Error: %{public}@", v29, 0x16u);
  }

  if (a3)
    *a3 = objc_retainAutorelease(*((id *)v24 + 5));
  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationServiceClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STCommunicationClient;
  -[STCommunicationClient dealloc](&v3, sel_dealloc);
}

void __55__STCommunicationClient_currentConfigurationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)authenticateForCommunicationConfigurationOverrideWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  uint8_t buf[8];
  _QWORD v24[4];
  id v25;

  v4 = a3;
  +[STLog communicationClient](STLog, "communicationClient");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Authenticating for communication configuration override", buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    -[STCommunicationServiceClient authenticateForCommunicationConfigurationOverrideWithCompletionHandler:](self->_communicationServiceClient, "authenticateForCommunicationConfigurationOverrideWithCompletionHandler:", v4);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v24[0] = buf;
    v24[1] = 0x3032000000;
    v24[2] = __Block_byref_object_copy__2;
    v24[3] = __Block_byref_object_dispose__2;
    v25 = 0;
    -[STCommunicationClient connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke;
    v22[3] = &unk_1E9370AF0;
    v22[4] = buf;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(v24[0] + 40))
    {
      +[STLog communicationClient](STLog, "communicationClient");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[STCommunicationClient authenticateForCommunicationConfigurationOverrideWithCompletionHandler:].cold.1((uint64_t)v24, v9, v10, v11, v12, v13, v14, v15);

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, *(_QWORD *)(v24[0] + 40));
    }
    else
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "providePasscodeAuthenticationProviderService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      v19[1] = 3221225472;
      v19[2] = __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_15;
      v19[3] = &unk_1E9371088;
      v21 = v4;
      v18 = v16;
      v20 = v18;
      objc_msgSend(v17, "authenticatePasscodeWithCommunicationServiceProxy:completionHandler:", v8, v19);

    }
    _Block_object_dispose(buf, 8);

  }
}

void __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16[16];

  v5 = a2;
  v6 = a3;
  +[STLog communicationClient](STLog, "communicationClient");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D22E7000, v8, OS_LOG_TYPE_DEFAULT, "Successfully authenticated passcode", v16, 2u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_15_cold_1((uint64_t)v6, v8, v10, v11, v12, v13, v14, v15);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

void __55__STCommunicationClient_currentConfigurationWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (STCommunicationServiceClient)communicationServiceClient
{
  return self->_communicationServiceClient;
}

- (void)setCommunicationServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_communicationServiceClient, a3);
}

- (void)authenticateForCommunicationConfigurationOverrideWithCompletionHandler:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to authenticate for communication configuration override: %{public}@", a5, a6, a7, a8, 2u);
}

void __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_15_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to authenticate passcode: %{public}@", a5, a6, a7, a8, 2u);
}

@end
