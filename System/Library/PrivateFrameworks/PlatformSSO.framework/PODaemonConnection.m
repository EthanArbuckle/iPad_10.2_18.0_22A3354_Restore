@implementation PODaemonConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken_1 != -1)
    dispatch_once(&xpcQueue_onceToken_1, &__block_literal_global_6);
  return (id)xpcQueue_queue_1;
}

void __30__PODaemonConnection_xpcQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PlatformPSSO.daemon-queue", 0);
  v1 = (void *)xpcQueue_queue_1;
  xpcQueue_queue_1 = (uint64_t)v0;

}

- (PODaemonConnection)init
{
  NSObject *v3;
  PODaemonConnection *v4;
  PODaemonConnection *v5;
  objc_super v7;

  PO_LOG_PODaemonConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PODaemonConnection init].cold.1();

  v7.receiver = self;
  v7.super_class = (Class)PODaemonConnection;
  v4 = -[PODaemonConnection init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[PODaemonConnection _connectToService](v4, "_connectToService");
  return v5;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __65__PODaemonConnection_deviceConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceConfigurationForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __65__PODaemonConnection_deviceConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__PODaemonConnection_loginConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loginConfigurationForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __64__PODaemonConnection_loginConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)removeDeviceConfigurationForIdentifer:(id)a3 completion:(id)a4
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__PODaemonConnection_removeDeviceConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeDeviceConfigurationForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __71__PODaemonConnection_removeDeviceConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)removeLoginConfigurationForIdentifer:(id)a3 completion:(id)a4
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __70__PODaemonConnection_removeLoginConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeLoginConfigurationForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __70__PODaemonConnection_removeLoginConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)removeUserConfigurationForIdentifier:(id)a3 completion:(id)a4
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __70__PODaemonConnection_removeUserConfigurationForIdentifier_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeUserConfigurationForIdentifier:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __70__PODaemonConnection_removeUserConfigurationForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)saveDeviceConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __67__PODaemonConnection_saveDeviceConfiguration_identifer_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveDeviceConfiguration:identifer:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __67__PODaemonConnection_saveDeviceConfiguration_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)saveLoginConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __66__PODaemonConnection_saveLoginConfiguration_identifer_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveLoginConfiguration:identifer:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __66__PODaemonConnection_saveLoginConfiguration_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)saveUserConfiguration:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __83__PODaemonConnection_saveUserConfiguration_forIdentifier_syncToPreboot_completion___block_invoke;
    v17[3] = &unk_24EC02608;
    v14 = v12;
    v18 = v14;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "saveUserConfiguration:forIdentifier:syncToPreboot:completion:", v10, v11, v7, v14);

  }
  else if (v12)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v16);

  }
}

void __83__PODaemonConnection_saveUserConfiguration_forIdentifier_syncToPreboot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)saveUserConfigurationData:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __87__PODaemonConnection_saveUserConfigurationData_forIdentifier_syncToPreboot_completion___block_invoke;
    v17[3] = &unk_24EC02608;
    v14 = v12;
    v18 = v14;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "saveUserConfigurationData:forIdentifier:syncToPreboot:completion:", v10, v11, v7, v14);

  }
  else if (v12)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v16);

  }
}

void __87__PODaemonConnection_saveUserConfigurationData_forIdentifier_syncToPreboot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__PODaemonConnection_userConfigurationForIdentifier_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userConfigurationForIdentifier:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __64__PODaemonConnection_userConfigurationForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61__PODaemonConnection_userLoginStateForIdentifier_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userLoginStateForIdentifier:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __61__PODaemonConnection_userLoginStateForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __89__PODaemonConnection_updateLoginStateForIdentifier_state_loginDate_loginType_completion___block_invoke;
    v21[3] = &unk_24EC02608;
    v18 = v16;
    v22 = v18;
    objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateLoginStateForIdentifier:state:loginDate:loginType:completion:", v12, v13, v14, v15, v18);

  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v20);

  }
}

void __89__PODaemonConnection_updateLoginStateForIdentifier_state_loginDate_loginType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __64__PODaemonConnection_savePendingSSOTokens_identifer_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "savePendingSSOTokens:identifer:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __64__PODaemonConnection_savePendingSSOTokens_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__PODaemonConnection_retrievePendingSSOTokenForIdentifer_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "retrievePendingSSOTokenForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __69__PODaemonConnection_retrievePendingSSOTokenForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __64__PODaemonConnection_saveStashedSSOTokens_identifer_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveStashedSSOTokens:identifer:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __64__PODaemonConnection_saveStashedSSOTokens_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__PODaemonConnection_retrieveStashedSSOTokenForIdentifer_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "retrieveStashedSSOTokenForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __69__PODaemonConnection_retrieveStashedSSOTokenForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __78__PODaemonConnection_retrieveStashedDecryptionContextForIdentifer_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "retrieveStashedDecryptionContextForIdentifer:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __78__PODaemonConnection_retrieveStashedDecryptionContextForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __43__PODaemonConnection_useVolume_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "useVolume:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __43__PODaemonConnection_useVolume_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__PODaemonConnection_saveCachedContextsToDiskWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveCachedContextsToDiskWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __61__PODaemonConnection_saveCachedContextsToDiskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)resetStoredConfigurationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__PODaemonConnection_resetStoredConfigurationWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resetStoredConfigurationWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __61__PODaemonConnection_resetStoredConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)disablePlatformSSORules:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__PODaemonConnection_disablePlatformSSORules___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disablePlatformSSORules:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __46__PODaemonConnection_disablePlatformSSORules___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)enablePlatformSSORules:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__PODaemonConnection_enablePlatformSSORules___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enablePlatformSSORules:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __45__PODaemonConnection_enablePlatformSSORules___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)migrateConfiguration:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__PODaemonConnection_migrateConfiguration_completion___block_invoke;
    v11[3] = &unk_24EC02608;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "migrateConfiguration:completion:", v4, v8);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

  }
}

void __54__PODaemonConnection_migrateConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)savePlatformSSOUniqueIdentifier:(id)a3 forUser:(id)a4 completion:(id)a5
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __73__PODaemonConnection_savePlatformSSOUniqueIdentifier_forUser_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "savePlatformSSOUniqueIdentifier:forUser:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __73__PODaemonConnection_savePlatformSSOUniqueIdentifier_forUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)bindTokenForUsername:(id)a3 hash:(id)a4 wrapHash:(id)a5 tokenId:(id)a6 passwordContext:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __92__PODaemonConnection_bindTokenForUsername_hash_wrapHash_tokenId_passwordContext_completion___block_invoke;
    v24[3] = &unk_24EC02608;
    v21 = v19;
    v25 = v21;
    objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bindTokenForUsername:hash:wrapHash:tokenId:passwordContext:completion:", v14, v15, v16, v17, v18, v21);

  }
  else if (v19)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v23);

  }
}

void __92__PODaemonConnection_bindTokenForUsername_hash_wrapHash_tokenId_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)unbindTokenForUsername:(id)a3 hash:(id)a4 completion:(id)a5
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61__PODaemonConnection_unbindTokenForUsername_hash_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unbindTokenForUsername:hash:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __61__PODaemonConnection_unbindTokenForUsername_hash_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)unbindTokenForAllUsersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__PODaemonConnection_unbindTokenForAllUsersWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unbindTokenForAllUsersWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __59__PODaemonConnection_unbindTokenForAllUsersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)createUser:(id)a3 passwordContext:(id)a4 name:(id)a5 loginUserName:(id)a6 idpIdentifier:(id)a7 isAdmin:(BOOL)a8 groupMembership:(id)a9 completion:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _BOOL8 v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;

  v10 = a8;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __117__PODaemonConnection_createUser_passwordContext_name_loginUserName_idpIdentifier_isAdmin_groupMembership_completion___block_invoke;
    v28[3] = &unk_24EC02608;
    v23 = v10;
    v24 = v22;
    v29 = v24;
    objc_msgSend(v27, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "createUser:passwordContext:name:loginUserName:idpIdentifier:isAdmin:groupMembership:completion:", v16, v17, v18, v19, v20, v23, v21, v24);

  }
  else if (v22)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v26);

  }
}

void __117__PODaemonConnection_createUser_passwordContext_name_loginUserName_idpIdentifier_isAdmin_groupMembership_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

- (void)changePasswordForUser:(id)a3 passwordContext:(id)a4 secureToken:(id)a5 secureTokenPasswordContext:(id)a6 completion:(id)a7
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __110__PODaemonConnection_changePasswordForUser_passwordContext_secureToken_secureTokenPasswordContext_completion___block_invoke;
    v21[3] = &unk_24EC02608;
    v18 = v16;
    v22 = v18;
    objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "changePasswordForUser:passwordContext:secureToken:secureTokenPasswordContext:completion:", v12, v13, v14, v15, v18);

  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v20);

  }
}

void __110__PODaemonConnection_changePasswordForUser_passwordContext_secureToken_secureTokenPasswordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)changePasswordUsingBootstrapTokenForUser:(id)a3 passwordContext:(id)a4 completion:(id)a5
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __90__PODaemonConnection_changePasswordUsingBootstrapTokenForUser_passwordContext_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "changePasswordUsingBootstrapTokenForUser:passwordContext:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __90__PODaemonConnection_changePasswordUsingBootstrapTokenForUser_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)createPlatformSSOAdminGroupWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __64__PODaemonConnection_createPlatformSSOAdminGroupWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createPlatformSSOAdminGroupWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __64__PODaemonConnection_createPlatformSSOAdminGroupWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)removePlatformSSOAdminGroupWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __64__PODaemonConnection_removePlatformSSOAdminGroupWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removePlatformSSOAdminGroupWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __64__PODaemonConnection_removePlatformSSOAdminGroupWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)addPlatformSSOToSearchPolicyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__PODaemonConnection_addPlatformSSOToSearchPolicyWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addPlatformSSOToSearchPolicyWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __65__PODaemonConnection_addPlatformSSOToSearchPolicyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)removePlatformSSOFromSearchPolicyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70__PODaemonConnection_removePlatformSSOFromSearchPolicyWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removePlatformSSOFromSearchPolicyWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __70__PODaemonConnection_removePlatformSSOFromSearchPolicyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)createOrUpdateAdminGroups:(id)a3 authorizationGroups:(id)a4 previousAuthorizationGroups:(id)a5 otherGroups:(id)a6 completion:(id)a7
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __119__PODaemonConnection_createOrUpdateAdminGroups_authorizationGroups_previousAuthorizationGroups_otherGroups_completion___block_invoke;
    v21[3] = &unk_24EC02608;
    v18 = v16;
    v22 = v18;
    objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createOrUpdateAdminGroups:authorizationGroups:previousAuthorizationGroups:otherGroups:completion:", v12, v13, v14, v15, v18);

  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v20);

  }
}

void __119__PODaemonConnection_createOrUpdateAdminGroups_authorizationGroups_previousAuthorizationGroups_otherGroups_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)removePlatformSSOUser:(id)a3 completion:(id)a4
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__PODaemonConnection_removePlatformSSOUser_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removePlatformSSOUser:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __55__PODaemonConnection_removePlatformSSOUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setGroups:(id)a3 forLocalUser:(id)a4 completion:(id)a5
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __56__PODaemonConnection_setGroups_forLocalUser_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGroups:forLocalUser:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __56__PODaemonConnection_setGroups_forLocalUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setGroups:(id)a3 forPlatformSSOUser:(id)a4 completion:(id)a5
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __62__PODaemonConnection_setGroups_forPlatformSSOUser_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGroups:forPlatformSSOUser:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __62__PODaemonConnection_setGroups_forPlatformSSOUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)getAllUsersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__PODaemonConnection_getAllUsersWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getAllUsersWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __48__PODaemonConnection_getAllUsersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)findUserWithName:(id)a3 completion:(id)a4
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__PODaemonConnection_findUserWithName_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "findUserWithName:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __50__PODaemonConnection_findUserWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)createOrUpdateUser:(id)a3 completion:(id)a4
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__PODaemonConnection_createOrUpdateUser_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createOrUpdateUser:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __52__PODaemonConnection_createOrUpdateUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)removeUserWithName:(id)a3 completion:(id)a4
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__PODaemonConnection_removeUserWithName_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeUserWithName:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __52__PODaemonConnection_removeUserWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)addLocalUser:(id)a3 toLocalGroup:(id)a4 completion:(id)a5
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __59__PODaemonConnection_addLocalUser_toLocalGroup_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addLocalUser:toLocalGroup:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __59__PODaemonConnection_addLocalUser_toLocalGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)removeLocalUser:(id)a3 fromLocalGroup:(id)a4 completion:(id)a5
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __64__PODaemonConnection_removeLocalUser_fromLocalGroup_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeLocalUser:fromLocalGroup:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __64__PODaemonConnection_removeLocalUser_fromLocalGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)saveAppSSOConfiguration:(id)a3 completion:(id)a4
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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__PODaemonConnection_saveAppSSOConfiguration_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveAppSSOConfiguration:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __57__PODaemonConnection_saveAppSSOConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

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
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __72__PODaemonConnection_saveStashedDecryptionContext_identifer_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveStashedDecryptionContext:identifer:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __72__PODaemonConnection_saveStashedDecryptionContext_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)createAppSSOCachePathWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[PODaemonConnection _connectToService](self, "_connectToService"))
  {
    -[PODaemonConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __58__PODaemonConnection_createAppSSOCachePathWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createAppSSOCachePathWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __58__PODaemonConnection_createAppSSOCachePathWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_PODaemonConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (BOOL)_connectToService
{
  PODaemonConnection *v2;
  NSObject *v3;
  uint64_t v4;
  NSXPCConnection *xpcConnection;
  void *v6;
  uint64_t v7;
  NSXPCConnection *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_xpcConnection)
  {
    PO_LOG_PODaemonConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[POServiceConnection _connectToService].cold.3();

LABEL_9:
    v11 = 1;
    goto LABEL_10;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.PlatformSSO.daemon-xpc"), 4096);
  xpcConnection = v2->_xpcConnection;
  v2->_xpcConnection = (NSXPCConnection *)v4;

  if (v2->_xpcConnection)
  {
    objc_msgSend(MEMORY[0x24BE72EB8], "interfaceWithInternalProtocol:", &unk_25578EF58);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __39__PODaemonConnection__connectToService__block_invoke;
    v16[3] = &unk_24EC02630;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", v16);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __39__PODaemonConnection__connectToService__block_invoke_95;
    v14[3] = &unk_24EC02630;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", v14);
    v8 = v2->_xpcConnection;
    +[PODaemonConnection xpcQueue](PODaemonConnection, "xpcQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v8, "_setQueue:", v9);

    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    PO_LOG_PODaemonConnection();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[POServiceConnection _connectToService].cold.2();

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  PO_LOG_PODaemonConnection();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[POServiceConnection _connectToService].cold.1();

  v11 = 0;
LABEL_10:
  objc_sync_exit(v2);

  return v11;
}

void __39__PODaemonConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PO_LOG_PODaemonConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __40__POServiceConnection__connectToService__block_invoke_cold_1();

  }
}

void __39__PODaemonConnection__connectToService__block_invoke_95(uint64_t a1)
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
    PO_LOG_PODaemonConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __40__POServiceConnection__connectToService__block_invoke_78_cold_1();

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
