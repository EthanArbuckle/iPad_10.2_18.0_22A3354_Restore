@implementation SADaemonXPC

- (SADaemonXPC)init
{
  SADaemonXPC *v2;
  uint64_t v3;
  NSXPCInterface *remoteInterface;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSXPCConnection *xpcConnection;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SADaemonXPC;
  v2 = -[SADaemonXPC init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2576CB590);
    v3 = objc_claimAutoreleasedReturnValue();
    remoteInterface = v2->remoteInterface;
    v2->remoteInterface = (NSXPCInterface *)v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2576C97E8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v2->remoteInterface, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_addAppSizerHandler_reply_, 0, 0);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v2->remoteInterface, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_addURLSizerHandler_withURLs_reply_, 0, 0);
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v2->remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_addURLSizerHandler_withURLs_reply_, 1, 0);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.spaceattributiond"), 0);
    xpcConnection = v2->xpcConnection;
    v2->xpcConnection = (NSXPCConnection *)v9;

    -[NSXPCConnection setRemoteObjectInterface:](v2->xpcConnection, "setRemoteObjectInterface:", v2->remoteInterface);
    -[NSXPCConnection resume](v2->xpcConnection, "resume");

  }
  return v2;
}

- (SADaemonXPC)initWithInvalidationHandler:(id)a3
{
  id v4;
  SADaemonXPC *v5;
  SADaemonXPC *v6;

  v4 = a3;
  v5 = -[SADaemonXPC init](self, "init");
  v6 = v5;
  if (v5)
    -[SADaemonXPC setInvalidationHandler:](v5, "setInvalidationHandler:", v4);

  return v6;
}

+ (id)newWithInvalidationHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInvalidationHandler:", v4);

  return v5;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *xpcConnection;
  uint64_t v7;
  id v8;
  NSXPCConnection *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    xpcConnection = self->xpcConnection;
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __38__SADaemonXPC_setInvalidationHandler___block_invoke;
    v12[3] = &unk_2518F3778;
    v8 = v4;
    v13 = v8;
    -[NSXPCConnection setInvalidationHandler:](xpcConnection, "setInvalidationHandler:", v12);
    v9 = self->xpcConnection;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __38__SADaemonXPC_setInvalidationHandler___block_invoke_88;
    v10[3] = &unk_2518F3778;
    v11 = v8;
    -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v10);

  }
}

void __38__SADaemonXPC_setInvalidationHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  SALog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __38__SADaemonXPC_setInvalidationHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4099, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __38__SADaemonXPC_setInvalidationHandler___block_invoke_88(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  SALog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __38__SADaemonXPC_setInvalidationHandler___block_invoke_88_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4099, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)invalidate
{
  OUTLINED_FUNCTION_0_2(&dword_2478E3000, a1, a3, "%s: start", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  xpcConnection = self->xpcConnection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__SADaemonXPC_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_2518F37E0;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __49__SADaemonXPC_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__SADaemonXPC_remoteObjectProxyWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  xpcConnection = self->xpcConnection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__SADaemonXPC_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_2518F37E0;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __60__SADaemonXPC_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__SADaemonXPC_synchronousRemoteObjectProxyWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCInterface)remoteInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRemoteInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->xpcConnection, 0);
  objc_storeStrong((id *)&self->remoteInterface, 0);
}

void __38__SADaemonXPC_setInvalidationHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_2478E3000, a1, a3, "Connection (framework->daemon) Invalidated", a5, a6, a7, a8, 0);
}

void __38__SADaemonXPC_setInvalidationHandler___block_invoke_88_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_2478E3000, a1, a3, "Connection (framework->daemon) Terminated", a5, a6, a7, a8, 0);
}

void __49__SADaemonXPC_remoteObjectProxyWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a2, a3, "remoteObjectProxyWithErrorHandler: failed with %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __60__SADaemonXPC_synchronousRemoteObjectProxyWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a2, a3, "synchronousRemoteObjectProxyWithErrorHandler: failed with %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
