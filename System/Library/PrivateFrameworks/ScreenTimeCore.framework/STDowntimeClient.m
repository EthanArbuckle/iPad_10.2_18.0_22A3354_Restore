@implementation STDowntimeClient

- (STDowntimeClient)init
{
  STDowntimeClient *v2;
  STDowntimeServiceClient *v3;
  STDowntimeServiceClient *downtimeServiceClient;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STDowntimeClient;
  v2 = -[STDowntimeClient init](&v8, sel_init);
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = objc_alloc_init(STDowntimeServiceClient);
      downtimeServiceClient = v2->_downtimeServiceClient;
      v2->_downtimeServiceClient = v3;

    }
    else
    {
      v5 = +[STDowntimeClient _newConnection](STDowntimeClient, "_newConnection");
      connection = v2->_connection;
      v2->_connection = v5;

      -[NSXPCConnection resume](v2->_connection, "resume");
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STDowntimeClient;
  -[STDowntimeClient dealloc](&v3, sel_dealloc);
}

+ (id)_newConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.downtime"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC903D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

- (BOOL)isDowntimeEnabledForUserID:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
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
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (_os_feature_enabled_impl())
  {
    v6 = -[STDowntimeServiceClient isDowntimeEnabledForUserID:](self->_downtimeServiceClient, "isDowntimeEnabledForUserID:", v4);
    *((_BYTE *)v17 + 24) = v6;
  }
  else
  {
    -[STDowntimeClient connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__STDowntimeClient_isDowntimeEnabledForUserID___block_invoke;
    v15[3] = &unk_1E9370AF0;
    v15[4] = &buf;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __47__STDowntimeClient_isDowntimeEnabledForUserID___block_invoke_2;
    v14[3] = &unk_1E9370B18;
    v14[4] = &buf;
    v14[5] = &v16;
    objc_msgSend(v9, "isDowntimeEnabledForUserID:completionHandler:", v4, v14);
    +[STLog downtimeClient](STLog, "downtimeClient");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *((unsigned __int8 *)v17 + 24);
      v12 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v20 = 67109378;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_DEFAULT, "Got downtime state: %d - Error: %{public}@", v20, 0x12u);
    }

    v6 = *((_BYTE *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v6;
}

void __47__STDowntimeClient_isDowntimeEnabledForUserID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __47__STDowntimeClient_isDowntimeEnabledForUserID___block_invoke_2(uint64_t a1, char a2, id obj)
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STDowntimeServiceClient toggleOnDemandDowntimeForUserID:completionHandler:](self->_downtimeServiceClient, "toggleOnDemandDowntimeForUserID:completionHandler:", v6, v7);
  }
  else
  {
    -[STDowntimeClient connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__STDowntimeClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke;
    v15[3] = &unk_1E9370AF0;
    v15[4] = &buf;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __70__STDowntimeClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke_2;
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
  }
  _Block_object_dispose(&buf, 8);

}

void __70__STDowntimeClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__STDowntimeClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (STDowntimeServiceClient)downtimeServiceClient
{
  return self->_downtimeServiceClient;
}

- (void)setDowntimeServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_downtimeServiceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeServiceClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
