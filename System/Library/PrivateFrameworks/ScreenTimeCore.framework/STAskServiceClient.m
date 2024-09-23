@implementation STAskServiceClient

- (STAskServiceClient)init
{
  STAskServiceClient *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STAskServiceClient;
  v2 = -[STAskServiceClient init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC90558);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.ask-for-time"), 4096);
  objc_msgSend(v4, "setRemoteObjectInterface:", v3);
  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_12);
  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_20);
  objc_msgSend(v4, "activate");
  -[STAskServiceClient setConnection:](v2, "setConnection:", v4);

  return v2;
}

void __26__STAskServiceClient_init__block_invoke()
{
  NSObject *v0;

  +[STLog settingsService](STLog, "settingsService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __26__STAskServiceClient_init__block_invoke_cold_1();

}

void __26__STAskServiceClient_init__block_invoke_19()
{
  NSObject *v0;

  +[STLog settingsService](STLog, "settingsService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __26__STAskServiceClient_init__block_invoke_19_cold_1();

}

- (STAskServiceClient)initWithAlternateMachService
{
  STAskServiceClient *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STAskServiceClient;
  v2 = -[STAskServiceClient init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC90558);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.ask"), 4096);
  objc_msgSend(v4, "setRemoteObjectInterface:", v3);
  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_21);
  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_23);
  objc_msgSend(v4, "activate");
  -[STAskServiceClient setConnection:](v2, "setConnection:", v4);

  return v2;
}

void __50__STAskServiceClient_initWithAlternateMachService__block_invoke()
{
  NSObject *v0;

  +[STLog settingsService](STLog, "settingsService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __50__STAskServiceClient_initWithAlternateMachService__block_invoke_cold_1();

}

void __50__STAskServiceClient_initWithAlternateMachService__block_invoke_22()
{
  NSObject *v0;

  +[STLog settingsService](STLog, "settingsService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __50__STAskServiceClient_initWithAlternateMachService__block_invoke_22_cold_1();

}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STAskServiceClient;
  -[STAskServiceClient dealloc](&v4, sel_dealloc);
}

- (void)sendAskForTimeRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD);
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = _os_activity_create(&dword_1D22E7000, "STAskServiceClient.sendAskForTimeRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__8;
  v20 = __Block_byref_object_dispose__8;
  v21 = 0;
  -[STAskServiceClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E9370AF0;
  v15[4] = &v16;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17[5])
  {
    +[STLog privateService](STLog, "privateService");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[STAskServiceClient sendAskForTimeRequest:completionHandler:].cold.1();

    if (v7)
      v7[2](v7, v17[5]);
  }
  else
  {
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_27;
    v13[3] = &unk_1E9370B40;
    v13[4] = self;
    v14 = v7;
    objc_msgSend(v11, "sendAskForTimeRequest:completionHandler:", v6, v13);

  }
  _Block_object_dispose(&v16, 8);

  os_activity_scope_leave(&state);
}

void __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[STLog askClient](STLog, "askClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)approveExceptionForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = _os_activity_create(&dword_1D22E7000, "STAskServiceClient.approveExceptionForRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  -[STAskServiceClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__STAskServiceClient_approveExceptionForRequest_completionHandler___block_invoke;
  v12[3] = &unk_1E9370AF0;
  v12[4] = &v13;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14[5])
  {
    +[STLog privateService](STLog, "privateService");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[STAskServiceClient approveExceptionForRequest:completionHandler:].cold.1();

    if (v7)
      v7[2](v7, v14[5]);
  }
  else
  {
    objc_msgSend(v10, "approveExceptionForRequest:completionHandler:", v6, v7);
  }

  _Block_object_dispose(&v13, 8);
  os_activity_scope_leave(&state);

}

void __67__STAskServiceClient_approveExceptionForRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[STLog askClient](STLog, "askClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  os_activity_scope_state_s state;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  v13 = _os_activity_create(&dword_1D22E7000, "STAskServiceClient.handleAnswer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  v23 = 0;
  -[STAskServiceClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__STAskServiceClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke;
  v17[3] = &unk_1E9370AF0;
  v17[4] = &v18;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19[5])
  {
    +[STLog privateService](STLog, "privateService");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[STAskServiceClient handleAnswer:requestIdentifier:timeApproved:completionHandler:].cold.1();

    if (v12)
      v12[2](v12, v19[5]);
  }
  else
  {
    objc_msgSend(v15, "handleAnswer:requestIdentifier:timeApproved:completionHandler:", a3, v10, v11, v12);
  }

  _Block_object_dispose(&v18, 8);
  os_activity_scope_leave(&state);

}

void __84__STAskServiceClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[STLog askClient](STLog, "askClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (BOOL)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = _os_activity_create(&dword_1D22E7000, "STAskServiceClient.respondToAskForTimeRequestWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  v23 = 0;
  -[STAskServiceClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke;
  v17[3] = &unk_1E9371148;
  v17[4] = &v18;
  v17[5] = &v24;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_28;
  v16[3] = &unk_1E9371148;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v12, "respondToAskForTimeRequestWithIdentifier:answer:completionHandler:", v8, a4, v16);
  if (a5)
  {
    v13 = (void *)v19[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  os_activity_scope_leave(&state);

  return v14;
}

void __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  +[STLog askClient](STLog, "askClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_28(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    +[STLog askClient](STLog, "askClient");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_28_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __26__STAskServiceClient_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "askService connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __26__STAskServiceClient_init__block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "askService connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __50__STAskServiceClient_initWithAlternateMachService__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "alternate askService connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __50__STAskServiceClient_initWithAlternateMachService__block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "alternate askService connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)sendAskForTimeRequest:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "sendAskForTimeRequest failed with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "XPC error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)approveExceptionForRequest:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "approveExceptionForRequest failed with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleAnswer:requestIdentifier:timeApproved:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "handleAnswer failed with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Error handling answer for ask for more request : %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
