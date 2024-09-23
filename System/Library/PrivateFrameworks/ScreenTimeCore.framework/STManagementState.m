@implementation STManagementState

- (STManagementState)init
{
  STManagementState *v2;
  STPrivateServiceClient *v3;
  STPrivateServiceClient *privateServiceClient;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STManagementState;
  v2 = -[STManagementState init](&v8, sel_init);
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = objc_alloc_init(STPrivateServiceClient);
      privateServiceClient = v2->_privateServiceClient;
      v2->_privateServiceClient = v3;

    }
    else
    {
      v5 = +[STScreenTimeAgentPrivateConnection newConnection](STScreenTimeAgentPrivateConnection, "newConnection");
      connection = v2->_connection;
      v2->_connection = v5;

      -[NSXPCConnection resume](v2->_connection, "resume");
    }
  }
  return v2;
}

- (void)communicationPoliciesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "communicationPoliciesWithCompletionHandler:", v4);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__STManagementState_communicationPoliciesWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E9370BE0;
    v8 = v4;
    v13 = v8;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __64__STManagementState_communicationPoliciesWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E93717F8;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "communicationPoliciesWithCompletionHandler:", v10);

  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

uint64_t __64__STManagementState_communicationPoliciesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  objc_super v3;

  if ((_os_feature_enabled_impl() & 1) == 0)
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STManagementState;
  -[STManagementState dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldRequestMoreTime
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  char v12;
  _QWORD v14[7];
  _QWORD v15[7];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[3];
  char v22;

  +[STLog ask](STLog, "ask");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[STManagementState shouldRequestMoreTime].cold.3();

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v5 = objc_msgSend(v4, "shouldRequestMoreTimeWithError:", &v16);
    v6 = v16;
    *((_BYTE *)v18 + 24) = v5;

    if (v6)
    {
      +[STLog ask](STLog, "ask");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[STManagementState shouldRequestMoreTime].cold.2();

    }
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__STManagementState_shouldRequestMoreTime__block_invoke;
    v15[3] = &unk_1E93716B8;
    v15[4] = self;
    v15[5] = &v17;
    v15[6] = v21;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __42__STManagementState_shouldRequestMoreTime__block_invoke_7;
    v14[3] = &unk_1E93716E0;
    v14[4] = self;
    v14[5] = &v17;
    v14[6] = v21;
    objc_msgSend(v10, "shouldRequestMoreTimeWithCompletionHandler:", v14);

  }
  +[STLog ask](STLog, "ask");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[STManagementState shouldRequestMoreTime].cold.1();

  v12 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);
  return v12;
}

void __42__STManagementState_shouldRequestMoreTime__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42__STManagementState_shouldRequestMoreTime__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "cachedShouldRequestMoreTime");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __42__STManagementState_shouldRequestMoreTime__block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  char v7;

  v5 = a3;
  if (v5)
  {
    +[STLog ask](STLog, "ask");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__STManagementState_shouldRequestMoreTime__block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "cachedShouldRequestMoreTime");
    v7 = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    objc_msgSend(*(id *)(a1 + 32), "setCachedShouldRequestMoreTime:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v7 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

}

- (void)shouldRequestMoreTime:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  +[STLog ask](STLog, "ask");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STManagementState shouldRequestMoreTime:].cold.1();

  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__STManagementState_shouldRequestMoreTime___block_invoke;
    v18[3] = &unk_1E9371708;
    v7 = &v19;
    v19 = v4;
    v8 = v4;
    objc_msgSend(v6, "shouldRequestMoreTimeWithCompletionHandler:", v18);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__STManagementState_shouldRequestMoreTime___block_invoke_16;
    v16[3] = &unk_1E9371730;
    v7 = &v17;
    v11 = v4;
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __43__STManagementState_shouldRequestMoreTime___block_invoke_17;
    v14[3] = &unk_1E9371758;
    v14[4] = self;
    v15 = v11;
    v13 = v11;
    objc_msgSend(v12, "shouldRequestMoreTimeWithCompletionHandler:", v14);

  }
}

void __43__STManagementState_shouldRequestMoreTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    +[STLog ask](STLog, "ask");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __43__STManagementState_shouldRequestMoreTime___block_invoke_cold_1();

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

}

void __43__STManagementState_shouldRequestMoreTime___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42__STManagementState_shouldRequestMoreTime__block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, objc_msgSend(*(id *)(a1 + 32), "cachedShouldRequestMoreTime"));

}

void __43__STManagementState_shouldRequestMoreTime___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    +[STLog ask](STLog, "ask");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __43__STManagementState_shouldRequestMoreTime___block_invoke_17_cold_1();

    a2 = objc_msgSend(*(id *)(a1 + 32), "cachedShouldRequestMoreTime");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedShouldRequestMoreTime:", a2);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

}

- (BOOL)isRestrictionsPasscodeSet
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  char v10;
  _QWORD v12[7];
  _QWORD v13[7];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[3];
  char v20;

  +[STLog ask](STLog, "ask");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[STManagementState isRestrictionsPasscodeSet].cold.2();

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v5 = objc_msgSend(v4, "isRestrictionsPasscodeSetWithError:", &v14);
    v6 = v14;
    *((_BYTE *)v16 + 24) = v5;

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__STManagementState_isRestrictionsPasscodeSet__block_invoke;
    v13[3] = &unk_1E93716B8;
    v13[4] = self;
    v13[5] = &v15;
    v13[6] = v19;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_18;
    v12[3] = &unk_1E93716E0;
    v12[4] = self;
    v12[5] = &v15;
    v12[6] = v19;
    objc_msgSend(v6, "isRestrictionsPasscodeSetWithCompletionHandler:", v12);
  }

  +[STLog ask](STLog, "ask");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[STManagementState isRestrictionsPasscodeSet].cold.1();

  v10 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);
  return v10;
}

void __46__STManagementState_isRestrictionsPasscodeSet__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "cachedIsRestrictionsPasscodeSet");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  char v7;

  v5 = a3;
  if (v5)
  {
    +[STLog ask](STLog, "ask");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_18_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "cachedIsRestrictionsPasscodeSet");
    v7 = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    objc_msgSend(*(id *)(a1 + 32), "setCachedIsRestrictionsPasscodeSet:", a2);
    v7 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

}

- (BOOL)clearRestrictionsPasscodeWithError:(id *)a3
{
  void *v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[5];
  _QWORD v19[5];
  id obj;
  uint64_t v21;
  _QWORD v22[4];
  id v23;

  v21 = 0;
  v22[0] = &v21;
  v22[1] = 0x3032000000;
  v22[2] = __Block_byref_object_copy__11;
  v22[3] = __Block_byref_object_dispose__11;
  v23 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id *)(v22[0] + 40);
    obj = *(id *)(v22[0] + 40);
    objc_msgSend(v5, "clearRestrictionsPasscodeWithError:", &obj);
    objc_storeStrong(v6, obj);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__STManagementState_clearRestrictionsPasscodeWithError___block_invoke;
    v19[3] = &unk_1E9370AF0;
    v19[4] = &v21;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __56__STManagementState_clearRestrictionsPasscodeWithError___block_invoke_2;
    v18[3] = &unk_1E9370AF0;
    v18[4] = &v21;
    objc_msgSend(v5, "clearRestrictionsPasscodeWithCompletionHandler:", v18);
  }

  v9 = *(_QWORD *)(v22[0] + 40);
  if (v9)
  {
    +[STLog ask](STLog, "ask");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STManagementState clearRestrictionsPasscodeWithError:].cold.1((uint64_t)v22, v10, v11, v12, v13, v14, v15, v16);

    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(v22[0] + 40));
  }
  _Block_object_dispose(&v21, 8);

  return v9 == 0;
}

void __56__STManagementState_clearRestrictionsPasscodeWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__STManagementState_clearRestrictionsPasscodeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)isRestrictionsPasscodeSet:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  +[STLog ask](STLog, "ask");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STManagementState isRestrictionsPasscodeSet:].cold.1();

  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__STManagementState_isRestrictionsPasscodeSet___block_invoke;
    v18[3] = &unk_1E9371708;
    v7 = &v19;
    v19 = v4;
    v8 = v4;
    objc_msgSend(v6, "isRestrictionsPasscodeSetWithCompletionHandler:", v18);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_23;
    v16[3] = &unk_1E9371730;
    v7 = &v17;
    v11 = v4;
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_24;
    v14[3] = &unk_1E9371758;
    v14[4] = self;
    v15 = v11;
    v13 = v11;
    objc_msgSend(v12, "isRestrictionsPasscodeSetWithCompletionHandler:", v14);

  }
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    +[STLog ask](STLog, "ask");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_cold_1();

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_23_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, objc_msgSend(*(id *)(a1 + 32), "cachedIsRestrictionsPasscodeSet"));

}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    +[STLog ask](STLog, "ask");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_24_cold_1();

    a2 = objc_msgSend(*(id *)(a1 + 32), "cachedIsRestrictionsPasscodeSet");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedIsRestrictionsPasscodeSet:", a2);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

}

- (BOOL)needsToSetRestrictionsPasscode
{
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  char v7;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (!_os_feature_enabled_impl())
  {
    -[STManagementState connection](self, "connection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke_25;
    v9[3] = &unk_1E9371780;
    v9[4] = &v11;
    -[NSObject needsToSetRestrictionsPasscodeWithReplyHandler:](v6, "needsToSetRestrictionsPasscodeWithReplyHandler:", v9);
LABEL_6:

    goto LABEL_7;
  }
  -[STManagementState privateServiceClient](self, "privateServiceClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v4 = objc_msgSend(v3, "needsToSetRestrictionsPasscodeWithError:", &v10);
  v5 = v10;
  *((_BYTE *)v12 + 24) = v4;

  if (v5)
  {
    +[STLog ask](STLog, "ask");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[STManagementState needsToSetRestrictionsPasscode].cold.1();
    goto LABEL_6;
  }
LABEL_7:

  v7 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[STLog ask](STLog, "ask");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke_cold_1();

}

void __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke_25(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    +[STLog ask](STLog, "ask");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[STManagementState needsToSetRestrictionsPasscode].cold.1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }

}

- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRestrictionsPasscode:completionHandler:", v7, v6);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke;
    v11[3] = &unk_1E9370BE0;
    v12 = v6;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRestrictionsPasscode:completionHandler:", v7, &__block_literal_global_26);

  }
}

uint64_t __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;

  v2 = a2;
  +[STLog screentime](STLog, "screentime");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2_cold_2();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2_cold_1();
  }

}

- (void)authenticateRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "authenticateRestrictionsPasscode:completionHandler:", v7, v6);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__STManagementState_authenticateRestrictionsPasscode_completionHandler___block_invoke;
    v15[3] = &unk_1E9370BE0;
    v11 = v6;
    v16 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __72__STManagementState_authenticateRestrictionsPasscode_completionHandler___block_invoke_2;
    v13[3] = &unk_1E9370B40;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v12, "authenticateRestrictionsPasscode:replyHandler:", v7, v13);

  }
}

uint64_t __72__STManagementState_authenticateRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__STManagementState_authenticateRestrictionsPasscode_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)screenTimeStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  _QWORD v14[5];
  void (**v15)(id, _QWORD, id);
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = (void (**)(id, _QWORD, id))a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v6 = objc_msgSend(v5, "isScreenTimeEnabledForLocalUserWithError:", &v18);
    v7 = v18;

    if (v4)
    {
      v8 = 1;
      if (v6)
        v8 = 2;
      if (v7)
        v9 = 0;
      else
        v9 = v8;
      v4[2](v4, v9, v7);
    }
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__STManagementState_screenTimeStateWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E9370BE0;
    v12 = v4;
    v17 = v12;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __58__STManagementState_screenTimeStateWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E93717A8;
    v14[4] = self;
    v15 = v12;
    objc_msgSend(v13, "screenTimeStateWithCompletionHandler:", v14);

    v7 = v17;
  }

}

uint64_t __58__STManagementState_screenTimeStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__STManagementState_screenTimeStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)setScreenTimeEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id *)(v17 + 5);
    obj = (id)v17[5];
    objc_msgSend(v7, "setScreenTimeEnabledForLocalUser:error:", v5, &obj);
    objc_storeStrong(v8, obj);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__STManagementState_setScreenTimeEnabled_error___block_invoke;
    v14[3] = &unk_1E9370AF0;
    v14[4] = &v16;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __48__STManagementState_setScreenTimeEnabled_error___block_invoke_2;
    v13[3] = &unk_1E9370AF0;
    v13[4] = &v16;
    objc_msgSend(v7, "setScreenTimeEnabled:completionHandler:", v5, v13);
  }

  v11 = (void *)v17[5];
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v16, 8);

  return v11 == 0;
}

void __48__STManagementState_setScreenTimeEnabled_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__STManagementState_setScreenTimeEnabled_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)enableScreenTimeForDSID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id *)(v17 + 5);
    obj = (id)v17[5];
    objc_msgSend(v7, "setScreenTimeEnabledForRemoteUserWithDSID:enabled:error:", v6, 1, &obj);
    objc_storeStrong(v8, obj);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__STManagementState_enableScreenTimeForDSID_error___block_invoke;
    v14[3] = &unk_1E9370AF0;
    v14[4] = &v16;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __51__STManagementState_enableScreenTimeForDSID_error___block_invoke_2;
    v13[3] = &unk_1E9370AF0;
    v13[4] = &v16;
    objc_msgSend(v7, "enableScreenTimeForDSID:completionHandler:", v6, v13);
  }

  v11 = (void *)v17[5];
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v16, 8);

  return v11 == 0;
}

void __51__STManagementState_enableScreenTimeForDSID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__STManagementState_enableScreenTimeForDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)enableRemoteManagementForDSID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id *)(v17 + 5);
    obj = (id)v17[5];
    objc_msgSend(v7, "enableRemoteManagementForDSID:error:", v6, &obj);
    objc_storeStrong(v8, obj);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__STManagementState_enableRemoteManagementForDSID_error___block_invoke;
    v14[3] = &unk_1E9370AF0;
    v14[4] = &v16;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __57__STManagementState_enableRemoteManagementForDSID_error___block_invoke_2;
    v13[3] = &unk_1E9370AF0;
    v13[4] = &v16;
    objc_msgSend(v7, "enableRemoteManagementForDSID:completionHandler:", v6, v13);
  }

  v11 = (void *)v17[5];
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v16, 8);

  return v11 == 0;
}

void __57__STManagementState_enableRemoteManagementForDSID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__STManagementState_enableRemoteManagementForDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, id);
  void *v7;
  void (**v8)(id, id);
  void *v9;
  uint64_t v10;
  void (**v11)(id, id);
  void *v12;
  _QWORD v13[5];
  void (**v14)(id, id);
  _QWORD v15[4];
  void (**v16)(id, id);
  id v17;

  v4 = a3;
  v6 = (void (**)(id, id))a4;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "setScreenTimeEnabledForLocalUser:error:", v4, &v17);
    v8 = (void (**)(id, id))v17;

    if (v6)
      v6[2](v6, v8);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__STManagementState_setScreenTimeEnabled_completionHandler___block_invoke;
    v15[3] = &unk_1E9370BE0;
    v11 = v6;
    v16 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __60__STManagementState_setScreenTimeEnabled_completionHandler___block_invoke_2;
    v13[3] = &unk_1E9370B40;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v12, "setScreenTimeEnabled:completionHandler:", v4, v13);

    v8 = v16;
  }

}

uint64_t __60__STManagementState_setScreenTimeEnabled_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__STManagementState_setScreenTimeEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, id);
  void *v7;
  void (**v8)(id, id);
  void *v9;
  uint64_t v10;
  void (**v11)(id, id);
  void *v12;
  _QWORD v13[5];
  void (**v14)(id, id);
  _QWORD v15[4];
  void (**v16)(id, id);
  id v17;

  v4 = a3;
  v6 = (void (**)(id, id))a4;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "setScreenTimeSyncEnabled:error:", v4, &v17);
    v8 = (void (**)(id, id))v17;

    if (v6)
      v6[2](v6, v8);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__STManagementState_setScreenTimeSyncingEnabled_completionHandler___block_invoke;
    v15[3] = &unk_1E9370BE0;
    v11 = v6;
    v16 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __67__STManagementState_setScreenTimeSyncingEnabled_completionHandler___block_invoke_2;
    v13[3] = &unk_1E9370B40;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v12, "setScreenTimeSyncingEnabled:completionHandler:", v4, v13);

    v8 = v16;
  }

}

uint64_t __67__STManagementState_setScreenTimeSyncingEnabled_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__STManagementState_setScreenTimeSyncingEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)screenTimeSyncStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E9371708;
    v6 = &v17;
    v17 = v4;
    v7 = v4;
    objc_msgSend(v5, "isScreenTimeSyncEnabledWithCompletionHandler:", v16);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E9370BE0;
    v6 = &v15;
    v10 = v4;
    v15 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E93717A8;
    v12[4] = self;
    v13 = v10;
    v11 = v10;
    objc_msgSend(v5, "screenTimeSyncStateWithCompletionHandler:", v12);

  }
}

uint64_t __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v4 = 1;
    if (a2)
      v4 = 2;
    if (a3)
      v5 = 0;
    else
      v5 = v4;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

uint64_t __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)isContentPrivacyEnabledForDSID:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, void *, id);
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(id, void *, id);
  void *v15;
  _QWORD v16[5];
  void (**v17)(id, void *, id);
  _QWORD v18[4];
  void (**v19)(id, void *, id);
  id v20;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v9 = objc_msgSend(v8, "isContentPrivacyEnabledForDSID:error:", v7, &v20);

    v10 = (void (**)(id, void *, id))v20;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v11, v10);

    }
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__STManagementState_isContentPrivacyEnabledForDSID_completionHandler___block_invoke;
    v18[3] = &unk_1E9370BE0;
    v14 = v6;
    v19 = v14;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __70__STManagementState_isContentPrivacyEnabledForDSID_completionHandler___block_invoke_2;
    v16[3] = &unk_1E93717D0;
    v16[4] = self;
    v17 = v14;
    objc_msgSend(v15, "isContentPrivacyEnabledForDSID:completionHandler:", v7, v16);

    v10 = v19;
  }

}

uint64_t __70__STManagementState_isContentPrivacyEnabledForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__STManagementState_isContentPrivacyEnabledForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __64__STManagementState_communicationPoliciesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)communicationPoliciesWithError:(id *)a3
{
  void *v5;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__11;
  v26 = __Block_byref_object_dispose__11;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v23;
    obj = v23[5];
    objc_msgSend(v5, "communicationPoliciesWithError:", &obj);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v6 + 5, obj);
    v8 = (void *)v17[5];
    v17[5] = v7;

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__STManagementState_communicationPoliciesWithError___block_invoke;
    v14[3] = &unk_1E9370AF0;
    v14[4] = &v22;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __52__STManagementState_communicationPoliciesWithError___block_invoke_2;
    v13[3] = &unk_1E9371820;
    v13[4] = &v22;
    v13[5] = &v16;
    objc_msgSend(v5, "communicationPoliciesWithCompletionHandler:", v13);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v23[5]);
  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

void __52__STManagementState_communicationPoliciesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__STManagementState_communicationPoliciesWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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
    v14[0] = 0x1E9379A78;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = 0x1E9379A98;
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

- (void)communicationPoliciesForDSID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 200, 0);
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v8);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__STManagementState_communicationPoliciesForDSID_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E9370BE0;
    v11 = v7;
    v16 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __72__STManagementState_communicationPoliciesForDSID_withCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E93717F8;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v12, "communicationPoliciesForDSID:withCompletionHandler:", v6, v13);

  }
}

uint64_t __72__STManagementState_communicationPoliciesForDSID_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__STManagementState_communicationPoliciesForDSID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setManageContactsEnabled:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setManageContactsEnabled:forDSID:completionHandler:", v6, v9, v8);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__STManagementState_setManageContactsEnabled_forDSID_completionHandler___block_invoke;
    v18[3] = &unk_1E9370BE0;
    v13 = v8;
    v19 = v13;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v15 = 2;
    else
      v15 = 0;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __72__STManagementState_setManageContactsEnabled_forDSID_completionHandler___block_invoke_2;
    v16[3] = &unk_1E9370B40;
    v16[4] = self;
    v17 = v13;
    objc_msgSend(v14, "setContactManagementState:forDSID:completionHandler:", v15, v9, v16);

  }
}

uint64_t __72__STManagementState_setManageContactsEnabled_forDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__STManagementState_setManageContactsEnabled_forDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)requestToManageContactsForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestToManageContactsForDSID:completionHandler:", v7, v6);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__STManagementState_requestToManageContactsForDSID_completionHandler___block_invoke;
    v15[3] = &unk_1E9370BE0;
    v11 = v6;
    v16 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __70__STManagementState_requestToManageContactsForDSID_completionHandler___block_invoke_2;
    v13[3] = &unk_1E9370B40;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v12, "setContactManagementState:forDSID:completionHandler:", 1, v7, v13);

  }
}

uint64_t __70__STManagementState_requestToManageContactsForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__STManagementState_requestToManageContactsForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)contactManagementStateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchContactManagementStateForDSID:completionHandler:", v7, v6);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__STManagementState_contactManagementStateForDSID_completionHandler___block_invoke;
    v15[3] = &unk_1E9370BE0;
    v11 = v6;
    v16 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __69__STManagementState_contactManagementStateForDSID_completionHandler___block_invoke_2;
    v13[3] = &unk_1E93717A8;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v12, "contactManagementStateForDSID:completionHandler:", v7, v13);

  }
}

uint64_t __69__STManagementState_contactManagementStateForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__STManagementState_contactManagementStateForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)primaryiCloudCardDAVAccountIdentifierWithError:(id *)a3
{
  void *v5;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__11;
  v26 = __Block_byref_object_dispose__11;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v23;
    obj = v23[5];
    objc_msgSend(v5, "primaryiCloudCardDAVAccountIdentifierWithError:", &obj);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v6 + 5, obj);
    v8 = (void *)v17[5];
    v17[5] = v7;

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__STManagementState_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke;
    v14[3] = &unk_1E9370AF0;
    v14[4] = &v22;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __68__STManagementState_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke_2;
    v13[3] = &unk_1E9371848;
    v13[4] = &v22;
    v13[5] = &v16;
    objc_msgSend(v5, "primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:", v13);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v23[5]);
  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

void __68__STManagementState_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__STManagementState_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (BOOL)performMigrationFromMCXSettings:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__11;
  v21 = __Block_byref_object_dispose__11;
  v22 = 0;
  v7 = _os_feature_enabled_impl();
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 200, 0);
    v9 = (void *)v18[5];
    v18[5] = v8;
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__STManagementState_performMigrationFromMCXSettings_error___block_invoke;
    v16[3] = &unk_1E9370AF0;
    v16[4] = &v17;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __59__STManagementState_performMigrationFromMCXSettings_error___block_invoke_2;
    v15[3] = &unk_1E9370AF0;
    v15[4] = &v17;
    objc_msgSend(v9, "performMigrationFromMCXSettings:completionHandler:", v6, v15);
  }

  v12 = (void *)v18[5];
  if (v12)
  {
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    v13 = v7 ^ 1;
  }
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __59__STManagementState_performMigrationFromMCXSettings_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__STManagementState_performMigrationFromMCXSettings_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)applyDefaultUserPoliciesWithError:(id *)a3
{
  void *v5;
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  v18 = __Block_byref_object_dispose__11;
  v19 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id *)(v15 + 5);
    obj = (id)v15[5];
    objc_msgSend(v5, "applyDefaultUserPoliciesWithError:", &obj);
    objc_storeStrong(v6, obj);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__STManagementState_applyDefaultUserPoliciesWithError___block_invoke;
    v12[3] = &unk_1E9370AF0;
    v12[4] = &v14;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __55__STManagementState_applyDefaultUserPoliciesWithError___block_invoke_2;
    v11[3] = &unk_1E9370AF0;
    v11[4] = &v14;
    objc_msgSend(v5, "applyDefaultUserPoliciesWithCompletionHandler:", v11);
  }

  v9 = (void *)v15[5];
  if (a3 && v9)
    *a3 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v14, 8);

  return v9 == 0;
}

void __55__STManagementState_applyDefaultUserPoliciesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __55__STManagementState_applyDefaultUserPoliciesWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)permitWebFilterURL:(id)a3 pageTitle:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)(v20 + 5);
    obj = (id)v20[5];
    objc_msgSend(v10, "permitWebFilterURL:pageTitle:error:", v8, v9, &obj);
    objc_storeStrong(v11, obj);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__STManagementState_permitWebFilterURL_pageTitle_error___block_invoke;
    v17[3] = &unk_1E9370AF0;
    v17[4] = &v19;
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __56__STManagementState_permitWebFilterURL_pageTitle_error___block_invoke_2;
    v16[3] = &unk_1E9370AF0;
    v16[4] = &v19;
    objc_msgSend(v10, "permitWebFilterURL:pageTitle:completionHandler:", v8, v9, v16);
  }

  v14 = (void *)v20[5];
  if (a5 && v14)
    *a5 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v19, 8);

  return v14 == 0;
}

void __56__STManagementState_permitWebFilterURL_pageTitle_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__STManagementState_permitWebFilterURL_pageTitle_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = (id *)&v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;
    obj = v26[5];
    objc_msgSend(v7, "shouldAllowOneMoreMinuteForBundleIdentifier:error:", v6, &obj);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8 + 5, obj);
    v10 = (void *)v20[5];
    v20[5] = v9;

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__STManagementState_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke;
    v17[3] = &unk_1E9370AF0;
    v17[4] = &v25;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __71__STManagementState_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke_2;
    v16[3] = &unk_1E9371120;
    v16[4] = &v25;
    v16[5] = &v19;
    objc_msgSend(v7, "shouldAllowOneMoreMinuteForBundleIdentifier:replyHandler:", v6, v16);
  }

  v13 = (void *)v20[5];
  if (a4 && !v13)
  {
    *a4 = objc_retainAutorelease(v26[5]);
    v13 = (void *)v20[5];
  }
  v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

void __71__STManagementState_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __71__STManagementState_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

- (id)shouldAllowOneMoreMinuteForWebDomain:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = (id *)&v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;
    obj = v26[5];
    objc_msgSend(v7, "shouldAllowOneMoreMinuteForWebDomain:error:", v6, &obj);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8 + 5, obj);
    v10 = (void *)v20[5];
    v20[5] = v9;

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __64__STManagementState_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke;
    v17[3] = &unk_1E9370AF0;
    v17[4] = &v25;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __64__STManagementState_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke_2;
    v16[3] = &unk_1E9371120;
    v16[4] = &v25;
    v16[5] = &v19;
    objc_msgSend(v7, "shouldAllowOneMoreMinuteForWebDomain:replyHandler:", v6, v16);
  }

  v13 = (void *)v20[5];
  if (a4 && !v13)
  {
    *a4 = objc_retainAutorelease(v26[5]);
    v13 = (void *)v20[5];
  }
  v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

void __64__STManagementState_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__STManagementState_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

- (id)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = (id *)&v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;
    obj = v26[5];
    objc_msgSend(v7, "shouldAllowOneMoreMinuteForCategoryIdentifier:error:", v6, &obj);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8 + 5, obj);
    v10 = (void *)v20[5];
    v20[5] = v9;

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__STManagementState_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke;
    v17[3] = &unk_1E9370AF0;
    v17[4] = &v25;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __73__STManagementState_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke_2;
    v16[3] = &unk_1E9371120;
    v16[4] = &v25;
    v16[5] = &v19;
    objc_msgSend(v7, "shouldAllowOneMoreMinuteForCategoryIdentifier:replyHandler:", v6, v16);
  }

  v13 = (void *)v20[5];
  if (a4 && !v13)
  {
    *a4 = objc_retainAutorelease(v26[5]);
    v13 = (void *)v20[5];
  }
  v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

void __73__STManagementState_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__STManagementState_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

- (void)isExplicitContentRestricted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isExplicitContentRestricted:", v4);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__STManagementState_isExplicitContentRestricted___block_invoke;
    v12[3] = &unk_1E9370BE0;
    v8 = v4;
    v13 = v8;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __49__STManagementState_isExplicitContentRestricted___block_invoke_2;
    v10[3] = &unk_1E9371758;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "isExplicitContentRestrictedWithCompletionHandler:", v10);

  }
}

uint64_t __49__STManagementState_isExplicitContentRestricted___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__STManagementState_isExplicitContentRestricted___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)lastModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchLastModificationDateForDSID:completionHandler:", v7, v6);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__STManagementState_lastModifcationDateForDSID_completionHandler___block_invoke;
    v15[3] = &unk_1E9370BE0;
    v11 = v6;
    v16 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __66__STManagementState_lastModifcationDateForDSID_completionHandler___block_invoke_2;
    v13[3] = &unk_1E9371870;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v12, "lastModifcationDateForDSID:completionHandler:", v7, v13);

  }
}

uint64_t __66__STManagementState_lastModifcationDateForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__STManagementState_lastModifcationDateForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)lastCommunicationLimitsModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastCommunicationLimitsModificationDateForDSID:completionHandler:", v7, v6);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__STManagementState_lastCommunicationLimitsModifcationDateForDSID_completionHandler___block_invoke;
    v15[3] = &unk_1E9370BE0;
    v11 = v6;
    v16 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __85__STManagementState_lastCommunicationLimitsModifcationDateForDSID_completionHandler___block_invoke_2;
    v13[3] = &unk_1E9371870;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v12, "lastCommunicationLimitsModifcationDateForDSID:completionHandler:", v7, v13);

  }
}

uint64_t __85__STManagementState_lastCommunicationLimitsModifcationDateForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__STManagementState_lastCommunicationLimitsModifcationDateForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applyIntroductionModel:forDSID:completionHandler:", v10, v9, v8);

  }
  else
  {
    -[STManagementState connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__STManagementState_applyIntroductionModel_forDSID_completionHandler___block_invoke;
    v18[3] = &unk_1E9370BE0;
    v14 = v8;
    v19 = v14;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __70__STManagementState_applyIntroductionModel_forDSID_completionHandler___block_invoke_2;
    v16[3] = &unk_1E9370B40;
    v16[4] = self;
    v17 = v14;
    objc_msgSend(v15, "applyIntroductionModel:forDSID:completionHandler:", v10, v9, v16);

  }
}

uint64_t __70__STManagementState_applyIntroductionModel_forDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__STManagementState_applyIntroductionModel_forDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)isLocationSharingModificationAllowedForDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  +[STLog ask](STLog, "ask");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[STManagementState isLocationSharingModificationAllowedForDSID:completionHandler:].cold.1();

  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "isAllowFindMyFriendsModificationSetForDSID:completionHandler:", v6, v7);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__STManagementState_isLocationSharingModificationAllowedForDSID_completionHandler___block_invoke;
    v16[3] = &unk_1E9370BE0;
    v12 = v7;
    v17 = v12;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __83__STManagementState_isLocationSharingModificationAllowedForDSID_completionHandler___block_invoke_2;
    v14[3] = &unk_1E93717D0;
    v14[4] = self;
    v15 = v12;
    objc_msgSend(v13, "isLocationSharingModificationAllowedForDSID:completionHandler:", v6, v14);

    v9 = v17;
  }

}

uint64_t __83__STManagementState_isLocationSharingModificationAllowedForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__STManagementState_isLocationSharingModificationAllowedForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setLocationSharingModificationAllowed:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  +[STLog ask](STLog, "ask");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[STManagementState setLocationSharingModificationAllowed:forDSID:completionHandler:].cold.1();

  if (_os_feature_enabled_impl())
  {
    -[STManagementState privateServiceClient](self, "privateServiceClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateAllowFindMyFriendsModification:forDSID:completionHandler:", v6, v8, v9);
  }
  else
  {
    -[STManagementState connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__STManagementState_setLocationSharingModificationAllowed_forDSID_completionHandler___block_invoke;
    v18[3] = &unk_1E9370BE0;
    v14 = v9;
    v19 = v14;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __85__STManagementState_setLocationSharingModificationAllowed_forDSID_completionHandler___block_invoke_2;
    v16[3] = &unk_1E9370B40;
    v16[4] = self;
    v17 = v14;
    objc_msgSend(v15, "setLocationSharingModificationAllowed:forDSID:completionHandler:", v6, v8, v16);

    v11 = v19;
  }

}

uint64_t __85__STManagementState_setLocationSharingModificationAllowed_forDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__STManagementState_setLocationSharingModificationAllowed_forDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)postNotificationForContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[STManagementState connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationForContext:", v4);
}

- (BOOL)triggerDowngradeMigrationWithOutError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _QWORD v10[7];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__11;
    v20 = __Block_byref_object_dispose__11;
    v21 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    -[STManagementState connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__STManagementState_triggerDowngradeMigrationWithOutError___block_invoke;
    v11[3] = &unk_1E9371148;
    v11[4] = &v16;
    v11[5] = &v12;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __59__STManagementState_triggerDowngradeMigrationWithOutError___block_invoke_2;
    v10[3] = &unk_1E9371898;
    v10[4] = self;
    v10[5] = &v16;
    v10[6] = &v12;
    objc_msgSend(v7, "triggerDowngradeMigrationWithCompletionHandler:", v10);
    if (a3)
      *a3 = objc_retainAutorelease((id)v17[5]);
    v8 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    v8 = 0;
    if (a3)
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0);
  }
  return v8;
}

void __59__STManagementState_triggerDowngradeMigrationWithOutError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __59__STManagementState_triggerDowngradeMigrationWithOutError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = v3;
  if (v3)
  {
    v3 = v3;
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
}

- (BOOL)cachedShouldRequestMoreTime
{
  return self->_cachedShouldRequestMoreTime;
}

- (void)setCachedShouldRequestMoreTime:(BOOL)a3
{
  self->_cachedShouldRequestMoreTime = a3;
}

- (BOOL)cachedIsRestrictionsPasscodeSet
{
  return self->_cachedIsRestrictionsPasscodeSet;
}

- (void)setCachedIsRestrictionsPasscodeSet:(BOOL)a3
{
  self->_cachedIsRestrictionsPasscodeSet = a3;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (STPrivateServiceClient)privateServiceClient
{
  return self->_privateServiceClient;
}

- (void)setPrivateServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_privateServiceClient, a3);
}

- (BOOL)contactsEditable
{
  return self->_contactsEditable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateServiceClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)shouldRequestMoreTime
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Synchronously calling -shouldRequestMoreTime", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __42__STManagementState_shouldRequestMoreTime__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Requesting more time failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)shouldRequestMoreTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Asynchronously calling -shouldRequestMoreTime:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __43__STManagementState_shouldRequestMoreTime___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed checking if user is managed with error: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__STManagementState_shouldRequestMoreTime___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "fetching should request more time failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isRestrictionsPasscodeSet
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Synchronously calling -isRestrictionsPasscodeSet:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Requesting restrictions passcode failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "failed to fetch isRestrictionsPasscodeSet, falling back to last known good value: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)clearRestrictionsPasscodeWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed clearing restrictions passcode with error: %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isRestrictionsPasscodeSet:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Asynchronously calling -isRestrictionsPasscodeSet:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed checking if restrictions paccode is set with error: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "proxy: fetching isRestrictionPasscodeSet failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "fetching isRestrictionPasscodeSet failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)needsToSetRestrictionsPasscode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to get needsToSetRestrictionsPasscode, %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to communicate with Screen Time agent to get needsToSetRestrictionsPasscode, %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Updated restrictions passcode for local user", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to set Restrictions Passcode, %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isLocationSharingModificationAllowedForDSID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Calling -isLocationSharingModificationAllowedForDSID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)setLocationSharingModificationAllowed:forDSID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Calling -setLocationSharingModificationAllowed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

@end
