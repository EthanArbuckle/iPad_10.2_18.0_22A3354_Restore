@implementation POServiceConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken != -1)
    dispatch_once(&xpcQueue_onceToken, &__block_literal_global_2);
  return (id)xpcQueue_queue;
}

void __31__POServiceConnection_xpcQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PlatformPSSO.auth-plugin-queue", 0);
  v1 = (void *)xpcQueue_queue;
  xpcQueue_queue = (uint64_t)v0;

}

- (POServiceConnection)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v7;
  POServiceConnection *v8;
  POServiceConnection *v9;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  POServiceConnection *v21;
  uint64_t v22;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POServiceConnection();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v15 = "-[POServiceConnection initWithUid:forLogin:]";
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v20 = 2112;
    v21 = self;
    _os_log_debug_impl(&dword_22307D000, v7, OS_LOG_TYPE_DEBUG, "%s userID = %{public}@, login = %{public}@ on %@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)POServiceConnection;
  v8 = -[POServiceConnection init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_uid = v5;
    v8->_forLogin = v4;
    -[POServiceConnection _connectToService](v8, "_connectToService");
  }
  return v9;
}

- (void)dealloc
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[POServiceConnection dealloc]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_22307D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)getLoginTypeForUser:(id)a3 completion:(id)a4
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
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getLoginTypeForUser:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5 completion:(id)a6
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
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __98__POServiceConnection_performPasswordLogin_passwordContext_updateLocalAccountPassword_completion___block_invoke;
    v17[3] = &unk_24EC02608;
    v14 = v12;
    v18 = v14;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performPasswordLogin:passwordContext:updateLocalAccountPassword:completion:", v10, v11, v7, v14);

  }
  else if (v12)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v12 + 2))(v12, 2, v16);

  }
}

void __98__POServiceConnection_performPasswordLogin_passwordContext_updateLocalAccountPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 2, v3);

}

- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5
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
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __70__POServiceConnection_verifyPasswordLogin_passwordContext_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "verifyPasswordLogin:passwordContext:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v14);

  }
}

void __70__POServiceConnection_verifyPasswordLogin_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 2, v3);

}

- (void)createUserAccount:(id)a3 passwordContext:(id)a4 smartCardContext:(id)a5 tokenId:(id)a6 completion:(id)a7
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
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __93__POServiceConnection_createUserAccount_passwordContext_smartCardContext_tokenId_completion___block_invoke;
    v21[3] = &unk_24EC02608;
    v18 = v16;
    v22 = v18;
    objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createUserAccount:passwordContext:smartCardContext:tokenId:completion:", v12, v13, v14, v15, v18);

  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, void *))v16 + 2))(v16, 2, 0, v20);

  }
}

void __93__POServiceConnection_createUserAccount_passwordContext_smartCardContext_tokenId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v5 + 16))(v5, 2, 0, v3);

}

- (void)saveCredentialForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5
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
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __76__POServiceConnection_saveCredentialForUserName_passwordContext_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveCredentialForUserName:passwordContext:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __76__POServiceConnection_saveCredentialForUserName_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)passwordDidChangeForUsername:(id)a3 passwordContext:(id)a4 completion:(id)a5
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
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __79__POServiceConnection_passwordDidChangeForUsername_passwordContext_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "passwordDidChangeForUsername:passwordContext:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __79__POServiceConnection_passwordDidChangeForUsername_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)screenDidUnlockWithCredentialContext:(id)a3 smartCardContext:(id)a4 biometricContext:(id)a5 tokenId:(id)a6 atLogin:(BOOL)a7 tokenUnlock:(BOOL)a8 completion:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;

  v9 = a8;
  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __133__POServiceConnection_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock_completion___block_invoke;
    v27 = &unk_24EC02608;
    v21 = v19;
    v28 = v21;
    objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", &v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:", v15, v16, v17, v18, v10, v9, v21, v24, v25, v26, v27);

  }
  else if (v19)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v19 + 2))(v19, v23);

  }
}

void __133__POServiceConnection_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)retainContextForUserName:(id)a3 context:(id)a4 completion:(id)a5
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
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __67__POServiceConnection_retainContextForUserName_context_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "retainContextForUserName:context:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v14);

  }
}

void __67__POServiceConnection_retainContextForUserName_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)updateLocalAccountPassword:(id)a3 passwordContextData:(id)a4 completion:(id)a5
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
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __81__POServiceConnection_updateLocalAccountPassword_passwordContextData_completion___block_invoke;
    v15[3] = &unk_24EC02608;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateLocalAccountPassword:passwordContextData:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 3, v14);

  }
}

void __81__POServiceConnection_updateLocalAccountPassword_passwordContextData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 3, v3);

}

- (void)configurationDidChangeAndRemovedExtension:(id)a3 removed:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (-[POServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceConnection xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __84__POServiceConnection_configurationDidChangeAndRemovedExtension_removed_completion___block_invoke;
    v14[3] = &unk_24EC02608;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationDidChangeAndRemovedExtension:removed:completion:", v8, v6, v11);

  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);

  }
}

void __84__POServiceConnection_configurationDidChangeAndRemovedExtension_removed_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceConnection();
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
  id v4;
  const __CFString *v5;
  NSXPCConnection *v6;
  NSXPCConnection *xpcConnection;
  void *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  void *v11;
  NSObject *v12;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  if (self->_xpcConnection)
  {
    PO_LOG_POServiceConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[POServiceConnection _connectToService].cold.3();

    return 1;
  }
  v4 = objc_alloc(MEMORY[0x24BDD1988]);
  if (self->_forLogin)
    v5 = CFSTR("com.apple.PlatformSSO.login.service-xpc");
  else
    v5 = CFSTR("com.apple.PlatformSSO.service-xpc");
  v6 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", v5, 4096);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v6;

  if (self->_xpcConnection)
  {
    if (-[POServiceConnection uid](self, "uid") >= 0x1F5)
      -[NSXPCConnection _setTargetUserIdentifier:](self->_xpcConnection, "_setTargetUserIdentifier:", -[POServiceConnection uid](self, "uid"));
    objc_msgSend(MEMORY[0x24BE72EB8], "interfaceWithInternalProtocol:", &unk_2557890B0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v8);

    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __40__POServiceConnection__connectToService__block_invoke;
    v17[3] = &unk_24EC02630;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v17);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __40__POServiceConnection__connectToService__block_invoke_78;
    v15[3] = &unk_24EC02630;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v15);
    v10 = self->_xpcConnection;
    +[POServiceConnection xpcQueue](POServiceConnection, "xpcQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v10, "_setQueue:", v11);

    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    PO_LOG_POServiceConnection();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[POServiceConnection _connectToService].cold.2();

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    return 1;
  }
  PO_LOG_POServiceConnection();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[POServiceConnection _connectToService].cold.1();

  return 0;
}

void __40__POServiceConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PO_LOG_POServiceConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __40__POServiceConnection__connectToService__block_invoke_cold_1();

  }
}

void __40__POServiceConnection__connectToService__block_invoke_78(uint64_t a1)
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
    PO_LOG_POServiceConnection();
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

- (BOOL)forLogin
{
  return self->_forLogin;
}

- (void)setForLogin:(BOOL)a3
{
  self->_forLogin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22307D000, v0, v1, "XPC error: %{public}@", v2, v3, v4, v5, v6);
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

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_22307D000, v0, v1, "%{public}@: XPC connection already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40__POServiceConnection__connectToService__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_22307D000, v0, v1, "%{public}@: XPC connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40__POServiceConnection__connectToService__block_invoke_78_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22307D000, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
