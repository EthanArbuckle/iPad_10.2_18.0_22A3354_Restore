@implementation STPrivateServiceClient

- (STPrivateServiceClient)init
{
  STPrivateServiceClient *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STPrivateServiceClient;
  v2 = -[STPrivateServiceClient init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC90858);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.private"), 4096);
    objc_msgSend(v4, "setRemoteObjectInterface:", v3);
    objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_23);
    objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_91);
    objc_msgSend(v4, "resume");
    -[STPrivateServiceClient setConnection:](v2, "setConnection:", v4);

  }
  return v2;
}

void __30__STPrivateServiceClient_init__block_invoke()
{
  NSObject *v0;

  +[STLog privateService](STLog, "privateService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __30__STPrivateServiceClient_init__block_invoke_cold_1(v0);

}

void __30__STPrivateServiceClient_init__block_invoke_90()
{
  NSObject *v0;

  +[STLog privateService](STLog, "privateService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __30__STPrivateServiceClient_init__block_invoke_90_cold_1(v0);

}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STPrivateServiceClient;
  -[STPrivateServiceClient dealloc](&v4, sel_dealloc);
}

- (BOOL)isScreenTimeEnabledForLocalUserWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__STPrivateServiceClient_isScreenTimeEnabledForLocalUserWithError___block_invoke;
  v11[3] = &unk_1E9371148;
  v11[4] = &v12;
  v11[5] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __67__STPrivateServiceClient_isScreenTimeEnabledForLocalUserWithError___block_invoke_2;
  v10[3] = &unk_1E9370B18;
  v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend(v6, "isScreenTimeEnabledForLocalUserWithCompletionHandler:", v10);
  if (v13[5])
  {
    +[STLog privateService](STLog, "privateService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient isScreenTimeEnabledForLocalUserWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }
  v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __67__STPrivateServiceClient_isScreenTimeEnabledForLocalUserWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __67__STPrivateServiceClient_isScreenTimeEnabledForLocalUserWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (BOOL)isScreenTimeEnabledForRemoteUserWithDSID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__20;
  v19 = __Block_byref_object_dispose__20;
  v20 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__STPrivateServiceClient_isScreenTimeEnabledForRemoteUserWithDSID_error___block_invoke;
  v14[3] = &unk_1E9371148;
  v14[4] = &v15;
  v14[5] = &v21;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __73__STPrivateServiceClient_isScreenTimeEnabledForRemoteUserWithDSID_error___block_invoke_2;
  v13[3] = &unk_1E9370B18;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "isScreenTimeEnabledForRemoteUserWithDSID:completionHandler:", v6, v13);
  if (v16[5])
  {
    +[STLog privateService](STLog, "privateService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient isScreenTimeEnabledForLocalUserWithError:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
  }
  v11 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __73__STPrivateServiceClient_isScreenTimeEnabledForRemoteUserWithDSID_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __73__STPrivateServiceClient_isScreenTimeEnabledForRemoteUserWithDSID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (void)setScreenTimeEnabledForLocalUser:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__STPrivateServiceClient_setScreenTimeEnabledForLocalUser_error___block_invoke;
  v11[3] = &unk_1E9370AF0;
  v11[4] = &v12;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __65__STPrivateServiceClient_setScreenTimeEnabledForLocalUser_error___block_invoke_2;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v12;
  objc_msgSend(v8, "setScreenTimeEnabledForLocalUser:completionHandler:", v5, v10);
  if (v13[5])
  {
    +[STLog privateService](STLog, "privateService");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient setScreenTimeEnabledForLocalUser:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v13[5]);
  }

  _Block_object_dispose(&v12, 8);
}

void __65__STPrivateServiceClient_setScreenTimeEnabledForLocalUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__STPrivateServiceClient_setScreenTimeEnabledForLocalUser_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void)setScreenTimeEnabledForRemoteUserWithDSID:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20;
  v21 = __Block_byref_object_dispose__20;
  v22 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__STPrivateServiceClient_setScreenTimeEnabledForRemoteUserWithDSID_enabled_error___block_invoke;
  v16[3] = &unk_1E9370AF0;
  v16[4] = &v17;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __82__STPrivateServiceClient_setScreenTimeEnabledForRemoteUserWithDSID_enabled_error___block_invoke_2;
  v15[3] = &unk_1E9370AF0;
  v15[4] = &v17;
  objc_msgSend(v11, "setScreenTimeEnabledForRemoteUserWithDSID:enabled:completionHandler:", v8, v6, v15);
  if (v18[5])
  {
    +[STLog privateService](STLog, "privateService");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = "clearing";
      v14 = v18[5];
      *(_DWORD *)buf = 136315650;
      if (v6)
        v13 = "setting";
      v24 = v13;
      v25 = 2112;
      v26 = v8;
      v27 = 2114;
      v28 = v14;
      _os_log_error_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_ERROR, "Failed %s screenTime enabled for dsid %@ with error: %{public}@", buf, 0x20u);
    }

    if (a5)
      *a5 = objc_retainAutorelease((id)v18[5]);
  }

  _Block_object_dispose(&v17, 8);
}

void __82__STPrivateServiceClient_setScreenTimeEnabledForRemoteUserWithDSID_enabled_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __82__STPrivateServiceClient_setScreenTimeEnabledForRemoteUserWithDSID_enabled_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void)enableRemoteManagementForDSID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__20;
  v17 = __Block_byref_object_dispose__20;
  v18 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__STPrivateServiceClient_enableRemoteManagementForDSID_error___block_invoke;
  v12[3] = &unk_1E9370AF0;
  v12[4] = &v13;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __62__STPrivateServiceClient_enableRemoteManagementForDSID_error___block_invoke_2;
  v11[3] = &unk_1E9370AF0;
  v11[4] = &v13;
  objc_msgSend(v9, "enableRemoteManagementForDSID:completionHandler:", v6, v11);
  if (v14[5])
  {
    +[STLog privateService](STLog, "privateService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient enableRemoteManagementForDSID:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v14[5]);
  }

  _Block_object_dispose(&v13, 8);
}

void __62__STPrivateServiceClient_enableRemoteManagementForDSID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__STPrivateServiceClient_enableRemoteManagementForDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (BOOL)isScreenTimeSyncEnabledWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__STPrivateServiceClient_isScreenTimeSyncEnabledWithError___block_invoke;
  v11[3] = &unk_1E9371148;
  v11[4] = &v12;
  v11[5] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __59__STPrivateServiceClient_isScreenTimeSyncEnabledWithError___block_invoke_2;
  v10[3] = &unk_1E9370B18;
  v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend(v6, "isScreenTimeSyncEnabledWithCompletionHandler:", v10);
  if (v13[5])
  {
    +[STLog privateService](STLog, "privateService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient isScreenTimeSyncEnabledWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }
  v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __59__STPrivateServiceClient_isScreenTimeSyncEnabledWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __59__STPrivateServiceClient_isScreenTimeSyncEnabledWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (void)isScreenTimeSyncEnabledWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__STPrivateServiceClient_isScreenTimeSyncEnabledWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E9370BE0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "isScreenTimeSyncEnabledWithCompletionHandler:", v6);
}

uint64_t __71__STPrivateServiceClient_isScreenTimeSyncEnabledWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)setScreenTimeSyncEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__STPrivateServiceClient_setScreenTimeSyncEnabled_error___block_invoke;
  v11[3] = &unk_1E9370AF0;
  v11[4] = &v12;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __57__STPrivateServiceClient_setScreenTimeSyncEnabled_error___block_invoke_2;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v12;
  objc_msgSend(v8, "setScreenTimeSyncEnabled:completionHandler:", v5, v10);
  if (v13[5])
  {
    +[STLog privateService](STLog, "privateService");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient setScreenTimeSyncEnabled:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v13[5]);
  }

  _Block_object_dispose(&v12, 8);
}

void __57__STPrivateServiceClient_setScreenTimeSyncEnabled_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__STPrivateServiceClient_setScreenTimeSyncEnabled_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (BOOL)shouldRequestMoreTimeWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__STPrivateServiceClient_shouldRequestMoreTimeWithError___block_invoke;
  v11[3] = &unk_1E9371148;
  v11[4] = &v12;
  v11[5] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __57__STPrivateServiceClient_shouldRequestMoreTimeWithError___block_invoke_2;
  v10[3] = &unk_1E9370B18;
  v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend(v6, "shouldRequestMoreTimeWithCompletionHandler:", v10);
  if (v13[5])
  {
    +[STLog privateService](STLog, "privateService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient shouldRequestMoreTimeWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }
  v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __57__STPrivateServiceClient_shouldRequestMoreTimeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __57__STPrivateServiceClient_shouldRequestMoreTimeWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (void)shouldRequestMoreTimeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E9370BE0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_98;
  v10[3] = &unk_1E9371708;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "shouldRequestMoreTimeWithCompletionHandler:", v10);

}

void __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_98(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    +[STLog privateService](STLog, "privateService");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_cold_1();

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (BOOL)isContentPrivacyEnabledForDSID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__20;
  v19 = __Block_byref_object_dispose__20;
  v20 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__STPrivateServiceClient_isContentPrivacyEnabledForDSID_error___block_invoke;
  v14[3] = &unk_1E9371148;
  v14[4] = &v15;
  v14[5] = &v21;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __63__STPrivateServiceClient_isContentPrivacyEnabledForDSID_error___block_invoke_2;
  v13[3] = &unk_1E9370B18;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "isContentPrivacyEnabledForDSID:completionHandler:", v6, v13);
  if (v16[5])
  {
    +[STLog privateService](STLog, "privateService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient isContentPrivacyEnabledForDSID:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
  }
  v11 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __63__STPrivateServiceClient_isContentPrivacyEnabledForDSID_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __63__STPrivateServiceClient_isContentPrivacyEnabledForDSID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (BOOL)clearRestrictionsPasscodeWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__STPrivateServiceClient_clearRestrictionsPasscodeWithError___block_invoke;
  v11[3] = &unk_1E9371148;
  v11[4] = &v12;
  v11[5] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __61__STPrivateServiceClient_clearRestrictionsPasscodeWithError___block_invoke_2;
  v10[3] = &unk_1E9371148;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "clearRestrictionsPasscodeWithCompletionHandler:", v10);
  if (v13[5])
  {
    +[STLog privateService](STLog, "privateService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient clearRestrictionsPasscodeWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }
  v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __61__STPrivateServiceClient_clearRestrictionsPasscodeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __61__STPrivateServiceClient_clearRestrictionsPasscodeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (BOOL)isRestrictionsPasscodeSetWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__STPrivateServiceClient_isRestrictionsPasscodeSetWithError___block_invoke;
  v11[3] = &unk_1E9371148;
  v11[4] = &v12;
  v11[5] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __61__STPrivateServiceClient_isRestrictionsPasscodeSetWithError___block_invoke_2;
  v10[3] = &unk_1E9370B18;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "isRestrictionsPasscodeSetWithCompletionHandler:", v10);
  if (v13[5])
  {
    +[STLog privateService](STLog, "privateService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient clearRestrictionsPasscodeWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }
  v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __61__STPrivateServiceClient_isRestrictionsPasscodeSetWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __61__STPrivateServiceClient_isRestrictionsPasscodeSetWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
    a2 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E9370BE0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_99;
  v10[3] = &unk_1E9371708;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "isRestrictionsPasscodeSetWithCompletionHandler:", v10);

}

void __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_99(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    +[STLog privateService](STLog, "privateService");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_99_cold_1();

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (BOOL)needsToSetRestrictionsPasscodeWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__STPrivateServiceClient_needsToSetRestrictionsPasscodeWithError___block_invoke;
  v11[3] = &unk_1E9371148;
  v11[4] = &v12;
  v11[5] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __66__STPrivateServiceClient_needsToSetRestrictionsPasscodeWithError___block_invoke_2;
  v10[3] = &unk_1E9370B18;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "needsToSetRestrictionsPasscodeWithCompletionHandler:", v10);
  if (v13[5])
  {
    +[STLog privateService](STLog, "privateService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient needsToSetRestrictionsPasscodeWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }
  v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __66__STPrivateServiceClient_needsToSetRestrictionsPasscodeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __66__STPrivateServiceClient_needsToSetRestrictionsPasscodeWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v5 = v6;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__STPrivateServiceClient_setRestrictionsPasscode_completionHandler___block_invoke;
  v11[3] = &unk_1E9370BE0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setRestrictionsPasscode:completionHandler:", v7, v9);
}

void __68__STPrivateServiceClient_setRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__STPrivateServiceClient_setRestrictionsPasscode_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)authenticateRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__STPrivateServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke;
  v11[3] = &unk_1E9370BE0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "authenticateRestrictionsPasscode:completionHandler:", v7, v9);
}

void __77__STPrivateServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__STPrivateServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E9370BE0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fetchRestrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:", v6);
}

void __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

- (void)communicationPoliciesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__STPrivateServiceClient_communicationPoliciesWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E9370BE0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fetchCommunicationPoliciesWithCompletionHandler:", v6);
}

void __69__STPrivateServiceClient_communicationPoliciesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

- (id)communicationPoliciesWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__20;
  v22 = __Block_byref_object_dispose__20;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__STPrivateServiceClient_communicationPoliciesWithError___block_invoke;
  v11[3] = &unk_1E9370AF0;
  v11[4] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __57__STPrivateServiceClient_communicationPoliciesWithError___block_invoke_2;
  v10[3] = &unk_1E9371820;
  v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend(v6, "fetchCommunicationPoliciesWithCompletionHandler:", v10);
  if (v19[5])
  {
    +[STLog privateService](STLog, "privateService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient communicationPoliciesWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease((id)v19[5]);
  }
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __57__STPrivateServiceClient_communicationPoliciesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__STPrivateServiceClient_communicationPoliciesWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a4);
  }
  else
  {
    v14[0] = CFSTR("STCommunicationPolicyKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("STCommunicationWhileLimitedPolicyKey");
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (void)setManageContactsEnabled:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[STPrivateServiceClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__STPrivateServiceClient_setManageContactsEnabled_forDSID_completionHandler___block_invoke;
  v13[3] = &unk_1E9370BE0;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setManageContactsEnabled:forDSID:completionHandler:", v6, v9, v11);
}

void __77__STPrivateServiceClient_setManageContactsEnabled_forDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__STPrivateServiceClient_setManageContactsEnabled_forDSID_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)requestToManageContactsForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[STPrivateServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __75__STPrivateServiceClient_requestToManageContactsForDSID_completionHandler___block_invoke;
  v15 = &unk_1E9370B40;
  v16 = v6;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "requestToManageContactsForDSID:completionHandler:", v10, v9, v12, v13, v14, v15);
}

void __75__STPrivateServiceClient_requestToManageContactsForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__STPrivateServiceClient_requestToManageContactsForDSID_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)fetchContactManagementStateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[STPrivateServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __79__STPrivateServiceClient_fetchContactManagementStateForDSID_completionHandler___block_invoke;
  v15 = &unk_1E9370B40;
  v16 = v6;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fetchContactManagementStateForDSID:completionHandler:", v10, v9, v12, v13, v14, v15);
}

void __79__STPrivateServiceClient_fetchContactManagementStateForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__STPrivateServiceClient_fetchContactManagementStateForDSID_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (id)primaryiCloudCardDAVAccountIdentifierWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__20;
  v23 = __Block_byref_object_dispose__20;
  v24 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__STPrivateServiceClient_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke;
  v18[3] = &unk_1E9370AF0;
  v18[4] = &v19;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20[5])
  {
    +[STLog privateService](STLog, "privateService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STContactsServiceClient restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:].cold.1();

    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v20[5]);
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__20;
    v16 = __Block_byref_object_dispose__20;
    v17 = 0;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __73__STPrivateServiceClient_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke_103;
    v11[3] = &unk_1E9371848;
    v11[4] = &v19;
    v11[5] = &v12;
    objc_msgSend(v6, "primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:", v11);
    if (v20[5])
    {
      +[STLog privateService](STLog, "privateService");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[STPrivateServiceClient primaryiCloudCardDAVAccountIdentifierWithError:].cold.1();

      if (a3)
        *a3 = objc_retainAutorelease((id)v20[5]);
    }
    v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  _Block_object_dispose(&v19, 8);

  return v8;
}

void __73__STPrivateServiceClient_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__STPrivateServiceClient_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)contactsEditable
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  char v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__20;
  v18 = __Block_byref_object_dispose__20;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__STPrivateServiceClient_contactsEditable__block_invoke;
  v9[3] = &unk_1E9370AF0;
  v9[4] = &v14;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15[5])
  {
    +[STLog privateService](STLog, "privateService");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient contactsEditable].cold.1();

  }
  else
  {
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __42__STPrivateServiceClient_contactsEditable__block_invoke_105;
    v8[3] = &unk_1E9371780;
    v8[4] = &v10;
    objc_msgSend(v4, "fetchContactsEditableWithReplyHandler:", v8);
  }
  v6 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __42__STPrivateServiceClient_contactsEditable__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __42__STPrivateServiceClient_contactsEditable__block_invoke_105(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v5)
  {
    +[STLog privateService](STLog, "privateService");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__STPrivateServiceClient_contactsEditable__block_invoke_105_cold_1();

  }
}

- (void)lastCommunicationLimitsModificationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__STPrivateServiceClient_lastCommunicationLimitsModificationDateForDSID_completionHandler___block_invoke;
  v11[3] = &unk_1E9370BE0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fetchLastCommunicationLimitsModificationDateForDSID:completionHandler:", v7, v9);
}

void __91__STPrivateServiceClient_lastCommunicationLimitsModificationDateForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __91__STPrivateServiceClient_lastCommunicationLimitsModificationDateForDSID_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)applyDefaultUserPoliciesWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__20;
  v14 = __Block_byref_object_dispose__20;
  v15 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__STPrivateServiceClient_applyDefaultUserPoliciesWithError___block_invoke;
  v9[3] = &unk_1E9370AF0;
  v9[4] = &v10;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __60__STPrivateServiceClient_applyDefaultUserPoliciesWithError___block_invoke_2;
  v8[3] = &unk_1E9370AF0;
  v8[4] = &v10;
  objc_msgSend(v6, "applyDefaultUserPoliciesWithCompletionHandler:", v8);
  if (v11[5])
  {
    +[STLog privateService](STLog, "privateService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient applyDefaultUserPoliciesWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease((id)v11[5]);
  }

  _Block_object_dispose(&v10, 8);
}

void __60__STPrivateServiceClient_applyDefaultUserPoliciesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__STPrivateServiceClient_applyDefaultUserPoliciesWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)permitWebFilterURL:(id)a3 pageTitle:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__20;
  v22 = __Block_byref_object_dispose__20;
  v23 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__STPrivateServiceClient_permitWebFilterURL_pageTitle_error___block_invoke;
  v17[3] = &unk_1E9370AF0;
  v17[4] = &v18;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __61__STPrivateServiceClient_permitWebFilterURL_pageTitle_error___block_invoke_2;
  v16[3] = &unk_1E9370AF0;
  v16[4] = &v18;
  objc_msgSend(v12, "permitWebFilterURL:pageTitle:completionHandler:", v8, v9, v16);
  v13 = v19[5];
  if (v13)
  {
    +[STLog privateService](STLog, "privateService");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient permitWebFilterURL:pageTitle:error:].cold.1();

    if (a5)
      *a5 = objc_retainAutorelease((id)v19[5]);
  }

  _Block_object_dispose(&v18, 8);
  return v13 == 0;
}

void __61__STPrivateServiceClient_permitWebFilterURL_pageTitle_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __61__STPrivateServiceClient_permitWebFilterURL_pageTitle_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)isExplicitContentRestricted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__STPrivateServiceClient_isExplicitContentRestricted___block_invoke;
  v12[3] = &unk_1E9370BE0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __54__STPrivateServiceClient_isExplicitContentRestricted___block_invoke_106;
  v10[3] = &unk_1E9371758;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "isExplicitContentRestricted:", v10);

}

void __54__STPrivateServiceClient_isExplicitContentRestricted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __54__STPrivateServiceClient_isExplicitContentRestricted___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchLastModificationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__STPrivateServiceClient_fetchLastModificationDateForDSID_completionHandler___block_invoke;
  v11[3] = &unk_1E9370BE0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fetchLastModificationDateForDSID:completionHandler:", v7, v9);
}

void __77__STPrivateServiceClient_fetchLastModificationDateForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__STPrivateServiceClient_applyIntroductionModel_forDSID_completionHandler___block_invoke;
  v14[3] = &unk_1E9370BE0;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "applyIntroductionModel:forDSID:completionHandler:", v10, v9, v12);
}

void __75__STPrivateServiceClient_applyIntroductionModel_forDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)isAllowFindMyFriendsModificationSetForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__STPrivateServiceClient_isAllowFindMyFriendsModificationSetForDSID_completionHandler___block_invoke;
  v11[3] = &unk_1E9370BE0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "isAllowFindMyFriendsModificationSetForDSID:completionHandler:", v7, v9);
}

void __87__STPrivateServiceClient_isAllowFindMyFriendsModificationSetForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, MEMORY[0x1E0C9AAB0], v3);

}

- (void)updateAllowFindMyFriendsModification:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[STPrivateServiceClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__STPrivateServiceClient_updateAllowFindMyFriendsModification_forDSID_completionHandler___block_invoke;
  v13[3] = &unk_1E9370BE0;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "updateAllowFindMyFriendsModification:forDSID:completionHandler:", v6, v9, v11);
}

void __89__STPrivateServiceClient_updateAllowFindMyFriendsModification_forDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (id)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__20;
  v25 = __Block_byref_object_dispose__20;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__20;
  v19 = __Block_byref_object_dispose__20;
  v20 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__STPrivateServiceClient_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E9370AF0;
  v14[4] = &v21;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __76__STPrivateServiceClient_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E9371120;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "shouldAllowOneMoreMinuteForBundleIdentifier:completionHandler:", v6, v13);
  if (v22[5])
  {
    +[STLog privateService](STLog, "privateService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient shouldAllowOneMoreMinuteForBundleIdentifier:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v22[5]);
  }
  v11 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __76__STPrivateServiceClient_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __76__STPrivateServiceClient_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)shouldAllowOneMoreMinuteForWebDomain:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__20;
  v25 = __Block_byref_object_dispose__20;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__20;
  v19 = __Block_byref_object_dispose__20;
  v20 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__STPrivateServiceClient_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke;
  v14[3] = &unk_1E9370AF0;
  v14[4] = &v21;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __69__STPrivateServiceClient_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke_2;
  v13[3] = &unk_1E9371120;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "shouldAllowOneMoreMinuteForBundleIdentifier:completionHandler:", v6, v13);
  if (v22[5])
  {
    +[STLog privateService](STLog, "privateService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient shouldAllowOneMoreMinuteForWebDomain:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v22[5]);
  }
  v11 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __69__STPrivateServiceClient_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__STPrivateServiceClient_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__20;
  v25 = __Block_byref_object_dispose__20;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__20;
  v19 = __Block_byref_object_dispose__20;
  v20 = 0;
  -[STPrivateServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__STPrivateServiceClient_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke;
  v14[3] = &unk_1E9370AF0;
  v14[4] = &v21;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __78__STPrivateServiceClient_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E9371120;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "shouldAllowOneMoreMinuteForBundleIdentifier:completionHandler:", v6, v13);
  if (v22[5])
  {
    +[STLog privateService](STLog, "privateService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STPrivateServiceClient shouldAllowOneMoreMinuteForCategoryIdentifier:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v22[5]);
  }
  v11 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __78__STPrivateServiceClient_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__STPrivateServiceClient_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)forceFamilyFetchWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__STPrivateServiceClient_forceFamilyFetchWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E9370BE0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "forceFamilyFetchWithCompletionHandler:", v6);
}

void __64__STPrivateServiceClient_forceFamilyFetchWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__STPrivateServiceClient_forceFamilyFetchWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke;
  v14[3] = &unk_1E9370BE0;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "deleteWebHistoryForURL:webApplication:completionHandler:", v10, v9, v12);
}

void __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke;
  v14[3] = &unk_1E9370BE0;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "deleteWebHistoryForURLs:webApplication:completionHandler:", v10, v9, v12);
}

void __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke;
  v14[3] = &unk_1E9370BE0;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "deleteWebHistoryForDomain:webApplication:completionHandler:", v10, v9, v12);
}

void __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke;
  v14[3] = &unk_1E9370BE0;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "deleteWebHistoryDuringInterval:webApplication:completionHandler:", v10, v9, v12);
}

void __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteAllWebHistoryForApplication:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__STPrivateServiceClient_deleteAllWebHistoryForApplication_completionHandler___block_invoke;
  v11[3] = &unk_1E9370BE0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "deleteAllWebApplicationHistory:completionHandler:", v7, v9);
}

void __78__STPrivateServiceClient_deleteAllWebHistoryForApplication_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__STPrivateServiceClient_deleteAllWebHistoryForApplication_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __97__STPrivateServiceClient_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E9370BE0;
  v18 = v10;
  v15 = v10;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "deleteWebHistoryForURL:webApplication:profileIdentifier:completionHandler:", v13, v12, v11, v15);
}

void __97__STPrivateServiceClient_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__STPrivateServiceClient_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E9370BE0;
  v18 = v10;
  v15 = v10;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "deleteWebHistoryForURLs:webApplication:profileIdentifier:completionHandler:", v13, v12, v11, v15);
}

void __98__STPrivateServiceClient_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100__STPrivateServiceClient_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E9370BE0;
  v18 = v10;
  v15 = v10;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "deleteWebHistoryForDomain:webApplication:profileIdentifier:completionHandler:", v13, v12, v11, v15);
}

void __100__STPrivateServiceClient_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E9370BE0;
  v18 = v10;
  v15 = v10;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "deleteWebHistoryDuringInterval:webApplication:profileIdentifier:completionHandler:", v13, v12, v11, v15);
}

void __105__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteAllWebHistoryForApplication:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[STPrivateServiceClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__STPrivateServiceClient_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E9370BE0;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "deleteAllWebApplicationHistory:profileIdentifier:completionHandler:", v10, v9, v12);
}

void __96__STPrivateServiceClient_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog privateService](STLog, "privateService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

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

void __30__STPrivateServiceClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "privateService connection interrupted", v1, 2u);
}

void __30__STPrivateServiceClient_init__block_invoke_90_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D22E7000, log, OS_LOG_TYPE_DEBUG, "privateService connection invalidated", v1, 2u);
}

- (void)isScreenTimeEnabledForLocalUserWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed checking screenTime enabled with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setScreenTimeEnabledForLocalUser:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_0(&dword_1D22E7000, v0, v1, "Failed %s screenTime enabled with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)enableRemoteManagementForDSID:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_0_0(&dword_1D22E7000, v0, v1, "Failed enabling RemoteManagement for dsid %@ with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)isScreenTimeSyncEnabledWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed checking if cloud sync is enabled with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setScreenTimeSyncEnabled:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_0(&dword_1D22E7000, v0, v1, "Failed %s cloud sync enabled with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)shouldRequestMoreTimeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed checking if user should request more time with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed checking if user should request more time with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isContentPrivacyEnabledForDSID:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_0_0(&dword_1D22E7000, v0, v1, "Failed checking if content privacy is enabled for user %@ with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)clearRestrictionsPasscodeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed clearing restrictions passcode with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to get proxy with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_99_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to check if restrictions passcode is set with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)needsToSetRestrictionsPasscodeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to get needsToSetRestrictionsPasscode with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__STPrivateServiceClient_setRestrictionsPasscode_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to update passcode with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__STPrivateServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to authenticate passcode with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch private service proxy with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)communicationPoliciesWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch Communication Policies with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__STPrivateServiceClient_setManageContactsEnabled_forDSID_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to set manageContactsEnabled with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STPrivateServiceClient_requestToManageContactsForDSID_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_0_0(&dword_1D22E7000, v0, v1, "Failed to request to manage contacts for DSID %@ with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __79__STPrivateServiceClient_fetchContactManagementStateForDSID_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_0_0(&dword_1D22E7000, v0, v1, "Failed to get contactManagementState for DSID %@ with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)primaryiCloudCardDAVAccountIdentifierWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch primary icloud DAV Account Identifier with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)contactsEditable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to get private service proxy with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__STPrivateServiceClient_contactsEditable__block_invoke_105_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch contactsEditable with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__STPrivateServiceClient_lastCommunicationLimitsModificationDateForDSID_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to get private service proxy with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applyDefaultUserPoliciesWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Applying default user policies failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)permitWebFilterURL:pageTitle:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Allowing a page through web content filter in safari failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)shouldAllowOneMoreMinuteForBundleIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "shouldAllowOneMoreMinuteForBundleIdentifier failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)shouldAllowOneMoreMinuteForWebDomain:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "shouldAllowOneMoreMinuteForWebDomain failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)shouldAllowOneMoreMinuteForCategoryIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "shouldAllowOneMoreMinuteForCategoryIdentifier failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__STPrivateServiceClient_forceFamilyFetchWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "forceFamilyFetchWithCompletionHandler failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "deleteWebHistoryForURL failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "deleteWebHistoryForURLs failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "deleteWebHistoryForDomain failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "deleteWebHistoryDuringInterval failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__STPrivateServiceClient_deleteAllWebHistoryForApplication_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "deleteAllWebHistoryForApplication failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
