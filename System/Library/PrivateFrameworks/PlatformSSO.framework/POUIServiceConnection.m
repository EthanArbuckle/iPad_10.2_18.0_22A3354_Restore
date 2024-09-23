@implementation POUIServiceConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken_2 != -1)
    dispatch_once(&xpcQueue_onceToken_2, &__block_literal_global_9);
  return (id)xpcQueue_queue_2;
}

void __33__POUIServiceConnection_xpcQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PlatformPSSO.ui-settings-queue", 0);
  v1 = (void *)xpcQueue_queue_2;
  xpcQueue_queue_2 = (uint64_t)v0;

}

- (POUIServiceConnection)init
{
  NSObject *v3;
  POUIServiceConnection *v4;
  POUIServiceConnection *v5;
  objc_super v7;

  PO_LOG_POUIServiceConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POUIServiceConnection init].cold.1();

  v7.receiver = self;
  v7.super_class = (Class)POUIServiceConnection;
  v4 = -[POUIServiceConnection init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[POUIServiceConnection _connectToService](v4, "_connectToService");
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

- (void)deviceStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[POUIServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POUIServiceConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__POUIServiceConnection_deviceStatusWithCompletion___block_invoke;
    v9[3] = &unk_24EC02608;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceStatusWithCompletion:", v6);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __52__POUIServiceConnection_deviceStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POUIServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)statusForUser:(id)a3 completion:(id)a4
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
  if (-[POUIServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POUIServiceConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__POUIServiceConnection_statusForUser_completion___block_invoke;
    v12[3] = &unk_24EC02608;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusForUser:completion:", v6, v9);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __50__POUIServiceConnection_statusForUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POUIServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)startAction:(int64_t)a3 forUserName:(id)a4 completion:(id)a5
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
  if (-[POUIServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POUIServiceConnection xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60__POUIServiceConnection_startAction_forUserName_completion___block_invoke;
    v14[3] = &unk_24EC02608;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startAction:forUserName:completion:", a3, v8, v11);

  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);

  }
}

void __60__POUIServiceConnection_startAction_forUserName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POUIServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)startDeviceAction:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  if (-[POUIServiceConnection _connectToService](self, "_connectToService"))
  {
    -[POUIServiceConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__POUIServiceConnection_startDeviceAction_completion___block_invoke;
    v11[3] = &unk_24EC02608;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDeviceAction:completion:", a3, v8);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to connect to PSSO service"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

  }
}

void __54__POUIServiceConnection_startDeviceAction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  PO_LOG_POUIServiceConnection();
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
    PO_LOG_POUIServiceConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[POServiceConnection _connectToService].cold.3();

    return 1;
  }
  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.PlatformSSO.settings.service-xpc"), 4096);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  if (self->_xpcConnection)
  {
    if (-[POUIServiceConnection uid](self, "uid"))
      -[NSXPCConnection _setTargetUserIdentifier:](self->_xpcConnection, "_setTargetUserIdentifier:", -[POUIServiceConnection uid](self, "uid"));
    objc_msgSend(MEMORY[0x24BE72EB8], "interfaceWithInternalProtocol:", &unk_255790070);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __42__POUIServiceConnection__connectToService__block_invoke;
    v15[3] = &unk_24EC02630;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v15);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __42__POUIServiceConnection__connectToService__block_invoke_63;
    v13[3] = &unk_24EC02630;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v13);
    v8 = self->_xpcConnection;
    +[POUIServiceConnection xpcQueue](POUIServiceConnection, "xpcQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v8, "_setQueue:", v9);

    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    PO_LOG_POUIServiceConnection();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[POServiceConnection _connectToService].cold.2();

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    return 1;
  }
  PO_LOG_POUIServiceConnection();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[POServiceConnection _connectToService].cold.1();

  return 0;
}

void __42__POUIServiceConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PO_LOG_POUIServiceConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __40__POServiceConnection__connectToService__block_invoke_cold_1();

  }
}

void __42__POUIServiceConnection__connectToService__block_invoke_63(uint64_t a1)
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
    PO_LOG_POUIServiceConnection();
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
