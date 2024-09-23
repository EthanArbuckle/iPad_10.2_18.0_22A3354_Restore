@implementation STSettingsServiceClient

- (STSettingsServiceClient)init
{
  STSettingsServiceClient *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSettingsServiceClient;
  v2 = -[STSettingsServiceClient init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC905B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.settings"), 4096);
  objc_msgSend(v4, "setRemoteObjectInterface:", v3);
  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_13);
  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_19);
  objc_msgSend(v4, "activate");
  -[STSettingsServiceClient setConnection:](v2, "setConnection:", v4);

  return v2;
}

void __31__STSettingsServiceClient_init__block_invoke()
{
  NSObject *v0;

  +[STLog settingsService](STLog, "settingsService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __31__STSettingsServiceClient_init__block_invoke_cold_1(v0);

}

void __31__STSettingsServiceClient_init__block_invoke_18()
{
  NSObject *v0;

  +[STLog settingsService](STLog, "settingsService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __31__STSettingsServiceClient_init__block_invoke_18_cold_1(v0);

}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STSettingsServiceClient;
  -[STSettingsServiceClient dealloc](&v4, sel_dealloc);
}

- (id)startCoreDataServerWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_1D22E7000, "STSettingsServiceClient.startCoreDataServer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__10;
  v24 = __Block_byref_object_dispose__10;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  -[STSettingsServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke;
  v13[3] = &unk_1E9370AF0;
  v13[4] = &v14;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke_23;
  v12[3] = &unk_1E9371690;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v8, "startCoreDataServerWithCompletionHandler:", v12);
  if (a3)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v10;
}

void __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[STLog settingsService](STLog, "settingsService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    +[STLog settingsService](STLog, "settingsService");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke_23_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (void)processSettingsChangesSinceHistoryToken:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1D22E7000, "STSettingsServiceClient.processSettingsChangesSinceHistoryToken", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  -[STSettingsServiceClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__STSettingsServiceClient_processSettingsChangesSinceHistoryToken_withCompletion___block_invoke;
  v12[3] = &unk_1E9370BE0;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "processSettingsChangesSinceHistoryToken:completionHandler:", v6, v10);
  os_activity_scope_leave(&state);

}

void __82__STSettingsServiceClient_processSettingsChangesSinceHistoryToken_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog settingsService](STLog, "settingsService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (BOOL)updateLegacyUsageWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_1D22E7000, "STSettingsServiceClient.updateLegacyUsage", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  -[STSettingsServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke;
  v13[3] = &unk_1E9371148;
  v13[4] = &v14;
  v13[5] = &v20;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_25;
  v12[3] = &unk_1E9370B18;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "updateLegacyUsageWithCompletionHandler:", v12);
  if (a3)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v10;
}

void __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  +[STLog settingsService](STLog, "settingsService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_25(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    +[STLog settingsService](STLog, "settingsService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_25_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (BOOL)requestLegacyUsageForUser:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create(&dword_1D22E7000, "STSettingsServiceClient.updateLegacyUsage", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  v21 = 0;
  -[STSettingsServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__STSettingsServiceClient_requestLegacyUsageForUser_withError___block_invoke;
  v15[3] = &unk_1E9371148;
  v15[4] = &v16;
  v15[5] = &v22;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __63__STSettingsServiceClient_requestLegacyUsageForUser_withError___block_invoke_27;
  v14[3] = &unk_1E9370B18;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend(v10, "requestLegacyUsageForUser:withCompletionHandler:", v6, v14);
  if (a4)
  {
    v11 = (void *)v17[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v12 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __63__STSettingsServiceClient_requestLegacyUsageForUser_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  +[STLog settingsService](STLog, "settingsService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __63__STSettingsServiceClient_requestLegacyUsageForUser_withError___block_invoke_27(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    +[STLog settingsService](STLog, "settingsService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_25_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (void)setCloudSync:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[5];
  id v11;
  _QWORD v12[3];
  char v13;

  v4 = a3;
  v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 1;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__10;
  v10[4] = __Block_byref_object_dispose__10;
  v11 = 0;
  -[STSettingsServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__STSettingsServiceClient_setCloudSync_withCompletion___block_invoke;
  v9[3] = &unk_1E9371148;
  v9[4] = v10;
  v9[5] = v12;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCloudSync:withCompletion:", v4, v6);
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(v12, 8);
}

void __55__STSettingsServiceClient_setCloudSync_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  +[STLog settingsService](STLog, "settingsService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

- (BOOL)isCloudSyncEnabled:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
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
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[STSettingsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__STSettingsServiceClient_isCloudSyncEnabled___block_invoke;
  v11[3] = &unk_1E9371148;
  v11[4] = &v12;
  v11[5] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __46__STSettingsServiceClient_isCloudSyncEnabled___block_invoke_28;
  v10[3] = &unk_1E9370B18;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "isCloudSyncEnabled:", v10);
  if (a3)
  {
    v7 = (void *)v13[5];
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
  v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __46__STSettingsServiceClient_isCloudSyncEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  +[STLog settingsService](STLog, "settingsService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __46__STSettingsServiceClient_isCloudSyncEnabled___block_invoke_28(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)isRestrictAdultContentEnabled:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
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
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[STSettingsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__STSettingsServiceClient_isRestrictAdultContentEnabled___block_invoke;
  v11[3] = &unk_1E9371148;
  v11[4] = &v12;
  v11[5] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __57__STSettingsServiceClient_isRestrictAdultContentEnabled___block_invoke_29;
  v10[3] = &unk_1E9370B18;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "isRestrictAdultContentEnabled:", v10);
  if (a3)
  {
    v7 = (void *)v13[5];
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
  v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __57__STSettingsServiceClient_isRestrictAdultContentEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  +[STLog settingsService](STLog, "settingsService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __57__STSettingsServiceClient_isRestrictAdultContentEnabled___block_invoke_29(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

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

void __31__STSettingsServiceClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "settingsService connection interrupted", v1, 2u);
}

void __31__STSettingsServiceClient_init__block_invoke_18_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D22E7000, log, OS_LOG_TYPE_DEBUG, "settingsService connection invalidated", v1, 2u);
}

void __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Error starting core data server : %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_25_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Error processing changes : %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
