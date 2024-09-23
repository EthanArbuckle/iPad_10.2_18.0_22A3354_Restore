@implementation STContactsServiceClient

- (STContactsServiceClient)init
{
  STContactsServiceClient *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STContactsServiceClient;
  v2 = -[STContactsServiceClient init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC904F8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.Contacts"), 4096);
    objc_msgSend(v4, "setRemoteObjectInterface:", v3);
    objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_5);
    objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_14);
    objc_msgSend(v4, "resume");
    -[STContactsServiceClient setConnection:](v2, "setConnection:", v4);

  }
  return v2;
}

void __31__STContactsServiceClient_init__block_invoke()
{
  NSObject *v0;

  +[STLog contactsService](STLog, "contactsService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __31__STContactsServiceClient_init__block_invoke_cold_1(v0);

}

void __31__STContactsServiceClient_init__block_invoke_13()
{
  NSObject *v0;

  +[STLog contactsService](STLog, "contactsService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __31__STContactsServiceClient_init__block_invoke_13_cold_1(v0);

}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STContactsServiceClient;
  -[STContactsServiceClient dealloc](&v4, sel_dealloc);
}

- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  -[STContactsServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__STContactsServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E9371148;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __74__STContactsServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v11;
  v9[5] = &v17;
  objc_msgSend(v7, "isRestrictionsPasscodeSetWithCompletionHandler:", v9);
  if (v12[5])
  {
    +[STLog contactsService](STLog, "contactsService");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STContactsServiceClient isRestrictionsPasscodeSetWithCompletionHandler:].cold.1();

  }
  if (v4)
    v4[2](v4, *((unsigned __int8 *)v18 + 24), v12[5]);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

}

void __74__STContactsServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __74__STContactsServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
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

- (void)authenticateRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  -[STContactsServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__STContactsServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke;
  v11[3] = &unk_1E9370AF0;
  v11[4] = &v12;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13[5])
  {
    +[STLog contactsService](STLog, "contactsService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STContactsServiceClient authenticateRestrictionsPasscode:completionHandler:].cold.1();

    if (v7)
      v7[2](v7, v13[5]);
  }
  objc_msgSend(v9, "authenticateRestrictionsPasscode:completionHandler:", v6, v7);

  _Block_object_dispose(&v12, 8);
}

void __78__STContactsServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  -[STContactsServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__STContactsServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E9370AF0;
  v8[4] = &v9;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10[5])
  {
    +[STLog contactsService](STLog, "contactsService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STContactsServiceClient restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:].cold.1();

    if (v4)
      (*((void (**)(id, _QWORD, _QWORD, uint64_t))v4 + 2))(v4, 0, 0, v10[5]);
  }
  else
  {
    objc_msgSend(v6, "restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:", v4);
  }

  _Block_object_dispose(&v9, 8);
}

void __100__STContactsServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)presentRemotePINControllerWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = (void (**)(id, _QWORD))a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  -[STContactsServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__STContactsServiceClient_presentRemotePINControllerWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E9370AF0;
  v8[4] = &v9;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10[5])
  {
    +[STLog contactsService](STLog, "contactsService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STContactsServiceClient restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:].cold.1();

    if (v4)
      v4[2](v4, v10[5]);
  }
  else
  {
    objc_msgSend(v6, "presentRemotePINControllerWithCompletionHandler:", v4);
  }

  _Block_object_dispose(&v9, 8);
}

void __75__STContactsServiceClient_presentRemotePINControllerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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

void __31__STContactsServiceClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "contactsService connection interrupted", v1, 2u);
}

void __31__STContactsServiceClient_init__block_invoke_13_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D22E7000, log, OS_LOG_TYPE_DEBUG, "contactsService connection invalidated", v1, 2u);
}

- (void)isRestrictionsPasscodeSetWithCompletionHandler:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed checking restrictions passcode with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)authenticateRestrictionsPasscode:completionHandler:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to authenticate passcode with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch private service proxy with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
