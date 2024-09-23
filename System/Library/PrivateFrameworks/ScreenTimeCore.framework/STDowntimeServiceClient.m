@implementation STDowntimeServiceClient

- (STDowntimeServiceClient)init
{
  STDowntimeServiceClient *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STDowntimeServiceClient;
  v2 = -[STDowntimeServiceClient init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC90798);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.downtime"), 4096);
    objc_msgSend(v4, "setRemoteObjectInterface:", v3);
    objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_20);
    objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_11);
    objc_msgSend(v4, "resume");
    -[STDowntimeServiceClient setConnection:](v2, "setConnection:", v4);

  }
  return v2;
}

void __31__STDowntimeServiceClient_init__block_invoke()
{
  NSObject *v0;

  +[STLog downtimeClient](STLog, "downtimeClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __31__STDowntimeServiceClient_init__block_invoke_cold_1(v0);

}

void __31__STDowntimeServiceClient_init__block_invoke_10()
{
  NSObject *v0;

  +[STLog downtimeClient](STLog, "downtimeClient");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __31__STDowntimeServiceClient_init__block_invoke_10_cold_1(v0);

}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STDowntimeServiceClient;
  -[STDowntimeServiceClient dealloc](&v4, sel_dealloc);
}

- (BOOL)isDowntimeEnabledForUserID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t v20[4];
  int v21;
  __int16 v22;
  uint64_t v23;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[STLog downtimeClient](STLog, "downtimeClient");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Requesting current downtime state for user: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__17;
  v27 = __Block_byref_object_dispose__17;
  v28 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[STDowntimeServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__STDowntimeServiceClient_isDowntimeEnabledForUserID___block_invoke;
  v15[3] = &unk_1E9370AF0;
  v15[4] = &buf;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __54__STDowntimeServiceClient_isDowntimeEnabledForUserID___block_invoke_2;
  v14[3] = &unk_1E9370B18;
  v14[4] = &buf;
  v14[5] = &v16;
  objc_msgSend(v8, "isDowntimeEnabledForUserID:completionHandler:", v4, v14);
  +[STLog downtimeClient](STLog, "downtimeClient");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *((unsigned __int8 *)v17 + 24);
    v11 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v20 = 67109378;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_1D22E7000, v9, OS_LOG_TYPE_DEFAULT, "Got downtime state: %d - Error: %{public}@", v20, 0x12u);
  }

  v12 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v12;
}

void __54__STDowntimeServiceClient_isDowntimeEnabledForUserID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __54__STDowntimeServiceClient_isDowntimeEnabledForUserID___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)toggleOnDemandDowntimeForUserID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t v16[4];
  uint64_t v17;
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  +[STLog downtimeClient](STLog, "downtimeClient");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D22E7000, v8, OS_LOG_TYPE_DEFAULT, "Requesting current downtime state for user: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__17;
  v21 = __Block_byref_object_dispose__17;
  v22 = 0;
  -[STDowntimeServiceClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__STDowntimeServiceClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke;
  v15[3] = &unk_1E9370AF0;
  v15[4] = &buf;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __77__STDowntimeServiceClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke_2;
  v14[3] = &unk_1E9370AF0;
  v14[4] = &buf;
  objc_msgSend(v11, "toggleOnDemandDowntimeForUserID:completionHandler:", v6, v14);
  +[STLog downtimeClient](STLog, "downtimeClient");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_DEFAULT, "Toggle On Demand Downtime with Error: %@", v16, 0xCu);
  }

  v7[2](v7, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);

}

void __77__STDowntimeServiceClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__STDowntimeServiceClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __31__STDowntimeServiceClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "downtimeService connection interrupted", v1, 2u);
}

void __31__STDowntimeServiceClient_init__block_invoke_10_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D22E7000, log, OS_LOG_TYPE_DEBUG, "downtimeService connection invalidated", v1, 2u);
}

@end
