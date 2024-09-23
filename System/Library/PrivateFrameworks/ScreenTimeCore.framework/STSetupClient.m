@implementation STSetupClient

- (STSetupClient)init
{
  STSetupClient *v2;
  STSetupServiceClient *v3;
  STSetupServiceClient *setupServiceClient;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STSetupClient;
  v2 = -[STSetupClient init](&v8, sel_init);
  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(STSetupServiceClient);
    setupServiceClient = v2->_setupServiceClient;
    v2->_setupServiceClient = v3;

  }
  else
  {
    v5 = +[STSetupClient _newConnection](STSetupClient, "_newConnection");
    connection = v2->_connection;
    v2->_connection = v5;

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STSetupClient;
  -[STSetupClient dealloc](&v3, sel_dealloc);
}

+ (id)_newConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.setup"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC90738);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

- (id)currentConfigurationForUser:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
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
  v30 = __Block_byref_object_copy__16;
  v31 = __Block_byref_object_dispose__16;
  v32 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  v23 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STSetupServiceClient currentConfigurationForUser:error:](self->_setupServiceClient, "currentConfigurationForUser:error:", v6, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[STSetupClient connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__STSetupClient_currentConfigurationForUser_error___block_invoke;
    v17[3] = &unk_1E9370AF0;
    v17[4] = &buf;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __51__STSetupClient_currentConfigurationForUser_error___block_invoke_2;
    v16[3] = &unk_1E9371B58;
    v16[4] = &v18;
    v16[5] = &buf;
    objc_msgSend(v11, "currentConfigurationForUser:completionHandler:", v6, v16);
    +[STLog setupClient](STLog, "setupClient");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v19[5];
      v14 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v24 = 138543618;
      v25 = v13;
      v26 = 2114;
      v27 = v14;
      _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_DEFAULT, "Got current configuration: %{public}@ - Error: %{public}@", v24, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v8 = (id)v19[5];

  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __51__STSetupClient_currentConfigurationForUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__STSetupClient_currentConfigurationForUser_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
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
  v23 = __Block_byref_object_copy__16;
  v24 = __Block_byref_object_dispose__16;
  v25 = 0;
  if (_os_feature_enabled_impl())
  {
    v8 = -[STSetupServiceClient applyUpdatedConfiguration:error:](self->_setupServiceClient, "applyUpdatedConfiguration:error:", v6, a4);
  }
  else
  {
    -[STSetupClient connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__STSetupClient_applyUpdatedConfiguration_error___block_invoke;
    v16[3] = &unk_1E9370AF0;
    v16[4] = &buf;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __49__STSetupClient_applyUpdatedConfiguration_error___block_invoke_2;
    v15[3] = &unk_1E9370AF0;
    v15[4] = &buf;
    objc_msgSend(v11, "applyUpdatedConfiguration:completionHandler:", v6, v15);
    +[STLog setupClient](STLog, "setupClient");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v17 = 138543618;
      v18 = v6;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_DEFAULT, "Applied configuration: %{public}@ - Error: %{public}@", v17, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v8 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;

  }
  _Block_object_dispose(&buf, 8);

  return v8;
}

void __49__STSetupClient_applyUpdatedConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49__STSetupClient_applyUpdatedConfiguration_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)collectPasscodeFromUserWithCompletionHandler:(id)a3
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
  +[STLog setupClient](STLog, "setupClient");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Requesting user passcode collection", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v24[0] = buf;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy__16;
  v24[3] = __Block_byref_object_dispose__16;
  v25 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STSetupServiceClient collectPasscodeFromUserWithCompletionHandler:](self->_setupServiceClient, "collectPasscodeFromUserWithCompletionHandler:", v4);
  }
  else
  {
    -[STSetupClient connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke;
    v22[3] = &unk_1E9370AF0;
    v22[4] = buf;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(v24[0] + 40))
    {
      +[STLog setupClient](STLog, "setupClient");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[STSetupClient collectPasscodeFromUserWithCompletionHandler:].cold.1((uint64_t)v24, v9, v10, v11, v12, v13, v14, v15);

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, *(_QWORD *)(v24[0] + 40));
    }
    else
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "providePasscodeProviderService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      v19[1] = 3221225472;
      v19[2] = __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_17;
      v19[3] = &unk_1E9371C48;
      v21 = v4;
      v18 = v16;
      v20 = v18;
      objc_msgSend(v17, "collectPasscodeWithSetupServiceProxy:completionHandler:", v8, v19);

    }
  }
  _Block_object_dispose(buf, 8);

}

void __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_17(uint64_t a1, void *a2, void *a3)
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
  +[STLog setupClient](STLog, "setupClient");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D22E7000, v8, OS_LOG_TYPE_DEFAULT, "Successfully collected passcode", v16, 2u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_17_cold_1((uint64_t)v6, v8, v10, v11, v12, v13, v14, v15);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (STSetupServiceClient)setupServiceClient
{
  return self->_setupServiceClient;
}

- (void)setSetupServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_setupServiceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupServiceClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)collectPasscodeFromUserWithCompletionHandler:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to collect passcode: %{public}@", a5, a6, a7, a8, 2u);
}

void __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_17_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to collect passcode: %{public}@", a5, a6, a7, a8, 2u);
}

@end
