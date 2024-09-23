@implementation POServiceLoginManagerConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken_0 != -1)
    dispatch_once(&xpcQueue_onceToken_0, &__block_literal_global_5);
  return (id)xpcQueue_queue_0;
}

void __43__POServiceLoginManagerConnection_xpcQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PlatformPSSO.login-manager-queue", 0);
  v1 = (void *)xpcQueue_queue_0;
  xpcQueue_queue_0 = (uint64_t)v0;

}

- (POServiceLoginManagerConnection)initWithUid:(unsigned int)a3
{
  NSObject *v5;
  POServiceLoginManagerConnection *v6;
  POServiceLoginManagerConnection *v7;
  objc_super v9;

  PO_LOG_POServiceLoginManagerConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POServiceLoginManagerConnection initWithUid:].cold.1((uint64_t)self, a3, v5);

  v9.receiver = self;
  v9.super_class = (Class)POServiceLoginManagerConnection;
  v6 = -[POServiceLoginManagerConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_uid = a3;
    -[POServiceLoginManagerConnection _connectToService](v6, "_connectToService");
  }
  return v7;
}

- (POServiceLoginManagerConnection)init
{
  return -[POServiceLoginManagerConnection initWithUid:](self, "initWithUid:", 0xFFFFFFFFLL);
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

- (void)invalidate
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

- (void)isDeviceRegisteredWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__POServiceLoginManagerConnection_isDeviceRegisteredWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isDeviceRegisteredWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __68__POServiceLoginManagerConnection_isDeviceRegisteredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)isUserRegisteredWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__POServiceLoginManagerConnection_isUserRegisteredWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isUserRegisteredWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __66__POServiceLoginManagerConnection_isUserRegisteredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)registrationTokenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __67__POServiceLoginManagerConnection_registrationTokenWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registrationTokenWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __67__POServiceLoginManagerConnection_registrationTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setRegistrationToken:(id)a3 completion:(id)a4
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
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__POServiceLoginManagerConnection_setRegistrationToken_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRegistrationToken:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __67__POServiceLoginManagerConnection_setRegistrationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)ssoTokensWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__POServiceLoginManagerConnection_ssoTokensWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ssoTokensWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __59__POServiceLoginManagerConnection_ssoTokensWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setSsoTokens:(id)a3 completion:(id)a4
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
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__POServiceLoginManagerConnection_setSsoTokens_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSsoTokens:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __59__POServiceLoginManagerConnection_setSsoTokens_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)loginConfigurationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__POServiceLoginManagerConnection_loginConfigurationWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loginConfigurationWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __68__POServiceLoginManagerConnection_loginConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setLoginConfiguration:(id)a3 completion:(id)a4
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
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__POServiceLoginManagerConnection_setLoginConfiguration_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLoginConfiguration:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __68__POServiceLoginManagerConnection_setLoginConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setCertificateData:(id)a3 keyType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a5;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__POServiceLoginManagerConnection_setCertificateData_keyType_completion___block_invoke;
    v14[3] = &unk_24EC02608;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCertificateData:keyType:completion:", v8, a4, v11);

  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);

  }
}

void __73__POServiceLoginManagerConnection_setCertificateData_keyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)secKeyProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __76__POServiceLoginManagerConnection_secKeyProxyEndpointForKeyType_completion___block_invoke;
    v11[3] = &unk_24EC02608;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secKeyProxyEndpointForKeyType:completion:", a3, v8);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

  }
}

void __76__POServiceLoginManagerConnection_secKeyProxyEndpointForKeyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)secIdentityProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __81__POServiceLoginManagerConnection_secIdentityProxyEndpointForKeyType_completion___block_invoke;
    v11[3] = &unk_24EC02608;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secIdentityProxyEndpointForKeyType:completion:", a3, v8);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

  }
}

void __81__POServiceLoginManagerConnection_secIdentityProxyEndpointForKeyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)attestKey:(int64_t)a3 clientDataHash:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a4;
  v9 = a5;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __71__POServiceLoginManagerConnection_attestKey_clientDataHash_completion___block_invoke;
    v14[3] = &unk_24EC02608;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attestKey:clientDataHash:completion:", a3, v8, v11);

  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);

  }
}

void __71__POServiceLoginManagerConnection_attestKey_clientDataHash_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)copyDeviceAttestationCertificateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__POServiceLoginManagerConnection_copyDeviceAttestationCertificateWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "copyDeviceAttestationCertificateWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __82__POServiceLoginManagerConnection_copyDeviceAttestationCertificateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)userNeedsReauthenticationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __75__POServiceLoginManagerConnection_userNeedsReauthenticationWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userNeedsReauthenticationWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __75__POServiceLoginManagerConnection_userNeedsReauthenticationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)deviceRegistrationsNeedsRepairWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __80__POServiceLoginManagerConnection_deviceRegistrationsNeedsRepairWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceRegistrationsNeedsRepairWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __80__POServiceLoginManagerConnection_deviceRegistrationsNeedsRepairWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)userRegistrationsNeedsRepairWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __78__POServiceLoginManagerConnection_userRegistrationsNeedsRepairWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userRegistrationsNeedsRepairWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __78__POServiceLoginManagerConnection_userRegistrationsNeedsRepairWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)presentRegistrationViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __83__POServiceLoginManagerConnection_presentRegistrationViewControllerWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentRegistrationViewControllerWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __83__POServiceLoginManagerConnection_presentRegistrationViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)resetDeviceKeysWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__POServiceLoginManagerConnection_resetDeviceKeysWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resetDeviceKeysWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __65__POServiceLoginManagerConnection_resetDeviceKeysWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)resetUserSecureEnclaveKeyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __75__POServiceLoginManagerConnection_resetUserSecureEnclaveKeyWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resetUserSecureEnclaveKeyWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __75__POServiceLoginManagerConnection_resetUserSecureEnclaveKeyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)loginUserNameWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__POServiceLoginManagerConnection_loginUserNameWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loginUserNameWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __63__POServiceLoginManagerConnection_loginUserNameWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setLoginUserName:(id)a3 completion:(id)a4
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
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__POServiceLoginManagerConnection_setLoginUserName_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLoginUserName:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __63__POServiceLoginManagerConnection_setLoginUserName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)userLoginConfigurationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __72__POServiceLoginManagerConnection_userLoginConfigurationWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userLoginConfigurationWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __72__POServiceLoginManagerConnection_userLoginConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setUserLoginConfiguration:(id)a3 completion:(id)a4
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
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __72__POServiceLoginManagerConnection_setUserLoginConfiguration_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserLoginConfiguration:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __72__POServiceLoginManagerConnection_setUserLoginConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)rotateKeyForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __66__POServiceLoginManagerConnection_rotateKeyForKeyType_completion___block_invoke;
    v11[3] = &unk_24EC02608;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rotateKeyForKeyType:completion:", a3, v8);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

  }
}

void __66__POServiceLoginManagerConnection_rotateKeyForKeyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)completeRotationKeyForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  if (-[POServiceLoginManagerConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceLoginManagerConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __76__POServiceLoginManagerConnection_completeRotationKeyForKeyType_completion___block_invoke;
    v11[3] = &unk_24EC02608;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "completeRotationKeyForKeyType:completion:", a3, v8);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

  }
}

void __76__POServiceLoginManagerConnection_completeRotationKeyForKeyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceLoginManagerConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (BOOL)_connectToService
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *xpcConnection;
  void *v6;
  uint64_t v7;
  NSXPCConnection *v8;
  void *v9;
  NSObject *v10;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (self->_xpcConnection)
  {
    PO_LOG_POServiceLoginManagerConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[POServiceConnection _connectToService].cold.3();

    return 1;
  }
  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.PlatformSSO.service-login-manager-xpc"), 4096);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  if (self->_xpcConnection)
  {
    if (-[POServiceLoginManagerConnection uid](self, "uid"))
      -[NSXPCConnection _setTargetUserIdentifier:](self->_xpcConnection, "_setTargetUserIdentifier:", -[POServiceLoginManagerConnection uid](self, "uid"));
    objc_msgSend(MEMORY[0x24BE72EB8], "interfaceWithInternalProtocol:", &unk_25578A2F0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__POServiceLoginManagerConnection__connectToService__block_invoke;
    v15[3] = &unk_24EC02630;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v15);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __52__POServiceLoginManagerConnection__connectToService__block_invoke_95;
    v13[3] = &unk_24EC02630;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v13);
    v8 = self->_xpcConnection;
    +[POServiceLoginManagerConnection xpcQueue](POServiceLoginManagerConnection, "xpcQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v8, "_setQueue:", v9);

    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    PO_LOG_POServiceLoginManagerConnection();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[POServiceConnection _connectToService].cold.2();

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    return 1;
  }
  PO_LOG_POServiceLoginManagerConnection();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[POServiceConnection _connectToService].cold.1();

  return 0;
}

void __52__POServiceLoginManagerConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PO_LOG_POServiceLoginManagerConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __40__POServiceConnection__connectToService__block_invoke_cold_1();

  }
}

void __52__POServiceLoginManagerConnection__connectToService__block_invoke_95(uint64_t a1)
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
    PO_LOG_POServiceLoginManagerConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __40__POServiceConnection__connectToService__block_invoke_78_cold_1();

  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)initWithUid:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[POServiceLoginManagerConnection initWithUid:]";
  v5 = 1026;
  v6 = a2;
  v7 = 2112;
  v8 = a1;
  _os_log_debug_impl(&dword_22307D000, log, OS_LOG_TYPE_DEBUG, "%s uid = %{public}d on %@", (uint8_t *)&v3, 0x1Cu);
}

@end
