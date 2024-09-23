@implementation POServiceCoreConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken_0 != -1)
    dispatch_once(&xpcQueue_onceToken_0, &__block_literal_global_15);
  return (id)xpcQueue_queue_0;
}

void __35__POServiceCoreConnection_xpcQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PlatformPSSO.auth-plugin-queue", 0);
  v1 = (void *)xpcQueue_queue_0;
  xpcQueue_queue_0 = (uint64_t)v0;

}

- (POServiceCoreConnection)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v7;
  POServiceCoreConnection *v8;
  POServiceCoreConnection *v9;
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
  POServiceCoreConnection *v21;
  uint64_t v22;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POServiceCoreConnection();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v15 = "-[POServiceCoreConnection initWithUid:forLogin:]";
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v20 = 2112;
    v21 = self;
    _os_log_debug_impl(&dword_24440D000, v7, OS_LOG_TYPE_DEBUG, "%s userID = %{public}@, login = %{public}@ on %@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)POServiceCoreConnection;
  v8 = -[POServiceCoreConnection init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_uid = v5;
    v8->_forLogin = v4;
    -[POServiceCoreConnection _connectToService](v8, "_connectToService");
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
  v3 = "-[POServiceCoreConnection dealloc]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_24440D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
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
  if (-[POServiceCoreConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceCoreConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__POServiceCoreConnection_getLoginTypeForUser_completion___block_invoke;
    v12[3] = &unk_251500520;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getLoginTypeForUser:completion:", v6, v9);

  }
  else if (v7)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __58__POServiceCoreConnection_getLoginTypeForUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

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
  if (-[POServiceCoreConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceCoreConnection xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __102__POServiceCoreConnection_performPasswordLogin_passwordContext_updateLocalAccountPassword_completion___block_invoke;
    v17[3] = &unk_251500520;
    v14 = v12;
    v18 = v14;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performPasswordLogin:passwordContext:updateLocalAccountPassword:completion:", v10, v11, v7, v14);

  }
  else if (v12)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v12 + 2))(v12, 2, v16);

  }
}

void __102__POServiceCoreConnection_performPasswordLogin_passwordContext_updateLocalAccountPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

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
  if (-[POServiceCoreConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceCoreConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __74__POServiceCoreConnection_verifyPasswordLogin_passwordContext_completion___block_invoke;
    v15[3] = &unk_251500520;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "verifyPasswordLogin:passwordContext:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v14);

  }
}

void __74__POServiceCoreConnection_verifyPasswordLogin_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 2, v3);

}

- (void)verifyPasswordUser:(id)a3 passwordContext:(id)a4 completion:(id)a5
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
  if (-[POServiceCoreConnection _connectToService](self, "_connectToService"))
  {
    -[POServiceCoreConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __73__POServiceCoreConnection_verifyPasswordUser_passwordContext_completion___block_invoke;
    v15[3] = &unk_251500520;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "verifyPasswordUser:passwordContext:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    +[POError internalErrorWithMessage:](POError, "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v14);

  }
}

void __73__POServiceCoreConnection_verifyPasswordUser_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POServiceCoreConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v5 + 16))(v5, 2, 0, 0, 0, 0, v3);

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
    PO_LOG_POServiceCoreConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreConnection _connectToService].cold.3();

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
    if (-[POServiceCoreConnection uid](self, "uid") >= 0x1F5)
      -[NSXPCConnection _setTargetUserIdentifier:](self->_xpcConnection, "_setTargetUserIdentifier:", -[POServiceCoreConnection uid](self, "uid"));
    +[POInternalProtocols interfaceWithInternalProtocol:](POInternalProtocols, "interfaceWithInternalProtocol:", &unk_25736E050);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v8);

    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __44__POServiceCoreConnection__connectToService__block_invoke;
    v17[3] = &unk_251500548;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v17);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __44__POServiceCoreConnection__connectToService__block_invoke_62;
    v15[3] = &unk_251500548;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v15);
    v10 = self->_xpcConnection;
    +[POServiceCoreConnection xpcQueue](POServiceCoreConnection, "xpcQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v10, "_setQueue:", v11);

    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    PO_LOG_POServiceCoreConnection();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreConnection _connectToService].cold.2();

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    return 1;
  }
  PO_LOG_POServiceCoreConnection();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[PODaemonCoreConnection _connectToService].cold.1();

  return 0;
}

void __44__POServiceCoreConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PO_LOG_POServiceCoreConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __43__PODaemonCoreConnection__connectToService__block_invoke_cold_1();

  }
}

void __44__POServiceCoreConnection__connectToService__block_invoke_62(uint64_t a1)
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
    PO_LOG_POServiceCoreConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43__PODaemonCoreConnection__connectToService__block_invoke_86_cold_1();

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

@end
