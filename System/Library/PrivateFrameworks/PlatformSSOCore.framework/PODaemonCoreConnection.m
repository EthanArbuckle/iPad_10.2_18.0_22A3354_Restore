@implementation PODaemonCoreConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken != -1)
    dispatch_once(&xpcQueue_onceToken, &__block_literal_global_8);
  return (id)xpcQueue_queue;
}

void __34__PODaemonCoreConnection_xpcQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PlatformPSSO.daemon-queue", 0);
  v1 = (void *)xpcQueue_queue;
  xpcQueue_queue = (uint64_t)v0;

}

- (PODaemonCoreConnection)initWithVolume:(id)a3
{
  id v5;
  NSObject *v6;
  PODaemonCoreConnection *v7;
  PODaemonCoreConnection *v8;
  objc_super v10;

  v5 = a3;
  PO_LOG_PODaemonCoreConnection();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreConnection initWithVolume:].cold.1();

  v10.receiver = self;
  v10.super_class = (Class)PODaemonCoreConnection;
  v7 = -[PODaemonCoreConnection init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_volume, a3);
    -[PODaemonCoreConnection _connectToService](v8, "_connectToService");
  }

  return v8;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deviceConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceConfigurationForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)loginConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__PODaemonCoreConnection_loginConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loginConfigurationForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __68__PODaemonCoreConnection_loginConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)userConfigurationForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__PODaemonCoreConnection_userConfigurationForIdentifier_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userConfigurationForIdentifier:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __68__PODaemonCoreConnection_userConfigurationForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)userLoginStateForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __65__PODaemonCoreConnection_userLoginStateForIdentifier_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userLoginStateForIdentifier:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __65__PODaemonCoreConnection_userLoginStateForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)updateLoginStateForIdentifier:(id)a3 state:(id)a4 loginDate:(id)a5 loginType:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __93__PODaemonCoreConnection_updateLoginStateForIdentifier_state_loginDate_loginType_completion___block_invoke;
    v21[3] = &unk_251500520;
    v18 = v16;
    v22 = v18;
    objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateLoginStateForIdentifier:state:loginDate:loginType:completion:", v12, v13, v14, v15, v18);

  }
  else if (v16)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v20);

  }
}

void __93__PODaemonCoreConnection_updateLoginStateForIdentifier_state_loginDate_loginType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)savePendingSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__PODaemonCoreConnection_savePendingSSOTokens_identifer_completion___block_invoke;
    v15[3] = &unk_251500520;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "savePendingSSOTokens:identifer:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __68__PODaemonCoreConnection_savePendingSSOTokens_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)retrievePendingSSOTokenForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __73__PODaemonCoreConnection_retrievePendingSSOTokenForIdentifer_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "retrievePendingSSOTokenForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __73__PODaemonCoreConnection_retrievePendingSSOTokenForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)saveStashedSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__PODaemonCoreConnection_saveStashedSSOTokens_identifer_completion___block_invoke;
    v15[3] = &unk_251500520;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveStashedSSOTokens:identifer:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __68__PODaemonCoreConnection_saveStashedSSOTokens_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)retrieveStashedSSOTokenForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __73__PODaemonCoreConnection_retrieveStashedSSOTokenForIdentifer_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "retrieveStashedSSOTokenForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __73__PODaemonCoreConnection_retrieveStashedSSOTokenForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)saveStashedDecryptionContext:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __76__PODaemonCoreConnection_saveStashedDecryptionContext_identifer_completion___block_invoke;
    v15[3] = &unk_251500520;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveStashedDecryptionContext:identifer:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __76__PODaemonCoreConnection_saveStashedDecryptionContext_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)retrieveStashedDecryptionContextForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __82__PODaemonCoreConnection_retrieveStashedDecryptionContextForIdentifer_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "retrieveStashedDecryptionContextForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __82__PODaemonCoreConnection_retrieveStashedDecryptionContextForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)saveCachedContextsToDiskWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__PODaemonCoreConnection_saveCachedContextsToDiskWithCompletion___block_invoke;
    v9[3] = &unk_251500520;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveCachedContextsToDiskWithCompletion:", v6);

  }
  else if (v4)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __65__PODaemonCoreConnection_saveCachedContextsToDiskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)insertTokenForUserName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __60__PODaemonCoreConnection_insertTokenForUserName_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertTokenForUserName:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);

  }
}

void __60__PODaemonCoreConnection_insertTokenForUserName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)verifyTokenForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __76__PODaemonCoreConnection_verifyTokenForUserName_passwordContext_completion___block_invoke;
    v15[3] = &unk_251500520;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "verifyTokenForUserName:passwordContext:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __76__PODaemonCoreConnection_verifyTokenForUserName_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)useVolume:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PODaemonCoreConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__PODaemonCoreConnection_useVolume_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "useVolume:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __47__PODaemonCoreConnection_useVolume_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (BOOL)_connectToService
{
  PODaemonCoreConnection *v2;
  NSObject *v3;
  uint64_t v4;
  NSXPCConnection *xpcConnection;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSString *volume;
  BOOL v18;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_xpcConnection)
  {
    PO_LOG_PODaemonCoreConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreConnection _connectToService].cold.3();

LABEL_11:
    v18 = 1;
    goto LABEL_12;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.PlatformSSO.daemon-xpc"), 4096);
  xpcConnection = v2->_xpcConnection;
  v2->_xpcConnection = (NSXPCConnection *)v4;

  if (v2->_xpcConnection)
  {
    +[POInternalProtocols interfaceWithInternalProtocol:](POInternalProtocols, "interfaceWithInternalProtocol:", &unk_257369C60);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_userLoginStateForIdentifier_completion_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateLoginStateForIdentifier_state_loginDate_loginType_completion_, 1, 0);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateLoginStateForIdentifier_state_loginDate_loginType_completion_, 3, 0);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateLoginStateForIdentifier_state_loginDate_loginType_completion_, 2, 0);

    objc_initWeak(&location, v2);
    v11 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __43__PODaemonCoreConnection__connectToService__block_invoke;
    v24[3] = &unk_251500548;
    objc_copyWeak(&v25, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", v24);
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __43__PODaemonCoreConnection__connectToService__block_invoke_86;
    v22[3] = &unk_251500548;
    objc_copyWeak(&v23, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", v22);
    v12 = v2->_xpcConnection;
    +[PODaemonCoreConnection xpcQueue](PODaemonCoreConnection, "xpcQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v12, "_setQueue:", v13);

    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    PO_LOG_PODaemonCoreConnection();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreConnection _connectToService].cold.2();

    if (v2->_volume)
    {
      -[PODaemonCoreConnection xpcConnection](v2, "xpcConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_89);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      volume = v2->_volume;
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = __43__PODaemonCoreConnection__connectToService__block_invoke_90;
      v21[3] = &unk_2515005B0;
      v21[4] = v2;
      objc_msgSend(v16, "useVolume:completion:", volume, v21);

    }
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  PO_LOG_PODaemonCoreConnection();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[PODaemonCoreConnection _connectToService].cold.1();

  v18 = 0;
LABEL_12:
  objc_sync_exit(v2);

  return v18;
}

void __43__PODaemonCoreConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PO_LOG_PODaemonCoreConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __43__PODaemonCoreConnection__connectToService__block_invoke_cold_1();

  }
}

void __43__PODaemonCoreConnection__connectToService__block_invoke_86(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(v2, "setXpcConnection:", 0);
    PO_LOG_PODaemonCoreConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43__PODaemonCoreConnection__connectToService__block_invoke_86_cold_1();

  }
}

void __43__PODaemonCoreConnection__connectToService__block_invoke_88(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  PO_LOG_PODaemonCoreConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

}

void __43__PODaemonCoreConnection__connectToService__block_invoke_90(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  PO_LOG_PODaemonCoreConnection();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_24440D000, v2, OS_LOG_TYPE_INFO, "%{public}@: volume UUID set", (uint8_t *)&v4, 0xCu);
  }

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)volume
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVolume:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)initWithVolume:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24440D000, v0, v1, "XPC error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_connectToService
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_24440D000, v0, v1, "%{public}@: XPC connection already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PODaemonCoreConnection__connectToService__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_24440D000, v0, v1, "%{public}@: XPC connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PODaemonCoreConnection__connectToService__block_invoke_86_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24440D000, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
